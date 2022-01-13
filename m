Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEBFC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jan 2022 09:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6TamcyiVwAwod6qoHpjDW1hroDyiP5nkKnnx8OtDJGA=; b=ZZloQDfl/NHaHq
	K/7NCDqmXDyZ226Qv6alWn5H7VOOtks6dTJHVwyiix2rhteKOBHhQdv7UO+Zly7u/AeSjJrtRLyaL
	k6cMhVpjRO9tE1RyoMsMQNFwgseI9bw7xgKtINsjj0+XAx71iR2FfNN0uFpJIZ/iBuIYR3oTw0+Hs
	4mngATB97+psoQPQg0tO+jBuXKS0S4lpVY34nRGbOJYbe0rI1HYsyifdvTUCjavjokohbXi6s66L3
	V8QoHEfWJZPFJJQ3ly038qR6Tj9ouRudN9/Lt4nQVlBCfm8icvIPaTCYW8HM04lacfpxBCMGbbhvA
	EfIYxm4zv8PxEElUPTfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7wfG-005Icl-Lr; Thu, 13 Jan 2022 09:45:02 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7wfB-005Ia9-V5
 for linux-riscv@lists.infradead.org; Thu, 13 Jan 2022 09:45:00 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so18078398pjj.2
 for <linux-riscv@lists.infradead.org>; Thu, 13 Jan 2022 01:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=scZAB/j3rCU6b/i4IDXGYP87Wshe7S+PQhQyZF7rlpU=;
 b=Itt8WSddr4f6Vg0RoyAcjLP/J4i+9raQ04ORsOjm4cZc1eaV6bkH+YOwZ545GK10Zn
 dgOOxRSTi2017CjXot1nKqGGIjzK1HtGKVUn4XYsbw3Fk8cYEEvggqk8KpxU9NPfk85G
 a8gx39jkVMjl0npecPEul9FZonIu9ZfQO4SAmi0jT1Arq4YGrowpWaIH9NpULAvvGyBp
 lGa4F+Y8yYgmwNKrkzZ4actTYVZyq4woOnpzL6AWmZ8QnFD60RkzMLmmaP/Duw/UHLGb
 qGj7fbvy4KdUW2Ix0XYtyf6MOiV0DgIDJo8FfGPxYq6+TSdYdn9m1QURvaz8kvNdsAR9
 21mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=scZAB/j3rCU6b/i4IDXGYP87Wshe7S+PQhQyZF7rlpU=;
 b=VthkT/xH0/ZAAF0HAvxX7Dwji468svfxV7D+H2RSUxS7MX+HtGkyGXtZ5atE8urKsn
 iqqTDEXXmLF45qqGyBW6PQYcXasA83L/S3wzEmtj4Q/PzELrMTwNoXcJqlpOA5hjrABt
 iAWplrU6K+TBU8Mj9BwSWr+OFPC1jd5SolWuKeaG5i/bDcDgxlYEVOy7z+CBwx2YakjN
 fNNb8QCzOEQfQPaS2S0OK6IAzuDz3ZlQxlCtehQEBSIXj/j+s/rf8ai9Ff92+VfTrmA7
 UjsPjFBhm4G3bypgTffxLnhwksq367NbrapkVGg8yZN0IHmax+6MWirthOLu0ItY8HmC
 qUzQ==
X-Gm-Message-State: AOAM532cmrest5QFdQZ5EzIok+QfjqMJldwSm5N7qNTnHE7mVpsOpkfU
 shuUuOQIgl3L59aR9P8R7K97Vw==
X-Google-Smtp-Source: ABdhPJyP7cR3wTvsZ+Bqw05GJq+udCvB7QziWiD5s7WvNNfShefY/0ME/jOR5rfPArK6XJt5nFP6uw==
X-Received: by 2002:a17:902:d898:b0:14a:41f6:7b0 with SMTP id
 b24-20020a170902d89800b0014a41f607b0mr3644182plz.64.1642067096221; 
 Thu, 13 Jan 2022 01:44:56 -0800 (PST)
Received: from sunil-ThinkPad-T490 ([49.206.3.187])
 by smtp.gmail.com with ESMTPSA id q13sm2302400pfj.65.2022.01.13.01.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 01:44:55 -0800 (PST)
Date: Thu, 13 Jan 2022 15:14:48 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Abner Chang <abner.chang@hpe.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Jessica Clarke <jrtc27@jrtc27.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, sunil.vl@gmail.com,
 linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: Question regarding "boot-hartid" DT node
