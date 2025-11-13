Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862BCCD5BC1
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 10:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Lz/yuCpTiqNH2QuDjMJHEOztwgw1+Gstf3hhjRAumU=; b=PRl6R1EL4ivIU9
	T/jJQ1TpDBtpN40/1bhiIULzgjRrL3r84K6d+DH5ExX/SSaaWt0J9Ps55r+xO5nU7cOX22ZnTzErk
	u7Eab40Jl1BYjuMe2OAp0896Kx8sYwbGgDa5Ij3ZpPBZFzspaV3vTd/1Ks7fzUEX6EiDrT0Ft4r2T
	4Cqce7JhQu4cxVZ2p2YuSskqfJZvXLsHPJEtYNNFSgpr7LQUr0lqhXFRZ2d3qkV3icXwjs3oZP7oo
	ee21aLUv7kxTH45feYRyaFpEVkZmcE0Nd/DOBdRHNTzJHYcseVBtym7PSEdtwbXL0S9Ld04sG6tuL
	BgbPoZfgs58NTXqgHm4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUmh-0000000AIyF-0cpw;
	Thu, 13 Nov 2025 10:42:35 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUme-0000000AIxp-2zm6
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 10:42:34 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4ADBB40254
	for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 10:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1763030548;
	bh=WaWROQhILaIk4AODRxLJvdFvDxUCFVP6Fxty2SkZyI4=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=YgRcZuLm86cfnKM7UX2EDXrfVXVcH1g7Mf8TnnZtarKdu91czDC6BrbC3vYLgRRBM
	 VyLumaupXBK1Uk/2VGv8993+5Y/RGuN/5BFUp0dOhf+S4lEHIN9ku8GjBD2tRDGrG4
	 TCJj0QgRG7WKIcMzKaZhf0YYhWhtMFlh2pqcbPqMoo3dgplzXKBcmuLfNm3mI0jF2W
	 PBgw0rnGSysHsT5sLzllM3U4Y9BYpLjjLRf5AxjjCadjKyS+84AGVuE1i2pvOSY0+C
	 qcaTmiQKywpplVhHdBrsKu0W/GkM1bOOJ0Wyx2hd450k9VLIghw1gsYnFx8Gs9Jx+4
	 V1melovOopT6Te1FMo+IZALYEgsLSfCFeRuKU7vRFcdbBe5t85DEoRcXUFCsG7niPJ
	 oPtQG6hlmpmhV9YPDsUIpY/W/Mk7z/WBBQbnYYKfRRcD4aGaLC5Kd3gD0VNhmQunIt
	 HuZnLFItLu/9zgO12WTZgdx09CSDVu4c6j9+6d5d+NKHCg+lOKxFa7OXojLQfknTKQ
	 u5syzlvV4wEdIG3AsYCGnwd1Yg/jiEGKNbV3yHO/B/pgIPNUbVggOyFqrXwLXN+XGt
	 oU7qzDJRUtYZezsomLqD5RI5Sc3VklJXSwv7LpxN32c2BYTPDzOaIz9oI++HojWsgL
	 wuwmwZwYUO6oKa3j1HTYpMVU=
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b70b21e6cdbso93408566b.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 02:42:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763030547; x=1763635347;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WaWROQhILaIk4AODRxLJvdFvDxUCFVP6Fxty2SkZyI4=;
        b=r26SXTsxBclCyEmIV4VaSx4mUy70NGpXOiY0/DShFLzsVEZ8pIMPlhdAG/WbjfRF9h
         wv46YlvpucnnsY7KAutBzF6rzMMt1vMyPjrS7u96ezWFvhfU62+gO2lROlvF/82atneS
         EgIzV/th6p0SJ9u+XhUhXIf82nZLDDY8Ax9i59WL6INPb6uvIQVYrFS7edJzyOHpNG2u
         k9/kdPk2bzDrDJe2YFq1WvQgKpbGJvO4ltnOtxambIBPWcb0fgnTwlnC+ATB83dzcXuB
         Tqr92mAv765ct2rEgDo0k4iNaf5dHcxDFeZyn2i8Sv7+zIORkxU82Z9/w2FxSLNsdb+0
         U8dA==
X-Forwarded-Encrypted: i=1; AJvYcCXosO+Of4mv/3/5stj7fIhxg3V8YKPbHZaAYULUgLGLwsUZbLl17tGg0PIArnAZKDwZXJXDv98CKd76Ug==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKgXePbe7lMajJTayWmdofjXWeK3FkEAtAl6dBLtdb8MocpZ+6
	XgxRO8cS9FI7BBMr1wRrs5yai340VPd/gA5x5S/jjv85F54jpOK9TFP5oCzK+KtN4G9S5QWdO0b
	E3JtcDJsfT0k5HbiDJZA2LtSxzNcuNerhKJM+AAUINYsOKAFkWwBtyQkyjcMUM4FmROSZx8tlKD
	WYuyacJKI2T6xLUWiuE/iTz66k0a4m278H1rNKf+bjjLALGA8LTyQwJWeUFQtu
X-Gm-Gg: ASbGnctW/6fJaToV+/xKhd4iDHwxIv4JfX7wF9oAejSJLyom604RtI0Qn0nDv2M3sBY
	bdZhhx7sqnK1h/y8w1G2VDlYHt5+sjaegWPGumeEvLuiPqszovhXACbJnrfPZP3ACV78+9f69RQ
	A87t5S7jZSYroPzCch+X2dcDcPatbhFW6O99pd/5hqa0b4HyRgM3842A==
X-Received: by 2002:a17:907:3e1f:b0:b72:b7cd:f59e with SMTP id a640c23a62f3a-b7348087148mr254967566b.8.1763030547562;
        Thu, 13 Nov 2025 02:42:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTJg98+9M8c886tFyGLEzoK9vA4EcA/KrEpft00B6n0vwqztesDMLxb4eNFEPEpnVvcr/HOe2M0PsqZg0bCHc=
