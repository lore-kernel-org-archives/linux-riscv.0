Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED26C61DA4
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Feb 2023 02:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lVL5wuEdITKlDOZGECYuw0ICBR24VnWYaDK/L5FkRFQ=; b=14FuBQiSqcmZPI
	9xTqtyi0BuJ5TiwqzqE7XPmHC296T1t1gqposiy7deO6eAUi9h8tXJ2D0Eckb3hKEe8QWMkGyGGv1
	gFTZyXap5CyEOQvlCLTi6G1aHSc7rO+cxatuMwWVFmrg7B5F7vAPM5MW6ID5wY/eTlaZRvchYIglO
	AVtQBD+Y53gx85ZyZuXNDibwk8WkhpE7xoAKtysLIvpkji5Gg1QlmaLuErprPRpWDsC0vId4P9DGn
	Vrs3P07o+fMmHF5n0nXVCP/eQR8qG2i447QFa1I7NYaXhaWgPW9uPwiSFDdi5ZVcSMSX7QVKn3Hxz
	aAULHkxk5iXyWgmQIIyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pR1u8-00AkEn-6T; Sun, 12 Feb 2023 02:15:48 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pR1u2-00AkCU-Hy
	for linux-riscv@lists.infradead.org; Sun, 12 Feb 2023 02:15:44 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id BB6A45C00B3;
	Sat, 11 Feb 2023 21:15:33 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 11 Feb 2023 21:15:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1676168133; x=1676254533; bh=Uq
	5aQpvzKMkJKSQwmWMMR9mZ/TQ6KPX7R/4xIPuGG1g=; b=OFVr68CiMd+J4VCai1
	FUJlZMLvrSrQMrEoDSPj/O5Vqvmp0ldboTq7dICCCWsKLeaghYu1pFCMfnPqTv4N
	Mhg80hDab4lk0vBu0ud9noGiTLDdRU+HlB1DIjsf4QuYhes2FkqcUiS948G2SzTo
	YcS7nyOUMzfAyGyzFEE3Xih5OyOO8etCwBEUlxRfq2d/4XXKYxuOQDEfg9/6fQcZ
	m/DGnoKj4D8+xC5ppd7en/8fk/aC2hoe7nND8ErQGd5c5FyyIDB0Jc3sk7LwlEhe
	a1hwy5e63fdnwRaSs8rEGBzxcTguG+OZaJeWmMOnrr/6T38ediDTRt57LMGYhQCZ
	WepA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1676168133; x=1676254533; bh=Uq5aQpvzKMkJK
	SQwmWMMR9mZ/TQ6KPX7R/4xIPuGG1g=; b=RB/lFibS3OCcZ6i4DMUJooHt3CEBF
	bIXWeVju3bn82NDQn/wx8iWrGt3NiK1koybOH/w9FciB49nnnSOhlu+DKrn4s4CD
	Kp0Dntv7tu/wfHE/pTnodFEaSysdXaxVGUK9Dh9S/tmhPJ3f1IU0veekIQ2rTfsy
	08Vps085+0+N/bJd+hElaatAIr5f7B97Tt0/ZKMudn/XdmI5flBcXXnh1+Jtrdvh
	djm7T7GcI+LiWQ7kq2C9lVSniGEwnZvMILtZHrEmYJIDU+nQOiTO4Kmy5d+j5p+x
	LmUbawoNdag8A5nqWpciZMF213N3BNWmtz34PcChPi3nP14996Iq4as1Q==
X-ME-Sender: <xms:xUvoY4ICKyqmMvwVsxxA3oZ4b8rir3Sv1rNUfHQl_gHZQ2sTFz6vjw>
    <xme:xUvoY4L5Xuxvx9F9sb7yZk44ML9FsJPeoxNRz0bu0yDwlNJAohP4WfkAtZef29iiT
    rOTq0F-dr3Ezm8Saw>
