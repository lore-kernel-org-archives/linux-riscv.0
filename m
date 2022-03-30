Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B30C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Mar 2022 13:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T1PHp5CIvjP97FRRV4rQ7FHKttHCxagTy05a4vEyXAI=; b=cl5StcH/PMCAQs
	BLi40/IcXk/DoJ4CEfZUFr+awMWKFpZcrFeVwZ348TvoPkDRdw6VQWRGQjRz8NEr/olnEexKbC7Dj
	8fCl9E+mOGJAzLrG0gxJOFe2h1Q1lM/kApZioyOI/yacEJI1fO0BFelnFGdbN+FZKyY5GqHOSiyk0
	cCUPapglvAJvViO67aDCBzCt/JBnojwZtx+r4hR4BLlZL76b8VSzQHmgGjVyXd+DZLUbM7WfN0Uq4
	EL2aYEY1RehlZ7HNdiBhqtmWO5fnXPAotPl6pn6N/6UvAX+FKSod+Z74Z+CD5nJS9Y7PYzm2WyYxm
	0zK5TMPy7m/WKUznzj5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZYOu-00G5fn-9E; Wed, 30 Mar 2022 13:30:16 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZYOq-00G5df-5G; Wed, 30 Mar 2022 13:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648647012; x=1680183012;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=f9XSMKO8oo14JJdj7xhUYlZZTp0yFo4MzZJwC0dmP+k=;
 b=n+dF2cANwF/G15B31jjhKGHBmB9yfBcSpE4sX0eSiH+kS4jrjXMNVH7Y
 28WO78PjI/Zcz+tYAMDbDITZwg6ccDDlXe76CPL+QrXTXlbnzAKECmZ7l
 LnaJ7v9Cyq7HZmk+VaYZaKSDyC/XhANqqTMlV0wuQ9kwBncoG8j+GDjxl
 conzUAEaWFLVUPdMFw/ptbWkMgrWi0IuyqQVHIZ0MbxKtwQTAXZBVYEU3
 OqKvKZqpdqhJF9IvRnRQWmJ5Ig+hC/CSIAXIfZmR7dtqCixpgl5Mz8vT9
 Dnb1t5FtKblJoo4vUVhIs7c52ZvpkL1oNvB9v35gjzWbso2YjzrRBVxUK g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="322721725"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="322721725"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 06:30:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="519677516"
Received: from lkp-server02.sh.intel.com (HELO 56431612eabd) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 30 Mar 2022 06:30:04 -0700
Received: from kbuild by 56431612eabd with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nZYOh-00001U-Gq;
 Wed, 30 Mar 2022 13:30:03 +0000
Date: Wed, 30 Mar 2022 21:29:57 +0800
From: kernel test robot <lkp@intel.com>
To: Li Zhengyu <lizhengyu3@huawei.com>, liaochang1@huawei.com
Cc: kbuild-all@lists.01.org, alex@ghiti.fr, aou@eecs.berkeley.edu,
 bjorn.topel@gmail.com, changbin.du@intel.com, ebiederm@xmission.com,
 guoren@linux.alibaba.com, jszhang@kernel.org,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, mick@ics.forth.gr,
 palmer@dabbelt.com, paul.walmsley@sifive.com, penberg@kernel.org,
 sunnanyong@huawei.com, wangkefeng.wang@huawei.com
Subject: Re: [PATCH v2 -next 5/6] RISC-V: Add purgatory
Message-ID: <202203302109.2IHqpKOe-lkp@intel.com>
References: <20220330081701.177026-6-lizhengyu3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220330081701.177026-6-lizhengyu3@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_063012_335338_79C916C5 
X-CRM114-Status: GOOD (  12.08  )
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

Hi Li,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20220329]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-Zhengyu/riscv-kexec-add-kexec_file_load-support/20220330-162008
base:    c2528a0cdebd8ba7ef30e0655f8ea89f34c3a633
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20220330/202203302109.2IHqpKOe-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f59da20dab679116176a82c5b23517ce69584123
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Li-Zhengyu/riscv-kexec-add-kexec_file_load-support/20220330-162008
        git checkout f59da20dab679116176a82c5b23517ce69584123
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/purgatory/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/riscv/purgatory/purgatory.c:20:5: warning: no previous prototype for 'verify_sha256_digest' [-Wmissing-prototypes]
      20 | int verify_sha256_digest(void)
         |     ^~~~~~~~~~~~~~~~~~~~
>> arch/riscv/purgatory/purgatory.c:36:6: warning: no previous prototype for 'purgatory' [-Wmissing-prototypes]
      36 | void purgatory(void)
         |      ^~~~~~~~~


vim +/verify_sha256_digest +20 arch/riscv/purgatory/purgatory.c

    19	
  > 20	int verify_sha256_digest(void)
    21	{
    22		struct kexec_sha_region *ptr, *end;
    23		struct sha256_state ss;
    24		u8 digest[SHA256_DIGEST_SIZE];
    25	
    26		sha256_init(&ss);
    27		end = purgatory_sha_regions + ARRAY_SIZE(purgatory_sha_regions);
    28		for (ptr = purgatory_sha_regions; ptr < end; ptr++)
    29			sha256_update(&ss, (uint8_t *)(ptr->start), ptr->len);
    30		sha256_final(&ss, digest);
    31		if (memcmp(digest, purgatory_sha256_digest, sizeof(digest)) != 0)
    32			return 1;
    33		return 0;
    34	}
    35	
  > 36	void purgatory(void)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