X-Received: by 2002:a17:907:3e1f:b0:b72:b7cd:f59e with SMTP id
 a640c23a62f3a-b7348087148mr254965466b.8.1763030547147; Thu, 13 Nov 2025
 02:42:27 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Nov 2025 02:42:26 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Nov 2025 02:42:26 -0800
MIME-Version: 1.0
In-Reply-To: <ZQ2PR01MB13076544E2136E7E7C2EEDA1E6CD2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20251107095530.114775-1-hal.feng@starfivetech.com>
 <CAJM55Z_rczBo4D3HsC90QW1=fp3NWgK-tsEo6LHTZNXEBHTDqA@mail.gmail.com> <ZQ2PR01MB13076544E2136E7E7C2EEDA1E6CD2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Thu, 13 Nov 2025 02:42:26 -0800
X-Gm-Features: AWmQ_blOZ9S9m9Ve_xD05iTkInH_Tetx_kG4fJGOm32UTmonVLiTkEgBwiVrXdU
Message-ID: <CAJM55Z9KyNK1n4i9FxbLor4HTQKqK8WKA2svjPVvKXihw_E+sg@mail.gmail.com>
Subject: RE: [PATCH v2 0/8] Add support for StarFive VisionFive 2 Lite board
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
X-CRM114-CacheID: sfid-20251113_024233_100850_9CAC313A 
X-CRM114-Status: GOOD (  23.30  )
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

Quoting Hal Feng (2025-11-13 04:42:05)
> > On 12.11.25 21:54, Emil Renner Berthing wrote:
> > Quoting Hal Feng (2025-11-07 10:55:22)
> > > VisionFive 2 Lite is a mini SBC based on the StarFive JH7110S
> > > industrial SoC which can run at -40~85 degrees centigrade and up to
> > > 1.25GHz.
[...]
> > Currently the JH7110 device trees are layed out like this, with a nice separation
> > between the SoC description and board descriptions:
> >
> > jh7110.dtsi               # JH7110 SoC description
> > |- jh7110-common.dtsi     # Peripherals common to all JH7110 boards
> >    |- jh7110-starfive-visionfive-2.dtsi # Peripherals common to VF2 boards
> >    |  |- <VF2 boards>     # Final VF2 board descriptions
> >    |- jh7110-milkv-marscm.dtsi # Peripherals common to Mars CM boards
> >    |  |- <Mars CM boards> # Final Mars CM board descriptions
> >    |- <other boards>      # Other JH7110 board descriptions
> >
> > With this series it moves to
> >
> > jh711x.dtsi
> > |- jh711x-common.dtsi
> >    |- jh7110-common.dtsi
> >    |  |- <jh7110 boards>
> >    |- jh7110s-common.dtsi
> >       |- <jh7110s boards>
> >
> > ..which I can't even give clear labels like above. In other words when new
> > patches are sent in it would not be easy to explain exactly where each change
> > should go and why.
> > I'm also worried that you'll find that more of the peripherals on the JH7110S
> > need special handling and a new jh7110s-... compatible string. Then I guess
> > they'll need to jump from jh7110x.dtsi two levels down to jh7110{,s}-
> > common.dtsi which then both describe SoC and board properties.
> >
> > If you're serious about calling this a new SoC then I'd expect something more
> > like this:
> >
> > jh711x.dtsi                  # Peripherals common to both SoCs
> > |- jh7110.dtsi               # JH7110 SoC description
> > |  |- jh7110-common.dtsi     # Peripherals common to all JH7110 boards
> > |     |- jh7110-starfive-visionfive-2.dtsi # Peripherals common to VF2 boards
> > |     |  |- <VF2 boards>     # Final VF2 board descriptions
> > |     |- jh7110-milkv-marscm.dtsi # Peripherals common to Mars CM boards
> > |     |  |- <Mars CM boards> # Final Mars CM board descriptions
> > |     |- <other boards>      # Other JH7110 board descriptions
> > |- jh7110s.dtsi              # JH7110S SoC description
> >    |- jh7110s-common.dtsi    # Peripherals common to all JH7110S boards
> >       |- <JH7110S boards>    # Final JH7110S board descriptions
> >
> > I know this will mean some duplication in jh7110{,s}-common.dtsi, but I
> > would prefer that to not having a clear explanation of what each file describes.
> >
> > Do you think this layout could work for you?
>
> Yeah, it is clearer for developers and maintainers.
>
> Considering Conor's suggestion, what about:
>
> jh7110.dtsi               # JH7110 SoC description
> |- jh7110-common.dtsi     # Peripherals common to all JH7110 boards
>    |- jh7110-starfive-visionfive-2.dtsi # Peripherals common to VF2 boards
>    |  |- <VF2 boards>     # Final VF2 board descriptions
>    |- jh7110-milkv-marscm.dtsi # Peripherals common to Mars CM boards
>    |  |- <Mars CM boards> # Final Mars CM board descriptions
>    |- <other boards>      # Other JH7110 board descriptions
> |- <JH7110S boards>
>
> Move the opp table from jh7110.dtsi to jh7110-common.dtsi.
> Remove jh7110s-common.dtsi, because only one board uses JH7110S now.

This patchset adds 2 different boards. Has this changed?

Also this would mean that you're not using the starfive,jh7110s compatible or
any other starfive,jh7110s-.. compatible strings, so effectively you're not
treating it as a new chip, but just a board that needs a different opp table.

I see now that the opp table is effectively the only difference between the two
chips in this patchset, so if that's closer to reality then what you suggest is
fine with me.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
