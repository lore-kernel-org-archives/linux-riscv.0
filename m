Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6ED606A326
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 07:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o44GqoLJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w5QQ2GPO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k+9Ajwe4FG5elX8CdkO+qNu4aKtsPtAMuAzev4PQNdM=; b=o44GqoLJpCiOS2h5d1Tqt0yd2W
	n2UkUPBTchsewQm1cmTjg+jm5oBE3DfeB8ox9AQivyxumwo8g69sZ0r1VrTN6hY8Aye7oSOowqFt4
	p4BOO3OImXWKl7tDkU/bNlIVH16AyRWcdXeGplYjBXh7PiwmQgGoPKuLyokDVhPn8CyPhft4z6uSc
	aSn5sqCFzPCQswCwSSms6RMXWHvq6xpfxIceCZPTfYmlsIlby+X8SeWKas3damaKwSArwYlLNJIrA
	7jZPX/4SPxNx/bvOC0rNhTG2MIjicpkJT5P/BKO++WOGNN9nHc9ZuTm+FURdszvY67aIc2v67tS3Z
	tMLF6xUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfzG-00000002kjB-1eCQ;
	Tue, 10 Nov 2026 07:09:46 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfzD-00000002kho-2yAX
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 07:09:45 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so951996a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 23:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794294583; x=1794899383; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8o8wjjmrwoQdO4Xnhs54i8QvAQRlpkIVByEC39d22TI=;
        b=w5QQ2GPOeP0c6OLlcZ3Mteeji0UcWfhBjxSJpw4ZeVuOUJ6Vm9LXUY/SxKGHbPHztX
         7mni47FIRhaQanOFmZSH6Z5eoEUAI0BrIP6pTG8AIaYrRfvqgTsK6kO/eFBS79rDaZjv
         87jDRw8QVWnJomWejFyuq3tLzCWVUjlj3dV0a7FV1a5e1Sc4M3dydS2jhrq0RWfNzF6P
         ikx/blTa1jRzx3MCMcFaBMNh7ev3fj9YKMwA6Sr8ywPPU3gsWnajf5hif5gAPiWqB+Bi
         voFFYOrlKvSIx8wDa/lV5ESH8imMNjxojeZAxIYrSHDyu4AptJGmHXPuNxo8px1iMDyh
         iJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294583; x=1794899383;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8o8wjjmrwoQdO4Xnhs54i8QvAQRlpkIVByEC39d22TI=;
        b=mJ59W6LaAU8+NNqmDIBgYNa8N56vTdSkxgZKg8t4lYNNVcb+X5Gz1dKFpIjzFTq1Kp
         4EFGCuzqHKHUTfWfJqNGKGTUgIanDb3pHqEMI12yM6irpGhQdgsGR2Uay9yZh/ZbDtgn
         ueh9KrZRReXugCfHHVrsXgqt4iz6mahfJ8ssMyRAG1Y3ZoYaI34z0s3nb3NS0kJEr/Rl
         PxeBlL2z97HEtoqssYXtSx99crZR+nB55aXrhfOWXUQ3+wVwECg8IMY86yUdkiDnBhxN
         aH9qnrLYRb0GhhmA9779ne3H0Fz3QEq12NuqnUM7zfibIHoQeOFYSZsbldPCJyp7R2Zl
         rUrg==
X-Forwarded-Encrypted: i=1; AL+hErF0ZSWkc/fGgajNhrsSAPyzKceALsYr1qSbdTlpIOhyOszh7EdADxO5KDqya5A51KyM0oofynFXsxTXlQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9CVnJUPgES/1Y1ddlInweAds6swEUMifTqHeYUwezrICx2zhOw
	IbkaRmhjuS0pbQsEpkSoKfuxzcKvAEuldyF7CRJzlxYu3z74Asy/MgDC
