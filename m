Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC2DC8303F
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 23:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pc1Q1XUj3WuukEkusGQfr32eIQy72rUUSK+2M2lT6+Q=; b=YknHC1OJ8slbLw
	aZOsp9OvL58/HyoqM3j6jcGjs13sMwHtJsOCh6HcWtTgn0bTDVL0brN8Z8Y32nj+VfY+i+ME9ofMV
	XmGTyAXJFkh09WjJ+nnvbp8lbpyXR3ap20lVsMzKfIAKnUaLjBX3LYZZNLIib3VJe3cfQeff65N2W
	QL5f5KiXEEdmSkYUxHdZ4UYkhG02jl4i7kpTqcpkzaLkBja3bIBB1igu8YxNL00kzmk+677tqPWZz
	qxrjYG9n/gA7DnTlsVrQqsSxxMT1GMUOLfmis3vNo43akF7hEbO4ClDIwqGz6X5qID+L2/Egx0LoA
	uCLqZRZUPRNkWzi95bEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqgOZ-0000000A7Gl-2d61;
	Mon, 25 Aug 2025 23:14:35 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqgNB-0000000A74K-2WqF
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 23:13:10 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-71d6059f490so45495737b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 25 Aug 2025 16:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756163588; x=1756768388; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xUNSEbz92uNNIlJa5HQmPG2vdi+kZuMkO4IE6wbihPA=;
        b=L65AVReJFhgNvWzG9lPcfR4VhAIvVXGgJjfVyNPybt5aG+sPqtWkVZ0P24U3mvy3Ys
         Qx/cd9b26buy1h9EngPZsZc+v2tj9lVOix4XEx1s0QA5EIVKruNCUTF8QWFMqDH8TfhS
         oCZ+kjxOlrHdS9shGNx0H7WEcnzCfjZzfbON9RU2SVuXQLAsOyZ6ldUmQeL9sLAYi0gE
         Z6ORBHIFEv+JoMGd+RHTsSZJfKdcBdmjo94ZA8uWI8+dMjyX29NFTXSCTCwzVH2qXd+2
         T8wJaLI6g7YUgAkXS7rz8IHbcx5eQq5utpcz1PJniPczn2avr6lutVMcxBNTuW/dLOcu
         IlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756163588; x=1756768388;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xUNSEbz92uNNIlJa5HQmPG2vdi+kZuMkO4IE6wbihPA=;
        b=cNIodD9TQSTp6k15AcdBYKQyJHjlyqpqBBksHR/PxbNKVRb6Uf7lkuMB3rgWylET/W
         3Ea8CAE6vm4dhXlVDK4bRB9e8h+L3LugIPvJDrGEA22RkSSbk031QdijPliID8LXOTKz
         IsZcBCdALSW8RkGt8B0tGkN+r615epd4soBidRIgeSoWyk0Okixx4/7NKSS4h6AS6paQ
         r44rFmO5oZ7EQfRi4ta8uXaSphGOpK7DC9qnTjxQtC+gKcXMx2/vEIxFW/SXQqXCWbK3
         oJG26c0jec06cEkkcT3rXl7dlScl7UbcCjznlsBmqCfiy7uhChKbwN4DAUC1wnw/yixl
         aHDQ==
X-Gm-Message-State: AOJu0YyDuSLFjjCkIU//UZcNiIMvryDHPqZ00D5rerbuszEc7BYLQuvz
	R8UTCvqzaho71tj1ctm2nbfk5JddoPJpW8ghha3r75C10y/sOk/L1w9h6pyAzeSk4gNIkS99dts
	VHpVBa7YEkAoq+h7jNxE7UzQoRAZjZq8=
X-Gm-Gg: ASbGncuRo0XPzWNG4Jjy6es1HwlQjjUOXr0rY061Waghi/Z+X9MZmpnizqmBJrNoXXh
	JDbpVaUYqqN5l/Sdej06nojpinUXoU4qhDWV3HvY9m5zvghJNG53mpkG6s2SOSCAZOdtg1iOfY4
	CnF1ibIaIqoC0DPTm9Hk3woaftxC+JaAaOAHcSrHNNgSfCeQeHohU3N4HdmJZVrDltXPgO2TdZC
	HM8YduGtN05M+QueJVmeDRFoYZyBP2LXgMzYFA=
X-Google-Smtp-Source: AGHT+IGN2Vd+h7bhtYrLnenKzaUnM+vmllgmPbXwGIIUWMKrelmnp2ZGgX8sgFmLElAlrSvEGfmgaF+jm0WcyGT8rSo=
X-Received: by 2002:a05:690c:9a11:b0:71f:b944:1011 with SMTP id
 00721157ae682-71fdc43b185mr149897137b3.44.1756163588234; Mon, 25 Aug 2025
 16:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250814221646.32140-1-parisoplop@gmail.com> <20250825170258.24068-1-parisoplop@gmail.com>
 <20250825-6d7eedc4459b72ceb07ce782@orel>
