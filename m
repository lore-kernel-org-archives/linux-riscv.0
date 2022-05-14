Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134AAC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 14 May 2022 05:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hF1wqyTD+nnRUSW6SQ0tZoDHMe113XASmhnHAn6I0Ro=; b=HmUfE9dTDkWtd2
	OnaPN/yB1bmqGGdLEpRXOzJHYZjoOIuymqp68g/CdKjqX1Cs1EQ78fUtpy6sb422iiUXh4ZeaxWTW
	/bEUL6LA9kWzdazFE9eEqvY5kWgZP8miUCciOAD4X2uV5Bn850NRm2B/u5o6AQB5TaW1gTQ3yTmbY
	Xc/LHOrVgifOQkTqnOVxcnipuyoqbRm+CxZZOJSS8MQRFLuv4SdMWtmj9AR/IW1Ew3pDIPDm3kjVt
	BjfJ4BV0AdnwAR3fR1/MGNnlrEzDC9nATOezN3eO/yR+MUhvmvt+4CcP3JwjRH3+7t5SD+pooiewb
	n3VLQDKyZ6QAwdGXS1tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npkIM-000pVx-2G; Sat, 14 May 2022 05:26:26 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npkII-000pTk-Pf
 for linux-riscv@lists.infradead.org; Sat, 14 May 2022 05:26:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652505982; x=1684041982;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vOr1s4hyuADKclZdkCj1gSHUqC2uPya1MjINyW1/PRI=;
 b=M4KITf8KTYJKnoXb6JBDqU6CUgA8o0uA/OOCV9dEf+RtF0EjQkG0zOsB
 jl3uWZGUF0MgMVI76jI+XwFQmq0EVCWHaB2NoDdMoMxSOWUXQoPiqdJZ2
 YXeGgAciX+T6VkQ8+roRI99JYRC+1oaXbneW7C7ehkG486lSVX9jxQlTH
 Vl7iQMZlFc0Jke+jdkPieduEfJ3vWM0S+VRbOzeQYc9BAGTK0pDaGB+/G
 LRzGn84uctm5HAImDApEYKsEdfSfG/21n3VTLNAJEbbNqoxHbYv15Flzx
 hiAud7qIbJsCSCLpPeGh2suTS93kihvA99tQ/yEj36Bk9jHGs8W0TYoLq Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="268060943"
X-IronPort-AV: E=Sophos;i="5.91,225,1647327600"; d="scan'208";a="268060943"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 22:26:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,225,1647327600"; d="scan'208";a="573282365"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 13 May 2022 22:26:20 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1npkIF-0000Fa-NV;
 Sat, 14 May 2022 05:26:19 +0000
Date: Sat, 14 May 2022 13:25:57 +0800
From: kernel test robot <lkp@intel.com>
To: Dao Lu <daolu@rivosinc.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, Dao Lu <daolu@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] arch/riscv: Add Zihintpause extension support
Message-ID: <202205141316.E2mCmmhu-lkp@intel.com>
References: <20220512033045.1101909-1-daolu@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220512033045.1101909-1-daolu@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_222622_911676_DE534925 
X-CRM114-Status: GOOD (  13.63  )
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

Hi Dao,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linux/master]
[also build test ERROR on linus/master v5.18-rc6 next-20220513]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Dao-Lu/arch-riscv-Add-Zihintpause-extension-support/20220512-113348
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git feb9c5e19e913b53cb536a7aa7c9f20107bb51ec
config: riscv-randconfig-r035-20220512 (https://download.01.org/0day-ci/archive/20220514/202205141316.E2mCmmhu-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 38189438b69ca27b4c6ce707c52dbd217583d046)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/ebdb085998220eb16e6815608a3a6d8f87711d28
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dao-Lu/arch-riscv-Add-Zihintpause-extension-support/20220512-113348
        git checkout ebdb085998220eb16e6815608a3a6d8f87711d28
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: section .text file range overlaps with __jump_table
   >>> .text range is [0x800, 0x1277]
   >>> __jump_table range is [0x878, 0x8D7]
--
>> ld.lld: error: section .text virtual address range overlaps with __jump_table
   >>> .text range is [0x800, 0x1277]
   >>> __jump_table range is [0x878, 0x8D7]
--
>> ld.lld: error: section .text load address range overlaps with __jump_table
   >>> .text range is [0x800, 0x1277]
   >>> __jump_table range is [0x878, 0x8D7]
--
>> ld.lld: error: section .text load address range overlaps with __jump_table
   >>> .text range is [0x800, 0x1277]
   >>> __jump_table range is [0x878, 0x8D7]
--
>> ld.lld: error: section .text load address range overlaps with __jump_table
   >>> .text range is [0x800, 0x1277]
   >>> __jump_table range is [0x878, 0x8D7]
   llvm-nm: error: arch/riscv/kernel/vdso/vdso.so.dbg: No such file or directory

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
