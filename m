Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F0CC4345F
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2024 22:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=epxMa2zOUxbIzdAETEgSkeifk0WniQa907h3kx8g/Ts=; b=KOzpm24G+q2MtA
	rjl45gV8Y446tPAC/ms0jebneF9wNYF27Hn/G6cZB59u3XLc1cY+OzBtHhKmPcCT5/AY2QsKu6R/T
	m5PyOfoCR8Qr6I3E9mLVwp0zUDIyhMsW8W7QZsEyRsOD0SpkVlVSRhte0N+MG0xHY11XCdJFKVRdC
	cO/aMIsjU2EYqRkSkW9p+BhD0/Xs5uzUHbRRXJSZVLmKqKiqfBrvVpRYC3w79WRcst8Xk1/FTmJVM
	ErTBUqhJP+PEDuetGHHehHSZV1iToP08u7jL746NcDcURXF22kElmcTNnc/CBqDpSYTpQBWQfrAp5
	d5H+4M/u4odrR+LU+9mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvlaa-00000004430-2ToM;
	Sat, 13 Apr 2024 22:11:12 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvlaX-00000004425-3CJW;
	Sat, 13 Apr 2024 22:11:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713046269; x=1744582269;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aXOBWMvMO7ho0steJlaL6buOfsyAqhe6GhZwED4vdCA=;
  b=cLZcUPp9qZu9tAeZKrHZcyZZD9dDkO4R8BmzUFv6M2Do1D45luUIsIq6
   dmbB6kMSS8gRLAonYdLuydEcPZDnkhtOlpXcfB4F8MZbYjLlMMa6TowNi
   J78SSArev388NEJf6RRU2uB6BAXeeEaJiqnKXzleVqSsw9htaxhrOt86H
   cd/PuZFhM8TijMCsHxPcIBC64N06wfHYq8pjWDe95HVdvrjJ0v8p4b9OV
   2pze2teX5PKAbIu+73xTlYnFi447lKGN1r8h2RTENyzpO8Uj4otTHz1RB
   wHfQtBIglywlE9C4xWCWio0nFGDjitLEXqsH9EZ1PL5SIaWmoJjHTmeZW
   w==;
X-CSE-ConnectionGUID: gpVZ36VkTN+ZrJTdbmNchQ==
X-CSE-MsgGUID: orouFERWRF+OdAi/e088Aw==
X-IronPort-AV: E=McAfee;i="6600,9927,11043"; a="8649035"
X-IronPort-AV: E=Sophos;i="6.07,199,1708416000"; 
   d="scan'208";a="8649035"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 15:11:08 -0700
X-CSE-ConnectionGUID: oNYeaU4eRpaX0kmlpzKmrQ==
X-CSE-MsgGUID: Ogf1VbZmTaGfvNpSHEZ+Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,199,1708416000"; 
   d="scan'208";a="52503573"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 13 Apr 2024 15:11:03 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvlaO-00034K-0o;
	Sat, 13 Apr 2024 22:11:00 +0000
Date: Sun, 14 Apr 2024 06:10:50 +0800
From: kernel test robot <lkp@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH 06/19] riscv: Extend cpufeature.c to detect vendor
 extensions
Message-ID: <202404140621.x9B02eF8-lkp@intel.com>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-6-4af9815ec746@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-6-4af9815ec746@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_151109_889690_8CF581A0 
X-CRM114-Status: GOOD (  20.44  )
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

Hi Charlie,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4cece764965020c22cff7665b18a012006359095]

