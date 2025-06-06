Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F6BC5AD49
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 17:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=db41qiOsn5AQ/C41bDsABkZ//0vD8Dk0MryrtUQzIZk=; b=XuWVc0oX9WMy9XSsYvhV7chtxd
	ODztb8+dGmeBavm0sqKNpnIuJ2s7PZT3HVFjJM2gYid9cZKaBfKuWl81Oo4lmTYKaGGEnO1moo9u1
	sbcuWLJQIg6cINVjCAa7wSO8TlgMlbUUo/c1j11G9vcllvNouKN3/aMT8l3nyICjoN2NHJrDM2o2q
	7g8idN3uG8oWhGVMc1oAH5hTmM9TET9yUva/yvREPtYe6JtV8EBxTKKzOFECv4JUiv/AZTcOyLW61
	FnPLk1OJgV5j4KMIVj9LvG+jVTKanJ8ahQPZ+NwlJjkw+Dax5rn2UWkHB/6KofDMy50qUO7HBElS9
	hiP945dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNau6-00000000jFw-1qyi;
	Fri, 06 Jun 2025 17:30:54 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNau4-00000000jFZ-08pg
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 17:30:53 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-747c2cc3419so1784353b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jun 2025 10:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749231051; x=1749835851; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X2PQ67BFWU56/gkiZ9MusCHT/JwVeFrtJgEOKPncvwI=;
        b=pejc+JzWUg85wEWHXaV/HlQ4by4BZHjb+irkiOnevvpLWSeibOQQn+Ccil6tEu8cSv
         ifNQdIlXxianKIRcUFzAQlWqwxDpdYh1sfEAiSMqupXwYQWVPN4VaFAd5177ZQoAURH9
         vWh3fq+4HT97hIEz/4bAfYeLf5UxyCaB6yQwwY6PXccA47qROVOntc7d5EzyBNIY1QJJ
         QfTxKlYWY6Dl9wwh/rg+MMBUNKP1hxun3XgV6spSuD/+6dnORvrKtbeHVnrqM1PO0LIz
         u6L1AVOD7mDms1YHiEEGoMqdtZDrMcHJOyDth8VpJzkBi2NI2DNvHxX247hFKcqdv1vp
         7OkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749231051; x=1749835851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2PQ67BFWU56/gkiZ9MusCHT/JwVeFrtJgEOKPncvwI=;
        b=xDyvw6que3xG9BBsmGLeHBSD2vRtbznSH7lW5EOdqlRVEpY0CrnykIvxNx2quME2Xm
         wceoW7yyJMZvmSc8+XqQtssDhbD701z2tOPv6wo+UGoUovdd7qUj0ImhRKfqA/uAqg58
         FFpw3b0bjE+9JUtpU8M36iC9N4vbNYA5LpgZnirOly5M9dCl6gQb61/x0vJYbY4MEZ3Q
         PURZys61Z2TQQZdrmi5d/+mE8G6PrLvI1F7y45dLvfWFEBro5EMpptE3VzbZ6FVmqlPO
         5TwMiftKIQqI/wIa+/Jj7EodvcmyAG2tLNFC3ZzXGZmRvjsXh8hc6eMzi1sNieHIcXRY
         9GaA==
X-Forwarded-Encrypted: i=1; AJvYcCUk90AqNFNZtMHC13LcbFpxfyAgv7MckCkvrwTWnm6jn7WvWtGmumGP/SFNOCBrdiTvmtboF9FFxsyy/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3rc8leqoooatgdEXCSc+6Rz6tPyOIZ8DrTN57/9BKKu0BTMyx
	Fs8vCokPfJLHG7ne+dHMiUhnUZWOxqBxdwDoQ/4Ikr4qh++jNctzBPKJ5pw8RpmrQ+Q=
