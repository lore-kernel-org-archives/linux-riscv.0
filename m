Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDAF2C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jul 2022 08:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KCclVj722vB7xwYiL3TVACntPcpiUh3O63OkHpM/ezo=; b=ZYFywcwgrvvofH
	VpnWowiQHix+nblAR4vGHbFr/f6Xo2p20OZ0+P0rSvx7qQsV8fhl7gslaS5AvsfRxaJtxBrfBQOpN
	9VEkP9LZtKgI4dwpkhxR3rPLTFFC4J9OxkzTl51loJiSEikqjbpLz+yrRgazlWOe1k31pTBvn+5Fx
	rQbk7auoPPDnsATShtY6x+cEWSdlzrhu8kSTk2b6qt87eYXiLJ3XPozp14V3x4OyK84fNNs7pYBx1
	on0FTM8ZSiovgra0vx490cJBwQwZWe8DUKOhk+beI84Trdb3aO2yhsxT2/+G928bKlRvrUq2DbHG+
	ucxtDgmx9MnKmvmkaoAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBAwU-008ZHS-DJ; Tue, 12 Jul 2022 08:08:26 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBAwS-008ZFR-Ed
	for linux-riscv@lists.infradead.org; Tue, 12 Jul 2022 08:08:25 +0000
Received: by mail-lf1-x12a.google.com with SMTP id u13so12642315lfn.5
        for <linux-riscv@lists.infradead.org>; Tue, 12 Jul 2022 01:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=k4u80oyQWraiYKs1p1yWtuiMFtevIh0v4pzoGfxTAqQ=;
        b=W9uGNhVc44uelBQurw06DsGn/hKUXEcItN3tp1TJd1Rp6nUF1iDIwlj+tMOSJfU78f
         Yciq7vpqxRJ1aB7m9UEdRdyVOlfixGoY7X6bb83JKA9/Ywnkwb1AZq8W4pkdwVJpumaI
         ZWGy21evol+66hAir2gINGQSX6rC0iCGRHhO25K2QAKD+iTbu8eLvtW3wVZd2Q5oW/kW
         uEG3Yohr1S6ShM8CP4kCOXaAeXwaQueOYwpDft/nnBZKNj+jJMgk5VGpti9eZ1ENcTay
         M8binu2lB8SMGH3gtnegrmH+B5LI7OG3XEZp5luJWesxL3y4YNMfpdvXUJ7IX6Oz8lbE
         TBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=k4u80oyQWraiYKs1p1yWtuiMFtevIh0v4pzoGfxTAqQ=;
        b=n8EVp/T4oHFP39pzH34z+kmENZkVTJZwubgS6ZjWvKVS1KCpPwSYm6bGzEf8jpBi8F
         JtjShhO91jOxk3Q0fu6HRqWz7Xo00qlM2CmAKExl+uIf4wytX7REMjMiO/Nf8Rxrckbo
         gH4NaZOxB3qu2kUN6FwNmaXJbFhdYqoVbb4pApptHKhp3EYh4Q7NWEYtJDOP9N+n2dAN
         SxjuPxXQB+BQerCq5GgkAlVUFL//ycptf2AB4tdPS0gv6KSF/s9l7xxI7qMgZ1UFjlXr
         3LXuWG+Wc2M8rtf55vsmV2EQcQ9mT0p2xVvHHVKxETvZ5mRJ6tyP7u9KSOrZTjRoESfz
         TnkA==
X-Gm-Message-State: AJIora81ib4g1URYJFT89f4ZF6Wq9ULKKGfdbnIkH3AQT7Qmm/KyQ7xN
	603kynS8yk2opaoZl8cSoiqGOQ==
X-Google-Smtp-Source: AGRyM1ssF5+WPVrq7/S87s3pxBfIZb7FXFrYx2wYNxOFqmtgwcim48AU819T+sIke0XAGnWtfqS3Sw==
X-Received: by 2002:a05:6512:1523:b0:489:db27:c171 with SMTP id bq35-20020a056512152300b00489db27c171mr6724319lfb.58.1657613302851;
        Tue, 12 Jul 2022 01:08:22 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
        by smtp.gmail.com with ESMTPSA id q2-20020a2eb4a2000000b0025bd293ed8csm2285759ljm.2.2022.07.12.01.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 01:08:22 -0700 (PDT)
Message-ID: <78824cf6-fe30-239a-db66-63d2ee19c1f0@linaro.org>
Date: Tue, 12 Jul 2022 10:08:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 1/2] dt-bindings: riscv: document the sifive e24
Content-Language: en-US
To: Conor Dooley <mail@conchuod.ie>, Emil Renner Berthing <kernel@esmil.dk>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220711184325.1367393-1-mail@conchuod.ie>
 <20220711184325.1367393-2-mail@conchuod.ie>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220711184325.1367393-2-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_010824_514584_6457CED7 
X-CRM114-Status: UNSURE (   8.18  )
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

On 11/07/2022 20:43, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The SiFive E24 is a 32 bit monitor core present on the JH7100.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
