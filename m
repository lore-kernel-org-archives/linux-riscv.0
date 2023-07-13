Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC66EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 12:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U2V3ylcSX3w1Nqmt0566cZsZrhV83dMuW/gJ8RuQRJM=; b=QuAzjkK6vy6e8A
	DguHc6BjWD1lZEr4K4zOFYA8w2zY9dZ59v4/skR6WHV01vY6HrLyBGzolHPg8DPYz6zW+W/gQdQC6
	E+P+7ACsXUh6EYH0OlgO+9XDbCehQ5vM/iZjydMBMJ9xd/9P3BptKIu5ryXFUnvL45WKLD8Zyr+af
	wKDinqbxaaJi2on/qdPK7jD57Bwj2wz7X77xekkFt3rL0oiYRB2ohL1QVgds3U/C2OkcG70AOxQw5
	jkN5fPhAMy3C3pcB3mrfBMg9JHHaJrAvLfcJyJl/2TcOrXzo+wjmsqPfZjOtn1OGPn6EeinnwwGYl
	ucXbuQr+0+uz4pOACdDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvbU-003GTk-05;
	Thu, 13 Jul 2023 12:39:28 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvbR-003GSd-0P
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 12:39:26 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fbc12181b6so5990095e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 05:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689251961; x=1691843961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o7hFNGhDsoWdE2O4YN92/eI74pnG6KmIvX3zGxiiC/w=;
        b=xbQMjfJYZG5xGlH7W6WxJgCSO9B5u7zU/wqu37zOULkyPHL+nxjsCwcQBabaoBNZHc
         79LkTqtZQV4tNueCmdjmb2jxSTFyYbz7PD30zKWi7Tto+htv3geXFknI738sJESeY9nD
         imub6y3bVMCm5mw9dCarK+wvUuGONdC1E6R0khWlF5oRtNxhwkwSFystJFL5ULCg9Sse
         ha2Q7RV6PTnXH0g9vqaBRugZAGv0B6Yahrl/x7GsRdJiLBzzy7eJvIn9HpO+dB6ia1Qv
         tPsw0AzywAWaNWlpbJPzxTW5H2EmMURCzIB2ghhB47ZmnUPsTU2MusouAxS+qzl4/abE
         UhGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689251961; x=1691843961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o7hFNGhDsoWdE2O4YN92/eI74pnG6KmIvX3zGxiiC/w=;
        b=jgQYWPzbrILFKu13VfG/ARqE40z+EwRtwt/X/OcMzcRucYkRLpSwoXC4bbTcAKX+qI
         LfR1fFaCmQ00SZkkYAI0UgNgfFk9Q8CuHDKtD6uGnrBjCARijpj+lQSLXxvRPMzXFSOD
         mTAADAVrlVqemb7c73t53G/O7S+5Y2QWjLyvh1ElPglbj4aE/0eZinx+dt5LaMJooP33
         r0uGp+ywztgbrNXFY9JbrBMa0AcPEkxrBAbgUVFmEVt0+QDwcy2c5u3GaAHh03glPokq
         idAqZfxxvSYYlUmyqaO2i+EdC8w/YHwqm/2QuJy1p+NldkwgikysBqawuEb674d624zK
         ANrg==
X-Gm-Message-State: ABy/qLZl5ogdZQ8Sur/vXZkxK5XnjNfFqqwUtdpfiXfwW8Od4dzbfAzW
	z464aNLZIEKjvx+P9zscE/RMIA==
X-Google-Smtp-Source: APBJJlESELdVE1fjqV5C6AI5MqR/qUJYMMbrNP3VdlOetvKF5lMSl6c1ybsvTRlGq+uNjpRK5ta+xw==
X-Received: by 2002:a05:600c:151:b0:3fb:a46c:7eac with SMTP id w17-20020a05600c015100b003fba46c7eacmr1409580wmm.7.1689251961370;
        Thu, 13 Jul 2023 05:39:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id f18-20020a7bcd12000000b003fa999cefc0sm7728504wmj.36.2023.07.13.05.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 05:39:20 -0700 (PDT)
Message-ID: <e3fd0d3f-3fe4-2e23-2548-ecbd487e9c9f@linaro.org>
Date: Thu, 13 Jul 2023 14:39:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/3] dt-bindings: spi: constrain minItems of clocks and
 clock-names
To: Mark Brown <broonie@kernel.org>,
 William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20230713090015.127541-1-william.qiu@starfivetech.com>
 <20230713090015.127541-3-william.qiu@starfivetech.com>
 <c5ad1e1c-58f4-4833-b9c7-8876c1a0dc27@sirena.org.uk>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c5ad1e1c-58f4-4833-b9c7-8876c1a0dc27@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_053925_187174_F0EEFD7E 
X-CRM114-Status: GOOD (  11.45  )
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

On 13/07/2023 14:28, Mark Brown wrote:
> On Thu, Jul 13, 2023 at 05:00:14PM +0800, William Qiu wrote:
> 
>> The SPI controller only need apb_pclk clock to work properly on JH7110 SoC,
>> so there add minItems whose value is equal to 1. Other platforms do not
>> have this constraint.
> 
> Presumably this means that this is some variant of the usual pl022 IP,

Hm, in such case this could mean we need dedicated compatible.

> or that the clock is in fact present but is not modelled in your DT?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
