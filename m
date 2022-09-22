Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500CAC6FA8B
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Sep 2022 05:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/JOsmV/jZyRxFNBOTQV5yQtWillhA56bsY44kVTvdkQ=; b=1USA/B/YGIJNqI
	l+UPJdFEq4jGcoYVx0Fes/sTOw4n6/sJTPPseiPIauZP928L5YuMW4eywULuhjEQWIgI5X23fdLhF
	nULEDksMXp8cXK+PQz6btcl4bHtvdiSZECsue7F73upEyKavmGMA4zd8fIU2rl7nlXeDX5xQ/eZ9h
	BOIvvfu73mrd9Z+Bg5SRzC2eiL9eP1oScQmehLtjeYekM/cfGgNgnr8nbgUDnZqZW1XJlDHg9FJLk
	oYI99PbCK0txbQhrECtlzWSlJDFnOeXG5FXphtKGngcvieBO7Pr0HLIpD5BcYFy+XMfz0FzxlGVMG
	Lq3azArpeo6bjB/8kl3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obF40-00DS3x-Cl; Thu, 22 Sep 2022 05:47:56 +0000
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obF3u-00DS1U-Se
	for linux-riscv@lists.infradead.org; Thu, 22 Sep 2022 05:47:52 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 0FC623200A1A;
	Thu, 22 Sep 2022 01:47:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 22 Sep 2022 01:47:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1663825668; x=1663912068; bh=Uq
	jCW3qPBJkpy6ChCD9FJVMBBqKF8phiOGscINT6xB0=; b=dZRNitQI2aetBfKvpa
	qTSXiJOSCa38zRkjxJE7qkICjlv+38VuhY/E9skWqJ5ikbXls2e5OyBrR21P0/Vv
	yGzMhHLA6CH9kNym0aYydBa0w6J7dyU0kl++3QxdekvAtmgieitEyreyxh4NCCwl
	noytZ+NpLMMcSDPhXZnQpUdC41DJmSyg1nNewR59P3uIY3BX8cjhaYrwmePHM56V
	TUy8e6+TDVrsQX7BNit+u1yIBrf87QQtUIpiHy4ZBbbTp2IchdramdAMYJFQ8xeY
	rNps6qMHq9QNbfqn1TtupFeR/knKF3xVAFvidzeyWDoPPjAEdMk+CJ8VNLGPnzwa
	KuqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1663825668; x=1663912068; bh=UqjCW3qPBJkpy
	6ChCD9FJVMBBqKF8phiOGscINT6xB0=; b=PsJgMrr27dcYOsBK1FLrzsHmHdrNv
	0EGKdXYrmHeJi/oA41c9NBX9uS3l+FbgkI9hz7DdLHc+P8AjUIyEJozjOMTcM2sh
	Dze3u5fN7pye1lzdzXsNJBA0yoS+t5ZHA8eYKSpN1+LPdOvMLAoOKneLocNe7sRG
	DIprfs4gVoqb8fxM+vaG7qCKIq2MoYrjcGK8zTVpoZtn9QabjL1V07PmffgRTbAv
	XC/90VvXX+RbKIxhifMzJIcKffZj3GbbpmSCg4SWqH4jd3VPxamLRokAjXUC3nJV
	PtTKJfWFHqdyh9P5TKe3FSdlcd51pRKx8S9aqqhKyzyzAPg2HPPnFTxHQ==
X-ME-Sender: <xms:A_crY6W08ldBV5P5QlrrCGK_Sl8u4mS2wd33qgBWkh6dtHigoGZ6Uw>
    <xme:A_crY2lEtWYqOJkLc01T-dpnXkKPzps2SAeIyq9ZZgboKDVGXTlZgCs2WTPdakbE2
    LdmAyZnW_Gx3Ys1-w>
X-ME-Received: <xmr:A_crY-bO0KwfbA3d1i13w-oHD3ZirM3peCS9j8z_bayRXu9jQpJW8s37NIvz1VvDeAlvSAyd3QiSSw8hytLOs42R0q-pyePxXXgCDzvF171og2gjtkRBHBhYpj9xzHCSf5VD7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefvddgleelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:A_crYxUotqNy2JLCt4vMNYtN2guiShbkUByk44FTgLqIokIrF4J0xQ>
    <xmx:A_crY0mzMcId4Mx6pChUkQgmzS1qoP5Gkz-yrWOpc0DE5Pk77GNubg>
    <xmx:A_crY2eIb2wiZNHdjimOamgqpq_NqE4UykUs87LlUqajI8bwXV5UGA>
    <xmx:BPcrYymXR3UPUhEKE8V59CoXTRsc2V-0qdd2EXt_Qcko18RLB-FIPw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 01:47:46 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel@sholland.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Nick Kossifidis <mick@ics.forth.gr>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Tong Tiangen <tongtiangen@huawei.com>
Subject: [PATCH 2/2] riscv: Move cast inside kernel_mapping_[pv]a_to_[vp]a
Date: Thu, 22 Sep 2022 00:47:42 -0500
Message-Id: <20220922054743.30159-2-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220922054743.30159-1-samuel@sholland.org>
References: <20220922054743.30159-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_224751_390731_C7A4CCBE 
X-CRM114-Status: GOOD (  11.65  )
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

