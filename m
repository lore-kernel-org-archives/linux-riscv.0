Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90AC3C021A6
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 20:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+tn8HyDgewTkLjD8qax4ArtQjYIlLd70677VuUTPmk=; b=bOoL2luiWP3Rbs
	AandLmOnNU+i1D1dd9r4pEwt+gTmnCud+I3eka0OH0O4l5a5Wmf6tDrE1BSQrC0oHNP2WtfDkgXJ5
	pVVfNs3FK4JxIZVr7ogzQLjDxPuh+21xdfCPgNaeLwkE9p9J6fIL+m5sJXEBJgN56lL3Ug7dLQjgg
	xK6YaFJhh7DFUU+T7Q6CawtVwGNz/BNusbQqNJtuzmQs5gq8OgSTd831uV18R9nxIb0ip8yvD3eJ5
	+U4ozSw1GxnGL+g1uJDHmzM+UIyrH6hPWMKM6gL4K+PbkWLq29VXgNieKJii8GnF7/auHz+ywSdEP
	GO9DO9+H/gDsUYpgQlPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thwZ2-000000059Dy-3hF5;
	Tue, 11 Feb 2025 20:09:00 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thwPi-00000005809-3Uzr;
	Tue, 11 Feb 2025 19:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739303963; x=1770839963;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EZK5iCn0AJDuDPnbI9PCvoAule1opEGrI+Q176VJ/nQ=;
  b=nKQbD4lDTao3wVM+NAJsN3I71ljyTPXGThklR9Ufw6BsKp+VKYfEw8gH
   RvtdizN9xzn/4/5BffQnBKr2o+jTWfW8tH8Wo4kBiD8brzaqVf07n0u/s
   FzNR1IzZuMtWprwUYQXWe7WsualJoTR+07e0/Y4CI34A74/MaJUHG3bsd
   +K05PZiLF1ZKAwLCaF/xddoTwqZ53jAagMDgjkV4x84LI+MhL/64Ypddc
   vzfqi1fGrmLDF7C4vwbhi201W0bQjKpXIJzPLbMK+gsAongQ99sV6UacP
   ewnt2OG7krigF1qGXZ9KSfcW8sLSUdSCYklClDgMKxAEGSNs7/3RytUCl
   w==;
X-CSE-ConnectionGUID: J+9AS4PtQ/qXsVkdtN+U2Q==
X-CSE-MsgGUID: 712guNDlR4SdKNkvTcchGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="42786428"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="42786428"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 11:59:20 -0800
X-CSE-ConnectionGUID: O9AWFUy3RJO+9tb/yFTjLQ==
X-CSE-MsgGUID: wP1KLtz+QiSuzJuh+2GpBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="112826024"
Received: from msatwood-mobl.amr.corp.intel.com (HELO [10.125.108.48]) ([10.125.108.48])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 11:59:16 -0800
Message-ID: <3d750b58-d911-4f24-93e4-b84213849071@intel.com>
Date: Tue, 11 Feb 2025 11:59:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/15] x86: Physical address comparisons in fill_p*d/pte
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: luto@kernel.org, xin@zytor.com, kirill.shutemov@linux.intel.com,
 palmer@dabbelt.com, tj@kernel.org, andreyknvl@gmail.com, brgerst@gmail.com,
 ardb@kernel.org, dave.hansen@linux.intel.com, jgross@suse.com,
 will@kernel.org, akpm@linux-foundation.org, arnd@arndb.de, corbet@lwn.net,
 dvyukov@google.com, richard.weiyang@gmail.com, ytcoode@gmail.com,
 tglx@linutronix.de, hpa@zytor.com, seanjc@google.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, justinstitt@google.com,
 jason.andryuk@amd.com, glider@google.com, ubizjak@gmail.com,
 jannh@google.com, bhe@redhat.com, vincenzo.frascino@arm.com,
 rafael.j.wysocki@intel.com, ndesaulniers@google.com, mingo@redhat.com,
 catalin.marinas@arm.com, junichi.nomura@nec.com, nathan@kernel.org,
 ryabinin.a.a@gmail.com, dennis@kernel.org, bp@alien8.de,
 kevinloughlin@google.com, morbo@google.com, dan.j.williams@intel.com,
 julian.stecklina@cyberus-technology.de, peterz@infradead.org, cl@linux.com,
 kees@kernel.org, kasan-dev@googlegroups.com, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev,
 linux-doc@vger.kernel.org
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
 <2c2a71ec844db597f30754dd79faf87c9de0b21f.1738686764.git.maciej.wieczor-retman@intel.com>
 <c344dfaa-7e79-498f-89d7-44631140d0f4@intel.com>
 <lm5dg55q4vhhlsbsrvtskpz2hhdxa25pieq4gmf62ogtr4b4tw@xsq7ua7i5lto>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <lm5dg55q4vhhlsbsrvtskpz2hhdxa25pieq4gmf62ogtr4b4tw@xsq7ua7i5lto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_115922_883704_CA42BA1E 
X-CRM114-Status: UNSURE (   5.06  )
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

On 2/7/25 08:37, Maciej Wieczor-Retman wrote:
> @@ -287,7 +290,7 @@ static pte_t *fill_pte(pmd_t *pmd, unsigned long vaddr)
>  	if (pmd_none(*pmd)) {
>  		pte_t *pte = (pte_t *) spp_getpage();
>  		pmd_populate_kernel(&init_mm, pmd, pte);
> -		if (pte != pte_offset_kernel(pmd, 0))
> +		if (__pa(pte) != (pmd_val(*pmd) & pmd_pfn_mask(*pmd)))
>  			printk(KERN_ERR "PAGETABLE BUG #03!\n");
>  	}
>  	return pte_offset_kernel(pmd, vaddr);

Open coding it like this is fine with me.  The p*_offset_kernel(p*,0)
thing is arguably even harder to parse.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
