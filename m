Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42309C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Dec 2021 00:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6vkuI43fVcnJ0xUI6m/MtlIC16OOOLUpquAHSQ/Lt/0=; b=PtjV5j2zxoRcAG
	YU7moDfNdL44X9SuRG4nRDaUL/AdserAGf1fTJrEF8liYI3uofTT3V4h2uzXFph0EvRC2IMxzBeOS
	xhlY3QIat1Iw1sJEGiOXVac/has9wy9fHdMH7cG5jdR0sgORfHzxwuMFD15o9yozo0Tr1KUQhJKBF
	8+C6Lc8WLMWlRZVLcro0t3Dv6Z/fEbr3hLscojncImYyyPQIa4i4wQvOivY2PC88qaQp1M9u5hEVM
	QVB21Rpih6LliGkUhiXIzdt4SPbV8YybQjyso1cP3tTVufwL+hykRAq7IFuBpnbir2FbTUWfPd4Eg
	wKTahh6XzsRv+ThiK1Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtJA0-00HLcX-H4; Sat, 04 Dec 2021 00:44:16 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtJ9w-00HLc7-VB
 for linux-riscv@lists.infradead.org; Sat, 04 Dec 2021 00:44:15 +0000
Received: by mail-yb1-xb30.google.com with SMTP id x32so14032889ybi.12
 for <linux-riscv@lists.infradead.org>; Fri, 03 Dec 2021 16:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o+if5BsM9BqLYxR89dy5XkrdRCTQ9uJZB1zspNj3NLQ=;
 b=SVOUaQ7/MupN279ZHKYVKC94jZz4e+or2VxTbiwH+Xe8zKF+dWCDbTMwqpmAwDV/TA
 bA/CaPvBWcppW3SjAcEvsTlk3MdS85GY0amAUWDcOS1FZ03/jtGXUmz0ZwyoSB1zZlmC
 8kVFJ7LwcAPLnuYHfslz+BvelxMxiivAtcvl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o+if5BsM9BqLYxR89dy5XkrdRCTQ9uJZB1zspNj3NLQ=;
 b=36pWSFXP45BBz2QVaQRP6Qf97s1OqTAH/XtsI2mkLi3XL52e2ppfCV/WQVmxCOTpVg
 4egc/+TTNOjC5DABm6wp9/KOT+91DAqp5u7ZJ1RETOwYN9z77B5dNvc72vCL+ftJ/bC4
 MySwv+NH/hUy7vu7sCuGj0JOLM/AllqOta6guzkvEN5PswNbU/OPgI++bESSoFWrWwD5
 65MjCxyl4pFmcJ7NqBMKZn4/loAUHBJ8L8JshytoUZhbe68i4IfMsVArl22yfIqNgBK1
 7eeN8DV7+r6720Jf7ln79TnI/uYawKB3XrWtfMdGGtwS0g0H5/g98UFEW7BVBIu905J+
 JZOA==
X-Gm-Message-State: AOAM531Nksrc+uii8XSbLoXp36wbpjL993/iwW8CHtWZrvgNrmHpMqKB
 flTmszHnmXlIcFVloGhFLYS+l/7TWpSCw3pOCn9a
X-Google-Smtp-Source: ABdhPJxQCZTcyvOcjDA3+UWjZ7yY7YTn97TLIlaGib56rfvSgblBpg5mhbbl9S5kLCB/Gprplz0eDvRm5ekLle378Ok=
X-Received: by 2002:a25:4d8:: with SMTP id 207mr25576662ybe.320.1638578651813; 
 Fri, 03 Dec 2021 16:44:11 -0800 (PST)
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
In-Reply-To: <c758bae4-3578-f062-edfd-f5835ae525fe@gmx.de>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 3 Dec 2021 16:44:00 -0800
Message-ID: <CAOnJCUJ6Aoh7881HOSifQTc61+vCTVjxnYORfWM_WGLJQCugRg@mail.gmail.com>
Subject: Re: Question regarding "boot-hartid" DT node
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Abner Chang <abner.chang@hpe.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@rivosinc.com>,
 sunil.vl@gmail.com, linux-riscv <linux-riscv@lists.infradead.org>,
 Sunil V L <sunilvl@ventanamicro.com>, Ard Biesheuvel <ardb@kernel.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_164413_060204_CEFD8112 
