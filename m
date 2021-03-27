Return-Path: <SRS0=+x6g=IZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE64C433C1
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Mar 2021 01:56:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 042406196C
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Mar 2021 01:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 042406196C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i/n7BCdfw1Mm3G1+HZDu/nWS79OoCt/Wp0TrLmb5hSg=; b=GtAyfzL96KkxzFYx0JFOKu/Ai
	yyZ4Q0J9Wo/rGlcuHBp6GAtTyCQcI5EUP+pzRwKSCRVce/rodmhjxihAD1sw7XWM1cprhy/rOquzn
	o16Y2+lQ8X2RMVXSoaMZB7QYwUzPlMattFbvPZmSRGE/x2meIj9uJmshBRb8YwYZWaXUb8Iv1f4Am
	VhP18SpxKuIsTcC7b93Dy8mYaKI/vKtUpIrP1GNNrSElp8qvL6a1BNf3UDeYLIgcHuxpRVuxfhg1S
	bJddcqIPJexIDPgBDbmvPTbdViFNwmV1z+mmOLvAQjS5ERwc28YLH2fjhU2ErTCiZxoS+XVMg8BYa
	qPWZsbUYg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPyBr-004ced-Kc; Sat, 27 Mar 2021 01:56:39 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPyBo-004ceK-31
 for linux-riscv@lists.infradead.org; Sat, 27 Mar 2021 01:56:38 +0000
Received: by mail-pg1-x532.google.com with SMTP id l76so5771157pga.6
 for <linux-riscv@lists.infradead.org>; Fri, 26 Mar 2021 18:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=faYFDe+Adytg87HgOtz6HNNmF/jVigxYTlJk0XlAIQ0=;
 b=DwrU03JJgXDLNXV9CeSQFMYZg9ID2Gwy+ks485GC+5Zp755Y4XJSnYDr1AMi+gQ3f8
 0nz/Dr9OSBGKntXMhgp/VgCZxEC12QDkH+CJieeYimiH9GmzU8fe8J6cNjl9DJDxmldM
 7RDlELGLVFRbXag5mjhmYnpFgpfrn8iIJXhAKC2liQdYD+aowGiw/u/sicBfSYR9gtQv
 /sVHiFQ8CQEHTA/7OK8a0VkrEczfpDC+ajlBZCKR8K094T6kZA8quuBaKF4ErrW901oE
 kHq99erSohY37QeM8nwwfK3U/Ag+JEkArjZO+lTNFzNiG2Ap3ms1bQEu2LLote727LYi
 zWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=faYFDe+Adytg87HgOtz6HNNmF/jVigxYTlJk0XlAIQ0=;
 b=deomdF2ea49N8cf/U4rH4xyyZtV1c5XuRPwo9ipvHDl5HQod9tTIpKis3Ops930FU5
 yzFu4b8ADqCY0HTk7oYjt+11xz4EU4J0ROyGHegphGhQozaaSEGGR0c3jQ5v/L4h/X8R
 4j44k4FmDORf8rPMbDbHm7iJ4G5aXBbT8hBYboBgXCGfgrFEOsNWC0GEbpoNtjWWHiuJ
 mVUmEnMreSjLBGuE5qMYyQ2qD2WycOnZYJW68RjLnwdBPkcLK8XbD9+o36Ou5IGQheRA
 YarZy5KbFvuP9Du9Eb8k4bGPL6n2HWrO1A2tXWm4HsTlUE1bbEk12l5GAvCeZlUclr+4
 N8sQ==
X-Gm-Message-State: AOAM532KzTJPkZnEUOvX6KWC598SapILxkOzgeXKFUl+qxk3/+r/ZZ/T
 xUFZZi07g9XOiZ4j1fgn767pXw==
X-Google-Smtp-Source: ABdhPJwQwT+cQCgAMJ2LQ1829fA4S6VlDz+F2P8G7mPGEAWyzQ40N2eIjXfzdDIs53RaBR5Vek19Hg==
X-Received: by 2002:a62:d414:0:b029:217:24b8:a5b9 with SMTP id
 a20-20020a62d4140000b029021724b8a5b9mr16044288pfh.41.1616810193297; 
 Fri, 26 Mar 2021 18:56:33 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:0:5dbf:19de:725b:1861])
 by smtp.gmail.com with ESMTPSA id 22sm9722499pjl.31.2021.03.26.18.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 18:56:32 -0700 (PDT)
