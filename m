Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140FCC54798
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Mar 2024 16:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=67zr7u6dAsOGTZT/NhsFsveqyGS0rQqDbHlVkf9D5qA=; b=HRW5dp/XLXm3G0
	Ip5hBiVf3sWa7ZpRO/2H+mA/TpLheCOnTbDP0xX8JkdZafiiQ7XRSKRCqe+ae1yWVKsEmyUSZwQvF
	3R5ANrVY/XT1V5xcQF6HLdaHV00nvOGtEj/pBeKrR6+RjW5d2Hp6c7O06rPfmLxliqc6wSHLR8lIh
	akpWhUO2xe95L+YuNJbiQyk/IUHp4HBWkpit2WhkvBgFvMpSU/I/OyzH6vpRClGjK1opeHavgbkNL
	xgZeVFLFI41lvboW5yZrCGG8dKMKtg0Yoxg5p0tdhMSxfXnAzQIorHCS2MYgZYWJyrtWfBl0I/dZb
	XToWUMHOBTXtQvA/i2mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgSBI-00000003xEj-2Tig;
	Sat, 02 Mar 2024 16:25:48 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgSBG-00000003xCg-02LD
	for linux-riscv@lists.infradead.org;
	Sat, 02 Mar 2024 16:25:47 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso2705705a12.3
        for <linux-riscv@lists.infradead.org>; Sat, 02 Mar 2024 08:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1709396738; x=1710001538; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R9/YuUxiflBj/i7dlvu2dwZ2BOHGnZHPe68SJ562I/U=;
        b=fgstxl2DjmfkoPBGJ7U2bi7OfpoR/riK/01xwSxjzmkr0XX802EJH8+S2FJ8y6Xn5u
         KdGLA7CgyPfbRg9/e6oOOjnCwBLGoavOpXYjgh7iYryQlE1vBhjHjfS5mNa9ow79YaoB
         DdODBZWuy7zbgx36kQudRcDzasSuChfp1xQA5PXfrzyuRTBvBh2wG82C279FcAllysek
         jybLuK6jWTJ4gz3UI684UnU2Q5KRmGa6CbR9dbzB3MnedCM2PWyXT9jaKpw1byB1rN2i
         tZLrYpB8yn2LdS2t0PaXfp4k2GZzeeiAWpO5Si2zt9WJzgbzmNoHnMK8/gAJUMDEsS30
         ER7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709396738; x=1710001538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9/YuUxiflBj/i7dlvu2dwZ2BOHGnZHPe68SJ562I/U=;
        b=bZ/p8bh4UIgplJ2akB7Yi0i4FudxOqYhH6ZbSDjp5znE9W5xpb7zoMtqMlY1eqrnET
         J51ogm4pw9QFEI0i7jTKnaO2sXNxi2WdHmwybC805HzdvJt9gjVA1JEtrV6L/USOpjnF
         AXCUlTDbXYICdTqqfqgqpz+J1z0QBfox0zl6YaFGlR4sw4S9gHKtRsDTQADGxW4vrM12
         hkC49yNTNmnz37V0en2w2c+M80iAXeTGDoAQUOsRTAkZT5DvzgtK2YOws8OrhUnCW+M8
         +vLQQTZAFuCa/DQbJTCh+EIvGpLOcMdZPk/kkYCILqV+jTZuTHgKKMsqdGGjbzYiLWzS
         yAtA==
X-Forwarded-Encrypted: i=1; AJvYcCVheQ842+bKLFX+UBo3FiV5q1JyhlTRnYjFpNgg/f8siVig9OYux0vH1gD8xXbvbAPZXNnEW3otzdZ4HcT9P69FiX4Cbe5MuEfbnYE8Zcqr
X-Gm-Message-State: AOJu0Yw/tpcTVXi9M6YXwg0Os8lJmZZeWOjPk4Q/06r+2ILvaUPPpTRz
	ZWTTClp/3TEVWtVRLmC49IDLM7asYJDMs48xgrscJwg8U9azFsVhgzJb628jHuA=
X-Google-Smtp-Source: AGHT+IGz5ydp8f/FL7iMoHWtfNWf/avYYvGrHo/a099vxFmdwF5bKNFgKW2Lp1/7FBnl5Nhc3MIREg==
X-Received: by 2002:a05:6a20:4f12:b0:1a1:4879:1d72 with SMTP id gi18-20020a056a204f1200b001a148791d72mr1110067pzb.55.1709396737997;
        Sat, 02 Mar 2024 08:25:37 -0800 (PST)
Received: from x1 (067-049-117-115.res.spectrum.com. [67.49.117.115])
        by smtp.gmail.com with ESMTPSA id a5-20020a634d05000000b005d553239b16sm4739328pgb.20.2024.03.02.08.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 08:25:37 -0800 (PST)
Date: Sat, 2 Mar 2024 08:25:34 -0800
From: Drew Fustini <dfustini@tenstorrent.com>
To: Xi Ruoyao <xry111@xry111.site>
Cc: Drew Fustini <dfustini@baylibre.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jason Kridner <jkridner@beagleboard.org>,
	Robert Nelson <robertcnelson@beagleboard.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v8 4/4] riscv: dts: thead: Enable LicheePi 4A eMMC and
 microSD
