Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB560C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Dec 2021 14:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2m9F2lDLAJOh9AbDZf/eVXEXyJrmR1mxofrZYkbZnE0=; b=YlhxIlD/vYM+gp
	3BUYypaU0rJpARjHZJeK+ePH0osStJjzga46wUCZ1G+SORQyTJu3clhzBNacFLPd8CTKsWH2n6AGp
	RrhXp789d1hqZeZqg9qBWxhaVRUIliYnpbORIDIzyY7CEoxb7OYV8RxTqPV3+pZ4u+sf7CTWc7xDO
	hE8oi6FxxkDMTgWN+dfxYfokkIp5VlNgC2YU12zK0E3u4YmoB6mONKiiN5yw/1/0T96MlpkMcv0eK
	0UKAEaCIu1jzIo+rDxwAl8TdTMY3yeRAiQiAwLb7BWu/wC1wzDrRVpsV+EZKB9oFKzWSLRLflFmdj
	ukE5UAVnTgvx+njrgW3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtVau-000NuJ-FI; Sat, 04 Dec 2021 14:00:52 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtVaj-000NtA-Er
 for linux-riscv@lists.infradead.org; Sat, 04 Dec 2021 14:00:44 +0000
Received: by mail-wr1-x42b.google.com with SMTP id u17so4706880wrt.3
 for <linux-riscv@lists.infradead.org>; Sat, 04 Dec 2021 06:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O1OFzBZI8MpOhCar2O1+tPHgSq1fmxeMJV1C8q7eUiA=;
 b=7WAJKP6Ibui0yUHQ75fgSKc7qge3YsTRsPO45V2edccECitYJIOcLpO9ZVl6P73AjD
 N8GjzUkSWWPPptLtKpTU2AIbAiZHqsRY4Y/VwV5hh3XstdNMYoYYvcimrn29+hrJdnNr
 P0dRwOtIF5tfsgid38R8PuMmr0JBuu6o8p0Dv3X1KrhE09hArkoHiKvGKF4l0w8LIaYQ
 ISLbuiuOBM1SmGFNOJ18W0Y60WjTOvOPEumljvcRzDlvYZegU3gr5eN3wQlxIfUIEWCb
 XV2izlUhEjLZ3ZQ1qJgoSN/9DtrWD4iPTYp7vJXgNHcWPAT10D/SEKfrPRn8GX2yeujH
 TMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O1OFzBZI8MpOhCar2O1+tPHgSq1fmxeMJV1C8q7eUiA=;
 b=EldcgRizhK6rBdHUHGablBjxolZw6kookCl8UWOTfHL9mdpJCsY6KgN+fyRy00k3qi
 Ih8dRc9XHsmG6evFOY3cxnY5mV0E4fPO68Whm9rQazYFZnWbsLqFm1IPdB+q3r2a2DzN
 qmCJ2AUJLO357voY/M2+qmszGW5sr1qDrS2xCv+OYy6jPZ6K6khJXBswmCIYi1oPRoy7
 K1C3nMdxVrqM3j76viv3z5HH7rpW1JivnBMks6T7+YqWqO+XzO1dWiqICeAJanwu+o7H
 Im7Q4ocWEsUKqWNsZB48yyJK09qd2zJU6OOiRDH8U1q0oW23wfsODAavexiLu04MSWrK
 09BQ==
X-Gm-Message-State: AOAM532lX3VQvF5+yARvlljZIG0forhqlH95vSHbQSfOtHZLuAgNDpa+
 wEWS16AagPpxSKqdZNnRFUmx0TApJH7MeOL+7v5fZg==
X-Google-Smtp-Source: ABdhPJyZzWJj2O437VcIaxnK2bOkV41PhrhYPiVIITux1QLjS8TW5jdD1NPbH8PBYM1a7WrCr3poeMc1mkxhDXsCfKs=
X-Received: by 2002:a5d:4523:: with SMTP id j3mr29190893wra.185.1638626438849; 
 Sat, 04 Dec 2021 06:00:38 -0800 (PST)
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
 <c7ae9067-977a-225f-bd97-28ab361a2117@canonical.com>
