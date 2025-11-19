Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8406CF34AB
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 13:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=00W8LVKBiux5QHtuNpkhhm1vwKCveXsAsUTHnpWPrFU=; b=A20PEw9OnaAD98
	IXTIk8Wtzd9qbY/hZWMZ/nzaTk0y649t5V/64r6e8I/6ASuhOvggO+yeGGsVix0lJkIiCCxzKl0yH
	5aaqDPTak8QNsFV1SuOHMBfS4tHbpie5oswrEuR4AV3TaGMh1JXFogCOw+wB5mlPoHm5wsmW/AXu/
	dErpyNqc/d5StwbvcIIx3BpSI1ZsAyQiVuGCRk1RI/3JpeQ4He315+QJ5pttpOEbBA+MMJ/JSJCZZ
	4PrJ79neQoFPR9uuKhyqNqq+P8QqjAZJ5mQi0UeyrGJLohYhYTcE2lJ4Oupo0/zqet/v89MLKlvK7
	h6h0KIn/4CpTkQ45ynkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLiDj-00000003HOp-2SZW;
	Wed, 19 Nov 2025 13:27:39 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLiDg-00000003HNp-1Wxi
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 13:27:38 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1A1243FB5C
	for <linux-riscv@lists.infradead.org>; Wed, 19 Nov 2025 13:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1763558853;
	bh=Zf71PPi80OPlEx8Il95aFJzJcBxtZN/TTdL1nSo4eyc=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=FZqlnr2ckfAQmk+JxK1lBj6nSLNb2BkXSQyMdtTXp7XTh9W4X58ttaoHrvFWDEWAh
	 +2yKnHkaFHSmhppicEcb9X7qU8eC1pIqQ0EHSR9kz/CYbkz0j15+/P9D4emriBoMy2
	 UEb1PDn6NoH5SPUjAlf5kJu8qkXSTRPxuHUZ1R62PtWijgLQaTJZfa0+1DYRZT9kM1
	 yqVG6MmjLW8QyMYkCBnb5q7+oCDDhD1e7lGqVw0AA0LWWuMbhOLOPGUOwJL9jIFfnm
	 3aMlidQxaF0MnOY5PLMnUHOFYItu7Xr+gb1IAGpydv5/Jb67/N0ogZIR6ojpD6I3KG
	 uJre56pRfWM7QBOIshRapdK8RqGSJ6XIgJ0/6kf+ydzz6XbnP5le7pmsIhfxvBD/aE
	 F5hRe+F5J4UnZBiSx8vkX5j9H22cVYozxl/dVBxn+Bi+JL6R5dhPjXjV/kaCfL5n+5
	 mK1vpgCvrhaCR/qRBYGnzkonUOHNFKG3aRH7mTD+3Kg3kRGyfY0C1MeerMI1yzwVsG
	 IXs0puu5codZh+gK8b79A+FPQmp3FwVnCqA5i1BXIrxmlxZwyA9wJOtfzjIhmKjGLK
	 IZOpJCwTfTpvRzaZgOZwVmijMLJ4X2JiPxRMfQo9LwzF4nbJOY+LH0UcR+/5uJtjUP
	 h4z1BaEYaIafgxHWsZzo7lNA=
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b763acb793fso115659166b.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Nov 2025 05:27:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763558852; x=1764163652;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zf71PPi80OPlEx8Il95aFJzJcBxtZN/TTdL1nSo4eyc=;
        b=JUjp1mJ7teKmkQLH1Uw02+M6rZOXrJaruDaxK1UmRRo+L7Fx31OsgrTXAVqwVkiNvh
         XjlawEC9uLL8Tqy3avDBxNPmvlabJ5MkQVlnHm0hC4I3LnjJ+NlCIwVcqoHaKC6kpj+N
         TF/nsXs/PQnezac+Kebl4uckFtNppKFK5lwtJCD5yN1ew+eL0dIcIQhhhN9TbOPD22Z8
         0jqkX5pGzjjkbOnbuh7pkCC+9RrwSXwEYA/gzeEDkRH84ihMgcJ1fFduph3SX1loCRF+
         XTDqYVyTuD7Aqcrmtnn4ptEV+yWfcfZs2JkBqerfgPsebE/50VfBYR10yQOfQ71R0pML
         DK5A==
