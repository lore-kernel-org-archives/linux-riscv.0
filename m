Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED68C3DA6E
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 17:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=udAxQ2lCuNBdV5ke4miPo41dCNt3VLGcJ7FK9CHXd2s=; b=zbAC+PSvL6wd31
	DjuhZZy4NSxdMLFMWXYwbtjDyPPxvJCoZ1fW9L1EDBSgHK2+TVAHK5ojxFDMDE3pKe9vQeBsERyP6
	dovgF8YI/Iuz3Y4oy4G/k+gGjiGZcgEgGhCS1AOTDfNjCpNd2Gt85zOGfLccIttlm+5tkYLu88jt2
	QX4NdZiOV6notEeFqlz5DWNVxxd2/IigKvxvlJrU7b6vv//rLGc2syZzew6L+QESPzN79A9pk2xvO
	CGJ1Nt4eKQ2Km0N8Rtcq5gzFbmxSxemZN+wYGX2m0fVXJDBwKzlkKxZjQfztOT1XK2p7xWMqDlJkl
	xPmxlpzar0xgZQsDqcIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLo0A-00HPo5-0h;
	Fri, 05 Jan 2024 17:28:58 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLo06-00HPn6-1z
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jan 2024 17:28:56 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5cedfc32250so360006a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 05 Jan 2024 09:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1704475729; x=1705080529; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7MvMmIGG1OTvVGECDwkCBOvxHZpT09eejRG7w2yah/U=;
        b=CDna49bMFrsG9x7Ul2dfDyxuqql7GmxH2gfNjbVTVvAzxBW6D3iKcZjq/lRDdRW5kT
         jJAyOt14bllwZpZEMOc86iL5R5d62q54FWTdLtihHxOxo7UqyZusrsxSO774wbtJ4lib
         OOgwYqg9Z6seYh4fVYyQ4ei/Mws0GuepZBDPuinUP8xtP8GMbvGDoepbB71LSsJnCQFH
         L5vj/kWPBf9U1l38qKQMTpTKq8voK7awr/yptHXGMpSqnz8tNp8cDmK0WOyc9Vy25Fqs
         0jCaSEvQs177UBrajS2cZH5vFOBq8Wf9SdzLQXqbij4PBo0K6wzAU8Sb3HDFYYTR/Rci
         N6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704475729; x=1705080529;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7MvMmIGG1OTvVGECDwkCBOvxHZpT09eejRG7w2yah/U=;
        b=by9EkEK31P7X3U0XvQXKdapnvvUkZjNV04Lr4jP1fD/tkQOKHV0vwlVXwROrPa0dM8
         S2HgTzw/FV7S3KoRP3zn9Y5+YIjfqxEsFi3t47Sb3CW2P1iyMNoXF5V1CiPLg1C1ELxB
         opIAGOcEyU712ecOuGs6IDiEHo469k/Yqa3dPKkFI28Ovi5QsODcWoAX0KsRQTe3LVtA
         OmcFW+hgzmFCq/1NJU+9oz4ns2iC15rnyDkQ2CL0V60W7zUM+aZov4zsJn9tyQ7oMGsk
         Xsy8avg8R3i6MflPfltWMtVo+MKR9CV96sVPKaBV0aJEZpC9CqBY0qHV0SAxj53rBjvf
         w7/w==
X-Gm-Message-State: AOJu0Ywazz3ap/n2ZDqVzbCGErggOrU2YjRhI9GxsV+ncgQe20WY1x+P
	fPkXrUT2GCNuCbfERajzJDUQEvf1fofU3g==
X-Google-Smtp-Source: AGHT+IHuOnm7hs+MIF/YDJktAeTmGWj9vojY0HSziqVUOflzq8jI2uyPNPQQRJu+YUAC/BW/uA1VRg==
X-Received: by 2002:a05:6a21:6da6:b0:199:4e21:f71d with SMTP id wl38-20020a056a216da600b001994e21f71dmr690529pzb.87.1704475729519;
        Fri, 05 Jan 2024 09:28:49 -0800 (PST)
Received: from localhost (75-172-121-199.tukw.qwest.net. [75.172.121.199])
        by smtp.gmail.com with ESMTPSA id fi39-20020a056a0039a700b006dab0d09ef0sm1622087pfb.45.2024.01.05.09.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 09:28:48 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Kevin Xie <kevin.xie@starfivetech.com>, Minda Chen
 <minda.chen@starfivetech.com>, Conor Dooley <conor@kernel.org>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring
 <robh+dt@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Daire
 McNamara <daire.mcnamara@microchip.com>, Emil
 Renner Berthing <emil.renner.berthing@canonical.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Mason Huo
 <mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
 Minda Chen <minda.chen@starfivetech.com>
Subject: Re: =?utf-8?B?5Zue5aSNOg==?= [PATCH v13 0/21] Refactoring Microchip
 PCIe driver and add
 StarFive PCIe
In-Reply-To: <ZQ0PR01MB098128579D86207B4B9BA7D28266A@ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn>
References: <20231214072839.2367-1-minda.chen@starfivetech.com>
 <7hfrzeavmj.fsf@baylibre.com>
 <ZQ0PR01MB098128579D86207B4B9BA7D28266A@ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn>
Date: Fri, 05 Jan 2024 09:28:48 -0800
Message-ID: <7h34vbbsfj.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_092854_903517_BCE8EF5D 
X-CRM114-Status: UNSURE (   9.68  )
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

Kevin Xie <kevin.xie@starfivetech.com> writes:

>> Minda Chen <minda.chen@starfivetech.com> writes:
>> 
>> > This patchset final purpose is add PCIe driver for StarFive JH7110 SoC.
>> > JH7110 using PLDA XpressRICH PCIe IP. Microchip PolarFire Using the
>> > same IP and have commit their codes, which are mixed with PLDA
>> > controller codes and Microchip platform codes.
>> 
>> Thank you for this series.
>> 
>> I tested this on a VisionFive v2 board, and it seems to probe and find my
>> M.2 NVMe SSD, but then gets timeouts when trying to use the NVMe (e.g.
>> 'blkid' command)
>> 
>
> Hi, Kevin:
> Could you please provide the manufacturer and model of the M.2 NVMe SSD
> you tested?

I have a 256 Gb Silicon Power P34A60 M.2 NVMe SSD (part number: sp256gbp34a60m28)

Also for reference, I tested the same SSD on another arm platform
(Khadas VIM3) and it works fine.

Kevin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
