Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9166EC28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 20:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wjsu9PhNLFa6A67gyZ9kIE58lfoRZ71Hld4WIGXZIHk=; b=uJXDovV0yCUsZY
	ohMRvsaMnSfo8Z+9eYRUiAI3H+s5hzsQaN2uttPcAYG2b1cagv8FaKNvGxMHtIOR5oZH/nBMU7enK
	ghg4wgcdaMkc1b8g9JhJExJvzLyXPuLdibt0/YrbmrOjrmCyuV5mxfUXiex7j2sePdXzvWOCyLBs1
	TbelY17OGxxIvnJSVSw5/LWsDBEjf9p1uM3KRd1tNzHG5GalbOzjf2ZybVq0g+CFPRJn7rdd9xuWA
	XNCGCcmyJocUFxv5piu0gMSBn0jAj/egKZZyKrYd+n7o0rrzyqEBcWgOr6YJCLaoeG3OoI/QIz6W5
	HmbgyWtIB0XjmBW50sDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQDeX-00ELsA-9w; Mon, 22 Aug 2022 20:04:05 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQCyS-00Dyvc-Mv
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 19:20:45 +0000
Received: by mail-oi1-f180.google.com with SMTP id w197so13387568oie.5
        for <linux-riscv@lists.infradead.org>; Mon, 22 Aug 2022 12:20:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=B6xw/Cz6pu5G+t2AHd6LglUUHVajl9/hwpJ6XbtejIs=;
        b=gLt6ax8X+xonbZPENDtHdP8PDusKGYmZcIeZZifvKwsEi0LYRDR60PRtcuIcnxYg+8
         +q8zX5Xq+rTP9aSZ33FAO2iqhUatZp4GXMNNyTK4nCCOTEQqASKLgHOPAPqREWTLL/By
         4c/eHwHl4mspAPT0682vmQ5I23upufkQAi4CkRZ6k2Qb1+p9Mzz6lHqL31faOwy4j+Xu
         uMonhPcr3RbnLYYr1V0my/bnt5C+sWBjjYkM3qFnXeFyBqNteF6+UAvuzJwPHlEtJMvq
         kkCXHonO3wnpCdDIZ0Xv4He4InWwNoRyD5ubkRNuRp+4MN50NSj0cOGNyDDzkXt9yG4e
         ROkQ==
X-Gm-Message-State: ACgBeo2/L5UL5AZkVd/T32opWlBC0e5GJEx2wWoqJdwa64g/x8z85Lc2
	ecntRvyNFsfGzF5S0Se1aA==
X-Google-Smtp-Source: AA6agR73zf1PIYrSd81xUVIR0DA6FXBmjDteQmGwPHo/nIcUUF1r97Vn6HNX0r+wQtaupfFJ2yrtNg==
X-Received: by 2002:aca:4189:0:b0:344:d96f:4635 with SMTP id o131-20020aca4189000000b00344d96f4635mr11556610oia.131.1661196034364;
        Mon, 22 Aug 2022 12:20:34 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p18-20020a4ad452000000b0041ba304546csm2628004oos.1.2022.08.22.12.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 12:20:34 -0700 (PDT)
Received: (nullmailer pid 283097 invoked by uid 1000);
	Mon, 22 Aug 2022 19:20:32 -0000
Date: Mon, 22 Aug 2022 14:20:32 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: Daire McNamara <daire.mcnamara@microchip.com>, Rob Herring <robh+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org, Greentime Hu <greentime.hu@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v3 1/7] dt-bindings: PCI: fu740-pci: fix missing
 clock-names
Message-ID: <20220822192032.GA283027-robh@kernel.org>
References: <20220819231415.3860210-1-mail@conchuod.ie>
 <20220819231415.3860210-2-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220819231415.3860210-2-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_122036_804653_74BF8452 
X-CRM114-Status: GOOD (  13.75  )
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

On Sat, 20 Aug 2022 00:14:10 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The commit b92225b034c0 ("dt-bindings: PCI: designware: Fix
> 'unevaluatedProperties' warnings") removed the clock-names property as
> a requirement and from the example as it triggered unevaluatedProperty
> warnings. dtbs_check was not able to pick up on this at the time, but
> now can:
> 
> arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dtb: pcie@e00000000: Unevaluated properties are not allowed ('clock-names' was unexpected)
>         From schema: linux/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
> 
> The property was already in use by the FU740 DTS and the clock must be
> enabled. The Linux and FreeBSD drivers require the property to enable
> the clocks correctly Re-add the property and its "clocks" dependency,
> while making it required.
> 
> Fixes: b92225b034c0 ("dt-bindings: PCI: designware: Fix 'unevaluatedProperties' warnings")
> Fixes: 43cea116be0b ("dt-bindings: PCI: Add SiFive FU740 PCIe host controller")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> v2022.08 of dt-schema is required.
> ---
>  .../devicetree/bindings/pci/sifive,fu740-pcie.yaml        | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
