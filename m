Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21776C001B0
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 15:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qJyxXWfx21RnZo8bJrW9skqps/71jnd3g1SW+RzZHgM=; b=buXjWx9si6SzD1
	C3sAGdECiaYbt58Uc8LEIS1PeVm+bIRZcJKX9dZTD2Dx775hd2bUO5Su+i6zkgwvgMIXm+8mBm+Wp
	udFK+1dFkaHI3vBOy1DD3RXfXDTrJy8TO0tAQpa1ftLit5MuNKeRIVhm8mkTI2OuOS0GiRjVhAMYB
	yBsHoqOjggg3op/4tElIt45nTIsUtJAPjBg7A3HZOb/+JYDfXwBndiLdTFXww3Pnwr7Yx8tiV3jV5
	bpWW04ARW0gF+EuJ0VOVtW+Gbq6vQwGYYobOOLxHWFDjmW7I0GiQTlptLBrrhiveY/GmOD+15buhk
	vbvDiWXjv3hXCsjiwerA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGLE3-00Aq3E-2R;
	Mon, 03 Jul 2023 15:12:27 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGLE0-00Aq1r-1O;
	Mon, 03 Jul 2023 15:12:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688397144; x=1719933144;
  h=date:from:to:cc:subject:message-id;
  bh=W0xbU9nEE3TH0xg7aDTg6qtQ4+f5eySxUTOggB2dw2Q=;
  b=EN2JO1VVXd4cpPUR4wOLC2fDEks4yKGGxKymbk/4DAzNpkmWZapHVbBk
   wLKxOPXbiww5EtZgxvMkYDjQLb4n3fNfWEj713OxkZE9nBWcn6aBBkNTp
   WUcjqoqVg7lgb48r2gkgEdkPb5fZuOFpRaHMwFnX9Ryd3TI4BqwIuXh1G
   tW7CAvzwDgy8k0nNptdHVQlLF5Zt0XffHzSafbm64Ry64NVmPgx+yjwoy
   kkQz8IztebLrxaKo7L6N3cvKW8E4ST/ZjwQb5KTQzGYk9DWmdv4h5Y3Ec
   KrznsNNBs7tFImYK42YDWY/d9wBJeQ6w6+IHYIle1y6Y0nokVEDk7AoD1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="343239956"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="343239956"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 08:12:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="788557478"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="788557478"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 03 Jul 2023 08:12:13 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGLDo-000HR9-2I;
	Mon, 03 Jul 2023 15:12:12 +0000
Date: Mon, 03 Jul 2023 23:11:26 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 kunit-dev@googlegroups.com, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [linux-next:master] BUILD REGRESSION
 296d53d8f84ce50ffaee7d575487058c8d437335
Message-ID: <202307032309.v4K1IBoR-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_081224_506410_FF6E15E9 
X-CRM114-Status: UNSURE (   6.42  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 296d53d8f84ce50ffaee7d575487058c8d437335  Add linux-next specific files for 20230703

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202306122223.HHER4zOo-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202306151954.Rsz6HP7h-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202306301709.lvrxzyCj-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202306301756.x8dgyYnL-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/parisc/kernel/pdt.c:66:6: warning: no previous prototype for 'arch_report_meminfo' [-Wmissing-prototypes]
drivers/bluetooth/btmtk.c:386:32: error: no member named 'dump' in 'struct hci_dev'
drivers/bluetooth/btmtk.c:386:44: error: 'struct hci_dev' has no member named 'dump'
drivers/char/mem.c:164:25: error: implicit declaration of function 'unxlate_dev_mem_ptr'; did you mean 'xlate_dev_mem_ptr'? [-Werror=implicit-function-declaration]
lib/kunit/executor_test.c:138:4: warning: cast from 'void (*)(const void *)' to 'kunit_action_t *' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]
lib/kunit/test.c:775:38: warning: cast from 'void (*)(const void *)' to 'kunit_action_t *' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]

Unverified Error/Warning (likely false positive, please contact us if interested):

