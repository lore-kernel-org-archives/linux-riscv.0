Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD60EC433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Dec 2021 18:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yW7HbDEu/X2DAIMbwJvmZwyLrO2ineIYbJ7qDAbsUpk=; b=3iz2zg7AOZGHQg
	irnY/yMOCP9VQ7SPzb6uaV8oWnFVFvJ7CcCYfDnirx73ToACTr+OPlDmp4h5aj1uhEjwuIWfO+wtv
	bQpkfr+RyX/uLyF8C3D/cZf23tVgp4D6P5anaJHQbHI58sgcSblwMWb6gSvOK61xXo8SPzyF7Wbm2
	SY1nj0DkJld/o92ieSjhjPaCS83RaTDbBzm623cgv50BE8aXLF/8PAJ1Xh6G+3ICHiO1zk0W3AFtb
	0kPo+zw2pAKX6WUwNwAbja54ccyvX6nDLgMyF8Ufgu6L+pwmVV2Tpln5kMr9n58msq361NvFLUpXT
	nzePSIKOL1Dwk7OUoPXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtZs0-000fJu-Da; Sat, 04 Dec 2021 18:34:48 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtZrw-000fJA-AG
 for linux-riscv@lists.infradead.org; Sat, 04 Dec 2021 18:34:46 +0000
Received: by mail-yb1-xb31.google.com with SMTP id x32so19162163ybi.12
 for <linux-riscv@lists.infradead.org>; Sat, 04 Dec 2021 10:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1GJfvmKyxGHNWNLNomXU/wK6PIE15JOvGBrgSFi1J6g=;
 b=A/GHP78DjjthxfRVVZwVJH88+AF4JV+MSe904HQBLpnpQSRiMFl2qLFfdmkIy1JpAu
 KZxp/iFWD5Qp8BAoAeirAHssw/oEwkrF2VMDjwUcDs7iCFDmJ9Upju/cXzXnUOF8I5xu
 RcVyz1cxOVMsh0p3SBNyO+r7tZOqj+0r+y21M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1GJfvmKyxGHNWNLNomXU/wK6PIE15JOvGBrgSFi1J6g=;
 b=FMkJErlTfn5/SRLVMTMkfxYS1pXs2BqsMYUN51HV1ra7uoL1RbNddetrhMbJOoR5fq
 aauKCM2vn3iWd03MCQv0QAZtduUL5BvvTeqa99QbBgl5wKo+l9uQd2wwQsoE9KhG5Dpf
 4H4V1SiVWaPoept1sjp+yu7ulO0p09VmpQDoY4ptDHIcdneyhUQ+2TCHyLk/1xgi/G3z
 CbzvmrUpIu3/m6tcJrlYNu3rBtI/i/gEPpzac6AwEVNZfzkGrSpzKdk4+sJZIbaMrfMB
 Urc7G2znnyBESIv/Ahu14YaKb6A70eCP19q2UrTFDPe9WUFB8H0eFCuANND1Qfpalo1q
 FXKg==
X-Gm-Message-State: AOAM530ZM3cEiOx+z3CZn0ID0lRImes0p+mDRN3eyYcDmdJCo4reRvlh
 hsfv0OnJFWUjQv2WvUW/OaKCoNR7QRTiJI62v29q
X-Google-Smtp-Source: ABdhPJyY8DvXWdPs23oIi8EVfiaPfZDmLiFo0Y4Y8Se6D7jOAXhoXbQbxfgfryyon23MnF95pPwVmicCGaRMFtWp7Xs=
X-Received: by 2002:a25:69cc:: with SMTP id
 e195mr32854610ybc.456.1638642878815; 
 Sat, 04 Dec 2021 10:34:38 -0800 (PST)
