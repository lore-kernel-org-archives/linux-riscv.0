Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D8AC77B61
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Apr 2023 17:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yCbr/syuBpSvSiBRSBO76zFDN7x34T8uEDirOwZNhJE=; b=sk3Gb9QU+bX7HV
	pABD+sWdWIw4HCCB7o8yLNOyRckycKUVE7qqYZETOU4OBfSuPYhU2yZIbrjN4CWJK+iaqsYOKdp3A
	I+AIhVF2SvBdq7PcmBLToxQhlPdiNVjrjcof3HxknSD/a0Tf+KZTS0IQibYsYhTSuJ8R2WjOIyryl
	PFV9qAXA2AY5jdwE+gtDgZLFNsUiqgvNcGnjwHkzzCks99ZWCW1zO5g5YYabGSt/JdysuJLGKIFIR
	gJJsTMQCfB7lBRLujoQvSf4h+YLSYJIsjnKj5bnZHMWYrL695LwTogLzL5mF+HhFt/NUiIPop1r33
	8oYrnGfFPgEok75Km0JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ps5aY-0078SN-1x;
	Thu, 27 Apr 2023 17:39:26 +0000
Received: from mail-oo1-f54.google.com ([209.85.161.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ps5aV-0078RT-2Q
	for linux-riscv@lists.infradead.org;
	Thu, 27 Apr 2023 17:39:24 +0000
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-549d9c2935fso2405658eaf.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Apr 2023 10:39:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682617161; x=1685209161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AD3fQdKaQFdku2aIFjpNovuQ9wn6Q2sNynbCaMLgODE=;
        b=XBbinxdrQXQq0daHO57U/FRzgcjQ/qc0f+zovR9aK3ZOzAVr6COoYAI/tQJP8kf1vB
         1/PGMoT48JNjtj4seLKfJ6YDvJ7DVD380rIZg47ta2YmrMztLxW65y5Kv1fkmNUT/YgQ
         O8qraE6h3KHIbgodvp6aigP6NL/xCtFveFe5ETXdM/BHURd0sx2EIIPWR6sRxc4VZcBy
         QHBObROI8ptzMyxSni/95dunpMlghbL+eyScHBStbooOrxU/ZVl32md6peiGI7LwWSci
         qebbN2pNHUw4f1dg7qa8YPzpDjJHyWSz/M1GX8l+PoSWMv2QNir+QQxn+ouu7wrt4E44
         XHVQ==
X-Gm-Message-State: AC+VfDxm3HulI+gr7HDWMzsE4G4Zi6jarmEuv91UWrm1DE75+ZiOCBO6
	NZsLEvUAHuG/peVkbqEUOg==
X-Google-Smtp-Source: ACHHUZ4503HyHI7UJ3zKQxVNIZ7VAtQFhpl7W6Stdj0s/zR4e0u8lGqIZxNeWBv5Zi0MxXJgKlORiQ==
X-Received: by 2002:a4a:d896:0:b0:547:5725:7711 with SMTP id b22-20020a4ad896000000b0054757257711mr1407382oov.6.1682617161624;
        Thu, 27 Apr 2023 10:39:21 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 27-20020a4ae1bb000000b00541fbbbcd31sm6196058ooy.5.2023.04.27.10.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 10:39:21 -0700 (PDT)
Received: (nullmailer pid 3209698 invoked by uid 1000);
	Thu, 27 Apr 2023 17:39:20 -0000
Date: Thu, 27 Apr 2023 12:39:20 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: conor@kernel.org, devicetree@vger.kernel.org, palmer@dabbelt.com, linux-riscv@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v1] dt-bindings: riscv: explicitly mention assumption of
 Zicsr & Zifencei support
Message-ID: <168261716012.3209643.3723944369525088026.robh@kernel.org>
References: <20230427-fence-blurred-c92fb69d4137@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230427-fence-blurred-c92fb69d4137@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_103923_784526_FB06B505 
X-CRM114-Status: GOOD (  11.04  )
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


On Thu, 27 Apr 2023 11:43:42 +0100, Conor Dooley wrote:
> The dt-binding was defined before the extraction of csr access and
> fence.i into their own extensions, and thus the presence of the I
> base extension implies Zicsr and Zifencei.
> There's no harm in adding them obviously, but for backwards
> compatibility with DTs that existed prior to that extraction, software
> is unable to differentiate between "i" and "i_zicsr_zifencei" without
> any further information.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Conor Dooley <conor@kernel.org>
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: linux-riscv@lists.infradead.org
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
