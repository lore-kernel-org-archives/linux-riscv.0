Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30050C369BD
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Apr 2025 15:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0UBr9SiMXsh2P23nnygmSu9qofa1EAKVQpzJQjc5Jtw=; b=XXh8qckxXdDmD1
	nC+B9zCSWxtWjQwAUfMdEpXcnh8yiof7BeyPdj4QHQ73bVRGOldBNptG6ijAHRsxiLosFIMVRznSs
	HbXfwEP/vqgBfMw0rVxOQGmqiCvw0PCe4IrOnSJDdo0uTbVAi5jCFFCbxcmVaBYkbofrxqG7ul+Zp
	i09ByGj5GgrZcwnzs3f+MK7AI4mQFaBqdAMofOaLyNutfvfKU1xM19VoVAI3gSlwuthK3bx5Z2NgR
	m1eE5TmaEuRGCqWmB9D6UQ3C4nHq42J8JVy3CkwYnA4Nu3xDs22tKYRhDueMgCd2ZvjPhictnDcT0
	WJzLlArVcyZn10gw7EPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54Qg-0000000A1ud-0XCG;
	Wed, 16 Apr 2025 15:11:58 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u53IA-00000009lVw-0QBp
	for linux-riscv@lists.infradead.org;
	Wed, 16 Apr 2025 13:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744811946; x=1776347946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hn6xwOP93/yhoELlBY8V8Xuv/wDTtTZJFnraUzSgg0c=;
  b=RaPiPvdR9+zB7XSUQVH/ynI4nY93SMHDMyXHOTvCiHKENHW4GHL+eoZB
   tc3TpPbMwxqONW9PM3+W3PODX6y1mC/YylZ50VaDM57h3zqp7g3Nlv1u3
   VIyvlBanDlFJVdnlY/YR8v8VqvxReJ9yZ77WL8cu/U2q5qjCOGZXFcy+F
   DwHaJBVnkv5BxsRqDnymcuKDUVDav2KwW9BF3GIiduEkGuMKJhERg4jmn
   I+sHTDOWHVF8EMtVM6HfCdQciKhzcSrae59V1f1/JXgHBWOpocJpkV3nz
   tlhOO/Omfej15o1bYNyP6zzxX9ctf6LIGeW1MWSXPQQL4pHilaTk23GUP
   Q==;
X-CSE-ConnectionGUID: g3N0iyD6Qk++716iYE7MRQ==
X-CSE-MsgGUID: W36A4/KpTJWWcKJ/VRbmig==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50169613"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="50169613"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 06:59:05 -0700
X-CSE-ConnectionGUID: og39v+s6Sf277AFQZeP/fQ==
X-CSE-MsgGUID: h+35UNDxQyCysYGvgIBmow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135291556"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Apr 2025 06:59:02 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u53I4-000Jpw-0h;
	Wed, 16 Apr 2025 13:59:00 +0000
Date: Wed, 16 Apr 2025 21:58:10 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Song Shuai <songshuaishuai@tinylab.org>,
	linux-riscv@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Nick Kossifidis <mick@ics.forth.gr>,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>
Subject: Re: [PATCH v3 2/2] riscv: kexec_file: Support loading Image binary
 file
Message-ID: <202504162100.DHKsuYS1-lkp@intel.com>
References: <20250409193004.643839-3-bjorn@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250409193004.643839-3-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_065906_173687_3E5D0C34 
X-CRM114-Status: UNSURE (   8.98  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Bj=F6rn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a24588245776dafc227243a01bfbeb8a59bafba9]

url:    https://github.com/intel-lab-lkp/linux/commits/Bj-rn-T-pel/riscv-ke=
xec_file-Split-the-loading-of-kernel-and-others/20250410-033243
base:   a24588245776dafc227243a01bfbeb8a59bafba9
patch link:    https://lore.kernel.org/r/20250409193004.643839-3-bjorn%40ke=
rnel.org
patch subject: [PATCH v3 2/2] riscv: kexec_file: Support loading Image bina=
ry file
reproduce: (https://download.01.org/0day-ci/archive/20250416/202504162100.D=
HKsuYS1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504162100.DHKsuYS1-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/admin-guide/README.rst referen=
ces a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging=
.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kern=
el-debugging.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst referen=
ces a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging=
.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kern=
el-debugging.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation=
/devicetree/bindings/leds/backlight/ti,lp8864.yaml
>> Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't =
exist: Documentation/riscv/boot-image-header.rst
   Can't build as 1 mandatory dependency is missing at ./scripts/sphinx-pre=
-install line 984.
   make[2]: *** [Documentation/Makefile:121: htmldocs] Error 255
   make[1]: *** [Makefile:1804: htmldocs] Error 2
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'htmldocs' not remade because of errors.

-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
