Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6B6C0219E
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 19:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q0dvx/ccuLJzdJ2fpDzJxrHJtxCv7PbsInNvHCPl0Gk=; b=LaEXd+Lk3Yof2U
	R0qPG2z/YWi6LKzhvPqpDGZghz9BsGaT8a91oTqRgA1wL2CU6JTDlk40kTLXq+GXhYCOaE3xlG9rR
	BMP3JTyoV38FnNgVNTQjP51S3A4xrk4xMsVB23zt7qwHJctDEF0X3l6Fi7tJL7bpI5oKqoSCaR3YS
	1ZNVYKDXVNsCCORcutTi/+rL0JHkxsERVRdlmdYoAy2FBHUFwM6VGRc3BlGFUd7QbxLr7qSP3M+Ox
	qobN0IEcvZ5EwxxBSdSPYIPpPjUn1r+tQG6Z1+3rKvPgnJU7aGuW6P2YQCFbZBCg0O6wl90Eu07nO
	QAsMHC9dfkQrbdaZAJWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thvrQ-0000000502r-1BhG;
	Tue, 11 Feb 2025 19:23:56 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thvpU-00000004zPP-3I5e
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 19:21:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739301717; x=1770837717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=an+OqzvJ659CbgGiWfy2HCJIq9L7yPkSs+VThOVR1Po=;
  b=ZAoS19jkZa8suUCYxrHB13fKulIV8sKglKWSCFiTKOi0nQP6X2ZVcMvQ
   XYAVOtdEEkerVoYE9QwlcSNT40CvHppixG06x6vN72zE3boqYx6YGIfzu
   /rPBL8k//7ssfZ9J9I7zYD4FpTaHS9SWtyGAWO8/Dtm+T/OhJB50xcUhg
   ayd4Sln9re06GcvCJi52gajzOcPC8XrdZj8CzAiO51sgQpOFxhGjIlfVg
   NWCd3yEUVq/t6Qg5z2X1tPbwmE8sVk/pcAsaz7mb9PQADeT4LlFAE9O41
   kijDePapfTf9xyNTVoCzDFdMLuodYmOXshcee1gCVU3cJ4oOdG69m9Kx/
   Q==;
X-CSE-ConnectionGUID: l+9WdXWAQu6+JMUz4AA2Wg==
X-CSE-MsgGUID: PSHV+lBPSBiYtJBLAyUSvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="62405293"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="62405293"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 11:21:56 -0800
X-CSE-ConnectionGUID: xgB4JW0MS+yIC75aTORLvg==
X-CSE-MsgGUID: u36XP4KPQwCDg3aE0WG8uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="113112836"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Feb 2025 11:21:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thvpN-0014b7-0W;
	Tue, 11 Feb 2025 19:21:49 +0000
Date: Wed, 12 Feb 2025 03:21:07 +0800
From: kernel test robot <lkp@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Pasha Bouzarjomehri <pasha@rivosinc.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v5] riscv: Add runtime constant support
Message-ID: <202502120355.WlAf0wvw-lkp@intel.com>
References: <20250203-runtime_const_riscv-v5-1-bc61736a3229@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250203-runtime_const_riscv-v5-1-bc61736a3229@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_112156_894964_4617B068 
X-CRM114-Status: UNSURE (   9.20  )
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

Hi Charlie,

kernel test robot noticed the following build errors:

[auto build test ERROR on ffd294d346d185b70e28b1a28abe367bbfe53c04]

url:    https://github.com/intel-lab-lkp/linux/commits/Charlie-Jenkins/riscv-Add-runtime-constant-support/20250204-044527
base:   ffd294d346d185b70e28b1a28abe367bbfe53c04
patch link:    https://lore.kernel.org/r/20250203-runtime_const_riscv-v5-1-bc61736a3229%40rivosinc.com
patch subject: [PATCH v5] riscv: Add runtime constant support
config: riscv-randconfig-r072-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120355.WlAf0wvw-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120355.WlAf0wvw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120355.WlAf0wvw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/dcache.c:112:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax' [-Winline-asm]
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:52:19: note: expanded from macro 'runtime_const_ptr'
                           ".option push\n\t"                              \
                                          ^
   <inline asm>:32:10: note: instantiated into assembly here
           .option arch,+zba
                   ^
