Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EACC02180
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=30nGlcOlGniVE9kJD2pydvnziz2mTqwO8KtXn8rY8uU=; b=VH+Gpc6v4+Bqbt
	VREWZEh7bqZ+raS78/07YfkA2cmZq/pSdMQvQKi4tRonbMYvEki0bulV1ZFxQZjqRI1+iZZStrKb9
	5TuFDAGomuGdZndJUGe6WWLfV817pTjcM7WKGDWgNmf7+IpJgSnkm4aS6mh7/009+pWmS4r2X6jba
	Ld42Ao0fymQuHOH1ApFknr48zk4Fs4guoVfxeigPaSZ9n96b0ZmKcuVOZQQlGnlwIepvwkAVVh19a
	r86PCHqQq3YS0N4sTHunZm0npI4CMSJlM9p3HNQk6HwjHZlAI7+jyseEBcFCkiKtppTWjHgzJa6xM
	kgKrUEHS6HHJN1Nd6iAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0be-0000000BTue-24gs;
	Wed, 15 Jan 2025 10:26:38 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0ZE-0000000BTHd-3dqb;
	Wed, 15 Jan 2025 10:24:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736936648; x=1768472648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mrQ1OaXlc6bMXEK7JY3n2o9PU+VRgTF8F5mJ7Od9uCc=;
  b=DsC0+g7YaecssPyiqH6B33KDH6Ql2mSefDFn2raA7mjsd3qe8iVNXgXV
   zZC6/U0jN/7gtcoJZ1/g//J9KpQd+9UugTRBfdhtJMPRGHFHgyqnCqrTK
   07wnQXdXTn1jPqiZfFRZUfcWi+bdjesy50/pcPTPc+R0KXKOcWLNitTLg
   ri3jbiPJkplrzbI8iZ4TUtWEzzqA/GS5vOh43k1J+1YOCTJnoUI0Uc2gi
   VNSRhrmrqentonZL6/EaN54Sd1XQPw4yjra1EYlM1ZD1WD7KMSRyvTWtO
   omYyWjWw1oBriabOwTELSMeIy13f78kalAySHX03mvPByhMiWOZjqgJS0
   w==;
X-CSE-ConnectionGUID: Z6a6yT27TR6oqbGZmLu/Hw==
X-CSE-MsgGUID: 3MtzdEzIQTig/CMZleXv6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="37145737"
X-IronPort-AV: E=Sophos;i="6.12,317,1728975600"; 
   d="scan'208";a="37145737"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 02:24:02 -0800
X-CSE-ConnectionGUID: GxpqY8wrS2qpNAwLOm9Oyg==
X-CSE-MsgGUID: eM68aTCeRJitcfICEUNamQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135949783"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 15 Jan 2025 02:23:56 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id E2AA740B; Wed, 15 Jan 2025 12:23:54 +0200 (EET)
Date: Wed, 15 Jan 2025 12:23:54 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexei Starovoitov <ast@kernel.org>, 
	Andrea Parri <parri.andrea@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Daniel Borkmann <daniel@iogearbox.net>, Eric Chan <ericchancf@google.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Kai Huang <kai.huang@intel.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Russell King <linux@armlinux.org.uk>, Samuel Holland <samuel.holland@sifive.com>, 
	Suren Baghdasaryan <surenb@google.com>, Yuntao Wang <ytcoode@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	stable@vger.kernel.org, Ashish Kalra <ashish.kalra@amd.com>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCHv3 2/2] x86/mm: Make memremap(MEMREMAP_WB) map memory as
 encrypted by default
Message-ID: <mvosqsybplnqfh6wadw5ue7u3plqnfo5ojusvaq6htzzhtfce2@bbgogdund3ho>
References: <ff8daeb1-4839-b070-dd94-a7692ac94008@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ff8daeb1-4839-b070-dd94-a7692ac94008@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_022408_961438_3E117270 
X-CRM114-Status: GOOD (  29.14  )
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

