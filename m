Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91DAC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Dec 2021 17:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l0vn6U4pomU9OeFZtsxLsD8fRMS7RtdkIyKBOcRrlu8=; b=ZSTriy/zK6F6zn
	UxXWT3pqna26nftN7esEUTrQ8bVdlwVh9JL5/E5oZhWUeLZYvWSdN+GjYdQ3Qp//XAsueVdJPM89g
	LR8rvS81G+P2H+2s5BZr272cFwS5Q/7cml6W/PsI7yDXCd8v17tTqQQNluJZOhHGBmE1DLgziKj1j
	LSBmnb8xIqa7O2pkGHKSuMeis8aRJP0Sg3JldfeIHgT7mylY8BC2MmGVkp2iZ9Op9mkcs3l0lLB6p
	p1zuj6uaFgwVotGN2w3xoVnv+/pknUtRhnaWPFzOss3ojTZry0t6H+Tzw+FYd/n4wdVu29itrJs3u
	2f+2yXRiyASGLNA8q39g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mspbX-00D74F-KH; Thu, 02 Dec 2021 17:10:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mspbV-00D73p-24
 for linux-riscv@lists.infradead.org; Thu, 02 Dec 2021 17:10:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 85442624DD
 for <linux-riscv@lists.infradead.org>; Thu,  2 Dec 2021 17:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA04C53FD2
 for <linux-riscv@lists.infradead.org>; Thu,  2 Dec 2021 17:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638465039;
 bh=nNNxeh4M/bu2/zSQSHQwL27F5liHNNAvhAE/iB6qCB0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nljBGknZP8ShA/Aq6BjQueiPxrlFDi8TxuSZzxY8nQJMCJjmS8+qJonDyG50dI5fc
 9L3Y1Ly+6cBW1wDfWZKSXiJ4spHHzoInuVJFBOSrSbHS4CBmo8EuJ3SU46DtlGXA/V
 xs41IEG9mczBsQ0HzkQeBmyDi6D8WNPG00+GAjyqA7mD9sWdw+hjamPfSjecyA/l5w
 6T53CwkQcTeQcOlciOm2hN7hOu48Qa0J/qhmej4rpKVCyGnoE3xGgCqrNLTD22DVGz
 DMkaTXgkqyplna+i7vVZIn27xV3O2pH5EacsWmwhiSYbDitx0wMq7K5M8ME0GVr39c
 +HVq2DW3CeTcQ==
Received: by mail-ot1-f42.google.com with SMTP id
 n104-20020a9d2071000000b005799790cf0bso514378ota.5
 for <linux-riscv@lists.infradead.org>; Thu, 02 Dec 2021 09:10:39 -0800 (PST)
X-Gm-Message-State: AOAM533bzLhmdKdVdAK3SfoqpcUz4l5wLwcqqswTC4f/HTaWGHyqjrMI
 +BrQFjhiaB+v+ySPxLBegSP9bvJIdyGlxkmY3wU=
X-Google-Smtp-Source: ABdhPJxEB4V6BpYg9cIAixqWYIX/9vgaQ7evTo5K3M6qDI/Ppx//ILoeCog4lEVDFKymM9dyGF15xBUyB442JI9oBIw=
X-Received: by 2002:a05:6830:1445:: with SMTP id
 w5mr12417059otp.112.1638465038641; 
 Thu, 02 Dec 2021 09:10:38 -0800 (PST)
MIME-Version: 1.0
References: <20211202150515.GA97518@sunil-ThinkPad-T490>
 <CAMj1kXGJtMmcXLjHEG8xX0sSFNfdjj4A2_4DPcviEJ3=MARh+w@mail.gmail.com>
 <89d42547-ec36-5f84-88d1-fd65d891488c@canonical.com>
 <CAMj1kXG-VnhkECGewZPkUZLC2rb1bSDGdSpby9R=W_1d3FAsdg@mail.gmail.com>
 <6d9f131d-b3e8-18df-a9b6-6aaac881eb65@canonical.com>
In-Reply-To: <6d9f131d-b3e8-18df-a9b6-6aaac881eb65@canonical.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 2 Dec 2021 18:10:27 +0100
X-Gmail-Original-Message-ID: <CAMj1kXF7qTq9-ADQ13EYGa-he=5JPz7AF7Zwbc9_ESPdJi-g9g@mail.gmail.com>
Message-ID: <CAMj1kXF7qTq9-ADQ13EYGa-he=5JPz7AF7Zwbc9_ESPdJi-g9g@mail.gmail.com>
Subject: Re: Question regarding "boot-hartid" DT node
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Atish Patra <atishp@atishpatra.org>, Abner Chang <abner.chang@hpe.com>, 
 Jessica Clarke <jrtc27@jrtc27.com>, Anup Patel <anup@brainfault.org>, 
 Palmer Dabbelt <palmer@rivosinc.com>, sunil.vl@gmail.com, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Sunil V L <sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_091041_221400_A4B6D27E 
X-CRM114-Status: GOOD (  29.57  )
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

On Thu, 2 Dec 2021 at 18:04, Heinrich Schuchardt
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
>

That works for me as well, as long as the EFI stub does not have to
grow support for protocols beyond EFI based ones.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