>> fs/dcache.c:112:9: error: instruction requires the following: 'Zba' (Address Generation Instructions)
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:54:32: note: expanded from macro 'runtime_const_ptr'
                           "slli   %[__tmp],%[__tmp],32\n\t"               \
                                                         ^
   <inline asm>:34:2: note: instantiated into assembly here
           add.uw a1,a1,a3
           ^
>> fs/dcache.c:112:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax' [-Winline-asm]
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:60:19: note: expanded from macro 'runtime_const_ptr'
                           ".option push\n\t"                              \
                                          ^
   <inline asm>:59:10: note: instantiated into assembly here
           .option arch,+zbkb
                   ^
>> fs/dcache.c:112:9: error: instruction requires the following: 'Zbp' (Permutation 'Zb' Instructions) or 'Zbkb' (Bitmanip instructions for Cryptography)
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:61:25: note: expanded from macro 'runtime_const_ptr'
                           ".option arch,+zbkb\n\t"                        \
                                                ^
   <inline asm>:60:2: note: instantiated into assembly here
           pack    a1,a1,a3
           ^
>> fs/dcache.c:112:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax' [-Winline-asm]
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:52:19: note: expanded from macro 'runtime_const_ptr'
                           ".option push\n\t"                              \
                                          ^
   <inline asm>:32:10: note: instantiated into assembly here
           .option arch,+zba
                   ^
>> fs/dcache.c:112:9: error: instruction requires the following: 'Zba' (Address Generation Instructions)
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:54:32: note: expanded from macro 'runtime_const_ptr'
                           "slli   %[__tmp],%[__tmp],32\n\t"               \
                                                         ^
   <inline asm>:34:2: note: instantiated into assembly here
           add.uw a3,a3,a4
           ^
>> fs/dcache.c:112:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax' [-Winline-asm]
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:60:19: note: expanded from macro 'runtime_const_ptr'
                           ".option push\n\t"                              \
                                          ^
   <inline asm>:59:10: note: instantiated into assembly here
           .option arch,+zbkb
                   ^
>> fs/dcache.c:112:9: error: instruction requires the following: 'Zbp' (Permutation 'Zb' Instructions) or 'Zbkb' (Bitmanip instructions for Cryptography)
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:61:25: note: expanded from macro 'runtime_const_ptr'
                           ".option arch,+zbkb\n\t"                        \
                                                ^
   <inline asm>:60:2: note: instantiated into assembly here
           pack    a3,a3,a4
           ^
>> fs/dcache.c:112:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax' [-Winline-asm]
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:52:19: note: expanded from macro 'runtime_const_ptr'
                           ".option push\n\t"                              \
                                          ^
   <inline asm>:32:10: note: instantiated into assembly here
           .option arch,+zba
                   ^
>> fs/dcache.c:112:9: error: instruction requires the following: 'Zba' (Address Generation Instructions)
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:54:32: note: expanded from macro 'runtime_const_ptr'
                           "slli   %[__tmp],%[__tmp],32\n\t"               \
                                                         ^
   <inline asm>:34:2: note: instantiated into assembly here
           add.uw a0,a0,a1
           ^
>> fs/dcache.c:112:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax' [-Winline-asm]
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:60:19: note: expanded from macro 'runtime_const_ptr'
                           ".option push\n\t"                              \
                                          ^
   <inline asm>:59:10: note: instantiated into assembly here
           .option arch,+zbkb
                   ^
>> fs/dcache.c:112:9: error: instruction requires the following: 'Zbp' (Permutation 'Zb' Instructions) or 'Zbkb' (Bitmanip instructions for Cryptography)
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:61:25: note: expanded from macro 'runtime_const_ptr'
                           ".option arch,+zbkb\n\t"                        \
                                                ^
   <inline asm>:60:2: note: instantiated into assembly here
           pack    a0,a0,a1
           ^
