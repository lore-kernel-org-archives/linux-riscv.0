Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF543C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 11:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YWd2W+rw/I1pbfPooIIwjOTHJ96H0WOYkfrqIEVbi4Y=; b=cSta2Chpt4gREM
	Bl00TCYj8PD4KfeSxs/mvNVczV5fYsEbgX9Yczu3cGoRM/OQOdgLY4sAOqpiEKjy5UAf6P5OwbiUD
	+XSuFGk2OWq8yvtN74x01HKG/YBw2/wJ+wtPzvve0G4VSQauRhh1hQj5xoT6lb+SraMbVvqvbzRs2
	MpfEUY9u6j80kcYMNyi0DzbRdJUqG/PEW1vNhqhDK6LQ2MdAgrCXejXu9J1fJG6f4gDEynMWU0XV0
	5NppPj1OIAjMrcLzNJRrtfL2d7k4eTZurfYcILhVYWF/gaY5tt2UmNG3NyRJKKgXhrxklqWwXTMZb
	7RnLKnWnqByBPG1D/vRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nE8Rz-006Pme-6u; Sun, 30 Jan 2022 11:32:55 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nE8Rv-006Pl1-Jy; Sun, 30 Jan 2022 11:32:53 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MD9Gh-1n5Zk61eQz-0095Ob; Sun, 30 Jan 2022 12:32:47 +0100
Received: by mail-ot1-f52.google.com with SMTP id
 x52-20020a05683040b400b0059ea92202daso10243926ott.7; 
 Sun, 30 Jan 2022 03:32:47 -0800 (PST)
X-Gm-Message-State: AOAM531OF6b9cr+mAeF7UnAR3WZBnehmp7yPc2jWgovkUhwUf1asDHE+
 HYFZNYTo+aPV+bcb4YbVOVxJK4Fr9JJ8tnjGnWk=
X-Google-Smtp-Source: ABdhPJwfE8JwIPR39kNR+t9u+MXKrX+M/IvR4BevQAZ6Ex6kYRsjbH69gpBCBcpvwPyYexj/E8Z2vleiIWqqwcDE0P4=
X-Received: by 2002:a05:6830:33c2:: with SMTP id
 q2mr8818491ott.368.1643542365934; 
 Sun, 30 Jan 2022 03:32:45 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-9-guoren@kernel.org>
 <CAK8P3a3JGP6fLVOyLgdNw2YpRSmArbEX8orUhRrN=GHmcdk=1g@mail.gmail.com>
 <CAJF2gTQQnrUFNQ85vvoMkpxnCWuMw8iXtPZOJwWGaEA9f+rTwA@mail.gmail.com>
In-Reply-To: <CAJF2gTQQnrUFNQ85vvoMkpxnCWuMw8iXtPZOJwWGaEA9f+rTwA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 30 Jan 2022 12:32:29 +0100
X-Gmail-Original-Message-ID: <CAK8P3a12CygLFT7qoQ9K=sowvTgNpeRej6Zh6Pv2PL_e2zMhMQ@mail.gmail.com>
Message-ID: <CAK8P3a12CygLFT7qoQ9K=sowvTgNpeRej6Zh6Pv2PL_e2zMhMQ@mail.gmail.com>
Subject: Re: [PATCH V4 08/17] riscv: compat: syscall: Add compat_sys_call_table
 implementation
To: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup@brainfault.org>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 Christoph Hellwig <hch@infradead.org>, linux-arch <linux-arch@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:wR+evBvvi2PWJ81z1sy7HVS1goUpB8WfOIxAlemGAN3ZDszTMGV
 ITkrV9sihipB6iAM/qcvvfJa07en0iWmOSWGJA4tGvJGhSbaXM2FpimDZ89rbB+5WqdOL6I
 eUHY3miHmDqxqFs5N3FfNeWCNTj5Pti3x5PNSM6M3z4S8AxDbt4peSyDdXSciuyetHJTtqN
 RLG8sdkYa00ym2X7XNx7w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ad67rr/LSuQ=:B9gYxNLfP4/InRN0ng4ko+
 hqFgvyPVWRg063zC0Kb/iRZRFC+Xan04wAqfMoPZUcC6gScA2jJuswIIX8yOkuWi0okzoC9b1
 scdcLRlqioPhncESOCeoUA9Hz3bwt5cukVgyIqL6WL/4L2716Oa2XGeSqCrQ+aURm2cOe7WE4
 r8tznofGiG3srnNykphjIDsO6KNgIBo/iiByyJ9sGqlNMTktLZkm0p6ne5/ZBcTvchXOp5cur
 ldWpLrCDeUlxoXa/1+0bZMLQFxRZoj/YZ30Q2Pyzf0gQWpW8eqvhXJm6YPtwzimJhGM5DTCZc
 mGclcJJUxolKhHQHHKSWbQCMi4hNb7xaqhTnU9UejI3FFTIU7WtxHWk2B5+UivO/dt2v99dLE
 g1wywUrJ4Gp+CzjYLv4NxGPM6bUJV4apXtHKutfk5ajdc2lcCdFt3xAQ8X9YGLqy8SAS0zTqZ
 wRQEJWtSb/svs47cee/NZk8LCJYQl4rpAn9x1gc3eqQxw4DY9uiwJnXYstlPtl3S5OyLmSabb
 i/6RSTvRqnPNI6oEDPxfw0OX2B4szWiM5U1Nd2gCiGx725MuBQ5GT//HqASMet378qB6bqC3t
 AMAvDi0ly+sp4gkDNNWApX7mlM1c9I7zpMvGnIFbJMSbhO7K/VtqBbl7WdgvpX5yQ5tZGphuL
 URdOt9hGdjecheSWryMao9IOkrbYhKFxxt4oXvCrWOQCSbxxwQ2siH5B3zpTuwEpkFNI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_033251_976430_BFEAF5BF 
X-CRM114-Status: GOOD (  15.16  )
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

On Sun, Jan 30, 2022 at 6:54 AM Guo Ren <guoren@kernel.org> wrote:
> On Sun, Jan 30, 2022 at 6:41 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > I would make these endian-specific, and reverse them on big-endian
> > architectures. That way it
> > should be possible to share them across all compat architectures
> > without needing the override
> > option.
> I hope it could be another patch. Because it's not clear to
> _LITTLE_ENDIAN definition in archs.
>
> eg: Names could be __ORDER_LITTLE_ENDIAN__ CPU_LITTLE_ENDIAN
> SYS_SUPPORTS_LITTLE_ENDIAN __LITTLE_ENDIAN
>
> riscv is little-endian, but no any LITTLE_ENDIAN definition.
>
> So let's keep them in the patch, first, Thx

The correct way to do it is to check for CONFIG_CPU_BIG_ENDIAN,
which works on all architectures. Since nothing else selects the
__ARCH_WANT_COMPAT_* symbols, there is also no risk for
regressions, so just use this and leave the #ifndef compat_arg_u64
check in place.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
