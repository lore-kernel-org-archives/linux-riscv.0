Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15422C7618A
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Mar 2023 12:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/2HhmGBtLYPzy7euV9cJgwtfvtnDnPEY1dGqr/Pv/0=; b=Tm1Mq7G0JNKh9J
	lTMiekn8+KhQTaYwdO3fwq1LE5znq7saxCzntxJNHLBOTbGz5KvhCj/Y8gU4R8r9UUQ0gRBWkquHd
	N8vEvzBRtMA02zkBTURpp7G0TDNdTQm9cVpR/hfHPI7mpJKW0aLXYjnX2gJJeWCY+lHIw8V5Qe2XW
	MPfVBAD5aQce0lo8btF/1AcICHjzdHK1FrMRgktiz8kihir/ybd7oaq4RS6NWoQl5b9y4xUG+0Fov
	rAV/nA7kncTWPEoLwYGn2ObuJOrQc5XVApl+AL3QQ9P5gULFBx57x0WG7Z+3rJXHKz6JtdUv4adgj
	H1diIAoS6Utx7plHCfOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdsAY-006h4p-2T;
	Sun, 19 Mar 2023 12:29:50 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdsAW-006h40-0Q
	for linux-riscv@lists.infradead.org;
	Sun, 19 Mar 2023 12:29:49 +0000
Received: by mail-ed1-x531.google.com with SMTP id er8so25170282edb.0
        for <linux-riscv@lists.infradead.org>; Sun, 19 Mar 2023 05:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679228986;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UsUw48AeQfsuxhASleLQv/pMcvboLL7epplAN7QGvnA=;
        b=e11tqFxkO2vEWgK/fYt4JNN1jqJ6BmE7iiWx1OBXuupEzGzzxx73gK6UmKgZNqO3lM
         b///VqVZaAouyjcn1bsy8R+vZ10Y0XsnW5FtYRXvOeG3E2hmpF5CTDpZvWCVCtjgUYHT
         A99eDabjw7KHBjfYOibtRWRYNlEf575FSChx0SHbSDs0G6/ucCQ33tMdqZECj5g+x8zZ
         rvGwfHMdgVAR6azQzWh256MWjgnJmMz8q6UPhjPc8IBbyha11ahGMu0JoXvxQ7Gr8lM8
         nLQNX5t0SJ7lmjISDuw8eSlLx4V2FVojXb+a/YYVbTzb90sng5xVh0tPDUbKtq+M4ObH
         HEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679228986;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UsUw48AeQfsuxhASleLQv/pMcvboLL7epplAN7QGvnA=;
        b=17/nCE35egNuf9LcoovWKCriQl3UBjcd7718MJjKzADUqicmD+HvuxHe0M+987DPcQ
         VIMeSNY81CmiYHlavI/BZNQMoQ7cTGAS5VREnIXpkfhpgVCQoC7/V62Cpu1Cc3U5mkto
         4a2W95zVJbbE8sWQcjKcuPbyKmdvumFKkMvU9FmZb1FwN/ytdq9mGkjkUNJjXpUX0+zZ
         f3XvtasnGiwLf+In19CPC1vLcp1+ysl0u6jRR38+qGpvl8uXITcU0YEIm5fUdBEyss+S
         f2DhcVbROzGse0wuxBAmsml2XWVieKRMUZuhSvDPbYcQ2PS9qLTyvxXuh3MXbXzH44kA
         S3yQ==
X-Gm-Message-State: AO0yUKVu5P9mDHziaJVBZSZvKU7YxpqlNTGHw7TNlEH5kvzGJKpkv3cJ
	OMO6HaXBhji7ftjwFo6Pq200PA==
X-Google-Smtp-Source: AK7set/sIqucjJzsdjLw5anFET0hlUfDmKmuGp8IZBJkYMcu3uNQirYCo+/8Hw66VbUsFcgrAUJkKg==
X-Received: by 2002:a17:906:36d4:b0:932:d2bb:507 with SMTP id b20-20020a17090636d400b00932d2bb0507mr6793730ejc.24.1679228986490;
        Sun, 19 Mar 2023 05:29:46 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id r10-20020a1709063d6a00b00930e95446d0sm3185334ejf.120.2023.03.19.05.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:29:46 -0700 (PDT)
Message-ID: <9dfc752b-7ae9-5e45-e9e2-50b87dabbca6@linaro.org>
Date: Sun, 19 Mar 2023 13:29:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RESEND v6 1/2] dt-bindings: soc: starfive: Add StarFive syscon
 doc
Content-Language: en-US
To: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>
References: <20230315055813.94740-1-william.qiu@starfivetech.com>
 <20230315055813.94740-2-william.qiu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230315055813.94740-2-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_052948_174709_8E07253A 
X-CRM114-Status: GOOD (  13.09  )
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

On 15/03/2023 06:58, William Qiu wrote:
> Add documentation to describe StarFive System Controller Registers.
> 
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 41 +++++++++++++++++++
>  MAINTAINERS                                   |  5 +++
>  2 files changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> new file mode 100644
> index 000000000000..ae7f1d6916af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/starfive/starfive,jh7110-syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 SoC system controller

OK, I found the patch changing this. So basically you add knowingly
incomplete bindings and a second later you fix them.

Add complete bindings.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
