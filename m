Return-Path: <SRS0=XVif=ON=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE825C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 17:00:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FBB661241
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 17:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7FBB661241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=94kYna0YhvEyZ/wQwqpSL0rdvldHZ+AHi/mWrxCBdGk=; b=NbfQ3X9Oqkg/Df
	ziNYIM9/OI94D49rXa3GMEHK27K4Oq7X3kcozYIF7i+aI9wG59fmbYQRf3IDIlyCcYhJmUV0XTW7i
	Lp4nNOq54yPUSu/F+3igg0fPkBE6Y1S/t3Ht1DJ3SN3yCuQtzZL5QXoQCL7SDcoKM4KxiDq/Sok+e
	SKbZlsgvgjUZnoDAiFq56S8EU+XuTmKp332QaPG4bSxk15oNN+jRryQhueHM5yqy6klGEoFF3V5x3
	1ZB7jkeEOdWDiBy7BEF8VWPFyUF2pEpJ78FKYJWUd2EDTyD6k9C/SM2aF73vcg2c/Hpe72p15TxOi
	yH1jsopc+biu3DCx68jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTS4P-00CD9B-VI; Thu, 23 Sep 2021 16:59:38 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTS4N-00CD7o-JK
 for linux-riscv@lists.infradead.org; Thu, 23 Sep 2021 16:59:36 +0000
Received: by mail-ot1-f53.google.com with SMTP id
 c42-20020a05683034aa00b0051f4b99c40cso9517647otu.0
 for <linux-riscv@lists.infradead.org>; Thu, 23 Sep 2021 09:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1i+M8EOr7e57ftQjdyXXIOehi2M7Hp7GON39uqkaep4=;
 b=FLpS1LIFvAgmk1op5QsHaNTXjdEHTOvG/pztD0cc9IuqlJKVtgMhWf3mhehD5kPrPf
 51NSH+9gq1ymtDmfrpH3alr56Y/qwpUJC1UDBNcfWLUvZyK8CqFy7t5c4kPzWVPiYE2v
 Vo4LB/pQbGw+fHB9NQ0OIHRQ7OSqU45sKrk1KwXEoiDrHM3tqU7au864A4bUCr/aHxaY
 rqV9kT5UefpLmoysbLozjK6touG9sesmXag7hdgSUwWxat+nKU83jJ7gZIvkBzQnQAK7
 7lEhIeP25f9AMfNARvwg7bslO6z8+tmNVht7g8aSS9WO4uZjzkSI4u0TPHTIDMFKTacu
 sxVA==
X-Gm-Message-State: AOAM53359EDuLna4iVKPhnilhRfCdlEyk8FTNQUOMaD7yLto7HnF3guI
 M/DC+QKs0OwQ0d9Bv4vH3Q==
X-Google-Smtp-Source: ABdhPJyJacfEO2U/tWDyQhP1Mzyf1Ng9ln0l9pqO8lCSU02mh5acU8WvyIVenmskQ9rvKbUnPHh2iQ==
X-Received: by 2002:a9d:7b4f:: with SMTP id f15mr5168057oto.158.1632416374200; 
 Thu, 23 Sep 2021 09:59:34 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id g23sm1407552otl.23.2021.09.23.09.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 09:59:33 -0700 (PDT)
Received: (nullmailer pid 3169434 invoked by uid 1000);
 Thu, 23 Sep 2021 16:59:32 -0000
Date: Thu, 23 Sep 2021 11:59:32 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Zong Li <zong.li@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Stephen Boyd <sboyd@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] dt-bindings: clock: fu740-prci: add reset-cells
Message-ID: <YUyydGrDNzISu6JX@robh.at.kernel.org>
References: <20210920144944.162431-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210920144944.162431-1-krzysztof.kozlowski@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_095935_682850_DCB73F11 
X-CRM114-Status: UNSURE (   9.83  )
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

On Mon, 20 Sep 2021 16:49:44 +0200, Krzysztof Kozlowski wrote:
> The SiFive FU740 Power Reset Clock Interrupt Controller is a reset line
> provider so add respective reset-cells property to fix:
> 
>   arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dt.yaml: clock-controller@10000000:
>     '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../devicetree/bindings/clock/sifive/fu740-prci.yaml          | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
