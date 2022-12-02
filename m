Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA2FC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 17:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=YOxVYMXkJmO7TrwLYzCgzbGQeBavMdZfb/GrcjKAlqk=; b=DMnaTZsapbKMfmuJbRwV2yb4Ei
	kquFolVHS4KczKMsPRSNg4YnjdDnhVlNAuiKdz5UqvC97jtOMO0ncfK1EFKjd6gmo1cmPF2YGDKYM
	0L5s9/nEEgISszYMkAwG1SB7kcUEK2LjdcP2SjVOpQFf/A+c7ssqgxBHo1TpyQt2BI3lJeQjhoth7
	GXQRwSzfXo92/+Pj0OZ69Nw2I6Z/89BHtY+USUUEVfRwUAqS3m+Uh4EVT6PoZaLnk25pkrGCrMmo1
	MA8PzqAh7WvdSCR9WRXW5f7QRfeacznXdB6NQLE6L3n/tRcbUdF8+rel6KbL9J7TRFi6xlxX495oO
	nIYq0+VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1AFS-000SWM-Q4; Fri, 02 Dec 2022 17:54:54 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1AFP-000SUl-VC
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 17:54:53 +0000
Received: by mail-pj1-x102d.google.com with SMTP id o5-20020a17090a678500b00218cd5a21c9so5801165pjj.4
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 09:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p1XzRn925Fp44O0w9G4cuwC3UNLrpIUG0nEwGRZQ/YU=;
        b=ERYRng/+2McDbTloeXnaVcbmZ19evhdUD98unc3RFkNiKkugoSGQlyyxPeMsjND8ub
         HeSzwVpd082dYV2tWVPad7nLVJrWTpkJw+g+McKgDwhlq78ELe3ui38zomaQNEDcWKv4
         qOTVAdq9+zlgKtcPcSMzJwLMLquS0wSSdMIgTjaI53pwm4n0LJ5zv4DhvQ8wYz0K0fDJ
         FuHKr6n6Pq0WuqSfPFxMuJSkj+zYEYiGAQy1tQNsOcxvib/qcjMMNoUDFJ/oKSDIaWdQ
         HMRfIzWSRnOLJvV1f4Iug0xOWkHS5yVc2HLbdvwHQVzsF2JYX8DGEgYZXWKQvj4zGhy/
         xlfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1XzRn925Fp44O0w9G4cuwC3UNLrpIUG0nEwGRZQ/YU=;
        b=u7EAOUiN3qP3Ucd1o9KGUeIxE2sZ11RtdgEjLcCG7S4Eh1KLppcWGgSIbmJIkLVxsx
         3SffoyuospN0po877JKCYKgjV+64CNy2rF6xoCblb/e448PzhSQ9TXuy5PLK/49V3Jwi
         bKxNIDkFVVBdeilyA1fnB4poiV3rj1H9W1NUtECPYeIj+g5Ifd/QSc+Q2dLZxBk1Nnth
         XKQl1u8EPMNtrxlATv1cVeYRrXEOaFTKgcLvzKBET1Uxpw7v4w+T+8EMl1kuVbPLWlH5
         wee0Wo5BKDC4HlPzsRqOVErSXzUDYtKciw2hJ3Auyr0o6b1/ZNu7cHG3NH6GsMXIZwQW
         wV3A==
X-Gm-Message-State: ANoB5pmIhT8hiD7pz0NV4s4u4AmVYMLauaGDgRrURUwl454MpyCa/TEP
	KxG+lfec/a8Tw12tQfx7lyfe1Q==
X-Google-Smtp-Source: AA0mqf76Z+L8vqIbTmVFjgnSj6R8n7eFo6mnFYtbdrFJbnUCXUjtrZiNr2NDlKMaN48VVG2YVV9Pyw==
X-Received: by 2002:a17:90a:3d41:b0:213:d34:a80b with SMTP id o1-20020a17090a3d4100b002130d34a80bmr77669655pjf.74.1670003688186;
        Fri, 02 Dec 2022 09:54:48 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id i8-20020a170902c94800b00172fad607b3sm5864137pla.207.2022.12.02.09.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 09:54:47 -0800 (PST)
