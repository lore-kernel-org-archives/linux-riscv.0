Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3D0C27C53
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jun 2024 18:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=EYJ0SjjzSn5CsAVG1qZs7Y2CU4sMcjdW3we39ukIU38=; b=Ke2cEdX2TGrvolopHoB7DeHky3
	EJw13xl2QW+IPpQJg93Jnd30qbPqa/QZUIusShXkKpL/N4ZXijmEMAlvC1pXVtHZ3nMZtD0690Ce6
	GBum4oQhlRU/otVGroDA7R262zrcVw7HbOxDNBfI/U5catjdSN4VaaPHL6MYPidecUvxxm4nC/fK7
	XrnFYhqGNZfeZByscpjLdWg9ZIIuvppexjb4oMjV9QtanvyXDnIBRPsBlzaQYLa6pWJIE0BopXXGR
	bY0LceapLxxE1sp0cuLSvGc8NKUVX9NE9GVqvzzRb0FJNJvR8uDRtUPd6nUI/Gq75VL9wsPbA+JKB
	CAdPrfog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIupL-000000087Iq-0msn;
	Sun, 16 Jun 2024 18:42:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIupH-000000087Hn-46Y8
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jun 2024 18:42:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D47A60F14;
	Sun, 16 Jun 2024 18:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A42C2BBFC;
	Sun, 16 Jun 2024 18:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718563321;
	bh=CsM4DGKZqITnSBvF9KRlVOZ+BrnA9Rcyy2NY/zVK/6g=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=nfVi1Spq3O8TwowZ+vuXDDMSYKmcpzSwehCL6EsX5rme/5Rs0qC/j207G32eUK6+I
	 Q5kPW2vCz4AbBp0dC1RE446//AmvLTnAKiw8UeFWUNR2lu/syMupXPeDQyXHztv9uO
	 lEv7XmArJhFOd9KER6aJ8eVuPJcPKLWE7YPTFTdfro5F+bFwr8dt9GvGyXAc2RLl3H
	 FYsx8nnS0mfExHNBr2V2uxZQ1ll7kwXBKyjfLku//pZXK7bBff7QR9n8G9k+/XGww6
	 guhtUxmsX066+TSLbNhm9UEQ3jP4GZAhQfL73bnKxwF0l/Z3/sVB993oZljwrF1sP0
	 p8EbJM/El1Y2g==
Date: Sun, 16 Jun 2024 12:42:00 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, 
 Anup Patel <anup.patel@wdc.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org
In-Reply-To: <tencent_D3577BC67116D732862BE4A7B187EF4ED005@qq.com>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
 <tencent_D3577BC67116D732862BE4A7B187EF4ED005@qq.com>
Message-Id: <171856332052.2487659.8752285245461346812.robh@kernel.org>
Subject: Re: [PATCH v1 3/9] dt-bindings: riscv: add SpacemiT K1 bindings
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_114204_103443_1CFEF40D 
X-CRM114-Status: UNSURE (   9.44  )
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


On Mon, 17 Jun 2024 01:20:48 +0800, Yangyu Chen wrote:
> Add DT binding documentation for the SpacemiT K1 Soc[1] and the Banana
> Pi BPi-F3 board[2] which used it.
> 
> [1] https://www.spacemit.com/en/spacemit-key-stone-2/
> [2] https://docs.banana-pi.org/en/BPI-F3/BananaPi_BPI-F3
> 
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> ---
>  .../devicetree/bindings/riscv/spacemit.yaml   | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/spacemit.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/spacemit.yaml: 'maintainers' is a required property
	hint: Metaschema for devicetree binding documentation
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/tencent_D3577BC67116D732862BE4A7B187EF4ED005@qq.com

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
