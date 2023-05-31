Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2DFC7EE23
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 00:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+pdD9eEz3Mz0UIxe8lD49oWKqtrGXYAK8iytUc3hsY8=; b=IPY1EftVkGnoVu
	x200Shd+P2ne1ZNjB1QJ6fc48hiZNIA1c1diM0qnBLBS6UfGD/cpjVUYCblyd173IEvGxzYuOzLl0
	evZcInFTnX7vzBoZFxGFuPfZ7dFVxoBmdQI0LZedEb/qBE7xvjBQ16hrJoisM+3j4/rilCSrmp+76
	wwMiSKujCuyissbZVDeEQ+zlZWuJ98H3WleEpAMYTQKYz98BOa7zFp+XG0x72cfTkOnX8WWS2w+G/
	R/zq3SKRQK7+Mtm/ECpsXmU8dggeN5qkwh14y73YmpVkYIIbu/Z3no6Xi3AiPbAtPf3OhCLqKzBL1
	M5gFI7xrc/4XKWrsOMpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q49lr-00FcDN-1Q;
	Wed, 31 May 2023 00:32:59 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q49lo-00FcCG-1w
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 00:32:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685493176; x=1717029176;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=5xEeiekejREC8LvTn5bR/XyYrA71WsI2XilvH/Jg91Y=;
  b=TawTdME83j4auhqg+y7tohyXGJKmMo0Ssg5z0qUBBKS9R5AGTPFe+fNB
   sN3c0kwLXXfxr8fgketxYYHPsNnR+Jl+VXlMy7UCMRraELLLG4Gs4p2EE
   7E5yVDY1km/nrf4khtoDXgYAqyZF4iXHPUPp0xC+gIEv3Mc77CnoH3aiM
   9hfyTfZxIk6WJjtgTMBPqeaK9ljoRvUx5ADudoOyZkVESUBJEpnvs3U+U
   BKvEPrdaBfdc9TAvPvxoMw+oIHeEWG81b7HU4kBQEfQ7y4ftwnra1ntgV
   yaQImknjrmeSt++4Uy/n6D7McRsuA8l9WSLeO8jlbK6aFf+MkmW3sPMWZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="441445156"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="441445156"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 17:32:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="1036803686"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="1036803686"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 May 2023 17:32:50 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q49li-0000vz-0c;
	Wed, 31 May 2023 00:32:50 +0000
Date: Wed, 31 May 2023 08:32:26 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux@rivosinc.com, Alexandre Ghiti <alexghiti@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH] riscv: mm: Pre-allocate PGD entries vmalloc/modules area
Message-ID: <202305310822.dhnyydJC-lkp@intel.com>
References: <20230529180023.289904-1-bjorn@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230529180023.289904-1-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_173256_655141_63E336A5 
X-CRM114-Status: GOOD (  17.04  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Bj=F6rn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ac9a78681b921877518763ba0e89202254349d1b]

url:    https://github.com/intel-lab-lkp/linux/commits/Bj-rn-T-pel/riscv-mm=
-Pre-allocate-PGD-entries-vmalloc-modules-area/20230530-020212
base:   ac9a78681b921877518763ba0e89202254349d1b
patch link:    https://lore.kernel.org/r/20230529180023.289904-1-bjorn%40ke=
rnel.org
patch subject: [PATCH] riscv: mm: Pre-allocate PGD entries vmalloc/modules =
area
config: riscv-randconfig-r042-20230530 (https://download.01.org/0day-ci/arc=
hive/20230531/202305310822.dhnyydJC-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=3D1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9383adbcdfb7f850149=
742579615e8c174328a78
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bj-rn-T-pel/riscv-mm-Pre-allocate-=
PGD-entries-vmalloc-modules-area/20230530-020212
        git checkout 9383adbcdfb7f850149742579615e8c174328a78
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.3.0 ~/bin/make=
.cross W=3D1 O=3Dbuild_dir ARCH=3Driscv olddefconfig
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.3.0 ~/bin/make=
.cross W=3D1 O=3Dbuild_dir ARCH=3Driscv SHELL=3D/bin/bash arch/riscv/mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305310822.dhnyydJC-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/mm/init.c: In function 'preallocate_pgd_pages_range':
   arch/riscv/mm/init.c:1381:30: error: implicit declaration of function 'p=
gd_offset_k'; did you mean 'p4d_offset'? [-Werror=3Dimplicit-function-decla=
ration]
    1381 |                 pgd_t *pgd =3D pgd_offset_k(addr);
         |                              ^~~~~~~~~~~~
         |                              p4d_offset
>> arch/riscv/mm/init.c:1381:30: warning: initialization of 'pgd_t *' from =
'int' makes pointer from integer without a cast [-Wint-conversion]
   arch/riscv/mm/init.c:1387:23: error: implicit declaration of function 'p=