Message-ID: <20220113094448.GA15466@sunil-ThinkPad-T490>
References: <CAOnJCUJfEpW6TtBPFGZ9TfNJeb9r+-L_8BddsxxejAd9Fe8VHw@mail.gmail.com>
 <CAMj1kXHGPZBfaiMCPYt7tYe+5wt_jn78Qdih9U-XLDba5sfqtQ@mail.gmail.com>
 <6fccad4e-b579-25ed-6bf3-2fb2a968b243@canonical.com>
 <c758bae4-3578-f062-edfd-f5835ae525fe@gmx.de>
 <CAOnJCUJ6Aoh7881HOSifQTc61+vCTVjxnYORfWM_WGLJQCugRg@mail.gmail.com>
 <7416157e-50d1-3664-7df0-2a45e29cd8c1@canonical.com>
 <CAAhSdy1DOnEGpxPQF7juUSyBTyx9W8KsH8exTpOmTLOnNCMJqg@mail.gmail.com>
 <CAOnJCU+taK16cnfnQtk3QM3s-f4RCUTWENAPe8Nhs-8L29vKew@mail.gmail.com>
 <d7f57c7f-a02c-c245-e1ef-af30bc9f6998@canonical.com>
 <CAMj1kXHXFXSojAUz6EDeoTkqD5AxeFTffA=RyTu5JnsAsAHsfg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXHXFXSojAUz6EDeoTkqD5AxeFTffA=RyTu5JnsAsAHsfg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_014458_043490_7497C820 
X-CRM114-Status: GOOD (  67.39  )
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

