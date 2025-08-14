Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC239CA0EE6
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 14:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+nVO+t2WRZleRFQrXW73BwI5gd3RnotUV8KbpbODXS8=; b=otJud/khds6gGH
	aKiA93VK4BbNBEQdYxXXLViGNQWZg8REwHZhCYsfq1VvsuYbnTta8tvBQ1vmMT1t0e+oguUn4MqMf
	RyjvnMiRns62QQBHC1+lIJgMCg/8Ud3gybzofVR8pUfRqK4LyV5bk18cDoLD8eLijmV4f8Gps4qTO
	z00JmzLUwS6TgAGghzoM/T1WJmF2892PcUYpUnqeNh2JQ4R37nLTyKG2frV+4c2u0GvSHim3M887S
	bKZMFMgsBRUlMiD86UGabu07aznAVhiM+k4tFlU2fgHBkKDp0tWdjhwOOwohYAJrL3NanoCWMJ3ut
	VLAn8jp3A7/u4HhnzLEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYkw-0000000HCoP-0ePn;
	Thu, 14 Aug 2025 14:16:38 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVG6-0000000GbJt-33py
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 10:32:36 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-71d603a9cfaso7279627b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 03:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755167554; x=1755772354; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uaEo1pBaJYUCg7ETl4VR+nNxWJS8LXNciFaWMb7dDUc=;
        b=XUuxO7TlUQkyzrcrqPBu5yOjo8BgWfMWYeS2HXm7CQactoDnRsWNgwm89otkUSlpSM
         jPG8KWpMk5erALG4mIdPar5E3SAFma7QOU4Q/PmUlNU+nJtctrW4Y4Wcf1AytNCs9+L3
         Ekh+lUmGfF+cWaIMW/l4BXJ8vPcq7VG2UUA4I32MziXmdy+j7pXnE5/j4Kqgv/FohMb0
         hO5PR/Az3P1WIaRcwUtON7w8Wrn79M5T5YYwzrLLcvVSwkk4FoHPfggwmVMf3Wu9y1rv
         okHMF/umk/9yOIICKiCO0PjdYtpaKN8uSW2iZ5ZsuauIVEpATeX2xnidQYnJKfOToZUu
         6zVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755167554; x=1755772354;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uaEo1pBaJYUCg7ETl4VR+nNxWJS8LXNciFaWMb7dDUc=;
        b=aAZkf5NoqULBFmEFM34j0GfN2t3DVHoJUoKyuc8vjiMeVQN7XDTIjirVJ53LqBy/P3
         gH+xgWqwLCr+6ixsT0igO2GKkdJgj3yvEyljr0pcZyzwlPD/W5dMUENUAXnZb86ck7/F
         jObiXyITlTOhiymAaN3HJOwvI1SIEJX1CcLQCeyh43hERp584509CvIQVMHeevHNor2R
         nIxFbPmunYAd8jC7NipbR8O6u0uMzpENI5lUaZJbTzQAuKdjrgAw89cSH+8cIQhohprN
         3oUOSul6nljHmuo4qp0n7pRVHEkNK/ZaVEWC3cH0e5Cqn+XsrQadsXgNV6SGX/Cttoja
         59fw==
X-Gm-Message-State: AOJu0YyO3URbTLkG45rGpQ/AktrsCo55udqGqR8Ubz14MLNDQCcIsejf
	3BTrYDoKXVhVE/NtC3RY9aZkmctcqfUdNwVIrYlJUS3EF5rf2kAZyu7SbOJRKzcR5yoNwGedNeD
	bDT81ba3ZwLltxLK8u2PIKIUSafq/DWc=
