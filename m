Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D482E6F09A
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Nov 2024 01:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KTBnHe2dx/665n3dbSBjPUvmBl2PO1mEL/bkwzke4EQ=; b=dllcWOniUtSu9iN+JvGuzi4Dqo
	dGyp6QDrQmogPOqmqdiTocIoqzYHIp+ZNQ2aT+WtJUCltU1lyQByKkF5OBH3LvSUPRjeKMMx01kEB
	cXXcPosFzbJpl1ZniaW07G0AaVSp1X9cgFudtlNNraJaw8pL55TW3GfrJqJBD3QEpJxO6t7yfKTPw
	5KjwMkXcy9nLhGMP5Q++zOUxS6EBvy2eQdcicak6sA67sdFJsV7U5OcUk1Qbw5V4wHY980VfyStYa
	cjGyLGw7xNeYlL+YyTCrID6Kpvb6fGlMQiDsY1Ou1Q1QnBMQf2DAQAnRk1Pqy5Ti79LuGEZ48p6D7
	MlFCaqGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t72zH-00000008oJd-46uw;
	Sat, 02 Nov 2024 01:31:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t72zE-00000008oIf-21Jc
	for linux-riscv@lists.infradead.org;
	Sat, 02 Nov 2024 01:31:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ABBB9A44EE6;
	Sat,  2 Nov 2024 01:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A39FEC4CECD;
	Sat,  2 Nov 2024 01:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730511090;
	bh=bZaX/EKorv9Z86U2/e2k8gpDQqOWK/Dh9xHiMTqLh74=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=pyFAeDOiUgAVKpl62xURWlUGzVcEvk3W/Zj1JjUj7TH672oZj/EYrbjj1bkZVTaWZ
	 NS0rPlJx+apy0pv6LRheVEqRK7BtOiBBPACx9IdhGXHFgR81eyokoEqJbkg9pbot2Z
	 28ueuMRQU2NZSnaTA0+gw0Qbt1Bp8Isfg6Hwj1FE/XsdguLgLKwQiSddlgtCh+5Tuu
	 rZ5pznQ/v+S8c7zDxosbXnUhBnynN/gBNihdMYQAIWiV1voxlrOHA0OzFrQPXmuj8Z
	 gxVXRXT40wa2kHaWKCaKbnqNJOHYo6cvh2+1m7aYQ5SNxgtAuosGGLlwBh1nMv6uhZ
	 Miid/CtPr05Qw==
Date: Fri, 01 Nov 2024 20:31:28 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
In-Reply-To: <20241102000843.1301099-2-samuel.holland@sifive.com>
References: <20241102000843.1301099-1-samuel.holland@sifive.com>
 <20241102000843.1301099-2-samuel.holland@sifive.com>
Message-Id: <173051108892.583398.1565228083513288043.robh@kernel.org>
Subject: Re: [PATCH 01/11] dt-bindings: riscv: Describe physical memory
 regions
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_183132_674324_83F97D91 
X-CRM114-Status: GOOD (  14.16  )
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


On Fri, 01 Nov 2024 17:07:55 -0700, Samuel Holland wrote:
> Information about physical memory regions is needed by both the kernel
> and M-mode firmware. For example, the kernel needs to know about
> noncacheable aliases of cacheable memory in order to allocate coherent
> memory pages for DMA. M-mode firmware needs to know about aliases so it
> can protect itself from lower-privileged software. Firmware also needs
> to know the platform's Physical Address Width in order to efficiently
> implement Smmpt.
> 
> The RISC-V Privileged Architecture delegates the description of Physical
> Memory Attributes to the platform. On DT-based platforms, it makes sense
> to put this information in the devicetree.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
>  .../bindings/riscv/physical-memory.yaml       | 101 ++++++++++++++++++
>  include/dt-bindings/riscv/physical-memory.h   |  44 ++++++++
>  2 files changed, 145 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/physical-memory.yaml
>  create mode 100644 include/dt-bindings/riscv/physical-memory.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/physical-memory.example.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
	['starfive,jh7100'] is too short
	'starfive,jh7100' is not one of ['beagle,beaglev-starlight-jh7100-r0', 'starfive,visionfive-v1']
	'starfive,jh7100' is not one of ['milkv,mars', 'pine64,star64', 'starfive,visionfive-2-v1.2a', 'starfive,visionfive-2-v1.3b']
	from schema $id: http://devicetree.org/schemas/riscv/starfive.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/physical-memory.example.dtb: /: 'model' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241102000843.1301099-2-samuel.holland@sifive.com

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
