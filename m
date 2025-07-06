Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D714C83F05
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jul 2025 14:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zh5GK7Tz4BwIBCx0uZqHrv59G+fBRzZczlbBvN8BZbk=; b=3ixKXM+hKQU6M3
	Y/On836OdQt/A2DO1lOOrvC6yxV1weaRZWHcDRss4Eqvf484khxtwrG4PBIFwF23WH+hgwA3WKF18
	CTjGk6RK3NULB5obC8UaGFBcrn19zWhgjtvNtTVAeVTP1bwX/W4nlZk9eKd14F1aeZu3Cjmwju8+Z
	CnRUzsJzQcqV/OB0KooybAkIabKFAHcOMOJtnDbb0X+t+D3mtenjQjxL4YlZtJjNs3GKwOPU++++/
	KnFBXWtjwp6Z454SHhvtUtbCThOwVS1guxf00H8rvplW2eCCv8Z8ykn1SAIcUvoOl3z9zZyn6W2V0
	uCAl9Jw760fcCb+Rzo9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYPxZ-00000000M0O-0PjS;
	Sun, 06 Jul 2025 14:03:13 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYPMV-00000000I8O-2zuf
	for linux-riscv@lists.infradead.org;
	Sun, 06 Jul 2025 13:24:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751808296; x=1783344296;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MDngCFoCTSnVbqNfTg5aaI5DnhuGTd8SytOekmkV6Cs=;
  b=JDXqYLrav5t5wY7fQt+BqPDNzttJDtWGjWLfWwZ0OkrFgnd/swVmNPa6
   HXGls7BRMJGBdLMAzd6JWjh6VVnuWOZSkl1YZ4BwgWaUruIAQRDU/9gal
   CI9vq2HvCaMWApuZl/+yY5OlGcmmf4lurxZ1k8Mi2KqWOGeU9TVxY7UmC
   mAQ0it/4aerAqQr6YgI4W0jglwR9OiEedxi5CMB8Ror+HiNv5y5FDZWDd
   c5YTOKy2zs5W6Qo2AGRIliZfsAUOaWjHgt2/Pwf3/gJiHXYYTTRaSpcAx
   8wDi55agC4HmSl727DV8DJ61HNa2KW3Gi3gwHTMLkKo9sqlumlxeoZbUf
   Q==;
X-CSE-ConnectionGUID: C57s3xi3To+i9RqCvTTgyw==
X-CSE-MsgGUID: ZzQwTp/qSAeOHLI6POSFpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="54140953"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="54140953"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 06:24:53 -0700
X-CSE-ConnectionGUID: Xw4K0rOhRh680MdnnNbYPg==
X-CSE-MsgGUID: YxEJnjw6QFq1Ro5vTH9LLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="154738214"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Jul 2025 06:24:49 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYPMN-00054J-1F;
	Sun, 06 Jul 2025 13:24:47 +0000
Date: Sun, 6 Jul 2025 21:24:31 +0800
From: kernel test robot <lkp@intel.com>
To: Khalid Ali <khaliidcaliy@gmail.com>, ardb@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	gargaditya08@live.com, jonathan@marek.ca, kees@kernel.org,
	linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org,
	lukas@wunner.de, linux-kernel@vger.kernel.org,
	Khalid Ali <khaliidcaliy@gmail.com>
Subject: Re: [PATCH v2 2/2] efi/libstub: Print uefi status code on error
 messages
Message-ID: <202507062122.z20qLlyi-lkp@intel.com>
References: <20250706100147.1447-1-khaliidcaliy@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250706100147.1447-1-khaliidcaliy@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_062455_790240_8FBC8992 
X-CRM114-Status: GOOD (  12.69  )
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

Hi Khalid,

kernel test robot noticed the following build warnings:

[auto build test WARNING on efi/next]
[also build test WARNING on linus/master v6.16-rc4 next-20250704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Khalid-Ali/efi-libstub-Print-uefi-status-code-on-error-messages/20250706-180349
base:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
patch link:    https://lore.kernel.org/r/20250706100147.1447-1-khaliidcaliy%40gmail.com
patch subject: [PATCH v2 2/2] efi/libstub: Print uefi status code on error messages
config: loongarch-randconfig-001-20250706 (https://download.01.org/0day-ci/archive/20250706/202507062122.z20qLlyi-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507062122.z20qLlyi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507062122.z20qLlyi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/efi/libstub/efi-stub.c:117:70: warning: variable 'status' is uninitialized when used here [-Wuninitialized]
     117 |                 efi_err("getting command line via LOADED_IMAGE_PROTOCOL: 0x%lx\n", status);
         |                                                                                    ^~~~~~
   drivers/firmware/efi/libstub/efistub.h:75:39: note: expanded from macro 'efi_err'
      75 |         efi_printk(KERN_ERR "ERROR: " fmt, ##__VA_ARGS__)
         |                                              ^~~~~~~~~~~
   drivers/firmware/efi/libstub/efi-stub.c:108:21: note: initialize the variable 'status' to silence this warning
     108 |         efi_status_t status;
         |                            ^
         |                             = 0
   1 warning generated.


vim +/status +117 drivers/firmware/efi/libstub/efi-stub.c

   104	
   105	efi_status_t efi_handle_cmdline(efi_loaded_image_t *image, char **cmdline_ptr)
   106	{
   107		char *cmdline __free(efi_pool) = NULL;
   108		efi_status_t status;
   109	
   110		/*
   111		 * Get the command line from EFI, using the LOADED_IMAGE
   112		 * protocol. We are going to copy the command line into the
   113		 * device tree, so this can be allocated anywhere.
   114		 */
   115		cmdline = efi_convert_cmdline(image);
   116		if (!cmdline) {
 > 117			efi_err("getting command line via LOADED_IMAGE_PROTOCOL: 0x%lx\n", status);
   118			return EFI_OUT_OF_RESOURCES;
   119		}
   120	
   121		if (!IS_ENABLED(CONFIG_CMDLINE_FORCE)) {
   122			status = efi_parse_options(cmdline);
   123			if (status != EFI_SUCCESS) {
   124				efi_err("Failed to parse EFI load options: 0x%lx\n", status);
   125				return status;
   126			}
   127		}
   128	
   129		if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) ||
   130		    IS_ENABLED(CONFIG_CMDLINE_FORCE) ||
   131		    cmdline[0] == 0) {
   132			status = efi_parse_options(CONFIG_CMDLINE);
   133			if (status != EFI_SUCCESS) {
   134				efi_err("Failed to parse built-in command line: 0x%lx\n", status);
   135				return status;
   136			}
   137		}
   138	
   139		*cmdline_ptr = no_free_ptr(cmdline);
   140		return EFI_SUCCESS;
   141	}
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