MIME-Version: 1.0
References: <20211202150515.GA97518@sunil-ThinkPad-T490>
 <CAMj1kXGJtMmcXLjHEG8xX0sSFNfdjj4A2_4DPcviEJ3=MARh+w@mail.gmail.com>
 <89d42547-ec36-5f84-88d1-fd65d891488c@canonical.com>
 <CAMj1kXG-VnhkECGewZPkUZLC2rb1bSDGdSpby9R=W_1d3FAsdg@mail.gmail.com>
 <6d9f131d-b3e8-18df-a9b6-6aaac881eb65@canonical.com>
 <CAOnJCUJfEpW6TtBPFGZ9TfNJeb9r+-L_8BddsxxejAd9Fe8VHw@mail.gmail.com>
 <CAMj1kXHGPZBfaiMCPYt7tYe+5wt_jn78Qdih9U-XLDba5sfqtQ@mail.gmail.com>
 <6fccad4e-b579-25ed-6bf3-2fb2a968b243@canonical.com>
 <c758bae4-3578-f062-edfd-f5835ae525fe@gmx.de>
 <CAOnJCUJ6Aoh7881HOSifQTc61+vCTVjxnYORfWM_WGLJQCugRg@mail.gmail.com>
 <7416157e-50d1-3664-7df0-2a45e29cd8c1@canonical.com>
 <CAAhSdy1DOnEGpxPQF7juUSyBTyx9W8KsH8exTpOmTLOnNCMJqg@mail.gmail.com>
In-Reply-To: <CAAhSdy1DOnEGpxPQF7juUSyBTyx9W8KsH8exTpOmTLOnNCMJqg@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Sat, 4 Dec 2021 10:34:28 -0800
Message-ID: <CAOnJCU+taK16cnfnQtk3QM3s-f4RCUTWENAPe8Nhs-8L29vKew@mail.gmail.com>
Subject: Re: Question regarding "boot-hartid" DT node
To: Anup Patel <anup@brainfault.org>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Abner Chang <abner.chang@hpe.com>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>, sunil.vl@gmail.com, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Sunil V L <sunilvl@ventanamicro.com>, Ard Biesheuvel <ardb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211204_103444_454010_BFB2B93E 
X-CRM114-Status: GOOD (  74.11  )
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

