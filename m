Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 874FFC4361B
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 16:08:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 454A623AC8
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 16:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 454A623AC8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ILY2A+YxvkDBbLjpAuIpJkTd8BiWcb6EefdbQ/BSt8U=; b=iJSVOfgz4TMSw4Nrs+8XdDKNt
	c4ZfhlXomYCEHPmObJI5WbF7EAKrh3z9gTnB62eCHICHN8o2LcmKyisPO43o/73vlybeb29o+hFr3
	Yc3MdrMmZqSyuHzhHabzEm6MQzj2dCBN/CXeBN+2KBFdB+gSzzVze4z/YEpIc3z7DkAYV3aSKxStA
	o6gEu+6IFORVw8C3RhFS+3T/gyg1YJdl3HatgnZ8l1vLT4TxzJz6Jandc4kTxZ4ZYhZoNavAy/2Yq
	mjBTrc4RwsyouaL/p4T6AsIyULq9+ERiOyPHElI+S3VlEEsisPhC9/UAD0hRgl1OIZCGCOsEl2IoH
	HfnjRZnCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmfX6-00044C-O9; Tue, 08 Dec 2020 16:08:08 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmfX4-00043U-9C
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 16:08:07 +0000
Received: by mail-ot1-f68.google.com with SMTP id j12so16218480ota.7
 for <linux-riscv@lists.infradead.org>; Tue, 08 Dec 2020 08:08:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mweAoRAMYtGzuxRv3uHviTPgdKnfEr7b5CEQKG4Rgn8=;
 b=JtvkyhA8cYOnkrbNyyPaX19rlrmOkdjfFt7+Bu7TjMfCE4h461/zDAEpj1te8vLHG0
 slRQzrH5Sq8KxuzeGPxc9eixX9R3Hzc5kt1akhZoYwz8F0mF6Y2WNbGje8WDmVnGijGT
 uWuHwQPbIQbOxzresb+c8lWCEp0CQbrWPqxTwKdoSipo+rceNyHdLCy3zgW1h7MoZb8m
 qOy6Q5KrGWcE3PqCTzhjD2XKJtUbsV9LfyUE9om09TrwGbSjFBNJf3PDTow0plz5GtCF
 STWBRJajdKDRQ2Lt18n2atmwdCV3GsctMfMIqXsZvs9YIaiBHo1EiGtNCgGprwBMUcBD
 2z7g==
X-Gm-Message-State: AOAM531HQWkuHPQ4Nr2d9LRwwBWy7aUXHC+IBI708lSrqUU3NDpzuUr1
 3gtr+Vnj1HfazKt/aoRXYw==
X-Google-Smtp-Source: ABdhPJxnVjacUosb5YctPA7wCq3YhI515oWeUV2l8wXXDI4R4fgyB8WycWyotta9RbO6dfQ4tHVi6g==
X-Received: by 2002:a05:6830:1f5a:: with SMTP id
 u26mr17388620oth.250.1607443685461; 
 Tue, 08 Dec 2020 08:08:05 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p3sm3472992otf.3.2020.12.08.08.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 08:08:04 -0800 (PST)
Received: (nullmailer pid 2618576 invoked by uid 1000);
 Tue, 08 Dec 2020 16:08:02 -0000
Date: Tue, 8 Dec 2020 10:08:02 -0600
From: Rob Herring <robh@kernel.org>
To: Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH] dt-bindings: fu740: prci: add YAML documentation for the
 FU740 PRCI
Message-ID: <20201208160802.GA2618546@robh.at.kernel.org>
References: <20201126030043.67390-1-zong.li@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126030043.67390-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_110806_348491_C28E9A76 
X-CRM114-Status: GOOD (  10.32  )
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
Cc: devicetree@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 26 Nov 2020 11:00:43 +0800, Zong Li wrote:
> Add YAML DT binding documentation for the SiFive FU740 PRCI. The
> link of unmatched board as follow, the U740-C000 manual would be present
> in the same page later.
> 
>     https://www.sifive.com/boards/hifive-unmatched
> 
> Passes dt_binding_check.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  .../bindings/clock/sifive/fu740-prci.yaml     | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sifive/fu740-prci.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