X-Forwarded-Encrypted: i=1; AJvYcCX3rEdkFbTamjA4tDO69t2vsffU5UG++4uNLoCA1oTcPy/PT2w15YHPkikMOmOr95AiKphdTBQvFN6hSA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsQn/B35/T1SyWYpmmkx4hNzxPCnMn3fS2GL6ijvrklAUpTvRe
	tCUDdh6DmBPFIGQk4skbtleexNVRDeSMM+26/9u4Zn1jZzqGbngtAHUqpsARR9ns+BwEPQB+TvK
	dlaatJv399OTMuJZG/Nqf7vBpLJUxh9ueC87qmKG8zZ2xOetyl/adhXqKhM/3k+B4awp/jO+jRR
	3yVuVHpQQjNpCx65e2x2/uzm+xOzx8VG1pDWOLcWE0piSfKmEYjo2RI1UEfh2k
X-Gm-Gg: ASbGncvPfDnNWwY7c3TYlDe2dKfSczGC2oAK7e9fwFV+zKdxlPiqfYD00rwaSqd0KLM
	Utcd6LG39kP/e5ly7x8gIOAV1Iem71cm1z3AJQ6ihH8InCZv/r+tHfayo+ouzOtKHCOhVoRC2Sy
	YzMtmH2/3YEGVPNyYOS41VPrYvN/ebbMWtaf4xTPFxkCDwFFEvUqlI/cMNN7dnUheodFFc3s3k0
	pFFL4dGptcQssxflVo1LLs=
X-Received: by 2002:a17:907:25c4:b0:b5f:c2f6:a172 with SMTP id a640c23a62f3a-b7367962920mr2271129166b.30.1763558851799;
        Wed, 19 Nov 2025 05:27:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExSS9MaUldyLPT7Iou5C3NP0DPQDxJxzB9TQhVXWuuilvLezgx6R8t0Ds/PpwPKNH6hoMB6uCLUA2EuEKKjh8=
X-Received: by 2002:a17:907:25c4:b0:b5f:c2f6:a172 with SMTP id
 a640c23a62f3a-b7367962920mr2271124466b.30.1763558851353; Wed, 19 Nov 2025
 05:27:31 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 19 Nov 2025 05:27:30 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 19 Nov 2025 05:27:30 -0800
MIME-Version: 1.0
In-Reply-To: <20251118-throwing-marina-14a87d65465a@spud>
References: <20251107095530.114775-1-hal.feng@starfivetech.com>
 <CAJM55Z_rczBo4D3HsC90QW1=fp3NWgK-tsEo6LHTZNXEBHTDqA@mail.gmail.com>
 <ZQ2PR01MB13076544E2136E7E7C2EEDA1E6CD2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <CAJM55Z9KyNK1n4i9FxbLor4HTQKqK8WKA2svjPVvKXihw_E+sg@mail.gmail.com>
 <4a55301a-ef7e-4b47-8151-621cfba36ddd@freeshell.de> <CAJM55Z-bRdNmnRZ7wi3PMOkzGYrxQEGk+7F67Pdu4WXwKmTjCQ@mail.gmail.com>
 <ZQ2PR01MB13075CDDEFC2F03C837E1B31E6C92@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <b33919e9-e100-4629-92cb-d1ec3dd756a7@freeshell.de> <ZQ2PR01MB1307DADE17FFEFCE70C3F391E6D62@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <20251118-throwing-marina-14a87d65465a@spud>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Wed, 19 Nov 2025 05:27:30 -0800
X-Gm-Features: AWmQ_bkXMb__BB3WeHVgakQ5iZHBjvvMXAjrpqkcU7PRZ3VxAvyAIYzaQhqJGpo
Message-ID: <CAJM55Z-MfpVX3EuQ_AjvDSk6FwR51R5cQdN5RybS9pbJ8r9NNg@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Add support for StarFive VisionFive 2 Lite board
To: Conor Dooley <conor@kernel.org>, Hal Feng <hal.feng@starfivetech.com>
Cc: E Shattow <e@freeshell.de>, Albert Ou <aou@eecs.berkeley.edu>, 
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_052736_753849_D85F17F1 
X-CRM114-Status: GOOD (  34.28  )
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

