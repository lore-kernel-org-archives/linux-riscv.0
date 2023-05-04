Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C5BC77B7C
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 21:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+4zW9ZS9GiI3L2rikIK5ZhKnIJhyQovfIP4bYSqUYo=; b=gp0OUNyPIEVV5a
	FWE0lKhguxaBlcLPs/CoRKiRV3U7uxLfz88uuqpwz3IBnzg0d2hqBlUQeH7Bdrno/MmOtr673idBS
	xMk5S/C0nlTScw/UrjiW3ujlDNdloWQior96hdLBsvjBDGBtBakIfdmcSvU8t7rvsij77k9iK8zoU
	Sm8pDV70WsAUab9J7v95MDNd743rgxc5jZeoGrNOXQgnNaaq83aC5DDkgBV7udP3xorX42NETvvdv
	aeNCmQeZJ/Xk+5hDMBS21SjmjG4+cqPMuT2VBJinR3+9CkloaqGVlOImRk8SmyiNiKU5XwdhKPB4z
	iZ90iCu5AUNx6fQVcUyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pugXI-0093tM-0d;
	Thu, 04 May 2023 21:30:48 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pufSk-008unA-2G
	for linux-riscv@lists.infradead.org;
	Thu, 04 May 2023 20:22:03 +0000
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-54cac3ba705so512448eaf.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 May 2023 13:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683231718; x=1685823718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gA20TOSek5QN06wRXiWT/dSTTLiibBANa8l3zZw/ZW0=;
        b=KTU4N3FwDhbwTj5gLp29cmJL7ms4Dpy1/6usDjI8Br4Y5i5bTwutyqhFIoqI6onBeb
         a+YjpSthPiAuQYXxc4YB+qN5AEcmB+sdzGCEpnLfuS9QvKK8e2RsHEE5zdynkzZv6IU8
         2vxqT6c3EyCygO4J3uWFJa11z9NKBWGJA20+rS/5xoTqFSvywEARgo2R9sRk2YLqNTq1
         AC9MMKRdPIjWnoCT5yuQXiP7ehXpmjKsW3A22hsxYpuXtGHHkEQnNV1Gm8uuItOo7npL
         ca/vi9uSpn6LtcE76J0HTQEEvak21b2ma8sH3CWayc8ccduuPUR+hj0BpE+55e5AFjOH
         MHRA==
X-Gm-Message-State: AC+VfDzvNyKSeG2QmyB3tAbQ/aUCg0gZq+ZmylTF0tuS9z6eQwCmEnme
	G1Q0SDETsLCioJzM3FV7mw==
X-Google-Smtp-Source: ACHHUZ5CG9NqSZrBLZgYDI1UBcc0h1gHIMntqoA1SnNdYU8ayNb3BfWME5yS8u0iFY/rBBuEK8CKFw==
X-Received: by 2002:a05:6808:2913:b0:389:21:9483 with SMTP id ev19-20020a056808291300b0038900219483mr2333168oib.59.1683231718082;
        Thu, 04 May 2023 13:21:58 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r2-20020acaf302000000b0038e086c764dsm2036478oih.43.2023.05.04.13.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 13:21:57 -0700 (PDT)
Received: (nullmailer pid 263633 invoked by uid 1000);
	Thu, 04 May 2023 20:21:56 -0000
Date: Thu, 4 May 2023 15:21:56 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: perf: riscv,pmu: fix property
 dependencies
Message-ID: <20230504202156.GA260181-robh@kernel.org>
References: <20230404-tractor-confusing-8852e552539a@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230404-tractor-confusing-8852e552539a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_132202_736942_9D799B8A 
X-CRM114-Status: GOOD (  19.30  )
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

On Tue, Apr 04, 2023 at 07:03:22PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Seemingly I mis-implemented the dependencies here. The OpenSBI docs only
> point out that the "riscv,event-to-mhpmcounters property is mandatory if
> riscv,event-to-mhpmevent is present". It never claims that
> riscv,event-to-mhpmcounters requires riscv,event-to-mhpmevent.
> 
> Drop the dependency of riscv,event-to-mhpmcounters on
> riscv,event-to-mhpmevent.
> 
> Fixes: 7e38085d9c59 ("dt-bindings: riscv: add SBI PMU event mappings")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> 
> Atish, I'm not 100% on this one but I noticed it while doing dt-validate
> on a dump of the qemu virt machine which doesn't use the
> event-to-mhpmevent property.

Waiting for comments before I apply this...

> 
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Atish Patra <atishp@rivosinc.com>
> CC: Andrew Jones <ajones@ventanamicro.com>
> CC: devicetree@vger.kernel.org
> CC: linux-riscv@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/perf/riscv,pmu.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/perf/riscv,pmu.yaml b/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
> index a55a4d047d3f..c8448de2f2a0 100644
> --- a/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
> +++ b/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
> @@ -91,7 +91,6 @@ properties:
>  
>  dependencies:
>    "riscv,event-to-mhpmevent": [ "riscv,event-to-mhpmcounters" ]
> -  "riscv,event-to-mhpmcounters": [ "riscv,event-to-mhpmevent" ]
>  
>  required:
>    - compatible
> -- 
> 2.39.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
