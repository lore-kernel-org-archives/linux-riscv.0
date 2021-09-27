Return-Path: <SRS0=npS7=OR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C99C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 10:50:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9D8E60F4B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 10:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9D8E60F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tDW60Uz5JP3BhRknbtPCpDIJhHkWnHmQvOos9ddKtGs=; b=3iMw/1EmAvbcNi
	jNc88ay4TM0rOnadmfr9zy+KvD86fN+BC/lPl+7UzPTX7XYaLM/VA9rzME6C2hPwGXZA0P72UyvdK
	QJjyMaWNJLWDZIQkMwjIrIb87uH9LR4DOY5b3utRNO6clHhRjcq6X3UdWclhxOdoR/fA78i/3cpN4
	uMvObe7u15zX3AEHmdBdRQ5PD/VKdvbz2Tz7S3TemYEZfh3uvsk10PsJ3CjoXDtOM5xrsNlUqi40P
	/tovmC2RQyIW6uiw0zC/D0GAM3LF8GX054YgElSbjOW5XUQ7WaLbSR91QrR8S0fUK/Hfd2be1BENY
	JNx1mzrWXWTTaVHo8eWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUoCY-002LR5-BA; Mon, 27 Sep 2021 10:49:38 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUoCV-002LQ1-0P
 for linux-riscv@lists.infradead.org; Mon, 27 Sep 2021 10:49:36 +0000
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by linux.microsoft.com (Postfix) with ESMTPSA id BA79D20B4841
 for <linux-riscv@lists.infradead.org>; Mon, 27 Sep 2021 03:49:32 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BA79D20B4841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1632739772;
 bh=VZvw/wIlq/UcIn6rQL0WGXaz3mDbsqOb4IhjmRl4FHY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Pw7JHDXW5hAtNU1o+qCli2Bl5b7+zDkuD+JHUDwagxb7XcKsBrCOm4nWD7s3RqNNx
 T5R3SD7qZVctJCrTpSZ9BBTH0fIRnR1iZdfUEmgC6yDdg6NqqhIHApsgcHo9kTS4Ns
 BJ0NKbmav13sVT5kQEe5hvU0jwYc7kJXpxCT1wjk=
Received: by mail-pj1-f50.google.com with SMTP id me1so12134488pjb.4
 for <linux-riscv@lists.infradead.org>; Mon, 27 Sep 2021 03:49:32 -0700 (PDT)
X-Gm-Message-State: AOAM532Ry5j+NWZ9IuA0SisLxs1bway0auTXy+GxGdBnq7KN1tmyAE25
 EiSdePPnlM3aeFGRmTFW2z01odOA5MAaEKU2T3M=
X-Google-Smtp-Source: ABdhPJwWrdUZbG6u6ik5z6zlzTdgcwT/NZeHyQQPSrmqvewNPKVfDBt9KV1cs+l0aSm29Sx+YJjL60kJr8YCPUPBr04=
X-Received: by 2002:a17:902:7e8a:b0:13d:95e2:d9c2 with SMTP id
 z10-20020a1709027e8a00b0013d95e2d9c2mr21933306pla.8.1632739772259; Mon, 27
 Sep 2021 03:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210919192104.98592-3-mcroce@linux.microsoft.com>
 <202109200526.YYwdkOeI-lkp@intel.com>
In-Reply-To: <202109200526.YYwdkOeI-lkp@intel.com>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Mon, 27 Sep 2021 12:48:56 +0200
X-Gmail-Original-Message-ID: <CAFnufp2bhWVd-SdSaK3ppFNkoBpJa+-0+kSrWzdxrmYNjyM+Zg@mail.gmail.com>
Message-ID: <CAFnufp2bhWVd-SdSaK3ppFNkoBpJa+-0+kSrWzdxrmYNjyM+Zg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] riscv: optimized memmove
To: kernel test robot <lkp@intel.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, kbuild-all@lists.01.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>, 
 Emil Renner Berthing <kernel@esmil.dk>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_034935_203599_19717D7D 
X-CRM114-Status: GOOD (  19.30  )
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

On Mon, Sep 20, 2021 at 12:06 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi Matteo,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on linux/master]
> [also build test ERROR on linus/master v5.15-rc1 next-20210917]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Matteo-Croce/riscv-optimized-mem-functions/20210920-032303
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git bdb575f872175ed0ecf2638369da1cb7a6e86a14
> config: riscv-randconfig-r004-20210919 (attached as .config)
> compiler: riscv64-linux-gcc (GCC) 11.2.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/9a948fd7d78a58890608e9dd0f77e5ff84f36e3e
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Matteo-Croce/riscv-optimized-mem-functions/20210920-032303
>         git checkout 9a948fd7d78a58890608e9dd0f77e5ff84f36e3e
>         # save the attached .config to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=riscv SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    arch/riscv/lib/string.c: In function '__memmove':
> >> arch/riscv/lib/string.c:89:7: error: inlining failed in call to 'always_inline' 'memcpy': function body can be overwritten at link time
>       89 | void *memcpy(void *dest, const void *src, size_t count) __weak __alias(__memcpy);
>          |       ^~~~~~
>    arch/riscv/lib/string.c:99:24: note: called from here
>       99 |                 return memcpy(dest, src, count);
>          |                        ^~~~~~~~~~~~~~~~~~~~~~~~
>
>
> vim +89 arch/riscv/lib/string.c
>
> 86c5866e9b7fdd Matteo Croce 2021-09-19  88
> 86c5866e9b7fdd Matteo Croce 2021-09-19 @89  void *memcpy(void *dest, const void *src, size_t count) __weak __alias(__memcpy);
> 86c5866e9b7fdd Matteo Croce 2021-09-19  90  EXPORT_SYMBOL(memcpy);
> 9a948fd7d78a58 Matteo Croce 2021-09-19  91
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

How can we fix this? Maybe calling __memcpy() instead?

-- 
per aspera ad upstream

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
