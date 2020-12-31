Return-Path: <SRS0=hIOt=GD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1319C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Dec 2020 18:34:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54A86223C8
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Dec 2020 18:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54A86223C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cLq6vWd7sxF0V2COc+ZVFfM0vb+F9KYpVBzORpu4FNs=; b=XiCDNOUq+6s0rA1GZ55p0Mg7B
	4IZf0UOr/oF/0bsavLtxDl2bGcACVEvXXgR1taUqlhpJdcl6EdPTpsDKZv9T7BahPQvj+n2KEnSWd
	ifSFMor31d6RPLYxuqXnNuvaBhNPjzJpMEdJIOpxFK+LBtIphmifWHMXzPjFoE8G6ebTioBEcw/Bx
	aJX4SLasaJCD5R1QM0jmzIrr5AyEqm26HcGBpQtkyQDDSpZ8yTXzKrFlSZ7zAHNqDIlaE2V0nMZPW
	SySZKxa9eneytd6yh7QcpaSIxppSh+PUmkFxaUXIpKClTu+qbPnooJ+WrD+kkBtmL7VXyb+S4/BLb
	ih5qeCcbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kv2mb-00086d-0w; Thu, 31 Dec 2020 18:34:45 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kv2mX-000861-Pk
 for linux-riscv@lists.infradead.org; Thu, 31 Dec 2020 18:34:42 +0000
Received: by mail-oi1-f169.google.com with SMTP id s2so22593995oij.2
 for <linux-riscv@lists.infradead.org>; Thu, 31 Dec 2020 10:34:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F6GO/pF6op8vNadZMJry1vYTssx1a6tY68+XCu4xIas=;
 b=PjGK8sN8XD26K+ycQV4r5MYZPAq7lhBvvoMvjZT5pNhoF2CCI9O0YnB/0sqZOFTFDT
 Vm+ylTGjQPYJiIsRHw0X2m+ZQPFXJqgSvetEUOMJgcnG8K2orpRxjdBTfhLbJDEJDCLr
 KarLFd7Pd6ZsCV6uqC2GWR0TW+J4rejxp0hS/AGMDkqPuA/Q+EjHMVJ92jvXFvMISmYa
 CDf58nqHIziP6+JhkuXQJnBQTsnL34DPBEmeTbcQxu4UDZ3Lb50rpvgdS1iWPYQ60SIG
 qO+YOmVk2LqftWMR38/3K6cuil77yzQ0EvERWLp29i1Wo7OkpF6eu0xhM/MIK9pG9mR0
 z8uA==
X-Gm-Message-State: AOAM531v7Amz2+rF94/bq0j5lI3qDnMSnyTXMVzGzfenmvwFmXW6MgbB
 flu1ThMJswunI7/ogWkxMQ==
X-Google-Smtp-Source: ABdhPJw5jb2HbYQ/4+/j5s0xoEhsHOLYmsFBuhcXx7aFLOWXNkmjfe0Ob33KoZ3EIedtrzOcqKi60A==
X-Received: by 2002:aca:f106:: with SMTP id p6mr8709854oih.63.1609439680378;
 Thu, 31 Dec 2020 10:34:40 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id r13sm11496792oti.49.2020.12.31.10.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 10:34:39 -0800 (PST)
Received: (nullmailer pid 2113540 invoked by uid 1000);
 Thu, 31 Dec 2020 18:34:35 -0000
Date: Thu, 31 Dec 2020 11:34:35 -0700
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Subject: Re: [PATCH v3 2/5] dt-bindings: add bindings for polarfire soc mailbox
Message-ID: <20201231183435.GA2113432@robh.at.kernel.org>
References: <20201223163302.29057-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201223163302.29057-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201231_133441_860203_5E16876A 
X-CRM114-Status: GOOD (  11.09  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, damien.lemoal@wdc.com, aou@eecs.berkeley.edu,
 lewis.hanly@microchip.com, david.abdurachmanov@gmail.com,
 daire.mcnamara@microchip.com, anup.patel@wdc.com, j.neuschaefer@gmx.net,
 atish.patra@wdc.com, robh+dt@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, cyril.jean@microchip.com,
 linux-riscv@lists.infradead.org, jassisinghbrar@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 23 Dec 2020 16:33:02 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the MSS system controller mailbox on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../mailbox/microchip,mailbox-mpfs.yaml       | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,mailbox-mpfs.yaml
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