X-ME-Received: <xmr:xUvoY4tg069NsDaqKpiATaWfckzKGwY5tldR8T6Fjb0dn2afWTube6uJ1P-5SvXFSK8KhnLZBzi3qfL5YNdwUiwl6WOFmGpF5cGk-RDT8-O8sYB2N5vcj-rgeZXJjv6F0plNVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehkedggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnheplefgffdthfffvdeuhfdugfevlefggeegffdvueekkeevieehtdei
    heegffelgffgnecuffhomhgrihhnpehsthhrtghmphdrshgspdhsthhrlhgvnhdrshgspd
    hsthhrnhgtmhhprdhssgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:xUvoY1ZpxJRtSeuTir8JOmMU9eD08rJ3nT3TluVymMqCSt-D18xhvg>
    <xmx:xUvoY_bhz7nvHJiDfiWOjfxfa8drjdYL-A-VJjVop-0Xk1mYP5w3Tg>
    <xmx:xUvoYxDWNAbF9NBdGO-8a3A0Z92o5EH1xmMJpL2fFdUw-9j0w_-dDw>
    <xmx:xUvoY8TdagE_KNaHL57ETSwLdUAZl0zlMv2o94b4TKqEAfw-3Ot2PA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 Feb 2023 21:15:32 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel@sholland.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Christoph Muellner <christoph.muellner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] riscv: Fix Zbb alternative IDs
Date: Sat, 11 Feb 2023 20:15:33 -0600
Message-Id: <20230212021534.59121-3-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20230212021534.59121-1-samuel@sholland.org>
References: <20230212021534.59121-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_181543_112707_D1D954AF 
X-CRM114-Status: UNSURE (   9.66  )
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

Commit 4bf8860760d9 ("riscv: cpufeature: extend
riscv_cpufeature_patch_func to all ISA extensions") switched ISA
extension alternatives to use the RISCV_ISA_EXT_* macros instead of
CPUFEATURE_*. This was mismerged when applied on top of the Zbb series,
so the Zbb alternatives referenced the wrong errata ID values.

Fixes: 9daca9a5b9ac ("Merge patch series "riscv: improve boot time isa extensions handling"")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 arch/riscv/include/asm/errata_list.h | 5 -----
 arch/riscv/lib/strcmp.S              | 2 +-
 arch/riscv/lib/strlen.S              | 2 +-
 arch/riscv/lib/strncmp.S             | 2 +-
 4 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index e158439029ce..274c6f889602 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -23,11 +23,6 @@
 #define	ERRATA_THEAD_NUMBER 3
 #endif
 
-#define	CPUFEATURE_SVPBMT 0
-#define	CPUFEATURE_ZICBOM 1
-#define	CPUFEATURE_ZBB 2
-#define	CPUFEATURE_NUMBER 3
-
 #ifdef __ASSEMBLY__
 
 #define ALT_INSN_FAULT(x)						\
diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
index 8148b6418f61..986ab23fe787 100644
--- a/arch/riscv/lib/strcmp.S
+++ b/arch/riscv/lib/strcmp.S
@@ -9,7 +9,7 @@
 /* int strcmp(const char *cs, const char *ct) */
 SYM_FUNC_START(strcmp)
 
-	ALTERNATIVE("nop", "j strcmp_zbb", 0, CPUFEATURE_ZBB, CONFIG_RISCV_ISA_ZBB)
+	ALTERNATIVE("nop", "j strcmp_zbb", 0, RISCV_ISA_EXT_ZBB, CONFIG_RISCV_ISA_ZBB)
 
 	/*
 	 * Returns
diff --git a/arch/riscv/lib/strlen.S b/arch/riscv/lib/strlen.S
index 0f9dbf93301a..8345ceeee3f6 100644
--- a/arch/riscv/lib/strlen.S
+++ b/arch/riscv/lib/strlen.S
@@ -9,7 +9,7 @@
 /* int strlen(const char *s) */
 SYM_FUNC_START(strlen)
 
-	ALTERNATIVE("nop", "j strlen_zbb", 0, CPUFEATURE_ZBB, CONFIG_RISCV_ISA_ZBB)
+	ALTERNATIVE("nop", "j strlen_zbb", 0, RISCV_ISA_EXT_ZBB, CONFIG_RISCV_ISA_ZBB)
 
 	/*
 	 * Returns
diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
index 7940ddab2d48..ee49595075be 100644
--- a/arch/riscv/lib/strncmp.S
+++ b/arch/riscv/lib/strncmp.S
@@ -9,7 +9,7 @@
 /* int strncmp(const char *cs, const char *ct, size_t count) */
 SYM_FUNC_START(strncmp)
 
-	ALTERNATIVE("nop", "j strncmp_zbb", 0, CPUFEATURE_ZBB, CONFIG_RISCV_ISA_ZBB)
+	ALTERNATIVE("nop", "j strncmp_zbb", 0, RISCV_ISA_EXT_ZBB, CONFIG_RISCV_ISA_ZBB)
 
 	/*
 	 * Returns
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
