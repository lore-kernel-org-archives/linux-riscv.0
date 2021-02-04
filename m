Return-Path: <SRS0=a4kH=HG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C3C4C433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 23:49:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E87C64FA9
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 23:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E87C64FA9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bt5brvHI84GJP3B58bLCmlq4amdizetXKMYHnTZa3d8=; b=uHvsW8/4HQOQ6yeDketDXO5H7
	Y8WiV7YLJAq7VE6Hi+E7+cVQ5YT5nT2M2iPJ+6uboQ9awjC2POoPYX2GydYjJo1HDl6Kg9fM21Vbv
	EkO59h0OdWkfB6XNjZr5VYrI+T0MaEGHGcSBKnyTy+CwpJOiNgZkUM3s4COb5OO6wsru5XBckyJ6C
	mSvlyWqbZhtESesxbB1takl+sphAHCTefMcaxx8DYkmSiOM8/iqd2SlHpMlYuznv1hulIjzJokMli
	kT3n+GriytrvlI9kksHzkCIpMZYvc+Dq4XeWDKUj+3Hk+lKiR2souhBpg4wWKNeG8fPJdA6/AeXe7
	c87HTsLog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7oNU-0005xg-T7; Thu, 04 Feb 2021 23:49:36 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7oNT-0005wy-Hw
 for linux-riscv@lists.infradead.org; Thu, 04 Feb 2021 23:49:36 +0000
Received: by mail-ot1-f42.google.com with SMTP id f6so5202124ots.9
 for <linux-riscv@lists.infradead.org>; Thu, 04 Feb 2021 15:49:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Wfc6OWt3/EEd+TT0SP5EcWzrZ9Xt8YHduHtrMS54NhE=;
 b=nxI7+d7ajHrv889Mk0DXpqNtsmlLV/lFQy/KnbMgS5d9gVX/wI7oy80pFotl/Q197I
 /61rH4dERfUf+oBmsGXXjFWzaCWvTPxS3zfRe/qlCdmM4eZWQv/FFxUvWFMq0NRtXeoq
 ck34X5uXix976gUxqFfvRJ+UtN+NLAA2ci8hdFjGcMsPfXoVQyp2w1bkVDGFZQJrLmtQ
 fglfttZ1yPRtGxgJ+aTAD4uPq6+8t8BQKODIUUxvD7cKwOlHxQySHQ3e2zGJL23+6B+I
 8u8xg+tbdEvb00Sb7280sLODqMT1zewUrNbxXpFiKHsEPbwPmu3Ooat5tjyUzXltA1M+
 bgGA==
X-Gm-Message-State: AOAM531hibsTq4Ge3iwu8+MogxmZ7ojFEOOnOvp88fVSu+3pHIDmyU0N
 32jZFnIsYR2ou7WIkMtUvQ==
X-Google-Smtp-Source: ABdhPJx0bduAnwbiUeIsCOdD/yJEJn302gjjzNnoYp0hzjtDbYX/c5WdqG1LWIzDW/Ztk6J/dmDYzg==
X-Received: by 2002:a9d:71c6:: with SMTP id z6mr1425886otj.276.1612482574773; 
 Thu, 04 Feb 2021 15:49:34 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l110sm1456406otc.25.2021.02.04.15.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 15:49:33 -0800 (PST)
Received: (nullmailer pid 1353799 invoked by uid 1000);
 Thu, 04 Feb 2021 23:49:32 -0000
Date: Thu, 4 Feb 2021 17:49:32 -0600
From: Rob Herring <robh@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH v15 06/16] dt-bindings: update sifive uart compatible
 string
Message-ID: <20210204234932.GA1353742@robh.at.kernel.org>
References: <20210203125913.390949-1-damien.lemoal@wdc.com>
 <20210203125913.390949-7-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210203125913.390949-7-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_184935_606797_F2CADF6D 
X-CRM114-Status: GOOD (  10.36  )
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
Cc: devicetree@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 Sean Anderson <seanga2@gmail.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 03 Feb 2021 21:59:03 +0900, Damien Le Moal wrote:
> Add the compatible string "canaan,k210-uarths" to the sifive uart
> bindings to indicate the use of this IP block in the Canaan Kendryte
> K210 SoC.
> 
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
> ---
>  Documentation/devicetree/bindings/serial/sifive-serial.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
