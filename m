Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA7DC636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 11:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LNjq4cDyzldACY/Qy1myGxAEcwAlGIU7ja3rIrdvq/8=; b=IW4zIzN6OVuVmV
	d3ttkML/mGlAXdx5k7fX46TSigU/6JTy7o49T5/g/V/XhrkUD9ICXRvJDZyLAhZFjD6g7khVEcnBR
	dWUtipinw+a5WOmbmqS9BJ6fPG2dba/jFulUCFwqN19vumRyp51PHOww6Oqj1WZOfWqCAH37Fw43B
	tkvSXuKj+QFCy9NDy7eAEaumP9eibfC6tKT+PWeYv21NRonocFMRJQ/BMxScC6EANAaVaPKYkmnub
	8GNDK2SrwhH5hHIjOq2NdzrGBu0IloV6j3K8sqiOpiIBSQ0g43hT1wDfbWUrxiOM/cVZLTigSa/bw
	7yZSHLDCX62L1fhgCniA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU4dG-003vSr-Od; Mon, 20 Feb 2023 11:46:58 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU4dE-003vRY-67
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 11:46:57 +0000
Received: by mail-ed1-x52a.google.com with SMTP id ec43so3031487edb.8
        for <linux-riscv@lists.infradead.org>; Mon, 20 Feb 2023 03:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Xtcw3cDdSwHWJsQr0w82blGJclKYlsVnzTEgCTc4ZU=;
        b=KMEEkRJDmcIgKA/eO/YzoO4mA/CdX3ncGdw8UBkQ5iyUeBsWnewXfYV3l+fosJCQMJ
         AcMJzyD0e0kE6vVLH5mP2hOBmwGv3shrzGY4ywEtsXdCd+Tt8s3X0FQGlVsVhSQ2S4v6
         srYM/S9Mx290t23KC8QJuMqzc0oYB+01OAO0wVhPamT3s8m3vWcKHICbfZhg5GLsiK49
         X65TLdCj2/jgZ9CxiKA2W9lJDbAFQHuk6iW3Rl1Fom5JxqoP5qvIX63vQhCvgh1OXauv
         eaD1KMRTQo/YC31AhlmypJ/ZhMrdJEzq5ULrxZfBikwLnasIGREm+Aet7Fe8gQ2hP8wp
         yERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Xtcw3cDdSwHWJsQr0w82blGJclKYlsVnzTEgCTc4ZU=;
        b=GDFdKSO6fFpqbgO+H4vp9Kv4DBHDuuGF1xOxz+f6DrYOuco0WDKVrG/w1CbXrgXQwG
         zMfklAtUC0axuA3dw8kjRaxFg+7FWdEEZszar5vPryo5wHGarFoUpNSsc4z3GmCqY7ol
         zP4kbspABx29aJ1Pyea5Mdg8dvnYZhKoELe61qCY38rUj9uL4PA+LnYXNoitIiCfX+y5
         +U/375xiWdZId0WOtG9qcV9B8D0lfODZrlljyd59C6bFkCLUlecO5IQnLY7bBH4C8l/V
         0S+gxL0dodYnTpz0jLo4jYdI3xm4o4ijv5AINtK6OaLur6xiRma4IFR7Mzy4ENwcZAW5
         /++A==
X-Gm-Message-State: AO0yUKUki2szA3tqo/UXQxZuudpVLOEq9aEhrui2gdwzMhzotCF55iwL
	3jZ2XMV+uuQhLj+dVwN60x6rxg==
X-Google-Smtp-Source: AK7set9OGjT1DLWk0N96S7ZehgjTcX/3x85oE+fS4eeSmIwvBB/N/82doxF58xBruvWA5sE1HVUQjA==
X-Received: by 2002:a17:906:13d7:b0:88d:f759:15ae with SMTP id g23-20020a17090613d700b0088df75915aemr9627155ejc.42.1676893611640;
        Mon, 20 Feb 2023 03:46:51 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id md1-20020a170906ae8100b008b174ef3cdesm5214062ejb.27.2023.02.20.03.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 03:46:50 -0800 (PST)
Message-ID: <817c2d94-12b9-b5e4-764b-d221811a7317@linaro.org>
Date: Mon, 20 Feb 2023 12:46:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/2] dt-bindings: watchdog: Add watchdog for StarFive
 JH7110
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>,
 Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>
References: <20230220081926.267695-1-xingyu.wu@starfivetech.com>
 <20230220081926.267695-2-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220081926.267695-2-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_034656_263774_6F954C2E 
X-CRM114-Status: UNSURE (   9.23  )
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

On 20/02/2023 09:19, Xingyu Wu wrote:
> Add bindings to describe the watchdog for the StarFive JH7110 SoC.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../watchdog/starfive,jh7110-wdt.yaml         | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/starfive,jh7110-wdt.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
