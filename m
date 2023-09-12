Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7711ACA0ECE
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 09:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=L7DCy81sj0v9b/K61Z/oJOa0eSL35RO+8EPPhOdqYJA=; b=Ru9atIEztlBnA1PA270OREUk6B
	nXxbedJ1QPLZt0uSEsyblrk88hxQd4+4vUZ0Z9BJSml9Qa7DRVWLwZqZxE/PLn+Vcoyw1Iq1A7hLc
	zny9MlIsGOV8zyz5f96XP+cLy8zyhYr630VFyZ3y6oqpbzW1ZSN5DFS17PQFM92w6K5qO1gUlUAGA
	48DRzEyeszWK0Gb7ksJ+RHVN5GPm59UX7gVOo/XeWi++8W1AEhPUAlvHmDBbfaencmkDtskFEENkK
	uiIr9y5DZDCuxSIPVgZy2nfXCUw/rM1GZ+I6Bvytx4fnRzrjLaSswJmxYi6bnctE2PT8RJGje4Q7l
	34JQUMOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfzS5-002gda-0j;
	Tue, 12 Sep 2023 09:12:57 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfzS1-002gc3-1X
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 09:12:55 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8E5603F660
	for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 09:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1694509966;
	bh=XqCmz97wiINzvOoT4WgJ0jIs9/XOEFkVGg6FT5TVn8s=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=AfP5do/6J5GIGAwXM5VWuPUlh1EAWHOhJdVtno3OjG1ctcBXJiQZatDq7avxUPtqc
	 2lwZsaguzKfck41ndLSI+4HTawnb00sAKqFBUERkuZXcjCWUB4dPF10dulYGE95gMP
	 8ymATo9/kgFeC5c9aD2/VGUFEXA76xfLUQlDNtRIeFuyPb9U3Zksy6yV6Cwvj8CJ3a
	 qU6IBKt6cYWDnPFk693yUHf1D7W9ltKxNJ0bREg5Vi/ZXZPowZkl59OWjLP6EnIokN
	 pNOPG38WgUVRro62gfOyFu7L6Cb+CxNMBv38r8n3xh5eyq9STldtYAzaqmPuHT2yLc
	 SdvZWNjDZcZDA==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-411fc812914so65767161cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 02:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694509965; x=1695114765;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XqCmz97wiINzvOoT4WgJ0jIs9/XOEFkVGg6FT5TVn8s=;
        b=ZKYIaaflTRVTRIzZ9jlQJAYVsTRirMviawJPCYQJxX9fvdQ9vU2wBVTveJdAh4jAGB
         FFI7J56jfcjy8dx3vgsIBjMKyeAjT97Qzb6o/hGaI/1lI7wucjekQCBThLMepSvseyJR
         Ej9j2ZeS0/uz6j67JoTkkz1qNAsP/YP+hAHGkxwEc0kOpNUWWvrToxxhTq/ZgUqK44pP
         +DVART2FuSoH9MEWGidHpzALu2W35RhFb2AAbTrjYOCml16f+UVsEB/ABKgg8fgIuPCK
         VK+eyU+htO2Rf657CXZ6xJsjflJDZWlmYDu7VMV4J8DcU+jGEq1zjLTpsN1kqiajVcbv
         Pd2A==
X-Gm-Message-State: AOJu0YxLhAJsMiwjs3yiezZjUs1gloq9g7uQ5Ez1LiI66PbRU4u6jIWz
	5I0lrtjysuwwQ6SxotpnCqahFulwxFySy7uCQHm6w+5y/fM/9YRGIgkVu5VjmpY4JX41MsB+VX0
	K/EXRyxn9+ToXqJZsAgKMrhe+cVYLEZzc6wfZHHXXiPlNCeAK3IA6NxoRqRGsbQ==
X-Received: by 2002:ac8:5a89:0:b0:412:1c5f:4783 with SMTP id c9-20020ac85a89000000b004121c5f4783mr15578478qtc.10.1694509965369;
        Tue, 12 Sep 2023 02:12:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQQlGlQgk/r9shaDmrB/tSYmyaL8Wp5LDCM9Gtr+QkolQC9uKaGfomkgojXdkeuMHTeIyAFpf8bRY5ZqnJUC4=
X-Received: by 2002:ac8:5a89:0:b0:412:1c5f:4783 with SMTP id
 c9-20020ac85a89000000b004121c5f4783mr15578458qtc.10.1694509965100; Tue, 12
 Sep 2023 02:12:45 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Sep 2023 02:12:44 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20230912081402.51477-1-william.qiu@starfivetech.com>
References: <20230912081402.51477-1-william.qiu@starfivetech.com>
Mime-Version: 1.0
Date: Tue, 12 Sep 2023 02:12:44 -0700
Message-ID: <CAJM55Z_NjSVwCcS0MfHw3mAwsBuScAU0OXX1Ga1+TfQNHKB7Vw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: mmc: Remove properties from required
To: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-mmc@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_021253_638194_59AD02AD 
X-CRM114-Status: GOOD (  15.96  )
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

William Qiu wrote:
> Due to the change of tuning implementation, it's no longer necessary to
> use the "starfive,sysreg" property in dts, so remove it from required.

nit: again the device tree should be a description of the hardware, so the
justification here shouldn't be that the Linux driver doesn't use the field,
but that it turns out the registers aren't required for the peripheral to work
properly. Don't respin the series just for this though.

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml b/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
> index 51e1b04e799f..553a75195c2e 100644
> --- a/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
> @@ -55,7 +55,6 @@ required:
>    - clocks
>    - clock-names
>    - interrupts
> -  - starfive,sysreg
>
>  unevaluatedProperties: false
>
> @@ -73,5 +72,4 @@ examples:
>          fifo-depth = <32>;
>          fifo-watermark-aligned;
>          data-addr = <0>;
> -        starfive,sysreg = <&sys_syscon 0x14 0x1a 0x7c000000>;
>      };
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
