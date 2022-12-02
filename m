Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E474FC47088
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 18:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KtZG0psTMXk/9FxNK9MUpVygX6/7h15Gb8VpSLR181E=; b=AdsV9nC0/PD6p+
	PDRi1YFbGSGsU9SP1RJSvGiSVq0w0PFINFrZJ2KrLQMNVhHpB8mA2n9iiuo7L3F5TgDNe3FMcdrfU
	nO0mnqxGhjwJI5gSOpjpvNWGBhdkosYx7Jy5bEKLm2izyApprJiDKMs1vsyawILfisiP/ePvbHbcY
	9IlNEZAhwkIOsae1Ka7NW4Rve7F0gM6FUBgQsnk87rONHUWfq8roerhx+vxIvIfV4l4LCErbY4vbc
	DsVL6wR1jzWSbxdiwwH00t8mXSjpbi5P6kd5T9vms78904lM0q930y7eSGZsRxIQqOE5Tn18CF/tb
	WqMHXw+/AFt4kaGCCf9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1B8a-000lcA-NY; Fri, 02 Dec 2022 18:51:52 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1B8X-000lah-Ds
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 18:51:50 +0000
Received: by mail-pj1-x102e.google.com with SMTP id k2-20020a17090a4c8200b002187cce2f92so9123956pjh.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 10:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8NkylfJHLCaUWC39XJgY9uFoItTR1wh957VtzWUPeic=;
        b=M/k18vAPdtcWltp9pDSiYbad8lgtQr1R0YKRX2jnH3cxPxm6ocwcuKfwdg5XVcELJv
         JlLfNvS/nvrOspX8TJQRaRngl/Wwm/s3Nwx5ejOXOPah+lsH7W4OsTAN7bfGo4uGJy8V
         7yZBDfOkyYp5+nl4M3Ag2mqSi0qPm3n9AfDQfvquiX9DkVIJijd8gExWROMYbOdRW+b9
         BmHchqiTvRyQ/9AqSPcijGDWJgKXhi0/dpw53/HTqQwObaijYy49kgHQ9FyRgpX+hCK0
         X13GyrUK0IVNmd/UUK+3P4N42QM9ouB6HNo2nkKwmcd5JvhV1C+Xp67C9qiFLv+XIoyr
         MWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8NkylfJHLCaUWC39XJgY9uFoItTR1wh957VtzWUPeic=;
        b=Wffzw2G4GRJvXg3UOLAg8J2U49gmPgAujoaePix/BzStvw+It6rIay981wZEXDlvsC
         nXGnQ4tNDsUY1icWDi5VSoq3HEw6g97trxzCQrT9FbK8nRFuxqq/qctTfR9XwarJpxvU
         RDkMc8oQEBmFtCpu+p2uKFxNWcFUPEGN/ofa/qHyn6W4DPokWwGmkP+S8JRFcUiKGGVh
         F70irCrngLSDjhdq2xsSJ2NQftJPo5C8kj5V9z6ujTkm3Eix15BHdnF2DgKouAYYMdho
         xRmoKYtCkW3cMOiJ2YSYu0y8UG+XLwSWeE/A4qu0q0CJ6FULqgvKwrNM212NpClRaNDB
         walQ==
X-Gm-Message-State: ANoB5pnxIlAvSGsodxmz7gcoUTs6oytl+DXfoz2CcrlVumV7TMHIW+t8
	E07jgfDMSSEllI7ggs1G9VKxpQ==
X-Google-Smtp-Source: AA0mqf6JP8q5rl1k1s+siCcxvzud6ws7QpC/qtRAoo3H6tpms2/dGJP2mzE2MwC1SLB59/zBx+IvDw==
X-Received: by 2002:a17:902:7793:b0:189:24b3:c86 with SMTP id o19-20020a170902779300b0018924b30c86mr54056810pll.84.1670007107784;
        Fri, 02 Dec 2022 10:51:47 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id a14-20020a170902ecce00b00186b1bfbe79sm5937381plh.66.2022.12.02.10.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 10:51:47 -0800 (PST)
In-Reply-To: <20221118011714.70877-9-hal.feng@starfivetech.com>
References: <20221118011714.70877-1-hal.feng@starfivetech.com> <20221118011714.70877-9-hal.feng@starfivetech.com>
Subject: Re: [PATCH v2 8/8] RISC-V: defconfig: Enable CONFIG_SERIAL_8250_DW
Message-Id: <167000658679.29055.15185601584520551755.b4-ty@rivosinc.com>
Date: Fri, 02 Dec 2022 10:43:06 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
  linux-kernel@vger.kernel.org, Ben Dooks <ben.dooks@sifive.com>, Michael Turquette <mturquette@baylibre.com>,
  Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor@kernel.org>,
  Thomas Gleixner <tglx@linutronix.de>, Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>,
  Paul Walmsley <paul.walmsley@sifive.com>, Linus Walleij <linus.walleij@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
  Emil Renner Berthing <emil.renner.berthing@canonical.com>, Marc Zyngier <maz@kernel.org>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
  Hal Feng <hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_105149_481259_AB86BA41 
X-CRM114-Status: UNSURE (   6.64  )
X-CRM114-Notice: Please train this message.
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

On Fri, 18 Nov 2022 09:17:14 +0800, Hal Feng wrote:
> Add CONFIG_SERIAL_8250_DW=y, which is a necessary option for
> StarFive JH7110 and JH7100 SoCs to boot with serial ports.
> 
> 

Applied, thanks!

[8/8] RISC-V: defconfig: Enable CONFIG_SERIAL_8250_DW
      https://git.kernel.org/palmer/c/6925ba3d9b8c

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
