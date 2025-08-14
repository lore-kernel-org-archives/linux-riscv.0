Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AE7CA0EE4
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 15:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a0H41zEUXTm6QFJKqf0fPn44TP4XJcVBheb/djM9J5E=; b=3UeKLhafEhztGx
	Orp/R9nLwDfwQqXI5wVIEvFSDtr/Ec89D5FNg/Xe9DevG8HMgTPR5sYOHBPq2hSv/HQHnApAbIG9l
	1rnBloLl7W7j0IRr59X4p0l4LaKHlq2AF0F+TAuLNr8XbIu8L3bp8+drV5oRB40OrOL+v5KXEE4yU
	7ylHSFDGmrYmQa4mEMQ7jXfOFY9A13xQ1QdDjr1coQvFl7w1InF+mgL6PvZ82hnQlnaeMQYTtHXOB
	LiPu5b0PLSYMGf4PkZHhdTMNRu/tkL4iTyIOQ7LjYY/3S1SkY6URa6nhibPUYsggxt56Puqh+ouo6
	mfPOOhl6eisfOx9in0zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZsM-0000000HR28-3cIb;
	Thu, 14 Aug 2025 15:28:22 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYox-0000000HEoz-2kbv
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 14:20:48 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e931cc608a8so912629276.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 07:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755181246; x=1755786046; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=djwxiOCNAxIt1G3p7MSrKfz3bxEiUASgFPDZ7Nf1SgI=;
        b=hOHnfE2dVc1Uf06mMk9c5aa2+jVjZO3QbpoYlymnpXU1XMEmq0Q0uP365HZIpbkSsW
         O/oWGCHzYlq4ZkSZrUOAjvmBTRwwl6PevQ0FRV+SES3ZRTYHln/g6Ri47mZOLfCcUuXe
         mFt5zf1zsPBiBUC/ZmNTYUxRl5ZzEDyueuF3R+UWFODFULkReQd1Ab+YOmSvSANR7l0i
         OT5Fq8SVBP9f6q6/nw70Zd3Ejvu5NL4jSFb8W6DNgIuyBsQKKTRMIV1MKoT0RNkq/zzY
         nBTsZZY6bnjtYZApZK+XGNcz1RLnWcggllOXkuwp3auuWCkBt3ie3G87RRvZ+SkxU857
         Dyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755181246; x=1755786046;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djwxiOCNAxIt1G3p7MSrKfz3bxEiUASgFPDZ7Nf1SgI=;
        b=c7z8F/U+pZ8Wu9+Ofz5MpSeIO6BqN6IGehLEsT1Etyw8c08VOa6JH2v2SWx68+HSAc
         2ltQFdgcY6OCOmXa8C9542o1zR9OHOgsyFLH3tN2cmgZSDiCXORLF0M/N8oSpHATrt+U
         3JZjPtg6eFgYBBC+0ZSHaFa2SxYawPONly81X2DaoMX8rXewwfGYFwTQV5G2ilF8+eJi
         IfLCa3YloUXZT9rcsPOCR9h04TZ7XM884IoA0wn6ckcod9rF0+LZlaskzJCr1w7Ze34F
         DuEsAOpaQpSjfZM9doR3AdoQNrdmOSUScWcVPIbUTjL2PlCF99d/axjGTH/cBIEtDjRK
         r4CQ==
X-Gm-Message-State: AOJu0YyTtqzUAGObNFN+LUGHDmryFw9JFR0PXzzHDb7aqWCbqlmTNrzE
	rArVTPmjwvblFoQrIWeUbLyC2vAUkfJN9VXaxjaDw4H7WLv0kUSrzTJMZbtqJUcH23PGfENAbVY
	CXCKHhu82u+VACQNfEsOn9BgCEe04/k+fv1LOpUXDlg==