X-Gm-Gg: ASbGncuTnxm6mctuni/S0+y2+DHdyqyUqu2V/kzLCssI9XNWidF8wtPb0v+Lc8NVaE/
	MDHy6Djse9nZgrcAJkPwSG6E0d4HmliV56ODICYP5Wf7ZkoaKu8HzCYVZ2pZwd3OXU5LHd2i+n3
	JO1TfBCrZonZ2ppD4+sxDiu4ziMykjvA4l6W61z+T3aV0+x26CZTrdgcXU9kCSdMi8M824nLrDa
	iDpjVVGRJCAXonJDQ1lqwkwyd22IR/7Kd6xjL8uq/4ZMvWM1w==
X-Google-Smtp-Source: AGHT+IFywqWXwkQcrWIhW5zZNMeWC06u3TgBMrtziUbxjoHgbW5yYt2q3dWfqz9xQMBfKcv/KfjEZCMyfpwvEHgQTYI=
X-Received: by 2002:a05:690c:7444:b0:71c:1673:7bb4 with SMTP id
 00721157ae682-71d6361a171mr29583697b3.38.1755167553589; Thu, 14 Aug 2025
 03:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAAbFZ0iFJbpqxqTUYhB+tUZSiL1qQJ=PeABCCjkeSpf4_TNiyQ@mail.gmail.com>
 <20250813180545.110666-1-parisoplop@gmail.com> <bb580c80-5c6d-43f8-808a-e0d713f0be0c@ghiti.fr>
In-Reply-To: <bb580c80-5c6d-43f8-808a-e0d713f0be0c@ghiti.fr>
From: Paris Oplopoios <parisoplop@gmail.com>
Date: Thu, 14 Aug 2025 13:32:22 +0300
X-Gm-Features: Ac12FXxFiXh0wVNex68sYBwLI1kDkgKHss0qkFTYaBKr-CEj35LtgEq52DzMy3g
Message-ID: <CAAbFZ0hK7uAm_jXoThK+tLsGzBrLSNr1=Gv8=H21D7DyODWB6g@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: hwprobe: allow querying available
 RISCV_HWPROBE_KEY_IMA_EXT_0 bits
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_033234_773778_DDB7E2B1 
X-CRM114-Status: GOOD (  44.38  )
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

Hello Alexandre,

> trying to figure out if an extension is available will likely result in a SIGILL, so that will kill your application

SIGILL can be captured with a signal handler and extension support can
be checked this way. Not all extensions can be detected using this
method, and it's much more straightforward to ask the kernel.

> Why don't you check the kernel config or even the hwprobe.h header? Since basically here, you use a syscall to return an information that is visible already from userspace.

To give an example, imagine a new extension Znew comes out, it
occupies the bit 1<<59. Let's say my kernel version was built with
support for detecting it and yours wasn't, but we both have the same
hardware. I compile a binary of a program that wants to do runtime
extension detection and I want to distribute it.

If I use the config or the hwprobe.h header during compilation time,
the compiled binary is assuming that both mine and your system have
this new bit. So when my program tries to detect it, it will find it
on my hardware but not yours. That's because my kernel was built to
support this bit in hwprobe but yours wasn't.

But in reality your hardware does have the extension. However, how
will my program differentiate from "doesn't have an extension" and
"kernel version not new enough"? Maybe I'd like to know that the
kernel doesn't have the bit, and notify the user with an "update your
kernel" message. Maybe I'd like to do the fallback SIGILL extension
detection instead.

PS: I'm assuming you meant checking config/hwprobe.h at compilation
time. If you meant parsing it at runtime, that simply wouldn't be
possible on all environments (think chroots).