Message-ID: <ZeNS/g97JetYgXny@x1>
References: <20231206-th1520_mmc_dts-v8-0-69220e373e8f@baylibre.com>
 <20231206-th1520_mmc_dts-v8-4-69220e373e8f@baylibre.com>
 <110fa8d6be78a26ca21cd97c55903f5d62776430.camel@xry111.site>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <110fa8d6be78a26ca21cd97c55903f5d62776430.camel@xry111.site>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240302_082546_078296_E19BE7B0 
X-CRM114-Status: GOOD (  26.54  )
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

On Sat, Mar 02, 2024 at 10:13:55PM +0800, Xi Ruoyao wrote:
> On Wed, 2023-12-06 at 00:09 -0800, Drew Fustini wrote:
> > Add emmc node properties for the eMMC device and add sdio0 node
> > properties for the microSD slot. Set the frequency for the sdhci
> > reference clock.
> 
> Hi Drew,
> 
> I've been using the emmc on LicheePi 4A for a while without any problem,
> but when I try the microSD slot I get:
> 
> [    0.531804] mmc1: SDHCI controller on ffe7090000.mmc [ffe7090000.mmc] using ADMA 64-bit
> [    0.842674] mmc1: Tuning failed, falling back to fixed sampling clock
> [    0.855139] mmc1: tuning execution failed: -5
> [    0.859609] mmc1: error -5 whilst initialising SD card
> [   11.359879] mmc1: Timeout waiting for hardware cmd interrupt.
> [   11.365661] mmc1: sdhci: ============ SDHCI REGISTER DUMP ===========
> [   11.372105] mmc1: sdhci: Sys addr:  0x00000001 | Version:  0x00000005
> [   11.378547] mmc1: sdhci: Blk size:  0x00007040 | Blk cnt:  0x00000000
> [   11.384989] mmc1: sdhci: Argument:  0x00000000 | Trn mode: 0x00000010
> [   11.391432] mmc1: sdhci: Present:   0x03ff0000 | Host ctl: 0x00000017
> [   11.397873] mmc1: sdhci: Power:     0x0000000f | Blk gap:  0x00000000
> [   11.404312] mmc1: sdhci: Wake-up:   0x00000000 | Clock:    0x0000000f
> [   11.410753] mmc1: sdhci: Timeout:   0x00000004 | Int stat: 0x00000000
> [   11.417192] mmc1: sdhci: Int enab:  0x00000020 | Sig enab: 0x00000020
> [   11.423633] mmc1: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
> [   11.430073] mmc1: sdhci: Caps:      0x3f69c881 | Caps_1:   0x08008177
> [   11.436513] mmc1: sdhci: Cmd:       0x00000102 | Max curr: 0x00191919
> [   11.442954] mmc1: sdhci: Resp[0]:   0x00000900 | Resp[1]:  0x07725f7f
> [   11.449394] mmc1: sdhci: Resp[2]:   0x32db7900 | Resp[3]:  0x00400e00
> [   11.455835] mmc1: sdhci: Host ctl2: 0x0000300b
> [   11.460280] mmc1: sdhci: ADMA Err:  0x00000000 | ADMA Ptr: 0x0000000000882220
> [   11.467416] mmc1: sdhci: ============================================
> [   11.563828] mmc1: Tuning failed, falling back to fixed sampling clock
> [   11.576053] mmc1: tuning execution failed: -5
> [   11.646438] mmc1: new high speed SDXC card at address aaaa
> [   11.653170] mmcblk1: mmc1:aaaa SR256 238 GiB
> 
> I can write something into the SD card and read it back though.  But
> this makes me reluctant to use the SD card for "some real thing" afraid
> of a data loss.
> 
> The SD card is a SanDisk Extreme Pro 256GB (rated "U3, A2, V30").
> 
> Any idea how to debug this issue further?  (Maybe I should try change
> the SD card first but I'd like to discuss the issue before paying money
> for another card.)

Revy informed me that downclocking from 198 MHz to 100 MHz [1] has been
observed to solve this problem. Could you try the following dts patch?

Also, I have noticed the T-Head's 5.10 vendor kernel does have some
updates in sdhci-of-dwcmshc.c related to tuning. I'll look at porting
those to the upstream driving.

Thanks,
Drew

[1] https://github.com/revyos/thead-kernel/pull/62
[2] https://github.com/revyos/thead-kernel/commit/afef388b8e26f0d77f9d2261b6e57991941a213f#diff-ba729b399f3cb86d6a2503890c3626a6426c1572a54f24cd7ab3337f5fc75674

------ [cut here] --------
From db4d406fc15c76317993a39a72061d3df47e86f0 Mon Sep 17 00:00:00 2001
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sat, 2 Mar 2024 08:21:50 -0800
Subject: [PATCH] riscv: dts: thead: downgrade microSD to 100 MHz max

Downgrade max freq for microSD controller from 198 MHz to 100 MHz to
avoid timeout errors.

Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index 1365d3a512a3..d6ae671f94a9 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -53,6 +53,6 @@ &emmc {

 &sdio0 {
        bus-width = <4>;
-       max-frequency = <198000000>;
+       max-frequency = <100000000>;
        status = "okay";
 };
--
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
