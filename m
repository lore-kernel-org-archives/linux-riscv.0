Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2483EC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Dec 2021 19:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0qINJaRK9rFajQhZ0Mh7mChpcN3EX8lFsN7J5gKaLfk=; b=oeMEj5C4S1bH1M
	vV+7/e2A06L4Jgv+ugg5Wnh+0ACi/nho69XPSUK+gf6nUCUPLVzdauZCXvKvey2RlmPC/Hr6dvZBs
	fK3P3L1AkS7zqwxjERz/ddFkuNlrsPrdBwRBHTAtYyjsd1tcH/Si4htj06rbvCioQQyoQrUGOiERR
	PR5FJx74Hb9SDhMDjMN5KqfqTaI2MwSnw/MG6JzVFqsRIUK1TmY42LwrllReoFCZ8CHNTc9rYfLBK
	fC5TDhr3CryssjlulUEH/KhYA/c4XExrqI9ifePTIRuZVDN4l6vRNpTEjrWgqL7mraSVFFxCoDgZp
	j+mp130pZQVmtCAKQ7tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msrls-00DLNM-8M; Thu, 02 Dec 2021 19:29:32 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msrlo-00DLMz-9f
 for linux-riscv@lists.infradead.org; Thu, 02 Dec 2021 19:29:30 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id g17so2407089ybe.13
 for <linux-riscv@lists.infradead.org>; Thu, 02 Dec 2021 11:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EEy7xipbJzacPQs8ZhKGcg59Q2nhwepRKSE26m1CsmM=;
 b=IENGeBM8DO0yOco1IxMl7ekZd2uzkLZI9qfrldcBcBfynDoYLU2ulZBMJ/V+OCS8h7
 8IaxIGr1wytjKaklGz4SraJ5CvJ3Z8IoAn2owb634WHwzlpMExVDueCpJOD8MEIjsrmu
 E5ziuTxF33a5OT1Sz21g/pcci7dihgcVshmtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EEy7xipbJzacPQs8ZhKGcg59Q2nhwepRKSE26m1CsmM=;
 b=0tm3ZrRLC5k0SbeswABFGLkgcuGj/7z2J3rOLEuZzr/frLLezfJrcE3px3mZZAgMUj
 kgRKtPeb/tUKT+m/M4NoZ1cV5GjcwKvwVm20ndYKept91YPRbH7X3ZV0tTizrLNWOsn/
 yILWuV1xMxZlEOKMFgAEhY5rioAHrQCUnGx8jWHEhRWhePws3fgrg8k93HtelntclUFW
 oo4Kbmr0qO2eGwu/9tRzZRllgLfnEmxnbnkxsc4hJdkCWEbPLn5XWhgx4s0EVSalS9kL
 jjlalVAT3IkwmfEaxqD4N7T4BbCY19o7/m6YQvDRsN36qDsdefdxy/Ba4+C7Blfs6RaY
 ICUg==
X-Gm-Message-State: AOAM533aDmVtBKJ3584Qh9P9Hkd/wKrlHpc+fn7j00glVwqeuVS0Ez7P
 dWLkn3ICq9TZP7NP7UMzSFQLczWDm+bKulEMybzX
X-Google-Smtp-Source: ABdhPJyUmTlpyynmPK0edACZH8q+poUxC5HXMq0q6Mq6dMZZP5TR8YsXfoSj7Wke9qRRXsY4vEjoHFtLwKPSlImRCAU=
X-Received: by 2002:a25:db8e:: with SMTP id
 g136mr16497771ybf.301.1638473366697; 
 Thu, 02 Dec 2021 11:29:26 -0800 (PST)
MIME-Version: 1.0
References: <20211202150515.GA97518@sunil-ThinkPad-T490>
 <CAMj1kXGJtMmcXLjHEG8xX0sSFNfdjj4A2_4DPcviEJ3=MARh+w@mail.gmail.com>
 <89d42547-ec36-5f84-88d1-fd65d891488c@canonical.com>
 <CAMj1kXG-VnhkECGewZPkUZLC2rb1bSDGdSpby9R=W_1d3FAsdg@mail.gmail.com>
 <6d9f131d-b3e8-18df-a9b6-6aaac881eb65@canonical.com>
