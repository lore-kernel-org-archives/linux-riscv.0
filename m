Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C584DC54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 11:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RMrB7OAZ6O+g9IsdL9GcVRZ/dX0oYfKbKu11UVvzr04=; b=KEzk4vc23xwsiS
	FIoO3VpGhD9/pjhRsk7Wtwu477DgjqQ6fRBj3KIEWvx8+2BDCVPrILq8DBwHaa0gLoofgXTWwlYYu
	nXRWSSXN28YMmTa3uCI0c6AIsOohIQLAAuNolXZ9OjDLgoLDPFNd72oubqXHo3hLV0KKZ+Gq16Zzi
	LniMxiIfg50K0x/Ffd1fkVa52H6vOV1MivvysgMW/BZndAiR/a+VeOh+MWN+JLMU7YeQgjbgl90x0
	DqHaI4ZKBx9S5W1Tu8s75/9JexFFbLXqugjsrfZDk7ALMt2zFpmFblULiyhGBg8PsR5NEEvA7ykib
	Ljc2PKazkY7E2MsLboyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roiQy-0000000H1u3-179X;
	Mon, 25 Mar 2024 11:24:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roiQp-0000000H1rD-1PQp
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 11:24:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A6A8A60F1B;
	Mon, 25 Mar 2024 11:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A096BC43390;
	Mon, 25 Mar 2024 11:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711365838;
	bh=Hcvo8TwKTObsbxJiMa+DCZVgn0Ppw92GI2jy5pNrT8U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jO7CNTxYsgsZN0RpxKG0TpN4fr1dM9M9yxv+ojbrGrYYXRCbxXahb8xuDan7vP8sv
	 WZyGX8W3kdx6Sxf8n/Z4HZurOBXMK+LrW4JFiFNZmBOFzKzLm6Y+42MyT6FMGmF1fk
	 Z4AzEMBU5CArTOI6LXvuNA7YziuXIF6N0YwuTB/vevJAcO9LNJ1TXwdeOvrXoKYkyk
	 mvUEqRJG9njKVzoKQ6AEE2XMd8qCvc3/TwmTk3Ad5CsAAPU13aPUHfPI4yoTpIEagU
	 XjpT785o1D9K11kj7r5hzg5D287Bfzs5kdqvojZ0NEF0zfwweC6jBN/aGINOws2wxp
	 B/O4bxQ5adlbg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [PATCH v3 RESEND 2/2] riscv: cmpxchg: implement arch_cmpxchg64_{relaxed|acquire|release}
Date: Mon, 25 Mar 2024 19:10:38 +0800
Message-ID: <20240325111038.1700-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240325111038.1700-1-jszhang@kernel.org>
References: <20240325111038.1700-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_042359_484915_3C4F026C 
X-CRM114-Status: GOOD (  10.21  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

After selecting ARCH_USE_CMPXCHG_LOCKREF, one straight futher
optimization is implementing the arch_cmpxchg64_relaxed() because the
lockref code does not need the cmpxchg to have barrier semantics. At
the same time, implement arch_cmpxchg64_acquire and
arch_cmpxchg64_release as well.

However, on both TH1520 and JH7110 platforms, I didn't see obvious
performance improvement with Linus' test case [1]. IMHO, this may
be related with the fence and lr.d/sc.d hw implementations. In theory,
lr/sc without fence could give performance improvement over lr/sc plus
fence, so add the code here to leave performance improvement room on
newer HW platforms.

Link: http://marc.info/?l=linux-fsdevel&m=137782380714721&w=4 [1]
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Andrea Parri <parri.andrea@gmail.com>
---
 arch/riscv/include/asm/cmpxchg.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 2fee65cc8443..f1c8271c66f8 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -359,4 +359,22 @@
 	arch_cmpxchg_relaxed((ptr), (o), (n));				\
 })
 
+#define arch_cmpxchg64_relaxed(ptr, o, n)				\
+({									\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
+	arch_cmpxchg_relaxed((ptr), (o), (n));				\
+})
+
+#define arch_cmpxchg64_acquire(ptr, o, n)				\
+({									\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
+	arch_cmpxchg_acquire((ptr), (o), (n));				\
+})
+
+#define arch_cmpxchg64_release(ptr, o, n)				\
+({									\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
+	arch_cmpxchg_release((ptr), (o), (n));				\
+})
+
 #endif /* _ASM_RISCV_CMPXCHG_H */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
