Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BDFECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 09:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wo8beeM/krIE+dpV8Si8Dp1GXyrHyehkkVjvBzOGrAc=; b=v4rdVgbbmvEZdq
	/KT7YXkHEhwjz0V1jYR3Jjh/BDrFKVe8X/GRKchf3lATt3plx+K6SaS6apKnVg4jWlYz/9g+SwZxa
	jY4WhtKA9/5UTmXohoChTlnLJlznAuWrR89UY+F2QAplRaUQrzBx4h4/8S+Ev/pQIaD++o4Nnh150
	EceEdpom2mIkhGJsCljydjuIpEhEk5SlJNkEMG7qGj7ncLk/5fZZGMvWY/hFao8uvJlSFrtSORRcJ
	edy2b4to4mjd/E9h5ChVMGX6mZ+R6g2A2pNuTlRk3DDqFSeYZa44N0CPeJg1UT9dh4BVVGvq0AMeH
	LR7rKGcRjCMOjsELY9Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSxs6-00Fr3V-RO; Tue, 30 Aug 2022 09:49:27 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSxrv-00Fqpt-G4
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 09:49:16 +0000
Received: by mail-lj1-x22c.google.com with SMTP id bx38so10731167ljb.10
        for <linux-riscv@lists.infradead.org>; Tue, 30 Aug 2022 02:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=AcuCk4+e+KRZRMqw8MoQ/WuRfLAds3XsIU+iBTt/SPw=;
        b=foXJ6wbxzshpneb30SQuoXhhe2u8EWyCpbF2Tv2lH8S8cBoNt/U/1wa71g3m0a76CU
         suCNPZVxWEvCdd0rFQzErtKjaDJVcwoJ8/DFIbigdZ1+ezpYbCzvKJFmC1cqydgdVz8g
         pklNRaZiu2CnliDb1sHa43pHcK42dvjUqylFNYpQsKvtuIay65OMc/bOZ1sxmYO+sqRq
         vihnRQNFBWtT1GyXEyjoQ2xtosD6m1raAxY5khVExIyZQSGriKT02jaiIZ8+J1FH5Mwf
         yiBzrdoI6d4baQzosAgazhRLgrotM78bhJ0U1oTFeml6b0Zp7Txj9X8YyzgGRIpf/XhG
         Tk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=AcuCk4+e+KRZRMqw8MoQ/WuRfLAds3XsIU+iBTt/SPw=;
        b=WPutdInyNtRhcBjUAyQETIZfSuAbou/XqJjx0i/PE+5askNyY/j3yav+g6OUazlfhG
         2IFlUsiBVxSBoe8WHnashRr5Gqky+LCMRhBF7fYawNvuZICeOo8wQtp4d6/AqQdPKW1R
         YwxRaRuRe6TAGHZGSp8Onx2F3fpQZwOFamOKJoWB9oCSZpHq0oJUSuYIWbnmbvrncWwY
         IcuXMBh1BPw0Er8NwO5mfLWoAShf4aznroiDE4Lq12+XOmhfsfLth9+pj5yLti77KGz/
         KdfzDDWSucVrxlWsEU9OWI70gYEARozJJYRDD9wTBmWTncd9KNLPkAxbnLSijodlUHt0
         o30w==
X-Gm-Message-State: ACgBeo29vSSwcaa4gPkmpFw21vr/iQ+oJsDwxIn0WALTsWxXI4nYqh0k
	EM+VfOq1pfqZN6fZt3RWiqrXUg==
X-Google-Smtp-Source: AA6agR4z0JLfAUxpRgWDj2uSPv6e86hAExC8wxOhgcZacnV8AvvmODylWJwoJ38g7xERmFOM5kh9uQ==
X-Received: by 2002:a05:651c:244:b0:253:ecad:a4ee with SMTP id x4-20020a05651c024400b00253ecada4eemr6339245ljn.21.1661852952708;
        Tue, 30 Aug 2022 02:49:12 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id u15-20020ac2518f000000b00492d064e8f8sm1542758lfi.263.2022.08.30.02.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 02:49:12 -0700 (PDT)
Message-ID: <6729c3d8-c59e-4655-d30a-aed315e8fe8f@linaro.org>
Date: Tue, 30 Aug 2022 12:49:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: riscv: update microchip.yaml's
 maintainership
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Cyril Jean <cyril.jean@microchip.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220829134102.1248504-1-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220829134102.1248504-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_024915_637075_D484D2AD 
X-CRM114-Status: UNSURE (   9.69  )
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

On 29/08/2022 16:41, Conor Dooley wrote:
> Daire and I are the platform maintainers for Microchip's RISC-V
> FPGAs. Update the maintainers in microchip.yaml to reflect this and
> explicitly add the binding to the SoC's MAINTAINERS entry.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Two patches seemed overkill for this, but scream and I will split them.
> I figured I would take this for 6.1 myself on top of my other changes
> to microchip.yaml.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
