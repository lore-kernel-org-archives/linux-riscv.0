Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CB2C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Apr 2022 08:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=owjsGDT6raPOtCXNHLPgtkCkSdahny51nCf9xg/UAsU=; b=bbl/+l5l3oviPa
	q7g0cB6ea/uEnaFbBNsPY4VnOQYeSJUsgrxEOi6xRltyRODnKmeknZfPhfGyatduxeCUHgm4METHq
	8njaADijVylhV2qrhAoICKwUHkZkvwpID6ASjL81jQcWyX0j55tpAcTk1rVp+PNmAbxLn/JxFmHNa
	na4btWgvwokbV33AsquNEy8bIDIMRHjHlR+a3O1qRKcAa1te2K0IcK1MKDwe9jlQZzndZGlgLm3IG
	Ijzii5UtiHmprUM6SPeskHjSDEjoKB3HxtCT6vfLrkl7UVD/7cWFKayi1Zk0B6FPGzZH0PUzuCYk8
	jgpsBOChYETJLWEkl3oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndSgJ-004SZf-So; Sun, 10 Apr 2022 08:12:23 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndSgH-004SY3-4Q
 for linux-riscv@lists.infradead.org; Sun, 10 Apr 2022 08:12:22 +0000
Received: by mail-ej1-x62e.google.com with SMTP id u15so6413753ejf.11
 for <linux-riscv@lists.infradead.org>; Sun, 10 Apr 2022 01:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FtELbYASsIxS0aQTgGGqXwDAZ/GpbndTchli/odvm3k=;
 b=gYBRVF/kBdNo3ij65pV2qlbIreM4cbzN/gCh0MV+6pP9HCfyM9MOvSck4PyIn9ivS8
 T01nzCS4cwJ+WMQv+JduJw+jO/5OOZiQCVabi0RqfbS0zQsRP0jRpuz3iUO3dXGYDgDK
 JFfgP0cmD2YwzbK4CZle/nnOVVlKL6AhLMxDoBbSnOnKzRx6zDOT1xuHfs4Mu1qX8QFW
 M36NJ9LhTUnPvB/uBADohvlD9G9we/OIYk79CEKEmaCPMbPOGS0/zroSyEY/e8qSvtbI
 g/IJdPneWDtxEWggm00OcjfBXP99I61MC0WoP70iLFMK4AOmUbTuBov152RngifrSHwQ
 DSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FtELbYASsIxS0aQTgGGqXwDAZ/GpbndTchli/odvm3k=;
 b=nmPDkO9npWNDm80Pe/7VWbyPHceAzDej1VRHM9Sz9fWMX11WteLwop+H/qCzlINvmo
 QD+2je37vTdw7RUlEihtet9zbmxo73YyUwV+bjAjpfo+TToGcf49Uny8JHYWAQx8apk4
 zJOHfp94a5qRupx3akpd802NoZw6Dc+XY22HbPPDDYyp6+nTe8ssO9uF0B6O+Kf7tqT8
 DO931savsXiNElvBrW3jRHPess02BhInNUXUHX/mRFmpSo0TSg4GQUvsWdYreVPhNahe
 1Rp1J+nLizErYOr60cjlyAGtZTcq5QKRLZuMpVOIM4h1pYmPeCu4SjQRjl1nyywUvm1l
 d+Cw==
X-Gm-Message-State: AOAM530FXv0vrwcdTlf6vBRWD+eXjo9N/tYrLKRtWaqDzpW2iSv4gnJk
 tQSS9NqzW7FptgD2epcSRp4BwA==
X-Google-Smtp-Source: ABdhPJxsZUC9oxQbPCBUcyzIoMbQjfj3XeNiOb7tZ6MkaNwW/bpJ/JstEQ9Hp8nxvD3ij5ICrqtI0Q==
X-Received: by 2002:a17:907:6088:b0:6e8:62ea:1dae with SMTP id
 ht8-20020a170907608800b006e862ea1daemr8379303ejc.173.1649578338482; 
 Sun, 10 Apr 2022 01:12:18 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 r18-20020a05640251d200b0041d1600ab09sm3987710edd.54.2022.04.10.01.12.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 01:12:18 -0700 (PDT)
Message-ID: <c0ff5173-aad5-1814-6758-89d99e83b936@linaro.org>
Date: Sun, 10 Apr 2022 10:12:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 0/7] Add rtc refclk support for PolarFire SoC
Content-Language: en-US
To: Conor Dooley <mail@conchuod.ie>, Conor Dooley
 <conor.dooley@microchip.com>, sboyd@kernel.org, aou@eecs.berkeley.edu,
 paul.walmsley@sifive.com, palmer@rivosinc.com, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, robh+dt@kernel.org, krzk+dt@kernel.org,
 mturquette@baylibre.com
Cc: daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220408143646.3693104-1-conor.dooley@microchip.com>
 <1fa15b36-7a84-e0ac-2c56-d6a2bec566ff@linaro.org>
 <cc11d576-3670-ff0a-e0a1-e92780a04c2a@conchuod.ie>
 <98026c4a-a065-3965-27f0-71de29cdb264@conchuod.ie>
 <7e6a0489-f90f-a362-e37b-b219fe2d71fe@linaro.org>
 <8a7e16c3-ce17-3726-5702-763d57075c25@conchuod.ie>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8a7e16c3-ce17-3726-5702-763d57075c25@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_011221_258308_7B69D193 
X-CRM114-Status: UNSURE (   7.99  )
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

On 09/04/2022 22:17, Conor Dooley wrote:
> 
> Do I have to maintain backwards compatibility with the device tree
> from before the board actually booted mainline? If not, I'll merge
> it all into one series, marked as fixes. 

Usually not, although it is not actually my call. :)

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
