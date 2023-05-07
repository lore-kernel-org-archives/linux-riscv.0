Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02CFC77B7C
	for <linux-riscv@archiver.kernel.org>; Sun,  7 May 2023 07:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8MpEHW4O+mN9eSX0jeHiIUdBQHPTSVWQw/dlOU5fh60=; b=13S6RSeErzDPoq
	c8dlHfy3jA58cp5zOrStGWIyUcWmGTt6aPENpIivpCrxkXjuRyGoz2x5w3EYrhYxg+nl+ixRqzI8R
	T+VORR1zGXb/A04vJVJIwyvI+5RzpH3KT1u6mlfaTHQVfUIlo40EFybFxXcslxKTqEk/vfF8R2y/S
	Xi7WwdBHwEDz5wLw/nX3VOFr9Q+z+F1nmGgEhUWToB0Of5W0smawphn/GZ+wAe1wklQ8sk9218B23
	nLeHb//5TM6isf1YGC8FWuv1B+7Bzxzvlg6JwzjES/tkyfQ0GR1c1UJlNlt7S7xDBDVolP5lfPz1S
	VWhs5i4QTPdQ1OU2p4Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvZ26-00FRuJ-18;
	Sun, 07 May 2023 07:42:14 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvZ22-00FRsY-0A
	for linux-riscv@lists.infradead.org;
	Sun, 07 May 2023 07:42:12 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-50bc4ba28cbso6216987a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 07 May 2023 00:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683445325; x=1686037325;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c7LsKf4hNT2P5PU2ttlrUN6/LYaDAzA948pWoMKox5c=;
        b=TX9CyL9LubB7HCIURG1+Ps8Dc78L8mIBTUrXGedjhosEQ9iGX02LHYszg9TadB6CIo
         46yO19v0VUHLl0c2X3gChl153ImEt4S78UNNmTdjCtmq0Mg5eSwBpbOLhAupYxwkJKNJ
         oS/a/+Ed1XYEN2PJhetpM0ZjoYqIugG/vENX+nFzkLsJqi7FBL8rbcy6dSMMmtJpmjbN
         AJ5k5+eK/CYl7DJ6BZjPwSgPXGvHR58IALV+mBNX2Zw0OyvUEq6ps8Y1zwhXJCrbdS3F
         7jbe5cLaSf2y9pzcu9lP/I2g6xCkmiZmmrQByTDD8u2loJ937K/2v512Zy+mKhzhRvjI
         XNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683445325; x=1686037325;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c7LsKf4hNT2P5PU2ttlrUN6/LYaDAzA948pWoMKox5c=;
        b=Cc9M75B0nOd9A9Xxehpa0288ff3Hlatv5OnWTVOAIn8l4cnoWxgdAMQt3NVF+ZJMoX
         iJ/58Jkvf47r8Vob5NcjOT+EmA9uyPM2g9BoOxlVhhuOHsL2LZublxRJRUaVilVbQVxn
         zft9oLtPCDCqC6/yNEMYHExteCRaPxXFXU8nY8Rv3Dc7gdxI/WUjyzjV0+CHaWraGVPP
         qmjxobIEGDoF2XmhLIv6BBOyY+sR8KD+RXC3kWg++zmI5pf4K8F+ArHvv4vtlM+wV0li
         52/c2HeqSxdJYcs4RzFPR8UqCR5Bk8IIkSp3HNoRu4mgsPWEq8QeXE4bZ4vYTpQrhIgj
         GZpw==
X-Gm-Message-State: AC+VfDw0y4ueg/iXZtlGMAILsAik+K8V5By19mnhv4C0PQ3BYxZgBleV
	DL3i05ppfV39xUWASP1QtcOyZA==
X-Google-Smtp-Source: ACHHUZ7nHVchL2fZ7oJnUcsF/P+oA4g2/9hI1INf/q09JsCXCI3jglN2cYEWYgHUD9C7ig0v6LaKlQ==
X-Received: by 2002:a17:907:36c1:b0:94e:e082:15b2 with SMTP id bj1-20020a17090736c100b0094ee08215b2mr5508501ejc.55.1683445324962;
        Sun, 07 May 2023 00:42:04 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:183b:950f:b4d5:135a? ([2a02:810d:15c0:828:183b:950f:b4d5:135a])
        by smtp.gmail.com with ESMTPSA id j23-20020a170906051700b00960005e09a3sm3350111eja.61.2023.05.07.00.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 May 2023 00:42:04 -0700 (PDT)
Message-ID: <e757679d-0037-b2ec-f5f7-6ad4e6500508@linaro.org>
Date: Sun, 7 May 2023 09:42:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/6] dt-bindings: spi: sun6i: add DT bindings for
 Allwinner R329 SPI
To: Maxim Kiselev <bigunclemax@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Icenowy Zheng <icenowy@aosc.io>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Heiko Stuebner <heiko.stuebner@vrull.eu>, Maxime Ripard
 <mripard@kernel.org>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230506073018.1411583-1-bigunclemax@gmail.com>
 <20230506073018.1411583-2-bigunclemax@gmail.com>
 <e38cbcdf-5963-fb00-d7b2-66d4129f9fce@linaro.org>
 <CALHCpMhp07DwL+cUZN8rwa1N_PHQ1KstOB+Gw_mCWFzm5rSVrQ@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CALHCpMhp07DwL+cUZN8rwa1N_PHQ1KstOB+Gw_mCWFzm5rSVrQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_004210_153791_A2C44678 
X-CRM114-Status: GOOD (  17.00  )
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

On 06/05/2023 14:59, Maxim Kiselev wrote:
>> Should this not be set up as a fallback compatible, per Samuel's
>> suggestion here:
> 
> Ok, I'll do it in the next version.
> 
>> I wonder what is the difference of DBI compatible. You refer to "helper
>> functions", which sounds like driver... do you mean some parts of SPI
>> controller?
> 
> According to the D1 datasheet the SPI_DBI controller uses the same
> registers layout as the regular SPI0 controller.
> But also it has an additional DBI mode functionality. Support for this
> mode is not yet implemented.
> So there is no difference between 'sun50i-r329-spi' and
> 'sun50i-r329-spi-dbi' controllers types in the SPI driver.
> 
> Maybe we should drop 'sun50i-r329-spi-dbi' compatible struct from here
> https://lore.kernel.org/lkml/20230506073018.1411583-5-bigunclemax@gmail.com/
> for a while the DBI mode functionality will not be implemented?

You need both compatibles, but keep DBI compatible with regular one.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
