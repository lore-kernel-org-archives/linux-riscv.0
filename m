Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D68DC7EE21
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 21:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=be66NfGJQfxxMKFtbS6BtSqgbHlryktRmv2f6nG1CvU=; b=KcithZ4Jcc9z2x
	3Et0rXtXTcTlETSMigU1fge1WbmMbXQmja3E2ROHdfLBXd0KSIvxK3N3zuk85tNVYKT0YkNMC/ZcB
	wFTO4iCzjCujfyiBrhWvKDiuDjQtVrxy2sQncy6fT3SR3DcKxejQgyjYDgUYzGiAXwoW3UL8QXC9M
	Y/OemxfcOCdBX5/+NwC5CdiC2wjEZaoZ0te80uijoIGTtsawY7KYuq2yJM8M042Fm8+jrl08GZ+/I
	xNMIKk3ZdPGt+672VGO0EZ+nkXwq18knWYPP4Hrc4BmVnUKCR9ocSqgnnQ4z5BP6mmFkJ6bMSlZBO
	xanSOsEaSftCJxZPNX0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puguf-0098gZ-2s;
	Thu, 04 May 2023 21:54:57 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pugud-0098fu-0U
	for linux-riscv@lists.infradead.org;
	Thu, 04 May 2023 21:54:56 +0000
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1929d8c009cso893006fac.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 May 2023 14:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683237292; x=1685829292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybSwMPkAzIFkTGDcSk41rri9acnk9seXpVIY7hgiv10=;
        b=JZ0wZPopGUYoQb54KIR5BgQxLYDkIUGioL78MX/SLUaxyC4RXEo0eVRMCkv0J97kNa
         uiusaAUYpCekN0YyvyG4HuVVvMIUbCC98dZR9ScVQBVPVhyDUclQkMDNWqn5dzfRKPFG
         s37fwuFV+tgakgRUvgRP7z1byqZgRkacgVaqy0I72eIJuEH6aSkAoqWiSZ5BPX8T90WR
         zjZoGQbZbd1ObT4JmRaijZ8k39fHQhzBpUufVjIzE/H2ZaFcZr47niE03nC/TgHQjOAU
         5fF0+GguHhCezaY4uumUreltvPp0/fCRgU4jrSlAyvpCHG7lfOhxQLgkjUatiWYTtgl5
         AzcA==
X-Gm-Message-State: AC+VfDxgxoWaXKE5pgUJSHyMkZ30yEhWTRlMYGK6H9K3N+XyxkSXnnj8
	AmJnIQjzTuaIbQi92zWFj9t7T/I89g==
X-Google-Smtp-Source: ACHHUZ4ZaTUowtigLlqEuT3bSo9DQHKVU+1iTaCKLpma/RA/6Q9tiQgg+V7ZpKqj5zZs8Hz0Vu+3Kg==
X-Received: by 2002:a05:6870:32c1:b0:17e:d34c:8c24 with SMTP id r1-20020a05687032c100b0017ed34c8c24mr1494984oac.47.1683237292595;
        Thu, 04 May 2023 14:54:52 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y17-20020a056870381100b00187d06465edsm1090897oal.43.2023.05.04.14.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 14:54:51 -0700 (PDT)
Received: (nullmailer pid 444306 invoked by uid 1000);
	Thu, 04 May 2023 21:54:50 -0000
Date: Thu, 4 May 2023 16:54:50 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v1] dt-bindings: perf: riscv,pmu: fix property
 dependencies
Message-ID: <168323728954.444248.7169255540576935609.robh@kernel.org>
References: <20230404-tractor-confusing-8852e552539a@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230404-tractor-confusing-8852e552539a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_145455_188750_3007D575 
X-CRM114-Status: GOOD (  14.50  )
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


On Tue, 04 Apr 2023 19:03:22 +0100, Conor Dooley wrote:
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

Applied, thanks!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