Date: Fri, 02 Dec 2022 09:54:47 -0800 (PST)
X-Google-Original-Date: Fri, 02 Dec 2022 09:54:38 PST (-0800)
Subject: Re: [PATCH v2 0/9] riscv: add Bouffalolab bl808 support
In-Reply-To: <20221127132448.4034-1-jszhang@kernel.org>
CC: robh+dt@kernel.org, Conor Dooley <conor@kernel.org>,
  krzysztof.kozlowski+dt@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Greg KH <gregkh@linuxfoundation.org>, jirislaby@kernel.org, ilpo.jarvinen@linux.intel.com,
  linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-serial@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang@kernel.org
Message-ID: <mhng-0a879461-fb57-4547-887f-35ac0dc0ea1a@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_095452_024527_05E76562 
X-CRM114-Status: GOOD (  19.21  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 27 Nov 2022 05:24:39 PST (-0800), jszhang@kernel.org wrote:
> This series adds Bouffalolab uart driver and basic devicetrees for
> Bouffalolab bl808 SoC and Sipeed M1s dock board.
>
> It's too late for v6.2-rc1, but I hope I can catch up the v6.3-rc1
> window.
>
> I think I have addressed all review comments to v1, correct me if I
> missed anything.
>
> PS: this series assumes the "thead,c906" riscv cpu binding patch is
> merged(I see Conor has picked up it).
>
> Since v1:
>   - use FIELD_PREP and FIELD_GET macro
>   - rewrite bflb_uart_tx_chars()
>   - add vendor prefix for bouffalolab
>   - add dt binding for bl808 compatibles
>   - enable SOC_BOUFFALOLAB in defconfig
>   - collect Reviewed-by tag
>   - modify commit-msg as suggested
>
> Jisheng Zhang (9):
>   dt-bindings: serial: add documentation for Bouffalolab UART Driver
>   serial: bflb_uart: add Bouffalolab UART Driver
>   riscv: add the Bouffalolab SoC family Kconfig option
>   dt-bindings: vendor-prefixes: add bouffalolab
>   dt-bindings: riscv: Add bouffalolab bl808 board compatibles
>   riscv: dts: bouffalolab: add the bl808 SoC base device tree
>   riscv: dts: bouffalolab: add Sipeed M1s SoM and Dock devicetree
>   MAINTAINERS: riscv: add entry for Bouffalolab SoC
>   riscv: defconfig: enable BOUFFALOLAB SoC
>
>  .../bindings/riscv/bouffalolab.yaml           |  34 +
>  .../bindings/serial/bouffalolab,uart.yaml     |  47 ++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  MAINTAINERS                                   |   9 +
>  arch/riscv/Kconfig.socs                       |   6 +
>  arch/riscv/boot/dts/Makefile                  |   1 +
>  arch/riscv/boot/dts/bouffalolab/Makefile      |   2 +
>  .../dts/bouffalolab/bl808-sipeed-m1s-dock.dts |  25 +
>  .../dts/bouffalolab/bl808-sipeed-m1s.dtsi     |  21 +
>  arch/riscv/boot/dts/bouffalolab/bl808.dtsi    |  74 +++
>  arch/riscv/configs/defconfig                  |   1 +
>  drivers/tty/serial/Kconfig                    |  18 +
>  drivers/tty/serial/Makefile                   |   1 +
>  drivers/tty/serial/bflb_uart.c                | 610 ++++++++++++++++++
>  include/uapi/linux/serial_core.h              |   3 +
>  15 files changed, 854 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/bouffalolab.yaml
>  create mode 100644 Documentation/devicetree/bindings/serial/bouffalolab,uart.yaml
>  create mode 100644 arch/riscv/boot/dts/bouffalolab/Makefile
>  create mode 100644 arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts
>  create mode 100644 arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi
>  create mode 100644 arch/riscv/boot/dts/bouffalolab/bl808.dtsi
>  create mode 100644 drivers/tty/serial/bflb_uart.c

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
