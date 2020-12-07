Return-Path: <SRS0=7obj=FL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29ADCC433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 15:53:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B17F623358
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 15:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B17F623358
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rcI1qBqWQjUB29kwbEoWM7cAMO8ZyuMr7aFkaty6Wx8=; b=kWloKOLgmdOeLDrIgfKK0yLHW
	hIemMln+gBChjg6KjT6s2jJv6eCgwwmDM9b1vOCqWK6vbe86HV6DFlENRsxlZU9JVt9OOGwPFjXh6
	4EmK6wFaSbelsZn/EMX/VU/fXSWhy29+7yMQYtVPZOFqEbQuGmf57CTMbcyQKH+XPv3uNrpMEHe74
	2xR27Z+O2xxHAOWYF0Ez8h8ZH+CjGRcbc/HyN+4ubWTOM2O1pgiHErW6JWdNMdex2bPUJJcsUDk5U
	l9VGOKl/Uv7j35KAWBZdN+mXNVOdDE4kaF53cT9ZQDuMRleEYHza2lrs9Rr0z1StL0m5Btml2CfHg
	lbXxjKJbQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmIpg-0003yN-2j; Mon, 07 Dec 2020 15:53:48 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmIpd-0003wK-5H
 for linux-riscv@lists.infradead.org; Mon, 07 Dec 2020 15:53:47 +0000
Received: by mail-oi1-f193.google.com with SMTP id s2so6387854oij.2
 for <linux-riscv@lists.infradead.org>; Mon, 07 Dec 2020 07:53:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Hypmg4LpjXSy0GzxNxBUf1ww7vOYIv2Xlk3pfbDp9J0=;
 b=e3t20NejxAqyiYb5LWwEZGOVUTo+VWbWD+lVuyoCZLbdGJRIPiordYbUPXUmuT4P5P
 8G9bW6+S6a+UHKWE8kVYI9gHi2XfZ0n/7pE+nDTqelZJqUUaF8PQ5WwwV6d8gyIwKry2
 CDyHqtBc2BzqiWDCvAe4ngVH1Ylmq9YE762EoPB0BTiiwYUWu5MLxXr3IlDThdz7yiHd
 vcBubhYdJWdQAbcyaOndyNe5LsnmHLmEjBzmiA/o3VQKd3W6z+rABdJ7/pUaiBQv3rdq
 FZY75nznohu0wjkGPSSaddzkXjQb9+whhSfi1Qu1vw+fSh7EuTbPJvu1lwPglPWJUvOi
 3wBA==
X-Gm-Message-State: AOAM533uaStvdAL0gXiMOgbVk6vmKoftyOq40+6r6Cp7QdDZrQ0zLeDc
 oOwd3QlmiVLKoIU3oPddkw==
X-Google-Smtp-Source: ABdhPJyGjeSH/GRe0J8BAg2uOUh/diV9qfejX27wBKuR4x7Sq1coEii1ZQtzYAuPbWmRRy3UhNAnmg==
X-Received: by 2002:aca:c3c3:: with SMTP id t186mr12960411oif.53.1607356416130; 
 Mon, 07 Dec 2020 07:53:36 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k3sm1422103oor.19.2020.12.07.07.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 07:53:34 -0800 (PST)
Received: (nullmailer pid 345583 invoked by uid 1000);
 Mon, 07 Dec 2020 15:53:33 -0000
Date: Mon, 7 Dec 2020 09:53:33 -0600
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Subject: Re: [PATCH v2 4/5] dt-bindings: add bindings for polarfire soc
 system controller
Message-ID: <20201207155333.GA345332@robh.at.kernel.org>
References: <20201201110311.28593-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201201110311.28593-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_105345_226624_3381B44E 
X-CRM114-Status: GOOD (  11.29  )
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
 cyril.jean@microchip.com, david.abdurachmanov@gmail.com,
 daire.mcnamara@microchip.com, jassisinghbrar@gmail.com, atish.patra@wdc.com,
 anup.patel@wdc.com, robh+dt@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, lewis.hanly@microchip.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 01 Dec 2020 11:03:11 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the MSS system controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../microchip,mpfs_sys_controller.yaml        | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.yaml:23:111: [warning] line too long (113 > 110 characters) (line-length)

dtschema/dtc warnings/errors:


See https://patchwork.ozlabs.org/patch/1408782

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
