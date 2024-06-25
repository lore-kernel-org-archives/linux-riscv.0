Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E51C30653
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 21:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gxlBhOMCTdWBXX+BzF7uytOHphWTYvM2qciDNvSyvcs=; b=nlKJhrq7BDNGxn
	+7k+A96bUxOz08pBJdmHIVZSiRQf5rFTRIAPxuPkL9pQr+giGY7VhQUKnrdNUzQajjF608pQSxWgm
	8uG8WTkdP3WrBbr0sBz/jZLOUL+AxOEv4m8ZnV9528UhSnl2VrVJ2ON/OnkOjlRlJZ66NHsAzVtJY
	appYpl1fde9ovsUXPTUwy1mVRzi4LaIDSdjBN2BupgWc9mZToAk3hzkaq0/EezKBfSyUV6EjOKoEd
	5QyUFETdrnTV+0FOWwsyRi3XtMzDS5puNUV9bs4W/pkEL2LkuI3OaGgIYsH6ohtoe+N9VebGL8rB9
	R7PMEwmL0oPbWPbHCahw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMDhx-00000004ZNB-3nfd;
	Tue, 25 Jun 2024 21:28:09 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMDhu-00000004ZMc-1WnS
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 21:28:08 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-70df2135426so3842348a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 14:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1719350885; x=1719955685; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A1r4l6HFUMlYZBK3ASo/iXUshrc4QotCCtzj0pg5kTM=;
        b=XkNdsqpVYwzTmeD+Vqanku1D1K9wl6TZmHD5PFk+l7xJKVs7GsIB4xRbD8/YXpShb9
         nM2jwlW/HIX4raeX6m925FKkVfDDyh30mdMYr5MIDx2rJ1lS0DRRmNTgXxZWX5iXFP9K
         qaAVhrtj5bAWJp9K+u7y55jgYuqG+JMNtoAaFduW1soub58fkNlkzowmy0+TeW6GQ6I+
         mTSEkGBkFegZDujR+DZcAJhfp0HW7M5TmPA7MgcvqJnIIH2VcKmY8cdemDEOtNOalGS1
         7/mfxxz/bmq9oEVDGhld2SeMIfUeC0iWPkRc2Zzm4xeDgvhUVTsDtbqyyUZeYzS6NvZj
         W6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719350885; x=1719955685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A1r4l6HFUMlYZBK3ASo/iXUshrc4QotCCtzj0pg5kTM=;
        b=iNixBUftgaBCFbGCqOf9iTxSSi3KHK+96DCnFP1s5zE6Q0zx95sSroBAl8Ag1On3F4
         PpfJxkf/m3mjg+5oOLw7z5Y68FMPy2X0O7rT2AriLdi6rfaDyiNZvvKXNKkZ3iwL2z4d
         ucPzNXDOQtZvjFL8fTwVmWRo/ClO2OVAvORHHeKnc6hqsUwIEmcSICPZ3M/hHXwdT1uR
         Yh4BVLDiA61eoQgO+5TEjkpPQo5sDskGHJNmKMPCPJdxfQOKGM+DabwIQ9gJyFhslNEd
         3aA8of0LPnLUVEfrFNg5xxA5PjvQ3ZTvui13gGHSI4qy9n3X1OW41HfW9ZL1u2z8S6/J
         cAiA==
X-Forwarded-Encrypted: i=1; AJvYcCV7JKQw/BSKJn6u2gxyNbW6A4S8eE9f7eUufnhHoCjqPnxek1ntEAX5UiPWtvua7goMToK/N+6O61rhcKInUDYqasqK2XLQfS+TpXQFSmhJ
X-Gm-Message-State: AOJu0YxhZfUaY7/mMM2BLZ1SCHKp4wz4g6QwmDcw8EVKYdsVP6bU42oJ
	87BLxk0jglRXA0jTaMTh2uh1eHjLwSPLJzdptyNS3kcdAP3qjNX2iFWJJcaFt8w=