X-Gm-Gg: ASbGnctcSl4kI+Frx2O8NwWs2XBhFwJ+JsPMadLyg1Uw9SWJF4ApNd+FGdlkhmXAtxw
	3G2kXFoQtC2hTVBm/WVbHCdON4WcFNrGgLtvtgpwgctpHI9erbHxk4S28AlvH73oc7Z9QTWLcwP
	icRLF699vZgGTYrOOSYG8FoCnwG3tw61VzMiqRRJ2Q9sd38ZkZhF3YVZQ4YghPPA6TRzs40wpUR
	W92T1PvaEnt9xk1E7kb3X8HLKPmpwfMLfuUkE8pcwwj2anChnvQVFXD7NjfWo8Fcbv1SGTcDV3P
	/owldQwzVYJPjwyfKCRImJy/8iPhlIFlCsuMAE1zFUXupXtqQNAwrXI7iw7JeA==
X-Google-Smtp-Source: AGHT+IHgMy5gdkBqvTbfaUQGR2qvVQaW9QlO1x9bJKi+Q4H2O89s0ff1Q5OBkCzHauPpSkT1Z14DRg==
X-Received: by 2002:a05:6a21:2d4a:b0:215:d457:ca6d with SMTP id adf61e73a8af0-21ee43e18e5mr6073980637.40.1749231051059;
        Fri, 06 Jun 2025 10:30:51 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0836d4sm1517910b3a.85.2025.06.06.10.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 10:30:50 -0700 (PDT)
Date: Fri, 6 Jun 2025 10:30:48 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Ved Shanbhogue <ved@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH RFC v7 3/3] riscv: mm: Add uffd write-protect support
Message-ID: <aEMlyNf-NN6moeFb@debug.ba.rivosinc.com>
References: <20250409095320.224100-1-zhangchunyan@iscas.ac.cn>
 <20250409095320.224100-4-zhangchunyan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250409095320.224100-4-zhangchunyan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_103052_072104_ADB12480 
