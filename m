Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7536CC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 14:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e6F4Cspoj2tzC3ul/1Wc0EJn2aRlSm54vcS35GOJdb0=; b=3XbPQu/OTFqFAv
	Sl69/eEl5ARYrzXRasQzoHt383Kb07ufrniJIUHt3cQ6+kSlEPGmW9xmRrKL0XTgvO/UfeULYqu7T
	wPT2WEE5fG21FOcvYbHWJ6Vy2HC5bydrrQVTr8UgyCGvKV2fCpx1i9SS9jENnQLDg74DKgoETgmJH
	yurLgWj0Qz5HDJOXuuT+wrZiWJichTt+1SUCPA3gZmV9WJr+LMktAZTTstZmZxWfIepBAw3az3MhC
	AHb63rCgmGWzbLn09vmUa71mPNQNJr7maiyxjseSoyFet/EHBmuGENcEaV+C5MK34CPN6nlqitesD
	097+lJ1Bn9FAxo9Zr5yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncq3H-00071h-LY; Fri, 08 Apr 2022 14:57:31 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncq3F-00070V-IT
 for linux-riscv@lists.infradead.org; Fri, 08 Apr 2022 14:57:30 +0000
Received: by mail-ej1-x635.google.com with SMTP id n6so17781645ejc.13
 for <linux-riscv@lists.infradead.org>; Fri, 08 Apr 2022 07:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bwWAsuVSyIcDlyBKBBDsTR0Suq2qXvRKtK+9kqXxJPg=;
 b=xY1Pzqt04xUTAmgyDqXLrjjJ/AWBFiky28VR5a2eQlfnIg7YMfbLJsKQzaTCjux/nv
 qIGKMKoWMfy6arkHpKNRr8bYhlKTu9SqyHu/BO7BEL6Lhpqj65Sx2j348KZrKbiRuO1U
 V++0f2I8nmZ+NRA80VaMqBRcJhYSux1n3PXfqXGEJLWdN62fMkEH/dxpN1V+pE5dbRem
 Emxv6zOyv+t7hAcONpvF2Dhxmr5jodbyrd4LL4j9Hxm/gC2OglvgTw1EiKr/lN8q7pR4
 ChGDmN4d4ukhI2hMTVvyWy83eEMQGDck00bzTmuFp2nslLx3YTuB8xx36C2sp3vSguoW
 zppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bwWAsuVSyIcDlyBKBBDsTR0Suq2qXvRKtK+9kqXxJPg=;
 b=WmONZyxegi3Eq8xtediDPtPKPwLWij6thc0sQ50wOZOo2YTSV+XXGneoQC8iKhKnmR
 xZNbrt24oLZmhkHJzaykwzTxZ84AZZmblDEqDPcY9tsdxXTHUrWCaORuo6Tl6jU2UpDx
 PeFT+v7W2rB2y9BTXNCLNyB/35x9v+toCNggq8i5XPNVEggJMbYs9roW+hHSeBNGa55g
 qqrMlryNvwb2w6lG9LeXYhrD3PbdvOndCHIzYe0uHTjVc3sO/btohQAkVWokLd+l1nMv
 XBCT1Rr7yaeyhAZJSCTMlrzM/dcBdd0Jk6riOpXLUMRYrX/R+ywATHDunbi+Qlo8jnrm
 einw==
X-Gm-Message-State: AOAM532hgbcg+ESbK/8XxaE4q8UWyj7mPRsCBlfhVwPQBNFCM3oliks9
 OesGaOHPK2dYO2SdRchXBUHWzQ==
X-Google-Smtp-Source: ABdhPJw+yTl+Mo/vlBuFxJyVx9XZK7ozwB+3E3h2yeMqdeLiLxr/cmMRzc0kZC0MLpwZlFDMI5QLrg==
X-Received: by 2002:a17:907:1c0b:b0:6e7:f58a:9b8e with SMTP id
 nc11-20020a1709071c0b00b006e7f58a9b8emr19200831ejc.438.1649429847151; 
 Fri, 08 Apr 2022 07:57:27 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 w14-20020a170906d20e00b006cee22553f7sm8742891ejz.213.2022.04.08.07.57.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 07:57:26 -0700 (PDT)
Message-ID: <1fa15b36-7a84-e0ac-2c56-d6a2bec566ff@linaro.org>
Date: Fri, 8 Apr 2022 16:57:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 0/7] Add rtc refclk support for PolarFire SoC
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>, mturquette@baylibre.com,
 sboyd@kernel.org, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
 palmer@rivosinc.com, a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 robh+dt@kernel.org, krzk+dt@kernel.org
Cc: daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220408143646.3693104-1-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220408143646.3693104-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_075729_660357_A793327C 
X-CRM114-Status: GOOD (  17.31  )
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

On 08/04/2022 16:36, Conor Dooley wrote:
> Hey,
> As I mentioned in my fixes for 5.18 [0], found out that the reference
> clock for the rtc is actually missing from the clock driver (and the
> dt binding). 
> 
> Currently the mpfs clock driver uses a reference clock called the
> "msspll", set in the device tree, as the parent for the cpu/axi/ahb
> (config) clocks. The frequency of the msspll is determined by the FPGA
> bitstream & the bootloader configures the clock to match the bitstream.
> The real reference is provided by a 100 or 125 MHz off chip oscillator.
> 
> However, the msspll clock is not actually the parent of all clocks on
> the system - the reference clock for the rtc/mtimer actually has the
> off chip oscillator as its parent.
> 
> This series enables reading the rate of the msspll clock, converts
> the refclock in the device tree to the external reference & adds
> the missing rtc reference clock.
> 
> I assume it is okay not to add fixes tags for the rtc dt binding?
> Since the clock was previously missing, the binding is wrong, but
> idk if that qualifies as a fix?

Usually ABI breakage, even if accepted, should be be tagged as fix
because it is clearly then a break of other peoples' trees...

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
