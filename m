Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B41CA0EE4
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 14:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NIRZ+oPJfndvxLnfYGRO+IM41C92lOAIDZEhBfZy2+0=; b=eTJwzrapuCohef
	GZb+MzIlxXWmR0B+TxvSSa2AbFe/Mor92bSjZRfX6WnoQzDWPh1ujy+kzel3XRmMZFxCXmdzd2vGF
	jP3kfCpCEt0mBgqlJodbdSk4UBUQY0HNXnDdWkyqh2RMHGN1siSFW4O0sBdmEY8lZhUt1ZTeiKePa
	/k+roYk1zMXtj/UocvvnhJb6xjUyywZtS0V2CjY5HyK8KW3Jj2X6JlqV15ri60tMc3KHRrLsGHm79
	Wvg6NRBLaeXAX9P7XBNq1MH9shVODgzyRI+BVm9XlMXjtBswHw9IqqsxClTx2uk9u2S0dkH08rBqQ
	O4CtFlr0FC0SkorFjrJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYeG-0000000HAoO-353g;
	Thu, 14 Aug 2025 14:09:44 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXtc-0000000H25y-0sM8
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 13:21:33 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e931cb17df8so964102276.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 06:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755177691; x=1755782491; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p/n0Fl1KI8FOX3ahVUqMGcL03bOlc50H+x6+cXcc8qk=;
        b=YJwZayZXqe8XK7PhDFPNvcI0Pfgd9YvmNKk3b4tWVy6XirPcFhS8lzuAj0wPf61Ne0
         B3QHbe/PH79+xVPlmDMf7u6SaCOx8KCi7YnvWWgvr/N7ndacuzC49WKelH+SSG1XYfud
         FAd8nn1nMFjISOD4elqwoRU6j1/94k95Q8dA2+vId7zdKntibekJD1idRBn6mpbxImrL
         /Xfh/7CWbTlYU0aaDwpq8bA6EryDUGjeAKdITpQnu2kd7eL0/3kyupy+mgbitWp1Nf2n
         FDVIex2wQZidSUdtMSOVA7yAK6Qi5oZdbJVw7UJMLbg3KQXTSWkVH6dXV/GRf1FaNDCg
         1cag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755177691; x=1755782491;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/n0Fl1KI8FOX3ahVUqMGcL03bOlc50H+x6+cXcc8qk=;
        b=o/J0zM451JUDbFav6/0Yw+mdtZEAVAp2ntXMfOg8mvxW6g5fHaKj687ZlDk9Q8sH/o
         6K/Kyi+4Sjq3QTeMyXloUXbGWC1yDBdjjiIsSm1A/hy9xVVUrhqtCtA/wmRtn7j/PuIr
         n97fxmQcOFtioXoP5mK/I6c7tnKto0WL+LKYdZTxGZcAzr/Bp16GP2oY1SXQk7w0RoT6
         GYHaWIr0aZDvFdmUifXqN32LrgCIBHh6Ap9tcwtQ1JEb3Fdg5GhQYgenCDBoRIisCpnr
         /2bI4Eb+zlRIYeGJlic4uxIpZagLySLN+A0/xXXLj5Zv3QZh4MDlBffkudGGlacpzFIB
         BhDg==
X-Gm-Message-State: AOJu0YwcenQdV4kjQf/xGZ/3um4vE/eX2/rfvowy5UlxBY0jhuhhy4jR
	ebj7o70Y7jwcOhanJOj7qbrL/krasux6P/g+lfjYCTsaL2fKbWygYaX9nmljHGA2CFuGpQSQDJM
	YJ0oLXRLRSwaeuInsBPsJgoJKEugm5Eo=
X-Gm-Gg: ASbGncvPmBeq+rKvlnQYpOqVaQmyYQvNdMhE6+pzB80wR7RiLIfJdhyaxcP1jcswGOS
	soKahhXcd84r6eD7Krg5xptpBm7jyVfGcI51ThmW97CFfM7WC2mACBc8odmQzsj3z7WG/2UIEqB
	cb38ONlKx3Ieo3pBkYUmnynxI/YzAXH9eYwvOcffqpOQSjnjWCvxzAS8zmbx1Pblg5J9JQ0AOoZ
	Uwb1OgXCcZ+zkbIyRV3ss01+G7Cd9CQccqFOQGYWnda9opvbg==
