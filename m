Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734ABC61DE2
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 09:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ikwyJ7ouS2juBPQJPtuJEjfY3ury/yez6CrYwLUGS2Q=; b=s5oS6eSf9wSmrg
	Dxkwq9K2nuB86ESneiHwnvnr3+aMycvRTs9U8VmtFPhHbH11epc/PNZU321u36MDtHV/H1D8dole+
	Qd2zDFLf2CpNOTtZFVHI9qDY8ZzHZU4rPp2ADQJ6rUhFu9nHTvihiTJNk8cojcyx3Zcd1g8IMUeJ5
	uet/AEp/YOum6SxEuEQbyUtAhsIr/CjbqGD7XS2qI02QEr5u161Vd+gLXZD+HgbdwR2T1oI4qzKgB
	nki/MvFPWauno2EYqLgb+WGLswjhZuHY7X6X+vDUX6s6375hwA1jIxdV6z1dlM50Of49T2RyjoX9q
	V4dAbPbjo4wXCwPIgoDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0yT0-00000009226-3Dsy;
	Mon, 31 Aug 2026 09:38:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0ySy-0000000921t-3jux
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 09:38:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F1170601DE;
	Mon, 31 Aug 2026 09:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7341F00A3D;
	Mon, 31 Aug 2026 09:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788169091;
	bh=3vrtIGdoWsbxbpDo+ZZza41ll94uskRK10AVMveyUHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XhydDlyoOA4iOhzTHB8rE9Z84E1B9IJxT5zfVQNsabiNJkGSb18k85PE1KV+wjtY2
	 95nyLnVQQL4MmAzIUiW7BiBElv7GNoE3UdBCWtuKOOqYn/Uwf2+PCojtD4bJSgqO0H
	 kJtYOohfie4ZU1HumC3gFLn5MYTXMuzFVDuajpbbJ/ljMLdRcDmKg89lWlIQgKAHcl
	 ozewhCv2NxjS5CZC4tNntmRAfmKyFEWxaJe3iD7AlnoTQ2HSOdxXPo3qWs5Ema6m+g
	 FWcBJ9GYolkxvFKAm8GUvcf3R8liBV8NBALfIQsinILXc+7ALBN8PWdM7Dqkul3xJG
	 pCpniz3UnONHQ==
Date: Mon, 31 Aug 2026 11:38:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: rahul@summations.net, anup@brainfault.org, lftan.linux@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, ulfh@kernel.org, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: power: Add RPMI device power service
 bindings
Message-ID: <20260831-fluorescent-garrulous-kraken-74eecd@quoll>
References: <20260830152812.312663-1-joshua.yeong@starfivetech.com>
 <20260830152812.312663-2-joshua.yeong@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260830152812.312663-2-joshua.yeong@starfivetech.com>
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

On Sun, Aug 30, 2026 at 11:28:11PM +0800, Joshua Yeong wrote:
> diff --git a/Documentation/devicetree/bindings/power/riscv,rpmi-mpxy-device-power.yaml b/Documentation/devicetree/bindings/power/riscv,rpmi-mpxy-device-power.yaml
> new file mode 100644
> index 000000000000..2b7df66ba172

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/riscv,rpmi-mpxy-device-power.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/riscv,rpmi-mpxy-device-power.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V RPMI device power service group based message proxy
> +
> +maintainers:
> +  - Joshua Yeong <joshua.yeong@starfivetech.com>
> +
> +description: |
> +  The RISC-V Platform Management Interface (RPMI) [1] defines a
> +  messaging protocol which is modular and extensible. The supervisor
> +  software can send/receive RPMI messages via SBI MPXY extension [2]
> +  or some dedicated supervisor-mode RPMI transport.
> +
> +  The RPMI specification [1] defines device power service group for
> +  accessing and controlling the power state of platform devices managed
> +  by a platform microcontroller. The SBI implementation (machine mode
> +  firmware or hypervisor) can implement an SBI MPXY channel to allow RPMI
> +  device power service group access to the supervisor software.
> +
> +  ===========================================
> +  References
> +  ===========================================
> +
> +  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
> +      https://github.com/riscv-non-isa/riscv-rpmi/releases
> +
> +  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
> +      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
> +
> +properties:
> +  compatible:
> +    description:
> +      Intended for use by the SBI implementation.
> +    const: riscv,rpmi-mpxy-device-power
> +
> +  mboxes:
> +    maxItems: 1
> +    description:
> +      Mailbox channel of the underlying RPMI transport.
> +
> +  riscv,sbi-mpxy-channel-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32

Why isn't this just phandle to mbox? Or even implied by mbox channel? As
your example shows, having same value in two places points that it is
redundant.

> +    description:
> +      The SBI MPXY channel id to be used for providing RPMI access to
> +      the supervisor software.
> +
> +required:
> +  - compatible
> +  - mboxes
> +  - riscv,sbi-mpxy-channel-id
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    device-power-service {
> +        compatible = "riscv,rpmi-mpxy-device-power";
> +        mboxes = <&rpmi_shmem_mbox 0x9>;
> +        riscv,sbi-mpxy-channel-id = <0x1002>;
> +    };
> +...
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