In-Reply-To: <6d9f131d-b3e8-18df-a9b6-6aaac881eb65@canonical.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 2 Dec 2021 11:29:15 -0800
Message-ID: <CAOnJCUJfEpW6TtBPFGZ9TfNJeb9r+-L_8BddsxxejAd9Fe8VHw@mail.gmail.com>
Subject: Re: Question regarding "boot-hartid" DT node
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Abner Chang <abner.chang@hpe.com>, 
 Jessica Clarke <jrtc27@jrtc27.com>, Anup Patel <anup@brainfault.org>, 
 Palmer Dabbelt <palmer@rivosinc.com>, sunil.vl@gmail.com, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Sunil V L <sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_112928_432023_2E33E860 
X-CRM114-Status: GOOD (  33.08  )
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

On Thu, Dec 2, 2021 at 9:05 AM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> On 12/2/21 17:58, Ard Biesheuvel wrote:
> > On Thu, 2 Dec 2021 at 17:53, Heinrich Schuchardt
> > <heinrich.schuchardt@canonical.com> wrote:
> >>
> >> On 12/2/21 17:20, Ard Biesheuvel wrote:
> >>> On Thu, 2 Dec 2021 at 16:05, Sunil V L <sunilvl@ventanamicro.com> wrote:
> >>>>
> >>>> Hi All,
> >>>>      I am starting this thread to discuss about the "boot-hartid" DT node
> >>>>      that is being used in RISC-V Linux EFI stub.
> >>>>
> >>>>      As you know, the boot Hart ID is passed in a0 register to the kernel
> >>>>      and hence there is actually no need to pass it via DT. However, since
> >>>>      EFI stub follows EFI application calling conventions, it needs to
> >>>>      know the boot Hart ID so that it can pass it to the proper kernel via
> >>>>      a0. For this issue, the solution was to add "/chosen/boot-hartid" in
> >>>>      DT. Both EDK2 and u-boot append this node in DT.
> >>>>
> >>>
> >>> I think this was a mistake tbh
> >>>
> >>>>      But above approach causes issue for ACPI since ACPI initialization
> >>>>      happens late in the proper kernel. Same is true even if we pass this
> >>>>      information via SMBIOS.
> >>>>
> >>>
> >>> It would be better to define a RISCV specific EFI protocol that the
> >>> stub can call to discover the boot-hartid value. That wat, it can pass
> >>> it directly, without having to rely on firmware tables.
> >>
> >> As discovering the current process' hartid is not a UEFI specific task
> >> SBI would be a better fit.
> >>
> >
> > I disagree. The OS<->loader firmware interface is UEFI not SBI. So if
> > the EFI stub needs to ask the firmware which boot-hartid it should
> > pass in A0, it should use a EFI protocol and nothing else.
> >
> > Whether or not the loader/firmware *implements* this EFI protocol by
> > calling into SBI is a different matter (and likely the best choice).
> > But that does not mean the EFI stub should make SBI calls directly.
> >
>
> The EFI stub does not need the boot-hartid. It is the main Linux kernel
> that does. And that kernel already implements SBI calls.
>
> The main kernel could just try to read CSR mhartid which fails in S-mode
> and the SBI could emulate it.

New SBI extension should be added only if there is no other way to
solve a generic
problem. The boot hartid issue is very specific to efi booting only.
Any system that doesn't require
EFI booting won't need it. Even for EFI booting, we have other
approaches already proposed
to solve it. That's why, SBI extension should be the last resort
rather than first.

I think an RISC-V specific EFI protocol as suggested by Ard should
work for all the cases.
Is there a case where you think it may not work ? U-Boot & EDK2
already stores the boot hartid.
They just implement that protocol and pass the hartid to the caller.
We do need to support it in the grub though.

@Heinrich Schuchardt
I vaguely remember you proposed something similar when we discussed
this first during FOSDEM.
I can't recall why it was abandoned in favor of the DT approach which
works. But,
it is not an ideal solution considering RISC-V ACPI support is already
on the way.

Do you have a link to the older thread where this thing was discussed ?


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
