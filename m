Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3ADC64ED8
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Feb 2023 01:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cw4T83bWSsezY2ssUs9D8FDlVPfQOjXxWxIWBWEf9HY=; b=3nHFb+KfqFWcne
	x8WbuC/fbl3Y9vwapqSIhtBC+0One6kPo37dQgFk1Q4HkdxT0GQdPdOZkzIagujLhOWpx5TT6APcO
	yWdJ7ga17FEJoqKt6B/8/BhxnTCRSxRfpyCIVVnjobCiIZMrdh+ToTFC7X/DCj0BjDzleUO8anyi/
	BM/lzComQiF05+XY0SG8QgcGatP1R1ACjSRNx11sFRCFhh+GvBBtzdpvRA/lygDi17aVcQR0xiWVU
	QK8B5uGzoeJW+2zzdqSKmfoHg6h7V5i0JHlOiHc4bvJN1138N7cBtnFGBzoudXvjQS5yaqDQW9BgT
	yZ+GXpt6QXzw0ftlft1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVjSI-004YAs-9J; Sat, 25 Feb 2023 01:34:30 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVjSB-004Y97-71; Sat, 25 Feb 2023 01:34:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677288863; x=1708824863;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vxe6CDj1Lm1+rHMcUhTMcojlb9dqwqcr/HMs0NPEDxg=;
  b=Dpuo5qm8L1cHhR3pPInuOh/zCQhyks7FsyimJpZ3qThmbuo4OO5iSOlK
   CFGYlshTQlWAD6olQ6syGXpe1C+VT63JS69rW56+AwuKui0jcVgLLFP5c
   DvACW9j9oiHrHxrS+q33Vo2ASi+/upPHyVuJt4dChWty0peQIt6UsX6Cr
   n3h8tulWnTaWXSuEjQfCFyLkrhrywExmTzxh7Dbzbpc1p5RblSRqIMTyR
   KlA//KZgqeN+T4bhNGOrNJiPRJLTQyBxE+nezEWFDitQkNTrxKlwWDFpY
   BVQuQ9iG0RLUNCwCNEo623PT+pTPtiHBfy2B3WW4NxckHpkCpOMe6brzg
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="332306948"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="332306948"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 17:34:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="815926834"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="815926834"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Feb 2023 17:34:13 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVjS0-0002qB-3B;
	Sat, 25 Feb 2023 01:34:12 +0000
Date: Sat, 25 Feb 2023 09:33:30 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH -next v14 19/19] riscv: Enable Vector code to be built
Message-ID: <202302250924.ukv4ZxOc-lkp@intel.com>
References: <20230224170118.16766-20-andy.chiu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230224170118.16766-20-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_173423_363498_2D0AF89F 
X-CRM114-Status: GOOD (  11.44  )
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

Hi Andy,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20230224]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Chiu/riscv-Rename-__switch_to_aux-fpu/20230225-011059
patch link:    https://lore.kernel.org/r/20230224170118.16766-20-andy.chiu%40sifive.com
patch subject: [PATCH -next v14 19/19] riscv: Enable Vector code to be built
config: riscv-randconfig-r014-20230222 (https://download.01.org/0day-ci/archive/20230225/202302250924.ukv4ZxOc-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/cd0ad21a9ef9d63f1eef80fd3b09ae6e0d884ce3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Chiu/riscv-Rename-__switch_to_aux-fpu/20230225-011059
        git checkout cd0ad21a9ef9d63f1eef80fd3b09ae6e0d884ce3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash lib/zstd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302250924.ukv4ZxOc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
--
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
--
   lib/zstd/compress/huf_compress.c:471:16: warning: unused function 'HUF_isSorted' [-Wunused-function]
   MEM_STATIC int HUF_isSorted(nodeElt huffNode[], U32 const maxSymbolValue1) {
                  ^
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   1 warning generated.
--
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
--
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
--
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
--
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
--
   lib/zstd/compress/zstd_lazy.c:835:16: warning: unused function 'ZSTD_isAligned' [-Wunused-function]
   MEM_STATIC int ZSTD_isAligned(void const* ptr, size_t align) {
                  ^
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   1 warning generated.
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
