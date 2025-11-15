Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F45CEB2DD
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Nov 2025 16:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zNkieHt09Dl0sxWKB8gL1vTdzhe1L/wkEwoa6PbwS2M=; b=HBBSrlWUg7/MEf
	lncX/97+2OqJoWOUarukXIoosHm3xP8dUMnzi0w/pnzAT4rdFgW2x6HTlINPFX27OUBPjbB3RpR0r
	wbC+81lDMcFk1EE64voWxm8gfKT5sZssoUysYEbw1HOATNJ9E6mKApp53RNT+giAGyRYkMUs88zAb
	y3kd/NocM+tcSRwrMlQI8jgsbQSPWlYodF1ZWSIlJ+7gKePjn30Y1vxVZ0MajWni8RLWa/qIXiT4P
	YfPq7gP2uheCJy6p6O7H14ydcoKtN03+/wjEFWg7YUCGqX7zLb1d0vs2mZswFhK7AfBAGBAZ/RwPF
	wpw98b1ivUCMvjvln5kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKJ8m-0000000DvD3-3ZOm;
	Sat, 15 Nov 2025 16:28:44 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKJ8j-0000000DvCe-25mo
	for linux-riscv@lists.infradead.org;
	Sat, 15 Nov 2025 16:28:43 +0000
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D542D3FCD2
	for <linux-riscv@lists.infradead.org>; Sat, 15 Nov 2025 16:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1763224115;
	bh=zSRKqRGpeB1Tv9JOYJHcuja/xurT3x7lGHvQj0bUM5w=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=hqFS4K2A4NupRLxsLmADyjgsaz+TXJo+I9fAhOWL7mN26KN7bsZIrzPEl0jYUJ0yT
	 Cxkgpp6DbW+fCZCLXBxl2HLoQFsn2ombppo+YLHQmKHt3s47oVV+f6+NGrCySIEOl+
	 79ZYpGnow3AiZ4d9pou449Yqv/iKhSJhl7FO7i2Y8nvQJdM8F3DohwUUXBr2r4O0I9
	 WTryYW0Ypk0lHdUaBLlfIvI+iizZtqvNKiKnQOlMgCnTZDC6eKdYJMFXabBn+2B1UZ
	 y0sp00qRHxLGpfK4ivi3QcGganhZq4LmyvPWeMLkwN+xiXbtdy+Xp7UDdE0wovQSgG
	 2iMtR3unzuMBvnWgZNkPWUTNZz9dKohzak2J3HsSxvXe0bRUdLerUry+f5goB7YBdU
	 WbeP5OGQwY5dF/DANq54abQf+S62+5o0f1bJQKe4BLPgB0sLP8OF5IVTOu6ZxEcDjY
	 4wHtFrOWQRciqjOCkFJbwFODbFgAB9hiUpfJ+t78bo+eGsGgfH+1HzrFu2wd6MOPeg
	 IaOmj2IK70e9cTMD5/up02gbuffXGyWWe+/1jy+3vIEFhI9/ZVVqKKjol26X3/OO/i
	 LHRhJy5VXc2phOeCa0RzEHWb8jpIsPY723UBC5rKs5sEPvyzmezAastkokHIddbiUC
	 6tIXKuVs2PPqH+fpnM/U2CHw=
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b736dc23dc9so140106066b.0
        for <linux-riscv@lists.infradead.org>; Sat, 15 Nov 2025 08:28:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763224114; x=1763828914;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zSRKqRGpeB1Tv9JOYJHcuja/xurT3x7lGHvQj0bUM5w=;
        b=ZTY3gnKgW9iKl4bFxwF/+c1Ok6bIetiVfFABoDpXzY2U561DpYwW4LqWd6br9IaGJn
         G9tCSdg6iiwoYf0OBBu6BdWd7SRUMDVHt9ViW7uOV/7ajUL5JsDcLMT7AEFoySCKS/1b
         ts5BKe8GiCk6W97/31Ib8fwfqCwl4WwieLfzFqhYrnLLGGE0yIMVUJslAIU7vHGdgb37
         4ErT7zLuVZGnO2tpNyAWA7NGgeg8gfsdHEqjKab7KeQtgRCsvoW148WBHD+3G5pWXa91
         fZGavV8oMzATEcp0hp2a1BrEYp/Wwlo3IG8R7rGRiy+8zijL6/3/R5cGQ1gyBtj1hdti
         gIDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIgQDsfNIr+pqiUK8fhvwj8SmkdB6SEjtCtB2N5ux0ONPEEib4HQbNzPfsWkjf/op49SUBjPfd0BPEZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyR72hGEuXrh2igIT2DLiBvQCE0YFFhM/VJSzAzR3+44Jb7Cue2
	rBP2vx1y0AhseurvpTCMgKiuJ2ieH6JQz9zOTeklEf5c7RjFpdBUKSqDgbsKathPJqk8RLebS6U
	mtuCvNIs2NBfCL0sM4/f9cRMaAqLB6Wt2EwjCzHhA7qprgECbyHAGZkKMnfdFScOjjy1v2bc67S
	Vf/m+A6BEikkAR7OQnjyRYvCYsnIRIFjeLCOf9YGX9iEapjFq9KeqsZF8Was1qy8Z6wtYL