X-CRM114-Status: GOOD (  14.05  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 09, 2025 at 05:53:20PM +0800, Chunyan Zhang wrote:
>The Svrsw60t59b extension allows to free the PTE reserved bits 60 and 59
>for software, this patch uses bit 60 for uffd-wp tracking
>
>Additionally for tracking the uffd-wp state as a PTE swap bit, we borrow
>bit 4 which is not involved into swap entry computation.
>
>Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
>---
> arch/riscv/Kconfig                    |  1 +
> arch/riscv/include/asm/pgtable-bits.h | 18 ++++++++
> arch/riscv/include/asm/pgtable.h      | 65 +++++++++++++++++++++++++++
> 3 files changed, 84 insertions(+)
>
>diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>index 652e2bbfb702..cafdfbe4412b 100644
>--- a/arch/riscv/Kconfig
>+++ b/arch/riscv/Kconfig
>@@ -145,6 +145,7 @@ config RISCV
> 	select HAVE_ARCH_TRACEHOOK
> 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
> 	select HAVE_ARCH_USERFAULTFD_MINOR if 64BIT && USERFAULTFD
>+	select HAVE_ARCH_USERFAULTFD_WP if 64BIT && MMU && USERFAULTFD && RISCV_ISA_SVRSW60T59B
> 	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
> 	select HAVE_ASM_MODVERSIONS
> 	select HAVE_CONTEXT_TRACKING_USER
>diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
>index a6fa871dc19e..a953a582cd75 100644
>--- a/arch/riscv/include/asm/pgtable-bits.h
>+++ b/arch/riscv/include/asm/pgtable-bits.h
>@@ -39,6 +39,24 @@
> #define _PAGE_SWP_SOFT_DIRTY	0
> #endif /* CONFIG_MEM_SOFT_DIRTY */
>
>+#ifdef CONFIG_HAVE_ARCH_USERFAULTFD_WP
>+
>+/* ext_svrsw60t59b: Bit(60) for uffd-wp tracking */
>+#define _PAGE_UFFD_WP							\
>+	((riscv_has_extension_unlikely(RISCV_ISA_EXT_SVRSW60T59B)) ?	\
>+	 (1UL << 60) : 0)
>+/*
>+ * Bit 4 is not involved into swap entry computation, so we
>+ * can borrow it for swap page uffd-wp tracking.
>+ */
>+#define _PAGE_SWP_UFFD_WP						\
>+	((riscv_has_extension_unlikely(RISCV_ISA_EXT_SVRSW60T59B)) ?	\
>+	 _PAGE_USER : 0)
>+#else
>+#define _PAGE_UFFD_WP		0
>+#define _PAGE_SWP_UFFD_WP	0
>+#endif
>+

Same comment as previous patch on above. Have `RISCV_ISA_EXT_SVRSW60T59B`
with the "#ifdef CONFIG_HAVE_ARCH_USERFAULTFD_WP"


> #define _PAGE_TABLE     _PAGE_PRESENT
>
> /*
>diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>index 14461ffe6321..ee0fbca28a76 100644
>--- a/arch/riscv/include/asm/pgtable.h
>+++ b/arch/riscv/include/asm/pgtable.h
>@@ -425,6 +425,38 @@ static inline pte_t pte_wrprotect(pte_t pte)
> 	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
> }
>
>+#ifdef CONFIG_HAVE_ARCH_USERFAULTFD_WP
>+static inline bool pte_uffd_wp(pte_t pte)
>+{
>+	return !!(pte_val(pte) & _PAGE_UFFD_WP);
>+}
>+
>+static inline pte_t pte_mkuffd_wp(pte_t pte)
>+{
>+	return pte_wrprotect(__pte(pte_val(pte) | _PAGE_UFFD_WP));
>+}
>+
>+static inline pte_t pte_clear_uffd_wp(pte_t pte)
>+{
>+	return __pte(pte_val(pte) & ~(_PAGE_UFFD_WP));
>+}
>+
>+static inline bool pte_swp_uffd_wp(pte_t pte)
>+{
>+	return !!(pte_val(pte) & _PAGE_SWP_UFFD_WP);
>+}
>+
>+static inline pte_t pte_swp_mkuffd_wp(pte_t pte)
>+{
>+	return __pte(pte_val(pte) | _PAGE_SWP_UFFD_WP);
>+}
>+
>+static inline pte_t pte_swp_clear_uffd_wp(pte_t pte)
>+{
>+	return __pte(pte_val(pte) & ~(_PAGE_SWP_UFFD_WP));
>+}
>+#endif /* CONFIG_HAVE_ARCH_USERFAULTFD_WP */
>+
> /* static inline pte_t pte_mkread(pte_t pte) */
>
> static inline pte_t pte_mkwrite_novma(pte_t pte)
>@@ -853,6 +885,38 @@ static inline pud_t pud_mkspecial(pud_t pud)
> }
> #endif
>
>+#ifdef CONFIG_HAVE_ARCH_USERFAULTFD_WP
>+static inline bool pmd_uffd_wp(pmd_t pmd)
>+{
>+	return pte_uffd_wp(pmd_pte(pmd));
>+}
>+
>+static inline pmd_t pmd_mkuffd_wp(pmd_t pmd)
>+{
>+	return pte_pmd(pte_mkuffd_wp(pmd_pte(pmd)));
>+}
>+
>+static inline pmd_t pmd_clear_uffd_wp(pmd_t pmd)
>+{
>+	return pte_pmd(pte_clear_uffd_wp(pmd_pte(pmd)));
>+}
>+
>+static inline bool pmd_swp_uffd_wp(pmd_t pmd)
>+{
>+	return pte_swp_uffd_wp(pmd_pte(pmd));
>+}
>+
>+static inline pmd_t pmd_swp_mkuffd_wp(pmd_t pmd)
>+{
>+	return pte_pmd(pte_swp_mkuffd_wp(pmd_pte(pmd)));
>+}
>+
>+static inline pmd_t pmd_swp_clear_uffd_wp(pmd_t pmd)
>+{
>+	return pte_pmd(pte_swp_clear_uffd_wp(pmd_pte(pmd)));
>+}
>+#endif /* CONFIG_HAVE_ARCH_USERFAULTFD_WP */
>+
> #ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
> static inline bool pmd_soft_dirty(pmd_t pmd)
> {
>@@ -978,6 +1042,7 @@ extern pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
>  *	bit            0:	_PAGE_PRESENT (zero)
>  *	bit       1 to 2:	(zero)
>  *	bit            3:	_PAGE_SWP_SOFT_DIRTY
>+ *	bit            4:	_PAGE_SWP_UFFD_WP
>  *	bit            5:	_PAGE_PROT_NONE (zero)
>  *	bit            6:	exclusive marker
>  *	bits      7 to 11:	swap type
>-- 
>2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
