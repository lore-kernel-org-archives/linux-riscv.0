Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA35C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Oct 2022 00:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AF2fzSIgE67H1ETW8C3o8c1LK4bJ/yQI55W5goGlb8s=; b=ANTxTwk0Gack0/GnQxRHk9/riv
	Naw9j8U08GiPZ9S7zJbRduyEiQ4JPvTe9eTc1cmHpI6nnnMsDkSGBz27ia2/sOANyfu/kSyl2CFaY
	W4lqHTaPG0kbdN2xIj+LD8Esd1thF1SGmLh6GYVNXVZMbacfQs26+mq6SwDtejk6tbA6YKwvOKSFF
	MdPCA+uwhvBPCb9WpW6e7WfN8U/0xM6RmN5YHjavIKiGI5cCuh7aN3c57FHwG4YDSU4Hl/OoCUmHj
	JGtwrqHxJHTJffzV7XEPgv6AYA4YJ04Poj64F7Ur3DY8ZwcWcMKkccrxhNFGKhdAs/1BjHDjvyCZ0
	Ul2S+NuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olgEw-003DlL-8p; Fri, 21 Oct 2022 00:50:22 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olgEt-003Djr-U4
	for linux-riscv@lists.infradead.org; Fri, 21 Oct 2022 00:50:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666313419; x=1697849419;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=EouB8ThNo2sWMhfV1Mcpy1sEPBvn+PIid4ogFAJ3BJg=;
  b=fanSnIOBNCMqAdVurKF14tobhR5Xl7DSco0AmR2wK+CNoGv1qtSfsHCN
   VAlPQom44PvUHcNDFKWdlJX9J/mLluoSNHcN3XHdx+cequDCekjn5W9L8
   th/AKlp8TuzxsiUms/QQ77X6WT8vv+I5oypKMsD9onqZQbXfDaXKZ7tby
   MP1IUo6o2HhFMcYXdBHoAZcau6lA0lJuB3FaTs5l8IFhuiCbWJdZjApx7
   aaHQRIvlwbJ8i5Rqo/l5f4GehzjL7KebUtngFAwSI1HMGKz5XNkWYA70u
   qaRGss0u+Bm7KnkIaVLzVSZYsBnh+iySnYbwyuXoSdHFBCSLTLC2w7mmF
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="307976274"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; 
   d="scan'208";a="307976274"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 17:49:57 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="661274898"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; 
   d="scan'208";a="661274898"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.249.172.222]) ([10.249.172.222])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 17:49:49 -0700
Subject: Re: [kbuild-all] Re: [PATCH] PCI: Remove unnecessary of_irq.h
 includes
To: Bjorn Helgaas <helgaas@kernel.org>, kernel test robot <lkp@intel.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, kbuild-all@lists.01.org,
 Kishon Vijay Abraham I <kishon@kernel.org>, Tom Joseph
 <tjoseph@cadence.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>,
 Roy Zang <roy.zang@nxp.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Toan Le <toan@os.amperecomputing.com>, Joyce Ooi <joyce.ooi@intel.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
 Michal Simek <monstr@monstr.eu>, bcm-kernel-feedback-list@broadcom.com,
 linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
 "linux-ar m-kernel"@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20221020134101.GA90102@bhelgaas>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <7e7d18e2-17a2-9b61-4b3c-252556f8b6be@intel.com>
Date: Fri, 21 Oct 2022 08:49:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20221020134101.GA90102@bhelgaas>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_175020_116419_52674500 
X-CRM114-Status: GOOD (  17.12  )
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



On 10/20/2022 9:41 PM, Bjorn Helgaas wrote:
> On Thu, Oct 20, 2022 at 04:09:37PM +0800, kernel test robot wrote:
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
>> config: ia64-randconfig-r026-20221020
>> compiler: ia64-linux-gcc (GCC) 12.1.0
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # https://github.com/intel-lab-lkp/linux/commit/273a24b16a40ffd6a64c6c55aecbfae00a1cd996
>>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>>          git fetch --no-tags linux-review Bjorn-Helgaas/PCI-Remove-unnecessary-of_irq-h-includes/20221020-100633
>>          git checkout 273a24b16a40ffd6a64c6c55aecbfae00a1cd996
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/pci/controller/
> 
> FYI, the instructions above didn't work for me.  Missing "config".
> 
>    $ git remote add linux-review https://github.com/intel-lab-lkp/linux
>    $ git fetch --no-tags linux-review Bjorn-Helgaas/PCI-Remove-unnecessary-of_irq-h-includes/20221020-100633
>    $ git checkout 273a24b16a40ffd6a64c6c55aecbfae00a1cd996
>    HEAD is now at 273a24b16a40 PCI: Remove unnecessary of_irq.h includes
>    $ mkdir build_dir && cp config build_dir/.config
>    cp: cannot stat 'config': No such file or directory
> 
>    $ COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/pci/controller/
>    Compiler will be installed in /home/bjorn/0day
>    Cannot find ia64-linux under https://download.01.org/0day-ci/cross-package check /tmp/0day-ci-crosstool-files

Hi Bjorn,

Sorry for the inconvenience, the 01.org website is unstable recently, 
could you try 
"URL=https://cdn.kernel.org/pub/tools/crosstool/files/bin/x86_64 
COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 
O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/pci/controller/"?

Best Regards,
Rong Chen

>    Please set new url, e.g. export URL=https://cdn.kernel.org/pub/tools/crosstool/files/bin/x86_64
>    gcc crosstool install failed
>    Install gcc cross compiler failed
>    setup_crosstool failed
> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
