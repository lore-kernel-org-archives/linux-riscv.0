Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D67C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Dec 2021 16:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ftW1RY+Yu+dKQFgGW4BI/1lPKkw9DN7b9dN18cNjA0I=; b=MkkpPrc9Fo4RnA
	v/GdRh77XFQR7/L2aah1owTWZlU1VDDBspijH3gbj2Qak5JuRt/Yw7W0TYnw8cCIXbd9oxHFdjaXP
	jM/FqdtiXg1Vauy3Qhe4PZbwINUwWe75SWg48weiQRhkerSIBo1n309UpuGkASoRp09cMZ8d+RFFR
	9PYaLclbyfFkVKHGu4WJUm89fhjDgR67kUsI8gAimTCrt669n3Yg2SnKG/Q3Wy4JdKHKbcPjpceBz
	JeWa0TljIJZW1U/zikJ+y1pUWfmqZjJM/hD1bvsnkj3RZwzSTnbTWxkR/oVin8LYARdRDzlw5s2i4
	jFe2wyd2CiUGoKPRU9Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mspQI-00D66b-Lb; Thu, 02 Dec 2021 16:59:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mspQF-00D660-7E
 for linux-riscv@lists.infradead.org; Thu, 02 Dec 2021 16:59:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 250BA6273B
 for <linux-riscv@lists.infradead.org>; Thu,  2 Dec 2021 16:59:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 039BCC56747
 for <linux-riscv@lists.infradead.org>; Thu,  2 Dec 2021 16:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638464341;
 bh=/zy9qvCwC1lAjmsE078OPisiQGtPoPxqKNVBrrN6XXs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WwAaiL/gR25W+IonZj9sYrecCbW4eHPTUR/0TVqYC3o4oAeTIbKjMYZBh2rFHby6V
 UgTpYy9BdgyTbs9FtdxGqqVVehgYXjnI0ibFsbXjDkM2yxXjW2q+T4zjMwx4RD5c7r
 z9Zx+Pk595HOJDOUgQRb3lxR/tqzW5TGfTBLFWLnJr52p2ObAmdrTvo52jj3oMHtEf
 6uPJsTjLdnyz+f7Zdjd69OtT91z3uiqmvseY1nOeoUnhivGdIY//I+iw4L2W0yIIB5
 ELmZyt0le9koRWaEvCr+XZzOP6f4JnPJxkxYHIKnHI1p6teSPpFPNlxvQwlLM9NCUw
 ON/4vDVSzKtww==
Received: by mail-ot1-f46.google.com with SMTP id
 w6-20020a9d77c6000000b0055e804fa524so487008otl.3
 for <linux-riscv@lists.infradead.org>; Thu, 02 Dec 2021 08:59:00 -0800 (PST)
X-Gm-Message-State: AOAM532GHaX7wJYRPO1Iz/uhrEffAaiieKw6kA9Gq/60hkpcEzI1TrGH
 l90ZxM1vv9LjbhLLB9TSlfTCuASnds8nmu0Rm8o=
X-Google-Smtp-Source: ABdhPJzNYU3KcsPOfgK75CP8sfk4bKUtw8ZnnubGz6bBm4PdFkty416497FIfvKAiFUiOq2rb3ZbT/+XCrOUd+h9Pe4=
X-Received: by 2002:a05:6830:1514:: with SMTP id
 k20mr11964593otp.147.1638464340156; 
 Thu, 02 Dec 2021 08:59:00 -0800 (PST)
MIME-Version: 1.0
References: <20211202150515.GA97518@sunil-ThinkPad-T490>
 <CAMj1kXGJtMmcXLjHEG8xX0sSFNfdjj4A2_4DPcviEJ3=MARh+w@mail.gmail.com>
 <89d42547-ec36-5f84-88d1-fd65d891488c@canonical.com>
In-Reply-To: <89d42547-ec36-5f84-88d1-fd65d891488c@canonical.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 2 Dec 2021 17:58:49 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG-VnhkECGewZPkUZLC2rb1bSDGdSpby9R=W_1d3FAsdg@mail.gmail.com>
Message-ID: <CAMj1kXG-VnhkECGewZPkUZLC2rb1bSDGdSpby9R=W_1d3FAsdg@mail.gmail.com>
Subject: Re: Question regarding "boot-hartid" DT node
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Atish Patra <atishp@atishpatra.org>, Abner Chang <abner.chang@hpe.com>, 
 Jessica Clarke <jrtc27@jrtc27.com>, Anup Patel <anup@brainfault.org>, 
 Palmer Dabbelt <palmer@rivosinc.com>, sunil.vl@gmail.com, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Sunil V L <sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_085903_362102_9DB432CD 
X-CRM114-Status: GOOD (  26.34  )
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

On Thu, 2 Dec 2021 at 17:53, Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> On 12/2/21 17:20, Ard Biesheuvel wrote:
> > On Thu, 2 Dec 2021 at 16:05, Sunil V L <sunilvl@ventanamicro.com> wrote:
> >>
> >> Hi All,
> >>     I am starting this thread to discuss about the "boot-hartid" DT node
> >>     that is being used in RISC-V Linux EFI stub.
> >>
> >>     As you know, the boot Hart ID is passed in a0 register to the kernel
> >>     and hence there is actually no need to pass it via DT. However, since
> >>     EFI stub follows EFI application calling conventions, it needs to
> >>     know the boot Hart ID so that it can pass it to the proper kernel via
> >>     a0. For this issue, the solution was to add "/chosen/boot-hartid" in
> >>     DT. Both EDK2 and u-boot append this node in DT.
> >>
> >
> > I think this was a mistake tbh
> >
> >>     But above approach causes issue for ACPI since ACPI initialization
> >>     happens late in the proper kernel. Same is true even if we pass this
> >>     information via SMBIOS.
> >>
> >
> > It would be better to define a RISCV specific EFI protocol that the
> > stub can call to discover the boot-hartid value. That wat, it can pass
> > it directly, without having to rely on firmware tables.
>
> As discovering the current process' hartid is not a UEFI specific task
> SBI would be a better fit.
>

I disagree. The OS<->loader firmware interface is UEFI not SBI. So if
the EFI stub needs to ask the firmware which boot-hartid it should
pass in A0, it should use a EFI protocol and nothing else.

Whether or not the loader/firmware *implements* this EFI protocol by
calling into SBI is a different matter (and likely the best choice).
But that does not mean the EFI stub should make SBI calls directly.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