arch/arm64/kvm/mmu.c:147:3-9: preceding lock on line 140
drivers/clk/qcom/gpucc-sm8550.c:37:22: sparse: sparse: decimal constant 2300000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here
drivers/net/ethernet/mellanox/mlx5/core/lib/devcom.c:98 mlx5_devcom_register_device() error: uninitialized symbol 'tmp_dev'.
drivers/usb/cdns3/cdns3-starfive.c:23: warning: expecting prototype for cdns3(). Prototype was for USB_STRAP_HOST() instead
{standard input}: Error: local label `"2" (instance number 9 of a fb label)' is not defined

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-randconfig-r025-20230703
|   `-- drivers-bluetooth-btmtk.c:error:struct-hci_dev-has-no-member-named-dump
|-- arm-randconfig-r073-20230703
|   `-- drivers-clk-qcom-gpucc-sm8550.c:sparse:sparse:decimal-constant-is-between-LONG_MAX-and-ULONG_MAX.-For-C99-that-means-long-long-C90-compilers-are-very-likely-to-produce-unsigned-long-(and-a-warning)-he
|-- arm64-randconfig-r054-20230703
|   `-- arch-arm64-kvm-mmu.c:preceding-lock-on-line
|-- i386-randconfig-m031-20230703
|   `-- drivers-net-ethernet-mellanox-mlx5-core-lib-devcom.c-mlx5_devcom_register_device()-error:uninitialized-symbol-tmp_dev-.
|-- parisc-allnoconfig
|   `-- arch-parisc-kernel-pdt.c:warning:no-previous-prototype-for-arch_report_meminfo
|-- parisc-allyesconfig
|   `-- arch-parisc-kernel-pdt.c:warning:no-previous-prototype-for-arch_report_meminfo
|-- parisc-defconfig
|   `-- arch-parisc-kernel-pdt.c:warning:no-previous-prototype-for-arch_report_meminfo
|-- parisc-randconfig-r011-20230703
|   `-- arch-parisc-kernel-pdt.c:warning:no-previous-prototype-for-arch_report_meminfo
|-- parisc-randconfig-r035-20230703
|   `-- arch-parisc-kernel-pdt.c:warning:no-previous-prototype-for-arch_report_meminfo
|-- parisc64-defconfig
|   `-- arch-parisc-kernel-pdt.c:warning:no-previous-prototype-for-arch_report_meminfo
|-- riscv-allmodconfig
|   `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead
|-- riscv-allyesconfig
|   `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead
|-- riscv-randconfig-r091-20230703
|   |-- arch-riscv-kernel-signal.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-void-__val-got-void-noderef-__user-assigned-datap
|   `-- drivers-bluetooth-btmtk.c:error:struct-hci_dev-has-no-member-named-dump
|-- sh-allmodconfig
|   |-- drivers-char-mem.c:error:implicit-declaration-of-function-unxlate_dev_mem_ptr
|   `-- standard-input:Error:local-label-(instance-number-of-a-fb-label)-is-not-defined
|-- sh-randconfig-r015-20230703
|   `-- drivers-char-mem.c:error:implicit-declaration-of-function-unxlate_dev_mem_ptr
|-- sh-randconfig-r024-20230703
|   `-- drivers-char-mem.c:error:implicit-declaration-of-function-unxlate_dev_mem_ptr
|-- sh-se7619_defconfig
|   `-- drivers-char-mem.c:error:implicit-declaration-of-function-unxlate_dev_mem_ptr
`-- x86_64-buildonly-randconfig-r003-20230703
    `-- drivers-bluetooth-btmtk.c:error:struct-hci_dev-has-no-member-named-dump
