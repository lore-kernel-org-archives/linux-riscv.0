Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09711CCFA1A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Nov 2025 13:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4rs15KhwMT+z9k4vsZc5T1ZGpauyuRmiFFDq+RO6BeI=; b=lF9YdaMcDYbwqp
	jRTtTCVT6B+fWkJx2nLmf/OEi+rdspdDF3mzk4Wfx7YQJB8gYLMKjPMk0Z0WaOJ25orNYPow6vxBL
	F1RaFhJDjpcrpoJ+ioQwmoGN3A5oISCYw83BDx3l2Sur0wgTgPrxtbMcv/NtOBEWXRZ3mf/TxmUas
	sh+bReRNNnrJCxeVltAa1p7hAbMjV3UhW22OgDTdaHwTxhPzHv6HmgVSqR4KKbP8lw7a0y8200tBn
	9VcB97JuQrZWsFkYiyL56dt2xzNpuN53ADhsnscOW/brm89OLlS5MZNJiokXPcE+FqdDG7/0yKiFl
	ivFC/xSZ7tw3BIYJQ7Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBIi-00000008sHm-1xZ6;
	Wed, 12 Nov 2025 13:54:20 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBIe-00000008sHD-3Ah6
	for linux-riscv@lists.infradead.org;
	Wed, 12 Nov 2025 13:54:18 +0000
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 72CD23FE53
	for <linux-riscv@lists.infradead.org>; Wed, 12 Nov 2025 13:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1762955653;
	bh=zw6ziSjkzQiRWUig0BOelMJ1uVjsDF/5GnnR77Yu8HA=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=hsdpXgJMAydUIOB7t7ofMm1qDz0A5vu797vtyyMnP2jp4IsYK4e341ND/8beHfh38
	 hUi7/UpnjGORgczQdqNjPWInsVsQz0YlqcPxcDxkV+rklq4A54dsKca2wIQijmsGuB
	 QST2DEYeq0AiR0vTh/ODHvoA2jxzDIzCohys3fmmpiJfw96yoecfghKxNp/8g38IYv
	 KFegDqO7rXryAXIPpzHIq2akrWGcNHSo68DNQdHASUq35uQ4leuQekv6Oa+Pr+sto2
	 Q3xpB2sjnGzHM6AFEoPDACFxld1ritDzMYIgrlDawC5v6mtGErKffmBbQVfPKkRXmA
	 JBjCgPCmii7EtCkxqa0gH8UCPuRmbliAQIpC+FOcvdpCqS/QIvoLBdJQVbHXRuhvTE
	 cn/48DlIVtVQ9Xu/OxWAoJEqoQTzU7KQo/7OQLgtu3F26DJgoQ/J9QWrsgAR03hciX
	 hQsT1jsVvwuE4PmwcPh2Mp2DOIqj/OGjEWwPILcj5PEanzqtBl21DFxChzQgd9eOWB
	 land2u42aClQ/SnDYcaUFTvhC6rCyZS4Wo+v4Z2qrka5PpkeExWXzsHg+hx0+m5kgr
	 i+rZaI86Z49rt9z759t2RPLez1Rzi/VmQlX3ZK6OG7PpmBEL5VOUKqXIEsa34hVB9k
	 ytBM1dBENuv8wFMyM+Pwncq8=
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b7336ad128cso64074066b.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Nov 2025 05:54:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762955652; x=1763560452;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zw6ziSjkzQiRWUig0BOelMJ1uVjsDF/5GnnR77Yu8HA=;
        b=RI8QKxsstsZle+2yYPLQxxuERsKc9L2fdtDU/+kyYCPcYDlMEmIxro/uzAXZ64DVL2
         j1IPjNPm98mNHPTAhUTSKp6LYCpB7vbOQwY2Nx1k2ofpxASNL+kRmWT2FXWiIwCT+Dyw
         Ti2pefs8LpA8tdbxNUfEFAwm6dEJhZZpSOwo5sS0oNm8Hli+9HQRwC403vKtjsXZrLiG
         DjggLLtTXZQ81WszEHwCmfdu7JRTDFTwIL/LlfP0WzlMBJaXHwwYtU+6riyTWxTB+LZY
         BkgN4TEuOEAyEw3HwpyuiYRjUXcNUaqKErMZ0LuWW2tg5SHFk6obfaddkbzQsb+Fn2da
         /ufw==
X-Forwarded-Encrypted: i=1; AJvYcCWwXl4oUnQZS7A/rqz8uCz5Sfgw+DXl7W4hC4UNJSvoTY6kZFL837Or2OVz8E8DEkvnNTxrnFG5O4Wl7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyErxmjcwntOqoGdwZ44r48p6JfsnIYPhIG3p7/eoCgSrkAotmE
	ix+X9M4qGFV/7P8Ue5rPgTZbMb8rmxmi2n1ho+E8URdakJYod8pzHxyq7lUS+TcrGOpa4lF3ZwT
	Apo4Cc35OgRky2ydMJ4xW3deUDzXqf8BC9B52S8OgFYcO/t7ofYeFGjFedX+GbJnkTPYZdx4uyf
	igM3vlwDLkoiwuxPgodTDyMI0Lu/u4ELgsNaO3g4Wo87CjtpzOW+U5C3ur3JVH
