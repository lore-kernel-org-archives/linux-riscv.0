Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB97EEB64D8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 16:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j2xj5EmXsjIaz+FmadoCsB5HG6CYE9ebDuMkQVKigJk=; b=BIF0HdY93vUPU0
	C5E3pRq20wEfapscs77ua7dK8nPtO6dcsGL44M+fwUQhceSVy6xQCnorcQx+i2zUv6XoAumR6qhUD
	o9VA8M7m5+rxwP5PS7fqmm4Jdqd27N9sGW3nXrREc1pNqzoWZCqN3sjoEkB5Cra6DBPs2LbC1JXtV
	AjsVhmEvR3C5/zKgaAI6J1Ft9avwwjBoCLbgBMkBFyUpL3MTMKxsWBjfQEdg9nYA5JbctgoZ0NirW
	ZyXr9PR4Hsc+84hcbN9s0lJEras4O6+lZuc76OpgSJyPID8Qm7j9KVvLbztxIxt90+QszdF3j6H8g
	F7IJIdEcdOclGQMZ9VxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBeXJ-00BrKn-26;
	Tue, 20 Jun 2023 16:48:57 +0000
Received: from mail-il1-f174.google.com ([209.85.166.174])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBeXH-00BrK5-24
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 16:48:56 +0000
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-34271602c32so10503415ab.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jun 2023 09:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687279734; x=1689871734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKtBf3FdQDl5x5uXgdHSfUH2YbLABmeDIyDo1DZ9iLo=;
        b=D8hEpQQkhfy6AxXHLPR7RR3hlyODyN1ppQP+HUbnpSfMppaxpxixW5umK1dZuN6fVd
         B80U054/Wpif900QH3Hhb5QuJNjzmtsNPQ389FZXmT/VaZROQpF96rAV9Zj6188jitok
         c5dJkrHX4kBix8rZcDJ84dge1FOE4Vxx+uJS5wxnyD2wNlJ4cGDqgniB2bhzHSbiLLyN
         1XTQFAajoTr/VgzHwX6ehOdBVimcUnOOzeLZJNRyczFMRDmrrkgSxn/uPupjkJyYwfuU
         lGow/aaGPTZL+C+Ah3ZJZKXjNCe/xUYc5IJ03yNgPaUECtjtXoaDWJJYyD3nM0X6z0uX
         VUYQ==
X-Gm-Message-State: AC+VfDzN8a23Y/fggU6BlAI8o5/0I4aMjxF6QSpIcZbl+f+uHWeJ5sAX
	2wA8cKtmJeYmxg9nT8aInQ==
X-Google-Smtp-Source: ACHHUZ7My2jXB+Dq8VAUIRgDY8jlDmbwnilxlULBF7tROA1iafJHmdLKZVOsJySULbyVs0PQNEkGoA==
X-Received: by 2002:a92:cb43:0:b0:342:3f23:c144 with SMTP id f3-20020a92cb43000000b003423f23c144mr8651793ilq.28.1687279734478;
        Tue, 20 Jun 2023 09:48:54 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id s11-20020a92d90b000000b00333b5ae4ab7sm693461iln.87.2023.06.20.09.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 09:48:53 -0700 (PDT)
Received: (nullmailer pid 3803830 invoked by uid 1000);
	Tue, 20 Jun 2023 16:48:52 -0000
Date: Tue, 20 Jun 2023 10:48:52 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, palmer@dabbelt.com, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: riscv: cpus: add a ref the common
 cpu schema
Message-ID: <168727973145.3803765.17862726534015699285.robh@kernel.org>
References: <20230615-creamer-emu-ade0fa0bdb68@spud>
 <20230615-dubiously-parasail-79d34cefedce@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230615-dubiously-parasail-79d34cefedce@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_094855_682009_1CB4E6C1 
X-CRM114-Status: GOOD (  10.47  )
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


On Thu, 15 Jun 2023 23:50:14 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> To permit validation of RISC-V cpu nodes, "additionalProperties: true"
> needs to be swapped for "unevaluatedProperties: false". To facilitate
> this in a way that passes dt_binding_check, a reference to the cpu
> schema is required.
> 
> Disallow the generic cache-op-block-size property that that drags in,
> since the RISC-V CBO extensions do not require a common size, and have
> individual properties.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