url:    https://github.com/intel-lab-lkp/linux/commits/Charlie-Jenkins/dt-bindings-riscv-Add-vendorid-and-archid/20240412-121709
base:   4cece764965020c22cff7665b18a012006359095
patch link:    https://lore.kernel.org/r/20240411-dev-charlie-support_thead_vector_6_9-v1-6-4af9815ec746%40rivosinc.com
patch subject: [PATCH 06/19] riscv: Extend cpufeature.c to detect vendor extensions
config: riscv-randconfig-r133-20240413 (https://download.01.org/0day-ci/archive/20240414/202404140621.x9B02eF8-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce: (https://download.01.org/0day-ci/archive/20240414/202404140621.x9B02eF8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404140621.x9B02eF8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/cpufeature.c:395:4: error: expected expression
     395 |                         bool found;
         |                         ^
>> arch/riscv/kernel/cpufeature.c:397:4: error: use of undeclared identifier 'found'
     397 |                         found = get_isa_vendor_ext(vendorid,
         |                         ^
   arch/riscv/kernel/cpufeature.c:402:9: error: use of undeclared identifier 'found'
     402 |                         if (!found) {
         |                              ^
   3 errors generated.


vim +395 arch/riscv/kernel/cpufeature.c

   370	
   371	static void __init riscv_parse_isa_string(unsigned long *this_hwcap, struct riscv_isainfo *isainfo,
   372						struct riscv_isainfo *isavendorinfo, unsigned long vendorid,
   373						unsigned long *isa2hwcap, const char *isa)
   374	{
   375		/*
   376		 * For all possible cpus, we have already validated in
   377		 * the boot process that they at least contain "rv" and
   378		 * whichever of "32"/"64" this kernel supports, and so this
   379		 * section can be skipped.
   380		 */
   381		isa += 4;
   382	
   383		while (*isa) {
   384			const char *ext = isa++;
   385			const char *ext_end = isa;
   386			bool ext_long = false, ext_err = false;
   387			struct riscv_isainfo *selected_isainfo = isainfo;
   388			const struct riscv_isa_ext_data *selected_riscv_isa_ext = riscv_isa_ext;
   389			size_t selected_riscv_isa_ext_count = riscv_isa_ext_count;
   390			unsigned int id_offset = 0;
   391	
   392			switch (*ext) {
   393			case 'x':
   394			case 'X':
 > 395				bool found;
   396	
 > 397				found = get_isa_vendor_ext(vendorid,
   398							   &selected_riscv_isa_ext,
   399							   &selected_riscv_isa_ext_count);
   400				selected_isainfo = isavendorinfo;
   401				id_offset = RISCV_ISA_VENDOR_EXT_BASE;
   402				if (!found) {
   403					pr_warn("No associated vendor extensions with vendor id: %lx\n",
   404						vendorid);
   405					for (; *isa && *isa != '_'; ++isa)
   406						;
   407					ext_err = true;
   408					break;
   409				}
   410				fallthrough;
   411			case 's':
   412				/*
   413				 * Workaround for invalid single-letter 's' & 'u' (QEMU).
   414				 * No need to set the bit in riscv_isa as 's' & 'u' are
   415				 * not valid ISA extensions. It works unless the first
   416				 * multi-letter extension in the ISA string begins with
   417				 * "Su" and is not prefixed with an underscore.
   418				 */
   419				if (ext[-1] != '_' && ext[1] == 'u') {
   420					++isa;
   421					ext_err = true;
   422					break;
   423				}
   424				fallthrough;
   425			case 'S':
   426			case 'z':
   427			case 'Z':
   428				/*
   429				 * Before attempting to parse the extension itself, we find its end.
   430				 * As multi-letter extensions must be split from other multi-letter
   431				 * extensions with an "_", the end of a multi-letter extension will
   432				 * either be the null character or the "_" at the start of the next
   433				 * multi-letter extension.
   434				 *
   435				 * Next, as the extensions version is currently ignored, we
   436				 * eliminate that portion. This is done by parsing backwards from
   437				 * the end of the extension, removing any numbers. This may be a
   438				 * major or minor number however, so the process is repeated if a
   439				 * minor number was found.
   440				 *
   441				 * ext_end is intended to represent the first character *after* the
   442				 * name portion of an extension, but will be decremented to the last
   443				 * character itself while eliminating the extensions version number.
   444				 * A simple re-increment solves this problem.
   445				 */
   446				ext_long = true;
   447				for (; *isa && *isa != '_'; ++isa)
   448					if (unlikely(!isalnum(*isa)))
   449						ext_err = true;
   450	
   451				ext_end = isa;
   452				if (unlikely(ext_err))
   453					break;
   454	
   455				if (!isdigit(ext_end[-1]))
   456					break;
   457	
   458				while (isdigit(*--ext_end))
   459					;
   460	
   461				if (tolower(ext_end[0]) != 'p' || !isdigit(ext_end[-1])) {
   462					++ext_end;
   463					break;
   464				}
   465	
   466				while (isdigit(*--ext_end))
   467					;
   468	
   469				++ext_end;
   470				break;
   471			default:
   472				/*
   473				 * Things are a little easier for single-letter extensions, as they
   474				 * are parsed forwards.
   475				 *
   476				 * After checking that our starting position is valid, we need to
   477				 * ensure that, when isa was incremented at the start of the loop,
   478				 * that it arrived at the start of the next extension.
   479				 *
   480				 * If we are already on a non-digit, there is nothing to do. Either
   481				 * we have a multi-letter extension's _, or the start of an
   482				 * extension.
   483				 *
   484				 * Otherwise we have found the current extension's major version
   485				 * number. Parse past it, and a subsequent p/minor version number
   486				 * if present. The `p` extension must not appear immediately after
   487				 * a number, so there is no fear of missing it.
   488				 *
   489				 */
   490				if (unlikely(!isalpha(*ext))) {
   491					ext_err = true;
   492					break;
   493				}
   494	
   495				if (!isdigit(*isa))
   496					break;
   497	
   498				while (isdigit(*++isa))
   499					;
   500	
   501				if (tolower(*isa) != 'p')
   502					break;
   503	
   504				if (!isdigit(*++isa)) {
   505					--isa;
   506					break;
   507				}
   508	
   509				while (isdigit(*++isa))
   510					;
   511	
   512				break;
   513			}
   514	
   515			/*
   516			 * The parser expects that at the start of an iteration isa points to the
   517			 * first character of the next extension. As we stop parsing an extension
   518			 * on meeting a non-alphanumeric character, an extra increment is needed
   519			 * where the succeeding extension is a multi-letter prefixed with an "_".
   520			 */
   521			if (*isa == '_')
   522				++isa;
   523	
   524			if (unlikely(ext_err))
   525				continue;
   526			if (!ext_long) {
   527				int nr = tolower(*ext) - 'a';
   528	
   529				if (riscv_isa_extension_check(nr)) {
   530					*this_hwcap |= isa2hwcap[nr];
   531					set_bit(nr, isainfo->isa);
   532				}
   533			} else {
   534				for (int i = 0; i < selected_riscv_isa_ext_count; i++)
   535					match_isa_ext(&selected_riscv_isa_ext[i], ext,
   536						      ext_end, selected_isainfo,
   537						      id_offset);
   538			}
   539		}
   540	}
   541	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