X-Gm-Gg: ASbGnctgoAhtkMRYmNj54QDXffI4d+BYWomQxaUsiNtdBFXwShCPXfMc8snzWleXfVc
	qCeFemT3isM0Rtm0nW6FN+8GMg6UNOxhC/vwaF38D5n0fPy/piiWFyEdEQBB2/VtLjxSnDBqh69
	PrLTi0CQG6FKBf2BhhHTMwgK6UWMdbgyS6uTYXdBJSSFLN7ebgbrZeWkIqsXrSN8oqPiwafSiu2
	d9l9gKaKz7h
X-Received: by 2002:a17:907:3f0b:b0:b72:599:5385 with SMTP id a640c23a62f3a-b7331aed080mr274452466b.61.1762955651986;
        Wed, 12 Nov 2025 05:54:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHASu3IyWs8sdfwZaJ3pNAVG0SXfiJ1YnPjXsl7ym/EOc9nMzNozT0R3ShCHNy28iULSDnVopmBypGnnGPw+tE=
X-Received: by 2002:a17:907:3f0b:b0:b72:599:5385 with SMTP id
 a640c23a62f3a-b7331aed080mr274448466b.61.1762955651487; Wed, 12 Nov 2025
 05:54:11 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Nov 2025 05:54:10 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Nov 2025 05:54:09 -0800
MIME-Version: 1.0
In-Reply-To: <20251107095530.114775-1-hal.feng@starfivetech.com>
References: <20251107095530.114775-1-hal.feng@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Wed, 12 Nov 2025 05:54:09 -0800
X-Gm-Features: AWmQ_bkCo556C5q4g3w_mabHlgyG7zuhHtzy3L72tGDQo2o37ahEt_qsjrthSBY
Message-ID: <CAJM55Z_rczBo4D3HsC90QW1=fp3NWgK-tsEo6LHTZNXEBHTDqA@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_055417_208862_6DBB00ED 
X-CRM114-Status: GOOD (  12.08  )
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

Quoting Hal Feng (2025-11-07 10:55:22)
> VisionFive 2 Lite is a mini SBC based on the StarFive JH7110S industrial
> SoC which can run at -40~85 degrees centigrade and up to 1.25GHz.
>
> Board features:
> - JH7110S SoC
> - 4/8 GiB LPDDR4 DRAM
> - AXP15060 PMIC
> - 40 pin GPIO header
> - 1x USB 3.0 host port
> - 3x USB 2.0 host port
> - 1x M.2 M-Key (size: 2242)
> - 1x MicroSD slot (optional non-removable 64GiB eMMC)
> - 1x QSPI Flash
> - 1x I2C EEPROM
> - 1x 1Gbps Ethernet port
> - SDIO-based Wi-Fi & UART-based Bluetooth
> - 1x HDMI port
> - 1x 2-lane DSI
> - 1x 2-lane CSI
>
> VisionFive 2 Lite schematics: https://doc-en.rvspace.org/VisionFive2Lite/PDF/VF2_LITE_V1.10_TF_20250818_SCH.pdf
> VisionFive 2 Lite Quick Start Guide: https://doc-en.rvspace.org/VisionFive2Lite/VisionFive2LiteQSG/index.html
> More documents: https://doc-en.rvspace.org/Doc_Center/visionfive_2_lite.html


Hi Hal,

Currently the JH7110 device trees are layed out like this, with a nice
separation between the SoC description and board descriptions:

jh7110.dtsi               # JH7110 SoC description
|- jh7110-common.dtsi     # Peripherals common to all JH7110 boards
   |- jh7110-starfive-visionfive-2.dtsi # Peripherals common to VF2 boards
   |  |- <VF2 boards>     # Final VF2 board descriptions
   |- jh7110-milkv-marscm.dtsi # Peripherals common to Mars CM boards
   |  |- <Mars CM boards> # Final Mars CM board descriptions
   |- <other boards>      # Other JH7110 board descriptions

With this series it moves to

jh711x.dtsi
|- jh711x-common.dtsi
   |- jh7110-common.dtsi
   |  |- <jh7110 boards>
   |- jh7110s-common.dtsi
      |- <jh7110s boards>

..which I can't even give clear labels like above. In other words when new
patches are sent in it would not be easy to explain exactly where each change
should go and why.
I'm also worried that you'll find that more of the peripherals on the JH7110S
need special handling and a new jh7110s-... compatible string. Then I guess
they'll need to jump from jh7110x.dtsi two levels down to jh7110{,s}-common.dtsi
which then both describe SoC and board properties.

If you're serious about calling this a new SoC then I'd expect something more
like this:

jh711x.dtsi                  # Peripherals common to both SoCs
|- jh7110.dtsi               # JH7110 SoC description
|  |- jh7110-common.dtsi     # Peripherals common to all JH7110 boards
|     |- jh7110-starfive-visionfive-2.dtsi # Peripherals common to VF2 boards
|     |  |- <VF2 boards>     # Final VF2 board descriptions
|     |- jh7110-milkv-marscm.dtsi # Peripherals common to Mars CM boards
|     |  |- <Mars CM boards> # Final Mars CM board descriptions
|     |- <other boards>      # Other JH7110 board descriptions
|- jh7110s.dtsi              # JH7110S SoC description
   |- jh7110s-common.dtsi    # Peripherals common to all JH7110S boards
      |- <JH7110S boards>    # Final JH7110S board descriptions

I know this will mean some duplication in jh7110{,s}-common.dtsi, but I would
prefer that to not having a clear explanation of what each file describes.

Do you think this layout could work for you?

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