X-Gm-Gg: ASbGncsbvISaJw3y9OfuEaWp/nUcxvckWzMSVvS8cYZKhT4vH6zUJygcXZZr8FmhNGm
	U42TBi5B/e9HqqzE92hsTrWTLQ4xYZ428b5WjOue/OzuMIO+aDbTE0tHoTDmwpfKaF82CJGewXe
	tSZFF1C3+IAQas+4PYITY0hHbZW3DrvDXFTek8zjqlgsGOGSqqcewhJQ==
X-Received: by 2002:a17:907:26cc:b0:b4a:d60d:fb68 with SMTP id a640c23a62f3a-b736787e579mr742371766b.6.1763224113861;
        Sat, 15 Nov 2025 08:28:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9nDCQNY6wZNR2oRy4Ui77frqHmUp7XPyVfQ4YwWP5a1VyUOxY0yBE4UbM+Ty6IlJi1smS24M8n7p6v570aBo=
X-Received: by 2002:a17:907:26cc:b0:b4a:d60d:fb68 with SMTP id
 a640c23a62f3a-b736787e579mr742369166b.6.1763224113387; Sat, 15 Nov 2025
 08:28:33 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 15 Nov 2025 08:28:32 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 15 Nov 2025 08:28:32 -0800
MIME-Version: 1.0
In-Reply-To: <4a55301a-ef7e-4b47-8151-621cfba36ddd@freeshell.de>
References: <20251107095530.114775-1-hal.feng@starfivetech.com>
 <CAJM55Z_rczBo4D3HsC90QW1=fp3NWgK-tsEo6LHTZNXEBHTDqA@mail.gmail.com>
 <ZQ2PR01MB13076544E2136E7E7C2EEDA1E6CD2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <CAJM55Z9KyNK1n4i9FxbLor4HTQKqK8WKA2svjPVvKXihw_E+sg@mail.gmail.com> <4a55301a-ef7e-4b47-8151-621cfba36ddd@freeshell.de>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Sat, 15 Nov 2025 08:28:32 -0800
X-Gm-Features: AWmQ_bnZh6g5E5Nmsvq88SYMPJTcp06SuprcwPyoDG2boVWgz7koXN7k-w6PH0I
Message-ID: <CAJM55Z-bRdNmnRZ7wi3PMOkzGYrxQEGk+7F67Pdu4WXwKmTjCQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Add support for StarFive VisionFive 2 Lite board
To: Albert Ou <aou@eecs.berkeley.edu>, Bjorn Helgaas <bhelgaas@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, E Shattow <e@freeshell.de>, 
	Hal Feng <hal.feng@starfivetech.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_082841_930362_8CE6CFBE 
X-CRM114-Status: GOOD (  35.78  )
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

