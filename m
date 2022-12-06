Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CED5C352A1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 13:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jvUqfsg9Dv8A4BaxQqtCCVg9RG1GDSgz+QOpcnlc2uQ=; b=OH8aHrKcQcakYw
	AMF/tWWUPRKJJ3rbkQOZskJlQPwJMe15RLsnlROdZy0MtNCpaQl3Ski6XGeSHDaMgwofXFVRBXt5P
	/b3/g3ojAbwm3knUKTxc2NUWTxXdM8awVrVPcj4a7igrwuyVIqDNGRCGVZalh4Qh65r3661Zlm0jN
	+w6FaX7uZirYj3fYUy28etCpwe2eGO5e6XttSQUgb4Y2290jboue52bUsjtyhSuywyl3YFXsL51Dd
	dvtlLOcNpk0TkBh0Q4ybN4NQIimrgHEfti/FdBVG0Kl7uvY3f4rYJtpaYE/3+LCe+RYTd7AvDk4LT
	tJFrIoNcPsijpqgCHrVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Xf4-009WW3-Pq; Tue, 06 Dec 2022 13:07:02 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Xez-009WS6-DB
	for linux-riscv@lists.infradead.org; Tue, 06 Dec 2022 13:07:00 +0000
Received: by mail-ot1-f48.google.com with SMTP id cn2-20020a056830658200b0066c74617e3dso9211043otb.2
        for <linux-riscv@lists.infradead.org>; Tue, 06 Dec 2022 05:06:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0jTcgACAkSw7JNBb/WV7+vRs389mYQWnqLu0OxzR00=;
        b=ohuYSwdNR9dQUzwOU+MJ3c/Oj+L3ac18IsrkSbNxotLSurhJ9GVjcvLVOp/bc4vuhm
         MFLw75EwRRdKK51SGO51uG9sZp9ETWROEjaF/sjEygxVip88TWOJg7lj5BTJMXUWsfKU
         8mTMWA6uhAMPPR/ROlq1sgtvG8lxgQT+/W3YkZ0OUAiD96dKaLtp1OgsRItGKIt05orV
         sichwKSTXoSRAB8+M3oEKhstscyQxNuP/lQHR8G9fPeEAFUyNhCBRlNe/tEXkO5Eush0
         coFOv+FHugw8yReFSez72wCqvj1GIr1FvJ1k2mZTsvEczUbPtnqInr9ZHoyp9TIppo/D
         E1KA==
X-Gm-Message-State: ANoB5pm5NHCJv1sCmbrKyjPb33zQGYmf9AOut91fOUVuY1cGlO+Ewt1x
	Bb/W+QyXSLVhr+1CHw1Ggg==
X-Google-Smtp-Source: AA0mqf4x7yNixRdj8JvkRnl4xZF7qAyjrvvZTbz2eXONt7y0lhjiBhardtNRqcZTdLE4v7XEXTfQsQ==
X-Received: by 2002:a05:6830:610e:b0:66e:34d1:2088 with SMTP id ca14-20020a056830610e00b0066e34d12088mr24615297otb.149.1670332014642;
        Tue, 06 Dec 2022 05:06:54 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j2-20020a4a9442000000b0049f0671a23asm7796022ooi.9.2022.12.06.05.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 05:06:54 -0800 (PST)
Received: (nullmailer pid 232219 invoked by uid 1000);
	Tue, 06 Dec 2022 13:06:53 -0000
Date: Tue, 6 Dec 2022 07:06:53 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>, Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Jessica Clarke <jrtc27@jrtc27.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: riscv: fix underscore requirement
 for multi-letter extensions
Message-ID: <167033201265.232161.10135246798960157053.robh@kernel.org>
References: <20221205174459.60195-1-conor@kernel.org>
 <20221205174459.60195-2-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221205174459.60195-2-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_050657_478615_72CA67F8 
X-CRM114-Status: GOOD (  11.94  )
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


On Mon, 05 Dec 2022 17:44:59 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The RISC-V ISA Manual allows the first multi-letter extension to avoid
> a leading underscore. Underscores are only required between multi-letter
> extensions.
> 
> The dt-binding does not validate that a multi-letter extension is
> canonically ordered, as that'd need an even worse regex than is here,
> but it should not fail validation for valid ISA strings.
> 
> Allow the first multi-letter extension to appear immediately after
> the single-letter extensions.
> 
> Link: https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-unpriv-pdf-from-asciidoc-15112022 # Chapter 29.5
> Fixes: 299824e68bd0 ("dt-bindings: riscv: add new riscv,isa strings for emulators")
> Acked-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
