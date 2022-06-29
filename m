Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434F8C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 07:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6bfIrc99Sw+Wo+EuFeV3s5JFkTWIMUPgpejUiBVAJ8U=; b=dIW9OG25PX+52Q
	lZ7Zf14Q2clFKt1ejXZFU+dcCqwCic7MhNwViC5XuFliw3UmjqbXQJILlURxwZHtAhMCushYzo2ZO
	XtELSLwg51MPO9aoYln82Gnds1N+DQ9Wqad3ZQrBJWFMFNenng8DEMw8Qq1TXYMZNWvpZQXngljb9
	NEWWMf6AnlZscuHDwgAMCxksoA8s/txA5RZ8aLlekQp/ugGuvrfeLIFmoiuOXmqrytmne3+Pe5jVo
	PYCDP5umK1K3yShJZKoqu4e8J9eZOhIcCbo16hsRBTblAwwXRlut1/1NrUCnlShMAPDhOSv7Yflyc
	NSm0Ka6m3vNI9xIptnTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6RpA-00A0YK-D7; Wed, 29 Jun 2022 07:09:20 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Rp7-00A0Wb-II
	for linux-riscv@lists.infradead.org; Wed, 29 Jun 2022 07:09:19 +0000
Received: from mail-yb1-f172.google.com ([209.85.219.172]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M7ehh-1o0eWd1tsr-007zgB for <linux-riscv@lists.infradead.org>; Wed, 29 Jun
 2022 09:09:14 +0200
Received: by mail-yb1-f172.google.com with SMTP id h187so24108163ybg.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jun 2022 00:09:14 -0700 (PDT)
X-Gm-Message-State: AJIora+UVc4sYbcA/3mzaRWhzkIbdfp7UhI/S6fTqbj4wM6poEKsl/5G
	AV+JY4cIjiJ6lsESfwz2brY51tmKRoIPsTFySgc=
X-Google-Smtp-Source: AGRyM1vwFx+KUXwvbgg/ASvRBxEdL/JjOQ3Jx1tv8VOFIFQwJBGUiZKdd3oyAVRe8CZHrAKOLM6aLE6JRIBVMMOSe+E=
X-Received: by 2002:a25:760e:0:b0:66c:95eb:6c69 with SMTP id
 r14-20020a25760e000000b0066c95eb6c69mr1899906ybc.106.1656486552981; Wed, 29
 Jun 2022 00:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220628081707.1997728-1-guoren@kernel.org> <20220628081707.1997728-5-guoren@kernel.org>
 <09abc75e-2ffb-1ab5-d0fc-1c15c943948d@redhat.com> <CAJF2gTQZzOtOsq0DV48Gi76UtBSa+vdY7dLZmoPD_OFUZ0Wbrg@mail.gmail.com>
 <5166750c-3dc6-9b09-4a1e-cd53141cdde8@redhat.com>
In-Reply-To: <5166750c-3dc6-9b09-4a1e-cd53141cdde8@redhat.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 29 Jun 2022 09:08:56 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2jQ+UQ54=QcpyVt91vXRyZrvUtOygFYOHWTBzse3q3rg@mail.gmail.com>
Message-ID: <CAK8P3a2jQ+UQ54=QcpyVt91vXRyZrvUtOygFYOHWTBzse3q3rg@mail.gmail.com>
Subject: Re: [PATCH V7 4/5] asm-generic: spinlock: Add combo spinlock (ticket
 & queued)
To: Waiman Long <longman@redhat.com>
Cc: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
	Peter Zijlstra <peterz@infradead.org>
X-Provags-ID: V03:K1:XcGLxP+vmVJf1pTrSAPac0CftK9myZZH5J1Yeq4F5sjTLqeXx3Q
 bJCXJrj0q8UveLHc1QET3ahktg7NbrNXfKpxDcpfDXlHC/gyM6YZtAmmsiV1MxAC/vLC4mG
 4jtkGHwpGkVox/jjhwmt//gOljfFkQbPd8kyR9ZDEGU7qvUjhgEuOxoWvc52o/t7Liszqv8
 1mV1h80v+O8TOUJ0GBDdA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/o5FUeB8HCc=:pXHy9thZaOtIE//jD4WsKe
 7pCZDpjRNG1obSO98zqhLUhOrki9Fk8KnQj6bEeSAdqXJxl9VAKOlibcWpi2sJ3kgp6/OHX8D
 KHN9030PE8XBK1D1U/gceuuKZ64ZnwfXZECmntELnkkOt91yD7/0/C9UH+MBGZ3FlxqRzZxQU
 SsLVfinDP04gtMNPv+4rdxjWUUX9mgAgF+pGJjd+TWlrug8fALCkHQdELP3yBNNEbgJDCWtqP
 4FzhOC26+NMSv7+70Y7sZL1hpxaqvASc962zNaQY4djVorhy9U3NIpTKTt/uTGXlENj+y7CMU
 TKG2+52Zl+/CfcgPXLskHtQmZ8fxX5CS6Rv6jwJKoOupMvPJUQ9a+SF7tEgrfGCKq+vYjbWdx
 lnFMFbe8aCr0lEARRbBxPPyX/yFbe/FqLQpfiUkLdIrUUpx/LoItF3Ft+w359KbFYLU0X4WNU
 8s0oJIWcmdEDjytAxSZYH4tsAj1RbUKrs0T1vkfoesY4XX9veQVv+OCYnpA3vBan9u9g49f5r
 3szqm/S42we/m1BEV72xhzGgozVAAQ39a+GT1fSawpXoaCcqBIS4x5lmHQfGJdLmd1slrTU9L
 MauQDmAf2+qkppHjmrpRRS20aQcvsvT5n6iFYP6zxL7aYeeH+YhrUEEqoVToLDmIrBaRIc7Mc
 BNYry4bpm/u7MClLDX2AabclC8rz4Dmm1ti2oTGBH1tqdP7C6MhppPbWBOe0yI5QYxEPZGyPQ
 e9GHbxd1T93F9q+wnBobbSM8KBF0nSjalAm1KPif0K/gNlcFrWhvIi4H1myiNpHOtgfumMktE
 TZaPFYhrAeD4/2DaCu+28pbR85P8+VQY2klihwmaxulM6Ofo7wYVEjh+TFg/jF4IxmxUWp6GH
 +14SgpWAC4THCBo4oyUw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_000917_947674_ED0E6344 
X-CRM114-Status: GOOD (  27.41  )
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

On Wed, Jun 29, 2022 at 3:34 AM Waiman Long <longman@redhat.com> wrote:
> On 6/28/22 21:17, Guo Ren wrote:
> > On Wed, Jun 29, 2022 at 2:13 AM Waiman Long <longman@redhat.com> wrote:
> >> On 6/28/22 04:17, guoren@kernel.org wrote:
> >>
> >> So the current config setting determines if qspinlock will be used, not
> >> some boot time parameter that user needs to specify. This patch will
> >> just add useless code to lock/unlock sites. I don't see any benefit of
> >> doing that.
> > This is a startup patch for riscv. next, we could let vendors make choices.
> > I'm not sure they like cmdline or vendor-specific errata style.
> >
> > Eventually, we would let one riscv Image support all machines, some
> > use ticket-lock, and some use qspinlock.
>
> OK. Maybe you can postpone this combo spinlock until there is a good use
> case for it. Upstream usually don't accept patches that have no good use
> case yet.

I think the usecase on risc-v is this: there are cases where the qspinlock
is preferred for performance reasons, but there are also CPU cores on
which it is not safe to use. risc-v like most modern architectures has a
strict rule about being able to build kernels that work on all machines,
so without something like this, it would not be able to use qspinlock at all.

On the other hand, I don't really like the idea of putting the static-key
wrapper into the asm-generic header. Especially the ticket spinlock
implementation should be simple and not depend on jump labels.

From looking at the header file dependencies on arm64, I know that
putting jump labels into core infrastructure like the arch_spin_lock()
makes a big mess of indirect includes and measurably slows down
the kernel build.

I think this can still be done in the riscv asm/spinlock.h header with
minimal impact on the asm-generic file if the riscv maintainers see
a significant enough advantage, but I don't want it in the common code.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
