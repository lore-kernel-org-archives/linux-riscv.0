Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96567E77188
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Dec 2024 11:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QW+olpK3ktUg1+H5fBvjfpnmKXooYBBN92XlH5gmnS8=; b=EO6evNistvzBpH1jivKrvq6X3O
	SSXKIgIadbzHPsHennIbkAr2x+yYWSsS3xuqf5cYAxPRIZrWVgtBeuc6V6qHkl3pHq+/l/0ZnsuPH
	9WfMzmZA5hOHTp0nwBDN2LzxvIDdH3/lXZdxXaD/Drvf7f2rczAGMxORlyjQKNVlogZC/1XoglmbJ
	8tLBbx2xkg/7UW7K9EA103cX3GzxkBfEBUX/IXmRD7vpn9S7Uc0Ix1jziasZKIvZOVEuDr++yNghX
	hhBQ28igf841t9NQBAfbj2Ue08GhYypZVNT0EOpjadHc2U0S6+xN0Q/wazJhefTpnbW0pdgOOVDfa
	r2Yu0FxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSDrJ-000000056aL-2Z0y;
	Mon, 30 Dec 2024 11:22:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSDrG-000000056Zs-2zLP
	for linux-riscv@lists.infradead.org;
	Mon, 30 Dec 2024 11:22:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 794225C25CC;
	Mon, 30 Dec 2024 11:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 633F2C4CED0;
	Mon, 30 Dec 2024 11:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735557769;
	bh=Nju+bFzbPMzGhnsNbSRelgZNr5kB+pNCjav9H3akEQ8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=WnDHvsEcgIkx/Tto+yvwabNa0n5ltRAc1v3SreOIEj4+a20GwcwQvBx1pXYKX2FZz
	 5DtaAtLGAXrhXtdlZT1zgb1OTk35Ttf7pK9avLvzB0qgoKqXPb/htJOkXDpe4vSBPt
	 chkvfBkzUZNj7TCrx9rcEZAVBfWgCC3SBuiGoLIRKO3KBqbF5WWu8WTuGn362VFieB
	 0njA34XMf+J6ow7PC749l4olrgEHZX2vOLr90U04syoIeDBiyXvMWdvkLgCAO8rQGb
	 RCShwkwqzfitpw8sgVMFO3LLO3l/jepMETD6yQRcxK29VPs6pdyaiQgNG1IJl67SFD
	 9Sa3c3yOtNR3g==
Date: Mon, 30 Dec 2024 05:22:47 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Troy Mitchell <TroyMitchell988@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>
To: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <20241230-k1-p1-v1-1-aa4e02b9f993@gmail.com>
References: <20241230-k1-p1-v1-0-aa4e02b9f993@gmail.com>
 <20241230-k1-p1-v1-1-aa4e02b9f993@gmail.com>
Message-Id: <173555776786.1678743.4819553384691470955.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: add support for P1 from SpacemiT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_032250_792865_9F95A3D9 
X-CRM114-Status: GOOD (  11.28  )
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


On Mon, 30 Dec 2024 18:02:05 +0800, Troy Mitchell wrote:
> P1 PMIC contains of regulator, pinctrl, pwrkey and rtc.
> 
> P1 contains a load switch, which allows you to control
> whether a device is powered on (such as a MIPI screen)
> 
> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> ---
>  .../devicetree/bindings/mfd/spacemit,p1.yaml       | 153 +++++++++++++++++++++
>  1 file changed, 153 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mfd/spacemit,p1.example.dtb: /example-0/i2c/pmic@41: failed to match any schema with compatible: ['spacemit,p1']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241230-k1-p1-v1-1-aa4e02b9f993@gmail.com

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