Date: Fri, 26 Mar 2021 18:56:29 -0700
From: Fangrui Song <maskray@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, kbuild-all@lists.01.org,
 clang-built-linux@googlegroups.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Use $(LD) instead of $(CC) to link vDSO
Message-ID: <20210327015629.eecu77zvm4iri657@google.com>
References: <20210325215156.1986901-1-nathan@kernel.org>
 <202103262325.9ejJuOqf-lkp@intel.com>
 <20210326235839.zgfvmtfxrb3hy6i4@archlinux-ax161>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210326235839.zgfvmtfxrb3hy6i4@archlinux-ax161>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_015636_319261_EB83CB19 
X-CRM114-Status: GOOD (  24.10  )
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


On 2021-03-26, Nathan Chancellor wrote:
>On Sat, Mar 27, 2021 at 12:05:34AM +0800, kernel test robot wrote:
>> Hi Nathan,
>>
>> I love your patch! Yet something to improve:
>>
>> [auto build test ERROR on linus/master]
>> [also build test ERROR on v5.12-rc4 next-20210326]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch]
>>
>> url:    https://github.com/0day-ci/linux/commits/Nathan-Chancellor/riscv-Use-LD-instead-of-CC-to-link-vDSO/20210326-055421
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 002322402dafd846c424ffa9240a937f49b48c42
>> config: riscv-randconfig-r032-20210326 (attached as .config)
>> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project f490a5969bd52c8a48586f134ff8f02ccbb295b3)
>> reproduce (this is a W=1 build):
>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         # install riscv cross compiling tool for clang build
>>         # apt-get install binutils-riscv64-linux-gnu
>>         # https://github.com/0day-ci/linux/commit/dfdcaf93f40f0d15ffc3f25128442c1688e612d6
>>         git remote add linux-review https://github.com/0day-ci/linux
>>         git fetch --no-tags linux-review Nathan-Chancellor/riscv-Use-LD-instead-of-CC-to-link-vDSO/20210326-055421
>>         git checkout dfdcaf93f40f0d15ffc3f25128442c1688e612d6
>>         # save the attached .config to linux build tree
>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv
>
>For the record, I tried to use this script to reproduce but it has a
>couple of bugs:
>
>1. It does not download the right version of clang. This report says
>that it is clang-13 but the one that the script downloaded is clang-12.
>
>2. It does not download it to the right location. The script expects
>~/0day/clang-latest but it is downloaded to ~/0day/clang it seems. I
>symlinked it to get around it.
>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>> >> riscv64-linux-gnu-objcopy: 'arch/riscv/kernel/vdso/vdso.so.dbg': No such file
>
>This error only occurs because of errors before it that are not shown
>due to a denylist:
>
>ld.lld: error: arch/riscv/kernel/vdso/rt_sigreturn.o:(.text+0x0): relocation R_RISCV_ALIGN requires unimplemented linker relaxation; recompile with -mno-relax
>ld.lld: error: arch/riscv/kernel/vdso/getcpu.o:(.text+0x0): relocation R_RISCV_ALIGN requires unimplemented linker relaxation; recompile with -mno-relax
>ld.lld: error: arch/riscv/kernel/vdso/flush_icache.o:(.text+0x0): relocation R_RISCV_ALIGN requires unimplemented linker relaxation; recompile with -mno-relax
>
>My patch only adds another occurrence of this error because we move from
>$(CC)'s default linker (in clang's case, ld.bfd) to $(LD), which in the
>case of 0day appears to be ld.lld. ld.lld should not be used with RISC-V
>in its current form due to errors of this nature, which happen without
>my patch as well:
>
>https://github.com/ClangBuiltLinux/linux/issues/1020
>
>Linker relaxation in ld.lld for RISC-V is an ongoing debate/process.
>Please give RISC-V the current treatment as s390 with ld.lld for the
>time being to get meaningful reports. We will reach out once that issue
>has been resolved.

>TL;DR: Patch exposes existing issue with LD=ld.lld that would have
>happened without it in different areas, the report can be ignored.

Yes, lkp frequently reports this error. It can be suppressed by using
-mno-relax... if ld.lld is picked.

Hmm. This motivated me to file
https://github.com/riscv/riscv-elf-psabi-doc/issues/183
R_RISCV_ALIGN friendly to linkers not supporting relaxation (riscv_relax_delete_bytes).

>Cheers!
>Nathan
>
>-- 
>You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
>To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
>To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210326235839.zgfvmtfxrb3hy6i4%40archlinux-ax161.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
