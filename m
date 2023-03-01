Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33937C64EC7
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 07:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZgLX5DpNuaoBMbnerpky/60m+rkvXrV3mFlof0z+VjQ=; b=vKxnkpFtKXnpHO
	wQi6Oag+S8u432Vzwv3QU6qsJoUksIhAbDmVOfjlkgu7oHzeuG1gEVFvTISwqGlpWqe03eUWYFuD0
	K8+Pm7bH5aNN+Lkzg7SzOxissyFu6rK28Nlwe864hhtVKuKbWKroTTi/Dua2bDURl799n0i9APx6y
	whtsUWgqt9Ri9WX3pZOjx3g4d6mubHpF2uaEmARBmjN4VkuG6yDGOPZbXcVwUs6B3vqvANN000kgP
	DpoY5+Y0uk/LEBgTI8PY7rDcj6GVdGKuGAuux618UB3v4tymTxSqso8O/UFdkP1I61Ph8pyv517tO
	FD52BWSIiIzUIQB3kyAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXHJz-00FO6U-4U; Wed, 01 Mar 2023 07:56:19 +0000
Received: from relay10.mail.gandi.net ([2001:4b98:dc4:8::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXHJv-00FO2f-OJ
	for linux-riscv@lists.infradead.org; Wed, 01 Mar 2023 07:56:18 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id E71E7240009;
	Wed,  1 Mar 2023 07:56:04 +0000 (UTC)
Message-ID: <c0b60456-8731-0999-df3b-f25731209471@ghiti.fr>
Date: Wed, 1 Mar 2023 08:56:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 1/2] riscv: Get rid of riscv_pfn_base variable
Content-Language: en-US
To: kernel test robot <lkp@intel.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Conor Dooley <conor@kernel.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
References: <20230125081214.1576313-2-alexghiti@rivosinc.com>
 <202301282230.sz4DCUe6-lkp@intel.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <202301282230.sz4DCUe6-lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_235616_137463_5166E2AF 
X-CRM114-Status: GOOD (  17.56  )
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

On 1/28/23 15:58, kernel test robot wrote:
> Hi Alexandre,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on robh/for-next]
> [also build test WARNING on linus/master v6.2-rc5 next-20230127]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/riscv-Get-rid-of-riscv_pfn_base-variable/20230125-161537
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> patch link:    https://lore.kernel.org/r/20230125081214.1576313-2-alexghiti%40rivosinc.com
> patch subject: [PATCH v5 1/2] riscv: Get rid of riscv_pfn_base variable
> config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230128/202301282230.sz4DCUe6-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/intel-lab-lkp/linux/commit/90b21402dc8a7e6e36a62ad19c4969ff13fad168
>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>          git fetch --no-tags linux-review Alexandre-Ghiti/riscv-Get-rid-of-riscv_pfn_base-variable/20230125-161537
>          git checkout 90b21402dc8a7e6e36a62ad19c4969ff13fad168
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>     In file included from include/asm-generic/bug.h:22,
>                      from arch/riscv/include/asm/bug.h:83,
>                      from include/linux/bug.h:5,
>                      from arch/riscv/include/asm/cmpxchg.h:9,
>                      from arch/riscv/include/asm/atomic.h:19,
>                      from include/linux/atomic.h:7,
>                      from include/linux/jump_label.h:255,
>                      from arch/riscv/include/asm/vdso/processor.h:7,
>                      from include/vdso/processor.h:10,
>                      from arch/riscv/include/asm/processor.h:11,
>                      from arch/riscv/include/asm/irqflags.h:10,
>                      from include/linux/irqflags.h:16,
>                      from arch/riscv/include/asm/bitops.h:14,
>                      from include/linux/bitops.h:68,
>                      from include/linux/kernel.h:22,
>                      from mm/debug.c:9:
>     mm/debug.c: In function '__dump_page':
>>> include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 7 has type 'long long unsigned int' [-Wformat=]
>         5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
>           |                         ^~~~~~
>     include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
>       429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
>           |                         ^~~~
>     include/linux/printk.h:510:9: note: in expansion of macro 'printk'
>       510 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
>           |         ^~~~~~
>     include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
>        12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
>           |                         ^~~~~~~~
>     include/linux/printk.h:510:16: note: in expansion of macro 'KERN_WARNING'
>       510 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
>           |                ^~~~~~~~~~~~
>     mm/debug.c:93:9: note: in expansion of macro 'pr_warn'
>        93 |         pr_warn("page:%p refcount:%d mapcount:%d mapping:%p index:%#lx pfn:%#lx\n",
>           |         ^~~~~~~
>
>
> vim +5 include/linux/kern_levels.h
>
> 314ba3520e513a Joe Perches 2012-07-30  4
> 04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
> 04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
> 04d2c8c83d0e3a Joe Perches 2012-07-30  7
>

And this one was mine, sorry I i overlooked that!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
