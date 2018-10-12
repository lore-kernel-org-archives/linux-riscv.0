Return-Path: <SRS0=LzlR=MY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 538D0C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 11:09:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 259452077C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 11:09:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mW6g2LTh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=shutemov-name.20150623.gappssmtp.com header.i=@shutemov-name.20150623.gappssmtp.com header.b="qeudmJU6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 259452077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ljdtykZTpGPKpHYDunRR4vVQMqB/nCpn3mQXIGAdvbs=; b=mW6g2LThnMBKSz
	7k6M5EuTBmDfUhpFyqsE/n0wbpieG/KKeV2X4i6ek9AHSRiXlYMBsFT/0M2yii7/68e+xDrJKq5nZ
	t4Pu3jfT55nel/mCzv18OTbTGt5haHYC+U/BdWuXxr205RRCtzPvklX43hfPTlfyoZeVlKlsapRTC
	zh4heKXLhBGYMMMlQLle17PPVDXPnP4TyQmnWm4AAMNE5c1Lc3Nr9ZvVj2Fh8nAsAKzmAPU1Sg0FF
	EcDVrK7OAea5+aV7zzy02HDyKvrEWnNX7ytrJSgPjAFQvYbjZtIPHC/PK7JlKjSgyR2niSlyFnriD
	CPFpFZuzklVJw8RgL/1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gAvKG-0007Re-UY; Fri, 12 Oct 2018 11:09:48 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAvJs-0007Aw-3S
 for linux-riscv@lists.infradead.org; Fri, 12 Oct 2018 11:09:45 +0000
Received: by mail-pf1-x443.google.com with SMTP id p24-v6so6023278pff.10
 for <linux-riscv@lists.infradead.org>; Fri, 12 Oct 2018 04:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RX5FjI3wwkptc5sfX4+NkcctA+fCkcVF8HC/oTZQueA=;
 b=qeudmJU6+nqktNq8hagWevdDYJTTFMn+WENyVU02czllfS+fQup8X2aAcQtu2Lo0Fp
 dhBWK+IUAJCVJxMgLR2Q+5FdwzcoZDri19DNWDDMDN459vxsWd4gd90pvEzqmj7i/Fk+
 4GmiBbPPBQxYkEOU63G/QIHHt6iTrlm7BZWRGLnI42WPtnHHGUwiFQgxxz6a5lmwlVkh
 RLNcciTpu4deyuzzSogUrxoQpB41XxnBfDW3RTICetpaoKpeC37wL/mNktpm48Nj7dgI
 Xa/aCwwYycAOdNSNZVdcW5B/PKAoIddEyh93084VotBhdiNKJBPYH3SrKS+IeMKOkimb
 sY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RX5FjI3wwkptc5sfX4+NkcctA+fCkcVF8HC/oTZQueA=;
 b=JUGF0ZZ+jmPHoQw+dc3C6n9X/8GoiE+8hfASxQsbGKdrcQIQfWSB6aUVixaU+fDsob
 1hqWAquO18+eyiKNlvwCWSBIGde7HyI+SRLB/+qicdT9CLAqX5rU9M6V90F9WTKRvkcC
 o+1IMlsXTj5uOe2bcVOTknWsfnJDONtB0ANk7ckrYbWGVXd4cVfQpX/QRanhvKMa4w3K
 mTGazt1PosKPlNXifDtkbzMueyHRHpeo5WlaWz4c2umcYwtWm3btPuQv1Tky3TEz/sxA
 g6sbsIKqWBg5ScRhRH87P4Dv+51pXJzKqutAJIddbEVZpKp8uuAxsuwSuPs3giCXb4Zf
 c2QQ==
X-Gm-Message-State: ABuFfojCJg9IXYSYcRQC6gKk5+utgpQoOs2wQAacP4FbYCJkVIjeGUMk
 u+GBxFtxs/boFAiJfm8rDaCFdQ==
X-Google-Smtp-Source: ACcGV62AMJmSqYHUXksz43gsqwXiRDEZmpQoYbBa2QiJukAYc0ejyNX8clN1YjM/qERtSA9meBw2Jg==
X-Received: by 2002:a63:2356:: with SMTP id
 u22-v6mr5097385pgm.122.1539342552151; 
 Fri, 12 Oct 2018 04:09:12 -0700 (PDT)
Received: from kshutemo-mobl1.localdomain ([192.55.54.42])
 by smtp.gmail.com with ESMTPSA id r18-v6sm1479496pgj.51.2018.10.12.04.09.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Oct 2018 04:09:10 -0700 (PDT)
Received: by kshutemo-mobl1.localdomain (Postfix, from userid 1000)
 id B9B73300030; Fri, 12 Oct 2018 14:09:06 +0300 (+03)