X-Gm-Gg: AYBFou0uQGTAsxDiM9+rQwWnvrEFVz76CYZ/9lCq545xFm1G5rjPLl9c0szYj6ZPVPC
	6mzVkLZvcRsZEfMkjShyqUivoFcX3opZLvF4VyFe68wEIJYjGsuw36PcgCTJR6tmoFWiiKK3qZa
	1loGnll7khL6b1400w6okUeTWc84B+MqTSXCyOHnkYpisDOcomXMSq34BhyLsWAJx9/hWSJ5a5E
	0AHbr5elRXjQKPhgSWPlvlrm4QbDtS5Le6rcxcdXRycaK5DczbTkXbnHmsU8EvOSPF/pPvdwC7g
	/qGYvyyhHiTSdhGCoSFdaV4qvQbsZqkYo26/GT4AgYgd9uN9kR9HGmtaKHthm3832667uUIUw8X
	AEbz0rc2HxoWegQDhmU2IN8Ia+7QJt9PYQREk5b+ZKKxmTyQWVdo/eiRLC3jHMLC8utFYpa2T/c
	0CAI+l3L4Z4l9bPpUKSU5P2OaVN51F8Nj2Rtm2xiDwou6/WcyGPKvVr1hK0LkoZkuEGOgz6dLFl
	vjJZXUCl0fNKly34+pZFfXTp3QqbkbWi7IYK/1NYP1/UjnXqaM6cUGEYybSvWqQ6J8d94G6k0Iz
	JP9nGG4Jm5pdMrA/sj0gqwY7Ufk=
X-Received: by 2002:a17:90b:3844:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3b16797724fmr1270966a91.18.1794294582592;
        Mon, 09 Nov 2026 23:09:42 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16771b08asm2648642a91.13.2026.11.09.23.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:09:42 -0800 (PST)
Date: Tue, 10 Nov 2026 15:09:23 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Inochi Amaoto <inochiama@gmail.com>, 
	Chen Wang <chen.wang@linux.dev>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Hiago De Franco <hfranco@baylibre.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] phy: sophgo: Add USB role switch for CV18XX/SG200X
