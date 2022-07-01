Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0527EC43334
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 12:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BhHFYxb/4eovp7FFdMKy+OVcSNDaPOrz+jCoA220DSg=; b=RtNqB8vWwlJsB9
	fljNir7bLKI7F5tqSO0yf5gs5Y6F2giUwsKgPBXHQOtPUgWQWHe95HCBreAfPA6P7k6ZdUQ1NW22B
	zfPf8XylzANqRvbCd+9HWlCMhDdbYwvIL+Kx9VNIgMNicZ/k4kFSUz5U7drkoAkWjwI1ORvKfUuT3
	kYNxc1Uk35u7uFP9NHdRPhF+yy4RGQZS55+AvyEm402+iloYtqxzM6V6mapkSesh4fHX0onDl5FZu
	XXYu/5jMVdI4JCrJmTuTIWZQYWI6X/HjhOMq8Xznk32FVrs9Poq/xLVw8gqkYXZatKCQk2YFxENEn
	OlLYfbQ1nwpJ/N7R9xNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Fbl-004kwF-Fo; Fri, 01 Jul 2022 12:18:49 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Fbd-004ksn-78
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 12:18:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BCE8AB82FCE
	for <linux-riscv@lists.infradead.org>; Fri,  1 Jul 2022 12:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8988CC385A2
	for <linux-riscv@lists.infradead.org>; Fri,  1 Jul 2022 12:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656677918;
	bh=ATb6SEoK7/3cueOFPuy2+EzjO8Bs6Foi31SPRrze/YM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=X5tbuOgbNhdn9p+zwJef3C9fgG7RTQq6XcrxahqchOEWpk/KUMZMs2PL4+s9sFR2m
	 tUZ7/Bbm6+AYwQLs8z/JIPhdInqq5sA/k7u6OBJYVywElrkFVbfvnf5OkOyx5PtFJc
	 s8sYyPPllre7rdwtbdjlIMFWgl3qtDwhUR5RD062+rPnV3R0Ak5ON/sL0lok3M5w3X
	 AQMoF+E3+TV1d3viqC2yvRfZuwplvnnrbVVsPtTJqhvfoOOfy/akli9vaSDCr9srnW
	 i6qadRYs49FZbZA65tBA5jCzfmEEa1QK38szJdo3Ezlf57p/9zjsu2eLHGzC+Oj5P8
	 /Yj8E2p6Y8InQ==
Received: by mail-vs1-f43.google.com with SMTP id j1so2137480vsj.12
        for <linux-riscv@lists.infradead.org>; Fri, 01 Jul 2022 05:18:38 -0700 (PDT)
X-Gm-Message-State: AJIora+WlNGpAWMHJqTq2PpUJ6coWEuLaWm7nPW49R4a6dHW252eN9Qx
	aQyomM+WQfkVDdNbpYCgwNiuJDEl7NxTbPOGANM=
X-Google-Smtp-Source: AGRyM1vG4rVGasPwig/nllJ8Pjq9D/N0FTIQCYol6SI71DxP2L4RuzOCvANFgN6OEOc3sjeKIZovbMRLlZmflK2mHek=
X-Received: by 2002:a05:6102:366f:b0:356:352f:9de2 with SMTP id
 bg15-20020a056102366f00b00356352f9de2mr11203462vsb.2.1656677917449; Fri, 01
 Jul 2022 05:18:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220628081707.1997728-1-guoren@kernel.org> <20220628081707.1997728-5-guoren@kernel.org>
 <09abc75e-2ffb-1ab5-d0fc-1c15c943948d@redhat.com> <CAJF2gTQZzOtOsq0DV48Gi76UtBSa+vdY7dLZmoPD_OFUZ0Wbrg@mail.gmail.com>
 <5166750c-3dc6-9b09-4a1e-cd53141cdde8@redhat.com> <CAK8P3a2jQ+UQ54=QcpyVt91vXRyZrvUtOygFYOHWTBzse3q3rg@mail.gmail.com>
 <CAJF2gTTtKiMZJLWBEcRz-4CmNojH0cOgpUYGupLyCXXFjQD_FQ@mail.gmail.com> <CAK8P3a3GiMgEJdBg5QQHHD0bDnpR0XwPkAw7=zT7ETzf6-sCmg@mail.gmail.com>
In-Reply-To: <CAK8P3a3GiMgEJdBg5QQHHD0bDnpR0XwPkAw7=zT7ETzf6-sCmg@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 1 Jul 2022 20:18:26 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQLqN2QnHYyPMx91vraR3cOhf2DOnnC3=5C18ACU32Qaw@mail.gmail.com>
Message-ID: <CAJF2gTQLqN2QnHYyPMx91vraR3cOhf2DOnnC3=5C18ACU32Qaw@mail.gmail.com>
Subject: Re: [PATCH V7 4/5] asm-generic: spinlock: Add combo spinlock (ticket
 & queued)
To: Arnd Bergmann <arnd@arndb.de>
Cc: Waiman Long <longman@redhat.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
	Peter Zijlstra <peterz@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_051841_606401_0A756E8E 
X-CRM114-Status: GOOD (  17.87  )
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

On Wed, Jun 29, 2022 at 4:30 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Jun 29, 2022 at 10:24 AM Guo Ren <guoren@kernel.org> wrote:
> > On Wed, Jun 29, 2022 at 3:09 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Wed, Jun 29, 2022 at 3:34 AM Waiman Long <longman@redhat.com> wrote:
> > >
> > > From looking at the header file dependencies on arm64, I know that
> > > putting jump labels into core infrastructure like the arch_spin_lock()
> > > makes a big mess of indirect includes and measurably slows down
> > > the kernel build.
> > arm64 needn't combo spinlock, it could use pure qspinlock with keeping
> > current header files included.
>
> arm64 has a different problem: there are two separate sets of atomic
> instructions, and the decision between those is similarly done using
> jump labels. I definitely like the ability to choose between qspinlock
> and ticket spinlock on arm64 as well. This can be done as a
> compile-time choice, but both of them still depend on jump labels.
1. xchg use ALTERNATIVE, but cmpxchg to jump labels.
2. arm64 is still using qspinlock when ll/sc, and I think they give
strong enough fwd guarantee with "prfm pstl1strm".
But another question is if ll/sc could give enough strong fwd
guarantee, why arm64 introduce LSE, for code size reduction? Why
instructions fusion technology is not enough?


>
>         Arnd



--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
