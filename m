Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9B4EEF314
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 07:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iRyI3j5t/Y+iBFcnZlSlL2l6BQbMspxse159YeG2Kts=; b=3L5pAeHG5fOrfJ
	Sb0zpoCHKi+uTdDA4Tffl4plH13kz/hVXNMXLfJpPgv/PjMWKBXeP+VLfV2RTEYeXHOZLcnD6SJ3E
	sZeAHDyw0e4w84ZZCndauzoIEDMMVvd4d7Pn1CVYoOB5jh+gYmiLO8o/y/KrKzHahr9nVNcGtdibI
	pAl9VQJ5YifrmHdmqL45l67cDtqz9PxuPkICaOM/iD4pHChTnKi/WzluU2VrSsbnh5Ln4Nj2pxjgk
	JKspFvufIWKNTYUdToNDQf2Yal/e0kHmkiRj7OBobC0suOtifFLt2qU3hgQ2gPq6TRwWAnWthLtiD
	J+W6DtMon78xgLqQhnZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3Ou-000000016kk-0P0B;
	Thu, 05 Mar 2026 07:45:40 +0000
Received: from mail-vk1-f177.google.com ([209.85.221.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3Or-000000016iy-3PPQ
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 07:45:38 +0000
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56a981f44c9so3421894e0c.2
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 23:45:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772696736; x=1773301536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLWXJFRzKXYfvRWexgs1gCb/dTgnevi1M5AetCjur0g=;
        b=DrLN5sHC2wo8n3UMSZ8qYeoHhQ2YWq47va5FoZQHXoMyA20tFcj14XdmktOOfm/atr
         Gao/Gg4WL15A9FFOeaYzpEx8Y71FnwFUR9VzlVbijXGCZ2L5nHtqCKF9Jm6IyiWbqD/c
         tDr54PVuFEVTYSSkc+W9qmJery3OshOZXudFeD4QFfL/w6axU8GOBVeimREcsI3gEyMP
         tkxarCgQheXBgnzcJnUB2PHEQ42V/zz5IAs6rn6w6Z4BUNBnfZdOUeDpex/6PlEAo46v
         z05TNzjy23Nkzsjp+Rf4qXSZ1tzj/3nMaGRgn6kTSblbMhHSyER3XY1XFfkNmvrM5Jue
         Z4Iw==
X-Forwarded-Encrypted: i=1; AJvYcCWo3uIRi9s9MGnfIwk8kptd16QLAzrQd2E1t+CDMXZdNfmj2jolJDxsFlp3KpYQqVDx+SdCeFFVvmz5kg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwoJ7Qn3dNqcns3bm8TcUvLD1erEH/eZZ90wKPGX3DuIMhBK3Sw
	D3BBNkEPt4O02wHxC+mP5Ap+hHiZYzblZq96M/u60WuAw/XV9Wn/Ui9CVFeXICbQ
X-Gm-Gg: ATEYQzyp6XD77ox0OY48XZEzbvPgA2W3I0Ck7F6M+UAH1obsx1nrJSvaYcL3ZiB89qF
	RJ4rX9g9jUJ2qX/ov74X+QzrNbl0zSHKp7ztT/EjpBxHkP6NvrsmZI2CtxQRbDHVCZmDeI/L2l8
	vl0t89kPJFa6F/IBMPtCvYKxriA3t9fZnfJJyw/GBYAc/PxxmeRfQY43PZ+4IaIynGNnz+VFhlT
	HTBJXu7LGbNXBI5T+UUdQygT9dyA+rLOkwITW/5cpeFDw+rEfR3e8mZjztpg4TwgLxgHpHSf8j2
	baCirmKmMwbDh78wDj8qocJGkGfTMzrEaKOgjIR3ABsp9S2mjOViDh2CZSJXcv7GV3zcXDX/Z/k
	Vke1pHlhlNfs7hrTzjtY+u3iEr44D+ALWJltdWA3jUr9a4h6ixv/Tp06PBrELwEY/UsMeZcYsJ6
	aWIc05ozjs9KNkzoKl+q+254E8gSx0z7dVYAXq4K7aHHUSksr1tSKrHgDBNnsIgbSHTDMDIUk=
X-Received: by 2002:a05:6122:400b:b0:566:357b:ef25 with SMTP id 71dfb90a1353d-56ae77b2a57mr2160319e0c.15.1772696736198;
        Wed, 04 Mar 2026 23:45:36 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ae7d37498sm4875661e0c.9.2026.03.04.23.45.34
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 23:45:35 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5ffc1e25d6cso256849137.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 23:45:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVkGjX/+lxfPFkKfJNyRot+mldMCTCGjJq6m3DOy6wjG1KLaizOGk56GHgFptYA+n9X7hoiZWb2Kx6yJw==@lists.infradead.org
X-Received: by 2002:a05:6102:441c:b0:5f9:3a22:85a2 with SMTP id
 ada2fe7eead31-5ffaac72675mr2059267137.12.1772696734612; Wed, 04 Mar 2026
 23:45:34 -0800 (PST)
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-6-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-6-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 08:45:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXA67BO8Umz8-4jRg1SLvtZUSEzK0p7WxSvomnBk+WiyA@mail.gmail.com>
X-Gm-Features: AaiRm52ziEM93YxO07h7pOV0rTYZnULijxTOwLRm9EW_k_lOxLulmwK4PITV2jw
Message-ID: <CAMuHMdXA67BO8Umz8-4jRg1SLvtZUSEzK0p7WxSvomnBk+WiyA@mail.gmail.com>
Subject: Re: [PATCH phy-next 05/22] phy: add <linux/pm_runtime.h> where missing
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_234537_863017_C5891B7E 
X-CRM114-Status: GOOD (  18.81  )
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

On Wed, 4 Mar 2026 at 19:00, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> It appears that the phy-mapphone-mdm6600, phy-qcom-snps-femto-v2,
> phy-rcar-gen3-pcie, r8a779f0-ether-serdes and phy-rockchip-typec drivers
> call runtime PM operations without including the proper header.
>
> This was provided by <linux/phy/phy.h> but no function exported by this
> header directly needs it. So we need to drop it from there, and fix up
> drivers that used to depend on that.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

>  drivers/phy/renesas/phy-rcar-gen3-pcie.c       | 1 +
>  drivers/phy/renesas/r8a779f0-ether-serdes.c    | 1 +

For the Renesas parts:
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
