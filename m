Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373C2C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 10:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yR2TE6se3It8kExW6tceCEPpu4MrynKHQgr+JHFo/oU=; b=TN3/RK5ZVY61Vl
	ykd9qYSb1fJOVB8zH4mUh6AzsGoLyoJ/WEtt8kcLPsmjR97c77431xqgB3w8WGaJK5RivibFiQVti
	kAJ28LnB0L5mcyx4Xnlv5KHVN4xrmz7sO0CzQ+LKrmGF4dtEKpoKO/cwwCEa336mlyCr5tN+BrprL
	15FCV1mTslY2OyKTnbmJVuD/q5IIatEQQDQAgk/0RXxfxQGYpV4yUyx0+ZFZeSZKB7f72oelH2bSn
	oTKb7RKd0J/KO+jYl3cD5vi3i2GVin+7YPUKqxpFOkItOH0L7hkVKB7NxdrxuKZtWUg652j+Dj94m
	D+o+GTwBZwwACAnF1N3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1kmw-000000061Xv-0GwJ;
	Tue, 30 Apr 2024 10:32:42 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1kmt-000000061Wj-0gpy
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 10:32:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714473159; x=1746009159;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TOsha8tZbWHodSCSOeDar0KTCBzSwyaa+6PzT/MvwQE=;
  b=KkrtKEQM7aw9WChLEVUlqEk8OM4xe67hy1kHVFmDuNcvDWMh4PqsCFUd
   gPH/3oVgw5YE27ph0Y6iHQwIcHnJXE15zLU4q5AOxXskaWZpeFGu98FKs
   IrGpZe2b2Ha2AKsUDlQvczn/V49f/ITOrRH2546j6IIu42KVmMnuJD9nM
   bQQvnv0Xt0UVTN94cuEMJefBKw427oHWwP3wqf1bqF+3qQ1rc0erN9VgZ
   IeWkdp2+O5h4Qz25fBxzYIoPaAXU+ZxBTU4Kbzulwo4rE32Db26dhElfi
   b6Lt77PANMv5u+OwYdy+zUJ2m1DnKDvHxGbvinOfN9ruv8Hr8Bd2HKn1R
   w==;
X-CSE-ConnectionGUID: 8fB4HjlSRv2wqJ5QxML+fw==
X-CSE-MsgGUID: uyTL3gtzQ1yIEQfrh7CauQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="13954782"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="13954782"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 03:32:39 -0700
X-CSE-ConnectionGUID: awcwGRgfS4qieBRaGoUYIQ==
X-CSE-MsgGUID: /22euhvsR3qjzsVbZojErg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="27031455"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Apr 2024 03:32:34 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1kml-00082F-2h;
	Tue, 30 Apr 2024 10:32:31 +0000
Date: Tue, 30 Apr 2024 18:31:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, broonie@kernel.org,
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, unicorn_wang@outlook.com,
	inochiama@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: oe-kbuild-all@lists.linux.dev, dlan@gentoo.org,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Subject: Re: [PATCH v1 2/2] spi: add support for sophgo spi-nor controller
Message-ID: <202404301801.fGGuCYoT-lkp@intel.com>
References: <20240427075426.662671-3-qiujingbao.dlmu@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240427075426.662671-3-qiujingbao.dlmu@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_033239_264447_7B5D2B03 
X-CRM114-Status: UNSURE (   9.51  )
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

Hi Jingbao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4cece764965020c22cff7665b18a012006359095]

url:    https://github.com/intel-lab-lkp/linux/commits/Jingbao-Qiu/dt-bindings-mtd-add-sophgo-spi-nor-controller/20240427-155533
base:   4cece764965020c22cff7665b18a012006359095
patch link:    https://lore.kernel.org/r/20240427075426.662671-3-qiujingbao.dlmu%40gmail.com
patch subject: [PATCH v1 2/2] spi: add support for sophgo spi-nor controller
config: powerpc-randconfig-r111-20240430 (https://download.01.org/0day-ci/archive/20240430/202404301801.fGGuCYoT-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20240430/202404301801.fGGuCYoT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404301801.fGGuCYoT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/spi/spi-sophgo-cv1800.c:259:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] addr @@     got restricted __be32 [usertype] @@
   drivers/spi/spi-sophgo-cv1800.c:259:22: sparse:     expected unsigned int [usertype] addr
   drivers/spi/spi-sophgo-cv1800.c:259:22: sparse:     got restricted __be32 [usertype]

vim +259 drivers/spi/spi-sophgo-cv1800.c

   244	
   245	static int sophgo_nor_port_trans(struct sophgo_nor *spif,
   246					 const struct spi_mem_op *op)
   247	{
   248		const uint8_t *dout = NULL;
   249		uint8_t *din = NULL;
   250		uint32_t addr;
   251	
   252		sophgo_nor_config_port(spif, 1);
   253	
   254		if (op->cmd.nbytes)
   255			sophgo_nor_xfer(spif, (uint8_t *)&op->cmd.opcode, NULL,
   256					op->cmd.nbytes, op->cmd.buswidth);
   257	
   258		if (op->addr.nbytes) {
 > 259			addr = cpu_to_be32(op->addr.val);
   260			sophgo_nor_xfer(spif, (uint8_t *)&addr, NULL, op->addr.nbytes,
   261					op->addr.buswidth);
   262		}
   263	
   264		if (op->data.dir == SPI_MEM_DATA_IN)
   265			din = op->data.buf.in;
   266		else if (op->data.dir == SPI_MEM_DATA_OUT)
   267			dout = op->data.buf.out;
   268	
   269		sophgo_nor_xfer(spif, dout, din, op->data.nbytes, op->data.buswidth);
   270	
   271		sophgo_nor_config_port(spif, 0);
   272	
   273		return 0;
   274	}
   275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
