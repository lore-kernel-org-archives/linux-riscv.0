Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F9BC4321E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 18:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=iwSuJsMsU63mUVfbXvMSQAJ4lsf4jlB/JS7LtjLrVcw=; b=Br4LQEDTKSeGilJKFe/4amSfXY
	ojc6LBCp7c4SnAM3FfR7IHet1Yq0qEGqzAxmD4qZz12UvQJtJ2urqINtwlWL+Dn0ooYvmC6FavjOn
	Vw3dAvJiWMurvbvvZVrHiboFms+C04Kh/tV3rhKzISIVvYiXehPqSJeSZOi1ASRWk1vsT0sGRdpYm
	SsDTTOz+wEO5ZJFEJ8PeaHCMcaK2m6Y/V9a9xQgo36MzSLODYVzfT22VvpgA3VlegcPkEdeD2dpHe
	EwsN9OLOX2L0pIcuJB9l4x18Vi5WtPEKPVcnNeAztG5KdV1oc8TnvXSROhiNSBzOUHGzpzPht6Uox
	PPi2Bqtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1AL0-000VME-Ud; Fri, 02 Dec 2022 18:00:38 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1AKz-000VKx-5d
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 18:00:38 +0000
Received: by mail-pj1-x102e.google.com with SMTP id w15-20020a17090a380f00b0021873113cb4so5867831pjb.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 10:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rVnmEptgROI9IUZaX1f1yIZ6ff25eT2l+091wj20Eo4=;
        b=AgXPoK7ajSsa+YF9S97rT0pFxSb5esUwmDvXnV9B8vTumik2EPC0khwMfSy3rA7lNN
         fH/L0BdbXYNNf63U6/0OZRuMwlB44FLG7gJxo69AyF730lNztNl3A+KEadcTHJWbmL9m
         +UR7MYiBSt4xlPjXWLAmkLyDJJCO1sUdosLIg2TAKyEBy96xAPSbFBF5uZykQ7KCj660
         bD4Dm5l1BIs6CxEtxZSgewN4+TC0ZFFoZimqojrNoomjta3Rmjuwkgi7hrf+10QH6+Kr
         gfWr4wBpkzwjsEd3BtJWy68oiQ48aC9OMw60iZWxnNzPHTkdenYGtpyr5UcT31DFldLT
         puzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVnmEptgROI9IUZaX1f1yIZ6ff25eT2l+091wj20Eo4=;
        b=Fuo8/AmCU2b6h17DY8G35yq11PoyRujGUQAuOuLCO5zMkMCzYnlSYmfYAMgKqiKLYc
         WGVLnaL4iGPTEV45MuFEPDjcBmRLr9jOpGuRSyiesS0F4/Kwki7Rf1YE97DBx+36ewd6
         rjX+gVS78HXf4bcsdK7ZVTlXjNhCNJYiwi/RYRCGAvmhSkN01m6itbPidCs6hIrGbyXQ
         MkwhNtDTvG8pxXHpolek5XLgC7TBvQDPpQPvfBLMVB8kDx2ghk/HVTyymS3WivsCBPqh
         1HExzF9gKmq8XRpRt7dtnx74jOOsy/9k7oRWQe0ABFMoUD6Ty3DzKPgl18lyMijCY+i9
         OCKQ==
X-Gm-Message-State: ANoB5pkYU/kddBCTGMJGJ2AZfmvpH+NIW1PltziLGRLS/24dfX+sua/n
	UuUGZazNxb5oywuSAzBJfFF6cSt2RveDVnuDgHk=
X-Google-Smtp-Source: AA0mqf6qsLB4Xz5iPXZah/+o9AROQaXWF5EkEGyIqCOjOZB4npvpJ0RF1db0zL2vl62HhCAqah/EWw==
X-Received: by 2002:a17:902:e807:b0:189:117c:fcfe with SMTP id u7-20020a170902e80700b00189117cfcfemr53798277plg.124.1670004035863;
        Fri, 02 Dec 2022 10:00:35 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id o11-20020a1709026b0b00b00186616b8fbasm5853160plk.10.2022.12.02.10.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 10:00:35 -0800 (PST)
Date: Fri, 02 Dec 2022 10:00:35 -0800 (PST)
X-Google-Original-Date: Fri, 02 Dec 2022 10:00:18 PST (-0800)
Subject: Re: [PATCH v2 8/8] RISC-V: defconfig: Enable CONFIG_SERIAL_8250_DW
In-Reply-To: <20221118011714.70877-9-hal.feng@starfivetech.com>
CC: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
  Conor Dooley <conor@kernel.org>, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, ben.dooks@sifive.com, tglx@linutronix.de,
  Marc Zyngier <maz@kernel.org>, sboyd@kernel.org, mturquette@baylibre.com, p.zabel@pengutronix.de,
  linus.walleij@linaro.org, emil.renner.berthing@canonical.com, hal.feng@starfivetech.com,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: hal.feng@starfivetech.com
Message-ID: <mhng-cf616c36-e110-4274-9bbf-cc6a22b75ed5@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_100037_246250_980C2BE5 
X-CRM114-Status: GOOD (  13.59  )
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

On Thu, 17 Nov 2022 17:17:14 PST (-0800), hal.feng@starfivetech.com wrote:
> Add CONFIG_SERIAL_8250_DW=y, which is a necessary option for
> StarFive JH7110 and JH7100 SoCs to boot with serial ports.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  arch/riscv/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 05fd5fcf24f9..a23d022974ad 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -122,6 +122,7 @@ CONFIG_MICROSEMI_PHY=y
>  CONFIG_INPUT_MOUSEDEV=y
>  CONFIG_SERIAL_8250=y
>  CONFIG_SERIAL_8250_CONSOLE=y
> +CONFIG_SERIAL_8250_DW=y
>  CONFIG_SERIAL_OF_PLATFORM=y
>  CONFIG_VIRTIO_CONSOLE=y
>  CONFIG_HW_RANDOM=y

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
