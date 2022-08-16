Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A30EC2BB41
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 07:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i7L7v9HlO+SQg4jSCB5FBNUaUwOA4nv/Rdsyj7I8Wo0=; b=HmiwakPDojEhsC
	JytXbOdS2qbcXjeoF+6WQd28Shac0LEpSdrqLDWUZVjOEG8Whc4fxWPWJPd71GGE/JFJOENWwDgF8
	4kwiBzPunnNnwQf8hdz2QgMR3ubkYztsJ2JnJwauBJeBuemVTXFkcuVB0onPRKlCfE1lj2+0hVsms
	6EhW+bpYB9sga6fMLuy5mgiCMh7PsnRMMhQqrazX72KAXMQNccWP01xIg+f525WCYeJQhREvSOJv8
	C+rzLK88315k1rnycs72zG4UpmKVNyd5p4Ap8r3VNlHZMVfUHuZ7tuDiGdGlnkEpx4n2wjZHlI5tZ
	c5cAaMGhLyBdme6e5i9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNrM9-00FnTA-SF; Tue, 16 Aug 2022 07:51:22 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNrL1-00Fm55-AL
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 07:50:14 +0000
Received: by mail-ed1-x52b.google.com with SMTP id w3so12445983edc.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Aug 2022 00:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=btmulgmWYDO5JR8p39p3Iuz/rc2ef0rGseMFoYZH5KE=;
        b=UUwbefUxfrJoEJicacb7h0c1OssFJPnj8GXTCZgjd+Zq0Go7zJ86MlpGb7KBPkgU7R
         6ZXIQy0hond0D9rS9sO7mARyG+JVP9P0xKa44ITziLauJoaVdCN7eruY6dKrgl627zzg
         B02pB+PhgIZnZUQOPAVgPgF9y9i7Y/6meHAtKtFMepMPDBmUty9gzP0TRIjWCglw+1g/
         UhBxMFFAub7F6I+4kfr1GkdChw73woRyjrXCHrij9eXKM+yZiGZfI4/rX+SzUl4gFlG9
         vOKDJUE7uc7BXlzCsfObnc/fdJkmYchuFCOtIvUhzXYt1FisJF9GqfCzNhPgAQwD2Etn
         LQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=btmulgmWYDO5JR8p39p3Iuz/rc2ef0rGseMFoYZH5KE=;
        b=wbYINIOroES/2k3xNktbr59wLnQ9XrUHX7LgxgezKnr3h8EEcjewSSJQMUqlq7ID41
         uSnTKsL8wN+SMOx34BeNGH7K5Zs/Q3TFoeVkD+8+7TW6xVU2nWdZekbnuM527wM1+TSm
         QPSjkbjDQ3CELpcDhw/+foEDnembmc6BSSej+GhJOc7G0Ic1V0NKsGcI8NIOut/kJPoi
         /nGmh+WJGIXGxSdpJCls99ZdQND7iUYYvPhCH9zPBTih1ZNeN32MqH5ZvxwHnOnCExbD
         8V2/Ys0Yfm38mp8oV6nvSelD8mjSJM+MCUrVjnx6WI3hhBT104WIMrruY2bh9DHqVpNS
         F60w==
X-Gm-Message-State: ACgBeo2Y0+sZvdGV2VOOANeCwaOMlQtWZ9IOrbP41YozVU5XaHR9KIl7
	WvSVRIQq8ZaqK2Zi9+UrVJyczWEoBlU=
X-Google-Smtp-Source: AA6agR7BWyk91qEHOc9vxFTS0qUZ56eezGGM4sHl6LeatjVguPj9qJvzTcm3VgsutYCTY31iqEy53w==
X-Received: by 2002:a05:6402:184:b0:442:fd54:2a21 with SMTP id r4-20020a056402018400b00442fd542a21mr17388865edv.129.1660636200714;
        Tue, 16 Aug 2022 00:50:00 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id fn3-20020a1709069d0300b0072fb3704e49sm4954327ejc.46.2022.08.16.00.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 00:50:00 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base devicetree
Date: Tue, 16 Aug 2022 09:49:58 +0200
Message-ID: <5593349.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <149eee7b-a9e9-94ad-1ab2-13812b541a8c@linaro.org>
References: <20220815050815.22340-1-samuel@sholland.org> <20220815050815.22340-7-samuel@sholland.org> <149eee7b-a9e9-94ad-1ab2-13812b541a8c@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_005011_473119_E6095A1B 
X-CRM114-Status: UNSURE (   8.27  )
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

Dne torek, 16. avgust 2022 ob 09:41:45 CEST je Krzysztof Kozlowski napisal(a):
> On 15/08/2022 08:08, Samuel Holland wrote:
> > +
> > +	de: display-engine {
> > +		compatible = "allwinner,sun20i-d1-display-engine";
> > +		allwinner,pipelines = <&mixer0>, <&mixer1>;
> > +		status = "disabled";
> > +	};
> > +
> > +	osc24M: osc24M-clk {
> 
> lowercase
> 
> > +		compatible = "fixed-clock";
> > +		clock-frequency = <24000000>;
> 
> This is a property of the board, not SoC.

SoC needs 24 MHz oscillator for correct operation, so each and every board has 
it. Having it here simplifies board DT files.

Best regards,
Jernej

> 
> > +		clock-output-names = "osc24M";
> > +		#clock-cells = <0>;
> > +	};
> > +
> 
> Best regards,
> Krzysztof





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