X-CRM114-Status: GOOD (  55.24  )
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

On Fri, Dec 3, 2021 at 10:45 AM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> On 12/3/21 11:53 AM, Heinrich Schuchardt wrote:
> > On 12/3/21 11:13, Ard Biesheuvel wrote:
> >> On Thu, 2 Dec 2021 at 20:29, Atish Patra <atishp@atishpatra.org> wrote:
> >>>
> >>> On Thu, Dec 2, 2021 at 9:05 AM Heinrich Schuchardt
> >>> <heinrich.schuchardt@canonical.com> wrote:
> >>>>
> >>>> On 12/2/21 17:58, Ard Biesheuvel wrote:
> >>>>> On Thu, 2 Dec 2021 at 17:53, Heinrich Schuchardt
> >>>>> <heinrich.schuchardt@canonical.com> wrote:
> >>>>>>
> >>>>>> On 12/2/21 17:20, Ard Biesheuvel wrote:
> >>>>>>> On Thu, 2 Dec 2021 at 16:05, Sunil V L <sunilvl@ventanamicro.com>
> >>>>>>> wrote:
> >>>>>>>>
> >>>>>>>> Hi All,
> >>>>>>>>       I am starting this thread to discuss about the
> >>>>>>>> "boot-hartid" DT node
> >>>>>>>>       that is being used in RISC-V Linux EFI stub.
> >>>>>>>>
> >>>>>>>>       As you know, the boot Hart ID is passed in a0 register to
> >>>>>>>> the kernel
> >>>>>>>>       and hence there is actually no need to pass it via DT.
> >>>>>>>> However, since
> >>>>>>>>       EFI stub follows EFI application calling conventions, it
> >>>>>>>> needs to
> >>>>>>>>       know the boot Hart ID so that it can pass it to the proper
> >>>>>>>> kernel via
> >>>>>>>>       a0. For this issue, the solution was to add
> >>>>>>>> "/chosen/boot-hartid" in
> >>>>>>>>       DT. Both EDK2 and u-boot append this node in DT.
> >>>>>>>>
> >>>>>>>
> >>>>>>> I think this was a mistake tbh
> >>>>>>>
> >>>>>>>>       But above approach causes issue for ACPI since ACPI
> >>>>>>>> initialization
> >>>>>>>>       happens late in the proper kernel. Same is true even if we
> >>>>>>>> pass this
> >>>>>>>>       information via SMBIOS.
> >>>>>>>>
> >>>>>>>
> >>>>>>> It would be better to define a RISCV specific EFI protocol that the
> >>>>>>> stub can call to discover the boot-hartid value. That wat, it can
> >>>>>>> pass
> >>>>>>> it directly, without having to rely on firmware tables.
> >>>>>>
> >>>>>> As discovering the current process' hartid is not a UEFI specific
> >>>>>> task
> >>>>>> SBI would be a better fit.
> >>>>>>
> >>>>>
> >>>>> I disagree. The OS<->loader firmware interface is UEFI not SBI. So if
> >>>>> the EFI stub needs to ask the firmware which boot-hartid it should
> >>>>> pass in A0, it should use a EFI protocol and nothing else.
> >>>>>
> >>>>> Whether or not the loader/firmware *implements* this EFI protocol by
> >>>>> calling into SBI is a different matter (and likely the best choice).
> >>>>> But that does not mean the EFI stub should make SBI calls directly.
> >>>>>
> >>>>
> >>>> The EFI stub does not need the boot-hartid. It is the main Linux kernel
> >>>> that does. And that kernel already implements SBI calls.
> >>>>
> >>>> The main kernel could just try to read CSR mhartid which fails in
> >>>> S-mode
> >>>> and the SBI could emulate it.
> >>>
> >>> New SBI extension should be added only if there is no other way to
> >>> solve a generic
> >
> > I am not sure this feature would be implemented as SBI extension or as a
> > CSR emulation. Cf. sbi_emulate_csr_read(). But anyway it would require
> > an update of the SBI specification.
> >
> >>> problem. The boot hartid issue is very specific to efi booting only.
> >>> Any system that doesn't require
> >
> > The boot hartid is not EFI related at all. A firmware running single
> > threaded does not need this information.
> >
> > Information about the boot hartid is a general OS need.
> >
> > I am wondering why S-mode software should not have a generic means to
> > find out on which hart it is currently running.
> >
> >>> EFI booting won't need it. Even for EFI booting, we have other
> >>> approaches already proposed
> >>> to solve it. That's why, SBI extension should be the last resort
> >>> rather than first.
> >>>
> >>> I think an RISC-V specific EFI protocol as suggested by Ard should
> >>> work for all the cases.
> >>> Is there a case where you think it may not work ? U-Boot & EDK2
> >>> already stores the boot hartid.
> >>> They just implement that protocol and pass the hartid to the caller.
> >>> We do need to support it in the grub though.
> >>>
> >>
> >> Why would GRUB care about this? The EFI stub will call into the
> >> underlying firmware to invoke the protocol, GRUB is just a loader with
> >> a fancy menu that allows you to select which image to load, no?
> >
> > This is a related discussion:
> >
> > https://github.com/tekkamanninja/grub/commit/be9d4f1863a1fcb1cbbd2f867309457fade8be73#commitcomment-60851029
> >

