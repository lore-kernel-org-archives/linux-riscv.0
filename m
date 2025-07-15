Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54350C83F17
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jul 2025 03:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTQ3WkqUr2V3S5MbUOOng9kMAFGj+8ZKsDQ3fhwR3KQ=; b=2JxGfib5RGrBEy
	89sH07Q2ng+D4sMImdE/z/2cJ9FvFZubk5ra9GSDnvPL0ZsMIx8Y7obcu3O1BIvXrnQiFXcIwCJeh
	TtI2lAAQmX8BrbN7L22RE/9CH0aegsBPjs7CqiS6gn4XLXzYN6/C5ccQHnsLaFxh0On8bYQElmVsW
	KF2J7BmRgkY1C6YGhWn/DgypA9YIUdeC/w9c3xEkjf7ECK++qPgRju+9KiO+OXS0gjt/GsuqrSp9q
	PJWSLJlnbK7gi0I5SAhsGjSsEFth0x36B/skpVRoLs/Gn7EzNCg6//2h6xu8GlD1EEP/VTM+Wfnp+
	+wDU3JzQwisn9ZFkHI/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWjX-00000003weR-0CYp;
	Tue, 15 Jul 2025 03:53:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWMD-00000003t5o-13BC;
	Tue, 15 Jul 2025 03:29:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AFC144673C;
	Tue, 15 Jul 2025 03:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946E7C4CEFA;
	Tue, 15 Jul 2025 03:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752550168;
	bh=ieqd6xCHgI1ZHPQbWmrk7Nb+/qzuOEd8qzdDp3KdSmg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=b1H6MnsWja4+R/HGgp9tU9geJmQM3bS+T64RZtg6NFD+ynaIvQfKgLfZf9wFIQMFw
	 IEpBUdkrm3FNoiP0THEolt5J0qPGPi+XaiYUIKpViM0PEydXydu69aXClbW1kC0xKD
	 7JUh792Zp8v8r6oGDOmlPdLygPejN/QbXadKp3Cbs1EmM7s5hknoWmpnwwmetGDygw
	 T6eNIrkIRciU2Utnv1UBAZfPOojItTM8l0pnhPXGWHQIvXh4uX/WDMl8i8a/k/dKSg
	 yyRO3jqQ4zi0F9Ugl6CU4fuIXbAGo/rYgZLFmgVhaPTku1dFREHd6pT5oKhurk/jP+
	 JytHwh6zZkQAg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-558facbc19cso3942136e87.3;
        Mon, 14 Jul 2025 20:29:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUT+OWZNiMayCZKoZxVTRY9j8SWydfnG5ZpJSLBD8HHfeRE3Dz1vowoEleTHqh9nf+2Qh4aZuPtDDeHRQKdG0yF@lists.infradead.org, AJvYcCW4OZaLms1FFPFKiJbRUsJsFCF5GvV8NnXuypMLG8Hm0Mf9i4LoJOFmAryP+JhSAIYAOSFMIQFHATHgEkw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzWZsWoqu89PUqIDBOykmgkDLnJWxxCqnDngQOG95ZO0f4B4SG6
	bumFvws4O61pm4/6abEPC0ye3vVy82vqarvngQX8qBGCEEwB83pBtP/1Y1Rx3AhjIYD68nE1TB/
	TsXyGmEwuBN2ipsSOjtMd5WPpXECFEzA=
X-Google-Smtp-Source: AGHT+IFIz1rDkWifGEuRDAIW8VnNdmTc2Z0VIxz+qevBW3febeLf9zJqzx1t6qVV2NjD4iuG6fjmMDCJiXdzlUbsY78=
X-Received: by 2002:a05:6512:39c3:b0:553:2fec:b139 with SMTP id
 2adb3069b0e04-55a044ec444mr5090549e87.24.1752550166947; Mon, 14 Jul 2025
 20:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250714060843.4029171-5-ardb+git@google.com> <422e2a72-972f-41f4-a0b3-d69a6cb0c2e2@canonical.com>
In-Reply-To: <422e2a72-972f-41f4-a0b3-d69a6cb0c2e2@canonical.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 15 Jul 2025 13:29:15 +1000
X-Gmail-Original-Message-ID: <CAMj1kXEXpBF8hPaVMU0sDgNysYT66MDRmr3JHO4Lg1sJB_Yteg@mail.gmail.com>
X-Gm-Features: Ac12FXyPeU_gWXO9-8if9ZFnLW7qkSAVnhXpIQ13tyFhKHPmacdG9H_jV_FpMvQ
Message-ID: <CAMj1kXEXpBF8hPaVMU0sDgNysYT66MDRmr3JHO4Lg1sJB_Yteg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] Remove unused EFI runtime APIs
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_202929_327685_1E9A82F0 
X-CRM114-Status: GOOD (  24.90  )
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
Cc: Juergen Gross <jgross@suse.com>, linux-rtc@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Stefano Stabellini <sstabellini@kernel.org>, Ard Biesheuvel <ardb+git@google.com>, linux-efi@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Bibo Mao <maobibo@loongson.cn>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, loongarch@lists.linux.dev, xen-devel@lists.xenproject.org, Feng Tang <feng.tang@linux.alibaba.com>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 14 Jul 2025 at 18:11, Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> On 7/14/25 08:08, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Using EFI runtime services to program the RTC to wake up the system is
> > supported in theory, but rarely works in practice. Fortunately, this
> > functionality is rarely [if ever] used to begin with so we can just drop
> > it. (Note that the EFI rtc driver is not used by x86, which programs the
> > CMOS rtc directly)
>
> The main problem I see with firmware offering access to the RTC via UEFI
> services is that two different drivers, the firmware one and the Linux
> one might be trying to access the same busses or registers which might
> lead to unexpected results.
>
> Recently there was a discussion in the RISC-V technical group for the
> server platform specification where the same issue was discussed
> concerning SetTime().
>
> As a UEFI firmware should not care which operating system is booted, it
> should be up to the OS to disable EFI access to the RTC if it has native
> access.
>
> Could we disable all the EFI services for the RTC in Linux dynamically
> when an RTC driver is successfully probed?
>

I don't think this would be the right way to do it.

It also depends on whether ACPI or DT is being used to describe the
platform to the OS.

ACPI does not support describing the RTC device, so it should provide
the EFI services.

DT can describe the RTC device directly, so I think it is acceptable
for such firmware to mark all RTC routines unsupported in the RT_PROP
table, and just expose the RTC device directly.

The OS shouldn't have to reason about these things: it is up to the
platform to describe itself unambiguously.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
