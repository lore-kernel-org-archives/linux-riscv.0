Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF591C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Dec 2022 22:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gz9rIyIvOxq6yGUpDk0hgeKluKYUhRdN93rOwEwRImA=; b=S74L0lVYUmiOQ9
	N5Lk9ERW+to9ILm72cJIdXAX/OSsunIiifMRXvVK/QjIBV9HVZuzdJjNQdLsKhcPMJFAv3SmAYdrl
	I5N5gbptV6T6lcrsupQPC2EV4cyrrOPBxskoO8EzfGsNhf1wzw+DB/IMrOjO9y6nLjvUVvyZTKOAd
	MV5+Fnb1RkK6dO162oJ0Oyuv1zvhwspeSUtP7oW56CndD0Q8rdxoKF8VE8igAjf+4EhbRPc3iLvi+
	2j4ethZYz3nfwo44+iB1SHz7ayb7W0/oeGdaXkaRIi4uhLP50xZd6z+BDgAewWzcUYVOZfifQTQF3
	6/gBi6hCgk/LtoToIaJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5a5c-003ajk-5M; Wed, 14 Dec 2022 22:19:00 +0000
Received: from mail-oo1-f53.google.com ([209.85.161.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5a5Z-003agm-6s
	for linux-riscv@lists.infradead.org; Wed, 14 Dec 2022 22:18:58 +0000
Received: by mail-oo1-f53.google.com with SMTP id e22-20020a4a5516000000b004a3d3028bafso2197478oob.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 Dec 2022 14:18:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fKwEYXKRlbCe5cbb/8awwIxIrypc26XlILxNrHM9Gw=;
        b=qCux3qC7KFQLObtKLWoRxiqbYYk5iX1GLv38iH3z1sgP1Si5kY4SHecV53yB9Wyx1J
         PpDQQoyeTymEIWB2eMwUFO9YrmlM+j54pytLLnxOWSeIyyUS0c+8q8MYiv5cyR0g+QvV
         DSnb0AoF/SPUlzXCGSSLHxbgSY2lCFRYzrU9ZXQCQ+w00nxd6xhzNAatQgO0gJ4PCyHj
         +U92TtwZaEtaTsGmd578MsipPdUsUXl2VDvLxerLNrhR6KSBBJ0pMu+Kx8enBXsmbDjh
         /08FwfBnXcP5G57xR6cL6MLtN1BnWYTi/n5FPBN8FcDWwGI3NPW5eUKrnUFoBbxNJ+RQ
         L0LA==
X-Gm-Message-State: ANoB5pmNsbDJ1yeP3Nm/lg248HuL9im86PpD+u7iMTyxScvhc+e2Yncm
	VUeubSMtXS5PkGRkdAhX+w==
X-Google-Smtp-Source: AA0mqf7HttOuSbgbvR3LOAKmSgdhIpPAL3rCgPbbswvtsLMzoZSAPewNb8F5s9juDilGd3WifVo9NQ==
X-Received: by 2002:a4a:92d4:0:b0:4a6:5afc:9a51 with SMTP id j20-20020a4a92d4000000b004a65afc9a51mr1117536ooh.8.1671056335956;
        Wed, 14 Dec 2022 14:18:55 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l4-20020a4a2704000000b004908a9542f8sm2726970oof.31.2022.12.14.14.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 14:18:55 -0800 (PST)
Received: (nullmailer pid 1735858 invoked by uid 1000);
	Wed, 14 Dec 2022 22:18:54 -0000
Date: Wed, 14 Dec 2022 16:18:54 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] dt-bindings: vendor-prefixes: sort entries alphabetically
Message-ID: <167105626477.1734283.4192335575546485583.robh@kernel.org>
References: <20221202110536.22230-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221202110536.22230-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_141857_270021_3D9FD5FD 
X-CRM114-Status: UNSURE (   9.29  )
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


On Fri, 02 Dec 2022 12:05:36 +0100, Krzysztof Kozlowski wrote:
> Sort entries alphabetically.  This was a semi manual job with help of:
> 
>   cat Documentation/devicetree/bindings/vendor-prefixes.yaml | grep '":' > old
>   cat old | sort > new
>   diff -ubB old new
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Patch rebased on next-20221201 therefore might not apply cleanly to
> Rob's tree. Probably should be taken after the 6.2-rc1.
> ---
>  .../devicetree/bindings/vendor-prefixes.yaml  | 64 +++++++++----------
>  1 file changed, 32 insertions(+), 32 deletions(-)
> 

Applied, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