On Tue, Jan 14, 2025 at 10:54:53AM -0600, Tom Lendacky wrote:
> On 1/14/25 09:06, Tom Lendacky wrote:
> > On 1/14/25 08:44, Kirill A. Shutemov wrote:
> >> On Tue, Jan 14, 2025 at 08:33:39AM -0600, Tom Lendacky wrote:
> >>> On 1/14/25 01:27, Kirill A. Shutemov wrote:
> >>>> On Mon, Jan 13, 2025 at 02:47:56PM -0600, Tom Lendacky wrote:
> >>>>> On 1/13/25 07:14, Kirill A. Shutemov wrote:
> >>>>>> Currently memremap(MEMREMAP_WB) can produce decrypted/shared mapping:
> >>>>>>
> >>>>>> memremap(MEMREMAP_WB)
> >>>>>>   arch_memremap_wb()
> >>>>>>     ioremap_cache()
> >>>>>>       __ioremap_caller(.encrytped = false)
> >>>>>>
> >>>>>> In such cases, the IORES_MAP_ENCRYPTED flag on the memory will determine
> >>>>>> if the resulting mapping is encrypted or decrypted.
> >>>>>>
> >>>>>> Creating a decrypted mapping without explicit request from the caller is
> >>>>>> risky:
> >>>>>>
> >>>>>>   - It can inadvertently expose the guest's data and compromise the
> >>>>>>     guest.
> >>>>>>
> >>>>>>   - Accessing private memory via shared/decrypted mapping on TDX will
> >>>>>>     either trigger implicit conversion to shared or #VE (depending on
> >>>>>>     VMM implementation).
> >>>>>>
> >>>>>>     Implicit conversion is destructive: subsequent access to the same
> >>>>>>     memory via private mapping will trigger a hard-to-debug #VE crash.
> >>>>>>
> >>>>>> The kernel already provides a way to request decrypted mapping
> >>>>>> explicitly via the MEMREMAP_DEC flag.
> >>>>>>
> >>>>>> Modify memremap(MEMREMAP_WB) to produce encrypted/private mapping by
> >>>>>> default unless MEMREMAP_DEC is specified.
> >>>>>>
> >>>>>> Fix the crash due to #VE on kexec in TDX guests if CONFIG_EISA is enabled.
> >>>>>
> >>>>> This patch causes my bare-metal system to crash during boot when using
> >>>>> mem_encrypt=on:
> >>>>>
> >>>>> [    2.392934] efi: memattr: Entry type should be RuntimeServiceCode/Data
> >>>>> [    2.393731] efi: memattr: ! 0x214c42f01f1162a-0xee70ac7bd1a9c629 [type=2028324321|attr=0x6590648fa4209879]
> >>>>
> >>>> Could you try if this helps?
> >>>>
> >>>> diff --git a/drivers/firmware/efi/memattr.c b/drivers/firmware/efi/memattr.c
> >>>> index c38b1a335590..b5051dcb7c1d 100644
> >>>> --- a/drivers/firmware/efi/memattr.c
> >>>> +++ b/drivers/firmware/efi/memattr.c
> >>>> @@ -160,7 +160,7 @@ int __init efi_memattr_apply_permissions(struct mm_struct *mm,
> >>>>  	if (WARN_ON(!efi_enabled(EFI_MEMMAP)))
> >>>>  		return 0;
> >>>>  
> >>>> -	tbl = memremap(efi_mem_attr_table, tbl_size, MEMREMAP_WB);
> >>>> +	tbl = memremap(efi_mem_attr_table, tbl_size, MEMREMAP_WB | MEMREMAP_DEC);
> >>>
> >>> Well that would work for SME where EFI tables/data are not encrypted,
> >>> but will break for SEV where EFI tables/data are encrypted.
> >>
> >> Hm. Why would it break for SEV? It brings the situation back to what it
> >> was before the patch.
> > 
> > Ah, true. I can try it and see how much further SME gets. Hopefully it
> > doesn't turn into a whack-a-mole thing.
> 
> Unfortunately, it is turning into a whack-a-mole thing.
> 
> But it looks the following works for SME:
> 
> diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
> index 3c36f3f5e688..ff3cd5fc8508 100644
> --- a/arch/x86/mm/ioremap.c
> +++ b/arch/x86/mm/ioremap.c
> @@ -505,7 +505,7 @@ EXPORT_SYMBOL(iounmap);
>  
>  void *arch_memremap_wb(phys_addr_t phys_addr, size_t size, unsigned long flags)
>  {
> -	if (flags & MEMREMAP_DEC)
> +	if (flags & MEMREMAP_DEC || cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT))
>  		return (void __force *)ioremap_cache(phys_addr, size);
>  
>  	return (void __force *)ioremap_encrypted(phys_addr, size);
> 
> 
> I haven't had a chance to test the series on SEV, yet.

Please do.

I am okay with the change above. Borislav, is it acceptable direction for
you?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
