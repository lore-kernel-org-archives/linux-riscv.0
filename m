Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF51CC6B0E
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 16:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mM1R8ZjKjtbi5Pp28mmW9LeBMoD/RJFEyS8YWywox3M=; b=v6vHAUoLHRMcoO
	B073NFpznLXXBHpE95IkGzy8M43hCPiCkdSVONaHz/Vg+5J46L5BuU8LBzcST+Ktf7HVuWKHshvYl
	+OUA7JacHkcwkLUavZSACT9IUwEONe3ROklTCWF//W0WgmYGrq8HNX7+SIFEawag309Wu13fjJIer
	hvP3KAopQla+jTicIEwJWN0h4R2HmQhv5CAX87MCqV4ooRgyf2tQoUq06vCFacZSwzajoO7Vla1MA
	lylBoGh5QkhGcy7nw2+bI6sVMmUcuQIFvAmZ2HQ3JqIb9tKNPOoKFQ3NhGtlMn6WUxd9UO/kaTzAV
	fRQSJofY8zu1QLtVcSpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGf50-0000000DT3n-2nGh;
	Tue, 13 Oct 2026 16:10:18 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGf4x-0000000DT2l-0KFV
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 16:10:17 +0000
Date: Tue, 13 Oct 2026 18:10:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791907810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zJq8JxfE1u5dAwYp63/Krdm7jwWp1EzNhKxbOj04ukk=;
	b=akbHu5jkMYRTLC1+xP/CoqHOh589pW2nO06Px9EnuPugTQMRJx+wi5UtLCSmfNfwaln9Qe
	BqS4hyyOmoKVIwS8lYhfvSzuwjgovebXnqPxcUOkT0GVZ/ncJhUJldQyU4s0a1NMN6QrvF
	UlJGwhWJFxYleK37Fz8jD7TXADosYYhFPs0l0qNZZWDXusE6an10XK1qTbqtkSBxQ/205v
	gZU7YKxDmkT06jlj9JvI7QEF6cbfa3OxYyoPmisjWx4tbPBSWjdxP2qrAUVP6yk8bTtVsO
	nrcLXQECpjVLpt0zwOHgUTzA83weiS2ohlQNjO+uk5RpmABQ+pSNCYPpBNA40A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791907810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zJq8JxfE1u5dAwYp63/Krdm7jwWp1EzNhKxbOj04ukk=;
	b=vIOiHhHES31glFsQR9Pu0klXSPMFuFu5dp/W/aeFVd6TxoLfrobz3weOv0b7J03soAymww
	KOgRT79YfLh15RAQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	Nam Cao <namcao@linutronix.de>, linux-riscv@lists.infradead.org
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: arch/riscv/kernel/alternative.c:198:6: error: use of undeclared
 identifier '__vdso_alternatives_start_offset'; did you mean
 '__vdso_alternatives_start_cfi_offset'?
Message-ID: <20261013180342-b562676b-7fd8-433b-8d3f-a6daef549a5e@linutronix.de>
References: <202610131613.BpOi6VPp-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202610131613.BpOi6VPp-lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_091015_264595_DAA98763 
X-CRM114-Status: GOOD (  13.03  )
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

On Tue, Oct 13, 2026 at 05:01:07PM +0200, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> commit: 63aecaba41a4b2593697f208e91bf542248ec4f8 riscv: alternative: Use the statically extracted vDSO section offsets
> date:   10 weeks ago
> config: riscv-randconfig-r2104-20261013 (https://download.01.org/0day-ci/archive/20261013/202610131613.BpOi6VPp-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ce2a4984a3f43327a2b7c40baa74907bc10eb899)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610131613.BpOi6VPp-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 63aecaba41a4 ("riscv: alternative: Use the statically extracted vDSO section offsets")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610131613.BpOi6VPp-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> arch/riscv/kernel/alternative.c:198:6: error: use of undeclared identifier '__vdso_alternatives_start_offset'; did you mean '__vdso_alternatives_start_cfi_offset'?
>      198 |                                         __vdso_alternatives_start_offset,
>          |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          |                                         __vdso_alternatives_start_cfi_offset
>    arch/riscv/include/asm/vdso.h:29:15: note: '__vdso_alternatives_start_cfi_offset' declared here
>       29 | extern size_t __vdso_alternatives_start_cfi_offset, __vdso_alternatives_end_cfi_offset;
>          |               ^
> >> arch/riscv/kernel/alternative.c:199:6: error: use of undeclared identifier '__vdso_alternatives_end_offset'; did you mean '__vdso_alternatives_end_cfi_offset'?
>      199 |                                         __vdso_alternatives_end_offset);
>          |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          |                                         __vdso_alternatives_end_cfi_offset
>    arch/riscv/include/asm/vdso.h:29:53: note: '__vdso_alternatives_end_cfi_offset' declared here
>       29 | extern size_t __vdso_alternatives_start_cfi_offset, __vdso_alternatives_end_cfi_offset;
>          |                                                     ^
>    2 errors generated.

This looks to be a only a follow-up error.
The real issue is https://lore.kernel.org/all/20261009214501.GA905361@ax162/.
Which leads to no vDSO being generated and an empty vdso-offsets.h.
In addition to fixing the linked issue, we should also make sure that the build
properly aborts if one of the intermediate steps fails.

> vim +198 arch/riscv/kernel/alternative.c
> 
>    186	
>    187	void __init apply_boot_alternatives(void)
>    188	{
>    189		/* If called on non-boot cpu things could go wrong */
>    190		WARN_ON(smp_processor_id() != 0);
>    191	
>    192		_apply_alternatives((struct alt_entry *)__alt_start,
>    193				    (struct alt_entry *)__alt_end,
>    194				    RISCV_ALTERNATIVES_BOOT);
>    195	
>    196		if (IS_ENABLED(CONFIG_MMU))
>    197			apply_vdso_alternatives(vdso_start,
>  > 198						__vdso_alternatives_start_offset,
>  > 199						__vdso_alternatives_end_offset);
>    200	
>    201		if (IS_ENABLED(CONFIG_RISCV_USER_CFI))
>    202			apply_vdso_alternatives(vdso_cfi_start,
>    203						__vdso_alternatives_start_cfi_offset,
>    204						__vdso_alternatives_end_cfi_offset);
>    205	}
>    206	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
