Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354F2C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Nov 2022 06:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nruXFJNgZrDpZE+3NPCOjkLl8hPzs4eSIDCiCmtY85k=; b=tpnee9nsZ5zzAO
	LVCBBbVvcWY7k6xI964MJ3LMm9kyZxPUo+LIgVM7cVuZy52gCg9pYDf61evBlK2kNpEiiccG5/a8q
	Yc/70Xp+qOwxzNMtjn1ktngz9tYU7dmoDj/x6eVp3/J3v0iIS/dMXHdu77RbPS1e03nDX0NGMAEah
	C3iR4lC/iGCgpXmVigmzETC4LG87RdW62PydTFqrW3PcKwT8baTxkJUgj4PyfqITk4nAnYgoy8RDi
	jtm5QZ9EQ1j/Wh/D6pVJ9cC2qePk9xfG8RBfnspHvKk8LxkKmyJu3Ie3/gRQVcqbV1RtC9+eoRzxj
	Qc69bgz6LeoyJbjnBH6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyoNf-004SO0-Ur; Sat, 26 Nov 2022 06:09:40 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyoNb-004SLZ-2k
	for linux-riscv@lists.infradead.org; Sat, 26 Nov 2022 06:09:36 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 479DE5C00DD;
	Sat, 26 Nov 2022 01:09:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sat, 26 Nov 2022 01:09:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1669442965; x=1669529365; bh=09
	Mg6EEBRTEKmXamOwdaq9np8wWtNcmlu/wFj129aKE=; b=JuIs6MYmkW8cPwn0MG
	08LGEF8qd/wseB8sUcBwcA2au8V3H2nr4FboYvj36m9UPh5h0mxCPhqZ9Eg8MSKj
	iCzP2Rnz4T2npkC7O0FhOIvhe2XUOsIyfPAU43IxHgwiuc8bMGdFmgw9yd21/FEW
	AHF2zPkCqol18NI47HLKvPs24l9Ak+PzV5MARyg7chnvbKNm5WVWWupJQLOr5cLZ
	eFncCPORXt2Eibw9cLboVV4msouFUmrzVTkR+EhMRUtzDqZ6hXiIh5hfn78xE7sA
	jui0LJtc6Eg/u+dQILurZQxaJtvgqJUzg5hqZqamUP0GesRniwmYj2gtCiVIjxTx
	ztlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1669442965; x=1669529365; bh=09Mg6EEBRTEKm
	XamOwdaq9np8wWtNcmlu/wFj129aKE=; b=LM0sSvA6v18nkF0en0CFPKqdDcT+L
	GIQsqJ8ZELFGTzRsjlwkOw4DzL49hGPn3MgOP6hrWQP3Z+C171bTSa8yeGg1JyUL
	PRYvCDeMc0XpMobdAtIfEeRQkd0gmfNn0Wq+gA6EzaAgtcmUZUUjQyl60ObBhL2D
	1BUcpAv55MQx2NwbQo3991MGY2GTOGKAoTsGqK6oVEGmSO4u1t0XRTsQx/rCrLgj
	K3cmlbv0yMgZx7IaIfxeGRfsE9EczHu+jHDVacdW0GrABwdgzpkkEcCeo9RJPlyv
	Vv9Bd/xzqt6WXiLvL8MeeiSQWPP8pYMkFJRw68mhS6KFlCCCzhOf6s1Cg==
X-ME-Sender: <xms:k62BY9UsZubETwLOwIPhBkzATVKozPW4vv7iUl_SnpVTdQc9YfAMlg>
    <xme:k62BY9mQGjjFe5Ypj9-DdffWWDAG0at37PoiBDOfOmXpCL-g7oTFcHIdI6rfVrZ-D
    nPeY9Epj0kdo0ZjpA>
X-ME-Received: <xmr:k62BY5b63m6AzsCi-4lzLg8_g-QmNc47fy54dpJmZSETzKEXZWFra8y5hye1cqud7Kydxy5cN_TWhXiKHkPZKA0lIOoNjsf6JyJSOqMTEYq5-IMWAy6g0O6cyfiYKY7vt0k_NQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieeigdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
    feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:k62BYwXiPuVA4owDxsU8798tuCUUDm_BySUSv3NmZRBSbCkeG9WfKA>
    <xmx:k62BY3l-tgncVAm97DeMiOQLw8wQXgrkBPLHokfs2yjJFw5icu288Q>
    <xmx:k62BY9crxx47zP6Oyq0ZyZMN2jmLvkW_PYn6CeKp_4fUb-DSQCRBHw>
    <xmx:la2BYxkcSFxoOP4kJ_HV34ZsQmYX2tWGE570had09vuiOr4eoTCWvA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 26 Nov 2022 01:09:22 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel@sholland.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Helge Deller <deller@gmx.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nick Kossifidis <mick@ics.forth.gr>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v2 2/2] riscv: Move cast inside kernel_mapping_[pv]a_to_[vp]a
Date: Sat, 26 Nov 2022 00:09:20 -0600
Message-Id: <20221126060920.65009-2-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221126060920.65009-1-samuel@sholland.org>
References: <20221126060920.65009-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_220935_227072_8AE2BF4C 
X-CRM114-Status: UNSURE (   9.69  )
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

Before commit 44c922572952 ("RISC-V: enable XIP"), these macros cast
their argument to unsigned long. That commit moved the cast after an
assignment to an unsigned long variable, rendering it ineffectual.
Move the cast back, so we can remove the cast at each call site.

Reviewed-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 arch/riscv/include/asm/page.h | 18 +++++++++---------
 arch/riscv/mm/init.c          | 16 ++++++++--------
 2 files changed, 17 insertions(+), 17 deletions(-)

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
index 50a1b6edd491..dc1ddfa6dedc 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -926,15 +926,15 @@ static void __init pt_ops_set_early(void)
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
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
