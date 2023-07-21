Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0EAEB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 20:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mch/PO0lBeHAvgxf51TTjC/3lCaiUXAFE4Hgi6Q7V+k=; b=hbJ9huBehk1Ely
	WycppdJ/FjUWb4oeWQj8xkBhJZYmxyJAnUw0X0UgFdV84OACoeK+QOGQ8obiDpSQey+xQfWTmP0jl
	ulXIkjVk4f1xNuUXhL1XNN25pJqLSkV2UXQB99C/vi4RnGWEJvON2bX4zyqj1L9TY4mz9oCqwgAeo
	QmTCjJGBq7KM8uuJegVkEWIuugyZLEbcHJscCuryarqSAU28MIkAsWExD9+4k6ZmoonWyPura0RaZ
	BFdQVupichS87SSVSSugCRlaGnkXRWmO/XIM7FeTeFjLKn1sIu78IoX5p1mAZj/ODrjaGD5e1HO6h
	eXfNA3D2IQo2y34nviBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMwIe-00F07O-2O;
	Fri, 21 Jul 2023 20:00:28 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMwIc-00F06m-0t;
	Fri, 21 Jul 2023 20:00:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689969626; x=1721505626;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UTAejJQPSuliS6ZdTpleNGEHMmmHZFob/eKQc45LiNc=;
  b=BcWoiLVuATErAr7vRP+LyzQYgC1kjBlbwcTUMjwMyiuRSD4pxVZey5dM
   RSk0PThY6vLN9dLZzyBIgkTIPggEgFKfqal1eJGg06SEi+Hqln7XdAMEV
   fEibUgBX/Hz50ju+VK2fNELBI5tCaewarNCaY9P42LPel/8UsCh/vYv2Z
   Rh2FsPGzXtOnfCwTNXUvTzm9Kcd7j/Pd79ssjLp6t5pyojXFDF3nQcm45
   aDqh9ZMumdZUYFyskgBMovF8V2WAHslWiLHK/06CrYhrKk49TJUGeONsc
   cuTqF+nIhF3TtiXeMKCzQrPEMOSFkCB/bp3XmWZqoFp+hTp1k+GLS9zC2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="347400023"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="347400023"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 13:00:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="795071770"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="795071770"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jul 2023 13:00:15 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMwIQ-0007bh-3D;
	Fri, 21 Jul 2023 20:00:14 +0000
Date: Sat, 22 Jul 2023 03:59:50 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel <ardb@kernel.org>,
	Kees Cook <keescook@chromium.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v5 3/5] arm64: libstub: Move KASLR handling functions to
 kaslr.c
Message-ID: <202307220314.ZZIxEjW2-lkp@intel.com>
References: <20230721074850.310644-4-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230721074850.310644-4-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_130026_329926_768E28CC 
X-CRM114-Status: GOOD (  18.60  )
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

Hi Alexandre,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.5-rc2 next-20230721]
[cannot apply to efi/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/riscv-Introduce-virtual-kernel-mapping-KASLR/20230721-155554
base:   linus/master
patch link:    https://lore.kernel.org/r/20230721074850.310644-4-alexghiti%40rivosinc.com
patch subject: [PATCH v5 3/5] arm64: libstub: Move KASLR handling functions to kaslr.c
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20230722/202307220314.ZZIxEjW2-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307220314.ZZIxEjW2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307220314.ZZIxEjW2-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/efi/libstub/kaslr.c: In function 'efi_kaslr_relocate_kernel':
>> drivers/firmware/efi/libstub/kaslr.c:155:9: error: implicit declaration of function 'efi_icache_sync'; did you mean 'efi_cache_sync_image'? [-Werror=implicit-function-declaration]
     155 |         efi_icache_sync(*image_addr, *image_addr + kernel_codesize);
         |         ^~~~~~~~~~~~~~~
         |         efi_cache_sync_image
   cc1: some warnings being treated as errors


vim +155 drivers/firmware/efi/libstub/kaslr.c

    87	
    88	/**
    89	 * efi_kaslr_relocate_kernel() - Relocate the kernel (random if KASLR enabled)
    90	 * @image_addr: Pointer to the current kernel location
    91	 * @reserve_addr:	Pointer to the relocated kernel location
    92	 * @reserve_size:	Size of the relocated kernel
    93	 * @kernel_size:	Size of the text + data
    94	 * @kernel_codesize:	Size of the text
    95	 * @kernel_memsize:	Size of the text + data + bss
    96	 * @phys_seed:		Random seed used for the relocation
    97	 *
    98	 * If KASLR is not enabled, this function relocates the kernel to a fixed
    99	 * address (or leave it as its current location). If KASLR is enabled, the
   100	 * kernel physical location is randomized using the seed in parameter.
   101	 *
   102	 * Return:	status code, EFI_SUCCESS if relocation is successful
   103	 */
   104	efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
   105					       unsigned long *reserve_addr,
   106					       unsigned long *reserve_size,
   107					       unsigned long kernel_size,
   108					       unsigned long kernel_codesize,
   109					       unsigned long kernel_memsize,
   110					       u32 phys_seed)
   111	{
   112		efi_status_t status;
   113		u64 min_kimg_align = efi_get_kimg_min_align();
   114	
   115		if (IS_ENABLED(CONFIG_RANDOMIZE_BASE) && phys_seed != 0) {
   116			/*
   117			 * If KASLR is enabled, and we have some randomness available,
   118			 * locate the kernel at a randomized offset in physical memory.
   119			 */
   120			status = efi_random_alloc(*reserve_size, min_kimg_align,
   121						  reserve_addr, phys_seed,
   122						  EFI_LOADER_CODE);
   123			if (status != EFI_SUCCESS)
   124				efi_warn("efi_random_alloc() failed: 0x%lx\n", status);
   125		} else {
   126			status = EFI_OUT_OF_RESOURCES;
   127		}
   128	
   129		if (status != EFI_SUCCESS) {
   130			if (!check_image_region(*image_addr, kernel_memsize)) {
   131				efi_err("FIRMWARE BUG: Image BSS overlaps adjacent EFI memory region\n");
   132			} else if (IS_ALIGNED(*image_addr, min_kimg_align) &&
   133				   (u64)_end < EFI_ALLOC_LIMIT) {
   134				/*
   135				 * Just execute from wherever we were loaded by the
   136				 * UEFI PE/COFF loader if the placement is suitable.
   137				 */
   138				*reserve_size = 0;
   139				return EFI_SUCCESS;
   140			}
   141	
   142			status = efi_allocate_pages_aligned(*reserve_size, reserve_addr,
   143							    ULONG_MAX, min_kimg_align,
   144							    EFI_LOADER_CODE);
   145	
   146			if (status != EFI_SUCCESS) {
   147				efi_err("Failed to relocate kernel\n");
   148				*reserve_size = 0;
   149				return status;
   150			}
   151		}
   152	
   153		memcpy((void *)*reserve_addr, (void *)*image_addr, kernel_size);
   154		*image_addr = *reserve_addr;
 > 155		efi_icache_sync(*image_addr, *image_addr + kernel_codesize);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
