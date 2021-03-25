Return-Path: <SRS0=pLrx=IX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA895C433E5
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Mar 2021 11:35:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4619C61A27
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Mar 2021 11:35:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4619C61A27
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xIb49HZNjOQPnWX8CLg7lXXMEEKA5SKH8zwQ9MKK8ew=; b=m8S3BiE2uLXXqTMxK1kzkBj3P
	HwG5ihyozYniJ8dS4pRqhKgWYaT0AKuma19VKaqlU3e+z5YgZjcmDnOMYgGYaNn4k2G+5E6ag/aY/
	rq5YuKfz6tbtQ6JBraXNsj5DdpM+YSQlE91ggCupGHVbOaGYlg0oCHsFMWgDNN5Cf1yeCyTPxUAio
	O1+qwK2i0FTw4WTAL5B1MPO3QZNbVK3dNUvv8T8vQV3XMS4ebqxqpWSXr8X/1IBOQRcXUj0pjYQjQ
	IuNE7xdtU/4215PcvmZXZWem9OiG2jek5Xba3sJ6IugyK3W3gzZ9Up3EQQxIT/UTEPuj+d4YrsqG1
	DrDdb0HZg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPOGf-001JQd-Gn; Thu, 25 Mar 2021 11:35:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPOGZ-001JPv-5N
 for linux-riscv@lists.infradead.org; Thu, 25 Mar 2021 11:35:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5FD7A61A4D
 for <linux-riscv@lists.infradead.org>; Thu, 25 Mar 2021 11:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616672102;
 bh=8LNmhoq6g6CBU2dxDceorKNyEZNIJTXJgc3Og50BKL0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZqR83NaJGhYCXRddW4LKTd24rNy3oRaOuUOijIZtdYSsmVNqtLnKcYzHx5FP9Hz5n
 Jabze/8c1Vo9bw50rF9C4kzuUMkb8zDePlPOC8Bwn9HmvCY647yNAnPV6xbK6BPa6x
 ZjxMxkUk7npt9nc9g31qTk79aoJwgQAgYuiH7quJGCXCmA4Q2PeliF7q/P38csyx72
 PJKBRt5tJjVsN7HW91CA38/TSM8XVkwOqYFS/ASJi/jIoKEbQ9E21t+VkjVNezbSeC
 fXJNB2pnXtQ6RYzS6qzeneHhjUc0Gp2nJXZCcGkNQPbUvLGsvZUn8xupkbhvd1xSFa
 AuEp4Jy88kGUQ==
Received: by mail-lj1-f171.google.com with SMTP id u4so2654244ljo.6
 for <linux-riscv@lists.infradead.org>; Thu, 25 Mar 2021 04:35:02 -0700 (PDT)
X-Gm-Message-State: AOAM5326+64IOA9TzCikRi0c1Vl0I+4hsASHQLd/ntM+AEb+XNCDnSKJ
 LU7Ijmc7eTIkimYFgTh068HzaA1qd7bvtSTQPKs=
X-Google-Smtp-Source: ABdhPJzy6pR5fzFckmoZlwY42m9Hxg36LHc0Jsrh71m4xFAi2Ymec/Am/f5GaTmsOKLPYwxZ2BEgR+OXjtEQltf/jyU=
X-Received: by 2002:a2e:9e8e:: with SMTP id f14mr5260832ljk.285.1616672100472; 
 Thu, 25 Mar 2021 04:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <1616658937-82063-5-git-send-email-guoren@kernel.org>
 <202103251923.MFrI3wnb-lkp@intel.com>
In-Reply-To: <202103251923.MFrI3wnb-lkp@intel.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 25 Mar 2021 19:34:49 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQgXzAB0NiTNTY1MvR=4BYx5+379W0PeOuHzayR3dWUng@mail.gmail.com>
Message-ID: <CAJF2gTQgXzAB0NiTNTY1MvR=4BYx5+379W0PeOuHzayR3dWUng@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] riscv: Convert custom spinlock/rwlock to generic
 qspinlock/qrwlock
To: kernel test robot <lkp@intel.com>
Cc: Anup Patel <Anup.Patel@wdc.com>, kbuild-all@lists.01.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, tech-unixplatformspec@lists.riscv.org,
 Michael Clark <michaeljclark@mac.com>, Peter Zijlstra <peterz@infradead.org>, 
 Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_113507_821124_EB79007F 
X-CRM114-Status: GOOD (  17.85  )
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

haha, I forgot RV32, it needs a

#ifdef RV32
    srliw
#else
    srli
#endif

On Thu, Mar 25, 2021 at 7:16 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on tip/locking/core]
> [also build test ERROR on linux/master linus/master v5.12-rc4 next-20210325]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/guoren-kernel-org/riscv-Add-qspinlock-qrwlock/20210325-155933
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 5965a7adbd72dd9b288c0911cb73719fed1efa08
> config: riscv-rv32_defconfig (attached as .config)
> compiler: riscv32-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/2bf2d117ab34b007089e20e1c46eff89b5da097e
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review guoren-kernel-org/riscv-Add-qspinlock-qrwlock/20210325-155933
>         git checkout 2bf2d117ab34b007089e20e1c46eff89b5da097e
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=riscv
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    kernel/locking/qspinlock.c: Assembler messages:
>    kernel/locking/qspinlock.c:184: Error: unrecognized opcode `srliw t1,t1,16'
>    kernel/locking/qspinlock.c:185: Error: unrecognized opcode `slliw t1,t1,16'
> >> kernel/locking/qspinlock.c:190: Error: unrecognized opcode `slliw a6,a6,16'
> >> kernel/locking/qspinlock.c:191: Error: unrecognized opcode `srliw a6,a6,16'
>    kernel/locking/qspinlock.c:184: Error: unrecognized opcode `slliw t1,t1,16'
>    kernel/locking/qspinlock.c:185: Error: unrecognized opcode `srliw t1,t1,16'
>    kernel/locking/qspinlock.c:187: Error: unrecognized opcode `slliw t3,t3,16'
> >> kernel/locking/qspinlock.c:191: Error: unrecognized opcode `srliw a6,a6,16'
>
>
> vim +190 kernel/locking/qspinlock.c
>
> 69f9cae90907e0 Peter Zijlstra (Intel  2015-04-24  187)
> 59fb586b4a07b4 Will Deacon            2018-04-26  188  /**
> 59fb586b4a07b4 Will Deacon            2018-04-26  189   * clear_pending - clear the pending bit.
> 59fb586b4a07b4 Will Deacon            2018-04-26 @190   * @lock: Pointer to queued spinlock structure
> 59fb586b4a07b4 Will Deacon            2018-04-26 @191   *
> 59fb586b4a07b4 Will Deacon            2018-04-26  192   * *,1,* -> *,0,*
> 59fb586b4a07b4 Will Deacon            2018-04-26  193   */
> 59fb586b4a07b4 Will Deacon            2018-04-26  194  static __always_inline void clear_pending(struct qspinlock *lock)
> 59fb586b4a07b4 Will Deacon            2018-04-26  195  {
> 59fb586b4a07b4 Will Deacon            2018-04-26  196   atomic_andnot(_Q_PENDING_VAL, &lock->val);
> 59fb586b4a07b4 Will Deacon            2018-04-26  197  }
> 59fb586b4a07b4 Will Deacon            2018-04-26  198
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
