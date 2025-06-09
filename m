Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1222FC5B552
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 21:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tHrHMaEyq0ye6Ek4JS63su3dF+v0VhYwBxfPsb55uEM=; b=009ZQTMAYG7eTu
	ovkofixe2YHc6xg5qvSLF9omEGnt2Vl50x7QdxFuy/d/pHIX3tRHt87p/Muoraf+kGa2N78cA5o11
	OXa1q6+pSIe697prAo80NSUdwMXz1Ytz/uHlKuIt9F8As4wUrtCMpgDDUQEU9ecKS3tzCGqlrI87S
	eUsBANruvGR3iZA+in1YyMscRN8CEhlBo1VJ+vnCuVO1oPk2Xda9U3BwyIvtK2fSGK/lQgHXhuFkd
	QRMKp096PXydnYKNZfR8G6Yk7VkpL4vgfIk8fS8Fa2P6d8NQDrFSOEeitCMaT3fr8utpJImmTEVPc
	LKugzELhZ4Nm4uJ7cCyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOkIW-00000005Hta-3dTO;
	Mon, 09 Jun 2025 21:44:52 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOkIU-00000005Hsu-0dvn
	for linux-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 21:44:51 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b1396171fb1so2468943a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jun 2025 14:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749505489; x=1750110289; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/hTRjO+/iO4nm56OljGgthZtGT2JgGw2007wQVtYCLE=;
        b=RRZ5UjHHOI3f3JryK1uCaee0i5oehvjlgzsszeq7saW/InJ9Y4NgSquevIwodn7lKu
         Ghj3h+qzKxe3TUOXMo8U18LBpecivFBDbZdZ7+lxfipNeWM9f1jRCdftmMmbbvdZCJZu
         Felr6Vpp+RQj1Rv5qKsDIcWyxSqlxIIjNgilFQEy+HPCWrwLjaCI6w8F2+8tZ34SxcQG
         YvRWRj4p65jZGVhgejSkTpTUGnM5ZGFZ95fANEd979rK67/m0eGr70HOm6SNoxr9NBeM
         uM0Lc1/H4PObyOQ4d7EiI8Mv4gLlZYWIp7trQLdYzbjcFmr+NF12ZtrClmLgA5iJx0a0
         bD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749505489; x=1750110289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hTRjO+/iO4nm56OljGgthZtGT2JgGw2007wQVtYCLE=;
        b=Td0nCN6sIMxndSBY+BLIBOasUi4/ZJiphXQ8ixy1WPKJs2M0CP0Z3PEJjrbq2kodLU
         Zs236GkhdSO+meZa7SH7EpNIQLO/5ayrbgHywbW9BRTgMF7TQOtTCPhBJrxheaOr1BVL
         yt33jVFHprGW7gTSC8baquDLFlGUqRUAGrA6+Xzjbc8GNDbLhXjVG9uywsshzYeG9dBo
         3bMyAiQNJONEQrWdpkim+FUB/b8ijFp78wqnQV1SxuqgyMyyW3NxmRGP+JJjDRFXqBTD
         mpURJVL+TCNM0s+sEcuIuv5kDo2gKeNdWDSnWQmOL/9NV2dBWONpTjPvc4GujEOKZBdQ
         lO3g==
X-Forwarded-Encrypted: i=1; AJvYcCUF9hIOjKWYZW3gHlZg79kJ/JWeYYMNdSzItYg+n31HrCfK+4F+v8VGcb6jB/CP2IPWtHovFLSnx72zEA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5J5++R7I2kGB/Z8WfvyrH8Cnw6U6ofK8zr5TWV1ASiolsaHbz
	L9yrwcVYGZDMtATylRWftmTkwE0y7Tuodwx4Kre6dm7LiNamH0ovneri
X-Gm-Gg: ASbGncvYBCdOwncQYe5ytl1reMnLea4r0+M40KzZgy83wTKZQcapG9illUgy54hEniD
	5G3+sOqaRsMU1/x/WGlUoYvxrI888wEYr3gH9r+2rOHpZjV+51KoyJv3pm7FA8qEu6IVxgcmS70
	Yi6i7GdqGm9V3TwI3qvi6g76iZTzX2/p5ie4bSghwPDCqf1C3hUbCYUYlouONlEIua0HHLqLj9i
	WgnW9acvu53D7Qzkmy9DaPDKWaJnCbDfFsx/1Hilc3fygFgHjeaktvuAgVpDWj42BDLNcXQ8MyY
	dnZqiY4VZvZS/6PX8Z0US+MJ9PVaS/jO31vKKzkpono6+XPt/iGudeD3Tr8jpcsh9dZWZy97dh4
	Iu6UKBAT5BA==
X-Google-Smtp-Source: AGHT+IFIhIRlu7H7GRIM5kBMPGnoyOA+Q6qRh2XJheD4Aw8wYGONksyoiadJyqU5st/9HYNDVMedvA==
X-Received: by 2002:a17:90b:50:b0:312:f0d0:bb0 with SMTP id 98e67ed59e1d1-31347302a8emr25430172a91.12.1749505489349;
        Mon, 09 Jun 2025 14:44:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3134b044ef2sm6155649a91.3.2025.06.09.14.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 14:44:48 -0700 (PDT)
Date: Mon, 9 Jun 2025 14:44:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chiang Brian <chiang.brian@inventec.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 2/2] hwmon: (pmbus/tps53679) Add support for TPS53685
Message-ID: <156dc4d6-071b-4cc5-bea9-4579c140b2f9@roeck-us.net>
References: <20250602042454.184643-1-chiang.brian@inventec.com>
 <20250602042454.184643-3-chiang.brian@inventec.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250602042454.184643-3-chiang.brian@inventec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_144450_194868_28739F5A 
X-CRM114-Status: GOOD (  13.58  )
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

On Mon, Jun 02, 2025 at 12:24:54PM +0800, Chiang Brian wrote:
> The TPS53685 is a fully AMD SVI3 compliant step down
> controller with trans-inductor voltage regulator
> (TLVR) topology support, dual channels, built-in
> non-volatile memory (NVM), PMBus interface, and
> full compatible with TI NexFET smart power
> stages.
> Add support for it to the tps53679 driver.
> 
> Signed-off-by: Chiang Brian <chiang.brian@inventec.com>

I was not copied on the first patch os the series, so I guess the idea
is that it is applied through a devicetree branch.
Ok, with me, but I get

CHECK: Alignment should match open parenthesis
#260: FILE: drivers/hwmon/pmbus/tps53679.c:151:
+static int tps53685_identify(struct i2c_client *client,
+				 struct pmbus_driver_info *info)

WARNING: DT compatible string "ti,tps53685" appears un-documented -- check ./Documentation/devicetree/bindings/
#295: FILE: drivers/hwmon/pmbus/tps53679.c:316:
+	{.compatible = "ti,tps53685", .data = (void *)tps53685},

That means I'll have to wait until the deveicetree patch is available.

Other than that, please fix the alignment and, while at it, reduce the
number of lines in the description. Line breaks should be at ~75 columns,
not ~50 columns.

Thanks,
Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
