Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B84BE732E1
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 14:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XDus/VmDTZJRfMll/nhOxq84SPoiLSKyNOqUCG0G5UE=; b=BhZgV0o/4wY/BR
	M2PeXnZBrcGnH6RFzTMzHjqXPyXSiZtMEAXOhGL4aCvO4HrATw4IaGqT6SihbBuZmX01ddXP296zS
	Yu8Ry0s4prfh30+lr74iCcDyOWWr50DK+Jqw0u/3MgSfCeZsUr90rc7xRqvQ2PIY9APgniLVgHDcx
	qjFTscS6HgsnCHiZfAIntKqa6giAVAVFpSOmaLA7ganiWXcfgorwLA9XUgnBDZ3DrUx6sKuPWFmMw
	ucAMMqRa6RyY/thfSAx37RwPuomuaIcyMMOSh5KeB3P42KEDcLIAIZM0bwP5mw0G1gNTsJz+hQdDW
	JCu3gSlH/o/hTU7DsfUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsIR-0052OM-1P;
	Thu, 28 Sep 2023 14:47:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsIM-0052JD-17
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 14:47:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 70723612FC;
	Thu, 28 Sep 2023 14:47:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E3CC433C8;
	Thu, 28 Sep 2023 14:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695912433;
	bh=DAhYMVG3nEzAFn/EI+pyjEUCUyXo8CLi3ZCOtHs/arQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mCgSUN8BLRBjiIjTvtgM4sByKgXNxwGgVACsctHPBYgPR+J2tr64sI/av6TRNwRID
	 Sxpn8EtCKqLGWGkJfqA9lzSasMm32pAlX3fk96W+pNc/Z8t7zWt4lC1lJGyhvJjTk3
	 KbQbRykpAUQgmcMwdYlm7LxXjVrzITokeNS1iiL9FEjABOlk+ay3qcO+KyIsM/M1si
	 YzWniGsMD8aMrpaqQuqzdGXL4I9jgcUjssGoiN1moF8vjmRqZ1qZxM/8jMQt85LeEx
	 Qo/pzFld00MzXxlDSJchdTVb+rUd2j2Dz05u6es26vKor49zKn5/xfCyisM7GjHH4+
	 sqAdTLKWtX6pg==
Received: (nullmailer pid 408729 invoked by uid 1000);
	Thu, 28 Sep 2023 14:47:11 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20230927164222.3505-2-jszhang@kernel.org>
References: <20230927164222.3505-1-jszhang@kernel.org>
 <20230927164222.3505-2-jszhang@kernel.org>
Message-Id: <169591240666.408168.6432337250715117687.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: usb: Add T-HEAD TH1520 USB controller
Date: Thu, 28 Sep 2023 09:47:11 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_074714_455156_49DDE92F 
X-CRM114-Status: GOOD (  10.97  )
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


On Thu, 28 Sep 2023 00:42:21 +0800, Jisheng Zhang wrote:
> T-HEAD TH1520 platform's USB has a wrapper module around
> the DesignWare USB3 DRD controller. Add binding information doc for
> it.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../bindings/usb/thead,th1520-usb.yaml        | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/usb/thead,th1520-usb.example.dts:25.13-43.11: Warning (unit_address_vs_reg): /example-0/usb: node has a reg or ranges property, but no unit name

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230927164222.3505-2-jszhang@kernel.org

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
