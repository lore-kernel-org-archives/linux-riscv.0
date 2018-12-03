Return-Path: <SRS0=qdQm=OM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 042EBC04EB9
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Dec 2018 16:56:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC83020834
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Dec 2018 16:55:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WDrzB6Bp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC83020834
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4R4mVLqJ+6NLcra5oHE5WQ7qe1z34xx2gtwg5xubC7Y=; b=WDrzB6Bp6CCrnA
	qTbkP2WSXIUrGQ5I41fOAwd2XOWoaW22HoC28VPEADgPBBj7wXIYlXc6rH2xJwTqSIsXpVa7dcnvP
	iAvqh3sx/5Fq3JoD2Mk+ZFK+dWiQqVthYWtXIPg+4oo6+yH3rT3rWkRVr6cHq25ZKnQsE/dK+DCp+
	+vWjI5F9SqS2MAAa5XjfSXdwfzV1QEQnptkC9B4ltvgoSevd/LroeRi9bX8NayhLo/S7oObh/AAWI
	4brB2uW7kK5aP5pgHNXiy3T3ddMJmmFKwzfWW2QfKg4iAkNPLb8MGA7XHZGkfbpr3c3xz7D+MGIpQ
	i7X8VCILohjhDEPBavyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTrVm-0001kg-KJ; Mon, 03 Dec 2018 16:55:58 +0000
Received: from foss.arm.com ([217.140.101.70])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTrVX-0001Me-RK; Mon, 03 Dec 2018 16:55:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 294A51682;
 Mon,  3 Dec 2018 08:55:28 -0800 (PST)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79A9C3F59C;
 Mon,  3 Dec 2018 08:55:24 -0800 (PST)
Date: Mon, 3 Dec 2018 16:55:21 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFT PATCH v1 2/4] dt-binding: cpu-topology: Move cpu-map to a
 common binding.
Message-ID: <20181203165521.GB17883@e107155-lin>
References: <1543534100-3654-1-git-send-email-atish.patra@wdc.com>
 <1543534100-3654-3-git-send-email-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1543534100-3654-3-git-send-email-atish.patra@wdc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_085544_432711_0D12D356 
X-CRM114-Status: GOOD (  16.04  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, linux-riscv@lists.infradead.org,
 Morten Rasmussen <morten.rasmussen@arm.com>, Juri Lelli <juri.lelli@arm.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Ingo Molnar <mingo@kernel.org>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "moderated list:ARM64 PORT \(AARCH64 ARCHITECTURE\)"
 <linux-arm-kernel@lists.infradead.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Jeremy Linton <jeremy.linton@arm.com>, Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 29, 2018 at 03:28:18PM -0800, Atish Patra wrote:
> cpu-map binding can be used to described cpu topology for both
> RISC-V & ARM. It makes more sense to move the binding to document
> to a common place.
>
> The relevant discussion can be found here.
> https://lkml.org/lkml/2018/11/6/19
>

Looks good to me apart from a minor query below in the example.

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  .../{arm/topology.txt => cpu/cpu-topology.txt}     | 81 ++++++++++++++++++----
>  1 file changed, 67 insertions(+), 14 deletions(-)
>  rename Documentation/devicetree/bindings/{arm/topology.txt => cpu/cpu-topology.txt} (86%)
>
> diff --git a/Documentation/devicetree/bindings/arm/topology.txt b/Documentation/devicetree/bindings/cpu/cpu-topology.txt
> similarity index 86%
> rename from Documentation/devicetree/bindings/arm/topology.txt
> rename to Documentation/devicetree/bindings/cpu/cpu-topology.txt
> index 66848355..1de6fbce 100644
> --- a/Documentation/devicetree/bindings/arm/topology.txt
> +++ b/Documentation/devicetree/bindings/cpu/cpu-topology.txt

[...]

> +Example 3: HiFive Unleashed (RISC-V 64 bit, 4 core system)
> +
> +cpus {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +	compatible = "sifive,fu540g", "sifive,fu500";
> +	model = "sifive,hifive-unleashed-a00";
> +
> +	...
> +
> +	cpu-map {
> +		cluster0 {
> +			core0 {
> +				cpu = <&L12>;
> +		 	};
> +			core1 {
> +				cpu = <&L15>;
> +			};
> +			core2 {
> +				cpu0 = <&L18>;
> +			};
> +			core3 {
> +				cpu0 = <&L21>;
> +			};
> +		};
> + 	};
> +
> +	L12: cpu@1 {
> +		device_type = "cpu";
> +		compatible = "sifive,rocket0", "riscv";
> +		reg = <0x1>;
> +	}
> +
> +	L15: cpu@2 {
> +		device_type = "cpu";
> +		compatible = "sifive,rocket0", "riscv";
> +		reg = <0x2>;
> +	}
> +	L18: cpu@3 {
> +		device_type = "cpu";
> +		compatible = "sifive,rocket0", "riscv";
> +		reg = <0x3>;
> +	}
> +	L21: cpu@4 {
> +		device_type = "cpu";
> +		compatible = "sifive,rocket0", "riscv";
> +		reg = <0x4>;
> +	}
> +};

The labels for the CPUs drew my attention. Is it intentionally random
(or even specific) or just chosen to show anything can be used as labels ?
The reason I ask is people tend to copy from existing DT or examples
like here and so want to make sure if it can be kept as generic as
possible in the example. Just my opinion and I am fine if you want to
keep it as is, thought of checking the intentions here.

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