clang_recent_errors
|-- arm-randconfig-r005-20230703
|   `-- lib-kunit-test.c:warning:cast-from-void-(-)(const-void-)-to-kunit_action_t-(aka-void-(-)(void-)-)-converts-to-incompatible-function-type
|-- arm-randconfig-r035-20230703
|   |-- lib-kunit-executor_test.c:warning:cast-from-void-(-)(const-void-)-to-kunit_action_t-(aka-void-(-)(void-)-)-converts-to-incompatible-function-type
|   `-- lib-kunit-test.c:warning:cast-from-void-(-)(const-void-)-to-kunit_action_t-(aka-void-(-)(void-)-)-converts-to-incompatible-function-type
|-- arm64-randconfig-r026-20230703
|   `-- lib-kunit-test.c:warning:cast-from-void-(-)(const-void-)-to-kunit_action_t-(aka-void-(-)(void-)-)-converts-to-incompatible-function-type
|-- hexagon-randconfig-r041-20230703
|   |-- drivers-bluetooth-btmtk.c:error:no-member-named-dump-in-struct-hci_dev
|   |-- lib-kunit-executor_test.c:warning:cast-from-void-(-)(const-void-)-to-kunit_action_t-(aka-void-(-)(void-)-)-converts-to-incompatible-function-type
|   `-- lib-kunit-test.c:warning:cast-from-void-(-)(const-void-)-to-kunit_action_t-(aka-void-(-)(void-)-)-converts-to-incompatible-function-type
|-- hexagon-randconfig-r045-20230703
|   |-- lib-kunit-executor_test.c:warning:cast-from-void-(-)(const-void-)-to-kunit_action_t-(aka-void-(-)(void-)-)-converts-to-incompatible-function-type
|   `-- lib-kunit-test.c:warning:cast-from-void-(-)(const-void-)-to-kunit_action_t-(aka-void-(-)(void-)-)-converts-to-incompatible-function-type
`-- i386-randconfig-i011-20230703
    `-- drivers-bluetooth-btmtk.c:error:no-member-named-dump-in-struct-hci_dev

elapsed time: 747m

configs tested: 136
configs skipped: 5

tested configs:
alpha                            alldefconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230703   gcc  
alpha                randconfig-r025-20230703   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                  randconfig-r014-20230703   gcc  
arc                  randconfig-r043-20230703   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                                 defconfig   gcc  
arm                         lpc32xx_defconfig   clang
arm                           omap1_defconfig   clang
arm                          pxa168_defconfig   clang
arm                  randconfig-r005-20230703   clang
arm                  randconfig-r035-20230703   clang
arm                  randconfig-r046-20230703   gcc  
arm                         socfpga_defconfig   clang
arm                         wpcm450_defconfig   gcc  
arm64                            alldefconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r026-20230703   clang
csky                                defconfig   gcc  
csky                 randconfig-r006-20230703   gcc  
csky                 randconfig-r021-20230703   gcc  
hexagon              randconfig-r041-20230703   clang
hexagon              randconfig-r045-20230703   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230703   gcc  
i386         buildonly-randconfig-r005-20230703   gcc  
i386         buildonly-randconfig-r006-20230703   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230703   gcc  
i386                 randconfig-i002-20230703   gcc  
i386                 randconfig-i003-20230703   gcc  
i386                 randconfig-i004-20230703   gcc  
i386                 randconfig-i005-20230703   gcc  
i386                 randconfig-i006-20230703   gcc  
i386                 randconfig-i011-20230703   clang
i386                 randconfig-i012-20230703   clang
i386                 randconfig-i013-20230703   clang
i386                 randconfig-i014-20230703   clang
i386                 randconfig-i016-20230703   clang
i386                 randconfig-r036-20230703   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r013-20230703   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                            ar7_defconfig   gcc  
mips                           gcw0_defconfig   gcc  
mips                           ip32_defconfig   gcc  
mips                           jazz_defconfig   gcc  
mips                       lemote2f_defconfig   clang
mips                 randconfig-r023-20230703   gcc  
mips                 randconfig-r031-20230703   clang
nios2                               defconfig   gcc  
openrisc             randconfig-r034-20230703   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230703   gcc  
parisc               randconfig-r035-20230703   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                 canyonlands_defconfig   gcc  
powerpc                     ep8248e_defconfig   gcc  
powerpc                        icon_defconfig   clang
powerpc                    klondike_defconfig   gcc  
powerpc                     ksi8560_defconfig   clang
powerpc                     mpc5200_defconfig   clang
powerpc                     mpc83xx_defconfig   gcc  
powerpc                  storcenter_defconfig   gcc  
powerpc                         wii_defconfig   gcc  
riscv                            alldefconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230703   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r004-20230703   gcc  
s390                 randconfig-r033-20230703   gcc  
s390                 randconfig-r044-20230703   clang
sh                               allmodconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                   randconfig-r015-20230703   gcc  
sh                   randconfig-r024-20230703   gcc  
sh                   randconfig-r031-20230703   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r022-20230703   gcc  
sparc64              randconfig-r001-20230703   gcc  
sparc64              randconfig-r033-20230703   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r034-20230703   clang
um                   randconfig-r036-20230703   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230703   gcc  
x86_64       buildonly-randconfig-r002-20230703   gcc  
x86_64       buildonly-randconfig-r003-20230703   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-x001-20230703   clang
x86_64               randconfig-x002-20230703   clang
x86_64               randconfig-x003-20230703   clang
x86_64               randconfig-x004-20230703   clang
x86_64               randconfig-x005-20230703   clang
x86_64               randconfig-x006-20230703   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r003-20230703   gcc  
xtensa               randconfig-r012-20230703   gcc  
xtensa               randconfig-r032-20230703   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