>> fs/dcache.c:112:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax' [-Winline-asm]
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:52:19: note: expanded from macro 'runtime_const_ptr'
                           ".option push\n\t"                              \
                                          ^
   <inline asm>:32:10: note: instantiated into assembly here
           .option arch,+zba
                   ^
>> fs/dcache.c:112:9: error: instruction requires the following: 'Zba' (Address Generation Instructions)
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:54:32: note: expanded from macro 'runtime_const_ptr'
                           "slli   %[__tmp],%[__tmp],32\n\t"               \
                                                         ^
   <inline asm>:34:2: note: instantiated into assembly here
           add.uw a1,a1,a2
           ^
>> fs/dcache.c:112:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax' [-Winline-asm]
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:60:19: note: expanded from macro 'runtime_const_ptr'
                           ".option push\n\t"                              \
                                          ^
   <inline asm>:59:10: note: instantiated into assembly here
           .option arch,+zbkb
                   ^
>> fs/dcache.c:112:9: error: instruction requires the following: 'Zbp' (Permutation 'Zb' Instructions) or 'Zbkb' (Bitmanip instructions for Cryptography)
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:61:25: note: expanded from macro 'runtime_const_ptr'
                           ".option arch,+zbkb\n\t"                        \
                                                ^
   <inline asm>:60:2: note: instantiated into assembly here
           pack    a1,a1,a2
           ^
