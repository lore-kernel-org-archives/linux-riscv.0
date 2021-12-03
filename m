Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71457C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 10:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vw5LdWVCo0f9F8ZHEpQDMs/y+fXbbqdLv8afKiFFvAs=; b=3wPTemoL6pJjCd
	C1T4o929s4AHhIGlfCD5ni7FFmy1Yriw0hg2RK8mcLxIuWLXX/tmqcRsExx2mpxJFLB7voNOH9lEM
	dwHJNUFHoVBwHoFAekW7vpH2wE63PHiMExNaarNLjpDTvZ+nvkQjZ/6EKnAISNo+H8CfoY+/ornI3
	mJFPJoWrBuEee/lNmM545xJO4ZSoxdxZ+J8DX4OUEJKOd4OMaeOQUwntJFN1h8npYYVyQ/lmuuqed
	ZUxic+HHaeLWBM1jL0TWTfnB/Ir4p3SAhxR1vksIay8C1etVzjNzdjMGNaNFhjYC/+9Ruf0DCKwnr
	v/nNpOa/n1vG/+6MzkBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt5bo-00F7j9-TR; Fri, 03 Dec 2021 10:16:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt5Z9-00F6Vi-0O
 for linux-riscv@lists.infradead.org; Fri, 03 Dec 2021 10:13:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8C49A62997
 for <linux-riscv@lists.infradead.org>; Fri,  3 Dec 2021 10:13:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFAC9C53FD1
 for <linux-riscv@lists.infradead.org>; Fri,  3 Dec 2021 10:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638526398;
 bh=Pc0nJRgI6si+hZjh0fGbYeE5GluclV2g3VKapqsvWS8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UllaFlaxic/AiFD09lz+4JelcAZ3eKiKjTeoaGQOS+Zj+tAOkQK4xmU7Nw+aNga2+
 9nzz4s7bSmJyKvqRNcKUzeLj+FqScN7w6WblxkcZp7KUjS3mq2tDWPOryGOzqQBpIu
 sl5GIt3Zm9OxVXB9x7g+N5u/mIyVn/baqKfDpwLzbP495PeeRKn1zHckLgK5P3UP/q
 7XGVF4OS7xrro1vWlwu/++EQ2OSa7QXIX6tMkJ9Ewufibsec7VDAcJICRef/xctnRE
 j6vWr9Ic0vQXESPfLzY9us5K7Ped+yzuhWD4wZq29MxSH/5GeeS+nh7W9fjjWU8gS0
 D2yhHyTOv7xdA==
Received: by mail-ot1-f54.google.com with SMTP id
 r10-20020a056830080a00b0055c8fd2cebdso2520601ots.6
 for <linux-riscv@lists.infradead.org>; Fri, 03 Dec 2021 02:13:17 -0800 (PST)
X-Gm-Message-State: AOAM533JsqE7DrDjSLdf4dtQoFxSKrNb0YmPmw5EFuZ7iDa9mObbolLA
 GrLhHCXjUjJ17+CdSFopjfWBa/UhXg94EgfOTfo=
X-Google-Smtp-Source: ABdhPJxlWYqF04MNHKY5R/3NMR0PL4F/gwjBtfyYKZsIed2ysea+Hy76lQMgQgqLA/Qrbg0or4iibFJUKfts9wRaukw=
X-Received: by 2002:a05:6830:1445:: with SMTP id
 w5mr15904858otp.112.1638526397177; 
 Fri, 03 Dec 2021 02:13:17 -0800 (PST)
MIME-Version: 1.0
References: <20211202150515.GA97518@sunil-ThinkPad-T490>
 <CAMj1kXGJtMmcXLjHEG8xX0sSFNfdjj4A2_4DPcviEJ3=MARh+w@mail.gmail.com>
 <89d42547-ec36-5f84-88d1-fd65d891488c@canonical.com>
 <CAMj1kXG-VnhkECGewZPkUZLC2rb1bSDGdSpby9R=W_1d3FAsdg@mail.gmail.com>
 <6d9f131d-b3e8-18df-a9b6-6aaac881eb65@canonical.com>
 <CAOnJCUJfEpW6TtBPFGZ9TfNJeb9r+-L_8BddsxxejAd9Fe8VHw@mail.gmail.com>
