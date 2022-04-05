Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40352C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 16:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=yStN4+zRYbn9zvOGFzCoFbLbXVVhRnVcC50yMI33KDM=; b=uDcdHaGi+rX5QG3USs0O9ZNfiU
	iBdLtXwMGzGQnqitfVMolqHD7GlNBkMjeS+4x37ibn0cN2EAT52tbzSqUkq1DdHJAOVvPhSnf62VF
	ShQa+gK4u6pctn5cpfnhyV5PXrIvzcRpMgDXC+XO6S/23IKBsJst05yBgn1dBgLsNv6JzExgrvRWE
	kTrSPNtGalesxl5JUa42XzoQVRpEYPlaKOtzXnL0I9aDQ1KQggphC9b+7APJi9kvqr95FXqkcL69F
	Av8nY9hoWQWgqMCrz8NOY+qwmKfugPExKlB8FiEiZafnwSs/4sx0wHinTVDGkwsO5hzx8cI/7Q2tp
	uRLPKBkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbmTc-00221j-W8; Tue, 05 Apr 2022 16:56:21 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbmTZ-00220o-IA
 for linux-riscv@lists.infradead.org; Tue, 05 Apr 2022 16:56:19 +0000
Received: by mail-pl1-x62b.google.com with SMTP id i11so11364639plg.12
 for <linux-riscv@lists.infradead.org>; Tue, 05 Apr 2022 09:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=pD9fPwmVTM/jGE8ljozcqxyf1v/JIowTzA8YgXdXgLo=;
 b=6Yhc3GQ5D13EfpCiyxWdY9ATp+e66X5WPXMk58IseiYggOh8EF4zh770E/Bk7DRo51
 p4h4+pm4+wXMgBLs7qhYW6r1vVN2Wm7Iva6ruTUNUbuSqXPQ14wKHV8caf3YtyNS2Lzu
 Kveambm80gsiXG3DrJFesbT6dQs5tecj4kseuZoRyGhEDF0QpghcROkKwiOozw0IonrY
 cFQp7Fy2dYV4yttfGd+tA5dCEWgo4daS5HamfxZ1aTcDAeoqoOlCSQkeSBOmIT+3oI3o
 n27q25I2PMjmmtWPK+zyETaS0EMrgPC0vQ+07cBMFsDLQXUr/NREnSNOapE4gsNk4ftz
 tSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=pD9fPwmVTM/jGE8ljozcqxyf1v/JIowTzA8YgXdXgLo=;
 b=w4xTgXg+TsMZtk5BQDv5HYPjphGJXvqe5qhQJ2GCd/aQZuS4FRVmQv4IqsJTy+oObF
 RTykz+sGzpjW9B/+WPoffQ8pza8bxS4IflQAhDVrxCoY6qXuGztCiPSWU8ES8Zk4Znq5
 ZqHtz1qG4dDKHZeFEgukwsfOTu4Pc6/Xt0bs/OTcR5mrtFel4ebCAxors9oseZ0lQeK6
 VRmyR1s/99LpBRUR/XUGyyGcqIPHAMvoJJqBHBVRJ3HtVrr5XjpXD6uyoHDVBkpBqRU4
 Zo1zz5zRb64/qIJSYU7UuLRryMfD6dHifD/+C7cuOHRQhr0CeB/sp0e/jhudoxaCSwwJ
 uN5Q==
X-Gm-Message-State: AOAM532sJ87U/nKa3mGcUyCmVxcxGMS66kKuAgR60WxHAt6xR8WtQOyN
 Z4uhv+XFP5BLrE+LlYl+Jib9Og==
X-Google-Smtp-Source: ABdhPJxURqOrvjUNTuGDdXp9QzgwB0B9A/Tn2x7b4aAfTIkHHSa8BmZtjlyBr0mLrouMcWOZ+7cwhQ==
X-Received: by 2002:a17:90a:7841:b0:1c7:e8ad:ea25 with SMTP id
 y1-20020a17090a784100b001c7e8adea25mr5206129pjl.25.1649177774636; 
 Tue, 05 Apr 2022 09:56:14 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 p18-20020a17090ad31200b001cab747e864sm2785950pju.43.2022.04.05.09.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 09:56:13 -0700 (PDT)
Date: Tue, 05 Apr 2022 09:56:13 -0700 (PDT)
X-Google-Original-Date: Tue, 05 Apr 2022 09:56:11 PDT (-0700)
Subject: Re: riscv defconfig CONFIG_PM/macb/generic PHY regression in v5.18-rc1
In-Reply-To: <Ykxl4m1uPPDktZnD@shell.armlinux.org.uk>
CC: Conor.Dooley@microchip.com, apatel@ventanamicro.com, netdev@vger.kernel.org,
 Nicolas.Ferre@microchip.com, Claudiu.Beznea@microchip.com, andrew@lunn.ch,
 hkallweit1@gmail.com, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux@armlinux.org.uk
Message-ID: <mhng-524fe1b1-ca51-43a6-ac0f-7ea325da8b6a@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_095617_632908_99419C0A 
X-CRM114-Status: GOOD (  16.85  )
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

On Tue, 05 Apr 2022 08:53:06 PDT (-0700), linux@armlinux.org.uk wrote:
> On Tue, Apr 05, 2022 at 01:05:12PM +0000, Conor.Dooley@microchip.com wrote:
>> Hey,
>> I seem to have come across a regression in the default riscv defconfig
>> between riscv-for-linus-5.18-mw0 (bbde015227e8) & v5.18-rc1, exposed by
>> c5179ef1ca0c ("RISC-V: Enable RISC-V SBI CPU Idle driver for QEMU virt
>> machine") which causes the ethernet phy to not come up on my Icicle kit:
>> [ 3.179864] macb 20112000.ethernet eth0: validation of sgmii with support 0000000,00000000,00006280 and advertisement 0000000,00000000,00004280 failed: -EINVAL
>> [ 3.194490] macb 20112000.ethernet eth0: Could not attach PHY (-22)
>
> I don't think that would be related to the idle driver. This looks like
> the PHY hasn't filled in the supported mask at probe time - do you have
> the driver for the PHY built-in or the PHY driver module loaded?

IIRC we had a bunch of issues with the PHY on the HiFive Unleashed, 
there was a quirky reset sequence that it wouldn't even probe 
correctly without.  We have a 

    &eth0 {
            status = "okay";
            phy-mode = "gmii";
            phy-handle = <&phy0>;
            phy0: ethernet-phy@0 {
                    compatible = "ethernet-phy-id0007.0771";
                    reg = <0>;
            };
    };

in the Unleashed DT, but I can't find anything similar in the Icicle DT

    &mac1 {
            status = "okay";
            phy-mode = "sgmii";
            phy-handle = <&phy1>;
            phy1: ethernet-phy@9 {
                    reg = <9>;
                    ti,fifo-depth = <0x1>;
            };
            phy0: ethernet-phy@8 {
                    reg = <8>;
                    ti,fifo-depth = <0x1>;
            };
    };

I seem to remember picking that specific phy because it was similar to 
the one that was POR for the Icicle at the time we decided, maybe you 
have a similar phy with a similar quirk and need a similar workaround?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