On Fri, Dec 3, 2021 at 8:24 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Sat, Dec 4, 2021 at 7:17 AM Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
> >
> >
> >
> > On 12/4/21 01:44, Atish Patra wrote:
> > > On Fri, Dec 3, 2021 at 10:45 AM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> > >>
> > >> On 12/3/21 11:53 AM, Heinrich Schuchardt wrote:
> > >>> On 12/3/21 11:13, Ard Biesheuvel wrote:
> > >>>> On Thu, 2 Dec 2021 at 20:29, Atish Patra <atishp@atishpatra.org> wrote:
> > >>>>>
> > >>>>> On Thu, Dec 2, 2021 at 9:05 AM Heinrich Schuchardt
> > >>>>> <heinrich.schuchardt@canonical.com> wrote:
> > >>>>>>
> > >>>>>> On 12/2/21 17:58, Ard Biesheuvel wrote:
> > >>>>>>> On Thu, 2 Dec 2021 at 17:53, Heinrich Schuchardt
> > >>>>>>> <heinrich.schuchardt@canonical.com> wrote:
> > >>>>>>>>
> > >>>>>>>> On 12/2/21 17:20, Ard Biesheuvel wrote:
> > >>>>>>>>> On Thu, 2 Dec 2021 at 16:05, Sunil V L <sunilvl@ventanamicro.com>
> > >>>>>>>>> wrote:
> > >>>>>>>>>>
> > >>>>>>>>>> Hi All,
> > >>>>>>>>>>        I am starting this thread to discuss about the
> > >>>>>>>>>> "boot-hartid" DT node
> > >>>>>>>>>>        that is being used in RISC-V Linux EFI stub.
> > >>>>>>>>>>
> > >>>>>>>>>>        As you know, the boot Hart ID is passed in a0 register to
> > >>>>>>>>>> the kernel
> > >>>>>>>>>>        and hence there is actually no need to pass it via DT.
> > >>>>>>>>>> However, since
> > >>>>>>>>>>        EFI stub follows EFI application calling conventions, it
> > >>>>>>>>>> needs to
> > >>>>>>>>>>        know the boot Hart ID so that it can pass it to the proper
> > >>>>>>>>>> kernel via
> > >>>>>>>>>>        a0. For this issue, the solution was to add
> > >>>>>>>>>> "/chosen/boot-hartid" in
> > >>>>>>>>>>        DT. Both EDK2 and u-boot append this node in DT.
> > >>>>>>>>>>
> > >>>>>>>>>
> > >>>>>>>>> I think this was a mistake tbh
> > >>>>>>>>>
> > >>>>>>>>>>        But above approach causes issue for ACPI since ACPI
> > >>>>>>>>>> initialization
> > >>>>>>>>>>        happens late in the proper kernel. Same is true even if we
> > >>>>>>>>>> pass this
> > >>>>>>>>>>        information via SMBIOS.
> > >>>>>>>>>>
> > >>>>>>>>>
> > >>>>>>>>> It would be better to define a RISCV specific EFI protocol that the
> > >>>>>>>>> stub can call to discover the boot-hartid value. That wat, it can
> > >>>>>>>>> pass
> > >>>>>>>>> it directly, without having to rely on firmware tables.
> > >>>>>>>>
> > >>>>>>>> As discovering the current process' hartid is not a UEFI specific
> > >>>>>>>> task
> > >>>>>>>> SBI would be a better fit.
> > >>>>>>>>
> > >>>>>>>
> > >>>>>>> I disagree. The OS<->loader firmware interface is UEFI not SBI. So if
> > >>>>>>> the EFI stub needs to ask the firmware which boot-hartid it should
> > >>>>>>> pass in A0, it should use a EFI protocol and nothing else.
> > >>>>>>>
> > >>>>>>> Whether or not the loader/firmware *implements* this EFI protocol by
> > >>>>>>> calling into SBI is a different matter (and likely the best choice).
> > >>>>>>> But that does not mean the EFI stub should make SBI calls directly.
> > >>>>>>>
> > >>>>>>
> > >>>>>> The EFI stub does not need the boot-hartid. It is the main Linux kernel
> > >>>>>> that does. And that kernel already implements SBI calls.
> > >>>>>>
> > >>>>>> The main kernel could just try to read CSR mhartid which fails in
> > >>>>>> S-mode
> > >>>>>> and the SBI could emulate it.
> > >>>>>
> > >>>>> New SBI extension should be added only if there is no other way to
> > >>>>> solve a generic
> > >>>
> > >>> I am not sure this feature would be implemented as SBI extension or as a
> > >>> CSR emulation. Cf. sbi_emulate_csr_read(). But anyway it would require
> > >>> an update of the SBI specification.
> > >>>
> > >>>>> problem. The boot hartid issue is very specific to efi booting only.
> > >>>>> Any system that doesn't require
> > >>>
> > >>> The boot hartid is not EFI related at all. A firmware running single
> > >>> threaded does not need this information.
> > >>>
> > >>> Information about the boot hartid is a general OS need.
> > >>>
> > >>> I am wondering why S-mode software should not have a generic means to
> > >>> find out on which hart it is currently running.
> > >>>
> > >>>>> EFI booting won't need it. Even for EFI booting, we have other
> > >>>>> approaches already proposed
> > >>>>> to solve it. That's why, SBI extension should be the last resort
> > >>>>> rather than first.
> > >>>>>
> > >>>>> I think an RISC-V specific EFI protocol as suggested by Ard should
> > >>>>> work for all the cases.
> > >>>>> Is there a case where you think it may not work ? U-Boot & EDK2
> > >>>>> already stores the boot hartid.
> > >>>>> They just implement that protocol and pass the hartid to the caller.
> > >>>>> We do need to support it in the grub though.
> > >>>>>
> > >>>>
> > >>>> Why would GRUB care about this? The EFI stub will call into the
> > >>>> underlying firmware to invoke the protocol, GRUB is just a loader with
> > >>>> a fancy menu that allows you to select which image to load, no?
> > >>>
> > >>> This is a related discussion:
> > >>>
> > >>> https://github.com/tekkamanninja/grub/commit/be9d4f1863a1fcb1cbbd2f867309457fade8be73#commitcomment-60851029
> > >>>
> > >
> > > Yes!! Thanks for refreshing the memory. It seems after 2 years, we are
> > > still debating the same topic :).
> > > Let me summarize the thread. There are multiple ways for EFI stub code
> > > to retrieve the boot hartid.
> > >
> > > 1. EFI variables - This is what Henerich proposed last time. Ard
> > > suggested that EFI configuration tables are better candidates than EFI
> > > variables.
> > > 2. DT modification - This was preferred over the configuration table
> > > at that time given because RISC-V was DT only at that time.
> > >                                   We already had all the infrastructure
> > > around DT. Thus, DT seemed to be a natural choice then.
> > >                                   It works now for existing setup
> > > however, the DT approach will not work for systems with ACPI support.
> > >                                   Adding a similar entry in ACPI tables
> > > is possible but adding ACPI support in EFI stub is not trivial.
> > > 3. SMBIOS - Only for platforms with SMBIOS support. SMBIOS is not
> > > mandatory and adding SMBIOS support in EFI stub is not trivial.
> > > 4. SBI         -  As I mentioned before, this is an EFI specific
> > > problem because EFI stub doesn't know what the boot hartid is. Thus,
> > > it should be solved
> > >                        in an EFI specific way. An SBI extension for
> > > such features may not be acceptable as the non-EFI booting method
> > > works fine without the SBI extension.
> > > 5. RISC-V specific EFI configuration table or protocol: Ard suggested
> > > EFI configuration table last time. Earlier in this thread, EFI
> > > protocol was suggested.
> > >                        My personal preference has always been one of
> > > these as it solves the problem for all EFI booting methods
> > >                        for platforms-os
> > > combination(DT/ACPI-Linux/FreeBSD) in an EFI specific way.
> > >
> > > @Heinrich: Do you see any issue with the EFI configuration table or
> > > protocol to retrieve the boot hartid?
> >
> > There is nothing technical stopping us from implementing either option.
> >
> > We could simply reuse the EFI Device Tree Fixup Protocol
> > (https://github.com/U-Boot-EFI/EFI_DT_FIXUP_PROTOCOL) implemented in
> > U-Boot and already used by systemd-boot. Pass a devicetree (which may be
> > empty) to the Fixup() method and it will add the /chosen node with the
> > boot-hartid parameter.
> >
> > The EFI stub anyway creates a new device-tree to pass the memory map to
> > the kernel in the ACPI case (function update_fdt()). Calling the EFI
> > Device Tree Fixup Protocol could be easily added.

Thanks. Yes. We can solve the current problem for EFI stub in Linux.

>
> Are you suggesting that DTB (skeletal or full-blown) will always be there when
> booting the kernel as an EFI application ? If yes then we are
> indirectly mandating
> skeletal DTB for UEFI+ACPI system.

Yes. EFI Stub tries to find a fdt from the command line (not a
preferred method) or EFI configuration table[1]
(currently used for RISC-V systems). If it can't find a device tree,
it generates one [2]

[1] https://elixir.bootlin.com/linux/v5.16-rc3/source/drivers/firmware/efi/libstub/efi-stub.c#L231
[2] https://elixir.bootlin.com/linux/v5.16-rc3/source/drivers/firmware/efi/libstub/fdt.c#L58

However, we may still need to define the RISC-V EFI protocol to
support ACPI for other OS (FreeBSD) which doesn't have
a stub like loader that uses DT.

In that case, where should we document it ? UEFI spec or RISC-V platform spec ?

>
> Regards,
> Anup
>
> >
> > Best regards
> >
> > Heinrich
> >
> > >
> > > My only concern with the RISC-V EFI protocol is that Ard suggested it
> > > doesn't need a modification in UEFI spec.
> > > Where should we document it in this case ? We can't document it in
> > > Linux or EBBR.
> > > Because, this is a protocol that server systems and other non-Linux OS
> > > will also use.
> > > We can define it in the RISC-V platform spec. But that's not the usual
> > > place where somebody will look for the definition of such protocol.
> > >
> > > Wouldn't it be better to standardize it in UEFI spec ? The UEFI spec
> > > already has ARCH specific protocols/config tables.
> > >
> > >>>
> > >>> If GRUB loads a devicetree it will anyway have to call into the firmware
> > >>> for fixups. These will include adding the boot-hartid.
> > >>>
> > >>>>
> > >>>>> @Heinrich Schuchardt
> > >>>>> I vaguely remember you proposed something similar when we discussed
> > >>>>> this first during FOSDEM.
> > >>>>> I can't recall why it was abandoned in favor of the DT approach which
> > >>>>> works. But,
> > >>>>> it is not an ideal solution considering RISC-V ACPI support is already
> > >>>>> on the way.
> > >>>>>
> > >>>>> Do you have a link to the older thread where this thing was discussed ?
> > >>>
> > >>> Unfortunately I cannot find anything.
> > >>
> > >> I assume Atish referred to this thread:
> > >>
> > >> https://patchwork.ozlabs.org/project/uboot/patch/20200205055334.4072-1-xypron.glpk@gmx.de/
> > >>
> > >> Best regards
> > >>
> > >> Heinrich
> > >>
> > >> _______________________________________________
> > >> linux-riscv mailing list
> > >> linux-riscv@lists.infradead.org
> > >> http://lists.infradead.org/mailman/listinfo/linux-riscv
> > >
> > >
> > >



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
