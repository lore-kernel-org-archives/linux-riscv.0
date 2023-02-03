Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B316EC61DA4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 09:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FAatkzO0a/O7guJor6uHtoC7WNoWB2cdIO3Enj79KPE=; b=nNoffI8StYWZTU
	1WXGN0Kqvr0cjYuGAiBK3sLMIR9bhbmlXkr0cO2En67pBS2ha1NqS+nYnszCryeXnYEVscR+uSOcf
	705jUWurmstJkYNPs9vJJaAxC+wGm+JvMK9HHVTEcYrQJlZe9ik8ci8nnFiwX7jU5544CMis/5kGO
	fOxAzEbDs/LJ+3osZFQH/MOFAyYonL16i1KS5vJCbP+T4XzyTbrAaHCIpPW1vK9q713XhzYN0f3aL
	msh+jvS7IgVWGasJMlw5j/UkQBER7NhI67OdfRA/GIMMHWD4qI/A3w16Z193hJksNNO8TKZwVYHmJ
	KNDqEgC5m2M80P2cUbfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNrvn-0015RE-Tj; Fri, 03 Feb 2023 09:00:27 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNrvm-0015QC-1L
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 09:00:27 +0000
Received: by mail-wm1-x333.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso3292173wmq.5
        for <linux-riscv@lists.infradead.org>; Fri, 03 Feb 2023 01:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qXoAdHhN/nXWyLyZPUiTv4Q4XmY1KdAGzUzsHG/Rk/4=;
        b=EQ75a+A2a/ajqx8kGm+he/MG5JqJRScsCs7zePqdvT18OKGHTuLnVCDHxC+mDWrDZG
         OhTQEQto6HF0AgYT4Avbgk/mQ65mHW52eY9ahBiurEBaJThzk8t/O38jeGsVQRWClp6s
         KHsYlkOwGaAKKTaHgKAE1E8arVdP+OD0tkAnJbahzPvSZqpqIwgb+nGudQe4bDkV7Aix
         zKqp9xm6nnThzNeQ9tw7xERnlLBPPmOF7KhlqhOCT/HW5te9PdcJNyjHCOKsNyP1HYGP
         DaEZwgiTY2cI/iuquNk0hUomjalP7z+V2eNFdExLL2DQcbjz4XJQr8w3lIdWqxzKo8tC
         Ycag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qXoAdHhN/nXWyLyZPUiTv4Q4XmY1KdAGzUzsHG/Rk/4=;
        b=yvbWQCyBV5QKJlIut+805ZSs3dWt51oW3Q5FtG/cjhDKm2bDy4nyYJTHfg9JBoQxzY
         LAv8gHLsSvBdXAB+nAIkI0c/hdy8QxoUa4e33g5qOcxybMLvvhT7eCATBzBmUD5cxifk
         WPRzDPfGvBxNVQhkMEG2Qp8xn1JynWR/Qxksw/4ayGtq2AgGX6WrBMWzjZuE+yJPfohj
         jdRN2U102mhYAs2+zYxi3yft8fQ6K/3S5T4CvqsWU4wvwpgnW7miYeXAtElPaGDDbTUd
         3gKG6mJTZcO8jkwBI/UyNWlImaNwgw0Jlf7rMwiQxGXjjDNWKiJRk7W4ecHCDeuSgGiX
         90EQ==
X-Gm-Message-State: AO0yUKV1MKkNYiSA6GuczY3VPs4z2KUkuAAG890D2NJroAnYkiFEujGG
	Kbjn0yIrZw/BqLs8QzV3lbiDDg==
X-Google-Smtp-Source: AK7set9UG7Ud3p7osiXX4INl9ByMEzwhEn6pf64Y4FQLsiE5MeXOWMKgknfwGwLF5zdgnCno4AhqXg==
X-Received: by 2002:a05:600c:3acb:b0:3db:f0a:8707 with SMTP id d11-20020a05600c3acb00b003db0f0a8707mr9116756wms.40.1675414822412;
        Fri, 03 Feb 2023 01:00:22 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p17-20020a05600c205100b003dd1bd0b915sm4170806wmg.22.2023.02.03.01.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 01:00:21 -0800 (PST)
Message-ID: <5de1f657-2632-9165-b6ed-96327fab1de4@linaro.org>
Date: Fri, 3 Feb 2023 10:00:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/3] dt-bindings: mmc: Add StarFive MMC module
To: William Qiu <william.qiu@starfivetech.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mmc@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org
References: <20230203081913.81968-1-william.qiu@starfivetech.com>
 <20230203081913.81968-2-william.qiu@starfivetech.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230203081913.81968-2-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_010026_113720_1AFFBCC0 
X-CRM114-Status: UNSURE (   8.41  )
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

On 03/02/2023 09:19, William Qiu wrote:
> Add documentation to describe StarFive designware mobile storage
> host controller driver.
> 
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  .../bindings/mmc/starfive,jh7110-mmc.yaml     | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
