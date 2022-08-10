Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6C7C00140
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Aug 2022 13:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lauDQNm3ftAN8tMxg78F+8uMnSo+dcrap7hdBv+1hdA=; b=27CU/NSTuOjAbv
	CZ2x+39gCyejQHUpW05ZmvLMpvBodmkNZ69dyj7thbDZ73rObBa2omfRq2clryvb6jGdhdtq7mG6B
	7Z8qOXhRS9nJiOG6jTjW7za+ShlygE4WQUYplPfVmLtv7RHuggmI66sI5fAKsZArVLfZ/ThGhkXxT
	ciV5P+rUvXfq7Q6JJ0M6PpJVitq8mxO58NWnheLda7d4M65W3Ha+/hQJoDPAH2sjm7YEFIQ5hC4w3
	N15BfoZFM81l5WXf/JPADXZY0cihPyscghuKe7068ofuonDy4GsD333qicbF84RNqW07f6J7Lanng
	Dbsm5ckqle84EOPtyKmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLlmL-00C11Y-2Q; Wed, 10 Aug 2022 13:29:45 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLlmG-00C0yI-Pc
	for linux-riscv@lists.infradead.org; Wed, 10 Aug 2022 13:29:42 +0000
Received: by mail-lj1-x236.google.com with SMTP id v7so16121932ljj.4
        for <linux-riscv@lists.infradead.org>; Wed, 10 Aug 2022 06:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=M2+lgkUGbiFpPnZJdDr1e6oVq21WQvDGuoGeryWgspw=;
        b=v76915Wzkkb1kBO16clztnFIfDJ0uvr0SKRaKC9YqQTf4IG6gm5Esg0V2n7qpgVjKc
         53nyQ/6SBOQYXM3S0uiFmZeMkhhjD6qU654x8jiVbC7Nt8ucqIjFzFVtA7w/z4nbWDSd
         JE45An8wat3l9WvALCFihINHrujCNJ2Gupi30v++JCi+M0GNMhSuSUzliUhhyTEUFtjw
         CXxs2tmiy6RbEfe/gpI/6HUrNlz157WV0BTEOTQcnt7A92mZJh2au/0Mgi1w61PS5QAu
         T6Q51PpTF4bAyyS/dXsa0CkH3HhfdugGRaM1OelRmPstyyYWe/Gc9WoJ+KTJRXSuvIgK
         S12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=M2+lgkUGbiFpPnZJdDr1e6oVq21WQvDGuoGeryWgspw=;
        b=Qm9GRDc5sf+zz20pI9jAOJTjoUtzClrmMUoeg6xhTede34CSb5CZKk3P5Ge4pl81m/
         KwYIRdWWD8JXF9tfYs3yjr/X3VgGQfn8QOWoAeUlB2SsyntG2Leb2GD2X6th0EAbRPMu
         XFv5LH+xoApmjvuQVkzGyHFNWuvA+5hdTTuF88UCGhCap+yYetnx8q+G/XdZwsRVb0PL
         eQkcHyZNoJwzTmHiGFK2m7XM6RWco7fpqAnbGN+IBEPMHIvQx/8DOPiLdrgHTAOU3kHW
         wmldxE0QCp0th0n2JRPzGdig9DWKKhYbs9teA/cKuqjBENo7XL6B2baRGNrCFlf++Uhm
         NUhA==
X-Gm-Message-State: ACgBeo3kbV/5Ozhl1yEZDL5qQWmOj2M0D6GhU0cfKfbF6RnuqXbAUkaC
	pgerlOftHQPPRwGisj21ogDkyA==
X-Google-Smtp-Source: AA6agR56rpbkPS2VaMru/xs//Y04YuIV0S7fJ48JvFSxZ8tdGKn2VGteZCIB89deq4DtpaBko9t+5g==
X-Received: by 2002:a2e:a28e:0:b0:25e:734f:38fa with SMTP id k14-20020a2ea28e000000b0025e734f38famr8723830lja.446.1660138177491;
        Wed, 10 Aug 2022 06:29:37 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id d8-20020a19f248000000b0048a934168c0sm349958lfk.35.2022.08.10.06.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 06:29:37 -0700 (PDT)
Message-ID: <dd173944-80d3-e13f-c405-f076401bf6c7@linaro.org>
Date: Wed, 10 Aug 2022 16:29:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] riscv: dts: microchip: add qspi compatible fallback
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: nagasuresh.relli@microchip.com, valentina.fernandezalanis@microchip.com,
 broonie@kernel.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220810085914.801170-1-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220810085914.801170-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_062940_920434_13257F51 
X-CRM114-Status: GOOD (  10.03  )
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

On 10/08/2022 11:59, Conor Dooley wrote:
> The "hard" QSPI peripheral on PolarFire SoC is derived from version 2
> of the FPGA IP core. The original binding had no fallback etc, so this
> device tree is valid as is. There was also no functional driver for the
> QSPI IP, so no device with a devicetree from a previous mainline
> release will regress.
> 
> Link: https://lore.kernel.org/linux-spi/7c9f0d96-2882-964a-cd1f-916ddb3f0410@linaro.org/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> See the link for binding discussion. I'll apply this at some point once


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
