Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E53C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 08:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2XdV3oy2Td2G4OY5K7jLvJMcKHW9aPtJ0+Za7irGirQ=; b=2PyOvEG2YDOiRN
	RjpF9KntKPYudn87dRMiw/RSTfPjvAnkpGFvIEHBwlTz9IQBLnsw462nEwrl8FAgaf87jCmYDESRJ
	C6G2IfuDjywqKbUE/NO2hHnPPlt9EspOD7SGV4MB2bYxgzMfNmhXZQltqs17aIxP4xrAQ+WZftuoi
	jEM6/5ukY/vWgK/o6wgxJN39NoVOweaA0n9BY+zSSbNyDERhoFQYYhyPhLKRTOd5CJkP1neF1fSdf
	zIYgHVqI3RBzW+6NbTZNKgfkIYxFUjEIPP0zmy7Oi6afZpHlyp/DK+d5TnCO7CszsLqY3EeK1c2gU
	VjffoFUo112tHnjqONcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6T5I-00APPA-7z; Wed, 29 Jun 2022 08:30:04 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6T5F-00APMF-Ii
	for linux-riscv@lists.infradead.org; Wed, 29 Jun 2022 08:30:03 +0000
Received: from mail-yb1-f172.google.com ([209.85.219.172]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MLR5h-1oOxhg0ygd-00IQnr for <linux-riscv@lists.infradead.org>; Wed, 29
 Jun 2022 10:29:55 +0200
Received: by mail-yb1-f172.google.com with SMTP id v38so15920288ybi.3
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jun 2022 01:29:55 -0700 (PDT)
X-Gm-Message-State: AJIora/9+23LPx7gRy/iSQApBlAbKCdUe/LLfyXHIAFjV2ngm8GNJah9
	g19U416YslBUa2njaDIe21yhGnY0UiE3mvse6UU=
X-Google-Smtp-Source: AGRyM1s+0Vdgu6k29DCyj5luRoc2GU/O+zNZO7vZnJQkpulyhuYloGJMkGI6qdeLOKZPe+Xqib0p73hV9hsIc7OQwVE=
X-Received: by 2002:a25:8b8b:0:b0:669:b37d:f9cd with SMTP id
 j11-20020a258b8b000000b00669b37df9cdmr2039004ybl.394.1656491393923; Wed, 29
 Jun 2022 01:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220628081707.1997728-1-guoren@kernel.org> <20220628081707.1997728-5-guoren@kernel.org>
 <09abc75e-2ffb-1ab5-d0fc-1c15c943948d@redhat.com> <CAJF2gTQZzOtOsq0DV48Gi76UtBSa+vdY7dLZmoPD_OFUZ0Wbrg@mail.gmail.com>
 <5166750c-3dc6-9b09-4a1e-cd53141cdde8@redhat.com> <CAK8P3a2jQ+UQ54=QcpyVt91vXRyZrvUtOygFYOHWTBzse3q3rg@mail.gmail.com>
 <CAJF2gTTtKiMZJLWBEcRz-4CmNojH0cOgpUYGupLyCXXFjQD_FQ@mail.gmail.com>
In-Reply-To: <CAJF2gTTtKiMZJLWBEcRz-4CmNojH0cOgpUYGupLyCXXFjQD_FQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 29 Jun 2022 10:29:37 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3GiMgEJdBg5QQHHD0bDnpR0XwPkAw7=zT7ETzf6-sCmg@mail.gmail.com>
Message-ID: <CAK8P3a3GiMgEJdBg5QQHHD0bDnpR0XwPkAw7=zT7ETzf6-sCmg@mail.gmail.com>
Subject: Re: [PATCH V7 4/5] asm-generic: spinlock: Add combo spinlock (ticket
 & queued)
To: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Waiman Long <longman@redhat.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
	Peter Zijlstra <peterz@infradead.org>
X-Provags-ID: V03:K1:ZG1SCr21qpAH1kXJ4g8cQQM3qP3d+ktYcBYDfdcrH/9gmzB+wxX
 dYi6Kb6jFkOBvNRuKUf68mihnI+BJhlHCee4iLn5tWbeLqHtmk+9/ER5YFCHXlbyewPTgiH
 MIJKIpjswG62oqv5rO5VhhGc0vhm/z26psQwZ0EeD9fR4UDzPQyN5L5hvijX40cQmT+de+t
 HidI5GHhDfNLPANQwrWTg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7XsZ/0PchR0=:l03OJ8rwvTdTsO6IguOXfO
 +vAzr4P179JyUJwSDas+3bebO80dJGXOF8BfS6W8lDGLsAUNVjoIsTRPOFoIRwdYj6ad6pt12
 5DvYM52bUX+WOgaeMRZSoMQn/24XFhX1hKyVMwc5bZWI/6yLneptkD6YBB5TrDZQACw1L40m0
 0rzsNetmMR/PhKvZLLHFS5ngkAAONRI7qcZdbctl2YEEL4cMy/ELIZSm68g8gqz320qmxf+FU
 k3WagLLHpar17OP6DASThdaJ+/GvaCoDYbciIVsmZFK85QbT1X5I6QE+zUIT8PuL6HrgnzYCU
 5vzXC/mdG/tjBsqGNyQyJ7W3V2HIWJ4Gm3xkC63y0QCvRGWJPr99L8svhKERT6lbpUYhHO3pW
 yjpThQQw9RjgjIzz+UFFANOVMKGg/EXQ8HlJQTTvHl2NxX+zBHzsU7aXOgN9FGvzLBGkPqWsM
 TDkoPNK9VBT50L2jVp1jP/I2NfLDL7LqvCq19w+No7zTu3Dt432r19io9HhHGbf0DQghhkCx3
 i6sjWTT7JLeq/JeVpN35MnTkEhi+g7Ixd4skAZ6MF1FMAledZ+z+2Eu+Pzigb7VrqWpIAJhfd
 rCYz9Q02DQwJbyUQiyAwLYgx4OQadSid4MTalv/3dXMetGe5RJ4ZlGsxTZEHB69slkc7+a3zf
 pVQLVd7azoVAvpjwRjJ3SMe3dXt6H/BKkf9x3fBhlV8/mqp2rbAke0VS60QakvsTc4oBrSKqV
 WlgpxB6jaBtJh3c7lTvcXRJvFtZ4v7e2kD3pMl4TNcgbUNZ8WjjxdA+IgnCuk3srlTEy2s2It
 4CShazfrvqr31nEK42LBbD3wPQNZc57uFbtVwgJkJWMv6oahnH3qdZmXYrfpY2pZbbVSxfmsm
 Fi2PivG53/lLQ9sxq8Vg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_013001_956570_60B74CFC 
X-CRM114-Status: GOOD (  13.87  )
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

On Wed, Jun 29, 2022 at 10:24 AM Guo Ren <guoren@kernel.org> wrote:
> On Wed, Jun 29, 2022 at 3:09 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Wed, Jun 29, 2022 at 3:34 AM Waiman Long <longman@redhat.com> wrote:
> >
> > From looking at the header file dependencies on arm64, I know that
> > putting jump labels into core infrastructure like the arch_spin_lock()
> > makes a big mess of indirect includes and measurably slows down
> > the kernel build.
> arm64 needn't combo spinlock, it could use pure qspinlock with keeping
> current header files included.

arm64 has a different problem: there are two separate sets of atomic
instructions, and the decision between those is similarly done using
jump labels. I definitely like the ability to choose between qspinlock
and ticket spinlock on arm64 as well. This can be done as a
compile-time choice, but both of them still depend on jump labels.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