In-Reply-To: <c7ae9067-977a-225f-bd97-28ab361a2117@canonical.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 4 Dec 2021 19:30:27 +0530
Message-ID: <CAAhSdy0zZZypu15BDD38t5ParE9QsPg52OqwViBxre0oOi3RZg@mail.gmail.com>
Subject: Re: Question regarding "boot-hartid" DT node
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Atish Patra <atishp@atishpatra.org>, Abner Chang <abner.chang@hpe.com>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>, sunil.vl@gmail.com, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Sunil V L <sunilvl@ventanamicro.com>, Ard Biesheuvel <ardb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211204_060041_585452_12427BE3 
X-CRM114-Status: GOOD (  70.98  )
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

On Sat, Dec 4, 2021 at 2:08 PM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
>
>
> On 12/4/21 05:24, Anup Patel wrote:
> > On Sat, Dec 4, 2021 at 7:17 AM Heinrich Schuchardt
> > <heinrich.schuchardt@canonical.com> wrote:
> >>
> >>
> >>
> >> On 12/4/21 01:44, Atish Patra wrote:
> >>> On Fri, Dec 3, 2021 at 10:45 AM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> >>>>
> >>>> On 12/3/21 11:53 AM, Heinrich Schuchardt wrote:
> >>>>> On 12/3/21 11:13, Ard Biesheuvel wrote:
> >>>>>> On Thu, 2 Dec 2021 at 20:29, Atish Patra <atishp@atishpatra.org> wrote:
> >>>>>>>
> >>>>>>> On Thu, Dec 2, 2021 at 9:05 AM Heinrich Schuchardt
> >>>>>>> <heinrich.schuchardt@canonical.com> wrote:
> >>>>>>>>
> >>>>>>>> On 12/2/21 17:58, Ard Biesheuvel wrote:
> >>>>>>>>> On Thu, 2 Dec 2021 at 17:53, Heinrich Schuchardt
> >>>>>>>>> <heinrich.schuchardt@canonical.com> wrote:
> >>>>>>>>>>
> >>>>>>>>>> On 12/2/21 17:20, Ard Biesheuvel wrote:
> >>>>>>>>>>> On Thu, 2 Dec 2021 at 16:05, Sunil V L <sunilvl@ventanamicro.com>
> >>>>>>>>>>> wrote:
> >>>>>>>>>>>>
> >>>>>>>>>>>> Hi All,
> >>>>>>>>>>>>         I am starting this thread to discuss about the
> >>>>>>>>>>>> "boot-hartid" DT node
> >>>>>>>>>>>>         that is being used in RISC-V Linux EFI stub.
> >>>>>>>>>>>>
> >>>>>>>>>>>>         As you know, the boot Hart ID is passed in a0 register to
> >>>>>>>>>>>> the kernel
> >>>>>>>>>>>>         and hence there is actually no need to pass it via DT.
> >>>>>>>>>>>> However, since
> >>>>>>>>>>>>         EFI stub follows EFI application calling conventions, it
> >>>>>>>>>>>> needs to
> >>>>>>>>>>>>         know the boot Hart ID so that it can pass it to the proper
> >>>>>>>>>>>> kernel via
> >>>>>>>>>>>>         a0. For this issue, the solution was to add
> >>>>>>>>>>>> "/chosen/boot-hartid" in
> >>>>>>>>>>>>         DT. Both EDK2 and u-boot append this node in DT.
> >>>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> I think this was a mistake tbh
> >>>>>>>>>>>
> >>>>>>>>>>>>         But above approach causes issue for ACPI since ACPI
> >>>>>>>>>>>> initialization
> >>>>>>>>>>>>         happens late in the proper kernel. Same is true even if we
> >>>>>>>>>>>> pass this
> >>>>>>>>>>>>         information via SMBIOS.
> >>>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> It would be better to define a RISCV specific EFI protocol that the
> >>>>>>>>>>> stub can call to discover the boot-hartid value. That wat, it can
> >>>>>>>>>>> pass
> >>>>>>>>>>> it directly, without having to rely on firmware tables.
> >>>>>>>>>>
> >>>>>>>>>> As discovering the current process' hartid is not a UEFI specific
> >>>>>>>>>> task
> >>>>>>>>>> SBI would be a better fit.
> >>>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> I disagree. The OS<->loader firmware interface is UEFI not SBI. So if
> >>>>>>>>> the EFI stub needs to ask the firmware which boot-hartid it should
> >>>>>>>>> pass in A0, it should use a EFI protocol and nothing else.
> >>>>>>>>>
> >>>>>>>>> Whether or not the loader/firmware *implements* this EFI protocol by
> >>>>>>>>> calling into SBI is a different matter (and likely the best choice).
> >>>>>>>>> But that does not mean the EFI stub should make SBI calls directly.
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> The EFI stub does not need the boot-hartid. It is the main Linux kernel
> >>>>>>>> that does. And that kernel already implements SBI calls.
> >>>>>>>>
> >>>>>>>> The main kernel could just try to read CSR mhartid which fails in
> >>>>>>>> S-mode
> >>>>>>>> and the SBI could emulate it.
> >>>>>>>
> >>>>>>> New SBI extension should be added only if there is no other way to
> >>>>>>> solve a generic
> >>>>>
> >>>>> I am not sure this feature would be implemented as SBI extension or as a
> >>>>> CSR emulation. Cf. sbi_emulate_csr_read(). But anyway it would require
> >>>>> an update of the SBI specification.
> >>>>>
> >>>>>>> problem. The boot hartid issue is very specific to efi booting only.
> >>>>>>> Any system that doesn't require
> >>>>>
> >>>>> The boot hartid is not EFI related at all. A firmware running single
> >>>>> threaded does not need this information.
> >>>>>
> >>>>> Information about the boot hartid is a general OS need.
> >>>>>
> >>>>> I am wondering why S-mode software should not have a generic means to
> >>>>> find out on which hart it is currently running.
> >>>>>
> >>>>>>> EFI booting won't need it. Even for EFI booting, we have other
> >>>>>>> approaches already proposed
> >>>>>>> to solve it. That's why, SBI extension should be the last resort
> >>>>>>> rather than first.
> >>>>>>>
> >>>>>>> I think an RISC-V specific EFI protocol as suggested by Ard should
> >>>>>>> work for all the cases.
> >>>>>>> Is there a case where you think it may not work ? U-Boot & EDK2
> >>>>>>> already stores the boot hartid.
> >>>>>>> They just implement that protocol and pass the hartid to the caller.
> >>>>>>> We do need to support it in the grub though.
> >>>>>>>
> >>>>>>
> >>>>>> Why would GRUB care about this? The EFI stub will call into the
> >>>>>> underlying firmware to invoke the protocol, GRUB is just a loader with
> >>>>>> a fancy menu that allows you to select which image to load, no?
> >>>>>
> >>>>> This is a related discussion:
> >>>>>
> >>>>> https://github.com/tekkamanninja/grub/commit/be9d4f1863a1fcb1cbbd2f867309457fade8be73#commitcomment-60851029
> >>>>>
> >>>
> >>> Yes!! Thanks for refreshing the memory. It seems after 2 years, we are
> >>> still debating the same topic :).
> >>> Let me summarize the thread. There are multiple ways for EFI stub code
> >>> to retrieve the boot hartid.
> >>>
> >>> 1. EFI variables - This is what Henerich proposed last time. Ard
> >>> suggested that EFI configuration tables are better candidates than EFI
> >>> variables.
> >>> 2. DT modification - This was preferred over the configuration table
> >>> at that time given because RISC-V was DT only at that time.
> >>>                                    We already had all the infrastructure
> >>> around DT. Thus, DT seemed to be a natural choice then.
> >>>                                    It works now for existing setup
> >>> however, the DT approach will not work for systems with ACPI support.
> >>>                                    Adding a similar entry in ACPI tables
> >>> is possible but adding ACPI support in EFI stub is not trivial.
> >>> 3. SMBIOS - Only for platforms with SMBIOS support. SMBIOS is not
> >>> mandatory and adding SMBIOS support in EFI stub is not trivial.
> >>> 4. SBI         -  As I mentioned before, this is an EFI specific
> >>> problem because EFI stub doesn't know what the boot hartid is. Thus,
> >>> it should be solved
> >>>                         in an EFI specific way. An SBI extension for
> >>> such features may not be acceptable as the non-EFI booting method
> >>> works fine without the SBI extension.
> >>> 5. RISC-V specific EFI configuration table or protocol: Ard suggested
> >>> EFI configuration table last time. Earlier in this thread, EFI
> >>> protocol was suggested.
> >>>                         My personal preference has always been one of
> >>> these as it solves the problem for all EFI booting methods
> >>>                         for platforms-os
> >>> combination(DT/ACPI-Linux/FreeBSD) in an EFI specific way.
> >>>
> >>> @Heinrich: Do you see any issue with the EFI configuration table or
> >>> protocol to retrieve the boot hartid?
> >>
> >> There is nothing technical stopping us from implementing either option.
> >>
> >> We could simply reuse the EFI Device Tree Fixup Protocol
> >> (https://github.com/U-Boot-EFI/EFI_DT_FIXUP_PROTOCOL) implemented in
> >> U-Boot and already used by systemd-boot. Pass a devicetree (which may be
> >> empty) to the Fixup() method and it will add the /chosen node with the
> >> boot-hartid parameter.
> >>
> >> The EFI stub anyway creates a new device-tree to pass the memory map to
> >> the kernel in the ACPI case (function update_fdt()). Calling the EFI
> >> Device Tree Fixup Protocol could be easily added.
> >
> > Are you suggesting that DTB (skeletal or full-blown) will always be there when
> > booting the kernel as an EFI application ? If yes then we are
> > indirectly mandating
> > skeletal DTB for UEFI+ACPI system.
>
> The boot-hartid uses to be the hartid of the current thread. Are
> operating systems supposed to support boot-hartid to relate to another
> hardware thread then the current one? If the boot-hartid can differ from
> the current thread, what would be the source of truth? Is there any

The boot-hartid is part of the boot protocol (non-EFI or EFI based).

For non-EFI based booting, the previous booting stage passes boot-hartid
in the a0 registers. This works perfectly fine and we don't have any issues
because OSes can save the boot-hartid from a0 register to some memory
location.

This issue of discovering boot-hartid only applies to EFI based booting
so we need a RISC-V specific protocol/configuration in EFI tables to allow
OSes to discover the boot-hartid.

> formal specification defining what the boot-hartid is and how it shall
> be used? Is there any formal specification which defines the transfer of
> the boot-hartid in the boot flow?

For non-EFI based booting, the "a0" register contains the hartid. This
convention has been followed in RISC-V since early days (10+ years).

EFI based booting is relatively new in the RISC-V world so this should
be solved in an EFI specific way.

>
> I only found this in the OpenSBI documentation:
>
> The DT properties of a domain instance DT node are as follows:
> * **boot-hart** (Optional) - The DT node phandle of the HART booting the
> domain instance. If coldboot HART is assigned to the domain instance
> then this DT property is ignored and the coldboot HART is assumed to be
> the boot HART of the domain instance.

This is not at all related to the problem we are discussing here. This
documentation talks about preferred boot-hart within a OpenSBI domain
and OpenSBI will remove the domain configuration details from DTB
before jumping to the next booting stage.

>
> The only piece of software that cares about the boot-hartid property is
> neither the SBI nor the UEFI firmware nor the EFI stub but the main OS
> kernel. Carrying the current hartid from boot stage to boot stage via
> register and DTB entry looks like a poor design decision. Instead of
> relying on a chain of transfers it would preferable that whoever in the
> boot chain wants to know the current hartid requests it from the source
> of truth.

Passing boot-hartid in DTB was a temporary decision (2 years back) when
Atish added EFI support in the kernel because back then there was no
ACPI support being developed for RISC-V kernel.

Now that we can have either DT or ACPI passed via EFI booting, we
need a EFI specific solution.

>
> The source of truth for the current hardware thread is the value of the
> mhartid CSR. Unfortunately this can only be read in M-mode. It could be
> made available via the SBI. I see no reason why the operating system or
> hypervisor should not see the hartid of a software thread at any time.

Both DT and ACPI have details of all HARTs along with their hartids, it's
only the boot-hartid (hartid of the booting HART) which needs to be known
to the kernel when booted as an EFI application.

Also, "boot-hartid" is a transient read-only information which is of no use
at runtime so defining an SBI call for this means has limited utility value:
1) It will be used only once for EFI based booting and never used at
runtime
2) Non-EFI booting will never use it because boot-hartid is available
in a0 register
3) Hypervisors which prefer booting kernel directly will never implement
it because it's redundant for such hypervisors

