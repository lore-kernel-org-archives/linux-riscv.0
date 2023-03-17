Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10A4C6FD1D
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 21:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F+yMSL2ivEUumjEP0QcWzN1X315imddAtMnS5Pr4PIA=; b=SXBfIA2Y0jJqdK
	7CXGqZoAD0Sz+4LgBZ/UPhTAEzv4XaMLhkuhE5aZO/FwANsv44SxzEteuQoa7VEziPjcfqGL6ow3W
	qTcgPSFLSpzZEdsd8HWeE72qJbbtOvmj5BKmkpgoNU9yhdBiN6ObgmSk5ZaYGIYsNUYEqrkWWOSfj
	g93Yu7mzyfy/1gAZgFoTVjEJTHNvPFcynLuO1llO6W1r3lqdlc6EgFogcES2oPEebZQc94evN8c9N
	daCLPrvqbYebIQJQG1IeM8uCpFI/NsQPlEF79JmjDh88eW/45J5bYb8wQpo6mYOP4v5LMSEJ0lraC
	z4HnjRBQ6D3X865r+9KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdHKn-003PMM-2A;
	Fri, 17 Mar 2023 21:09:57 +0000
Received: from mail-io1-f48.google.com ([209.85.166.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdHKl-003PJg-0y
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 21:09:56 +0000
Received: by mail-io1-f48.google.com with SMTP id v10so2870790iol.9
        for <linux-riscv@lists.infradead.org>; Fri, 17 Mar 2023 14:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679087379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJjkdUcY9AWxCDvg4UhtGFEbpOz8FP6Z6hjJ4WNipBE=;
        b=1YlTTcIosA0fcUrQP1awbP5lQajVp3tDP1qjXcMTAtdg3XTJygXe5irxTZZU8sQVJy
         iqoG7XlYEHNywVBEjALFyzGOGB/tDPSxZ8i6axcKr/oBmyfcqbkZyFW1B4j5d5RWCCML
         Ch2yAUWSp0sapc83DYdL7EOO0BDL6HBDobsBBfOSwZS7clZRKXsDfbBDTQ6Gcj55awIq
         7zeP7Cn1fYXlUN4H4d9Y4Nxd5pKiUdRDqKAKwDNgiDPDvmxAaxHJsCnWAJLMyCo3gt7H
         FXHcpzqj+EjnWJIf6IAtc4JGrbroHryySPXQQD9+55m2r3rFTvvwWr3Pm3xRiLAES5Su
         jp9g==
X-Gm-Message-State: AO0yUKWIvrJLupUPwN49j8hYhViMQhrV6b5wsPqnzXOomTJ9Rv/i7S2X
	G+l0Jusk9vjAy9h41NDHG3X2Fakgvw==
X-Google-Smtp-Source: AK7set/ZUv+aH87BKtKr6DwPjobM7Ae5IZJ5lDL9yd5h2e+8QMtJhjH+new0tYZcxWxEgjV2zx9+BA==
X-Received: by 2002:a5e:8c1a:0:b0:74e:3b0f:4498 with SMTP id n26-20020a5e8c1a000000b0074e3b0f4498mr30945ioj.7.1679087379656;
        Fri, 17 Mar 2023 14:09:39 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id x11-20020a056638248b00b0040637924a30sm598205jat.31.2023.03.17.14.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 14:09:39 -0700 (PDT)
Received: (nullmailer pid 2809946 invoked by uid 1000);
	Fri, 17 Mar 2023 21:09:38 -0000
Date: Fri, 17 Mar 2023 16:09:38 -0500
From: Rob Herring <robh@kernel.org>
To: Walker Chen <walker.chen@starfivetech.com>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 1/3] dt-bindings: dma: snps,dw-axi-dmac: constrain the
 items of resets for JH7110 dma
Message-ID: <167908737748.2809883.11210849394769213152.robh@kernel.org>
References: <20230314083537.22571-1-walker.chen@starfivetech.com>
 <20230314083537.22571-2-walker.chen@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230314083537.22571-2-walker.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_140955_341453_93B889F2 
X-CRM114-Status: UNSURE (   9.52  )
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


On Tue, 14 Mar 2023 16:35:35 +0800, Walker Chen wrote:
> The DMA controller needs two reset items to work properly on JH7110 SoC,
> so there is need to constrain the items' value to 2, other platforms
> have 1 reset item at most.
> 
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> ---
>  .../bindings/dma/snps,dw-axi-dmac.yaml        | 23 ++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
