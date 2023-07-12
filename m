Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C69FEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 05:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1AO+Cy7jmGDrz3qO7mwHqDbXDpryReLWrBjzjHGeATc=; b=uEMXESJuP7AmYa
	TuvmIb7E1+c1x4awvCNLVwa5PJQB4CHMI258FXJvFP1qMdaRw8C8irHfbymDKPDTtsWLwrw7uB8So
	MZ3Gh7vnuR28oo7cccn7NCl7yh8838FPre+5MeV1iGfJ/B9uJZHIeJp7LKHO3aiZTGMWRNDCppTlm
	J9zNHsf2aMV7woZ/i4PdDyHRwDxxJ7veldcM5CGD3j+3uBS/ewgVKU9kgLNDSMI+S+G3hH6CsVRSL
	/5ncZjhZn16eWkDsL0TB/S7+nDIY67ge8Z/W4C19X9ckDUG7SIQvShukhDdwCRicZgTlepKuR3KJ5
	OkNXhjeFZdadOTKrJBhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJSXs-00Gay5-1w;
	Wed, 12 Jul 2023 05:37:48 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJSXp-00Gax7-1W
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 05:37:46 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4fb7769f15aso10620654e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 22:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689140263; x=1691732263;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+pDAwsES6/UJGMRnoH6Hw6ybZSO8OTJt1TeRcdDP7sc=;
        b=aJtz6FNUeRcV1954EDvaz2DjKt0ooaO6XkF2f3HAIeuTpNylBKocZGx7tyt82eKCax
         7j7TZayLViSKP/vwaG3NeGCXPvnFPyrIDLAKW21qpfmNLkLKWWxeeKFrrMN0R6hPEjMw
         wsduODQAySQvq2EIzb8Wm7C6A39Dx4oGk+QHjfl0pgeuXAswYseoLyzux4tUtWep1tJX
         BcbIXcuSCT3VsvHyFourgbu1CeukdgF6/42swclh+kWobVB3xigJAhvgk9tux9iMsvuX
         i/W/weC7ErGg/PlyhkROoAAxXYSFYA6O6F+p2X/QS8QcROfF22lnWdCc/AExjAk1ySUY
         reXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689140263; x=1691732263;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+pDAwsES6/UJGMRnoH6Hw6ybZSO8OTJt1TeRcdDP7sc=;
        b=HJXis5p1aMEfRnP1JtaOgeC+klpWe1K5oIfBHeLv2ZP39d9WY+yTYY0IHahIT857K1
         z5DwNUFvZB65dckki7rjX437Pvpkf33cXyt4OkAWPFeaOnGUmUHFRI1U+LvAtUDHw2oK
         O48ufArK+xqIFcFteEotLo/CdwCjbouzBIlNyYZO0QIC98fV9TczgAYz14U6sZ1P/3m0
         0mQeUYOXBmlRgRh08aCj0LXn8o7vyH2Bq1avBaIl4qQX6xBohHCdBAcsALHNQn8xPWqe
         KuJTKMEa99yFhzbkAgE59uBqXIW0ykKWcrAGsHqXNZOk6zXGG4oNiNFcjx/jqBK5IhXG
         yPXg==
X-Gm-Message-State: ABy/qLbrNpGbI74MSO1Jwao36EhjDQikHNgky3kIQINwO5mCsDMW+tI/
	dwRPVb9c1hYxtRXWMTEwUerv2A==
X-Google-Smtp-Source: APBJJlEwqhkXOyt65V84KWLF0TrTw7ci9mw3/uJcSEo60JbAasj5LSNrmdrbPO3QWDCuzxL6PufJWg==
X-Received: by 2002:ac2:51bb:0:b0:4fb:90c6:c31a with SMTP id f27-20020ac251bb000000b004fb90c6c31amr12514057lfk.14.1689140262956;
        Tue, 11 Jul 2023 22:37:42 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id d18-20020aa7ce12000000b0051ddfb4385asm2199187edv.45.2023.07.11.22.37.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 22:37:42 -0700 (PDT)
Message-ID: <b3723443-2a27-0a51-babd-b36eef095913@linaro.org>
Date: Wed, 12 Jul 2023 07:37:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 1/4] iio: adc: Kconfig change description for Allwinner
 GPADC
Content-Language: en-US
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
 linux-iio@vger.kernel.org, Maksim Kiselev <bigunclemax@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Cosmin Tanislav <demonsingur@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Leonard_G=c3=b6hrs?= <l.goehrs@pengutronix.de>,
 ChiYuan Huang <cy_huang@richtek.com>,
 Ramona Bolboaca <ramona.bolboaca@analog.com>,
 Ibrahim Tilki <Ibrahim.Tilki@analog.com>, ChiaEn Wu <chiaen_wu@richtek.com>,
 William Breathitt Gray <william.gray@linaro.org>,
 Haibo Chen <haibo.chen@nxp.com>, Mike Looijmans <mike.looijmans@topic.nl>,
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230619154252.3951913-1-bigunclemax@gmail.com>
 <20230619154252.3951913-2-bigunclemax@gmail.com>
 <2148594.irdbgypaU6@jernej-laptop>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2148594.irdbgypaU6@jernej-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_223745_533762_F4FDE9AB 
X-CRM114-Status: GOOD (  10.56  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTEvMDcvMjAyMyAyMDoxNCwgSmVybmVqIMWga3JhYmVjIHdyb3RlOgo+IERuZSBwb25lZGVs
amVrLCAxOS4ganVuaWogMjAyMyBvYiAxNzo0MjoyNCBDRVNUIGplIE1ha3NpbSBLaXNlbGV2IG5h
cGlzYWwoYSk6Cj4+IFRoaXMgcGF0Y2ggYWRkcyBTb0NzIG5hbWVzIHRvIEFsbHdpbm5lciBHUEFE
QyBkZXNjcmlwdGlvbiB0bwo+PiBtYWtlIGl0IG1vcmUgaW5mb3JtYXRpdmUuCj4gCj4gUGxlYXNl
IHJld29yZCB0byByZW1vdmUgIlRoaXMgcGF0Y2giLgo+IAo+Pgo+PiBGaXhlczogZDFjYWE5OTA1
NTM4ICgiaWlvOiBhZGM6IGFkZCBzdXBwb3J0IGZvciBBbGx3aW5uZXIgU29DcyBBREMiKQo+IAo+
IEknbSBmaW5lIHdpdGggdGhlIHBhdGNoIGluIGdlbmVyYWwsIGJ1dCBkb2VzIHRoaXMgcmVhbGx5
IHdhcnJhbnQgZml4ZXMgdGFnPwo+IAoKTm8sIGl0J3Mgc29tZSBmYWtlIGZpeC4gVGhlcmUgaXMg
bm8gYnVnIGhlcmUuCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
