Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4217CC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Mar 2022 09:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f4HhlQzh72RnE3kMcHySobipUWLnj+2mJm09xLspi2I=; b=YYvUH3pKJUy+40
	rq7ItL2SLiyMdGF/oigXETor70Ojme/CInDAKiCG074eNLvvJ7vKKUtlaDdNeHNu083DUuWC/nsqZ
	YTsIK7D+c42t7jlI1glnhRWxIOtavG914kjtiDyEXHxWDMwN83unZw2qE24Pj1LqdxWp3wY5/ojQm
	VPp8KupJUAnhem7dluOQ18oNjVz2fSGaWk41EwPem2n92+ECaK9yrE8IecNNiDxOGIbjslk+EvnMA
	YtKUWKSbSpbPnkztGxtMfP6NwEOypf5zw//0cRG8aIWqZMZOLHyhs7VUw2elBtxSTyYG3EABqlhLi
	KJZZ0M0ghg7jo3vfGLig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ4Kj-009JXO-Gt; Fri, 04 Mar 2022 09:34:45 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ3w6-009Cv4-1y
 for linux-riscv@lists.infradead.org; Fri, 04 Mar 2022 09:09:19 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3830F3F5FC
 for <linux-riscv@lists.infradead.org>; Fri,  4 Mar 2022 09:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646384953;
 bh=RTZPALBXRdkEKxlmwBNBI927r6kcbqzn0JImmuscASw=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=g2SviGZfMtfmvWGXnBkFDitDyKKO/kMOLXzjCznCqd3TqS70fI507KbuXDWpwfSfU
 0kFpNFB5H75zsYss2Zflew/kkKpWPUd4tI9q+yibNykuN4iFh3pLwnMXbgqZ6LCWZT
 /Qrzdt174JlC5/ye+4YCY13QC5SkO+gn1dBmt+BOa6KUFDOLbjSAt+TGGWHBWXvivy
 2TxEFC0g7hFA0feXyogND31NIHu85D/bIac1k3zROjd1tqG+PHFnp7QPuQ0BpOkgHA
 pU2hasod23K2Wkeugz37j6E00gPanxPvyrj8uWU4AVBCC8dfFbCCOnP+k6SJ7aVGfP
 WbQxUKL5NR0Fw==
Received: by mail-ed1-f72.google.com with SMTP id
 u28-20020a50d51c000000b004159ffb8f24so4295477edi.4
 for <linux-riscv@lists.infradead.org>; Fri, 04 Mar 2022 01:09:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RTZPALBXRdkEKxlmwBNBI927r6kcbqzn0JImmuscASw=;
 b=6+XXsVrPUmgbAqAq3eE54a7QoEeNM6QRtOPnKY32d/GdR61AaVRfLXUZ9Kvs+CMIjr
 QlRNKsypvFIqranQEWZU88mofqvRDKCJKIDkrzm7CPTEWAo0EqK5txb++gAI7F+UTrzS
 CVMo+D6wmj3dmzm2d3DHI5/B1W5AKbr3nO99DwKOG9r5I//NWCBB3XAr8KKkDqUJa9BD
 bDj1AVz8wYRaQ1F0CpU+oHJYOazN3ASdwZ6txJ8wUgyYMRoBC8zLqn9irHrILLXKuw6a
 PVZUwwn8wFK/CyL6Yp+Ts8yCT3ndkA+dkM5yaWBTTTRjKIhS7Aqei8Nan0hPCK4xB71O
 P4xg==
X-Gm-Message-State: AOAM531q36wRqTB+K2PEU/K8sf6SJLUZYh3jiJm88KS5je6SzroxaBKl
 QVAqrRGM/k8/Ix+juXgFJK5BVwmxZPS3vU9U8Fz9EbcP+gzXGjRUsWaDEo8x+lGnxdO7+7zEENL
 Rni7UBujaWcdQNmXzkzPUB8HRtkFlTtCLl7IL8t1LsJqj5w==
X-Received: by 2002:a05:6402:42c9:b0:415:e324:c211 with SMTP id
 i9-20020a05640242c900b00415e324c211mr6137377edc.234.1646384952687; 
 Fri, 04 Mar 2022 01:09:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXgyrNgfR/FnZmmPxYM01MW37vjWNK7AzoWWi8OQyY16xhXHNchbX5Jg3tWX4OAVkVq58unA==
X-Received: by 2002:a05:6402:42c9:b0:415:e324:c211 with SMTP id
 i9-20020a05640242c900b00415e324c211mr6137362edc.234.1646384952492; 
 Fri, 04 Mar 2022 01:09:12 -0800 (PST)
Received: from [192.168.0.138] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 l9-20020a170906078900b006dac5f336f8sm137442ejc.124.2022.03.04.01.09.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 01:09:11 -0800 (PST)
Message-ID: <1664de3d-8e33-596e-19ff-4fb174f2a178@canonical.com>
Date: Fri, 4 Mar 2022 10:09:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 1/3] dt-bindings: Add dma-channels property and modify
 compatible
Content-Language: en-US
To: Zong Li <zong.li@sifive.com>, robh+dt@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Rob Herring <robh@kernel.org>
References: <cover.1646383150.git.zong.li@sifive.com>
 <12cff3b68de1bd02a8915bd70999bb4edafaca1b.1646383150.git.zong.li@sifive.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <12cff3b68de1bd02a8915bd70999bb4edafaca1b.1646383150.git.zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_010918_445302_D5ED5F1B 
X-CRM114-Status: GOOD (  12.92  )
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

On 04/03/2022 09:42, Zong Li wrote:
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

Can you add subystem/driver prefix to the subject? In current form it
looks generic, but it is actually specific, so:

dt-bindings: dma-engine: sifive,fu540:

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
