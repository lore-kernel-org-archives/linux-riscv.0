Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E8BC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Oct 2022 00:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2TMnvPLuEMlcQMlmGmNm9t8DoRoZx0hxuM6kMKduR3s=; b=4JCk94hoHbisw+pF7GKWSPlhI5
	tK2NEjL/w1atqg7Qhaj187C/v8qGWvPoyZXxATTy18ZnTWT6O3zvb1p7TS64KRbM9UINgXGVyCzI+
	2zS5+bQKHNLa3LCYd4f1W1Be7RcahgEDQ8YzV6LDbau1NBihLtM1WaNBxW6pdvaDI7fCTI1XOUyMu
	9kdwpDgiy7eSTm0NNuQypP6D3fBQbW+5nHVSafjbmBMrpOalMI0NUlz3zHGXu0i/1HymjqFVkh0Eh
	zvvJsLmx6yvwvjLID3nhprYUYQ6e8+dl3poWAovfaryh4CYYfPs5AHl91Xqd21xlJ4/O9BEjyrnDq
	Gg+HFfAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olgHZ-003ETP-I3; Fri, 21 Oct 2022 00:53:05 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olgHX-003ERv-6Q; Fri, 21 Oct 2022 00:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666313583; x=1697849583;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=t8eukQQRNGfAZeDiwMZwSJzWT294/JgXyPrPo/qNp6g=;
  b=BYiKaWQ20Z6UJbR/g1PEePd6eDzjh3HLiQx8i4xQ9fFJUhXzCBDWTkms
   DsdHtvqhFlGJsCxVMUZ10Ek04G2xizlan08/UMM+rQivWawq+BpAUuMbv
   WxZ8LdJhlAailhrKmhxOXDmkKN6Wr2fM51bBWzmZ+xGjeCL7VBvbzaf34
   I4sYepk+tI+x9BfdFWcNPgHlMSyh8l0/bWMrYeZkkpeNvcUPbm9wfGdGl
   57jfx6bbhdbbivigOJ4yclsU2+sV4q6gLHuUWeYbOg5vZXCnpHPdaDoAH
   YvunYVglyxv5OSAQCAa6sGLr6XEPJx8l7iNsE6VQdVpEnpQcm9aGGWPvd
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="308562629"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; 
   d="scan'208";a="308562629"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 17:52:50 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="608037424"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; 
   d="scan'208";a="608037424"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.249.172.222]) ([10.249.172.222])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 17:52:42 -0700
Subject: Re: [kbuild-all] Re: [PATCH] PCI: Remove unnecessary of_irq.h
 includes
To: Bjorn Helgaas <helgaas@kernel.org>, kernel test robot <lkp@intel.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, llvm@lists.linux.dev,
 Minghuan Lian <minghuan.Lian@nxp.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
 Toan Le <toan@os.amperecomputing.com>, linux-riscv@lists.infradead.org,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Joyce Ooi <joyce.ooi@intel.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 Shawn Lin <shawn.lin@rock-chips.com>, Ray Jui <rjui@broadcom.com>,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
 Michal Simek <monstr@monstr.eu>, kbuild-all@lists.01.org,
 Scott Branden <sbranden@broadcom.com>,
 Daire McNa mara <daire.mcnamara@microchip.com>,
 linux-kernel@vger.kernel.org, Tom Joseph <tjoseph@cadence.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20221020150731.GA121202@bhelgaas>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <9ac1f194-cef3-68bf-25e2-4bc6c0dbefce@intel.com>
Date: Fri, 21 Oct 2022 08:52:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20221020150731.GA121202@bhelgaas>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_175303_317258_310C11A1 
X-CRM114-Status: GOOD (  16.71  )
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



On 10/20/2022 11:07 PM, Bjorn Helgaas wrote:
> On Thu, Oct 20, 2022 at 10:13:10PM +0800, kernel test robot wrote:
>> Hi Bjorn,
>>
>> I love your patch! Yet something to improve:
>>
>> [auto build test ERROR on helgaas-pci/next]
>> [also build test ERROR on xilinx-xlnx/master rockchip/for-next linus/master v6.1-rc1 next-20221020]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Bjorn-Helgaas/PCI-Remove-unnecessary-of_irq-h-includes/20221020-100633
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
>> patch link:    https://lore.kernel.org/r/20221019195452.37606-1-helgaas%40kernel.org
>> patch subject: [PATCH] PCI: Remove unnecessary of_irq.h includes
>> config: s390-randconfig-r044-20221019
>> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # install s390 cross compiling tool for clang build
>>          # apt-get install binutils-s390x-linux-gnu
>>          # https://github.com/intel-lab-lkp/linux/commit/273a24b16a40ffd6a64c6c55aecbfae00a1cd996
>>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>>          git fetch --no-tags linux-review Bjorn-Helgaas/PCI-Remove-unnecessary-of_irq-h-includes/20221020-100633
>>          git checkout 273a24b16a40ffd6a64c6c55aecbfae00a1cd996
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/pci/controller/
> 
> Maybe more user error?
> 
>    $ COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/pci/controller/
>    Compiler will be installed in /home/bjorn/0day
>    make --keep-going HOSTCC=/home/bjorn/0day/clang/bin/clang CC=/home/bjorn/0day/clang/bin/clang OBJCOPY=/usr/s390x-linux-gnu/bin/objcopy AR=llvm-ar NM=llvm-nm STRIP=llvm-strip OBJDUMP=llvm-objdump OBJSIZE=llvm-size READELF=llvm-readelf HOSTCXX=clang++ HOSTAR=llvm-ar CROSS_COMPILE=s390x-linux-gnu- --jobs=16 W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/pci/controller/
>    make[1]: Entering directory '/home/bjorn/linux/build_dir'
>      SYNC    include/config/auto.conf.cmd
>      GEN     Makefile
>    scripts/Kconfig.include:40: linker 's390x-linux-gnu-ld' not found


Hi Bjorn,

You may need to install the below package, or similar package for other OS:

$ dpkg -S /usr/bin/s390x-linux-gnu-ld
binutils-s390x-linux-gnu: /usr/bin/s390x-linux-gnu-ld

 >>          # install s390 cross compiling tool for clang build
 >>          # apt-get install binutils-s390x-linux-gnu

Best Regards,
Rong Chen

>    make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
>    make[2]: *** [../Makefile:697: syncconfig] Error 2
>    make[1]: *** [/home/bjorn/linux/Makefile:798: include/config/auto.conf.cmd] Error 2
>    make[1]: Failed to remake makefile 'include/config/auto.conf.cmd'.
>    make[1]: Failed to remake makefile 'include/config/auto.conf'.
>      GEN     Makefile
>    Error: kernelrelease not valid - run 'make prepare' to update it
>    ../scripts/mkcompile_h: 19: s390x-linux-gnu-ld: not found
>    make[1]: Target 'drivers/pci/controller/' not remade because of errors.
>    make[1]: Leaving directory '/home/bjorn/linux/build_dir'
>    make: *** [Makefile:231: __sub-make] Error 2
>    make: Target 'drivers/pci/controller/' not remade because of errors.
> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
