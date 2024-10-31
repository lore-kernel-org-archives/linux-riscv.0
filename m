Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9D2E6F060
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 14:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JYHbDbGDi2ktB7wfv8dnRzxk6Z/XjCcHAcaUJdHlb2g=; b=OEtrhfMDkJG2GZ
	+MAJahleIndAb/E6eq77OdcGNqefayQpZKASwKxMTt5XCM0idrgmnxQCAGcjGiI0rM6/JprvZWx31
	m1G4x1y+gjEpIC6yhACce2ZlQD7VQkEZ+jJMho/fXdLJc3F4nn3NpN7972uKc+6wFyLYud80pNpE+
	N2lt7zVx5QBjfKC074fSJBqZzvrxkJyaR0bmo14Fla3VJMArwmgZJB1kkMRnm8FnCM2KCi4HuWwJE
	VbZQJMuZSUB0nq4otucys5VrmDgjgykDmxYVDz1sqSQEK9cqt/mUJ2liVCsxoDEQtNFkiQg0rXNhY
	Imi7+iyDW8WD3E/1AEkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6sWY-00000007JDl-3dhw;
	Fri, 01 Nov 2024 14:21:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s8g-00000007Fiw-2CUH
	for linux-riscv@bombadil.infradead.org;
	Fri, 01 Nov 2024 13:56:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ejx4Zhu9k0hCGcq7rrB2l13jAeR2HwTx++yoc/4TFq4=; b=gXKWEUcZbVdkV69uEOt/S6QNAJ
	t1GlnSBPc7lk5ZoGFw2AevtXHfyTS0CRFYIKUm/5+o8+Zew/HcnspFm5C4J8UR8hIiO1P07TBK/p4
	3WDSjQLSAzcmO91ph+ewWrzKFPqQQVNrQuLvwX0HX78tRlc9sOFu2JlJnTd7XccdQ9NfKhV3ejNuA
	+c6/tjHm4GZCb9LVsmrou3TgBNu/ynOcnhf2ova60SMrVHiEtdYOHdZdccZYP6YnZz64/1FHP19hg
	gwcQ+8gctZijShXtTxgjnXFgCX+FUH3Y8fXczBkjVgWGGwph6TODboB/O4X+cOlxpI6vMWF8DF4Ut
	f/5dmeow==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s8c-0000000AiqD-1yO1
	for linux-riscv@lists.infradead.org;
	Fri, 01 Nov 2024 13:56:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 32BEE5C8A2E;
	Thu, 31 Oct 2024 08:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD105C4CEC3;
	Thu, 31 Oct 2024 08:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730361694;
	bh=ZPSuHtXiv9KKbKncCUTkQbLPvPAYcIqiVV2yOclbiyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KBi4N3ZFmIGz/EGq5Pojb1W/HhOy23rTrcTg4bP8W0biAYv8X5ehwTbJKtlsUyZ+d
	 JPbRc61jxGZ7wDFpW3LEyLjRFb/9Z/97wElo/d8VHNwCzTi1DcaFGjLEmsCjCVR7/a
	 hnUdn0+6DNX/eUuqLa8+ahFHv9whs9i83QCyrbCz1IH0txsKUuj20TDCVdS81NoCDe
	 uzELGkj9xLb3MkzSOPvmrz/QCQUnKtCEJJj3/vOdQ0yd58t71dB6l3lnJESL1MpD+z
	 Urgg9u/e15wN54QoJGpzTBNlxZzqMTvJhi4MGUNmxrEs4QLW9hnyhwIuMorybvkNNS
	 y1m0+CaYQZk6Q==
Date: Thu, 31 Oct 2024 09:01:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
Message-ID: <jhwf5xe5h6sfxirjavczs6txihsqukoqqhrrmfoipugsgjkynb@5o72xm5sjr6t>
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <20241028053220.346283-2-TroyMitchell988@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241028053220.346283-2-TroyMitchell988@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_135630_680077_0FCCC302 
X-CRM114-Status: GOOD (  14.31  )
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

On Mon, Oct 28, 2024 at 01:32:19PM +0800, Troy Mitchell wrote:
> The I2C of K1 supports fast-speed-mode and high-speed-mode,
> and supports FIFO transmission.
> 
> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> ---
>  .../bindings/i2c/spacemit,k1-i2c.yaml         | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> new file mode 100644
> index 000000000000..57af66f494e7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: I2C controller embedded in SpacemiT's K1 SoC
> +
> +maintainers:
> +  - Troy Mitchell <troymitchell988@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: spacemit,k1-i2c
> +
> +  reg:
> +    maxItems: 2

Provide changelog explaining why you are doing some changes.

List and describe items here instead.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-frequency:
> +    description:
> +      Desired I2C bus clock frequency in Hz. As only fast and high-speed
> +      modes are supported by hardware, possible values are 100000 and 400000.
> +    enum: [100000, 400000]
> +    default: 100000
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c@d4010800 {
> +        compatible = "spacemit,k1-i2c";
> +        reg = <0x0 0xd4010800 0x0 0x38>;

Missing second item.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