Quoting E Shattow (2025-11-13 16:16:12)
>
>
> On 11/13/25 02:42, Emil Renner Berthing wrote:
> > Quoting Hal Feng (2025-11-13 04:42:05)
> >>> On 12.11.25 21:54, Emil Renner Berthing wrote:
> >>> Quoting Hal Feng (2025-11-07 10:55:22)
> >>>> VisionFive 2 Lite is a mini SBC based on the StarFive JH7110S
> >>>> industrial SoC which can run at -40~85 degrees centigrade and up to
> >>>> 1.25GHz.
> > [...]
> >>> Currently the JH7110 device trees are layed out like this, with a nice separation
> >>> between the SoC description and board descriptions:
> >>>
> >>> jh7110.dtsi               # JH7110 SoC description
> >>> |- jh7110-common.dtsi     # Peripherals common to all JH7110 boards
> >>>    |- jh7110-starfive-visionfive-2.dtsi # Peripherals common to VF2 boards
> >>>    |  |- <VF2 boards>     # Final VF2 board descriptions
> >>>    |- jh7110-milkv-marscm.dtsi # Peripherals common to Mars CM boards
> >>>    |  |- <Mars CM boards> # Final Mars CM board descriptions
> >>>    |- <other boards>      # Other JH7110 board descriptions
> >>>
> >>> With this series it moves to
> >>>
> >>> jh711x.dtsi
> >>> |- jh711x-common.dtsi
> >>>    |- jh7110-common.dtsi
> >>>    |  |- <jh7110 boards>
> >>>    |- jh7110s-common.dtsi
> >>>       |- <jh7110s boards>
> >>>
> >>> ..which I can't even give clear labels like above. In other words when new
> >>> patches are sent in it would not be easy to explain exactly where each change
> >>> should go and why.
> >>> I'm also worried that you'll find that more of the peripherals on the JH7110S
> >>> need special handling and a new jh7110s-... compatible string. Then I guess
> >>> they'll need to jump from jh7110x.dtsi two levels down to jh7110{,s}-
> >>> common.dtsi which then both describe SoC and board properties.
> >>>
> >>> If you're serious about calling this a new SoC then I'd expect something more
> >>> like this:
> >>>
> >>> jh711x.dtsi                  # Peripherals common to both SoCs
> >>> |- jh7110.dtsi               # JH7110 SoC description
> >>> |  |- jh7110-common.dtsi     # Peripherals common to all JH7110 boards
> >>> |     |- jh7110-starfive-visionfive-2.dtsi # Peripherals common to VF2 boards
> >>> |     |  |- <VF2 boards>     # Final VF2 board descriptions
> >>> |     |- jh7110-milkv-marscm.dtsi # Peripherals common to Mars CM boards
> >>> |     |  |- <Mars CM boards> # Final Mars CM board descriptions
> >>> |     |- <other boards>      # Other JH7110 board descriptions
> >>> |- jh7110s.dtsi              # JH7110S SoC description
> >>>    |- jh7110s-common.dtsi    # Peripherals common to all JH7110S boards
> >>>       |- <JH7110S boards>    # Final JH7110S board descriptions
> >>>
> >>> I know this will mean some duplication in jh7110{,s}-common.dtsi, but I
> >>> would prefer that to not having a clear explanation of what each file describes.
> >>>
> >>> Do you think this layout could work for you?
> >>
> >> Yeah, it is clearer for developers and maintainers.
> >>
> >> Considering Conor's suggestion, what about:
> >>
> >> jh7110.dtsi               # JH7110 SoC description
> >> |- jh7110-common.dtsi     # Peripherals common to all JH7110 boards
> >>    |- jh7110-starfive-visionfive-2.dtsi # Peripherals common to VF2 boards
> >>    |  |- <VF2 boards>     # Final VF2 board descriptions
> >>    |- jh7110-milkv-marscm.dtsi # Peripherals common to Mars CM boards
> >>    |  |- <Mars CM boards> # Final Mars CM board descriptions
> >>    |- <other boards>      # Other JH7110 board descriptions
> >> |- <JH7110S boards>
> >>
>
> JH-7110 and JH-7110I reference docs are listed (not any JH-7110S) at:
> https://doc-en.rvspace.org/Doc_Center/datasheet_0.html
>
> Does the JH-7110I use the OPP table for JH-7110 or JH-7110S?
>
> >> Move the opp table from jh7110.dtsi to jh7110-common.dtsi.
> >> Remove jh7110s-common.dtsi, because only one board uses JH7110S now.
> >
> > This patchset adds 2 different boards. Has this changed?
> >
> > Also this would mean that you're not using the starfive,jh7110s compatible or
> > any other starfive,jh7110s-.. compatible strings, so effectively you're not
> > treating it as a new chip, but just a board that needs a different opp table.
> >
> > I see now that the opp table is effectively the only difference between the two
> > chips in this patchset, so if that's closer to reality then what you suggest is
> > fine with me.
> >
> > /Emil
>
> Are we now re-visiting Hal's suggestion then (during code review for
> Milk-V Mars CM and Mars CM Lite) to split out the OPP tables and make
> them per-board, as before introduction of the StarFive VisionFive 2 Lite
> board(s) ?
>
> Can we then do as from where we are now before this series:
>
> - Move "the JH-7110" OPP table into jh7110-common-opp-1500.dtsi
>
> - Each board jh7110-{deepcomputing,milkv,pine64,starfive}*.dts includes
> said OPP dtsi file.
>
> and for this series:
>
> - Drop the adding of a new compatible
>
> - Add "the JH-7110S" OPP table into jh7110-common-opp-1250.dtsi
>
> - Use existing jh7110-* prefix for "JH-7110S" board dtsi and dts,
> include jh7110-common.dtsi as usual, and include jh7110-common-opp-1250.dtsi
>
> The exact filename pattern for the OPP tables I suggest here are
> approximations, however that idea is my suggestion if we're just doing a
> breakout of the tables and not a new compatible.
>
> I am positive on having the 1250MHz OPP tables split out into dtsi
> instead of stuffing them into the VisionFive 2 Lite common dtsi. That's
> all it is?

I think this suggestion makes sense if we're 100% sure the JH7110 and JH7110S
will only ever differ by the opp table. If there is any chance we'll need to add
different compatible string for some peripheral then I think Hal's suggestion
will be easier untangle. We'll even be able to do it without touching all the
board dts files once again.

I'm interested to hear Hal's opinion on this. Hopefully they'll have
more details
on the two version of the JH7110.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
