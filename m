Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEB6C6FD1F
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Mar 2024 16:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zZiXe4S07iBGSA4JHeC8xEljpClJIkdC+RV4TZuc5kQ=; b=FW7q3Vbioxr8SE
	bB1DR54uMrMD/AQdpdAKgLijzFuw0voiqwMfE8dLm8Z43sI/QbTOPvuXggi21KoYwq/2AxzLnG48+
	1TQg93hXM2oJUsQ1cGv05mTN2SWVgabqveZpMWSdCmi9+5r8gYz1aM/YgJIP0o4JkfeuP41WXiSgf
	uvFwj7oOLa7wZKWYvb8Acm3wwS2mYQA3MpuDQopQu3ulkZHZCj5UJW5T1kM9BAbbIzaYlO4fVPmi0
	zc+k0QjVZ7pmb0suqPG4S6Tu1phpgLf/bFCgK7lQMe2/f+uuUSGrCC8hMhYTw9W4XsZ9KHx/VT4OQ
	puzFItu+Ac+bxS+3ibRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqbML-00000003m1p-3xjr;
	Sat, 30 Mar 2024 16:15:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqbMJ-00000003m1K-1Wtp
	for linux-riscv@lists.infradead.org;
	Sat, 30 Mar 2024 16:15:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9814560B80;
	Sat, 30 Mar 2024 16:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7176AC433F1;
	Sat, 30 Mar 2024 16:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711815305;
	bh=R6e1rgzG7LLbsqpqTULDF0Q5Ol6Unlo2PfLYVNjOD54=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BNh16Tgxho5L7S5bQv5qAVnwoKQna8KWMINLgiBnkEflse+XfkwMhoq0SpLr7AXWD
	 8vNzzTsEx2xrhLjbOdJ3dj0zrEEfh2ILIEug7EEk4e5cysqBg1dAhaZN4yZbK+uuof
	 k0fcl583FLP4jVn6AQ9Lq/qOee88IImIh4gPvnmz49IcSl44Wfo+V2UqkT4LbC0JYw
	 0XjeYZZvnLVyXLFkTE5LW9dlqgtwSLuJ0ig161xdlAq3aG2C9jPdJvhDUv3KGGojIv
	 apeLJFVYToDcG1NcrdJeATB0WA79CKsc+1dy0HBWmlhN7jpdHE3OUF8MD87NWjnitc
	 piONJ1ckhJ8sQ==
Date: Sat, 30 Mar 2024 16:14:46 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: wefu@redhat.com
Cc: jszhang@kernel.org, guoren@kernel.org, conor@kernel.org,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 lars@metafoo.de, andriy.shevchenko@linux.intel.com, nuno.sa@analog.com,
 marcelo.schmitt@analog.com, bigunclemax@gmail.com,
 marius.cristea@microchip.com, fr0st61te@gmail.com, okan.sahin@analog.com,
 marcus.folkesson@gmail.com, schnelle@linux.ibm.com, lee@kernel.org,
 mike.looijmans@topic.nl, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: adc: Document XuanTie TH1520 ADC
Message-ID: <20240330161446.21ff631b@jic23-huawei>
In-Reply-To: <20240329200241.4122000-4-wefu@redhat.com>
References: <20240329200241.4122000-1-wefu@redhat.com>
	<20240329200241.4122000-4-wefu@redhat.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240330_091507_648222_0734CDCA 
X-CRM114-Status: GOOD (  19.27  )
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

On Sat, 30 Mar 2024 04:01:26 +0800
wefu@redhat.com wrote:

> From: Wei Fu <wefu@redhat.com>
> 
> Document devicetree bindings for the XuanTie TH1520 AP sub-system ADC.
> 
> Signed-off-by: Wei Fu <wefu@redhat.com>

Hi.

Few comments inline.

Given Fugang Duan is listed as a maintainer I'd also like an ack ideally
from them.  BTW your +CC list seems a bit random.


Thanks,

Jonathan


> ---
>  .../bindings/iio/adc/thead,th1520.yaml        | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/thead,th1520.yaml b/Documentation/devicetree/bindings/iio/adc/thead,th1520.yaml
> new file mode 100644
> index 000000000000..80890ce62810
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/thead,th1520.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/thead,th1520.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: XuanTie TH1520 Analog to Digital Converter (ADC)
> +
> +maintainers:
> +  - Fugang Duan <duanfugang.dfg@linux.alibaba.com>
> +  - Wei Fu <wefu@redhat.com>
> +
> +description: |
> +  12-Bit Analog to Digital Converter (ADC) on XuanTie TH1520
> +
> +properties:
> +  compatible:
> +    const: thead,th1520

See the example - doesn't match.  Should be -adc here as well
as this is just part of the SoC.


> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: adc

No objection to having names, but if there is only 1 why is
it required?

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - status

Status doesn't need to be here

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    adc: adc@0xfffff51000 {
> +	compatible = "thead,th1520-adc";

As the bot pointed out, spaces not tabs for these - Please run the suggested
tests in that email before sending a v2.

> +	reg = <0xff 0xfff51000 0x0 0x1000>;
> +	interrupts = <61 IRQ_TYPE_LEVEL_HIGH>;
> +	clocks = <&aonsys_clk>;
> +	clock-names = "adc";
> +	/* ADC pin is proprietary,no need to config pinctrl */
> +	status = "disabled";
No need for a status entry in the example.


> +    };


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