Quoting Conor Dooley (2025-11-19 00:10:08)
> On Tue, Nov 18, 2025 at 02:12:58AM +0000, Hal Feng wrote:
> > > All,
> > >
> > > I repeat that the suggestion was made months ago (by Hal) to split out the
> > > OPP tables per-board from the period of time when I was complaining about
> > > 1.5GHz JH-7110 operation pushing TDP into over-temperature thermal limit
> > > on Milk-V Mars CM SoM.
> > >
> > > Whether or not JH7110S is a new compatible should follow precedence in
> > > Linux development. JH-7110S is evidently the same tape-out as JH-7110 and
> > > however you deal with that in Linux is the appropriate way to deal with that
> > > here. Selection of OPP table for correct operation will be determined by
> > > bootloader, where, it is demonstrated by patch series sent to U-Boot
> > > upstream to be selected ** per-board ** based on EEPROM content as if it
> > > was any other JH-7110 board deciding dts based on EEPROM content. Given
> > > that it is the same tape-out I do not find a valid justification for a new
> > > compatible in the stack of adjacent software besides going along with some
> > > kind of marketing-driven answer about whether or not this is a new SoC.
> > >
> > > What I care about now is that the VisionFive 2 Lite series is in good enough
> > > shape and there's a possibility to act on this months-old suggestion to split out
> > > the OPP tables which as we have confirmed the JH7110S is the same SoC as
> > > JH7110 it makes a lot of sense to do.
> > >
> > > How is it supposed to work for binned silicon in Linux?
> >
> > Hi, Conor,  Emil,
> >
> > What do you think about this? Hope to hear from you.
>
> Can someone just give me a yes/no question out of this thread? I'm not
> really immediately sure what's being asked of me. What exactly do you
> want to do with the opp-tables? "Split out" isn't super clear. Does that
> mean into board files? I am guessing it does, since you're saying that a
> particular board cannot support the 1.5 GHz mode. It's not unusual
> though to use delete node for unsupported opp-table entries, could that
> be done instead?

Yes, as far as I can tell we should be able to just add the board description
like this:

 jh7110.dtsi               # JH7110 SoC description
 |- jh7110-common.dtsi     # Peripherals common to all JH7110 boards
    |- jh7110-starfive-visionfive-2.dtsi # Peripherals common to VF2 boards
    |  |- <VF2 boards>     # Final VF2 board descriptions
    |- jh7110-milkv-marscm.dtsi # Peripherals common to Mars CM boards
    |  |- <Mars CM boards> # Final Mars CM board descriptions
    |- <other boards>      # Other JH7110 board descriptions
+   |- jh7110-starfive-visionfive-2-lite.dts

and have it do

&cpu_opp {
    /delete-node/ opp-375000000;
    /delete-node/ opp-500000000;
    /delete-node/ opp-750000000;
    /delete-node/ opp-1500000000;

    opp-312500000 {
        opp-hz = /bits/ 64 <312500000>;
        opp-microvolt = <800000>;
    };
    opp-417000000 {
        opp-hz = /bits/ 64 <417000000>;
        opp-microvolt = <800000>;
    };
    opp-625000000 {
        opp-hz = /bits/ 64 <625000000>;
        opp-microvolt = <800000>;
    };
    opp-1250000000 {
        opp-hz = /bits/ 64 <1250000000>;
        opp-microvolt = <1000000>;
    };
};

This seems to be the minimal amount of changes needed. I looked through the
latest OpenSBI and it does match "starfive,jh7110s", but it treats it exactly
the same as "starfive,jh7110" and Hal have not really given any other reason
we'd need new compatible strings.

E: I know this doesn't split out the opp table like you suggested, but I think
that can come later if needed. Let's just start with the minimal amount of
changes to get the VF2 Lite supported.

Hal: Do you think this could work? You might need a patch to move some mmc
properties out of jh7110-common.dtsi

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