Date: Fri, 12 Oct 2018 14:09:06 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Subject: Re: [PATCH v2 1/2] treewide: remove unused address argument from
 pte_alloc functions
Message-ID: <20181012110906.fpfttp4nhvsr2ps7@kshutemo-mobl1>
References: <20181012013756.11285-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181012013756.11285-1-joel@joelfernandes.org>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181012_040924_273152_DA8CCB6A 
X-CRM114-Status: GOOD (  12.97  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-mips@linux-mips.org, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will.deacon@arm.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, lokeshgidra@google.com,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 elfring@users.sourceforge.net, Jonas Bonn <jonas@southpole.se>,
 linux-s390@vger.kernel.org, dancol@google.com,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-xtensa@linux-xtensa.org,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 hughd@google.com, "James E.J. Bottomley" <jejb@parisc-linux.org>,
 kasan-dev@googlegroups.com, kvmarm@lists.cs.columbia.edu,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, linux-snps-arc@lists.infradead.org,
 kernel-team@android.com, Sam Creasey <sammy@sammy.net>,
 Fenghua Yu <fenghua.yu@intel.com>, Jeff Dike <jdike@addtoit.com>,
 linux-um@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Julia Lawall <Julia.Lawall@lip6.fr>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, nios2-dev@lists.rocketboards.org,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Tony Luck <tony.luck@intel.com>, Richard Weinberger <richard@nod.at>,
 linux-parisc@vger.kernel.org, pantin@google.com,
 Max Filippov <jcmvbkbc@gmail.com>, linux-kernel@vger.kernel.org,
 minchan@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-alpha@vger.kernel.org, Ley Foon Tan <lftan@altera.com>,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181012110906.FMKa7DR1mjCBkuCXborFvoUnkO_3PKpWmMnO4qDN1yQ@z>

On Thu, Oct 11, 2018 at 06:37:55PM -0700, Joel Fernandes (Google) wrote:
> diff --git a/arch/m68k/include/asm/mcf_pgalloc.h b/arch/m68k/include/asm/mcf_pgalloc.h
> index 12fe700632f4..4399d712f6db 100644
> --- a/arch/m68k/include/asm/mcf_pgalloc.h
> +++ b/arch/m68k/include/asm/mcf_pgalloc.h
> @@ -12,8 +12,7 @@ extern inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
>  
>  extern const char bad_pmd_string[];
>  
> -extern inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm,
> -	unsigned long address)
> +extern inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
>  {
>  	unsigned long page = __get_free_page(GFP_DMA);
>  
> @@ -32,8 +31,6 @@ extern inline pmd_t *pmd_alloc_kernel(pgd_t *pgd, unsigned long address)
>  #define pmd_alloc_one_fast(mm, address) ({ BUG(); ((pmd_t *)1); })
>  #define pmd_alloc_one(mm, address)      ({ BUG(); ((pmd_t *)2); })
>  
> -#define pte_alloc_one_fast(mm, addr) pte_alloc_one(mm, addr)
> -

I believe this was one done manually, right?
Please explicitely state everthing you did on not of sematic patch

...

> diff --git a/arch/microblaze/include/asm/pgalloc.h b/arch/microblaze/include/asm/pgalloc.h
> index 7c89390c0c13..f4cc9ffc449e 100644
> --- a/arch/microblaze/include/asm/pgalloc.h
> +++ b/arch/microblaze/include/asm/pgalloc.h
> @@ -108,10 +108,9 @@ static inline void free_pgd_slow(pgd_t *pgd)
>  #define pmd_alloc_one_fast(mm, address)	({ BUG(); ((pmd_t *)1); })
>  #define pmd_alloc_one(mm, address)	({ BUG(); ((pmd_t *)2); })
>  
> -extern pte_t *pte_alloc_one_kernel(struct mm_struct *mm, unsigned long addr);
> +extern pte_t *pte_alloc_one_kernel(struct mm_struct *mm);
>  
> -static inline struct page *pte_alloc_one(struct mm_struct *mm,
> -		unsigned long address)
> +static inline struct page *pte_alloc_one(struct mm_struct *mm)
>  {
>  	struct page *ptepage;
>  
> @@ -132,20 +131,6 @@ static inline struct page *pte_alloc_one(struct mm_struct *mm,
>  	return ptepage;
>  }
>  
> -static inline pte_t *pte_alloc_one_fast(struct mm_struct *mm,
> -		unsigned long address)
> -{
> -	unsigned long *ret;
> -
> -	ret = pte_quicklist;
> -	if (ret != NULL) {
> -		pte_quicklist = (unsigned long *)(*ret);
> -		ret[0] = 0;
> -		pgtable_cache_size--;
> -	}
> -	return (pte_t *)ret;
> -}
> -

Ditto.

-- 
 Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
