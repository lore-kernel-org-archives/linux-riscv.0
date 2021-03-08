Return-Path: <SRS0=HQWJ=IG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B14C433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Mar 2021 20:12:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 389C365194
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Mar 2021 20:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 389C365194
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w7JLCieD8n31EixZWkVi2Bu4RNQhusLJM6F/CanfOi8=; b=CfGgVoKOMWf2WBaMvFAAFLL+Q
	2Ea5czACt3qN4jHYpw7W7wlhVmV+1vzuf5aWV3X5IQTXLMKDzqIoyljtWKZ+4VXiFqDoEqnzqex6L
	p3Bg2JqKVEaC4cP8kg55vEcbgQuaF+rltT16EKmIT8NjDLJZQnYqhufjKiu4T4Yo4RGZ80TUnSyJV
	xVnjd5tQpji4ij/g/C9WB2MvkKLYZaOe10NnYb80CD7+K26kOXjUezoc4Ovudqw4sfwdYPUPdhGRL
	GGrrI+O+jQJBEggZCwkSlzvRREFsiFQMpEj0/1kN36r7eI4zO8AooI+M/d5XLIY9QHI1F7Xhn9UYC
	27CKkZtpg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJMEl-002SOI-Ht; Mon, 08 Mar 2021 20:12:19 +0000
Received: from mail-il1-f181.google.com ([209.85.166.181])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJMEE-002S6V-K1
 for linux-riscv@lists.infradead.org; Mon, 08 Mar 2021 20:12:05 +0000
Received: by mail-il1-f181.google.com with SMTP id g9so10028971ilc.3
 for <linux-riscv@lists.infradead.org>; Mon, 08 Mar 2021 12:11:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QpbDs8aiZXfIsuQ/5DPkHrIH9XnSKt6WGe3vBO4wbZk=;
 b=DycqAUFswYZ+wCctoZ/cQZQz1H1XllSX0sGFFi4Jp59VWpjpu4SU7iX87VF8eFDARC
 OE+f42tHFJARpOr+DXp0/isfALVeCZsV9aS39K41iOrfJ/pSbdKogNhSZtY1w41rcxYw
 aK6ciV6caqE16AS9vsfmP0oOgHkHWU8Z0H0QGUFERy51gAicpef8MDTeyQG2ePxDvhrl
 s6Sx/fcpQie45iYec/mCDGuHnP0tZwNAKZy+hv5wvaZfhK+qIXjvs9AlpslEGc5EuPGj
 jBSQyTIR+HETO7+2UObWvaIQ+vfNOJ5dsyEzAdqLGiTQoQ1t4zjqG/6ulb3edxfaT9lS
 TkzA==
X-Gm-Message-State: AOAM530+AkFpy1RljBB7SwPexWRTm4ZOQxfC6yRAurcpDGPZQzuuPA3U
 Y5lN7Kr7UIKeznM4BpXeEg==
X-Google-Smtp-Source: ABdhPJy1v1gp365lFTBHUVGJNK4dZ9aUhoTBhe/Jx60UxTgiblBfbdL8fUjqlBldQdF55LQH3hKPUw==
X-Received: by 2002:a92:4a07:: with SMTP id m7mr20291705ilf.51.1615234305373; 
 Mon, 08 Mar 2021 12:11:45 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id g3sm6429469ile.10.2021.03.08.12.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 12:11:44 -0800 (PST)
Received: (nullmailer pid 2883952 invoked by uid 1000);
 Mon, 08 Mar 2021 20:11:42 -0000
Date: Mon, 8 Mar 2021 13:11:42 -0700
From: Rob Herring <robh@kernel.org>
To: Atish Patra <atish.patra@wdc.com>
Cc: Ivan.Griffin@microchip.com, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, linux-riscv@lists.infradead.org,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 devicetree@vger.kernel.org,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Conor.Dooley@microchip.com,
 linux-kernel@vger.kernel.org, Lewis.Hanly@microchip.com,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 2/5] dt-bindings: riscv: microchip: Add YAML
 documentation for the PolarFire SoC
Message-ID: <20210308201142.GA2883896@robh.at.kernel.org>
References: <20210303200253.1827553-1-atish.patra@wdc.com>
 <20210303200253.1827553-3-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210303200253.1827553-3-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_201151_314296_C8BA1F01 
X-CRM114-Status: GOOD (  10.45  )
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

On Wed, 03 Mar 2021 12:02:50 -0800, Atish Patra wrote:
> Add YAML DT binding documentation for the Microchip PolarFire SoC.
> It is documented at:
> 
> https://www.microsemi.com/products/fpga-soc/polarfire-soc-icicle-quick-start-guide
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  .../devicetree/bindings/riscv/microchip.yaml  | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/microchip.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
