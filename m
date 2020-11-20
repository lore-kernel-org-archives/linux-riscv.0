Return-Path: <SRS0=Au/l=E2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E68BC2D0E4
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2020 20:53:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7542C22227
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2020 20:53:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PaRIY+e8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7542C22227
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JfcJ7wr8ArWAXD9h6xkdG0avQAhm7HFL36T6JvH7NKA=; b=PaRIY+e8bo22zvPHu6PUCmWc0
	VRFTDPTqUL5Vm8ah8RzLk7CLBqHh6EH92FAfQUsrb72+YlMnRaCo7iksRACoqnJ1EolbN5t/TvL8s
	V6/BaUYEzgQDPfxrdUBEsk/uc57ntCAoqdffu/3PBgQGHLh9Y6SAJ5B1jv7mY91hoKzVRh3L3Y1TK
	Z30y6ib1d8M9g1P0Xoh5LxKulk8lD7XrAW5zPRkrZ+jffHX5FbsgDh8wllDd7l6Dhdo13iufd0iOU
	u73HJjBiut2cbZ3EDLsbiJ0qNHvvbGiI6ax9BZzpe8xd7PpIKJ7f455CVw+G+O3+64MjY7nzNBjP7
	ckwY+U+ng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgDPZ-00060n-H7; Fri, 20 Nov 2020 20:53:41 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgDPX-00060M-JJ
 for linux-riscv@lists.infradead.org; Fri, 20 Nov 2020 20:53:40 +0000
Received: by mail-ot1-f65.google.com with SMTP id j14so10033222ots.1
 for <linux-riscv@lists.infradead.org>; Fri, 20 Nov 2020 12:53:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HlhwNYubJtHrxWT2ZNAhkWxJDu+Su29i2kEspUacPRA=;
 b=OuTmyS8T+1fC90adtXRJm8ilVC//ykVfJtmze904ASubHG4q0xFUemKQrdnFiHizPS
 TbZTBN0IWg7jJ20tdyFwzT35BRuInXxxmSKeu7OI5gj3WhnxW/LPTLpBtIxSIdCbJ1sJ
 ocziEKcBl3KHPEN622xE744RdyiwL74/9mUkstsJdXWxzHeHxU+m1fZ/lBHyt2YBxDut
 PpUHHiGu1duupBAGaGpOvGLSAqEH2tUJiyIuxdVVKhmcjw4JySURCKRYJsaLzObNrB/U
 QjSYTWazkOxhk9AwOcUrOqmNHDPyS2YRa/D27szJJsHt9zSSpGpokHEIv76Xu3IlAuqU
 /NQg==
X-Gm-Message-State: AOAM530KTdX06hqmZ18KZ7BmR3bhwWfCl87KhJ8sQIKDMH/uGvxd12AR
 m5Ps3iat4gLAlWqzWcTMTQ==
X-Google-Smtp-Source: ABdhPJxUvqZlYEJM1cGthssq19Hy0wEqx5MMN8pabLRGvPs77JW4uNMJO6kUKBoplRLawY5EEP9CkQ==
X-Received: by 2002:a05:6830:158e:: with SMTP id
 i14mr15191550otr.123.1605905618986; 
 Fri, 20 Nov 2020 12:53:38 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a5sm1791959oto.1.2020.11.20.12.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 12:53:38 -0800 (PST)
Received: (nullmailer pid 1722118 invoked by uid 1000);
 Fri, 20 Nov 2020 20:53:37 -0000
Date: Fri, 20 Nov 2020 14:53:37 -0600
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Subject: Re: [PATCH 5/6] dt-bindings: add bindings for polarfire soc system
 controller
Message-ID: <20201120205337.GA1721508@robh.at.kernel.org>
References: <20201119170958.20984-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119170958.20984-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_155339_647845_5B09A8F5 
X-CRM114-Status: GOOD (  12.45  )
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 lewis.hanly@microchip.com, david.abdurachmanov@gmail.com,
 daire.mcnamara@microchip.com, anup.patel@wdc.com, jassisinghbrar@gmail.com,
 atish.patra@wdc.com, robh+dt@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, cyril.jean@microchip.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 19 Nov 2020 17:09:58 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the MSS system controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../microchip,mpfs_sys_controller.yaml        | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.yaml:23:111: [warning] line too long (113 > 110 characters) (line-length)

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.example.dts:19.32-25.11: Warning (unit_address_vs_reg): /example-0/syscontroller@37020000: node has a unit name, but no reg or ranges property


See https://patchwork.ozlabs.org/patch/1403156

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
