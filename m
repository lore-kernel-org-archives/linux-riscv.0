Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E8FC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jan 2022 08:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9XG2dbnwlrNTTG/BN3RxdVUF3tB2xFGR8m7ZNpYepNY=; b=0H7QBUhPSofrtN
	A8OMGVljbw6JBsaPglAGDM6aCHG9M6lAdGPCvbHyqRTJv+qAeZKJxkTjGPTUWOLjqAs/8c8oir6as
	a/PqB1wcyM9S9eJ0vraNKf5R2q5Xu8fWdJudTJn/w+e4esAHBVs4yFiZdAmGwPB5qVNTZvicgVZRI
	dGq3z1EW4heWzJcQJsYrHoji6j+4uoo/x5SzpZulvJRK0N+3+j6TqPP2xhZZ52VLj6LQ+LaaoDdFF
	2s0diGOnv5JlvuWHL3D18Ss2NJJOPNEfy/KzdGoBgZoAndozVmNME1Maj7yFxvpV3m0rCq05LuDty
	Wls6gvidTbMMoKEGU3dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nApjM-00EMuF-M0; Fri, 21 Jan 2022 08:57:12 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nApjH-00EMs0-A4; Fri, 21 Jan 2022 08:57:09 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N49Ul-1mBXuZ40bB-0105RZ; Fri, 21 Jan 2022 09:57:03 +0100
Received: by mail-oi1-f182.google.com with SMTP id s22so12633508oie.10;
 Fri, 21 Jan 2022 00:57:00 -0800 (PST)
X-Gm-Message-State: AOAM5306tw6lMwKn1xsPsYtmjlOjpBnktwIC5Z6yTDZLdzuVtwomJhw8
 MEUGhx2iX252LQYu3YXYOO1iIZ1OhQv2xo7O+fI=
X-Google-Smtp-Source: ABdhPJylnMQV70n0iz9SImQwsqAn8J+KL/hKoGrWF8c1XxnGFchA2qX7H9h0ZVY5igqqe7kHNmQOCuoQNmiaakrHJBA=
X-Received: by 2002:a05:6808:9a:: with SMTP id
 s26mr2365492oic.108.1642755419287; 
 Fri, 21 Jan 2022 00:56:59 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-9-guoren@kernel.org>
 <CAK8P3a0LxB3we9wHOa4OPmNow6wz5NP49zeYhh7QXNv-MiR8UA@mail.gmail.com>
 <CAJF2gTQVUF4LSO0a6_MV8x-UAiJw32pAFyS1oPNLXhcEaemzqg@mail.gmail.com>
In-Reply-To: <CAJF2gTQVUF4LSO0a6_MV8x-UAiJw32pAFyS1oPNLXhcEaemzqg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 21 Jan 2022 09:56:43 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1sOejkdOyoRUfw4ESS7ewX_8Wj9tQNrZ40OiuDqJnrmw@mail.gmail.com>
Message-ID: <CAK8P3a1sOejkdOyoRUfw4ESS7ewX_8Wj9tQNrZ40OiuDqJnrmw@mail.gmail.com>
Subject: Re: [PATCH V3 08/17] riscv: compat: syscall: Add compat_sys_call_table
 implementation
To: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup@brainfault.org>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 Christoph Hellwig <hch@infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, inux-parisc@vger.kernel.org, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:86bTLesIodfxFNeatGNhm3QxTar7lUXZjQOr15qPxXOQ5DUR3rf
 jXw/GNKmA0YGabE2MYTCSGjQnEfFQdHxloxr5rbuA1lCgWIDC8tE7Dv0XfQsFeZAzjxCqWK
 e0gAthL9u6cQtYyndMbnF1dxWVkUMM4XLzKBanhz9TZ2/YFLYaL+5jPbx8cKBGmDjB/VAYD
 fxNtunBTy1vlpxBS1PBsw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Gc0HkEwtSD0=:tdVp0x0qo3axIbNw/63+Q6
 32bKYH8MvacRMxNeI03aHj/kOurrOmhM8z8Lf4L3ltUl0lC3Sodq6vEex500VL+YE5/pC4+eo
 DpIM4d9xftOWOs/YWqZQrfTV9136CNtL6OO0WBWxalc/eK53qYWJozccuYm1XSrSDm66gAKZK
 w16ZJ3YPcJvT11JDtZK5o3L0JZc1k4eirWY91aE5KfKEBZdmsCtdXzz9QP8dyWW4HqmbZ8bIm
 lbT2vweLtzjOghQTR17T/r0FyrRaaN7eZ8N8JXZqVRo/2pNFj8e4r2TcuAyuL8i3tAL0nZpeN
 FInfS/E5s969fZhpA2xFSnXJMR7+idiyJYreyw2LLFWzClMB4/gJPoHVZZoWjxRVo5aWgY4a0
 zI2XSV1khr2vqvNzVj+My39k9eTgluTSbnLD+MaCdUoffx0ZPi62hjy6A/j9yU16uBwAMdYfP
 5/r3N09rIYU+AqYGL4xvWTP6baxCcKk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_005707_663138_352CB5EC 
X-CRM114-Status: GOOD (  21.93  )
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

On Fri, Jan 21, 2022 at 7:25 AM Guo Ren <guoren@kernel.org> wrote:
> On Thu, Jan 20, 2022 at 10:43 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Thu, Jan 20, 2022 at 8:39 AM <guoren@kernel.org> wrote:

> > Are you sure these are the right calling conventions? According to [1],
> > I think the 64-bit argument should be in an aligned pair of registers,
> > which means you need an extra pad argument as in the arm64 version
> > of these functions. Same for ftruncate64, pread64, pwrite64, and
> > readahead.
>
> [1] has abandoned.
>
> See:
> https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/riscv-cc.adoc

Ok, thanks for the reference, I picked the first one that came up in
a google search and didn't expect this to ever have changed.

> > I still feel like these should be the common implementations next to the
> > native handlers inside of an #ifdef CONFIG_COMPAT.
> >
> > The names clash with the custom versions defined for powerpc and sparc,
> > but the duplicates look compatible if you can account for the padded
> > argument and the lo/hi order of the pairs, so could just be removed here
> > (all other architectures use custom function names instead).
> I would try it later.

This becomes easier then, as powerpc and sparc already have the non-padded
calling conventions, so you could just generalize those without looking at
the other architectures or adding the padding. The powerpc version already
has the dual-endian version, so using that will work on big-endian sparc and
on little-endian riscv as well, though we may need to come up with a better name
for the arg_u32/arg_u64/merge_64 macros in order to put that into a global
header without namespace collisions.

         Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
