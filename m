Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6ECC6FA82
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 16:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bQwp1Jm6TP6joDrMcr8s3FDBAREz0OW7EYxQOh9oHsU=; b=ndydkmMhF29Dl1
	YeY4WvVYiEINNsG3URX7oHTRXMM9rsPWh8g15fmJ/N929v1OvHFOON4NSOQsK3jgE5m/0maOOMgoT
	yqMUQDz14aMNV4eNqY8ydAu+eh6JBxQ4sQ54YtbIxcpWvdgp2IdhwOTdAkiloqNXaDcjMuktBzmzp
	+MeUPZJKzrxayIsShrKYIHYDjtvmQ5YRJQhw20IYLQbomjGomohqQErPKtCLo8MqgzaWKmAyLpIWv
	hgYrjgbiC75ss9146cULvVGh/C+NwLDzfqKgUV0Jiw5Gy4H7MbK9eDRm9f7MjFgShdx5pWWjo/bID
	bWbAYs2Zsfd382F22c3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oblWi-004yfD-9S; Fri, 23 Sep 2022 16:27:44 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oblWf-004yci-H1
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 16:27:43 +0000
Received: by mail-wr1-x42a.google.com with SMTP id t14so775052wrx.8
        for <linux-riscv@lists.infradead.org>; Fri, 23 Sep 2022 09:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=oYS931QxypUChKHoLGJVldhhe0rE/S6dyM7vUBrMOiU=;
        b=Zqvxfogh49z4nlATM3a1Eir2F6ueo9XGy+Fz9Cg3TMolya41ElD6+i28w7JiBO9t2V
         CdzJMPfpEyYyKFELjyeOFaAtW1b1lE4oHFiuXAn+phX7oywMEOLfB+FcOVthnIj1sxxt
         7tX8CLKT6jMnfgxmR/yTDgR5c7JH7kz32e9Ii0InpCF2HHrAzC0JBewslzjDNSV/4Ca+
         GTmlEOQ1BqWhEFXPO5Nq7D4C2NIY6WaG68pmWCFLvGpAEdzA9Nm0Dspv3VrEBKOYNoLe
         +cZVbl15ruEzeGom+SFtXtImJuqFm1qAMQfIlY+/aiFIdhBTiVRnu771V4HXhPPr4x0Q
         ZsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=oYS931QxypUChKHoLGJVldhhe0rE/S6dyM7vUBrMOiU=;
        b=dO53/wB24hZHvWMzsD6CLlanG6sM1v026b3NlRLhZaX7e9y+8bmkuX1cKSKon7yaFJ
         F7KEhu8E19rtwEcOpJ9/d0q7l/QdDBfYiWmIydxYvKkuv/7MqDV87eAcneZ5E8bP713m
         EOYf29e4LFVk+bLqPrqIBXrb0K/ZYHFfKC8ZtuNF9W2MvL0LjagXaU9bDQqQJLsv41gI
         tlbXziYe4NddUNNWc0+MvkgmHNkyD5K/0DdkygvNd4GYSrDiHYgVMcnR+vEHNvLcelDW
         IBt/4JEZSFYahPUW4AJTMFovMD359rNICLoKvCAAsDtw8qrxpjgoUTCNj1nWmdpiszpz
         ngbQ==
X-Gm-Message-State: ACrzQf1XceOdxIAZvAr/LCyoDUdppFARTSF8/XLJnoQaXVnmQ0Vuw+vS
	kQqEOgR+7kGS4PKXmgHd2sWeXvvVC32YtQUtO7uavA==
X-Google-Smtp-Source: AMsMyM6NTJ+2A73KKiFe9n7hUORCLxnfvs0iYzjbS7DtbiGBB3bNYtqzkHL9uGgAE9rr+YZLYG9gQmBL1ohHuUfrv3U=
X-Received: by 2002:a05:6000:1886:b0:22a:2944:a09 with SMTP id
 a6-20020a056000188600b0022a29440a09mr5840574wri.391.1663950457617; Fri, 23
 Sep 2022 09:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220921214439.1491510-1-stillson@rivosinc.com>
 <20220921214439.1491510-5-stillson@rivosinc.com> <a91e3e67-d077-050c-48a3-1466c2deb7c4@sholland.org>
In-Reply-To: <a91e3e67-d077-050c-48a3-1466c2deb7c4@sholland.org>
From: Chris Stillson <stillson@rivosinc.com>
Date: Fri, 23 Sep 2022 09:27:01 -0700
Message-ID: <CAM2SziUBmXcte+GGsXPyKC7ce5EVjaiiWGAU=bWev2LAWrHYrA@mail.gmail.com>
Subject: Re: [PATCH v12 05/17] riscv: Add has_vector/riscv_vsize to save
 vector features.
To: Samuel Holland <samuel@sholland.org>
Cc: Greentime Hu <greentime.hu@sifive.com>, Guo Ren <guoren@linux.alibaba.com>, 
	Vincent Chen <vincent.chen@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Oleg Nesterov <oleg@redhat.com>, Guo Ren <guoren@kernel.org>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Alexandre Ghiti <alexandre.ghiti@canonical.com>, Arnd Bergmann <arnd@arndb.de>, 
	Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@kernel.org>, Dao Lu <daolu@rivosinc.com>, 
	Sunil V L <sunilvl@ventanamicro.com>, Ruinland Tsai <ruinland.tsai@sifive.com>, 
	Han-Kuan Chen <hankuan.chen@sifive.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_092741_579911_03EF9BE2 
X-CRM114-Status: GOOD (  18.26  )
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

(resending, as I forgot to set it to plain mail)

This is the way the original set of patches worked. I tried to change
them as little as possible for the rebase.

On Wed, Sep 21, 2022 at 9:23 PM Samuel Holland <samuel@sholland.org> wrote:
>
> On 9/21/22 16:43, Chris Stillson wrote:
> > From: Greentime Hu <greentime.hu@sifive.com>
> >
> > This patch is used to detect vector support status of CPU and use
> > riscv_vsize to save the size of all the vector registers. It assumes
> > all harts has the same capabilities in SMP system.
> >
> > [guoren@linux.alibaba.com: add has_vector checking]
> > Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> > ---
> >  arch/riscv/include/asm/vector.h | 14 +++++
> >  arch/riscv/kernel/cpufeature.c  | 19 +++++++
> >  arch/riscv/kernel/riscv_ksyms.c |  6 +++
> >  arch/riscv/kernel/vector.S      | 93 +++++++++++++++++++++++++++++++++
>
> This file is not added to the Makefile until patch 8.
>
> >  4 files changed, 132 insertions(+)
> >  create mode 100644 arch/riscv/include/asm/vector.h
> >  create mode 100644 arch/riscv/kernel/vector.S
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
