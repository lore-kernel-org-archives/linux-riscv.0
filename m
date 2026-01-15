Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E18D33A09
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 08:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kye6GmElaO/lqJKui8Vgd+dcIZnKTMnbfx0C5jpufa0=; b=zCNWRNy10eIYpIbNrTYFDgoGB2
	SKPeXta/b6EcjvtnX118XGYY97rK59KDDUk8da04sxMsTdhNYo4B1E+8jgTMyUScJ2d7n1cqcnsIX
	30fI0Te2K30j1AArjhB25HMdjnbCnYppDsX+rgTqkyACoppILFMgDMVgOjgF22m7yFm77EdWuRC5o
	Lvuona5dKovGbKyvmogw2CnBpTRmWLpfCKfZPlaIzj2kIF6H1x5Mw68ZWwhLnVgcN1BjSzZNfLE1U
	iJPCFvN3OcWA8YbJRGdezipArXSYzN11QfiLeOtmZ42x+7spg+Bk2z/XIw9Njnyyzp7J5mJIozDve
	KXNMjUtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIk3-0000000Bzt8-3Y0e;
	Thu, 15 Jan 2026 08:30:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIk2-0000000Bzsg-0cYe;
	Thu, 15 Jan 2026 08:30:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB172601B9;
	Thu, 15 Jan 2026 08:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DAE1C116D0;
	Thu, 15 Jan 2026 08:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768465804;
	bh=PlgI399ItX0zMEfC+5UwO2zrl+leB7wgtmhP+blcFv0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=RnQ994vFURPycFo5eH7iciU0c8aDtEfA3XTf2fteC4M2RdxCH/Wy0LV4MeMX2lezD
	 eBJtkvpMvKEM4imHd7vHiXCOrCc9xlJUEnuhMY+QtK8zf4D7ATwR/CkfYOPSsFe4L/
	 2VBF3B8PlgJHPz59osAebBvMSRtw0R1MKOLFMrjpPBg+qWgb5ykCifOi7+2zsFjPlY
	 EJixz4uiv1s97M8mQx0GOO8HIwC90bb6GFPIpPiZckZnnSESokCqDePwMs5DGmR33I
	 WHrehNQZq8yYtiK/Kza9X/Yfct7nxHeETZjlzyEj9dnEwy4aCdiydioD9weYjGIpSp
	 1KwXL8JxrkkoQ==
Date: Thu, 15 Jan 2026 02:30:03 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: vkoul@kernel.org, linux-usb@vger.kernel.org, conor+dt@kernel.org, 
 krzk+dt@kernel.org, linux-kernel@vger.kernel.org, cyy@cyyself.name, 
 alex@ghiti.fr, pjw@kernel.org, kingxukai@zohomail.com, conor@kernel.org, 
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
 neil.armstrong@linaro.org, gaohan@iscas.ac.cn, 
 linux-phy@lists.infradead.org, gregkh@linuxfoundation.org, 
 18771902331@163.com, devicetree@vger.kernel.org, TroyMitchell988@gmail.com
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
In-Reply-To: <20260115064223.21926-3-jiayu.riscv@isrc.iscas.ac.cn>
References: <20260115064223.21926-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260115064223.21926-3-jiayu.riscv@isrc.iscas.ac.cn>
Message-Id: <176846580373.38125.3306033410225962520.robh@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: usb: dwc2: Add support for Canaan
 K230 SoC
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


On Thu, 15 Jan 2026 14:42:20 +0800, Jiayu Du wrote:
> Add 'canaan,k230-usb' compatible string with 'snps,dwc2' as fallback
> for the DWC2 IP which is used by Canaan K230.
> 
> Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.example.dtb: usb-phy@91585000 (canaan,k230-usb-phy): reg: [[0, 2438483968], [0, 1024]] is too long
	from schema $id: http://devicetree.org/schemas/phy/canaan,k230-usb-phy.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260115064223.21926-3-jiayu.riscv@isrc.iscas.ac.cn

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
