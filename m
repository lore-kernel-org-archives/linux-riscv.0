Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD02C6FA86
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 13:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cBEY1M8b51Q5rhfz5J12Uih2az03br8zHokyoWXYFPk=; b=Id3xHpftlqLQQ8
	7QCnUyq2Bl2Hp7XrT96IT4cT5jHhUVpR4gcSAk/syIX7nKQX+w1xc+ERjG9ytrWBtqfFyd7pCnJf9
	Mvd/PnTnRXaJ3KtAZvBfFnUZGs0q56D+x8zJLQEEpycF9bGd10WgZOssFYpI8woehRaC7sk1ZYcBE
	3/qa2H2lP/FHSRUqn4Vbbj1VfwDax61ED0zgbPx/V+iVe6bqzU3Gx3+NW4TyS7HRShA5d86ZSukZ0
	pqG66/OO2LW1XunlOL1sQk+dqli1cgisVmSxX5kqmQPe5b1iWH0CkaqWdka6E2dO/pzd3FvZq143k
	oW8Wj8LWakeLz9pBco2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVYKr-00Dcpr-8Z; Tue, 06 Sep 2022 13:09:49 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVYKn-00Dckx-2x
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 13:09:47 +0000
Received: by mail-lj1-x22d.google.com with SMTP id x10so12254063ljq.4
        for <linux-riscv@lists.infradead.org>; Tue, 06 Sep 2022 06:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=a6Lagh5/ck4cwH6T2DH+NFbKHsSQbRYpXLBzc0OL1+o=;
        b=dXsgDRObXwmGfSxxtZAYV9lqtiKMLGuqtb+++sbfJxeuKjAE2UmnPDRJAqKVvdky2Z
         SZQyVTNXHCf7c29DryUkS3HOC0FtZZ1sFNc8woHt+7hjnAmq93gdUlGFXNjYHDpHkap3
         SWio2FZ4dfAqRduaWkpJe2VDQRiv6kRbRdcPr5zIxHJYmEBTR4GpfsGJSwaBRg19q3sj
         BuRnnv3205Zv7OcbWk12OL8U9nmD18hDyZ6iCO6W0scKnmfrhsMDuEMREvhW68mmwzxG
         SqI3jFLRwaaa7xvRgEKG4baFTHrprRYAN+2ns0LF0/CF+lE/8soEXsZyehLZR2OTncTP
         YPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=a6Lagh5/ck4cwH6T2DH+NFbKHsSQbRYpXLBzc0OL1+o=;
        b=BU/Mwt7Vvcg9VDKojDUa30EWQiUFlymuWZbVmu9pSVShN4A27CVL2xruNe4bhn/EXJ
         lbGfSUvTvpf5TaCFBdwrwhDV/Bb0dRKb6LrZwxmIsdv5G89heea9tAwPQZ48LlN2XmTG
         fQNE3zqA03PuXHU5nlail9T9u48L0VapYrQ8xKts/n6BAV826kox343cctd+MqzVlWgu
         KQcIWKbU/qUJfIZB95mJhLDsR18b5mR/xVKMdS2Ozv3VUp+Z5spjsgY5oIngzTYCWvib
         xBh6aVRVulYURq46rDw/vpuXQFpHUh30T8YHyuPtC1+HwSmedERv7SOqJ3oFpCVH/vqL
         M0bw==
X-Gm-Message-State: ACgBeo3nXEK9CNo6fp/vxY+UPBAAPDJX8cwHSOvlpE4GmiDbflUMbhJB
	bltbH1Kqc7licjb8buVcFZPq6g==
X-Google-Smtp-Source: AA6agR5Jh2R93COOW4SLpzHSWJJOsAVNO4xiFjGMdgMEx0WOkyc6+38G776VsL/J2g791+P67sRs/g==
X-Received: by 2002:a2e:978f:0:b0:26a:a62e:8f2c with SMTP id y15-20020a2e978f000000b0026aa62e8f2cmr995499lji.153.1662469782575;
        Tue, 06 Sep 2022 06:09:42 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t8-20020a056512208800b0048ad4c718f3sm534997lfr.30.2022.09.06.06.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 06:09:40 -0700 (PDT)
Message-ID: <6b47114b-187d-0fc1-3acb-3f1567128b8a@linaro.org>
Date: Tue, 6 Sep 2022 15:09:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 1/3] dt-bindings: vendor-prefixes: Add entry for Aldec
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220906121525.3212705-1-conor.dooley@microchip.com>
 <20220906121525.3212705-2-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906121525.3212705-2-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_060945_213379_75DB967B 
X-CRM114-Status: UNSURE (   8.26  )
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

On 06/09/2022 14:15, Conor Dooley wrote:
> Per their website:
> Aldec, Inc. is an industry-leading Electronic Design Automation (EDA)
> company delivering innovative design creation, simulation and
> verification solutions to assist in the development of complex FPGA,
> ASIC, SoC and embedded system designs.
> 
> Link: https://www.aldec.com/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