X-Google-Smtp-Source: AGHT+IF1wPRNUvfKSqic46io4hJ6cPQM9dwgCJOIjywzyzTc2kNb5CLHDE30NmfEbYtFgADVGgR2MQ==
X-Received: by 2002:a05:6a20:6a1a:b0:1b8:7df1:595b with SMTP id adf61e73a8af0-1bcf7e7ee37mr9295656637.21.1719350885039;
        Tue, 25 Jun 2024 14:28:05 -0700 (PDT)
Received: from x1 ([2601:1c2:1802:170:efe7:d185:104e:b7b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb2f0353sm86167555ad.23.2024.06.25.14.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 14:28:04 -0700 (PDT)
Date: Tue, 25 Jun 2024 14:28:02 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Conor Dooley <conor@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 0/3] Add I2C support on TH1520
Message-ID: <Zns2YnLSDZfGgrIP@x1>
References: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_142806_503150_B2DF0751 
X-CRM114-Status: GOOD (  21.72  )
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

On Tue, Jun 18, 2024 at 09:42:37AM +0200, Thomas Bonnefille wrote:
> This adds I2C support in the device tree of the T-Head TH1520 RISCV-SoC
> and a default configuration for the BeagleV-Ahead. It appears that the
> TH1520 I2C is already supported in the upstream kernel through the
> Synopsis Designware I2C adapter driver.
> 
> This patch depends on the clock patch from Drew Fustini
> Link: https://lore.kernel.org/linux-riscv/20240615-th1520-clk-v1-0-3ba4978c4d6b@tenstorrent.com
> and the pinctrl patch from Emil Renner Berthing
> Link: https://lore.kernel.org/linux-riscv/20240103132852.298964-1-emil.renner.berthing@canonical.com
> 
> Changed from v1:
> 1. Remove redundant example for Synopsis DesignWare-I2C bindings
> 2. Remove Node Ordering commit as it has already been taken
> 3. Remove EEPROM label
> 4. Rebase on pinctrl and clock driver patches
> 5. Add pinctrl configuration
> 6. Replaced the fixed-clock with a correct configuration
> 
> Changed from v2:
> 1. Reorder nodes to conserve ascending register node ordering
> 2. Add support for I2C2 as it probably use the same controller
> 3. Format comments to match kernel coding style
> 4. Reorder nodes to conserve alphabetical node ordering
> 6. Declare I2C2
> 6. Set pinctrl pull-up resistor to the highest value
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
> Thomas Bonnefille (3):
>       dt-bindings: i2c: dw: Document compatible thead,th1520-i2c
>       riscv: dts: thead: Add TH1520 I2C nodes
>       riscv: dts: thead: Enable I2C on the BeagleV-Ahead
> 
>  .../bindings/i2c/snps,designware-i2c.yaml          |  4 ++
>  arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 84 ++++++++++++++++++++++
>  arch/riscv/boot/dts/thead/th1520.dtsi              | 60 ++++++++++++++++
>  3 files changed, 148 insertions(+)

The I2C controllers and the EEPROM probe okay on the BeagleV Ahead:

[    3.834654] i2c_dev: i2c /dev entries driver
[    4.037875] at24 0-0050: supply vcc not found, using dummy regulator
[    4.050303] at24 0-0050: 4096 byte 24c32 EEPROM, writable, 1 bytes/write

The EEPROM on I2C0 is working correctly:

# hexdump -C /sys/class/i2c-dev/i2c-0/device/0-0050/eeprom
[  196.438252] random: crng init done
00000000  42 45 41 47 4c 45 56 2d  41 48 45 41 44 2d 41 30  |BEAGLEV-AHEAD-A0|
00000010  0a ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
*
00001000

I did have to modify the .config to enable the necessary drivers.

Could you add patch that includes these in arch/riscv/configs/defconfig?

CONFIG_I2C_DESIGNWARE_CORE
CONFIG_I2C_DESIGNWARE_PLATFORM 
CONFIG_EEPROM_AT24

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