4d_alloc'; did you mean 'd_alloc'? [-Werror=3Dimplicit-function-declaration]
    1387 |                 p4d =3D p4d_alloc(&init_mm, pgd, addr);
         |                       ^~~~~~~~~
         |                       d_alloc
>> arch/riscv/mm/init.c:1387:21: warning: assignment to 'p4d_t *' from 'int=
' makes pointer from integer without a cast [-Wint-conversion]
    1387 |                 p4d =3D p4d_alloc(&init_mm, pgd, addr);
         |                     ^
   arch/riscv/mm/init.c:1395:23: error: implicit declaration of function 'p=
ud_alloc'; did you mean 'd_alloc'? [-Werror=3Dimplicit-function-declaration]
    1395 |                 pud =3D pud_alloc(&init_mm, p4d, addr);
         |                       ^~~~~~~~~
         |                       d_alloc
>> arch/riscv/mm/init.c:1395:21: warning: assignment to 'pud_t *' from 'int=
' makes pointer from integer without a cast [-Wint-conversion]
    1395 |                 pud =3D pud_alloc(&init_mm, p4d, addr);
         |                     ^
   arch/riscv/mm/init.c:1403:23: error: implicit declaration of function 'p=
md_alloc'; did you mean 'mm_alloc'? [-Werror=3Dimplicit-function-declaratio=
n]
    1403 |                 pmd =3D pmd_alloc(&init_mm, pud, addr);
         |                       ^~~~~~~~~
         |                       mm_alloc
>> arch/riscv/mm/init.c:1403:21: warning: assignment to 'pmd_t *' from 'int=
' makes pointer from integer without a cast [-Wint-conversion]
    1403 |                 pmd =3D pmd_alloc(&init_mm, pud, addr);
         |                     ^
   arch/riscv/mm/init.c: In function 'pgtable_cache_init':
   arch/riscv/mm/init.c:1421:45: error: 'MODULES_VADDR' undeclared (first u=
se in this function)
    1421 |                 preallocate_pgd_pages_range(MODULES_VADDR, MODUL=
ES_END, "bpf/modules");
         |                                             ^~~~~~~~~~~~~
   arch/riscv/mm/init.c:1421:45: note: each undeclared identifier is report=
ed only once for each function it appears in
   arch/riscv/mm/init.c:1421:60: error: 'MODULES_END' undeclared (first use=
 in this function)
    1421 |                 preallocate_pgd_pages_range(MODULES_VADDR, MODUL=
ES_END, "bpf/modules");
         |                                                            ^~~~~=
~~~~~~
   cc1: some warnings being treated as errors


vim +1381 arch/riscv/mm/init.c

  1366	=

  1367	#ifdef CONFIG_64BIT
  1368	/*
  1369	 * Pre-allocates page-table pages for a specific area in the kernel
  1370	 * page-table. Only the level which needs to be synchronized between
  1371	 * all page-tables is allocated because the synchronization can be
  1372	 * expensive.
  1373	 */
  1374	static void __init preallocate_pgd_pages_range(unsigned long start, =
unsigned long end,
  1375						       const char *area)
  1376	{
  1377		unsigned long addr;
  1378		const char *lvl;
  1379	=

  1380		for (addr =3D start; addr < end && addr >=3D start; addr =3D ALIGN(=
addr + 1, PGDIR_SIZE)) {
> 1381			pgd_t *pgd =3D pgd_offset_k(addr);
  1382			p4d_t *p4d;
  1383			pud_t *pud;
  1384			pmd_t *pmd;
  1385	=

  1386			lvl =3D "p4d";
> 1387			p4d =3D p4d_alloc(&init_mm, pgd, addr);
  1388			if (!p4d)
  1389				goto failed;
  1390	=

  1391			if (pgtable_l5_enabled)
  1392				continue;
  1393	=

  1394			lvl =3D "pud";
> 1395			pud =3D pud_alloc(&init_mm, p4d, addr);
  1396			if (!pud)
  1397				goto failed;
  1398	=

  1399			if (pgtable_l4_enabled)
  1400				continue;
  1401	=

  1402			lvl =3D "pmd";
> 1403			pmd =3D pmd_alloc(&init_mm, pud, addr);
  1404			if (!pmd)
  1405				goto failed;
  1406		}
  1407		return;
  1408	=

  1409	failed:
  1410		/*
  1411		 * The pages have to be there now or they will be missing in
  1412		 * process page-tables later.
  1413		 */
  1414		panic("Failed to pre-allocate %s pages for %s area\n", lvl, area);
  1415	}
  1416	=


-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
