Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51ECCC05027
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 08:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0judxXIDD7j1T59Nj5z9zflswY34ZenG/tgN74kpnTI=; b=pNKTfsFEhS5vEm
	lcRMB4PYoCS5Hqq6rbxKR19MNniHKSAtOv2flNDe4bSxElUBqQINN9C7QcoJ34MerGMzy+pFFRnKk
	i5Z6JD5zGn1YnlmO2RHedDHpNEsx14aUK8aq2TtLCVCk4gob5WgZgYf0F6KZE1KR1wIIVjxti1YKk
	rE7A2ct7qcY98CStDMIXmSKqhTtZNgmuU6D5XDYYz3sJCPBqiYto+IJU6Cdy1tYAmcrbFlFeab29l
	bYoqXMB5Ex9KAPjxGIJdTdSNnn7ixYX0kNQxLsMToY5YnLFc8k+/Iu6pSAx+j7N5GhC4A6QYcy3Ik
	xrHgek/AasJ3YgsgW7Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKxzp-00A7qC-T0; Thu, 26 Jan 2023 08:52:37 +0000
Received: from mail-qv1-f54.google.com ([209.85.219.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKxyJ-00A77z-Kq; Thu, 26 Jan 2023 08:51:06 +0000
Received: by mail-qv1-f54.google.com with SMTP id e19so968205qvw.13;
        Thu, 26 Jan 2023 00:50:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+8Yo/HtiEGSzYrRQZv+JkTOd1mtgjj1wSt54yjMvxXA=;
        b=dDpcMvdq530gEwru6c58ji+np1FvF3u/EQ0pIspKvxVsRyG51+vhcDLMLE7newut8q
         /tVyTIZuowmY2DN7FfZuGIO3suKTW4GNByV8p07KiRKzE2qA19dMeehLcTrlfCdct4M+
         EssE1TMxZCDWgUdRmbWIQAHueGFNIgSV1jSkF0wOjsqmbJKwnGH8T52WuAwGLMcphzI4
         PJwsizhLQduMl5cnPKqKdeIseL5fJTMoAaFVmwG1ILYfTg2yqgQON4RFG/qSeHGEkk7X
         F2zQUYJurAahFc+4MfiY35rJd13th6rSaQJ57O3ojTiNPq5n1AVsGx1p9xonvvl22RTn
         VmZw==
X-Gm-Message-State: AO0yUKVa9id6lpLR1rWaLFLIjS7ZjIjlyA5ayhHN8PsKwV2tKyT0Gp6H
	hfXKJ2mP3ZHKiC5c+qZBc2wxXG9VVAsqWw==
X-Google-Smtp-Source: AK7set8OeTB35ZabfsbMAuUBivY8MAS6VQHts9n5g5Tj+9i7J7l/0pWKh+KLyIVcgG6IkIuFL4zQmQ==
X-Received: by 2002:a0c:9e89:0:b0:537:9e59:3997 with SMTP id r9-20020a0c9e89000000b005379e593997mr808680qvd.51.1674723057994;
        Thu, 26 Jan 2023 00:50:57 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id 8-20020a05620a078800b0070383f1b6f1sm583076qka.31.2023.01.26.00.50.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 00:50:56 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id m199so1197547ybm.4;
        Thu, 26 Jan 2023 00:50:55 -0800 (PST)
X-Received: by 2002:a25:37d4:0:b0:80b:8602:f3fe with SMTP id
 e203-20020a2537d4000000b0080b8602f3femr1019227yba.36.1674723055416; Thu, 26
 Jan 2023 00:50:55 -0800 (PST)
MIME-Version: 1.0
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org> <20230124091916.45054-10-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230124091916.45054-10-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jan 2023 09:50:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXfD-G+SYQX5tJ8O-GSO3yTVL00xCX8A-Rc673zNkLbBw@mail.gmail.com>
Message-ID: <CAMuHMdXfD-G+SYQX5tJ8O-GSO3yTVL00xCX8A-Rc673zNkLbBw@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] dt-bindings: serial: example cleanup
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lubomir Rintel <lkundrak@v3.sk>, Vignesh Raghavendra <vigneshr@ti.com>, Michal Simek <michal.simek@xilinx.com>, 
	Chester Lin <clin@suse.com>, Fugang Duan <fugang.duan@nxp.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Pragnesh Patel <pragnesh.patel@sifive.com>, 
	Le Ray <erwan.leray@foss.st.com>, Peter Korsgaard <jacmet@sunsite.dk>, 
	Tomer Maimon <tmaimon77@gmail.com>, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_005103_770995_04EB12FD 
X-CRM114-Status: GOOD (  17.87  )
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

On Tue, Jan 24, 2023 at 10:20 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Adjust example DTS indentation to match recommended style of 4-spaces
> and use lower-case hex for address in reg.  No functional change.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

>  .../bindings/serial/renesas,em-uart.yaml      | 10 +++----
>  .../bindings/serial/renesas,hscif.yaml        | 26 +++++++++----------
>  .../bindings/serial/renesas,sci.yaml          | 24 ++++++++---------
>  .../bindings/serial/renesas,scif.yaml         | 24 ++++++++---------
>  .../bindings/serial/renesas,scifa.yaml        | 22 ++++++++--------
>  .../bindings/serial/renesas,scifb.yaml        | 12 ++++-----

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
