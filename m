Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D6DC433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Mar 2022 10:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O+Qq8LqGoNKmaf/4OpMtfWkpz57To4X73LCHsBytOdA=; b=iIcA8rK/tsqV3N
	mflH6uygn2fLs4T8YAeSGwfCmx6Jpd5dzRmzDAyLvecK24Ys8YeKAbQBzYbi8D/AkMEQMQ3GjqhHa
	FjTSikZ5h1TGG6nXsBloHRPi8lMuorWztj2ockoyTeJ3mamkShI+YY5DAd/zUcaw0AFJrbIMXIcRd
	3HSPQDaW/QEc3QXCtCGMcp7tUNALYy87/b6N+VQCl2snNdwRMqxvb2MRXcL/V9f02H7d8qzxMyR5G
	9EhpNj7U3S10TCYZnEmkdLC8Xr32R8QlGWAs7b5eIc2OieMS29WfkUiqtqcXJvFop1rPDEbiEOEzp
	pp0tghLpWlGQ/wltN9CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRAbd-00H7R1-3f; Mon, 07 Mar 2022 10:28:45 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRAba-00H7Pc-4o
 for linux-riscv@lists.infradead.org; Mon, 07 Mar 2022 10:28:43 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CF3783F5FF
 for <linux-riscv@lists.infradead.org>; Mon,  7 Mar 2022 10:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646648914;
 bh=n4LldnGelhoblkd1zTeAcrQUBsJGtchc+UnMsYoKCgg=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=LvrHybSk+9Npw4GvcsX63AebRCSrJLA/K8IcCJ/gqoj+BSMzGBtDxBdEgGgHBCZQf
 gOc4qmG/iv8hgjRDBF7dztVEeIIDkOJ10Sy+rwdfAtDv7bwUxotAuAscSwqRsMo1Xc
 OKqmz8tl5qghqCen9+dB17K2WfHGDmJtcf+/tmv5fma/4PufSvCWV3WbOfrwjHElBz
 rIA7LDLoIyZtjcGITlgK23EApYx0XDTPlD8/S58b/IZ5AsxYHN84WkUHqMVROeRJwy
 6pk5CcJGaql09pr93OIFAy3Xsr0s4yL29RVgmLtRWBGJcnpafD7ylWnlPhYQYCgG7k
 xKKYgdUNtXUow==
Received: by mail-ej1-f71.google.com with SMTP id
 qf24-20020a1709077f1800b006ce8c140d3dso6785897ejc.18
 for <linux-riscv@lists.infradead.org>; Mon, 07 Mar 2022 02:28:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n4LldnGelhoblkd1zTeAcrQUBsJGtchc+UnMsYoKCgg=;
 b=qEAVuaRlZ4LW9Ce3O35Fo8m7c+jGJhceB/jSuU2gkRDPZfeRO0IHIykAz7mwGaqJjE
 v5C6Y8sONA3HxTUenXWW3ODQxJsAztMVsH7tRqXGIRHR8eGwP6VURp3q1mU0fwCrVUgn
 4RXIWhPxdO6JLMk0KW9JITWuYVeN1xm5+7m/l3ZgNz5AqTIrbW7CPYK6IYNIPAf9xl8D
 VzMJM+Md33aTpfGLi3GzjVU/clRatkeU568As+KceaVewmeeNa40IErFeLJGC9objzEF
 G7P8iu99bOQZk2dGxf9IFabBUGtGg2hhZkv1DaEUu1Fu9YVZMLfbEOI4wtdN3AQu3in5
 s7HQ==
X-Gm-Message-State: AOAM532JUBBlu0ntZQrWk2xlSmqOc7jMurI+IKIE5JNhwkKq/4NNooy4
 wuQ8J3TxcMBi1is4V4nzdEu+GujtNBBdlq14mL+r1oVpD4G7CnbaYzhkYgOo1adKZem6tphw/S+
 2d2Qi0UgW8trie1jZOKMfY+Vbq56ETV0++29fB3gFJQLBSA==
X-Received: by 2002:a17:907:7815:b0:6ce:5242:1280 with SMTP id
 la21-20020a170907781500b006ce52421280mr8358562ejc.217.1646648914047; 
 Mon, 07 Mar 2022 02:28:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgVGHw806iLNc31AIobcdf7SovFCeUFaY2HECf3Fa28ex2JcevW04haDjZiWoqSaBkFMAV0Q==
X-Received: by 2002:a17:907:7815:b0:6ce:5242:1280 with SMTP id
 la21-20020a170907781500b006ce52421280mr8358545ejc.217.1646648913829; 
 Mon, 07 Mar 2022 02:28:33 -0800 (PST)
Received: from [192.168.0.141] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.gmail.com with ESMTPSA id
 q9-20020a170906770900b006d20acf7e2bsm4618438ejm.200.2022.03.07.02.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 02:28:33 -0800 (PST)
Message-ID: <0b516030-cb4d-106e-57cc-06767702724e@canonical.com>
Date: Mon, 7 Mar 2022 11:28:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 1/3] dt-bindings: dma-engine: sifive,fu540: Add
 dma-channels property and modify compatible
Content-Language: en-US
To: Zong Li <zong.li@sifive.com>, robh+dt@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Rob Herring <robh@kernel.org>
References: <cover.1646631717.git.zong.li@sifive.com>
 <1e75ad35b7d1fb6156781bf9c545e1f084c43a1e.1646631717.git.zong.li@sifive.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <1e75ad35b7d1fb6156781bf9c545e1f084c43a1e.1646631717.git.zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_022842_453437_277244F9 
X-CRM114-Status: GOOD (  11.99  )
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

On 07/03/2022 06:44, Zong Li wrote:
> Add dma-channels property, then we can determine how many channels there
> by device tree, rather than statically defining it in PDMA driver.
> In addition, we also modify the compatible for PDMA versioning scheme.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  .../bindings/dma/sifive,fu540-c000-pdma.yaml  | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
