Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CF2606A328
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 08:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xc+eJoF2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HgufCoFdhmYYQ/MCnuBliVcTnh5xeTwzfwYHmGLfFrg=; b=Xc+eJoF2/9e9UAhgd9emKacsao
	UidRKkFEv4Hj5gZGZr0zOS2RvC8p+hfpZBsTuKhhAaDDXCNlIcQKYkZlWyzfm1Q53BmNcuyl9nIqI
	EuZ6uafaZN0zVJRtPaC8POIdhRkxtRdF/HK2Nx+elAh2nvrJL5qZdFE7zTEaAqBMCz1geBeGT4ejr
	4H+1mZ8RPI4X4nUI9X0/qlcI2F/ugArUlQekuDg7sGaWRoKThwL0QY0NO4nSzEgY/WfTernDhLtdT
	lYrB44MfMM8Oq9HTn5c/WvNuPz5SeWZSzyYsbHLwRLcS4LEEYCVpj8FFanwJKYlR7WEZUy60tcwLo
	JLG7icdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWPg-00000004iIU-1TqE;
	Wed, 04 Nov 2026 08:32:08 +0000
Received: from mail-vs1-f47.google.com ([209.85.217.47])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWPd-00000004iFs-2jhD
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 08:32:06 +0000
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-78fb1fb9508so1099555137.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2026 00:32:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781124; x=1794385924;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+jPqoNXEpA+7+FIrz6APb9I5eEcoubqwAjkLbTZnqws=;
        b=vMJeaed0ZAzU8koUTKjZ+WGZGPgN7JCzz8LMFXP94iOU4yDJKr3EbEC1yHaARl+ZIU
         V3iaKQY+DLqnZ+gm11s842RYkp/7Y5JzaEH1y/abY8f+9jxCHK//hTjqpDEjeQJa3TCH
         AtiYwRKR5qln605XnCMKxGAgZKWUSt11gcrF4oQZaPUg3sbGe9AJMjc2twehgKjl8Ine
         MDbcCEeOfWx5YbJ+EibStOjKg7M3bi8BoqXKSqxU6FOH1X2YpH0Dng7ZIT8uTSkLNIbl
         EPAxGzLk3QdiBYgXodWdIVvN3y+7pucPqp9gRIg2cqs2AHSLuTXYlPiJu5G/r9TfYgin
         IWLw==
X-Forwarded-Encrypted: i=1; AKwUvBwU6An+8cyvI0EF3F3ZtPZWLCl2Cxs8gKdS0YoTlNIlTy29DuKDhMibecWCLtdbJ5fGSrGbUfSzvlS3kg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9CPx3Tlw8mWXUCPI86LIGP9FpGY0wx+TsyO4NtryFf1/aT1Nmd
	nfSG8yNmrfoPkNcD+9aPwPSoO+ojTKIMSzSp/8a13uOPHnlmzeeyTevEWWIniOUS
X-Gm-Gg: AYBFou0gYp3qlxbjWmujWTBf1NsxCLmdt4p5lCWKfqDc9QZBuGKOV5IeD2p/ECoZwNy
	6clmJsvjGO86uTPURk7aEYJ6cTyZmXINEccKTbu3rrmY9x2bfiuVgfbANDjp6lZODHeanott/E+
	WL6UVN0YadDejfpNbthoAnSV+T4290t9kko2p1BH4kCKbglyLkcLIHslrCX4e9h7aP9Fb2j2eaG
	tx/SQcvwBXCWs0TBFhknSanU24OA/6CfbfpVA37AfjAG3T/QUUWE1OtxprZHDEifkZl8sQJmLYL
	v/pQ2K8ZKQcOar3hmgNtH4HCfvH4WTb+w1Dg6Pnse2xRLFJQPa9gqhXnsnTsdEsQrNL9/qkviK2
	ng3MGhyo/+BcYbiZsNysPfx0bAvULAr3CRkcg+0ZkjeBY97An5XAsO0WZSo95562oZLtm9zNXfZ
	3yvhatZXFGlCBNW4tx2qIeAG+7YlXz9CGf4gY1Mx8HZ6Bn54RtCAujfXUaQYAoxA/A+ShZ1fPUS
	6lDLRm3AeTLe/+AedxZYm42ZgXiA40Z2DJ+xlaWMprnCpPgFr8QZxxBBD/g6zCIW8jyRJjkAspX
	5QTcpEC4bCo9IEpL7CpnYNjEMsFrtsFyWJkLlp1YGaEKJc16HnLzDK1Gp4TxHCIwrA==
X-Received: by 2002:a05:6102:2907:b0:7c2:e5bb:d20c with SMTP id ada2fe7eead31-7d05433455fmr5577971137.34.1793781124174;
        Wed, 04 Nov 2026 00:32:04 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8d7780fsm1128554e0c.3.2026.11.04.00.32.03
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:32:03 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-78fb1fb9508so1099541137.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2026 00:32:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxdxzd9UzSxJUGkTwir2jXS+uxF/N3cUpe0qdQ8dyjmekdaDH1h7+cUB4TJ2WwP1TxOWM72AI8fPHrtEA==@lists.infradead.org
X-Received: by 2002:a05:6102:c09:b0:7b2:becd:1179 with SMTP id
 ada2fe7eead31-7d0543be60emr5897841137.44.1793781122974; Wed, 04 Nov 2026
 00:32:02 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-reset-regmap-test-bits-v1-0-1b33607a76b0@pengutronix.de> <20261103-reset-regmap-test-bits-v1-6-1b33607a76b0@pengutronix.de>
In-Reply-To: <20261103-reset-regmap-test-bits-v1-6-1b33607a76b0@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Nov 2026 09:31:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWSrMTXbXVuo9tQqMKnOLXe3=7oWyJRGkvRBZjBBm3nxg@mail.gmail.com>
X-Gm-Features: AclHuK-YthVrpSjlZVBQt5vi6FrwMySVDZUmcMVvViznIkVXiwSHbJqQx6qRLRM
Message-ID: <CAMuHMdWSrMTXbXVuo9tQqMKnOLXe3=7oWyJRGkvRBZjBBm3nxg@mail.gmail.com>
Subject: Re: [PATCH 6/8] reset: rzv2h-usb2phy: Use regmap_test_bits in rzv2h_usbphy_reset_status
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Damien Le Moal <dlemoal@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_003205_686589_509FB74B 
X-CRM114-Status: GOOD (  14.12  )
X-Spam-Score: -1.6 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Philipp,

On Tue, 3 Nov 2026 at 15:52, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> Simplify rzv2h_usbphy_reset_status() by using regmap_test_bits().
> No functional change.

Now propagates errors.

>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

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
