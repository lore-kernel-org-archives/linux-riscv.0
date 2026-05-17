Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41616CD4F21
	for <linux-riscv@archiver.kernel.org>; Sun, 17 May 2026 15:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LrwVbSZEgf+tQdcO6unNvkOl8qDPfyW/8Kyi8GMAgO0=; b=vMXntja+OkkcYlPexQB00PBAMp
	lkJryG5CM35LfQS61SfLgIy4Oo81GpbR+5fdoxnTkpnFGtEGMWUjrAUdSo6ifQU70VOZlRP9MqaGu
	Axu1ac1nkZV47+FN3REMZ5g/++54QC30U8drqN6K7VtJM+QdmP4ODwvD2IcQpLeOF3HK15ptHM1VM
	PZZIAzaq975ImagtSent1wadnbKdeVmIzQZ1weCqo90W1LtuNV+UPxgeraqFmxo3FDt9ko+CXPnSS
	f34zMzWE1z6v4aPRtYXU2tc63gPnDpR+LODzEniPWtrxNOo2x4o7Ee1ICA1mG84zWAaNN1znw/PPz
	NTW+GyVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOdWF-0000000Cw5T-0U0T;
	Sun, 17 May 2026 15:35:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOdWB-0000000Cw4x-32wx
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 15:35:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B2CC42D80;
	Sun, 17 May 2026 15:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B64C2BCB0;
	Sun, 17 May 2026 15:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779032102;
	bh=DyCKE+6QVJML/SRaH5o/1PGkhtGZiUS9tYCZZV8ek6k=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=DdoQ81g0J1xQP3Pxn/9g5eRaK99GfNAY6DkB1XsC1WIiIl77PPic5z1XapCVT3qPa
	 OiZtwiF+YR/zmraIvF+YrYoT+JTOmR2b8AcBN0QMNN6/dZIan9plkI7qK5lW3mpJEh
	 cjT8kh/IrfYkjbEqX78uPyAzFnAcUfa/oM2UbF5CUiAlgxlEkKLGN4sW1cBXEFfoQ2
	 5DaKgFDfp/PuQKdJoM+mKCKZkvAsBWGfSrSFeq+goFmvwG9FkYs20ivNo2xmGm7UHA
	 SxKmiCvv+aPvXq6jQUUjmaniT9vdGlruVhaUkHUDRLODIVzzVhunpfTT4D4EN4nzXv
	 QAylAryJ+CRdQ==
Date: Sun, 17 May 2026 10:35:01 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Paul Walmsley <pjw@kernel.org>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>
To: Chuanhong Guo <gch981213@gmail.com>
In-Reply-To: <20260517-sf21-topcrm-v1-3-438f2e0513ff@gmail.com>
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
 <20260517-sf21-topcrm-v1-3-438f2e0513ff@gmail.com>
Message-Id: <177903210154.62629.12426356915694314234.robh@kernel.org>
Subject: Re: [PATCH 3/4] dt-bindings: clock: add doc for Siflower
 sf21-topcrm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_083503_786639_6BA7AA9C 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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


On Sun, 17 May 2026 22:12:57 +0800, Chuanhong Guo wrote:
> Add a binding doc for the top clock and reset module found on Siflower
> SF21 SoCs. This block provides the main PLLs, high-level clock
> controls, and some reset lines.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
>  .../bindings/clock/siflower,sf21-topcrm.yaml       | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/siflower,sf21-topcrm.example.dtb: /: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/siflower,sf21-topcrm.example.dtb: /: 'model' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260517-sf21-topcrm-v1-3-438f2e0513ff@gmail.com

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
