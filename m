Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F663F013CA
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 08:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Y9Of4MflkegUdYeT3P/73qOAu0DSXIQCrlRxEh1oEwE=; b=KheBOBxVJIGj4g9jQQIOA9rRRf
	PTxCsOHQSoG17gYlKybQSj00ivhLAaqvTftc4Qt8D9OOjlQuOKRq6uyVAQSONJU1uppO6QxeLuVH0
	46jGXGxLHvapQlhbz8P0clj9dMehRDfuNXhKdv2TkjopGdpv6H4Tu2a6UkoRGrY7QLXrGJGQ8tPYQ
	NGs+pWv6EsWOaxlyPcbuPW/Q8X+uJnNXwawEXGJPeSDSZm+OTUS1AA2zzP2NNB37ZY28pH+65miMl
	k+I1P5NLu+e0puxMQkFE2qiq/mIG2aTqJq6mNger0lYlWNmVZQXyZtZzeOGslcKefi7QJMCH+rCHq
	seIg5+iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23Co-00000003Y11-1AUy;
	Mon, 16 Mar 2026 08:21:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23Cm-00000003Y0l-3Cpb
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 08:21:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 36E28600AC;
	Mon, 16 Mar 2026 08:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA45EC19421;
	Mon, 16 Mar 2026 08:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773649299;
	bh=QymIldvWQHOa9u4HoUVVSN6ly5TVfP3/q37SKFHTL08=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=R+jCuf6UOPK0pb7EmxDzAN14G7fn+TYuilrdXvi9oRBAveNGvpG6spOjb7YF5w8Cx
	 7jJIzk6ukkCEL0WcItEyAlf585FczhEfwe2MhWGOQ9rc8SBE8OVhYbDZV1Qibn7EFv
	 zobC5n+8vQexckr8oU4Abp8llabvgrXBJRGGRajgJnC43wJH3g1PgUzk1RpJ1pt3qR
	 /2PjxUjggaADdhjtO8RwFETJ5USIqQZPvgHuz8Tom+OOrLBv0CEZO3NSMMggdT025U
	 O+ahkhLXe7wksOR14CICAggbX3Cr6k/66xNd3p7qRvMEBmmsRDacAshanu5pRoP0m6
	 3WVnLCLebrutA==
Date: Mon, 16 Mar 2026 03:21:39 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Jingoo Han <jingoohan1@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, 
 Xincheng Zhang <zhangxincheng@ultrarisc.com>, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>
To: Jia Wang <wangjia@ultrarisc.com>
In-Reply-To: <20260316-ultrarisc-pcie-v1-3-ef2946ede698@ultrarisc.com>
References: <20260316-ultrarisc-pcie-v1-0-ef2946ede698@ultrarisc.com>
 <20260316-ultrarisc-pcie-v1-3-ef2946ede698@ultrarisc.com>
Message-Id: <177364929764.1046214.13699651740074271027.robh@kernel.org>
Subject: Re: [PATCH 3/4] dt-bindings: PCI: Add UltraRISC DP1000 PCIe
 controller
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


On Mon, 16 Mar 2026 15:06:59 +0800, Jia Wang wrote:
> Add UltraRISC DP1000 SoC PCIe controller devicetree bindings.
> 
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
>  .../bindings/pci/ultrarisc,dp1000-pcie.yaml        | 108 +++++++++++++++++++++
>  1 file changed, 108 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.yaml:26:7: [warning] wrong indentation: expected 4 but found 6 (indentation)
./Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.yaml:38:19: [error] syntax error: mapping values are not allowed here (syntax)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.yaml: ignoring, error parsing file
make[2]: *** Deleting file 'Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.example.dts'
Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.yaml:38:19: mapping values are not allowed here
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.yaml:38:19: mapping values are not allowed here
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1606: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260316-ultrarisc-pcie-v1-3-ef2946ede698@ultrarisc.com

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
