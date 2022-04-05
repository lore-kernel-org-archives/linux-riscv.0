Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F6AC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 16:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E4lmLeOZ1zK7SrmarsH0rUYbk2m+EkvDXx9SHdAmtnA=; b=xUldHCKWSl5m8P
	QF3KIbFCI5SpISoaeLO93AsI688NgaxMm5qDWe8fFcD2jZ1v/Kxa/HgNg1zimBvsvE9b+h/ZfSsLm
	PgGrzwBFisLbOVg1We15Seh6S8+zv1u/aC2NUbGifpanOWD1C5/PX7Ag5BnJC0rRUcWJ6DUNpyMPO
	U+bOHN2kkgavuUox6GG9R1BkF0PwfK8O6wZuSfTZ8ipS3l+l4A2tczs6DjAvSd/jk1/BakXMO6q1D
	9+4XzmEdKY4JIQ3KXQv1RzyKL6mnEYWOjt8O+2twzOuPbajiYX+K21ZsKsCVHqNrqvXUYtGpveTNI
	NH4cZDdGyJuZ0EJbCVmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbmWA-0022R8-LY; Tue, 05 Apr 2022 16:58:58 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbmW7-0022Ps-40
 for linux-riscv@lists.infradead.org; Tue, 05 Apr 2022 16:58:56 +0000
Received: by mail-wr1-x42f.google.com with SMTP id j12so12680360wrb.5
 for <linux-riscv@lists.infradead.org>; Tue, 05 Apr 2022 09:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8aHjdrzxvuuwSECjwvJEnyfmwIs0wnZS2SDA3RmFL94=;
 b=72YUET14s8SEElAjSW0t3i7Yg1P7m27US94euc+B33qxKztjfcGXWvx5NmgLNsPFPt
 NUtwyeaPm0bEEKvJfJJ3dXbf8AwIYARvwG++ClpEOZ2H4hdjKtMD4NuuQ2h5jsJjUrGN
 VpJrvhQOF8FP9ygCyEBB9ZE856r3d6Nat+AmmD0WS8tvqUAnFRfNq8laLiCRToRcbQsY
 tD9CyQ1lmY4Z0vyt8FGthgoX3rhMa/nzzmjplRK0zP23F9UmfcRidP9oKmHsER2Pwr6V
 BgtsZUo6I2/RV02DWXU6bnUqtu62K/wn829LFg5RVq6dFNAeoc/LfhIJoowRY2cPev6p
 J/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8aHjdrzxvuuwSECjwvJEnyfmwIs0wnZS2SDA3RmFL94=;
 b=FhEAFAV4fdp0ccwI7z6MVAHwQpQSx5gLy50nRqXeVtcSaffiH1/vnyyLNEDgjOSF0D
 O2nocNLgOLORCkwkF6fMYzP2fTNT+XHYLjkUqx7t/Eycu1vzzINtf7Vm+pR+Q+nNPuAE
 QMU9kJ8fbo7PGYlN1TajitZOdxyY/wjy978DhoAosNoxQCMJkHsi0hEw5eSUsO5ifRTv
 IPL6tFbCdpoyTTThHxynfaSFEB1k5O/MWho3ExPTT1s/1LmuI/4pPivkyvkGqMRHwHkg
 CBh3q0EKAf9bNR9PY3zCVjgDQbTr36fYvIV3rJ/rQOdS/U/Sucj3xTKviny6j3oJQ/V7
 +XhQ==
X-Gm-Message-State: AOAM53152xCSIMLDm2Rcr02d54JrijswwntDnTffvSxx6hDAgML1+CwH
 kwuvFUMMyv3giKNL0zPP5FdG7w==
X-Google-Smtp-Source: ABdhPJzjFdsPWmaS5MX3p/c9EvEWmyhF7l9YbAzv9tGV0wm6kHYJ1M5CL8YrSb98zEk1M6MVwxm2IQ==
X-Received: by 2002:a5d:6505:0:b0:205:9a98:e184 with SMTP id
 x5-20020a5d6505000000b002059a98e184mr3238708wru.317.1649177931194; 
 Tue, 05 Apr 2022 09:58:51 -0700 (PDT)
Received: from [192.168.2.116] ([51.37.209.28])
 by smtp.gmail.com with ESMTPSA id
 s1-20020adfb781000000b002060d4a8bd9sm7578666wre.17.2022.04.05.09.58.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 09:58:50 -0700 (PDT)
Message-ID: <0415ff44-34fd-2f00-833d-fbcea3a967cb@conchuod.ie>
Date: Tue, 5 Apr 2022 17:58:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: riscv defconfig CONFIG_PM/macb/generic PHY regression in v5.18-rc1
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, Conor.Dooley@microchip.com
Cc: palmer@rivosinc.com, apatel@ventanamicro.com, netdev@vger.kernel.org,
 Nicolas.Ferre@microchip.com, Claudiu.Beznea@microchip.com, andrew@lunn.ch,
 hkallweit1@gmail.com, linux-riscv@lists.infradead.org
References: <9f4b057d-1985-5fd3-65c0-f944161c7792@microchip.com>
 <Ykxl4m1uPPDktZnD@shell.armlinux.org.uk>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <Ykxl4m1uPPDktZnD@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_095855_214082_1546348F 
X-CRM114-Status: GOOD (  15.97  )
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



On 05/04/2022 16:53, Russell King (Oracle) wrote:
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

Hey Russel,
The idle stuff enabled CONFIG_PM=y though in the default riscv
defconfig, so it is not confined to just QEMU.

I am not sure what the symbol for the generic phy & I am not at work
to properly check, so I hope this is the relevant part of the config:

CONFIG_PHYLINK=y
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
CONFIG_FIXED_PHY=y

If it isn't, you should be able to generate the config I used to cause
the error with:
make ARCH=RISCV defconfig

If you look at my response to Andrew [1] you'll see that my problems
are not isolated to just the Generic PHY driver as a builtin Vitesse
driver has issues too (although validation appears to have passed).

Thanks,
Conor.

[1] 
https://lore.kernel.org/linux-riscv/60fd1eb7-a2ce-9084-c567-721e975e7e86@microchip.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