Before commit 44c922572952 ("RISC-V: enable XIP"), these macros cast
their argument to unsigned long. That commit moved the cast after an
assignment to an unsigned long variable, rendering it ineffectual.
Move the cast back, so we can remove the cast at each call site.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 arch/riscv/errata/thead/errata.c |  4 ++--
 arch/riscv/include/asm/page.h    | 18 +++++++++---------
 arch/riscv/mm/init.c             | 16 ++++++++--------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index 83174f13783e..38c2c6b0f6b8 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -76,8 +76,8 @@ void __init_or_module thead_errata_patch_func(struct alt_entry *begin, struct al
 		if (cpu_req_errata & tmp) {
 			/* On vm-alternatives, the mmu isn't running yet */
 			if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
-				memcpy((void *)kernel_mapping_va_to_pa((unsigned long)alt->old_ptr),
-				       (void *)kernel_mapping_va_to_pa((unsigned long)alt->alt_ptr),
+				memcpy((void *)kernel_mapping_va_to_pa(alt->old_ptr),
+				       (void *)kernel_mapping_va_to_pa(alt->alt_ptr),
 				       alt->alt_len);
 			else
 				patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index ac70b0fd9a9a..9f432c1b5289 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -123,20 +123,20 @@ extern phys_addr_t phys_ram_base;
 	((x) >= PAGE_OFFSET && (!IS_ENABLED(CONFIG_64BIT) || (x) < PAGE_OFFSET + KERN_VIRT_SIZE))
 
 #define linear_mapping_pa_to_va(x)	((void *)((unsigned long)(x) + kernel_map.va_pa_offset))
-#define kernel_mapping_pa_to_va(y)	({						\
-	unsigned long _y = y;								\
-	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < phys_ram_base) ?					\
-		(void *)((unsigned long)(_y) + kernel_map.va_kernel_xip_pa_offset) :		\
-		(void *)((unsigned long)(_y) + kernel_map.va_kernel_pa_offset + XIP_OFFSET);	\
+#define kernel_mapping_pa_to_va(y)	({					\
+	unsigned long _y = (unsigned long)(y);					\
+	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < phys_ram_base) ?			\
+		(void *)(_y + kernel_map.va_kernel_xip_pa_offset) :		\
+		(void *)(_y + kernel_map.va_kernel_pa_offset + XIP_OFFSET);	\
 	})
 #define __pa_to_va_nodebug(x)		linear_mapping_pa_to_va(x)
 
 #define linear_mapping_va_to_pa(x)	((unsigned long)(x) - kernel_map.va_pa_offset)
 #define kernel_mapping_va_to_pa(y) ({						\
-	unsigned long _y = y;							\
-	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < kernel_map.virt_addr + XIP_OFFSET) ?	\
-		((unsigned long)(_y) - kernel_map.va_kernel_xip_pa_offset) :		\
-		((unsigned long)(_y) - kernel_map.va_kernel_pa_offset - XIP_OFFSET);	\
+	unsigned long _y = (unsigned long)(y);					\
+	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < kernel_map.virt_addr + XIP_OFFSET) ? \
+		(_y - kernel_map.va_kernel_xip_pa_offset) :			\
+		(_y - kernel_map.va_kernel_pa_offset - XIP_OFFSET);		\
 	})
 
 #define __va_to_pa_nodebug(x)	({						\
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index b56a0a75533f..7d59516ce6b3 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -927,15 +927,15 @@ static void __init pt_ops_set_early(void)
  */
 static void __init pt_ops_set_fixmap(void)
 {
-	pt_ops.alloc_pte = kernel_mapping_pa_to_va((uintptr_t)alloc_pte_fixmap);
-	pt_ops.get_pte_virt = kernel_mapping_pa_to_va((uintptr_t)get_pte_virt_fixmap);
+	pt_ops.alloc_pte = kernel_mapping_pa_to_va(alloc_pte_fixmap);
+	pt_ops.get_pte_virt = kernel_mapping_pa_to_va(get_pte_virt_fixmap);
 #ifndef __PAGETABLE_PMD_FOLDED
-	pt_ops.alloc_pmd = kernel_mapping_pa_to_va((uintptr_t)alloc_pmd_fixmap);
-	pt_ops.get_pmd_virt = kernel_mapping_pa_to_va((uintptr_t)get_pmd_virt_fixmap);
-	pt_ops.alloc_pud = kernel_mapping_pa_to_va((uintptr_t)alloc_pud_fixmap);
-	pt_ops.get_pud_virt = kernel_mapping_pa_to_va((uintptr_t)get_pud_virt_fixmap);
-	pt_ops.alloc_p4d = kernel_mapping_pa_to_va((uintptr_t)alloc_p4d_fixmap);
-	pt_ops.get_p4d_virt = kernel_mapping_pa_to_va((uintptr_t)get_p4d_virt_fixmap);
+	pt_ops.alloc_pmd = kernel_mapping_pa_to_va(alloc_pmd_fixmap);
+	pt_ops.get_pmd_virt = kernel_mapping_pa_to_va(get_pmd_virt_fixmap);
+	pt_ops.alloc_pud = kernel_mapping_pa_to_va(alloc_pud_fixmap);
+	pt_ops.get_pud_virt = kernel_mapping_pa_to_va(get_pud_virt_fixmap);
+	pt_ops.alloc_p4d = kernel_mapping_pa_to_va(alloc_p4d_fixmap);
+	pt_ops.get_p4d_virt = kernel_mapping_pa_to_va(get_p4d_virt_fixmap);
 #endif
 }
 
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
