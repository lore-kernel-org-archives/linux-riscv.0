Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68394C28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 20:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kvCKM/L183ERjNfdSXI1BpM+VO0CzC9w2myMEbK6TiQ=; b=jG6+By0o64z7Wi
	/R18oj64a6aOqeP4crJist5MhCmwHFfL5N7NUhQDdpm3rF91NezPCEzY4LAblTMPBRcWKnLAkUSeN
	Kja+QW7kYtmuyA1n1esYiL9W3GhfXP+nQYa57BDVaFMFBriCLjsuRjmV5t5zb8qxrETmb1TdJ/OlF
	3qOUNd51tZ7nMdoqs06DOgKk/TuYak8bBDjvY/ApdRY+WtqnD85KWiidVlhbT9jOYzbASvY0nnQPd
	XiPqypGl6XnKevVuS2wk4qMgIu+5M5/1O0BHEZ0kNQ3FqBx9oYHf1Ygh4o9gJzTX1zi2VInLvp/Lc
	5gcVDbiHltpcuiY84sRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQDiJ-00ENvt-9L; Mon, 22 Aug 2022 20:07:59 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQD06-00Dzse-9N
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 19:22:20 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-11c59785966so14094059fac.11
        for <linux-riscv@lists.infradead.org>; Mon, 22 Aug 2022 12:22:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=XYeCBMg131pB0j2VmNawT54IXYU5/MzkZ/BlFX3u31o=;
        b=8JSs3zrj6CwYgf4kwaeSJLiXEreN8Oxw76XGdvTvkdyUuO1YzoZPzkSEXtRb90vt4H
         E6KZDmZYyQZ3fZGZWOFEe1g4m9Q2Zo0QxGZdQSWZ/P5ESSotmYeYyZJTWF6GBgL1C7Kh
         zsTSNlPLqT5zVwHrmD7PmcaXDJnKfqUiYX0m+72OWchfDD2yrLH4zQ7CgdraI04vx19c
         ObytifM+Ho74fsHbZizDfmhdToNGcP0RaxHs4SzCBOvordKQMPDtLyEFbEw40biMsVMX
         6QxcEX9XGCMmDixvkuukMlegXYWHqmo0vpgCMsMsv0XEYGPjnWqPtVorq0gdI7jffecz
         UHcQ==
X-Gm-Message-State: ACgBeo3QfZP6ODfukqsnKSNgeDmOJTj5H6x7AaZRa4d5Wg7SOmI2ktsy
	8b+lWTqLLtRRVIr7yawshw==
X-Google-Smtp-Source: AA6agR4C6U0o8E+u7YSuackcXgmLM/+ZYuWOzjyzdDV3bdDWFS1RQQRbmCvkIUaUBWmg8TrLD6DxVw==
X-Received: by 2002:a05:6870:2499:b0:101:7531:c7ec with SMTP id s25-20020a056870249900b001017531c7ecmr13481946oaq.42.1661196135861;
        Mon, 22 Aug 2022 12:22:15 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k5-20020a544405000000b003352223a14asm2767770oiw.15.2022.08.22.12.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 12:22:15 -0700 (PDT)
Received: (nullmailer pid 292234 invoked by uid 1000);
	Mon, 22 Aug 2022 19:22:14 -0000
Date: Mon, 22 Aug 2022 14:22:14 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: linux-kernel@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Daire McNamara <daire.mcnamara@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 3/7] dt-bindings: PCI: microchip,pcie-host: fix
 missing dma-ranges
Message-ID: <20220822192214.GA292150-robh@kernel.org>
References: <20220819231415.3860210-1-mail@conchuod.ie>
 <20220819231415.3860210-4-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220819231415.3860210-4-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_122218_389014_8B73FA8E 
X-CRM114-Status: GOOD (  10.01  )
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

On Sat, 20 Aug 2022 00:14:12 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The dma-ranges property was missed when adding the binding initially.
> The root port can use up to 6 address translation tables, depending on
> configuration.
> 
> Link: https://www.microsemi.com/document-portal/doc_download/1245812-polarfire-fpga-and-polarfire-soc-fpga-pci-express-user-guide # Section 1.3.3
> Fixes: 6ee6c89aac35 ("dt-bindings: PCI: microchip: Add Microchip PolarFire host binding")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/pci/microchip,pcie-host.yaml          | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
