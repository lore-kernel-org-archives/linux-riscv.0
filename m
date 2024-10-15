Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798D8CFC268
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 05:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=77PIBdslw84XSkDMjbSLlKB5+90SYOPGAgkPKhszO2Y=; b=UVPJ8lxy5RfWTS
	X3N+0mTPy7uB2TptH99zXoLlgAId+mHuT+bAW+YJSLMC0MPZ5nTH1GOp8xlm4hAT1NHbPGPNR5Wq8
	PWEMYka33KC/4nEG0iawGP+GptVAQppmwtIhIjBM9t5CyzNNsWejI/whH16G8BTtX3BO00KthhvXu
	hwCDwPtb5Vu1JXGkjF4dfz50rw4T+PYpDOS7z8XuzM9BzRIz8Io2GamRcdTUiIx8ZSbwp0tNk+0+B
	bKGa5cvPgEdGTAAHxNViX/9cLYslAhhV7jtpnbjfhYVdBuv3c8XVqDwKkx10zurSqSZSBibWzRenq
	OrCDFqMbbfpdsoV9j68w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0aU5-000000078pB-3uYy;
	Tue, 15 Oct 2024 05:52:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0aU2-000000078op-3mKw
	for linux-riscv@lists.infradead.org;
	Tue, 15 Oct 2024 05:52:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1C2F4A401EC;
	Tue, 15 Oct 2024 05:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5050C4CEC7;
	Tue, 15 Oct 2024 05:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728971557;
	bh=gjwGiR+lw8swhi0FBcZZp7bPpunXeeBui+cUFrOI3EA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a3cH8pKRcQm+R7SqtNvAwMWjn5Hja1PiemGxo5EFTe88ND22q0ULdIBCFVwvJh1+r
	 eYUxLZ9zD8nIRIx0bN7dfLTj6JHDCiLvuyrkC1P/JDTpvqF9Ud7lT2GP1E5X2teQuX
	 zgsVuXL0VlMWmckhsYn2G8AUWWC4tIjqGFBebWx2LxQb1gUIPU4oPMyiERrQazD9IA
	 Qno6aUjATKNr9gS3TnV4RSqPmhLUaPQ36kt/dKq4klLNlm0r9Y+4h0dLqpkR6/vOHP
	 V1HkZsN1Nf0KSjERkBY+2vKPBrrVeUqvrTF9PaQoAnkITjQJyrH67W5O+K2JR9vYgR
	 oV8oTtV67DNkg==
Date: Tue, 15 Oct 2024 07:52:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haylen Chu <heylenay@4d2.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 1/3] dt-bindings: thermal: sophgo,cv1800-thermal: Add
 Sophgo CV1800 thermal
Message-ID: <cycdlsi3tb6nqgbzzmypmblpcxxqmn3slqcbf5mq2okw3lqrdr@ghvswymvnslp>
References: <20241014073813.23984-1-heylenay@4d2.org>
 <20241014073813.23984-2-heylenay@4d2.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241014073813.23984-2-heylenay@4d2.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_225239_026792_E54540C5 
X-CRM114-Status: GOOD (  12.38  )
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

On Mon, Oct 14, 2024 at 07:38:11AM +0000, Haylen Chu wrote:
> Add devicetree binding documentation for thermal sensors integrated in
> Sophgo CV1800 SoCs.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>
> ---
>  .../thermal/sophgo,cv1800-thermal.yaml        | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/sophgo,cv1800-thermal.yaml
> 
> diff --git a/Documentation/devicetree/bindings/thermal/sophgo,cv1800-thermal.yaml b/Documentation/devicetree/bindings/thermal/sophgo,cv1800-thermal.yaml
> new file mode 100644
> index 000000000000..14abeb7a272a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/sophgo,cv1800-thermal.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/sophgo,cv1800-thermal.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo CV1800 on-SoC Thermal Sensor
> +
> +maintainers:
> +  - Haylen Chu <heylenay@4d2.org>
> +
> +description: Sophgo CV1800 on-SoC thermal sensor
> +
> +$ref: thermal-sensor.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sophgo,cv1800-thermal

Not much improved, judging by other patches there is no "CV1800" SoC,
but that's a family name.  Otherwise please point us to bindings or DTS
using this SoC.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