Clearly, "boot-hartid" needs to be part of the booting protocol and a SBI
call for this has very limited utility value.

>
> If we decide to make the current design more complex by using an EFI
> protocol, we have to decide if we want to reuse an existing one, or
> introduce a new one.
>
> We already have an existing protocol in U-Boot which could do the job
> and which uses a dtb as transfer format. Internally OpenSBI, U-Boot and
> Linux always use a device-tree. But this does not hold true for other
> software like EDK II. We could instead define a new protocol which uses
> a uint64_t parameter and does not require support for the flattened
> devicetree format.

Mandating some form of devicetree for EFI booting is a choice to be
made by the RISC-V platform specs.

>
> My preferred choice would be getting rid of multiple transfers and
> letting the piece of software that needs the information read the
> boot-hartid directly from wherever the source of truth is.

I disagree with this.

A SBI call just for determining boot-hartid is of limited utility (in this
case used only for EFI based booting). It is better to solve this problem
in a EFI specific way.

Regards,
Anup

>
> Best regards
>
> Heinrich
>
> >
> > Regards,
> > Anup
> >
> >>
> >> Best regards
> >>
> >> Heinrich
> >>
> >>>
> >>> My only concern with the RISC-V EFI protocol is that Ard suggested it
> >>> doesn't need a modification in UEFI spec.
> >>> Where should we document it in this case ? We can't document it in
> >>> Linux or EBBR.
> >>> Because, this is a protocol that server systems and other non-Linux OS
> >>> will also use.
> >>> We can define it in the RISC-V platform spec. But that's not the usual
> >>> place where somebody will look for the definition of such protocol.
> >>>
> >>> Wouldn't it be better to standardize it in UEFI spec ? The UEFI spec
> >>> already has ARCH specific protocols/config tables.
> >>>
> >>>>>
> >>>>> If GRUB loads a devicetree it will anyway have to call into the firmware
> >>>>> for fixups. These will include adding the boot-hartid.
> >>>>>
> >>>>>>
> >>>>>>> @Heinrich Schuchardt
> >>>>>>> I vaguely remember you proposed something similar when we discussed
> >>>>>>> this first during FOSDEM.
> >>>>>>> I can't recall why it was abandoned in favor of the DT approach which
> >>>>>>> works. But,
> >>>>>>> it is not an ideal solution considering RISC-V ACPI support is already
> >>>>>>> on the way.
> >>>>>>>
> >>>>>>> Do you have a link to the older thread where this thing was discussed ?
> >>>>>
> >>>>> Unfortunately I cannot find anything.
> >>>>
> >>>> I assume Atish referred to this thread:
> >>>>
> >>>> https://patchwork.ozlabs.org/project/uboot/patch/20200205055334.4072-1-xypron.glpk@gmx.de/
> >>>>
> >>>> Best regards
> >>>>
> >>>> Heinrich
> >>>>
> >>>> _______________________________________________
> >>>> linux-riscv mailing list
> >>>> linux-riscv@lists.infradead.org
> >>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> >>>
> >>>
> >>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
