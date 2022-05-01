Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23B1C433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  1 May 2022 09:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gXaPdzUySYlQYwBubW2BU5ebeKRZ2mqT9OuDux4R6Fk=; b=bzg74TMmt2VFLT
	h9hDCVc79zmVUKohgh62leZ11/5uQyqi3TPt01vXH5FcbeumnLN7nIsR63gXPZmuEjbGGjpQWEj8T
	VwDtp716EhOy8r2LRll5AIQ7sM8uw1gVs600YDml7ek+ypu1YvOqcYomA8qc5l0E3piNxQd1n4RHf
	tVR+ZQCy49rS0s4nr03MWxa5ytEpXQyoNakWQLHNtGlmlSerGbcEfqUEm/15O2Iof1C060U5fLRhR
	qnYjqtgUhlirGxtNAw9fCcNf6o+jAwIqiUUreZDjBRwMpfN7n/vG9OYkBlndl4L1BmOgirly+MVD8
	rCY2ju4JQzGZ1Yt+7sEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nl5Qv-00FxvQ-7K; Sun, 01 May 2022 09:00:01 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nl5Qt-00Fxuu-5M
 for linux-riscv@lists.infradead.org; Sun, 01 May 2022 09:00:00 +0000
Received: by mail-ej1-x62f.google.com with SMTP id n10so5425442ejk.5
 for <linux-riscv@lists.infradead.org>; Sun, 01 May 2022 01:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zwZnSMoUMvauA0DcB2/3Hy6f11CAi3VR9h+0N7gLNIQ=;
 b=kO9jPewaYdfydQqL1tUmSCmn4EE8jzK7YR/xbVqpF/OIzONlX2IHxiNyYZS3gy1wV1
 gEOPAGLbKKecFS4/ikwmb8fJ/mEp0NnjBBHWRbxMgml/WfAD+fUo4PbFFVjhwYNMcJ+B
 aAkGZdx+dNp14n9IXBgSjOVVwsQjgOwczbjlWx1v3yZCw9PirCpiC1d1Oaply7ODH9mj
 D8INuP5q+cJ1BMRuqcUCQ84dK5CEKEdCQbGWfUb8MnLUqB3hEOBO5NZ77oFOuylp7Q6g
 QDxvDa7WA7KdaABXHOgNODiebnufDvJuuZytAuOfB7dx7M5Y2SsM9aL/P+q/iklDh2ed
 FtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zwZnSMoUMvauA0DcB2/3Hy6f11CAi3VR9h+0N7gLNIQ=;
 b=bmXLRigC5TNYlP7hr6cDXZQw3tcXgPeEHtppf/4VZe3xkWoYqgKttm3PdjHNsn0K3N
 0+RPqqiKsQwPPGPFYnYTMAKo891kSnjcDwmaQGINHb75T/86PBPzlcgVjpBQ9S0rafiQ
 KCCppU5gaK2YSm7b0uFoC7nD4IboGOSGQU5pAxA5yrZbFoDVNRuvNmp3Wf9EhK32Yjsb
 Np4i3MvsEsbg6EFlJsgX44Zs4qkrbV+Q/JEJ6in3im20iiELCII4ROwHq2h/dhO5allw
 N70AkarBoUtc3uVA9U3D6BC9DzTp3Y4mWDmGMvuCrjKdXSAqfxOd2rv+4fbtO1RYOfq2
 Qt4g==
X-Gm-Message-State: AOAM530VnogF3kAk+7iyXxBTnKvwCN+lCW5zUKc0wBpJlzaLbJStIdXZ
 1F2oGxggdlfzPmvT6pIYCJSUxA==
X-Google-Smtp-Source: ABdhPJyudPfACSahB9C2aeEr9XfA8BESuGiedIMyik3JFnuTR2Cj6JKCtjMyIMKnue+s4bSlKkMrmQ==
X-Received: by 2002:a17:907:94d6:b0:6eb:6a12:df60 with SMTP id
 dn22-20020a17090794d600b006eb6a12df60mr7093766ejc.68.1651395597696; 
 Sun, 01 May 2022 01:59:57 -0700 (PDT)
Received: from [192.168.0.182] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 gv11-20020a1709072bcb00b006f3ef214e5dsm2369828ejc.195.2022.05.01.01.59.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 May 2022 01:59:57 -0700 (PDT)
Message-ID: <6fdc6da4-3a34-e67c-cab8-1c9570501a8a@linaro.org>
Date: Sun, 1 May 2022 10:59:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 6/8] dt-bindings: vendor-prefixes: add Sundance DSP
Content-Language: en-US
To: Conor Dooley <mail@conchuod.ie>, krzk+dt@kernel.org, palmer@dabbelt.com,
 robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220430130922.3504268-1-mail@conchuod.ie>
 <20220430130922.3504268-7-mail@conchuod.ie>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220430130922.3504268-7-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_015959_257682_1E208BEE 
X-CRM114-Status: GOOD (  12.88  )
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

On 30/04/2022 15:09, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Sundance DSP Inc. (https://www.sundancedsp.com/) is a supplier of
> high-performance DSP and FPGA processor boards and I/O modules.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <mail@conchuod.ie>

If your @microchip.com email still works, then there is no need to
double-sign it. At the end you are still the same person... unless
you're not. :)

This applies to your other patches as well.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 01430973ecec..1d47a38c2a2e 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1197,6 +1197,8 @@ patternProperties:
>      description: Summit microelectronics
>    "^sunchip,.*":
>      description: Shenzhen Sunchip Technology Co., Ltd
> +  "^sundance,.*":
> +    description: Sundance DSP Inc.
>    "^sunplus,.*":
>      description: Sunplus Technology Co., Ltd.
>    "^SUNW,.*":


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