In-Reply-To: <CAOnJCUJfEpW6TtBPFGZ9TfNJeb9r+-L_8BddsxxejAd9Fe8VHw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 3 Dec 2021 11:13:06 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHGPZBfaiMCPYt7tYe+5wt_jn78Qdih9U-XLDba5sfqtQ@mail.gmail.com>
Message-ID: <CAMj1kXHGPZBfaiMCPYt7tYe+5wt_jn78Qdih9U-XLDba5sfqtQ@mail.gmail.com>
Subject: Re: Question regarding "boot-hartid" DT node
To: Atish Patra <atishp@atishpatra.org>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Abner Chang <abner.chang@hpe.com>, 
 Jessica Clarke <jrtc27@jrtc27.com>, Anup Patel <anup@brainfault.org>, 
 Palmer Dabbelt <palmer@rivosinc.com>, sunil.vl@gmail.com, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Sunil V L <sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_021319_171798_71498141 
X-CRM114-Status: GOOD (  43.70  )
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

On Thu, 2 Dec 2021 at 20:29, Atish Patra <atishp@atishpatra.org> wrote:
>
> On Thu, Dec 2, 2021 at 9:05 AM Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
> >
> > On 12/2/21 17:58, Ard Biesheuvel wrote:
> > > On Thu, 2 Dec 2021 at 17:53, Heinrich Schuchardt
> > > <heinrich.schuchardt@canonical.com> wrote:
> > >>
> > >> On 12/2/21 17:20, Ard Biesheuvel wrote:
> > >>> On Thu, 2 Dec 2021 at 16:05, Sunil V L <sunilvl@ventanamicro.com> wrote:
> > >>>>
> > >>>> Hi All,
> > >>>>      I am starting this thread to discuss about the "boot-hartid" DT node
> > >>>>      that is being used in RISC-V Linux EFI stub.
> > >>>>
> > >>>>      As you know, the boot Hart ID is passed in a0 register to the kernel
> > >>>>      and hence there is actually no need to pass it via DT. However, since
> > >>>>      EFI stub follows EFI application calling conventions, it needs to
> > >>>>      know the boot Hart ID so that it can pass it to the proper kernel via
> > >>>>      a0. For this issue, the solution was to add "/chosen/boot-hartid" in
> > >>>>      DT. Both EDK2 and u-boot append this node in DT.
> > >>>>
> > >>>
> > >>> I think this was a mistake tbh
> > >>>
> > >>>>      But above approach causes issue for ACPI since ACPI initialization
> > >>>>      happens late in the proper kernel. Same is true even if we pass this
> > >>>>      information via SMBIOS.
> > >>>>
> > >>>
> > >>> It would be better to define a RISCV specific EFI protocol that the
> > >>> stub can call to discover the boot-hartid value. That wat, it can pass
> > >>> it directly, without having to rely on firmware tables.
> > >>
> > >> As discovering the current process' hartid is not a UEFI specific task
> > >> SBI would be a better fit.
> > >>
> > >
> > > I disagree. The OS<->loader firmware interface is UEFI not SBI. So if
> > > the EFI stub needs to ask the firmware which boot-hartid it should
> > > pass in A0, it should use a EFI protocol and nothing else.
> > >
> > > Whether or not the loader/firmware *implements* this EFI protocol by
> > > calling into SBI is a different matter (and likely the best choice).
> > > But that does not mean the EFI stub should make SBI calls directly.
> > >
> >
> > The EFI stub does not need the boot-hartid. It is the main Linux kernel
> > that does. And that kernel already implements SBI calls.
> >
> > The main kernel could just try to read CSR mhartid which fails in S-mode
> > and the SBI could emulate it.
>
> New SBI extension should be added only if there is no other way to
> solve a generic
> problem. The boot hartid issue is very specific to efi booting only.
> Any system that doesn't require
> EFI booting won't need it. Even for EFI booting, we have other
> approaches already proposed
> to solve it. That's why, SBI extension should be the last resort
> rather than first.
>
> I think an RISC-V specific EFI protocol as suggested by Ard should
> work for all the cases.
> Is there a case where you think it may not work ? U-Boot & EDK2
> already stores the boot hartid.
> They just implement that protocol and pass the hartid to the caller.
> We do need to support it in the grub though.
>

Why would GRUB care about this? The EFI stub will call into the
underlying firmware to invoke the protocol, GRUB is just a loader with
a fancy menu that allows you to select which image to load, no?

> @Heinrich Schuchardt
> I vaguely remember you proposed something similar when we discussed
> this first during FOSDEM.
> I can't recall why it was abandoned in favor of the DT approach which
> works. But,
> it is not an ideal solution considering RISC-V ACPI support is already
> on the way.
>
> Do you have a link to the older thread where this thing was discussed ?
>
>
> >
> > Best regards
> >
> > Heinrich
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>
>
>
> --
> Regards,
> Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
