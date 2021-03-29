Return-Path: <SRS0=/EkZ=I3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B3DC433C1
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 18:45:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3CB261969
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 18:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3CB261969
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xZo/rR8qPzSxSYrlT08ZOAesZaXorXKavNxYG9S43wk=; b=GVX3iGzfrK4EsvOium/WX4CX3
	EwUbpiL+qhWhXcRsw2/OwP6iJ2f9i4Usphon/4vo7aOlXmQWQ6i9qQp7s336IWfId04Fg6ghOlLXF
	KCJa0ESH4hkf7Bc+bMnUBQvXGbWc/zqgNacJUqpv8UNwQEvEqrq6BxJOqqCA95jLlDyKbsu0a561k
	XIcEDOGq61IZMKRYLpa3TXVYwrMQPNaZBaafQZ1JRcIkiZzxae/Wule/dTTPPpgmy0cSrgUa4f95i
	bpQDSb3Y7xrwCJ6hb8CEK4qwAVE4KwThzE48LDU7NiotyDTokAqfQYwDdaFsbrwxiMXtyRBlFvWvN
	52NYWJqLQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQwsJ-0016Zv-UW; Mon, 29 Mar 2021 18:44:33 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQpPZ-000aqw-Lh
 for linux-riscv@lists.infradead.org; Mon, 29 Mar 2021 10:46:24 +0000
IronPort-SDR: J8Bh00OtQOtcvR5eMc59RLT5bcIBZpMOPbQmVTXugCxLo1AstJng45opu1yVy/II2yubHuPAhL
 8RSM0BC3uO9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="191526594"
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; d="scan'208";a="191526594"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 00:42:27 -0700
IronPort-SDR: +bj0GNmaDCIDQpC/lE/D6oIyk0dxw6sNBfn5iHu2X2lW/pusr6wPPtsC/IszM9sLDhzvm+pw80
 Hp5BDIdcyAAg==
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; d="scan'208";a="417548286"
Received: from shao2-debian.sh.intel.com (HELO [10.239.13.11]) ([10.239.13.11])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 00:42:24 -0700
Subject: Re: [kbuild-all] Re: [PATCH] riscv: Use $(LD) instead of $(CC) to
 link vDSO
To: Nathan Chancellor <nathan@kernel.org>, kernel test robot <lkp@intel.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210325215156.1986901-1-nathan@kernel.org>
 <202103262325.9ejJuOqf-lkp@intel.com>
 <20210326235839.zgfvmtfxrb3hy6i4@archlinux-ax161>
From: Rong Chen <rong.a.chen@intel.com>
Message-ID: <39afa2f7-c925-c1dd-669a-6c019b11cbdf@intel.com>
Date: Mon, 29 Mar 2021 15:41:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20210326235839.zgfvmtfxrb3hy6i4@archlinux-ax161>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_114622_164159_6885B61D 
X-CRM114-Status: GOOD (  31.93  )
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

Hi Nathan,

On 3/27/21 7:58 AM, Nathan Chancellor wrote:
> On Sat, Mar 27, 2021 at 12:05:34AM +0800, kernel test robot wrote:
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
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # install riscv cross compiling tool for clang build
>>          # apt-get install binutils-riscv64-linux-gnu
>>          # https://github.com/0day-ci/linux/commit/dfdcaf93f40f0d15ffc3f25128442c1688e612d6
>>          git remote add linux-review https://github.com/0day-ci/linux
>>          git fetch --no-tags linux-review Nathan-Chancellor/riscv-Use-LD-instead-of-CC-to-link-vDSO/20210326-055421
>>          git checkout dfdcaf93f40f0d15ffc3f25128442c1688e612d6
>>          # save the attached .config to linux build tree
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv
> For the record, I tried to use this script to reproduce but it has a
> couple of bugs:
>
> 1. It does not download the right version of clang. This report says
> that it is clang-13 but the one that the script downloaded is clang-12.
>
> 2. It does not download it to the right location. The script expects
> ~/0day/clang-latest but it is downloaded to ~/0day/clang it seems. I
> symlinked it to get around it.

Sorry for the inconvenience, we'll fix both asap.

Best Regards,
Rong Chen

>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>>> riscv64-linux-gnu-objcopy: 'arch/riscv/kernel/vdso/vdso.so.dbg': No such file
> This error only occurs because of errors before it that are not shown
> due to a denylist:
>
> ld.lld: error: arch/riscv/kernel/vdso/rt_sigreturn.o:(.text+0x0): relocation R_RISCV_ALIGN requires unimplemented linker relaxation; recompile with -mno-relax
> ld.lld: error: arch/riscv/kernel/vdso/getcpu.o:(.text+0x0): relocation R_RISCV_ALIGN requires unimplemented linker relaxation; recompile with -mno-relax
> ld.lld: error: arch/riscv/kernel/vdso/flush_icache.o:(.text+0x0): relocation R_RISCV_ALIGN requires unimplemented linker relaxation; recompile with -mno-relax
>
> My patch only adds another occurrence of this error because we move from
> $(CC)'s default linker (in clang's case, ld.bfd) to $(LD), which in the
> case of 0day appears to be ld.lld. ld.lld should not be used with RISC-V
> in its current form due to errors of this nature, which happen without
> my patch as well:
>
> https://github.com/ClangBuiltLinux/linux/issues/1020
>
> Linker relaxation in ld.lld for RISC-V is an ongoing debate/process.
> Please give RISC-V the current treatment as s390 with ld.lld for the
> time being to get meaningful reports. We will reach out once that issue
> has been resolved.
>
> TL;DR: Patch exposes existing issue with LD=ld.lld that would have
> happened without it in different areas, the report can be ignored.
>
> Cheers!
> Nathan
> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