X-Google-Smtp-Source: AGHT+IGUJmHTB7Bj+7rMx6IHrlE3IGJokeOYKHAs+IXBzmFaWMqhj3LetKa3W4S1HzGEDcBALeQ1TmJ3RJYTbjiLwp8=
X-Received: by 2002:a05:6902:4012:b0:e8b:c2b2:306f with SMTP id
 3f1490d57ef6-e931e128180mr3894720276.4.1755177690998; Thu, 14 Aug 2025
 06:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAAbFZ0iFJbpqxqTUYhB+tUZSiL1qQJ=PeABCCjkeSpf4_TNiyQ@mail.gmail.com>
 <20250813180545.110666-1-parisoplop@gmail.com> <bb580c80-5c6d-43f8-808a-e0d713f0be0c@ghiti.fr>
 <CAAbFZ0hK7uAm_jXoThK+tLsGzBrLSNr1=Gv8=H21D7DyODWB6g@mail.gmail.com>
 <18ea9e1c-ebf9-4a5e-8880-d1af9ea07138@ghiti.fr> <CAAbFZ0j0UL0E08NCFgHRwL83CbWiKTnmaaMm414Oofi12HxLgA@mail.gmail.com>
 <ef00cbeb-e86e-40ed-b5f6-d771b10216da@ghiti.fr>
In-Reply-To: <ef00cbeb-e86e-40ed-b5f6-d771b10216da@ghiti.fr>
From: Paris Oplopoios <parisoplop@gmail.com>
Date: Thu, 14 Aug 2025 16:21:18 +0300
X-Gm-Features: Ac12FXwroAe1jSeoWVSJGnyZ9N8UJ_Z3EWLivv32onbv9Vfq-YIYnHSmwoQycF0
Message-ID: <CAAbFZ0gh_gbvYeZ4K0YPr_xBS-srMjseNmVkYzg_R-XYuu89-g@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: hwprobe: allow querying available
 RISCV_HWPROBE_KEY_IMA_EXT_0 bits
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_062132_253987_9E1EE8BE 
X-CRM114-Status: GOOD (  63.03  )
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

> Can you add that ^ to the change log?

I'm new to kernel development, could you elaborate? Do you want me to make
a v3 patch and add the points from our conversation to the changelog?

> 59 should not be hardcoded, even with your comment below. Let's introduce
> something like RISCV_HWPROBE_EXT_COUNT or similar.
> You don't really need to return a mask here, you can simply return
> RISCV_HWPROBE_EXT_COUNT and let the userspace deal with the mask.

I do agree that the number 59 shouldn't be hardcoded, but I think returning
a mask is more user-friendly. If we return a number, the userspace
would have to do:

     if (value == 64) {
         mask = -1ull;
     } else {
         mask = (1ull << value) - 1;
     }

to construct a mask and be able to check availability via (mask &
RISCV_HWPROBE_EXT_ZNEW).
IMO, this makes the API more unfriendly than returning a mask.

I think perhaps a better solution is constructing the mask by ORing
all the available extensions
and returning that. What do you think?

