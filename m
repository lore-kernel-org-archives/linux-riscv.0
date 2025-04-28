Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73017C369D5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 15:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6r7lMxnLUH1uvWFNhULq0439ri6t2cHt+BKGeOzl4M0=; b=NJZI73t9+7a3lYXulvGOo5yE5a
	KnyZqJ/hOYt8PG2h0NMR6S8OmtFBlsnNlzeJYjvXZy+Hik8Gx+t9jotOnE/KlOnlQiiS6w+b/QqsW
	XskAiq6qqnU/v50PNaaR0b7sOkogIK7XgBt081wYa+xUs89DUBRyMg3ZXhPXT9m+6OPNu3neQCKY7
	w/3Eu81Ahu1tAtygvVoBhb4CizsxUkPYi+h1bwdqWULmedbMLdnX0y2rCbekbo8yWS+JT+4n6Lfeb
	/nzrgG8NWUC/qB5wLi4pkasil/4OnFzMpUfRb6qJlCL+BAP2IWjRpRBvqrdd0gQhXr8NtPeUNB2j6
	IctprCrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9QOt-00000006lfC-2KeX;
	Mon, 28 Apr 2025 15:28:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9QO8-00000006lX6-0eHd
	for linux-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 15:27:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B6C45C3A77;
	Mon, 28 Apr 2025 15:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6917C4CEEE;
	Mon, 28 Apr 2025 15:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745854039;
	bh=xe+PC4Ilgkqhp0Kq/uE50DZsnYhsTMuf5xemFibbnIs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ODFSBNglrrH69kLsEZ4zqQ6PmWjGUrG2PziyFNd4uoF9tOTKcZStJ+KI7qdh2tGye
	 h4i8rcd77w1BBkGNH7cAmosi/GWDb+BCn+nV2hFj5BzmIOg/JvTuSG4EtXCnQpVQAs
	 ib7xKLiWucIsM190d7dmJYcVfV05UiXz6v0dfsGl/Wo+bl38y5brvby+VnVzIoH1nW
	 pUmWOKDGA9xu1fx/hlhON/8UKowByzAZ5rsdT/Gb0mW0JVCitrt/7da4Rr/zlWovQb
	 w76u9kzpa4u8PB1d32X8L297AXQqSs7C/a7gIF74SY7o5VZmoWMROXZ+5xrYskq53K
	 CLCTrwFzu2Rfw==
Date: Mon, 28 Apr 2025 10:27:17 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 spacemit@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
 Conor Dooley <conor+dt@kernel.org>
To: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <20250428-b4-k1-dwc3-v2-v1-1-7cb061abd619@whut.edu.cn>
References: <20250428-b4-k1-dwc3-v2-v1-0-7cb061abd619@whut.edu.cn>
 <20250428-b4-k1-dwc3-v2-v1-1-7cb061abd619@whut.edu.cn>
Message-Id: <174585403717.1072738.12141605070029196613.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: usb: dwc3: add support for SpacemiT
 K1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_082720_235676_DAB30924 
X-CRM114-Status: GOOD (  11.33  )
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


On Mon, 28 Apr 2025 15:38:11 +0800, Ze Huang wrote:
> Add support for the USB 3.0 Dual-Role Device (DRD) controller embedded
> in
> the SpacemiT K1 SoC. The controller is based on the Synopsys DesignWare
> Core USB 3 (DWC3) IP, supporting both Host and Device modes for USB 3.0
> and USB 2.0 standards.
> 
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> ---
>  .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  | 95 ++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.example.dtb: usb@c0a00000 (spacemit,k1-dwc3): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250428-b4-k1-dwc3-v2-v1-1-7cb061abd619@whut.edu.cn

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
