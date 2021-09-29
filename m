Return-Path: <SRS0=hgxb=OT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E48C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 17:05:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FA2C6124D
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 17:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2FA2C6124D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AzVT5sTTqLWnjR+3tGEGeArgkdGKY0v7sd9TH+oTTZA=; b=W9zUlANBdDJeyE
	WzAJggqJwF0DKAIhx8RdGH6yWCVNUHnXcaYpVh1vzOB4CyUl5I4SCUuzeqJ2I/N3QfdjxsLD+5iqD
	B3odhYBxIDX6htSfUQ3WReUFUkaVNhRGO6XwzDLlShXDghGWtg+t5NUc25UtX6MnqK43gRLbnG/Ey
	TBurpKGoivZgpYF23oX5AeaXfPJ1OwgZ1OASSU03auhHn8rGluetSa2IgA/YryeONck6THeXzCGpr
	ezEDZToH0oq2mAvgiPXatkeOP1kLqvTb2dD3F17gPvXBVIRA7LLkZp3SXhxiFeI0hycKQoj/yx5bS
	o37URXm+bAI/VdaZRzzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVd0O-00Btds-QF; Wed, 29 Sep 2021 17:04:28 +0000
Received: from mail-pl1-f180.google.com ([209.85.214.180])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVd0K-00Btd8-Ta
 for linux-riscv@lists.infradead.org; Wed, 29 Sep 2021 17:04:27 +0000
Received: by mail-pl1-f180.google.com with SMTP id y1so1970515plk.10
 for <linux-riscv@lists.infradead.org>; Wed, 29 Sep 2021 10:04:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y2x6S7nH9jaik0J6Z6GU8rfIpZ/ztNMY7uEdNTzinB8=;
 b=w5MVGdPh6rRVz8lrhD5MiIP1tvUZlRAtcB7mrUsBjfdiGZYNxNJMCNoueyCkoLHmpA
 u0Mz35qkVj7iHoUT5ph0YdGP89mk1PAsXSGzzAj2Lk5GdvotgEm9uOQPymt0hBJTUG7o
 ts1/zgW6lD8ckxnggLRPE7iNKw2Cb3ZPkafuRoxYkSNtwExnHIfg2BFPLnCG4nOcQnEX
 XWQOEVyciw+psG0HhnOkVYCryIOh7/2Jcj0w2BreQRhcFhR77RqL+o3P2guSfN8Tt276
 SXGyWSSWfqnZI5nKLz5ZltOuQy35v+Glq8I6Jitwr/uSs0blDmZ2kT5HEPmVTMCRflmk
 5eGg==
X-Gm-Message-State: AOAM5325YCWPGh0c3nV+VIlMFiuZDnjE6gugTWv1Usduz6ISv5efJIg9
 sO6KAviBrQ34P4/myr0BFGMu1J46w1A14dpzaMo=
X-Google-Smtp-Source: ABdhPJxT8uO+Fpw/lmKF8geLN6eHCgcaUhnslCjW0B2FOboNDfjtzqhoq/qeUW03OjhljwftVbkdKlD3NO8xEjkvSLk=
X-Received: by 2002:a17:90b:390:: with SMTP id
 ga16mr7637268pjb.185.1632935062753; 
 Wed, 29 Sep 2021 10:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210919192104.98592-3-mcroce@linux.microsoft.com>
 <202109200526.YYwdkOeI-lkp@intel.com>
 <CAFnufp2bhWVd-SdSaK3ppFNkoBpJa+-0+kSrWzdxrmYNjyM+Zg@mail.gmail.com>
In-Reply-To: <CAFnufp2bhWVd-SdSaK3ppFNkoBpJa+-0+kSrWzdxrmYNjyM+Zg@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Wed, 29 Sep 2021 19:04:11 +0200
Message-ID: <CANBLGcyxwKCkFD2Z3S8SiWRWcVgshGxgT1YyVcJrc6DHUV4r2w@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] riscv: optimized memmove
To: Matteo Croce <mcroce@linux.microsoft.com>
Cc: kernel test robot <lkp@intel.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, kbuild-all@lists.01.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>, 
 Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_100424_982943_14466C99 
X-CRM114-Status: GOOD (  23.30  )
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

On Mon, 27 Sept 2021 at 12:49, Matteo Croce <mcroce@linux.microsoft.com> wrote:
>
> On Mon, Sep 20, 2021 at 12:06 AM kernel test robot <lkp@intel.com> wrote:
> >
> > Hi Matteo,
> >
> > Thank you for the patch! Yet something to improve:
> >
> > [auto build test ERROR on linux/master]
> > [also build test ERROR on linus/master v5.15-rc1 next-20210917]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch]
> >
> > url:    https://github.com/0day-ci/linux/commits/Matteo-Croce/riscv-optimized-mem-functions/20210920-032303
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git bdb575f872175ed0ecf2638369da1cb7a6e86a14
> > config: riscv-randconfig-r004-20210919 (attached as .config)
> > compiler: riscv64-linux-gcc (GCC) 11.2.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://github.com/0day-ci/linux/commit/9a948fd7d78a58890608e9dd0f77e5ff84f36e3e
> >         git remote add linux-review https://github.com/0day-ci/linux
> >         git fetch --no-tags linux-review Matteo-Croce/riscv-optimized-mem-functions/20210920-032303
> >         git checkout 9a948fd7d78a58890608e9dd0f77e5ff84f36e3e
> >         # save the attached .config to linux build tree
> >         mkdir build_dir
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=riscv SHELL=/bin/bash
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> >    arch/riscv/lib/string.c: In function '__memmove':
> > >> arch/riscv/lib/string.c:89:7: error: inlining failed in call to 'always_inline' 'memcpy': function body can be overwritten at link time
> >       89 | void *memcpy(void *dest, const void *src, size_t count) __weak __alias(__memcpy);
> >          |       ^~~~~~
> >    arch/riscv/lib/string.c:99:24: note: called from here
> >       99 |                 return memcpy(dest, src, count);
> >          |                        ^~~~~~~~~~~~~~~~~~~~~~~~
> >
> >
> > vim +89 arch/riscv/lib/string.c
> >
> > 86c5866e9b7fdd Matteo Croce 2021-09-19  88
> > 86c5866e9b7fdd Matteo Croce 2021-09-19 @89  void *memcpy(void *dest, const void *src, size_t count) __weak __alias(__memcpy);
> > 86c5866e9b7fdd Matteo Croce 2021-09-19  90  EXPORT_SYMBOL(memcpy);
> > 9a948fd7d78a58 Matteo Croce 2021-09-19  91
> >
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>
> How can we fix this? Maybe calling __memcpy() instead?

Yes, that fixes building with CONFIG_FORTIFY_SOURCE=y for me. Kasan
already wraps memmove itself, so it should be fine to call __memcpy
directly.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