On Thu, 14 Aug 2025 at 15:55, Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> On 8/14/25 13:57, Paris Oplopoios wrote:
> >> What about parsing the isa string?
> > Yes, parsing the ISA string would work. But if we're going
> > to do that, we might as well not use hwprobe at all. In my
> > opinion, using the syscall is much easier to implement and maintain.
>
>
> You're right.
>
>
> >
> >
> >> And do you have a real usecase in
> >> mind? I mean which project would benefit from this?
> > Yes, I want this feature for an x86-on-RISC-V userspace emulator
> > called felix86. We do runtime extension detection for our JIT.
> > Currently, for any extension that defines instructions we use the SIGILL
> > method previously described, because there's no way to tell with just
> > a hwprobe call whether a 0 bit means extension not present or kernel
> > too old. But we can't do this for all extensions, some don't define
> > instructions.
> >
> > The end goal would be being able to detect an extension using hwprobe, and if
> > it's not detectable, notifying the user that we can't detect it and
> > they can mark
> > it as enabled in the emulator's config file.
>
>
> Ok, I'm not opposed anymore, but I have added Conor in cc to have his
> opinion. Can you add that ^ to the change log? And now let's talk about
> the patch, see my comments below.
>
>
> >
> > On Thu, 14 Aug 2025 at 14:22, Alexandre Ghiti <alex@ghiti.fr> wrote:
> >> On 8/14/25 12:32, Paris Oplopoios wrote:
> >>> Hello Alexandre,
> >>>
> >>>> trying to figure out if an extension is available will likely result in a SIGILL, so that will kill your application
> >>> SIGILL can be captured with a signal handler and extension support can
> >>> be checked this way. Not all extensions can be detected using this
> >>> method, and it's much more straightforward to ask the kernel.
> >>>
> >>>> Why don't you check the kernel config or even the hwprobe.h header? Since basically here, you use a syscall to return an information that is visible already from userspace.
> >>> To give an example, imagine a new extension Znew comes out, it
> >>> occupies the bit 1<<59. Let's say my kernel version was built with
> >>> support for detecting it and yours wasn't, but we both have the same
> >>> hardware. I compile a binary of a program that wants to do runtime
> >>> extension detection and I want to distribute it.
> >>>
> >>> If I use the config or the hwprobe.h header during compilation time,
> >>> the compiled binary is assuming that both mine and your system have
> >>> this new bit. So when my program tries to detect it, it will find it
> >>> on my hardware but not yours. That's because my kernel was built to
> >>> support this bit in hwprobe but yours wasn't.
> >>>
> >>> But in reality your hardware does have the extension. However, how
> >>> will my program differentiate from "doesn't have an extension" and
> >>> "kernel version not new enough"? Maybe I'd like to know that the
> >>> kernel doesn't have the bit, and notify the user with an "update your
> >>> kernel" message. Maybe I'd like to do the fallback SIGILL extension
> >>> detection instead.
> >>
> >> What about parsing the isa string? And do you have a real usecase in
> >> mind? I mean which project would benefit from this?
> >>
> >>
> >>> PS: I'm assuming you meant checking config/hwprobe.h at compilation
> >>> time. If you meant parsing it at runtime, that simply wouldn't be
> >>> possible on all environments (think chroots).
> >>>
> >>> On Thu, 14 Aug 2025 at 12:37, Alexandre Ghiti <alex@ghiti.fr> wrote:
> >>>> Hi Paris,
> >>>>
> >>>> On 8/13/25 20:05, offtkp wrote:
> >>>>> When probing for extensions using RISCV_HWPROBE_KEY_IMA_EXT_0, a missing
> >>>>> bit in the resulting bitmask means the extension is not available or the
> >>>>> kernel is not recent enough to support the bit. Currently, there's no
> >>>>> way to differentiate between the two.
> >>>>>
> >>>>> This adds a new riscv_hwprobe key, RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL,
> >>>>> which returns a bitmask of all the queryable extensions supported by the
> >>>>> kernel in RISCV_HWPROBE_KEY_IMA_EXT_0. This can allow programs to use a
> >>>>> fallback extension detection method when the bit they want to query is
> >>>>> not available in the kernel they are running on.
> >>>> Admittedly, I'm not convinced this is necessary. As you showed in your
> >>>> v1, trying to figure out if an extension is available will likely result
> >>>> in a SIGILL, so that will kill your application. Why don't you check the
> >>>> kernel config or even the hwprobe.h header? Since basically here, you
> >>>> use a syscall to return an information that is visible already from
> >>>> userspace.
> >>>>
> >>>> But maybe I'm missing an interesting usecase, just let me know.
> >>>>
> >>>> Thanks,
> >>>>
> >>>> Alex
> >>>>
> >>>>
> >>>>> Signed-off-by: offtkp <parisoplop@gmail.com>
> >>>>> ---
> >>>>> Changes in v2:
> >>>>> - convert spaces to tabs
> >>>>> - use git format-patch to create diff
> >>>>>
> >>>>>     Documentation/arch/riscv/hwprobe.rst  | 5 ++++-
> >>>>>     arch/riscv/include/asm/hwprobe.h      | 3 ++-
> >>>>>     arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
> >>>>>     arch/riscv/kernel/sys_hwprobe.c       | 4 ++++
> >>>>>     4 files changed, 12 insertions(+), 2 deletions(-)
> >>>>>
> >>>>> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> >>>>> index 2aa9be272d5d..6d77def0a46e 100644
> >>>>> --- a/Documentation/arch/riscv/hwprobe.rst
> >>>>> +++ b/Documentation/arch/riscv/hwprobe.rst
> >>>>> @@ -360,4 +360,7 @@ The following keys are defined:
> >>>>>
> >>>>>         * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
> >>>>>             vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
> >>>>> -     Instruction Extensions Specification.
> >>>>> \ No newline at end of file
> >>>>> +     Instruction Extensions Specification.
> >>>>> +
> >>>>> +* :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL`: A bitmask containing the extensions
> >>>>> +  that can be probed using the :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0` key.
> >>>>> \ No newline at end of file
> >>>>> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> >>>>> index 7fe0a379474a..501d49b7a02a 100644
> >>>>> --- a/arch/riscv/include/asm/hwprobe.h
> >>>>> +++ b/arch/riscv/include/asm/hwprobe.h
> >>>>> @@ -8,7 +8,8 @@
> >>>>>
> >>>>>     #include <uapi/asm/hwprobe.h>
> >>>>>
> >>>>> -#define RISCV_HWPROBE_MAX_KEY 13
> >>>>> +#define RISCV_HWPROBE_MAX_KEY 14
> >>>>> +#define RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE      ((1ULL << 59) - 1)
>
>
> 59 should not be hardcoded, even with your comment below. Let's
> introduce something like RISCV_HWPROBE_EXT_COUNT or similar.
>
>
> >>>>>
> >>>>>     static inline bool riscv_hwprobe_key_is_valid(__s64 key)
> >>>>>     {
> >>>>> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> >>>>> index aaf6ad970499..a3b92df4dc05 100644
> >>>>> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> >>>>> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> >>>>> @@ -82,6 +82,7 @@ struct riscv_hwprobe {
> >>>>>     #define             RISCV_HWPROBE_EXT_ZAAMO         (1ULL << 56)
> >>>>>     #define             RISCV_HWPROBE_EXT_ZALRSC        (1ULL << 57)
> >>>>>     #define             RISCV_HWPROBE_EXT_ZABHA         (1ULL << 58)
> >>>>> +/* Change RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE when adding items. */
> >>>>>     #define RISCV_HWPROBE_KEY_CPUPERF_0 5
> >>>>>     #define             RISCV_HWPROBE_MISALIGNED_UNKNOWN        (0 << 0)
> >>>>>     #define             RISCV_HWPROBE_MISALIGNED_EMULATED       (1 << 0)
> >>>>> @@ -106,6 +107,7 @@ struct riscv_hwprobe {
> >>>>>     #define RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0        11
> >>>>>     #define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE 12
> >>>>>     #define RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0       13
> >>>>> +#define RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL 14
> >>>>>     /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
> >>>>>
> >>>>>     /* Flags */
> >>>>> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> >>>>> index 0b170e18a2be..40e7fa5f85f3 100644
> >>>>> --- a/arch/riscv/kernel/sys_hwprobe.c
> >>>>> +++ b/arch/riscv/kernel/sys_hwprobe.c
> >>>>> @@ -310,6 +310,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
> >>>>>                 hwprobe_isa_vendor_ext_thead_0(pair, cpus);
> >>>>>                 break;
> >>>>>
> >>>>> +     case RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL:
> >>>>> +             pair->value = RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE;
>
>
> You don't really need to return a mask here, you can simply return
> RISCV_HWPROBE_EXT_COUNT and let the userspace deal with the mask.
>
>
> >>>>> +             break;
> >>>>> +
> >>>>>         /*
> >>>>>          * For forward compatibility, unknown keys don't fail the whole
> >>>>>          * call, but get their element key set to -1 and value set to 0
> >>>>>
> >>>>> _______________________________________________
> >>>>> linux-riscv mailing list
> >>>>> linux-riscv@lists.infradead.org
> >>>>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