In-Reply-To: <20250825-6d7eedc4459b72ceb07ce782@orel>
From: Paris Oplopoios <parisoplop@gmail.com>
Date: Tue, 26 Aug 2025 02:12:57 +0300
X-Gm-Features: Ac12FXwr3vZA4CQ_NR4KKCceESTZz4qomXiX_b2ut2Hy1aioMiymfp-nHAyJyvE
Message-ID: <CAAbFZ0gHRs0N6Fo58oobEVbrJmrCZzC1H4TXYOPKyE2YxdN11g@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND] riscv: hwprobe: allow querying available
 RISCV_HWPROBE_KEY_IMA_EXT_0 bits
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, conor@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_161309_645831_36822912 
X-CRM114-Status: GOOD (  50.61  )
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

I disagree. This sort of practice is used in other places in the
kernel, such as statx and stx_attributes with stx_attributes_mask.
Knowing that the kernel is unaware of the extension is important for
programs, regardless of if we can learn about its availability or not.
Another example is openat2. If you pass a flag in how.resolve that the
kernel doesn't support, an error is returned.

Whether or not we need a new API to detect extensions, hwprobe is not
reliable in its current state if we can't tell which bits the kernel
knows about at runtime.

On Tue, 26 Aug 2025 at 01:00, Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Mon, Aug 25, 2025 at 08:02:21PM +0300, offtkp wrote:
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
> >
> > Signed-off-by: offtkp <parisoplop@gmail.com>
> > ---
> > Changes in v3:
> > - remove the 59 magic number and create the mask as a define
> >
> > Conversation from v2 to show motivation for this patch as a whole:
> >
> > > And do you have a real usecase in
> > > mind? I mean which project would benefit from this?
> > Yes, I want this feature for an x86-on-RISC-V userspace emulator
> > called felix86. We do runtime extension detection for our JIT.
> > Currently, for any extension that defines instructions we use the SIGILL
> > method previously described, because there's no way to tell with just
> > a hwprobe call whether a 0 bit means extension not present or kernel
> > too old. But we can't do this for all extensions, some don't define
> > instructions.
> >
> > The end goal would be being able to detect an extension using hwprobe,
> > and if it's not detectable, notifying the user that we can't detect it and
> > they can mark it as enabled in the emulator's config file.
>
> As I pointed out on v2, I don't think this patch helps. When the kernel
> is unaware of the extension, then we still know nothing about its
> availability. This is only helpful when the kernel is aware of an
> extension, but, in those cases, the current hwprobe can be trusted, so
> we don't need this.
>
> The problem is there's no good way to detect extensions that the kernel
> is unaware of, which means the kernel needs to blindly expose what's in
> the DT/ACPI somehow.
>
> Thanks,
> drew
>
> >
> >
> >
> >  Documentation/arch/riscv/hwprobe.rst  |  5 ++++-
> >  arch/riscv/include/asm/hwprobe.h      | 29 ++++++++++++++++++++++++++-
> >  arch/riscv/include/uapi/asm/hwprobe.h |  2 ++
> >  arch/riscv/kernel/sys_hwprobe.c       |  4 ++++
> >  4 files changed, 38 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> > index 2aa9be272d5d..6d77def0a46e 100644
> > --- a/Documentation/arch/riscv/hwprobe.rst
> > +++ b/Documentation/arch/riscv/hwprobe.rst
> > @@ -360,4 +360,7 @@ The following keys are defined:
> >
> >      * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
> >          vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
> > -     Instruction Extensions Specification.
> > \ No newline at end of file
> > +     Instruction Extensions Specification.
> > +
> > +* :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL`: A bitmask containing the extensions
> > +  that can be probed using the :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0` key.
> > \ No newline at end of file
> > diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> > index 7fe0a379474a..a06eeec11e2c 100644
> > --- a/arch/riscv/include/asm/hwprobe.h
> > +++ b/arch/riscv/include/asm/hwprobe.h
> > @@ -8,7 +8,34 @@
> >
> >  #include <uapi/asm/hwprobe.h>
> >
> > -#define RISCV_HWPROBE_MAX_KEY 13
> > +#define RISCV_HWPROBE_MAX_KEY 14
> > +#define RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE      (RISCV_HWPROBE_IMA_FD | \
> > +     RISCV_HWPROBE_IMA_C | RISCV_HWPROBE_IMA_V | RISCV_HWPROBE_EXT_ZBA | \
> > +     RISCV_HWPROBE_EXT_ZBB | RISCV_HWPROBE_EXT_ZBS | RISCV_HWPROBE_EXT_ZICBOZ | \
> > +     RISCV_HWPROBE_EXT_ZBC | RISCV_HWPROBE_EXT_ZBKB | RISCV_HWPROBE_EXT_ZBKC | \
> > +     RISCV_HWPROBE_EXT_ZBKX | RISCV_HWPROBE_EXT_ZKND | RISCV_HWPROBE_EXT_ZKNE | \
> > +     RISCV_HWPROBE_EXT_ZKNH | RISCV_HWPROBE_EXT_ZKSED | \
> > +     RISCV_HWPROBE_EXT_ZKSH | RISCV_HWPROBE_EXT_ZKT | RISCV_HWPROBE_EXT_ZVBB | \
> > +     RISCV_HWPROBE_EXT_ZVBC | RISCV_HWPROBE_EXT_ZVKB | RISCV_HWPROBE_EXT_ZVKG | \
> > +     RISCV_HWPROBE_EXT_ZVKNED | RISCV_HWPROBE_EXT_ZVKNHA | \
> > +     RISCV_HWPROBE_EXT_ZVKNHB | RISCV_HWPROBE_EXT_ZVKSED | \
> > +     RISCV_HWPROBE_EXT_ZVKSH | RISCV_HWPROBE_EXT_ZVKT | \
> > +     RISCV_HWPROBE_EXT_ZFH | RISCV_HWPROBE_EXT_ZFHMIN | \
> > +     RISCV_HWPROBE_EXT_ZIHINTNTL | RISCV_HWPROBE_EXT_ZVFH | \
> > +     RISCV_HWPROBE_EXT_ZVFHMIN | RISCV_HWPROBE_EXT_ZFA | \
> > +     RISCV_HWPROBE_EXT_ZTSO | RISCV_HWPROBE_EXT_ZACAS | \
> > +     RISCV_HWPROBE_EXT_ZICOND | RISCV_HWPROBE_EXT_ZIHINTPAUSE | \
> > +     RISCV_HWPROBE_EXT_ZVE32X | RISCV_HWPROBE_EXT_ZVE32F | \
> > +     RISCV_HWPROBE_EXT_ZVE64X | RISCV_HWPROBE_EXT_ZVE64F | \
> > +     RISCV_HWPROBE_EXT_ZVE64D | RISCV_HWPROBE_EXT_ZIMOP | \
> > +     RISCV_HWPROBE_EXT_ZCA | RISCV_HWPROBE_EXT_ZCB | RISCV_HWPROBE_EXT_ZCD | \
> > +     RISCV_HWPROBE_EXT_ZCF | RISCV_HWPROBE_EXT_ZCMOP | \
> > +     RISCV_HWPROBE_EXT_ZAWRS | RISCV_HWPROBE_EXT_SUPM | \
> > +     RISCV_HWPROBE_EXT_ZICNTR | RISCV_HWPROBE_EXT_ZIHPM | \
> > +     RISCV_HWPROBE_EXT_ZFBFMIN | RISCV_HWPROBE_EXT_ZVFBFMIN | \
> > +     RISCV_HWPROBE_EXT_ZVFBFWMA | RISCV_HWPROBE_EXT_ZICBOM | \
> > +     RISCV_HWPROBE_EXT_ZAAMO | RISCV_HWPROBE_EXT_ZALRSC | \
> > +     RISCV_HWPROBE_EXT_ZABHA)
> >
> >  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
> >  {
> > diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> > index aaf6ad970499..a3b92df4dc05 100644
> > --- a/arch/riscv/include/uapi/asm/hwprobe.h
> > +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> > @@ -82,6 +82,7 @@ struct riscv_hwprobe {
> >  #define              RISCV_HWPROBE_EXT_ZAAMO         (1ULL << 56)
> >  #define              RISCV_HWPROBE_EXT_ZALRSC        (1ULL << 57)
> >  #define              RISCV_HWPROBE_EXT_ZABHA         (1ULL << 58)
> > +/* Change RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE when adding items. */
> >  #define RISCV_HWPROBE_KEY_CPUPERF_0  5
> >  #define              RISCV_HWPROBE_MISALIGNED_UNKNOWN        (0 << 0)
> >  #define              RISCV_HWPROBE_MISALIGNED_EMULATED       (1 << 0)
> > @@ -106,6 +107,7 @@ struct riscv_hwprobe {
> >  #define RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 11
> >  #define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE  12
> >  #define RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0        13
> > +#define RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL 14
> >  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
> >
> >  /* Flags */
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
