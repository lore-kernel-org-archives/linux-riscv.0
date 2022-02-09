Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E1EC433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 04:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7RhhuDeIvt5UZvhO/04MXXEu3bkqkxwqVv3bGR4i4MY=; b=vgxpCLTZmh3Uq/
	e5IM8qKrKfSLAKP+TtV4+fC8KK2yZTwcy0JlixuHcVeGjTG4N/P/Ipsj63hrXRTcgSgFc3vD9cmdi
	pnh8VAZ0Gkz2zqa/N2tHOHpRSDMIWtyvKL5EvA8GFWtoDCcZGOCG9kvxBrDtfvlr+PrjKQLknLBuA
	j6hZlRwgnGNGk/fGUv/rcpg0gU/DamU+PwbDpyPHsN/yMonaBZ+6aMgEd3eLJ9lRKlhPU4p6lAtc6
	cFdt85F/81NXndnbdlr9s3xbwsgSR0nSsasIN2hOeS+0dsM2JQnC1Cr2G54sqN+TYq+/bDyyfHVtK
	SMrpXdsJS7M5RV54cAEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHeGF-00GBlD-DS; Wed, 09 Feb 2022 04:07:19 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHeGD-00GBke-Dv
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 04:07:18 +0000
Received: by mail-ot1-f42.google.com with SMTP id
 x52-20020a05683040b400b0059ea92202daso708925ott.7
 for <linux-riscv@lists.infradead.org>; Tue, 08 Feb 2022 20:07:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1SlUTfORdsnc28tLEfE1geAYG+A9VRD+iXQo9kSBBGU=;
 b=0fKalFxJJiqYxWGwzrw0OAPDzR73e5W+u/sjZAU661w87LZxGDPGDZWv7ivPb4psa3
 4k1LBWGhnwHBN4acvXenY2nHmpkRWG2ECLDZAjvgah+uF+BBJwtk2wswpD69ssTp0v2W
 tQ/txq1/2p5i1xC7COjg4aJKvGYNOG/hshYdizc59ccj1q++R3mrUdK+3rZRrQbHKqd+
 +BidCRlU+Rxnqlcv2hnuG3R6jyxN3jGPfpT+9HfH2UC/BpHlfk/j6CC/gkuQ1eR5KOvt
 y7eFObdTFqc22dsprwuKd3W7jTtlarAnVsZGgX8mAsG0Q0INXD9B0K8GXbTqZdvZ1CYl
 8kig==
X-Gm-Message-State: AOAM533e/9r6AaR1iDpOX6M4plfJScsHp9wS6pACqpRthCo71Sj2wEdh
 3UAZ6WX6h1fZ6s1S0HOwKA==
X-Google-Smtp-Source: ABdhPJw6Scyx5dzsHwxnzN7Mj5MuFSM9+a94On89xDB7U2azXkCI0FCjcs4h2HE0ouBxZojmq/wkrA==
X-Received: by 2002:a05:6830:12c1:: with SMTP id
 a1mr213959otq.374.1644379636810; 
 Tue, 08 Feb 2022 20:07:16 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id x19sm6148453otj.59.2022.02.08.20.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 20:07:16 -0800 (PST)
Received: (nullmailer pid 3636515 invoked by uid 1000);
 Wed, 09 Feb 2022 04:07:15 -0000
Date: Tue, 8 Feb 2022 22:07:15 -0600
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@nucleisys.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 08/12] dt-bindings: riscv: add binding for Nuclei
 platform boards
Message-ID: <YgM980WbioH/gkPL@robh.at.kernel.org>
References: <20220127151647.2375449-1-icenowy@nucleisys.com>
 <20220127151647.2375449-9-icenowy@nucleisys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220127151647.2375449-9-icenowy@nucleisys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_200717_490623_2D175709 
X-CRM114-Status: GOOD (  10.40  )
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

On Thu, 27 Jan 2022 23:16:43 +0800, Icenowy Zheng wrote:
> As we added support for RISC-V SoCs from Nuclei, add device tree binding
> for the currently supported board-bitstream combo (DemoSoC with UX600 on
> DDR200T board).
> 
> Signed-off-by: Icenowy Zheng <icenowy@nucleisys.com>
> ---
>  .../devicetree/bindings/riscv/nuclei.yaml     | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/nuclei.yaml
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