Yes!! Thanks for refreshing the memory. It seems after 2 years, we are
still debating the same topic :).
Let me summarize the thread. There are multiple ways for EFI stub code
to retrieve the boot hartid.

1. EFI variables - This is what Henerich proposed last time. Ard
suggested that EFI configuration tables are better candidates than EFI
variables.
2. DT modification - This was preferred over the configuration table
at that time given because RISC-V was DT only at that time.
                                 We already had all the infrastructure
around DT. Thus, DT seemed to be a natural choice then.
                                 It works now for existing setup
however, the DT approach will not work for systems with ACPI support.
                                 Adding a similar entry in ACPI tables
is possible but adding ACPI support in EFI stub is not trivial.
3. SMBIOS - Only for platforms with SMBIOS support. SMBIOS is not
mandatory and adding SMBIOS support in EFI stub is not trivial.
4. SBI         -  As I mentioned before, this is an EFI specific
problem because EFI stub doesn't know what the boot hartid is. Thus,
it should be solved
                      in an EFI specific way. An SBI extension for
such features may not be acceptable as the non-EFI booting method
works fine without the SBI extension.
5. RISC-V specific EFI configuration table or protocol: Ard suggested
EFI configuration table last time. Earlier in this thread, EFI
protocol was suggested.
                      My personal preference has always been one of
these as it solves the problem for all EFI booting methods
                      for platforms-os
combination(DT/ACPI-Linux/FreeBSD) in an EFI specific way.

@Heinrich: Do you see any issue with the EFI configuration table or
protocol to retrieve the boot hartid?

My only concern with the RISC-V EFI protocol is that Ard suggested it
doesn't need a modification in UEFI spec.
Where should we document it in this case ? We can't document it in
Linux or EBBR.
Because, this is a protocol that server systems and other non-Linux OS
will also use.
We can define it in the RISC-V platform spec. But that's not the usual
place where somebody will look for the definition of such protocol.

Wouldn't it be better to standardize it in UEFI spec ? The UEFI spec
already has ARCH specific protocols/config tables.

> >
> > If GRUB loads a devicetree it will anyway have to call into the firmware
> > for fixups. These will include adding the boot-hartid.
> >
> >>
> >>> @Heinrich Schuchardt
> >>> I vaguely remember you proposed something similar when we discussed
> >>> this first during FOSDEM.
> >>> I can't recall why it was abandoned in favor of the DT approach which
> >>> works. But,
> >>> it is not an ideal solution considering RISC-V ACPI support is already
> >>> on the way.
> >>>
> >>> Do you have a link to the older thread where this thing was discussed ?
> >
> > Unfortunately I cannot find anything.
>
> I assume Atish referred to this thread:
>
> https://patchwork.ozlabs.org/project/uboot/patch/20200205055334.4072-1-xypron.glpk@gmx.de/
>
> Best regards
>
> Heinrich
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
