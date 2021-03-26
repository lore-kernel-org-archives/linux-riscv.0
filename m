Return-Path: <SRS0=uLWX=IY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC58C433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 23:59:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86DD5619BB
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 23:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86DD5619BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/UoE2Ag4B3ETzVIWY8cdvVVl6zawmtWvyL8o1Z1sBJA=; b=OTKbUlUulRYVru3Zki7FzT7OA
	Rg0mefuKgc7ViOewDZIOclEpkL2gizaixtZJRP8ruGsws8uXGoEhUaF2297fJND7+UxBSR8tw9YFm
	xzaYqdao5jlAQQSKQWbDtgVFuANWcb+CThazq2gh/ncgq82Cxb3VVCS0avDac6IWRfmmVXkCL5bVu
	ThvB4DEWqjW/FR0x4SO1lJLAPqwaNVFHKPY2vCY1e1d4UaY1R62xZQPnhxdzSLV3RwHVP59m7uH8s
	v7POxOdTHnrxVD66x9jXc69yHgYNpSxbVidD/JJN6xGAZqFSWEAMukekPWqlyvybfxx9dPjsWKMGk
	kpoZ8JZaw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPwLu-004Xk4-8w; Fri, 26 Mar 2021 23:58:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPwLn-004XjV-R7
 for linux-riscv@lists.infradead.org; Fri, 26 Mar 2021 23:58:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C58BC619E4;
 Fri, 26 Mar 2021 23:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616803124;
 bh=a3dDdnXrrs57TfBaTl7alXhup2BDKH4a64f3EAdGZ+c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c909TIJ9AdLcTMo/bkPIQREacj+dvK3KSQI6QXYhjlSl5QWnBCWVqptHiAhH6J2tU
 VvgRzqOAdyRO6Pl6IxAl9TvzFYXdDGYQOvVjJtPeYiFIU2GwXhBWDlTfhlt6/4MWg7
 I44G03OXSDu8zRn7XTIgdo5qR6WLO3Ya+ceqtxOC0XdPmDmbeADv8qmBKim3GEe5D+
 /KpSsdmIIoZuQeHA9/bYvLtNVigAT86kNiFyyZE0bSFmKwDq8fSDGYZiaa6VnTPIC+
 qAdoSouUBBt4QQcAKlH0anFFzuehabZ3g4b+nXNekEnfe9t2G19ciwwQjJ3RMrSb3u
 fDzOj0pil/xYQ==
Date: Fri, 26 Mar 2021 16:58:39 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, kbuild-all@lists.01.org,
 clang-built-linux@googlegroups.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Use $(LD) instead of $(CC) to link vDSO
Message-ID: <20210326235839.zgfvmtfxrb3hy6i4@archlinux-ax161>
References: <20210325215156.1986901-1-nathan@kernel.org>
 <202103262325.9ejJuOqf-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202103262325.9ejJuOqf-lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_235849_256162_8934EFEF 
X-CRM114-Status: GOOD (  20.84  )
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

On Sat, Mar 27, 2021 at 12:05:34AM +0800, kernel test robot wrote:
> Hi Nathan,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v5.12-rc4 next-20210326]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Nathan-Chancellor/riscv-Use-LD-instead-of-CC-to-link-vDSO/20210326-055421
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 002322402dafd846c424ffa9240a937f49b48c42
> config: riscv-randconfig-r032-20210326 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project f490a5969bd52c8a48586f134ff8f02ccbb295b3)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv64-linux-gnu
>         # https://github.com/0day-ci/linux/commit/dfdcaf93f40f0d15ffc3f25128442c1688e612d6
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Nathan-Chancellor/riscv-Use-LD-instead-of-CC-to-link-vDSO/20210326-055421
>         git checkout dfdcaf93f40f0d15ffc3f25128442c1688e612d6
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv 

For the record, I tried to use this script to reproduce but it has a
couple of bugs:

1. It does not download the right version of clang. This report says
that it is clang-13 but the one that the script downloaded is clang-12.

2. It does not download it to the right location. The script expects
~/0day/clang-latest but it is downloaded to ~/0day/clang it seems. I
symlinked it to get around it.

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> riscv64-linux-gnu-objcopy: 'arch/riscv/kernel/vdso/vdso.so.dbg': No such file

This error only occurs because of errors before it that are not shown
due to a denylist:

ld.lld: error: arch/riscv/kernel/vdso/rt_sigreturn.o:(.text+0x0): relocation R_RISCV_ALIGN requires unimplemented linker relaxation; recompile with -mno-relax
ld.lld: error: arch/riscv/kernel/vdso/getcpu.o:(.text+0x0): relocation R_RISCV_ALIGN requires unimplemented linker relaxation; recompile with -mno-relax
ld.lld: error: arch/riscv/kernel/vdso/flush_icache.o:(.text+0x0): relocation R_RISCV_ALIGN requires unimplemented linker relaxation; recompile with -mno-relax

My patch only adds another occurrence of this error because we move from
$(CC)'s default linker (in clang's case, ld.bfd) to $(LD), which in the
case of 0day appears to be ld.lld. ld.lld should not be used with RISC-V
in its current form due to errors of this nature, which happen without
my patch as well:

https://github.com/ClangBuiltLinux/linux/issues/1020

Linker relaxation in ld.lld for RISC-V is an ongoing debate/process.
Please give RISC-V the current treatment as s390 with ld.lld for the
time being to get meaningful reports. We will reach out once that issue
has been resolved.

TL;DR: Patch exposes existing issue with LD=ld.lld that would have
happened without it in different areas, the report can be ignored.

Cheers!
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