On Thu, 14 Aug 2025 at 12:37, Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> Hi Paris,
>
> On 8/13/25 20:05, offtkp wrote:
> > When probing for extensions using RISCV_HWPROBE_KEY_IMA_EXT_0, a missing
> > bit in the resulting bitmask means the extension is not available or the
> > kernel is not recent enough to support the bit. Currently, there's no
> > way to differentiate between the two.
> >
> > This adds a new riscv_hwprobe key, RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL,
> > which returns a bitmask of all the queryable extensions supported by the
> > kernel in RISCV_HWPROBE_KEY_IMA_EXT_0. This can allow programs to use a
> > fallback extension detection method when the bit they want to query is
> > not available in the kernel they are running on.
>
>
> Admittedly, I'm not convinced this is necessary. As you showed in your
> v1, trying to figure out if an extension is available will likely result
> in a SIGILL, so that will kill your application. Why don't you check the
> kernel config or even the hwprobe.h header? Since basically here, you
> use a syscall to return an information that is visible already from
> userspace.
>
> But maybe I'm missing an interesting usecase, just let me know.
>
> Thanks,
>
> Alex
>
>
> >
> > Signed-off-by: offtkp <parisoplop@gmail.com>
> > ---
> > Changes in v2:
> > - convert spaces to tabs
> > - use git format-patch to create diff
> >
> >   Documentation/arch/riscv/hwprobe.rst  | 5 ++++-
> >   arch/riscv/include/asm/hwprobe.h      | 3 ++-
> >   arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
> >   arch/riscv/kernel/sys_hwprobe.c       | 4 ++++
> >   4 files changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> > index 2aa9be272d5d..6d77def0a46e 100644
> > --- a/Documentation/arch/riscv/hwprobe.rst
> > +++ b/Documentation/arch/riscv/hwprobe.rst
> > @@ -360,4 +360,7 @@ The following keys are defined:
> >
> >       * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
> >           vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
> > -     Instruction Extensions Specification.
> > \ No newline at end of file
> > +     Instruction Extensions Specification.
> > +
> > +* :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL`: A bitmask containing the extensions
> > +  that can be probed using the :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0` key.
> > \ No newline at end of file
> > diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> > index 7fe0a379474a..501d49b7a02a 100644
> > --- a/arch/riscv/include/asm/hwprobe.h
> > +++ b/arch/riscv/include/asm/hwprobe.h
> > @@ -8,7 +8,8 @@
> >
> >   #include <uapi/asm/hwprobe.h>
> >
> > -#define RISCV_HWPROBE_MAX_KEY 13
> > +#define RISCV_HWPROBE_MAX_KEY 14
> > +#define RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE      ((1ULL << 59) - 1)
> >
> >   static inline bool riscv_hwprobe_key_is_valid(__s64 key)
> >   {
> > diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> > index aaf6ad970499..a3b92df4dc05 100644
> > --- a/arch/riscv/include/uapi/asm/hwprobe.h
> > +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> > @@ -82,6 +82,7 @@ struct riscv_hwprobe {
> >   #define             RISCV_HWPROBE_EXT_ZAAMO         (1ULL << 56)
> >   #define             RISCV_HWPROBE_EXT_ZALRSC        (1ULL << 57)
> >   #define             RISCV_HWPROBE_EXT_ZABHA         (1ULL << 58)
> > +/* Change RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE when adding items. */
> >   #define RISCV_HWPROBE_KEY_CPUPERF_0 5
> >   #define             RISCV_HWPROBE_MISALIGNED_UNKNOWN        (0 << 0)
> >   #define             RISCV_HWPROBE_MISALIGNED_EMULATED       (1 << 0)
> > @@ -106,6 +107,7 @@ struct riscv_hwprobe {
> >   #define RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0        11
> >   #define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE 12
> >   #define RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0       13
> > +#define RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL 14
> >   /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
> >
> >   /* Flags */
> > diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> > index 0b170e18a2be..40e7fa5f85f3 100644
> > --- a/arch/riscv/kernel/sys_hwprobe.c
> > +++ b/arch/riscv/kernel/sys_hwprobe.c
> > @@ -310,6 +310,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
> >               hwprobe_isa_vendor_ext_thead_0(pair, cpus);
> >               break;
> >
> > +     case RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL:
> > +             pair->value = RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE;
> > +             break;
> > +
> >       /*
> >        * For forward compatibility, unknown keys don't fail the whole
> >        * call, but get their element key set to -1 and value set to 0
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
