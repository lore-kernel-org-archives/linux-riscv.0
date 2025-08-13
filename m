Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B036CA0EE0
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 20:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=giK/kX57u0779v7BgmnNY23/pgCSCTRKioa1Fqq4U3o=; b=B5i7LJdwmyGUywprpTrLD4kygB
	YbOBhBKyhBkMoZohT8LQCbJuHxMd6IG/AfJ3ZHBdGKgh5BKLl5UDpqjWXfCKu2q+1As+JsOOgQ+75
	ohxoGGshcijvBsIB3/X2IjQv5AnsVXOOSHYsi6AbavLDkuFZnMk/aOlNTQwxDNEHN4zgyDIWJqb26
	s5G9oPTJ3F22CvrbOoEYXWd5HLuC1MB87O1AaLVaOSA+Ra7Pf+cw2P5jSS3JtXi7FkL9FzMMySPWJ
	J71cegZYqV0Hy0diaVFHf4MaIbUndVUb2gZnwJiZ25iCq1dY6hfH0G27tIeReJ1jXlb2YCuhSG9nj
	aqadZ2UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umIPN-0000000ExQo-1mEQ;
	Wed, 13 Aug 2025 20:49:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umIPK-0000000ExPz-0jWV;
	Wed, 13 Aug 2025 20:49:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 501715C5C9B;
	Wed, 13 Aug 2025 20:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D397BC4CEEB;
	Wed, 13 Aug 2025 20:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755118153;
	bh=En5jD+6SzXG0w35/yCAtjMw836BoYpU5e7zAqhvqenU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=m0UfULAvPzW1UV4NWJR/KO1nIqBQWt7OIUJMvJE1kV6QoeVFj1y3pxcjcUPIb0WY7
	 FG7tzUsaBZJgrKWgndTzPRH4rSzCE4xnLP/3CgT3wVeJ5myhxowveApOV7tHNv3333
	 CtL3s0SV6W//e4Xlj69D6Kvc90C+Kdupips9YUBivVrZ3XuIyi5XUECn+XUv3aUO2G
	 XLZdZw2G0ummYwBP7Mbil+ciVKEW0aMTuens6nJJe6Jw3sjtVAECFhTjctqX4ir6qv
	 fL6YcVgoCLaClKSa5knVy4NEPetrOAIwyQXBPCJvOUq/Juyg2rebIEWBFUD/OTpJjc
	 YSndnlgEcm7hA==
Date: Wed, 13 Aug 2025 15:49:12 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: lpieralisi@kernel.org, quic_schintav@quicinc.com, 
 devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, 
 p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, inochiama@gmail.com, 
 fan.ni@samsung.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
 palmer@dabbelt.com, paul.walmsley@sifive.com, spacemit@lists.linux.dev, 
 thippeswamy.havalige@amd.com, namcao@linutronix.de, 
 linux-pci@vger.kernel.org, shradha.t@samsung.com, vkoul@kernel.org, 
 dlan@gentoo.org, johan+linaro@kernel.org, kishon@kernel.org, 
 mani@kernel.org, mayank.rana@oss.qualcomm.com, tglx@linutronix.de, 
 bhelgaas@google.com, linux-phy@lists.infradead.org, kwilczynski@kernel.org, 
 linux-riscv@lists.infradead.org
To: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250813184701.2444372-4-elder@riscstar.com>
References: <20250813184701.2444372-1-elder@riscstar.com>
 <20250813184701.2444372-4-elder@riscstar.com>
Message-Id: <175511815210.798605.10564052572461813362.robh@kernel.org>
Subject: Re: [PATCH 3/6] dt-bindings: phy: spacemit: introduce PCIe root
 complex
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_134914_252056_2907D880 
X-CRM114-Status: GOOD (  11.47  )
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


On Wed, 13 Aug 2025 13:46:57 -0500, Alex Elder wrote:
> Add the Device Tree binding for the PCIe root complex found on the
> SpacemiT K1 SoC.  This device is derived from the Synopsys Designware
> PCIe IP.  It supports up to three PCIe ports operating at PCIe gen 2
> link speeds (5 GT/sec).  One of the ports uses a combo PHY, which is
> typically used to support a USB 3 port.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  .../bindings/pci/spacemit,k1-pcie-rc.yaml     | 141 ++++++++++++++++++
>  1 file changed, 141 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-rc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pci/spacemit,k1-pcie-rc.example.dtb: /example-0/pcie@ca000000: failed to match any schema with compatible: ['spacemit,k1-pcie-rc']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250813184701.2444372-4-elder@riscstar.com

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
