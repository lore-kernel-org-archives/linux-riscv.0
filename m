Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3835C61D90
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 16:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=alsFQPy34kTbea+TDhGGipcd2sI4E7fuSazbUv9uUNk=; b=vkXgdchSPNSrWz
	Gyp36zKbDRGrlKBcMfPOfTWUwrMeLCTQmDfUc4ORDcHuHY3oR0LgWOJkWuoqIOVzMrWC26CcWnRWQ
	Six/UJSNhHEUt6OB32OnqqKXiO+Zu28lqK7HZBx1ALdQWds3eqiAC9Nw5hr1A7i3cf8tC/0pQ4fgF
	M4rf2I3vAChWNPstlNA+HO3CkvUD5F8jbfMndPwdzznhqPeVaAOt10wUE1yqE8VsUERkr92dWF+Fj
	Q7TvN+fleZZ/6CHT0+mTidbp6B9cB5M6BgNwolHWmxUcM5yX2Daa7cMV3FCO6z0UL+S4ttUzw2+kF
	N7ABMdPMms6BJKM1AMHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5TSp-00HGLv-0r;
	Tue, 21 Nov 2023 16:19:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5TSn-00HGLL-04
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 16:19:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6E8CD61741;
	Tue, 21 Nov 2023 16:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA4FC433C8;
	Tue, 21 Nov 2023 16:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700583540;
	bh=+NPX7FyBwDK3KyfbI/LU1WpPwCOApvDfHFYotMW+iEQ=;
	h=From:To:Cc:Subject:Date:From;
	b=hwSMC2wphiYqVQTwwY7y4jEPXdini07VezqwCyCKhS31YxQKVmd9qNUlNElupHfWL
	 hSu1OAR8NlVtmKi1Pawxe6gvzMrwlXmMRfiDmrhdyREeY3ByVllyqMVsDDeTvXKXGW
	 r4ZvU71anuIdaRU4IjH1cr3A7cO4oSyEqvkWMgE+NtrY+Xe820ZQzvsxKG8t/Jaa28
	 gAAjpqSeuNfAnLzRF+agtkbFk0DeJCo6Fi2HDOJtz4Sc1hvWRvI1wRmSRTZxbFRCG4
	 DJ5/ZcSsAoHnyFhzEUfHgXPBOdBD+uq547K2rj8ENsoeb3WXTPHVqZ3xcLNGrQXTZn
	 HVkf/EjKwexiA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: mm: implement pgprot_nx
Date: Wed, 22 Nov 2023 00:06:37 +0800
Message-Id: <20231121160637.3856-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_081901_100102_AB9A7C13 
X-CRM114-Status: UNSURE (   6.14  )
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

commit cca98e9f8b5e ("mm: enforce that vmap can't map pages
executable") enforces the W^X protection by not allowing remapping
existing pages as executable. Add riscv bits so that riscv can benefit
the same protection.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/pgtable.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 294044429e8e..4fc6ee5226fb 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -608,6 +608,12 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
 	return ptep_test_and_clear_young(vma, address, ptep);
 }
 
+#define pgprot_nx pgprot_nx
+static inline pgprot_t pgprot_nx(pgprot_t _prot)
+{
+	return __pgprot(pgprot_val(_prot) & ~_PAGE_EXEC);
+}
+
 #define pgprot_noncached pgprot_noncached
 static inline pgprot_t pgprot_noncached(pgprot_t _prot)
 {
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
