Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11DCC636CC
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Feb 2023 11:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sXRz5l5TlQOkVzJOwKfGwDG3T1HHYi+RIUKavQUZtaI=; b=mA2B7dObuuDanx
	C7Uh0/G5VsvKdaA4lKQoYwxj0hJtJ23qXRAJWiZWZZDAYszYcoYrgkUtSpPeHembGz/tui8R/Jep/
	KisWnkaOgYciMiXWhVKkmEB9CHLNea4gY2c3hWsNoWt2nDZ5eSElziBtgUkuW0ojSIkEsSwJSx1Tf
	+fg3/rGKrlYdLTAG5XwFkd98gCVLal8vSNQDmlcrAdoVWyDDG4GKTW/M6gkU5NEStxU1F3xjKrTOI
	dOeDPFp+CajifqDdizP4lHhfEpwlKiF50A/maN3Oebm3cb+gWNRVLNJqLcjSMfmTgPaLqLs9VfC1O
	mE7wS5M3l5p8SjNPPYjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pThhr-001Pic-Jf; Sun, 19 Feb 2023 11:18:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pThhq-001Pho-DB
	for linux-riscv@bombadil.infradead.org; Sun, 19 Feb 2023 11:18:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1nxpGy6MS2o8HwQfGYJeWTTEYcPBkHZ07OBzzY3N5NU=; b=QqB/hkWWtubvYqrlEMRJvlUp53
	w5BouZO9uwPBclV3pAqmZTloPXuPUTiLamQc8uvHfNAO45JTApWvhO5me3gDjbBuyAhV2Yvbc+ULv
	wjSk3/UUv9lQPyGjznoyG1iQ6KUIyAYj1ADhWUEh7/wllS1DL/SOi8X5K2A335LVBrsGYtSzZRsnt
	AsgdztC1qy3jNRjZqDpqr52m7wgLRzNOU0v6vl8T+7ds7uplIOJmcpYyl8V9A1KuUPUTX8R1LFVrv
	0mLEEwleZCxaeeRLzPOoDm6QcBQ3Tu/ABp74aVoct0m0tJ97vbbK6xl5TfRO76Nrg8+lfbcbP+4Gw
	CvHNVDdQ==;
Received: from kuriko.dram.page ([65.108.252.55])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pThhm-00BNsH-0Z
	for linux-riscv@lists.infradead.org;
	Sun, 19 Feb 2023 11:18:09 +0000
Message-ID: <81b03d13-a1d6-91ee-9867-48e960f0549d@dram.page>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dram.page; s=mail;
	t=1676805479; bh=1nxpGy6MS2o8HwQfGYJeWTTEYcPBkHZ07OBzzY3N5NU=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To;
	b=XU7bqj+Na6ART26G1bBybn3NWB01QI6wJe6S/GY0wLOBH3YWWGIdGNCQdkllY44OS
	 DL0iCyUDtGY24a/y0VeSc77kng/O8QKlvnspOBFF90aZDPQRfqMUoH9iRsaD2P2umv
	 BQwxwlFKtLSt/JvUmpNaXXIIZ2zDBYmA6pKEeo+w=
Date: Sun, 19 Feb 2023 19:17:48 +0800
MIME-Version: 1.0
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel
 <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230103141409.772298-1-apatel@ventanamicro.com>
 <20230103141409.772298-5-apatel@ventanamicro.com>
Content-Language: en-US
From: Vivian Wang <uwu@dram.page>
Subject: Re: [PATCH v2 4/9] dt-bindings: interrupt-controller: Add RISC-V
 incoming MSI controller
In-Reply-To: <20230103141409.772298-5-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230219_111806_527891_6672C89F 
X-CRM114-Status: GOOD (  14.30  )
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

On 1/3/23 22:14, Anup Patel wrote:
> We add DT bindings document for the RISC-V incoming MSI controller
> (IMSIC) defined by the RISC-V advanced interrupt architecture (AIA)
> specification.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../interrupt-controller/riscv,imsics.yaml    | 168 ++++++++++++++++++
>  1 file changed, 168 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
> new file mode 100644
> index 000000000000..b9db03b6e95f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
> <snip>
> +
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 16384
> +    description:
> +      This property represents the set of CPUs (or HARTs) for which given
> +      device tree node describes the IMSIC interrupt files. Each node pointed
> +      to should be a riscv,cpu-intc node, which has a riscv node (i.e. RISC-V
> +      HART) as parent.
> +

This property doesn't seem to describe guest external interrupts. Should
we add a reference to e.g. <&cpuN_intc 12> to indicate that IMSIC can
send a 'Supervisor guest external interrupt'? Or just an idea, maybe we
can add an additional interrupt controller to the CPU nodes to handle
SGEI: (Various properties omitted)

cpu0: cpu@N {
	compatible = "riscv";

	cpu0_intc: interrupt-controller {
		compatible = "riscv,cpu-intc";

		cpu0_gei: interrupt-controller {
			/* intc for hart-local hgeie/hgeip */
			compatible = "riscv,..."; /* Something here */
			interrupt-parent = <&cpu0_intc>;
			interrupts = <12>; /* SGEI */
			interrupt-controller;
			#interrupt-cells = <1>;
		}
	}
}

interrupt-controller@... {
	compatible = "riscv,imsics";
	interrupts-extended = <&cpu0_intc 11>, <&cpu0_gei 1>, <&cpu0_gei 2> /* ... */;
}

I feel that this would be more appropriate, since the guest external
interrupts are defined in the privileged architecture specification and
are not specific to AIA. Though please do suggest more appropriate ways
to formulate it.
> <snip>
> +...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
