Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E72C7EE43
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 20:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W7qIXUL8U4WlxxszXxNekm/Fa8lr1WwCNfeblnJjGU0=; b=e67u4qNkXkNqoo
	TygdPptaud4wfmBBjaf7U45mvmM3NcewM6C35p9/fJjV/yqcRrAH/W8jxDz8UfM3VIS2IHeHjDrGh
	TqvSo2EO/EDUH6JAcRA7dLcd8Fkhib290uPqz2yhzeaCOIXIvNzkuhPHbwaikTTubhlalbYG6t4ft
	hkR5d9Fzy/n5/uSLYDsdPO3e8uYoiYjDjrHCLfejIFZ7HqcwbpTtkzKiED2L0jfEN4C2v963ql/BW
	OuKwRPHbCk43gqAVoHql/jjcd6u6c0eP3tKeoNuyNkU1GrbWbO+jh//9lXM0btvWPah5KuAcBRygT
	Fs1Gg6sbC9cR5ou/G8Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7MZh-00AbRZ-2e;
	Thu, 08 Jun 2023 20:49:41 +0000
Received: from mail-io1-f54.google.com ([209.85.166.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7MZd-00AbQJ-1c;
	Thu, 08 Jun 2023 20:49:39 +0000
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-77493b3d18cso56340839f.0;
        Thu, 08 Jun 2023 13:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686257375; x=1688849375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2oEVvsEJofbyF89JSmEJIs782G632G9KkRpVUkYg+xo=;
        b=UyrDguJt5LeDBCl2Lklr6HsE08UCwGScqg5Eh7q6+g3UMe1R3MHbT9s5u82Fi6c9xJ
         I7qpTaLG3ETr5V5lNxI2AWU09pl1Ek5y2x8DpZoC1GPif8DU46ATeFFvMNqoxN8leDGP
         9jGdPKNGtF93PzY7kV/PHmX5qPqFuotvNOzAsSJqN97PQvJZg9JsxYYZUG65zfIL1e8J
         dS00T5n5rXjphoG5ypIDqrgDsbxFanPokkhLDLVfERCOvXT14VPqYmzw6L3cm4YsxK00
         EltSiDxGBWPKab8v0BJH8OgZrxdcajTubx+gGinFGS2eRsodSkHgWR0gBrfI+N80EWrC
         +G9g==
X-Gm-Message-State: AC+VfDw3XbU117vk+aU4+eRUjeqEmKaM4p1/b0hWDtExuqIlApgH9/1R
	sPX9rAvBTr1I3M6AwEIYew==
X-Google-Smtp-Source: ACHHUZ5qTQOnKA3U/k3iLhcQxsZOmMmBOzJY8yW4hZRaO8L1cjJlpPQFQrNM+JE4gDg96ik61eT3Rg==
X-Received: by 2002:a6b:d818:0:b0:777:b175:d11e with SMTP id y24-20020a6bd818000000b00777b175d11emr13776691iob.2.1686257375091;
        Thu, 08 Jun 2023 13:49:35 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id z3-20020a5ec903000000b0077ac811b20dsm590724iol.38.2023.06.08.13.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 13:49:34 -0700 (PDT)
Received: (nullmailer pid 3424755 invoked by uid 1000);
	Thu, 08 Jun 2023 20:49:31 -0000
Date: Thu, 8 Jun 2023 14:49:31 -0600
From: Rob Herring <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-riscv@lists.infradead.org, linux-phy@lists.infradead.org, Kishon Vijay Abraham I <kishon@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v5 1/3] dt-bindings: phy: Add starfive,jh7110-dphy-rx
Message-ID: <168625737130.3424689.15583912932705671257.robh@kernel.org>
References: <20230529121503.3544-1-changhuang.liang@starfivetech.com>
 <20230529121503.3544-2-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230529121503.3544-2-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_134937_544969_89ABF773 
X-CRM114-Status: UNSURE (   9.76  )
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


On Mon, 29 May 2023 05:15:01 -0700, Changhuang Liang wrote:
> StarFive SoCs like the jh7110 use a MIPI D-PHY RX controller based on
> a M31 IP. Add a binding for it.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../bindings/phy/starfive,jh7110-dphy-rx.yaml | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
