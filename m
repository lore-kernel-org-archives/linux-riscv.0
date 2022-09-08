Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210DEC38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 21:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iu16OZKOwJ1xhnbso/YV1fvr3ZZU6wCz89VHm+Dt6FM=; b=DawnQ6ijASoexF
	i/2skKr0u9O4v9wrQzb9dg8sbJdI1napWtgvqG79JL1zEnWBBHnXnA+sT8x0ffD9AAiJRzX7B7FGC
	brNHuNUzLeXce11nnGSX3RD/gRQvCn1SS96SilJCt+bzPmWtIspWGqd8dAg4+bXxJasrJGtA0Y2tx
	QKm92vr1+3W7WhDI2UPDb7uHxSBhz/XsTIkvzw/zsg3WTGysiQVDLWw1KnK/xdU8HlLRumiYWzY0j
	WlgSddJRYuhYqUf3x1ULXxoW8crIwjWjbk8lExFtG4JUau8sVGehqT8AtshYsz8LmFW2Ifq9Q/d6s
	ZsbATykjWrkeUQMZXHuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWOd2-008nwG-Et; Thu, 08 Sep 2022 21:00:04 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWOd0-008nuD-5V
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 21:00:03 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1225219ee46so47799002fac.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 13:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Ht96cST8yQVzZBwVWRMco1CmpG7NqtflpXw8c4bPalc=;
        b=0yX0h2MO+ViiKkMbjGChPiRfAPsbt8GuokBgtvJPhTRVywa2wPNMXPIOAgg3CQ95ul
         3sKftwZO5J305yN+PwWNlMKCcxEhhFit8fQJbFSy90HJB0j1Mj5WdQMzTPwfmJVfMyh6
         dWtvO3BGfzz+nPKAm/sKxMHMZr3XX7H7pny4/Yqk55ePc7A9+cKq7eqW+x2iiffCXXFJ
         b7fkxapZCpioHj+kovruRwaNxUahYKDWhsUjJRcWeNsB93I8zgE6SIgpuQCW/o2cTyoD
         ktdOQVI97KT2y8WCjx98cMsOCG5DCQ8b1D2LlZ9CkazgPzKIohBf1mnX60yDNpI9JRMc
         q/qQ==
X-Gm-Message-State: ACgBeo3dBeS2TvEiOdqV/7KoP+HjzeNzDjh7XonjZ0oNz79Zll2h2uOU
	DE7mTFPkSZqA+PXhOrl8lQ==
X-Google-Smtp-Source: AA6agR6skDdRn/PXQvtpF4wFOybY+PCqKSviHzZig+83x2LieXx6i5By8KhuwT1kbLOGTGYdrWiC0g==
X-Received: by 2002:aca:acc6:0:b0:34d:1b3b:6437 with SMTP id v189-20020acaacc6000000b0034d1b3b6437mr1669384oie.286.1662670798794;
        Thu, 08 Sep 2022 13:59:58 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id h18-20020a056870d35200b0010e3cb4c98fsm117130oag.9.2022.09.08.13.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 13:59:58 -0700 (PDT)
Received: (nullmailer pid 3332296 invoked by uid 1000);
	Thu, 08 Sep 2022 20:59:57 -0000
Date: Thu, 8 Sep 2022 15:59:57 -0500
From: Rob Herring <robh@kernel.org>
To: daire.mcnamara@microchip.com
Cc: aou@eecs.berkeley.edu, bhelgaas@google.com, conor.dooley@microchip.com, devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, kw@linux.com, linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org, lpieralisi@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, cyril.jean@microchip.com, padmarao.begari@microchip.com, heinrich.schuchardt@canonical.com, david.abdurachmanov@gmail.com
Subject: Re: [PATCH v1 4/4] of: PCI: tidy up logging of ranges containing
 configuration space type
Message-ID: <20220908205957.GB3240357-robh@kernel.org>
References: <20220902142202.2437658-1-daire.mcnamara@microchip.com>
 <20220902142202.2437658-5-daire.mcnamara@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220902142202.2437658-5-daire.mcnamara@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_140002_227568_3D2FEC07 
X-CRM114-Status: UNSURE (   7.34  )
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

On Fri, Sep 02, 2022 at 03:22:02PM +0100, daire.mcnamara@microchip.com wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
> 
> PCI ranges can contain addresses where phys.high part can have a type
> of 0, signifying 'configuration space'.  Change
> devm_of_pci_get_host_bridge_resources() to print 'CFG' instead of 'err'
> for a PCI range containing such a 'configuration space' type.

Generally, putting config space into ranges is wrong. It should be in 
'reg'

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
