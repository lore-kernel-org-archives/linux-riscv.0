Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0402AEE4993
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 19:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EIrv7PGnkQwBlgugKBsjg8nJ8I+20hJNi4YMR2r/Dn8=; b=zd0G9+aJxhwobk
	VLOuKB1488f2KUD5aJYRrpvSq17E/vKNnNXX5mzr707aHO8I+939MozgwI1ddS/Jv4AyXleYaj5vs
	Mp8Y3ympH4npp0I9VZQSDp+IltDktLJc7JslQwih4065QMgrGq7xnYUgjSBU+Qm8aewNjTpBMz2Qk
	87IR0+gQvWWARXBVh9rqdhEXJszdNDn1woFS0+v+RXCjjDmNLEfJVPsSA3cl0MZItgyPFD+QBCEPs
	ljBkjhHLD6/2yKjJ+mlVQiF66Jsi04JbZ+lEAAK1zSsfeDkru3pHy8XNAnmU+L0PJUrh/qhAvjg2e
	L1u9qAINKyVuMpIncbEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYX9U-00GiKQ-0s;
	Tue, 22 Aug 2023 19:34:56 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYX9R-00GiJI-16
	for linux-riscv@lists.infradead.org;
	Tue, 22 Aug 2023 19:34:54 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51d95aed33aso6104940a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 22 Aug 2023 12:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692732889; x=1693337689;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dCcpTzBWSQ+IC9LwkeK4zV70VWPirwKEsLz20+SIVmI=;
        b=O8p0qOjeOgdnidaekqarL8jgxvSEdVprXfjJAmpTMB++3auX4nxd5++LFA/NI+NzpR
         z5qaVw39ymBlfaAJS0W6u7Ky3zpqr4znAD9dJW4DFfHRbTUemeXute5+wzBGm3ea6Nbr
         TZFRlem/nwuBzPJXOkRCL5/fZ/DNjovlh1bixDZb6vM6gPWx7VUWlXW5b9OmrjLGufse
         hxIEY2fkMV/oeu9M1YDVQawwF/iP7y9siRF5C/PVhI43XTMK+SklCheeW5eMhLsLFNK8
         ii8NsC1kDpT738PPvfeHeemw1CTG9+8YEBX0WnjajEH/7D6/d3P0JYCQKM4iHaCVl9X6
         CtUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692732889; x=1693337689;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dCcpTzBWSQ+IC9LwkeK4zV70VWPirwKEsLz20+SIVmI=;
        b=WDbD/u2LTVQzitx5BuP7UK7U8vjy2cArEyOHNDI2j17VdsbLUgalW2MISvmKV4wSzl
         dCcFMrH2/7pCgwytp8+7tHCdvqRsuE+v3z5F4+C+QrlXgJwHGHw16FwkFhp2+xyj9ZuT
         08ByXi8t8o2WDVeNePKuBE+k1YPNiZ4+xCV79uyA9QnDCBcs11DbGxzh9So4fWmP9rNf
         7MCgS0wXh1TeYdh/b0ZeysaoVZcInPmRn8wYnIefifZPKk/4oHt/PlkDqArMsh2Um28Q
         K7LMshlIMMFFY0tnUkurDXy5fJYhpboZU0JNGFu1ZgdlpicJbNlyYvzRCgcTS/u0mf+n
         HCIw==
X-Gm-Message-State: AOJu0YwdtOX6rJE1AKzH3H0fESV5AxUEJfjgOTE1uWswk6P90ZvRqZwW
	aU403ZGq+grCtuE5hy7DpK6vhw==
X-Google-Smtp-Source: AGHT+IFOfpyf9WYKtBPs4WToe/nFPbsX758TLW9u3YBXfFA+NpzYCUytpJ8TL7xHGho5/FmGM2623A==
X-Received: by 2002:a17:907:7714:b0:99d:fd27:b38d with SMTP id kw20-20020a170907771400b0099dfd27b38dmr7517648ejc.70.1692732888906;
        Tue, 22 Aug 2023 12:34:48 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id v8-20020a17090606c800b0099d959f9536sm8827134ejb.12.2023.08.22.12.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 12:34:48 -0700 (PDT)
Message-ID: <f14b9ce4-0cb5-5b76-ce9a-a3db9af9a9bc@linaro.org>
Date: Tue, 22 Aug 2023 21:34:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 1/5] ASoC: dt-bindings: snps,designware-i2s: Add
 StarFive JH7110 SoC support
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Claudiu Beznea <Claudiu.Beznea@microchip.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxim Kochetkov <fido_max@inbox.ru>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Jose Abreu <joabreu@synopsys.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Walker Chen <walker.chen@starfivetech.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-riscv@lists.infradead.org
References: <20230821144151.207339-1-xingyu.wu@starfivetech.com>
 <20230821144151.207339-2-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230821144151.207339-2-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_123453_382973_D6C48372 
X-CRM114-Status: GOOD (  10.54  )
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

On 21/08/2023 16:41, Xingyu Wu wrote:
> Add the StarFive JH7110 (TX0/TX1/RX channel) SoC support in the bindings
> of Designware I2S controller. The I2S controller needs two reset items
> to work properly on the JH7110 SoC. And TX0 channel as master mode needs
> 5 clock items and TX1/RX channels as slave mode need 9 clock items on
> the JH7110 SoC. The RX channel needs System Register Controller property
> to enable it and other platforms do not need it.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