On Sat, Dec 04, 2021 at 08:13:35PM +0100, Ard Biesheuvel wrote:
> On Sat, 4 Dec 2021 at 20:03, Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
> >
> >
> >
> > On 12/4/21 19:34, Atish Patra wrote:
> > > On Fri, Dec 3, 2021 at 8:24 PM Anup Patel <anup@brainfault.org> wrote:
> > >>
> > >> On Sat, Dec 4, 2021 at 7:17 AM Heinrich Schuchardt
> > >> <heinrich.schuchardt@canonical.com> wrote:
> > >>>
> > >>>
> > >>>
> > >>> On 12/4/21 01:44, Atish Patra wrote:
> > >>>> On Fri, Dec 3, 2021 at 10:45 AM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> > >>>>>
> > >>>>> On 12/3/21 11:53 AM, Heinrich Schuchardt wrote:
> > >>>>>> On 12/3/21 11:13, Ard Biesheuvel wrote:
> > >>>>>>> On Thu, 2 Dec 2021 at 20:29, Atish Patra <atishp@atishpatra.org> wrote:
> > >>>>>>>>
> > >>>>>>>> On Thu, Dec 2, 2021 at 9:05 AM Heinrich Schuchardt
> > >>>>>>>> <heinrich.schuchardt@canonical.com> wrote:
> > >>>>>>>>>
> > >>>>>>>>> On 12/2/21 17:58, Ard Biesheuvel wrote:
> > >>>>>>>>>> On Thu, 2 Dec 2021 at 17:53, Heinrich Schuchardt
> > >>>>>>>>>> <heinrich.schuchardt@canonical.com> wrote:
> > >>>>>>>>>>>
> > >>>>>>>>>>> On 12/2/21 17:20, Ard Biesheuvel wrote:
> > >>>>>>>>>>>> On Thu, 2 Dec 2021 at 16:05, Sunil V L <sunilvl@ventanamicro.com>
> > >>>>>>>>>>>> wrote:
> > >>>>>>>>>>>>>
> > >>>>>>>>>>>>> Hi All,
> > >>>>>>>>>>>>>         I am starting this thread to discuss about the
> > >>>>>>>>>>>>> "boot-hartid" DT node
> > >>>>>>>>>>>>>         that is being used in RISC-V Linux EFI stub.
> > >>>>>>>>>>>>>
> > >>>>>>>>>>>>>         As you know, the boot Hart ID is passed in a0 register to
> > >>>>>>>>>>>>> the kernel
> > >>>>>>>>>>>>>         and hence there is actually no need to pass it via DT.
> > >>>>>>>>>>>>> However, since
> > >>>>>>>>>>>>>         EFI stub follows EFI application calling conventions, it
> > >>>>>>>>>>>>> needs to
> > >>>>>>>>>>>>>         know the boot Hart ID so that it can pass it to the proper
> > >>>>>>>>>>>>> kernel via
> > >>>>>>>>>>>>>         a0. For this issue, the solution was to add
> > >>>>>>>>>>>>> "/chosen/boot-hartid" in
> > >>>>>>>>>>>>>         DT. Both EDK2 and u-boot append this node in DT.
> > >>>>>>>>>>>>>
> > >>>>>>>>>>>>
> > >>>>>>>>>>>> I think this was a mistake tbh
> > >>>>>>>>>>>>
> > >>>>>>>>>>>>>         But above approach causes issue for ACPI since ACPI
> > >>>>>>>>>>>>> initialization
> > >>>>>>>>>>>>>         happens late in the proper kernel. Same is true even if we
> > >>>>>>>>>>>>> pass this
> > >>>>>>>>>>>>>         information via SMBIOS.
> > >>>>>>>>>>>>>
> > >>>>>>>>>>>>
> > >>>>>>>>>>>> It would be better to define a RISCV specific EFI protocol that the
> > >>>>>>>>>>>> stub can call to discover the boot-hartid value. That wat, it can
> > >>>>>>>>>>>> pass
> > >>>>>>>>>>>> it directly, without having to rely on firmware tables.
> > >>>>>>>>>>>
> > >>>>>>>>>>> As discovering the current process' hartid is not a UEFI specific
> > >>>>>>>>>>> task
> > >>>>>>>>>>> SBI would be a better fit.
> > >>>>>>>>>>>
> > >>>>>>>>>>
> > >>>>>>>>>> I disagree. The OS<->loader firmware interface is UEFI not SBI. So if
> > >>>>>>>>>> the EFI stub needs to ask the firmware which boot-hartid it should
> > >>>>>>>>>> pass in A0, it should use a EFI protocol and nothing else.
> > >>>>>>>>>>
> > >>>>>>>>>> Whether or not the loader/firmware *implements* this EFI protocol by
> > >>>>>>>>>> calling into SBI is a different matter (and likely the best choice).
> > >>>>>>>>>> But that does not mean the EFI stub should make SBI calls directly.
> > >>>>>>>>>>
> > >>>>>>>>>
> > >>>>>>>>> The EFI stub does not need the boot-hartid. It is the main Linux kernel
> > >>>>>>>>> that does. And that kernel already implements SBI calls.
> > >>>>>>>>>
> > >>>>>>>>> The main kernel could just try to read CSR mhartid which fails in
> > >>>>>>>>> S-mode
> > >>>>>>>>> and the SBI could emulate it.
> > >>>>>>>>
> > >>>>>>>> New SBI extension should be added only if there is no other way to
> > >>>>>>>> solve a generic
> > >>>>>>
> > >>>>>> I am not sure this feature would be implemented as SBI extension or as a
> > >>>>>> CSR emulation. Cf. sbi_emulate_csr_read(). But anyway it would require
> > >>>>>> an update of the SBI specification.
> > >>>>>>
> > >>>>>>>> problem. The boot hartid issue is very specific to efi booting only.
> > >>>>>>>> Any system that doesn't require
> > >>>>>>
> > >>>>>> The boot hartid is not EFI related at all. A firmware running single
> > >>>>>> threaded does not need this information.
> > >>>>>>
> > >>>>>> Information about the boot hartid is a general OS need.
> > >>>>>>
> > >>>>>> I am wondering why S-mode software should not have a generic means to
> > >>>>>> find out on which hart it is currently running.
> > >>>>>>
> > >>>>>>>> EFI booting won't need it. Even for EFI booting, we have other
> > >>>>>>>> approaches already proposed
> > >>>>>>>> to solve it. That's why, SBI extension should be the last resort
> > >>>>>>>> rather than first.
> > >>>>>>>>
> > >>>>>>>> I think an RISC-V specific EFI protocol as suggested by Ard should
> > >>>>>>>> work for all the cases.
> > >>>>>>>> Is there a case where you think it may not work ? U-Boot & EDK2
> > >>>>>>>> already stores the boot hartid.
> > >>>>>>>> They just implement that protocol and pass the hartid to the caller.
> > >>>>>>>> We do need to support it in the grub though.
> > >>>>>>>>
> > >>>>>>>
> > >>>>>>> Why would GRUB care about this? The EFI stub will call into the
> > >>>>>>> underlying firmware to invoke the protocol, GRUB is just a loader with
> > >>>>>>> a fancy menu that allows you to select which image to load, no?
> > >>>>>>
> > >>>>>> This is a related discussion:
> > >>>>>>
> > >>>>>> https://github.com/tekkamanninja/grub/commit/be9d4f1863a1fcb1cbbd2f867309457fade8be73#commitcomment-60851029
> > >>>>>>
> > >>>>
> > >>>> Yes!! Thanks for refreshing the memory. It seems after 2 years, we are
> > >>>> still debating the same topic :).
> > >>>> Let me summarize the thread. There are multiple ways for EFI stub code
> > >>>> to retrieve the boot hartid.
> > >>>>
> > >>>> 1. EFI variables - This is what Henerich proposed last time. Ard
> > >>>> suggested that EFI configuration tables are better candidates than EFI
> > >>>> variables.
> > >>>> 2. DT modification - This was preferred over the configuration table
> > >>>> at that time given because RISC-V was DT only at that time.
> > >>>>                                    We already had all the infrastructure
> > >>>> around DT. Thus, DT seemed to be a natural choice then.
> > >>>>                                    It works now for existing setup
> > >>>> however, the DT approach will not work for systems with ACPI support.
> > >>>>                                    Adding a similar entry in ACPI tables
> > >>>> is possible but adding ACPI support in EFI stub is not trivial.
> > >>>> 3. SMBIOS - Only for platforms with SMBIOS support. SMBIOS is not
> > >>>> mandatory and adding SMBIOS support in EFI stub is not trivial.
> > >>>> 4. SBI         -  As I mentioned before, this is an EFI specific
> > >>>> problem because EFI stub doesn't know what the boot hartid is. Thus,
> > >>>> it should be solved
> > >>>>                         in an EFI specific way. An SBI extension for
> > >>>> such features may not be acceptable as the non-EFI booting method
> > >>>> works fine without the SBI extension.
> > >>>> 5. RISC-V specific EFI configuration table or protocol: Ard suggested
> > >>>> EFI configuration table last time. Earlier in this thread, EFI
> > >>>> protocol was suggested.
> > >>>>                         My personal preference has always been one of
> > >>>> these as it solves the problem for all EFI booting methods
> > >>>>                         for platforms-os
> > >>>> combination(DT/ACPI-Linux/FreeBSD) in an EFI specific way.
> > >>>>
> > >>>> @Heinrich: Do you see any issue with the EFI configuration table or
> > >>>> protocol to retrieve the boot hartid?
> > >>>
> > >>> There is nothing technical stopping us from implementing either option.
> > >>>
> > >>> We could simply reuse the EFI Device Tree Fixup Protocol
> > >>> (https://github.com/U-Boot-EFI/EFI_DT_FIXUP_PROTOCOL) implemented in
> > >>> U-Boot and already used by systemd-boot. Pass a devicetree (which may be
> > >>> empty) to the Fixup() method and it will add the /chosen node with the
> > >>> boot-hartid parameter.
> > >>>
> > >>> The EFI stub anyway creates a new device-tree to pass the memory map to
> > >>> the kernel in the ACPI case (function update_fdt()). Calling the EFI
> > >>> Device Tree Fixup Protocol could be easily added.
> > >
> > > Thanks. Yes. We can solve the current problem for EFI stub in Linux.
> > >
> > >>
> > >> Are you suggesting that DTB (skeletal or full-blown) will always be there when
> > >> booting the kernel as an EFI application ? If yes then we are
> > >> indirectly mandating
> > >> skeletal DTB for UEFI+ACPI system.
> > >
> > > Yes. EFI Stub tries to find a fdt from the command line (not a
> > > preferred method) or EFI configuration table[1]
> > > (currently used for RISC-V systems). If it can't find a device tree,
> > > it generates one [2]
> > >
> > > [1] https://elixir.bootlin.com/linux/v5.16-rc3/source/drivers/firmware/efi/libstub/efi-stub.c#L231
> > > [2] https://elixir.bootlin.com/linux/v5.16-rc3/source/drivers/firmware/efi/libstub/fdt.c#L58
> > >
> > > However, we may still need to define the RISC-V EFI protocol to
> > > support ACPI for other OS (FreeBSD) which doesn't have
> > > a stub like loader that uses DT.
> > >
> > > In that case, where should we document it ? UEFI spec or RISC-V platform spec ?
> >
> > Defining EFI protocols outside the UEFI spec has precedents, e.g. the
> > EFI_TCG2_PROTOCOL is defined in a specification hosted by the Trusted
> > Computing Group.
> >
> 
> The 'E' in EFI means 'extensible' and the UEFI spec was never intended
> as an exhaustive reference of all imaginable protocols. It is
> perfectly fine to define your own protocols, and document them
> wherever appropriate.
> 
> > The UEFI Forum prefers an implemention first approach. We should
> > demonstrate with a patched EDK II or U-Boot and a patched Linux that
> > what we define is working before creating a change request.
> >
> 
> ... if needed. There is no need to incorporate this into the UEFI spec.
> 
> > Let's start with a draft protocol specification on Github and then
> > develop the necessary patches.
> >
> 
> Agreed.

Hi Ard,
   Here is the draft EFI_RISCV_BOOT_PROTOCOL specification.
   https://github.com/riscv-non-isa/riscv-uefi/releases/download/0.3/EFI_RISCV_PROTOCOL-spec.pdf

   If you are fine with this, we can freeze this spec. Thanks a lot for
   your help on this.

Thanks
Sunil
> 
> And to Heinrich's point regarding that there should not be a need for
> this protocol: I completely agree. The fact that passing the
> boot-hartid in a0 is part of the boot protocol is unfortunate, and
> sadly, the EFI stub needs to implement what the boot protocol
> stipulates, even though it is not a great design to begin with.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
