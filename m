Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D960C7EE29
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 19:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jS8mI8DKCxCuDmCidxlshciXXUunW72qoHrwa5RT1JU=; b=ZI52jJlinyWXvV
	b5+w6FEIHHaqiZFoSWV0cLKVEXO0hhtU16/mbv28WDbHjE8NWCbXkRXBb69ePl4Py8ljXHv+FJgcR
	IHchrRU0rkGfhbbGFwaOFYX8kiJHyMbuJdtel++BEbayxYXGi1M8F4yUqc+MGDn/6OFN2b+7hU5RH
	FKo5rC20YoYT0NkeCJKQSqswEGdmyzqQrKKoGnbSsSOST36bi5loEg5KsqbLqXFRiDW5Lc7lVtJ2x
	YKbwYHVLpj3f1GrrtAjPd2Dq9flc6CR25Zxv38GnVk2JZIf1HmuMhH549cwl1lqy3FWD6W2j3T09Q
	TBznhvlCcCZmXslNTpnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q83tE-00GqVo-3D;
	Sat, 10 Jun 2023 19:04:45 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q83tB-00GqUa-2T;
	Sat, 10 Jun 2023 19:04:42 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-30fb7be435dso214144f8f.1;
        Sat, 10 Jun 2023 12:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686423878; x=1689015878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+YjzUo1B2S2csqhYjgytz5WXmvhzS96d+qxUFRdrfc=;
        b=FiZkOzgUV4WCSgew0MvSsd/J2ST7V62H/PbPxj6U9tz3f2mwkjLLt3zw1HbDLtjF1W
         O/shoVGScGEQ0UwqJTyWX/8EFv0CmSl15OH4qwVDN5umIYmpMyRs6A29TBgQTr6ITLk5
         Z0h3jDWIJuCVp3hjL4rufQHX9lpEz45mPdFILSqbPM1q2cc/asJKuImPV2Nq16Fywuzl
         DajsNuquw8QvP7Rh1m2qCXNj641jxEvMrTMxnNMNdGg+yZua95BioqffM5VNGhP4miZw
         uzSKUmDWIkjSdDqkWT+Qb5tyiP1dCIlkTdt0+PMr8IMb/dTiudd0u1YfmH9E1C+us7X/
         fj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686423878; x=1689015878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+YjzUo1B2S2csqhYjgytz5WXmvhzS96d+qxUFRdrfc=;
        b=cWS8LFBykRLu3K5T5BINGgGs/ocxD68ZY3GXe7WavGLFdu1ImRYV0bv1TIrPCns7M1
         TnZukTNSx8z1F5KT8Miwh/Mpawh6i59ANg60dAHWFn7yaYqeYZvPM8yvMZRPNfZlTYU6
         6X35BtN0XIdhySzCMjcklDG4Ae7aEDljhmMRBX/F/QU2uAg89P/BRWHQ3dwzC7Y54HDs
         nx7Ovcm0rQDc7M2gc9io+fc5qRfm4i6TXjS3gZDtVbRn937PIMuJWBa47UZTyZHD0WER
         SkTZODbjaang3u2PqjSCXBfXs1f+/g+3uohubUDvyEWB7aDs1EqtZse5H4d55eoFxlfV
         XDog==
X-Gm-Message-State: AC+VfDw1sv145vfPOQz/4gvCeSm8nn7Hr2hQZG0501QsFblzJ90bazay
	uoQ5GMyz+8NuqDGxGV2sMs62qUytmbxAmatn
X-Google-Smtp-Source: ACHHUZ7+FwyXPExmCGfTdhBoc8oJvU/zTiio5BdCHihsSEDTYpwdfYxIiMhA0liy4/BsVzbnEHqTuw==
X-Received: by 2002:a5d:448a:0:b0:30d:8490:58 with SMTP id j10-20020a5d448a000000b0030d84900058mr1191214wrq.9.1686423877776;
        Sat, 10 Jun 2023 12:04:37 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id i1-20020adff301000000b002f28de9f73bsm7764607wro.55.2023.06.10.12.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 12:04:37 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Maksim Kiselev <bigunclemax@gmail.com>
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 0/3] Add D1/T113s thermal sensor controller support
Date: Sat, 10 Jun 2023 21:04:34 +0200
Message-ID: <4275249.ejJDZkT8p0@jernej-laptop>
In-Reply-To: <20230610141739.999268-1-bigunclemax@gmail.com>
References: <20230610141739.999268-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_120441_828978_3BED963F 
X-CRM114-Status: GOOD (  12.31  )
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

Dne sobota, 10. junij 2023 ob 16:17:31 CEST je Maksim Kiselev napisal(a):
> This series adds support for Allwinner D1/T113s thermal sensor controller.
> THIS controller is similar to the one on H6, but with only one sensor and
> uses a different scale and offset values.
> 
> Maxim Kiselev (3):
>   thermal: sun8i: Add D1/T113s THS controller support
>   riscv: dts: allwinner: d1: Add thermal sensor and thermal zone
>   dt-bindings: thermal: sun8i: Add binding for D1/T113s THS controller

As mentioned elsewhere, please fix SoB tags. Also binding patch should
come before driver changes.

Best regards,
Jernej

> 
>  .../thermal/allwinner,sun8i-a83t-ths.yaml     | 20 +++++++++++++-
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 26 +++++++++++++++++++
>  drivers/thermal/sun8i_thermal.c               | 13 ++++++++++
>  3 files changed, 58 insertions(+), 1 deletion(-)
> 
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