X-Gm-Gg: ASbGnctmHbcijd55/dSuo11gc9DY54e80Pk6PvdlZ5QtdzyinwTmxJVJDGj5JZt7iki
	XjJFa54vau2sbeKlhT0oVxT3KHmeaQeF187jsV35fj1APLyGLXfclwH8okAfRhcW/m+TjPjO4+j
	GTnNWjCEnWwx8wJl9p1Ry7bjywbzXS8VzvMgbozz7Tq8jDIEnB0yjHR2LMo5IPqajoVcAQfEgSj
	XBUF8LfksES+Ron7zF4BysQ8+qo8eGChbytZ8x2lmekg6aV1g==
X-Google-Smtp-Source: AGHT+IGfn0A6NqG2tEwOABYBZeVh8YR72/4OVtWq8Amlcz1pPogg2NTYudbSHXwb+2S2jd2ySzRuTGLdj5jK+CPnjJU=
X-Received: by 2002:a05:6902:4204:b0:e90:6c17:7e03 with SMTP id
 3f1490d57ef6-e931e215de2mr3700306276.31.1755181246325; Thu, 14 Aug 2025
 07:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAAbFZ0iFJbpqxqTUYhB+tUZSiL1qQJ=PeABCCjkeSpf4_TNiyQ@mail.gmail.com>
 <20250813180545.110666-1-parisoplop@gmail.com> <bb580c80-5c6d-43f8-808a-e0d713f0be0c@ghiti.fr>
 <CAAbFZ0hK7uAm_jXoThK+tLsGzBrLSNr1=Gv8=H21D7DyODWB6g@mail.gmail.com>
 <18ea9e1c-ebf9-4a5e-8880-d1af9ea07138@ghiti.fr> <CAAbFZ0j0UL0E08NCFgHRwL83CbWiKTnmaaMm414Oofi12HxLgA@mail.gmail.com>
 <ef00cbeb-e86e-40ed-b5f6-d771b10216da@ghiti.fr> <CAAbFZ0gh_gbvYeZ4K0YPr_xBS-srMjseNmVkYzg_R-XYuu89-g@mail.gmail.com>
 <0561b83a-cba8-4722-bb55-fb75ed47d36e@ghiti.fr>
In-Reply-To: <0561b83a-cba8-4722-bb55-fb75ed47d36e@ghiti.fr>
From: Paris Oplopoios <parisoplop@gmail.com>
Date: Thu, 14 Aug 2025 17:20:34 +0300
X-Gm-Features: Ac12FXwrfsAo7vdnG-IetHCywxyom-0UB_hTdBgZ-fydIivzlttbjJlNpKa8Mdc
Message-ID: <CAAbFZ0hUtskQEgEp_Ov=wVO1=L+EJv004waDRe=NrNAhun-ubw@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: hwprobe: allow querying available
 RISCV_HWPROBE_KEY_IMA_EXT_0 bits
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_072047_700506_2567F7F5 
X-CRM114-Status: GOOD (  71.95  )
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

> You can simply get the position of the bit RISCV_HWPROBE_EXT_ZNEW and
> make sure it's lower than RISCV_HWPROBE_EXT_COUNT, which is way easier
> than dealing with >64bit bitmasks.

There won't really ever be >64bit bitmasks, as they get split into
different keys.

> I have to admit that I don't know how the interface was thought when the
> number of extensions will be greater than 64, I guess we'll introduce
> RISCV_HWPROBE_KEY_IMA_EXT_1
Yes, I'm pretty sure that's the idea.

> One way would be to ask for the number of extensions
> first, which would be RISCV_HWPROBE_EXT_COUNT. And then we kill two
> birds with one stone :)

If it absolutely had to be a count, it would still need to be a count per key.
Currently, there's RISCV_HWPROBE_KEY_IMA_EXT_0. In the future most likely
there will be a RISCV_HWPROBE_KEY_IMA_EXT_1.
But you also need to consider there's keys for custom extensions, such as
RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0, RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0,
and most likely more in the future. A single global extension counter wouldn't
cover this.

> Sorry I did not get what you mean here.
Example:

#define RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL (RISCV_HWPROBE_IMA_FD |
     RISCV_HWPROBE_IMA_C | RISCV_HWPROBE_IMA_V | ... | RISCV_HWPROBE_EXT_ZABHA)

