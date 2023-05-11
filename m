Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB222C77B7F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 09:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MgCmpmF/sCkJ+AecZdJnH7DsvmetjxhNlaauxx3DWh8=; b=hd5ba9vk77dC65
	9E3WqIAHzbcHzKCd7aAT1bn/UfO5L0fK+e2c21NAtnsVa4H5GWdYLVLhcyI+9a75rxBQxK0GZzdPt
	uArf1adVu/mgcCh0fQSLjzsT0uHa/BtRUyN1NXc+4haO/ih8uwD6CEzO+u3nV064jhEfnvA9zvNcS
	83DIarq5/0V4dkZiL4Tdr4RoQJsr20t4eM31BkU5htlSz1D/RcNYDG19EaNDHrunTd+VaPTDvER2I
	+i3uAepSJYpNxjDQaZs85JFf9vAtQwlzlL275Tr08eJJhWvQEZfuoWv1XRmoNF70hzMwMYr4e4NTK
	iVOdeFMAXO1poBddI97g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px2FW-008IlJ-2x;
	Thu, 11 May 2023 09:06:10 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px2FS-008Ik5-0L
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 09:06:09 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-50b383222f7so12396966a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 May 2023 02:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683795961; x=1686387961;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vkAqSC6UaedH5en9ExlmtyaC0OMJh1IaClh6RbNmvMk=;
        b=Y7YZxbAodCGMSG+LimJqIBn0h4KaF9KDN+oq4ZUw6ERygBjEprYZtaCtUUOeF3qMPw
         euZGPPVOpqwbTSbNGtN6NLhziq9HfGhdfL9T52knUDmZjOJYMTDgN3aVCPqoiAOt1a+u
         XGfGLWIEKDoX85qfdG9XWH7+q3s84bBOClyU6GmcKtdnucrB4xBZyelDKAC8TqGUmCe3
         XJc2SCUzIZSey+PpDlvfbA1LW5w19tz4kFiWXepknlzes9V4G4kBt5X4E7qF6Y5p2t48
         JVIsOO8ibm+6S8Nx2NcKsqLBxk6Asxoyl1ginHzVK3hQDTqU7mTYGH8n54BdgNbcBu+1
         BM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683795961; x=1686387961;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vkAqSC6UaedH5en9ExlmtyaC0OMJh1IaClh6RbNmvMk=;
        b=jg4jap8W2lAaItNj3NLUIVNFPGXFi9PFAlAjt47s7wLGIvtHwOpRpqHHeMqi+i47X1
         ExiBGUR/zwY3SIrgcabdgHEaRBZygF677XxkEEaoGg12C1H8Ae8ghJekBLh6Bwl9AIRT
         zyOXBflvs5q8a6khzDmhGvjdVhM1YrhNE+nMU2cWIQQShjCNKYVvHgUgc/2zmdXPDYpX
         3keS2QQjJcJt+laYUJQU8gcMWeUdkc+Rp4yWJoUhqBxu57+biBP5wPSw/CYBE4w/ZtMp
         deZ9z2u9mwTeP2dx4ckpCbUHw+1LVA4TFsAIIdWPRrQqncx0UpgXp+9B9kLQQQCWTHFN
         MwWw==
X-Gm-Message-State: AC+VfDxyEsHqi7yz9oQlt9O2dADnUdsggSd7yqUykH76X/evEcgHPNiu
	EFYjlHm9RXoQlTxyTSOn8Oghbw==
X-Google-Smtp-Source: ACHHUZ75FWJMlMVD825rNycceHUcI4lGInGTQYK8oGHt73F+DFoon0VVW5G3+dFORWBYjd0QvVVPeQ==
X-Received: by 2002:a17:907:9485:b0:932:1af9:7386 with SMTP id dm5-20020a170907948500b009321af97386mr17758955ejc.27.1683795961179;
        Thu, 11 May 2023 02:06:01 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7e61:f14a:c3a4:809e? ([2a02:810d:15c0:828:7e61:f14a:c3a4:809e])
        by smtp.gmail.com with ESMTPSA id jz20-20020a170906bb1400b0096a742beb68sm267692ejb.201.2023.05.11.02.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 02:06:00 -0700 (PDT)
Message-ID: <a2ac9485-23ee-cd6c-4290-eb5e6e2ac826@linaro.org>
Date: Thu, 11 May 2023 11:05:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/5] riscv: dts: add initial T-HEAD light SoC device
 tree
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Jisheng Zhang <jszhang@kernel.org>,
 Wei Fu <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>
References: <20230510204456.57202-1-frank.li@vivo.com>
 <20230510204456.57202-2-frank.li@vivo.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230510204456.57202-2-frank.li@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_020606_141129_4F3C17C2 
X-CRM114-Status: GOOD (  15.88  )
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
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 10/05/2023 22:44, Yangtao Li wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> Add initial device tree for the TH1520 RISC-V SoC by
> T-HEAD.
> 
> Cc: Icenowy Zheng <uwu@icenowy.me>
> Cc: Wei Fu <wefu@redhat.com>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v2:
> -remove reset-sample
> -convert to use thead,c900-plic
> -add pvt node
> -add thermal-zones
>  arch/riscv/boot/dts/thead/th1520.dtsi | 491 ++++++++++++++++++++++++++
>  1 file changed, 491 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/thead/th1520.dtsi
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> new file mode 100644
> index 000000000000..d1d94098b6bf
> --- /dev/null
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -0,0 +1,491 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2021 Alibaba Group Holding Limited.
> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> + * Copyright (C) 2023 Yangtao Li <frank.li@vivo.com>
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	compatible = "thead,th1520";

Again - missing bindings. You already got such comments, right? And
still there is only one patch here - 2/5 - without anything else.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
