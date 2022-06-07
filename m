Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB90C43334
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 14:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gyuZW2OxNfs2aNrvffpCOPLotvaMrDYjp8YUl/yrBCo=; b=0/E5tratUmYVO6
	fPS/RdRaSEBCziI5dc6W7yGFAP7D2eHzCio52OQ/4hcD7A0I/csDyNvv5wmmqdyreP0IxJbUp/rV0
	VDdSCkNZ0Ww/TOqouo6N4OeLAN/HsmrG+i/i79wrdVRd/+xCbegH3kgVRkod6JDanHV7W5up92qQN
	IMhyTCIt72Ka61jDs2+6TiVbLymaLczMqVB4fqh8r97aBiyuGWA98FOSpyZxrDjwGJAgJKJ1KGAmZ
	e3Qp71Qc/fpRoPrTHHRAHljMgxNSXKuWcwnphNwRcTjhKzlhseg4D1OyiTlEnDT+0ZsankuKATQzJ
	Y+A3h8tC9HEaOkiO1K2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyaF7-0085mX-8k; Tue, 07 Jun 2022 14:31:37 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyaF0-0085iv-E3
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 14:31:31 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1nyaEv-0008Ra-ME; Tue, 07 Jun 2022 16:31:25 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wefu@redhat.com,
	guoren@kernel.org,
	mick@ics.forth.gr,
	samuel@sholland.org,
	cmuellner@linux.com,
	philipp.tomsich@vrull.eu,
	hch@lst.de,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 1/2] riscv: introduce nops and __nops macros for NOP sequences
Date: Tue,  7 Jun 2022 16:30:58 +0200
Message-Id: <20220607143059.1054074-2-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607143059.1054074-1-heiko@sntech.de>
References: <20220607143059.1054074-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_073130_572903_10A9C8A7 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

NOP sequences tend to get used for padding out alternative sections

This change adds macros for generating these sequences as both inline
asm blocks, but also as strings suitable for embedding in other asm
blocks directly.

It essentially mimics similar functionality from arm64 introduced by
Wil Deacon in commit f99a250cb6a3 ("arm64: barriers: introduce nops
and __nops macros for NOP sequences").

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/include/asm/asm.h     | 15 +++++++++++++++
 arch/riscv/include/asm/barrier.h |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index 618d7c5af1a2..1b471ff73178 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -67,4 +67,19 @@
 #error "Unexpected __SIZEOF_SHORT__"
 #endif
 
+#ifdef __ASSEMBLY__
+
+/* Common assembly source macros */
+
+/*
+ * NOP sequence
+ */
+.macro	nops, num
+	.rept	\num
+	nop
+	.endr
+.endm
+
+#endif /* __ASSEMBLY__ */
+
 #endif /* _ASM_RISCV_ASM_H */
diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index d0e24aaa2aa0..110752594228 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -13,6 +13,8 @@
 #ifndef __ASSEMBLY__
 
 #define nop()		__asm__ __volatile__ ("nop")
+#define __nops(n)	".rept	" #n "\nnop\n.endr\n"
+#define nops(n)		__asm__ __volatile__ (__nops(n))
 
 #define RISCV_FENCE(p, s) \
 	__asm__ __volatile__ ("fence " #p "," #s : : : "memory")
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