>> fs/dcache.c:112:9: error: invalid .org offset '21034' (at offset '21038')
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:47:3: note: expanded from macro 'runtime_const_ptr'
                   ALTERNATIVE_2(                                          \
                   ^
   arch/riscv/include/asm/alternative-macros.h:163:2: note: expanded from macro 'ALTERNATIVE_2'
           _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,     \
           ^
   arch/riscv/include/asm/alternative-macros.h:108:2: note: expanded from macro '_ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),    \
           ^
   arch/riscv/include/asm/alternative-macros.h:98:2: note: expanded from macro '__ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, patch_id_1, enable_1)    \
           ^
   arch/riscv/include/asm/alternative-macros.h:94:2: note: expanded from macro '__ALTERNATIVE_CFG'
           ALT_NEW_CONTENT(vendor_id, patch_id, enable, new_c)
           ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
            ^
   <inline asm>:41:6: note: instantiated into assembly here
   .org    . - (887b - 886b) + (889b - 888b)
           ^
   fs/dcache.c:112:9: error: invalid .org offset '21050' (at offset '21054')
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:47:3: note: expanded from macro 'runtime_const_ptr'
                   ALTERNATIVE_2(                                          \
                   ^
   arch/riscv/include/asm/alternative-macros.h:163:2: note: expanded from macro 'ALTERNATIVE_2'
           _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,     \
           ^
   arch/riscv/include/asm/alternative-macros.h:108:2: note: expanded from macro '_ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),    \
           ^
   arch/riscv/include/asm/alternative-macros.h:99:2: note: expanded from macro '__ALTERNATIVE_CFG_2'
           ALT_NEW_CONTENT(vendor_id_2, patch_id_2, enable_2, new_c_2)
           ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
            ^
   <inline asm>:68:6: note: instantiated into assembly here
   .org    . - (887b - 886b) + (889b - 888b)
           ^
   fs/dcache.c:112:9: error: invalid .org offset '21066' (at offset '21070')
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:47:3: note: expanded from macro 'runtime_const_ptr'
                   ALTERNATIVE_2(                                          \
                   ^
   arch/riscv/include/asm/alternative-macros.h:163:2: note: expanded from macro 'ALTERNATIVE_2'
           _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,     \
           ^
   arch/riscv/include/asm/alternative-macros.h:108:2: note: expanded from macro '_ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),    \
           ^
   arch/riscv/include/asm/alternative-macros.h:98:2: note: expanded from macro '__ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, patch_id_1, enable_1)    \
           ^
   arch/riscv/include/asm/alternative-macros.h:94:2: note: expanded from macro '__ALTERNATIVE_CFG'
           ALT_NEW_CONTENT(vendor_id, patch_id, enable, new_c)
           ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
            ^
   <inline asm>:41:6: note: instantiated into assembly here
   .org    . - (887b - 886b) + (889b - 888b)
           ^
   fs/dcache.c:112:9: error: invalid .org offset '21082' (at offset '21086')
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:47:3: note: expanded from macro 'runtime_const_ptr'
                   ALTERNATIVE_2(                                          \
                   ^
   arch/riscv/include/asm/alternative-macros.h:163:2: note: expanded from macro 'ALTERNATIVE_2'
           _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,     \
           ^
   arch/riscv/include/asm/alternative-macros.h:108:2: note: expanded from macro '_ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),    \
           ^
   arch/riscv/include/asm/alternative-macros.h:99:2: note: expanded from macro '__ALTERNATIVE_CFG_2'
           ALT_NEW_CONTENT(vendor_id_2, patch_id_2, enable_2, new_c_2)
           ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
            ^
   <inline asm>:68:6: note: instantiated into assembly here
   .org    . - (887b - 886b) + (889b - 888b)
           ^
   fs/dcache.c:112:9: error: invalid .org offset '21098' (at offset '21102')
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:47:3: note: expanded from macro 'runtime_const_ptr'
                   ALTERNATIVE_2(                                          \
                   ^
   arch/riscv/include/asm/alternative-macros.h:163:2: note: expanded from macro 'ALTERNATIVE_2'
           _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,     \
           ^
   arch/riscv/include/asm/alternative-macros.h:108:2: note: expanded from macro '_ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),    \
           ^
   arch/riscv/include/asm/alternative-macros.h:98:2: note: expanded from macro '__ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, patch_id_1, enable_1)    \
           ^
   arch/riscv/include/asm/alternative-macros.h:94:2: note: expanded from macro '__ALTERNATIVE_CFG'
           ALT_NEW_CONTENT(vendor_id, patch_id, enable, new_c)
           ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
            ^
   <inline asm>:41:6: note: instantiated into assembly here
   .org    . - (887b - 886b) + (889b - 888b)
           ^
   fs/dcache.c:112:9: error: invalid .org offset '21114' (at offset '21118')
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:47:3: note: expanded from macro 'runtime_const_ptr'
                   ALTERNATIVE_2(                                          \
                   ^
   arch/riscv/include/asm/alternative-macros.h:163:2: note: expanded from macro 'ALTERNATIVE_2'
           _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,     \
           ^
   arch/riscv/include/asm/alternative-macros.h:108:2: note: expanded from macro '_ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),    \
           ^
   arch/riscv/include/asm/alternative-macros.h:99:2: note: expanded from macro '__ALTERNATIVE_CFG_2'
           ALT_NEW_CONTENT(vendor_id_2, patch_id_2, enable_2, new_c_2)
           ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
            ^
   <inline asm>:68:6: note: instantiated into assembly here
   .org    . - (887b - 886b) + (889b - 888b)
           ^
   fs/dcache.c:112:9: error: invalid .org offset '21130' (at offset '21134')
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:47:3: note: expanded from macro 'runtime_const_ptr'
                   ALTERNATIVE_2(                                          \
                   ^
   arch/riscv/include/asm/alternative-macros.h:163:2: note: expanded from macro 'ALTERNATIVE_2'
           _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,     \
           ^
   arch/riscv/include/asm/alternative-macros.h:108:2: note: expanded from macro '_ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),    \
           ^
   arch/riscv/include/asm/alternative-macros.h:98:2: note: expanded from macro '__ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, patch_id_1, enable_1)    \
           ^
   arch/riscv/include/asm/alternative-macros.h:94:2: note: expanded from macro '__ALTERNATIVE_CFG'
           ALT_NEW_CONTENT(vendor_id, patch_id, enable, new_c)
           ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
            ^
   <inline asm>:41:6: note: instantiated into assembly here
   .org    . - (887b - 886b) + (889b - 888b)
           ^
   fs/dcache.c:112:9: error: invalid .org offset '21146' (at offset '21150')
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:47:3: note: expanded from macro 'runtime_const_ptr'
                   ALTERNATIVE_2(                                          \
                   ^
   arch/riscv/include/asm/alternative-macros.h:163:2: note: expanded from macro 'ALTERNATIVE_2'
           _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,     \
           ^
   arch/riscv/include/asm/alternative-macros.h:108:2: note: expanded from macro '_ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),    \
           ^
   arch/riscv/include/asm/alternative-macros.h:99:2: note: expanded from macro '__ALTERNATIVE_CFG_2'
           ALT_NEW_CONTENT(vendor_id_2, patch_id_2, enable_2, new_c_2)
           ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
            ^
   <inline asm>:68:6: note: instantiated into assembly here
   .org    . - (887b - 886b) + (889b - 888b)
           ^
>> fs/dcache.c:112:9: error: invalid .org offset '21034' (at offset '21038')
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:47:3: note: expanded from macro 'runtime_const_ptr'
                   ALTERNATIVE_2(                                          \
                   ^
   arch/riscv/include/asm/alternative-macros.h:163:2: note: expanded from macro 'ALTERNATIVE_2'
           _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,     \
           ^
   arch/riscv/include/asm/alternative-macros.h:108:2: note: expanded from macro '_ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),    \
           ^
   arch/riscv/include/asm/alternative-macros.h:98:2: note: expanded from macro '__ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, patch_id_1, enable_1)    \
           ^
   arch/riscv/include/asm/alternative-macros.h:94:2: note: expanded from macro '__ALTERNATIVE_CFG'
           ALT_NEW_CONTENT(vendor_id, patch_id, enable, new_c)
           ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
            ^
   <inline asm>:41:6: note: instantiated into assembly here
   .org    . - (887b - 886b) + (889b - 888b)
           ^
   fs/dcache.c:112:9: error: invalid .org offset '21050' (at offset '21054')
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:47:3: note: expanded from macro 'runtime_const_ptr'
                   ALTERNATIVE_2(                                          \
                   ^
   arch/riscv/include/asm/alternative-macros.h:163:2: note: expanded from macro 'ALTERNATIVE_2'
           _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,     \
           ^
   arch/riscv/include/asm/alternative-macros.h:108:2: note: expanded from macro '_ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),    \
           ^
   arch/riscv/include/asm/alternative-macros.h:99:2: note: expanded from macro '__ALTERNATIVE_CFG_2'
           ALT_NEW_CONTENT(vendor_id_2, patch_id_2, enable_2, new_c_2)
           ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
            ^
   <inline asm>:68:6: note: instantiated into assembly here
   .org    . - (887b - 886b) + (889b - 888b)
           ^
   fs/dcache.c:112:9: error: invalid .org offset '21066' (at offset '21070')
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:47:3: note: expanded from macro 'runtime_const_ptr'
                   ALTERNATIVE_2(                                          \
                   ^
   arch/riscv/include/asm/alternative-macros.h:163:2: note: expanded from macro 'ALTERNATIVE_2'
           _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,     \
           ^
   arch/riscv/include/asm/alternative-macros.h:108:2: note: expanded from macro '_ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),    \
           ^
   arch/riscv/include/asm/alternative-macros.h:98:2: note: expanded from macro '__ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, patch_id_1, enable_1)    \
           ^
   arch/riscv/include/asm/alternative-macros.h:94:2: note: expanded from macro '__ALTERNATIVE_CFG'
           ALT_NEW_CONTENT(vendor_id, patch_id, enable, new_c)
           ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
            ^
   <inline asm>:41:6: note: instantiated into assembly here
   .org    . - (887b - 886b) + (889b - 888b)
           ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   8 warnings and 20 errors generated.


vim +/Zba +112 fs/dcache.c

ceb5bdc2d246f6 Nicholas Piggin 2011-01-07  109  
e60cc61153e61e Linus Torvalds  2024-06-10  110  static inline struct hlist_bl_head *d_hash(unsigned long hashlen)
ceb5bdc2d246f6 Nicholas Piggin 2011-01-07  111  {
e78298556ee5d8 Linus Torvalds  2024-06-04 @112  	return runtime_const_ptr(dentry_hashtable) +
e78298556ee5d8 Linus Torvalds  2024-06-04  113  		runtime_const_shift_right_32(hashlen, d_hash_shift);
ceb5bdc2d246f6 Nicholas Piggin 2011-01-07  114  }
ceb5bdc2d246f6 Nicholas Piggin 2011-01-07  115  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