On Thu, 14 Aug 2025 at 16:56, Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> On 8/14/25 15:21, Paris Oplopoios wrote:
> >> Can you add that ^ to the change log?
> > I'm new to kernel development, could you elaborate? Do you want me to make
> > a v3 patch and add the points from our conversation to the changelog?
>
>
> Yes, I think it's nice to have the motivations behind a patch in the
> change log.
>
>
> >
> >> 59 should not be hardcoded, even with your comment below. Let's introduce
> >> something like RISCV_HWPROBE_EXT_COUNT or similar.
> >> You don't really need to return a mask here, you can simply return
> >> RISCV_HWPROBE_EXT_COUNT and let the userspace deal with the mask.
> > I do agree that the number 59 shouldn't be hardcoded, but I think returning
> > a mask is more user-friendly. If we return a number, the userspace
> > would have to do:
> >
> >       if (value == 64) {
> >           mask = -1ull;
> >       } else {
> >           mask = (1ull << value) - 1;
> >       }
> >
> > to construct a mask and be able to check availability via (mask &
> > RISCV_HWPROBE_EXT_ZNEW).
> > IMO, this makes the API more unfriendly than returning a mask.
>
>
> You can simply get the position of the bit RISCV_HWPROBE_EXT_ZNEW and
> make sure it's lower than RISCV_HWPROBE_EXT_COUNT, which is way easier
> than dealing with >64bit bitmasks.
>
> I have to admit that I don't know how the interface was thought when the
> number of extensions will be greater than 64, I guess we'll introduce
> RISCV_HWPROBE_KEY_IMA_EXT_1 and the user will have to ask explicitly for
> those. But to ask for more, the user will first need to know that more
> extensions exist. One way would be to ask for the number of extensions
> first, which would be RISCV_HWPROBE_EXT_COUNT. And then we kill two
> birds with one stone :)
>
> I may have missed something though because current applications would
> not know about this and will have to be updated.
>
>
> >
> > I think perhaps a better solution is constructing the mask by ORing
> > all the available extensions
> > and returning that. What do you think?
>
>
> Sorry I did not get what you mean here.
>
>
> >
> > On Thu, 14 Aug 2025 at 15:55, Alexandre Ghiti <alex@ghiti.fr> wrote:
> >> On 8/14/25 13:57, Paris Oplopoios wrote:
> >>>> What about parsing the isa string?
> >>> Yes, parsing the ISA string would work. But if we're going
> >>> to do that, we might as well not use hwprobe at all. In my
> >>> opinion, using the syscall is much easier to implement and maintain.
> >>
> >> You're right.
> >>
> >>
> >>>
> >>>> And do you have a real usecase in
> >>>> mind? I mean which project would benefit from this?
> >>> Yes, I want this feature for an x86-on-RISC-V userspace emulator
> >>> called felix86. We do runtime extension detection for our JIT.
> >>> Currently, for any extension that defines instructions we use the SIGILL
> >>> method previously described, because there's no way to tell with just
> >>> a hwprobe call whether a 0 bit means extension not present or kernel
> >>> too old. But we can't do this for all extensions, some don't define
> >>> instructions.
> >>>
> >>> The end goal would be being able to detect an extension using hwprobe, and if
> >>> it's not detectable, notifying the user that we can't detect it and
> >>> they can mark
> >>> it as enabled in the emulator's config file.
> >>
> >> Ok, I'm not opposed anymore, but I have added Conor in cc to have his
> >> opinion. Can you add that ^ to the change log? And now let's talk about
> >> the patch, see my comments below.
> >>
> >>
> >>> On Thu, 14 Aug 2025 at 14:22, Alexandre Ghiti <alex@ghiti.fr> wrote:
> >>>> On 8/14/25 12:32, Paris Oplopoios wrote:
> >>>>> Hello Alexandre,
> >>>>>
> >>>>>> trying to figure out if an extension is available will likely result in a SIGILL, so that will kill your application
> >>>>> SIGILL can be captured with a signal handler and extension support can
> >>>>> be checked this way. Not all extensions can be detected using this
> >>>>> method, and it's much more straightforward to ask the kernel.
> >>>>>
> >>>>>> Why don't you check the kernel config or even the hwprobe.h header? Since basically here, you use a syscall to return an information that is visible already from userspace.
> >>>>> To give an example, imagine a new extension Znew comes out, it
> >>>>> occupies the bit 1<<59. Let's say my kernel version was built with
> >>>>> support for detecting it and yours wasn't, but we both have the same
> >>>>> hardware. I compile a binary of a program that wants to do runtime
> >>>>> extension detection and I want to distribute it.
> >>>>>
> >>>>> If I use the config or the hwprobe.h header during compilation time,
> >>>>> the compiled binary is assuming that both mine and your system have
> >>>>> this new bit. So when my program tries to detect it, it will find it
> >>>>> on my hardware but not yours. That's because my kernel was built to
> >>>>> support this bit in hwprobe but yours wasn't.
> >>>>>
> >>>>> But in reality your hardware does have the extension. However, how
> >>>>> will my program differentiate from "doesn't have an extension" and
> >>>>> "kernel version not new enough"? Maybe I'd like to know that the
> >>>>> kernel doesn't have the bit, and notify the user with an "update your
> >>>>> kernel" message. Maybe I'd like to do the fallback SIGILL extension
> >>>>> detection instead.
> >>>> What about parsing the isa string? And do you have a real usecase in
> >>>> mind? I mean which project would benefit from this?
> >>>>
> >>>>
> >>>>> PS: I'm assuming you meant checking config/hwprobe.h at compilation
> >>>>> time. If you meant parsing it at runtime, that simply wouldn't be
> >>>>> possible on all environments (think chroots).
> >>>>>
> >>>>> On Thu, 14 Aug 2025 at 12:37, Alexandre Ghiti <alex@ghiti.fr> wrote:
> >>>>>> Hi Paris,
> >>>>>>
> >>>>>> On 8/13/25 20:05, offtkp wrote:
> >>>>>>> When probing for extensions using RISCV_HWPROBE_KEY_IMA_EXT_0, a missing
> >>>>>>> bit in the resulting bitmask means the extension is not available or the
> >>>>>>> kernel is not recent enough to support the bit. Currently, there's no
> >>>>>>> way to differentiate between the two.
> >>>>>>>
> >>>>>>> This adds a new riscv_hwprobe key, RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL,
> >>>>>>> which returns a bitmask of all the queryable extensions supported by the
> >>>>>>> kernel in RISCV_HWPROBE_KEY_IMA_EXT_0. This can allow programs to use a
> >>>>>>> fallback extension detection method when the bit they want to query is
> >>>>>>> not available in the kernel they are running on.
> >>>>>> Admittedly, I'm not convinced this is necessary. As you showed in your
> >>>>>> v1, trying to figure out if an extension is available will likely result
> >>>>>> in a SIGILL, so that will kill your application. Why don't you check the
> >>>>>> kernel config or even the hwprobe.h header? Since basically here, you
> >>>>>> use a syscall to return an information that is visible already from
> >>>>>> userspace.
> >>>>>>
> >>>>>> But maybe I'm missing an interesting usecase, just let me know.
> >>>>>>
> >>>>>> Thanks,
> >>>>>>
> >>>>>> Alex
> >>>>>>
> >>>>>>
> >>>>>>> Signed-off-by: offtkp <parisoplop@gmail.com>
> >>>>>>> ---
> >>>>>>> Changes in v2:
> >>>>>>> - convert spaces to tabs
> >>>>>>> - use git format-patch to create diff
> >>>>>>>
> >>>>>>>      Documentation/arch/riscv/hwprobe.rst  | 5 ++++-
> >>>>>>>      arch/riscv/include/asm/hwprobe.h      | 3 ++-
> >>>>>>>      arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
> >>>>>>>      arch/riscv/kernel/sys_hwprobe.c       | 4 ++++
> >>>>>>>      4 files changed, 12 insertions(+), 2 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> >>>>>>> index 2aa9be272d5d..6d77def0a46e 100644
> >>>>>>> --- a/Documentation/arch/riscv/hwprobe.rst
> >>>>>>> +++ b/Documentation/arch/riscv/hwprobe.rst
> >>>>>>> @@ -360,4 +360,7 @@ The following keys are defined:
> >>>>>>>
> >>>>>>>          * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
> >>>>>>>              vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
> >>>>>>> -     Instruction Extensions Specification.
> >>>>>>> \ No newline at end of file
> >>>>>>> +     Instruction Extensions Specification.
> >>>>>>> +
> >>>>>>> +* :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL`: A bitmask containing the extensions
> >>>>>>> +  that can be probed using the :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0` key.
> >>>>>>> \ No newline at end of file
> >>>>>>> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> >>>>>>> index 7fe0a379474a..501d49b7a02a 100644
> >>>>>>> --- a/arch/riscv/include/asm/hwprobe.h
> >>>>>>> +++ b/arch/riscv/include/asm/hwprobe.h
> >>>>>>> @@ -8,7 +8,8 @@
> >>>>>>>
> >>>>>>>      #include <uapi/asm/hwprobe.h>
> >>>>>>>
> >>>>>>> -#define RISCV_HWPROBE_MAX_KEY 13
> >>>>>>> +#define RISCV_HWPROBE_MAX_KEY 14
> >>>>>>> +#define RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE      ((1ULL << 59) - 1)
> >>
> >> 59 should not be hardcoded, even with your comment below. Let's
> >> introduce something like RISCV_HWPROBE_EXT_COUNT or similar.
> >>
> >>
> >>>>>>>      static inline bool riscv_hwprobe_key_is_valid(__s64 key)
> >>>>>>>      {
> >>>>>>> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> >>>>>>> index aaf6ad970499..a3b92df4dc05 100644
> >>>>>>> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> >>>>>>> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> >>>>>>> @@ -82,6 +82,7 @@ struct riscv_hwprobe {
> >>>>>>>      #define             RISCV_HWPROBE_EXT_ZAAMO         (1ULL << 56)
> >>>>>>>      #define             RISCV_HWPROBE_EXT_ZALRSC        (1ULL << 57)
> >>>>>>>      #define             RISCV_HWPROBE_EXT_ZABHA         (1ULL << 58)
> >>>>>>> +/* Change RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE when adding items. */
> >>>>>>>      #define RISCV_HWPROBE_KEY_CPUPERF_0 5
> >>>>>>>      #define             RISCV_HWPROBE_MISALIGNED_UNKNOWN        (0 << 0)
> >>>>>>>      #define             RISCV_HWPROBE_MISALIGNED_EMULATED       (1 << 0)
> >>>>>>> @@ -106,6 +107,7 @@ struct riscv_hwprobe {
> >>>>>>>      #define RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0        11
> >>>>>>>      #define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE 12
> >>>>>>>      #define RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0       13
> >>>>>>> +#define RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL 14
> >>>>>>>      /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
> >>>>>>>
> >>>>>>>      /* Flags */
> >>>>>>> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> >>>>>>> index 0b170e18a2be..40e7fa5f85f3 100644
> >>>>>>> --- a/arch/riscv/kernel/sys_hwprobe.c
> >>>>>>> +++ b/arch/riscv/kernel/sys_hwprobe.c
> >>>>>>> @@ -310,6 +310,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
> >>>>>>>                  hwprobe_isa_vendor_ext_thead_0(pair, cpus);
> >>>>>>>                  break;
> >>>>>>>
> >>>>>>> +     case RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL:
> >>>>>>> +             pair->value = RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE;
> >>
> >> You don't really need to return a mask here, you can simply return
> >> RISCV_HWPROBE_EXT_COUNT and let the userspace deal with the mask.
> >>
> >>
> >>>>>>> +             break;
> >>>>>>> +
> >>>>>>>          /*
> >>>>>>>           * For forward compatibility, unknown keys don't fail the whole
> >>>>>>>           * call, but get their element key set to -1 and value set to 0
> >>>>>>>
> >>>>>>> _______________________________________________
> >>>>>>> linux-riscv mailing list
> >>>>>>> linux-riscv@lists.infradead.org
> >>>>>>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
