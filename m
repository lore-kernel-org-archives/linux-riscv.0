Return-Path: <SRS0=HVPl=MS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA614C4338F
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 15:12:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C0AE60249
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 15:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C0AE60249
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tMR0GHCGPMOQgKtJ6dEywimYUnhEbhFbyVt7UXtT3sg=; b=UM1ES6JEhjo4fx
	w5/UtNzOHtDC6IotgW/gJZxXRhaiyBO7WC0KCSH7CkVWRs7dnNSZnW8Cv3uwASYlzYJL5BdLppq5I
	tpRt5DVIV6tOzeq11KULv9jRMAyMI5oPriVIpNf2brqCgIpyuPhqT9OQaR/+WMvcnqtplIkeSg0kM
	KvGhzcUXNc9FmP05fyd30DBVTuaMUSsuIbFmD5ntkVHng9ddVq6R4PHDeIKqiYPs5IS4DoPnj/zvs
	5zHVqUIJFtRIu9viPQGB/T4gGnnRW6yvsVlW9OXAe5lYq8tbFmIyeOjxQ5w3393zp4pFM6r35RXfr
	yL9noMfj2hRutgNbJ/aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m82H8-00BjxJ-R1; Mon, 26 Jul 2021 15:12:14 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m82H6-00BjwQ-5a
 for linux-riscv@lists.infradead.org; Mon, 26 Jul 2021 15:12:13 +0000
Received: by mail-wr1-x433.google.com with SMTP id g15so11536359wrd.3
 for <linux-riscv@lists.infradead.org>; Mon, 26 Jul 2021 08:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SEfxyBBsdqfeyLFZ2nbpK//+jCa1qE/9+zQ9LwwPbhQ=;
 b=H0hDtd3aCHUHBPDSloms35IgrhOF5ZtJrLGWMgoKlxm537RxzcsL1cQz8j97DDsHh9
 ba257rXMv+VCd4/qPOgFYNJLD5tuoWUBjtD6sPNOQALBupambb2XeVKk8ONsoeSfbHT8
 P0og8XIFWCRosGS0qbsF+IHvXILMCixoRzO/T9RqzuxSpCkiIkl0AQ+0BEWhxNPl9ooe
 zIyiJ1/swh7zXH7IE/GtocToTLAeZLfA2fmi2YZtTCR20VpKrQO9S4afpFoQHgp/OGXl
 zQ5uqrgZBrSXyRhgPl2HFBnkIiq1ONVTxN+RJ0GkiL6WB3NZz+wk2OG+msbmpicBJyPU
 xevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SEfxyBBsdqfeyLFZ2nbpK//+jCa1qE/9+zQ9LwwPbhQ=;
 b=N1Nx98AWJswETJ9HB6u/g+bOe1OwRcxXnmNStqN9lB2QgKcGywokwlbR/RDUwW4U9/
 4x5H3Y54cbtqvlNdpUrB/IyfGh5f5z+yVm5KcOe648Ol3A8J7zy9RgsARqtgqHDVEW/G
 d04+cZCegi1ALcRt+a72J3RxZj4TKTfZTHJZ2nnOmEsfeZlKk69WnosRcHIHFqLmvnTe
 Y3pcLF2FubrLZ/hZP9pF17s8tu/l6n9ZfBEoul9ILs/o9vVrYdyYDO8S9e9ijL9rDYzA
 1Xwl3XZbeP8j4jfvn+6JelExnJ2OZbjekEmUjtCzXdtL7UJ9TjTcenyu1EXhLawgWaTq
 O6gw==
X-Gm-Message-State: AOAM533ml4vjFfd+/H35qRtxl1GgxL7Fkes3jVeOT0PEoiMitAM15s4Q
 bSXSAovTonfgzZvRTDdQOo++NZJhrOrxtDcurgOdnQ==
X-Google-Smtp-Source: ABdhPJy2FXmilr8kKAcECuQtFjx9dz7AcFI/haY3JRbMnk74CbCDdgkdvTEDD0AbKksuMyT9HXc0AHbJKw8GCdi7V4k=
X-Received: by 2002:a5d:640f:: with SMTP id z15mr11915041wru.325.1627312330294; 
 Mon, 26 Jul 2021 08:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210618123851.1344518-1-anup.patel@wdc.com>
 <CAAhSdy3E56j9XBfNr93AdW62mEx40F9F4-SYbNEFdkKA2BWRqA@mail.gmail.com>
 <87im0xdu2a.wl-maz@kernel.org>
In-Reply-To: <87im0xdu2a.wl-maz@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 26 Jul 2021 18:31:01 +0530
Message-ID: <CAAhSdy1rA9e2iCJWeVEQwKTRfTZZaRZVcMe1o8wMnFiWOOGW3w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/11] Linux RISC-V ACLINT Support
To: Marc Zyngier <maz@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, Anup Patel <anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_081212_329042_5BC0D66A 
X-CRM114-Status: GOOD (  19.68  )
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

Hi Marc,

On Mon, Jul 26, 2021 at 8:02 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Mon, 26 Jul 2021 13:45:20 +0100,
> Anup Patel <anup@brainfault.org> wrote:
> >
> > Hi Marc,
> >
> > I have taken the approach of IPI domains (like you suggested) in this series.
> >
> > What do you think ?
>
> I have commented on the irqchip driver.
>
> As for the RISC-V specific code, I'll let the architecture maintainers
> look into it. I guess the elephant in the room is that this spec seems
> to be evolving, and that there is no HW implementation (how this
> driver maps on SF's CLINT is anybody's guess).

The SiFive CLINT is a more convoluted device and provides M-level
timer functionality and M-level IPI functionality in one MMIO device.

The RISC-V ACLINT specification is more modular and backward
compatible with the SiFive CLINT. In fact, a SiFive CLINT device
can be viewed as a ACLINT MSWI device + ACLINT MTIMER device.
This means existing RISC-V boards having SiFive CLINT will be
automatically compliant to the RISC-V ACLINT specification.

Here's the RISC-V ACLINT spec:
https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc

The RISC-V ACLINT spec is quite stable and we are not seeing any
further changes hence I sent out RFC PATCHes to get feedback. The
RISC-V ACLINT spec will be frozen before 2021 end (i.e. before next
RISC-V summit).

The Linux NoMMU kernel (M-level) will use an ACLINT MSWI device
for IPI support whereas the regular Linux MMU kernel (S-level) will
use an ACLINT SSWI device for IPI support.

The ACLINT SWI driver is a common IPI driver for both ACLINT
MSWI (Linux NoMMU) and ACLINT SSWI (Linux MMU). In fact,
the ACLINT SWI also works for IPI part (i.e. MSWI) of SiFive CLINT.

Regards,
Anup

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