Message-ID: <avLC68zOj8WKuslb@inochi.infowork>
References: <20261103085847.338613-1-chenyou910331@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261103085847.338613-1-chenyou910331@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_230943_787291_D65FB4BB 
X-CRM114-Status: GOOD (  32.89  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 04:58:44PM +0800, Chen-Yu Yeh wrote:
> This makes one DTB work as both USB host and USB device on the Milk-V
> Duo 256M, following the discussion in the thread "Milk-V Duo 256M: USB
> peripheral mode works on mainline, how should dr_mode be handled?" on
> the sophgo list. There, Inochi pointed out that a dual-role switch is the
> right way and that the default should match the vendor image.
> 
> The usb-role-switch support in dwc2 hangs on this SoC. It clears B-valid
> through the GOTGCTL session overrides while VBUS is present, and
> GOTGINT.SesEndDet then fires back to back. The vendor kernel writes only
> the ID override in the top syscon and lets dwc2 follow the Connector ID
> change, and this works on mainline too, without any change to dwc2. So
> the role switch lives in the PHY driver, which already owns those bits.
> 
> Test setup
> ==========
> 
> Milk-V Duo 256M, vendor buildroot rootfs, loaded by hand from U-Boot.
> Tree: v7.3-rc5 with these changes, CONFIG_USB_DWC2_DUAL_ROLE=y,
> CONFIG_USB_ETH=y. The series itself is based on current master; the files
> touched by patches 1 and 2 are the same in both trees.
> 
> Tests 1 to 3 ran with CONFIG_USB_DWC2_DEBUG=y and the DT properties
> applied through an overlay. Test 4 ran with debug disabled and the
> board DTS from patch 3.
> 
> In the logs below, 
> R=/sys/class/usb_role/3000000.syscon:phy@48-role-switch
> 
> 1. Default peripheral, bare board on a PC, nothing done after boot
> ------------------------------------------------------------------
> 
>   # ls /sys/class/usb_role/
>   3000000.syscon:phy@48-role-switch
>   # cat $R/role
>   device
>   # devmem 0x03000048 32
>   0x000003C0
>   # cat /sys/class/udc/*/state
>   configured
> 
>   PC$ lsusb | grep 0525
>   Bus 003 Device 009: ID 0525:a4a2 Netchip Technology, Inc. Linux-USB Ethernet/RNDIS Gadget
> 
> 2. Switching at runtime, same setup
> -----------------------------------
> 
>   # echo host > $R/role
>   # cat $R/role
>   host
>   # devmem 0x03000048 32
>   0x00000142
>   # echo device > $R/role
>   # cat $R/role
>   device
>   # devmem 0x03000048 32
>   0x000003C0
>   # cat /sys/class/udc/*/state
>   configured
> 
> The switch was repeated without an interrupt storm, then:
> 
>   # echo none > $R/role
>   # cat $R/role
>   device
>   # devmem 0x03000048 32
>   0x000003C0
> 
> 3. Default host, on the USB & Ethernet IO board, nothing done after boot
> ------------------------------------------------------------------------
> 
> Only role-switch-default-mode differs from patch 3 here.
> 
>   [    3.409672] usb 1-1: new high-speed USB device number 2 using dwc2
>   [    3.666655] hub 1-1:1.0: 4 ports detected
>   [   72.484979] usb 1-1.1: new high-speed USB device number 3 using dwc2
>   [   74.804484]  sda: sda1 sda2 sda3 sda4
> 
> The USB stick was plugged in by hand at about 72 s.
> 
>   # cat $R/role
>   host
>   # devmem 0x03000048 32
>   0x00000142
>   # devmem 0x04340018 32
>   0xF300081E
>   # devmem 0x04340440 32
>   0x00001005
>   # echo none > $R/role
>   # cat $R/role
>   host
>   # ls /dev/sd*
>   /dev/sda  /dev/sda1  /dev/sda2  /dev/sda3  /dev/sda4
> 
> 4. Patch 3 as committed, debug disabled
> ---------------------------------------
> 
> Bare board on a PC, nothing done after boot:
> 
>   # cat $R/role
>   device
> 
>   PC: usb 3-9: New USB device found, idVendor=0525, idProduct=a4a2
>   PC: usb 3-9: Product: RNDIS/Ethernet Gadget
> 
> On the IO board, with a USB stick already plugged in at boot:
> 
>   # cat $R/role
>   device
>   # echo host > $R/role
>   # cat $R/role
>   host
>   # dmesg | grep -E 'usb 1-1'
>   [  415.464739] usb 1-1: new high-speed USB device number 2 using dwc2
>   [  415.940738] usb 1-1.1: new high-speed USB device number 3 using dwc2
> 
> Before this series
> ==================
> 
> With usb-role-switch on the dwc2 node, "echo host" hangs the board in the
> SesEndDet storm, and so does boot without role-switch-default-mode.
> 
> With dr_mode = "otg" and no role switch, writing the ID override by hand
> worked:
> 
>   devmem 0x03000048 32 0x3C0  -> high-speed RNDIS gadget on the PC
>   devmem 0x03000048 32 0x142  -> disconnects from the PC, host side starts
> 
> Three round trips were all correct, and ping over usb0 afterwards was
> 5/5. On the IO board, the hub and USB stick appeared after one toggle,
> but not at boot, because usb_add_hcd() moved the PHY to host after dwc2
> had already set up for device:
> 
>             at boot       after one toggle
>   GINTSTS   0x05000023    0x04200021
>   GINTMSK   0xd0bc3cd4    0xf300081e    (PrtInt masked -> unmasked)
>   HPRT0     0x00021403    0x00001005    (ConnDet pending -> port enabled)
> 
> Test 3 above reaches the right-hand values at boot without a toggle.
> 
> Not tested
> ==========
> 
>  - A USB stick already plugged in at boot in the default host case.
>  - Running on a master based tree: all tests used the v7.3-rc5 tree.
>  - Boards other than the Duo 256M. Nothing changes on them, since the
>    role switch is only registered when the PHY node has usb-role-switch.
> 
> Question
> ========
> 
> With patch 3, the hub on the IO board needs "echo host" after each boot.
> Should the IO board overlay (sg2002-milkv-duo256m-eth.dtso) set
> role-switch-default-mode = "host", or should it stay the same as the
> vendor image?
> 
> 
> Chen-Yu Yeh (3):
>   dt-bindings: phy: sophgo,cv1800b-usb2-phy: Add USB role switch
>     properties
>   phy: sophgo: Add USB role switch support for CV18XX/SG200X
>   riscv: dts: sophgo: sg2002-milkv-duo256m: Enable USB role switch
> 
>  .../bindings/phy/sophgo,cv1800b-usb2-phy.yaml |  11 ++
>  .../boot/dts/sophgo/sg2002-milkv-duo256m.dts  |   7 +-
>  drivers/phy/sophgo/Kconfig                    |   2 +
>  drivers/phy/sophgo/phy-cv1800-usb2.c          | 107 ++++++++++++++++--
>  4 files changed, 119 insertions(+), 8 deletions(-)
> 
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> -- 
> 2.43.0
> 

NAK on this patch, I do not think fix phy is the right way for a
controller problem. See my new patch:

https://lore.kernel.org/linux-usb/20261110070627.217946-1-inochiama@gmail.com

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
