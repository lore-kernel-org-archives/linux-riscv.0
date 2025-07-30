Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2674DC87FCB
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Jul 2025 12:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SVFpGs8STuEK5SSP9Y8RURC9Qdffo83bAz+qq+phC8Q=; b=G8t56MHchTDCas
	XHeklRt2W16T0ax+4NM0zpx5KejdEJ3VFhcHzFz1I3ywJFWFqpJ9Ze5Tr3x0lba7qGE7ymTVgtBfi
	z77dQ6c/dMY8Yv21LNMZu56ihwsuNuH5Us5CirFArjDXQIykoBbLC+EYvcjmwetvmlf2hz1/gJE7I
	EIFucobrmn2wYuSqvfMH1cjgqiri0Q9YNsRGNkPAVtfiinr9JiGrXJEIHN3w1YCsYVIC/tEaokRdL
	KPaSA6m4V/ZFuFSJv62AyWIQXKx5jPdJsk9b2wetEiw0I8d/JXPrBeD1D9GIwjymVMGlzIGdEd0Z/
	+OsE82y5BfmD3yKMefLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh5oV-00000001RyP-0d0P;
	Wed, 30 Jul 2025 12:21:43 +0000
Received: from sender4-pp-o92.zoho.com ([136.143.188.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh4rr-00000001Kqp-3fWZ
	for linux-riscv@lists.infradead.org;
	Wed, 30 Jul 2025 11:21:12 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753874463; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E8r8UTppfiLYDUKk0iKnk8G8/FN1FpODiWadA9FBObOHIUyt4+/SAyHoGwfo46HIndDDoFteDSt1WMnutOaImJhOmy+rQexDY3RzHypvTD6CR4BlGxZNGMEIgYrgO2F6rarDQveFgOiDgzhHzMXaWl2D8yADnrykjQeU7q9sx38=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753874463; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8Oz8gEKqQKUEqMecwoAV5BMdQ44ozr0nc/GN/7ECVkk=; 
	b=oLz/jflwJpTuDqk1ujOH9BxpbpSMpgfmSH7gOuadElCB9kWs8VIybTG09k0yq+6VJs52fLk0fsVrBU+KEkH5e/2n6higSulN2zYW6lzyGSTrelZtiNiW4994efaEu/9KlrFKMjKaIguaCHe8iuXE7G93+PP0XDDYYb6rvGJRcG4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753874463;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=8Oz8gEKqQKUEqMecwoAV5BMdQ44ozr0nc/GN/7ECVkk=;
	b=SVMEXXGoydW4JlJFuYIzvP8ubzv4KonrfST271YiBRYjVfVmTtVUBq/+vew0kFIs
	whQiqqJAHtHrWijhCPSgNfM4ccbpugxt1vpMG9IXkf8BiNIb2LgN0PxkQ7judxfFcf3
	qfIXHt/kQufJpoDDlvE4Hxt/2/QlizuLHJ/63xi4=
Received: by mx.zohomail.com with SMTPS id 175387445597336.57491374987171;
	Wed, 30 Jul 2025 04:20:55 -0700 (PDT)
Message-ID: <122a51eb-21e1-4cb4-b42b-fcb7e01cf64e@zohomail.com>
Date: Wed, 30 Jul 2025 19:20:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] dt-bindings: clock: Add bindings for Canaan K230
 clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>
References: <20250730-b4-k230-clk-v7-0-c57d3bb593d3@zohomail.com>
 <20250730-b4-k230-clk-v7-1-c57d3bb593d3@zohomail.com>
 <20250730-cobalt-salmon-of-charisma-aea028@kuoka>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <20250730-cobalt-salmon-of-charisma-aea028@kuoka>
Feedback-ID: rr0801122705379e726ccbd43f37e10cb6000094e63ed90cacde45cdbc9d713d3e27ea8ff19fee53717ce07d:zu080112272a964b8e78150ea41f6bca3600003d8e0fa10c7b72419c2cccc5a40a808f82a51dfb38244fb1a8:rf0801122c10cdd9d1176d37f07bf07f420000feac9293e220c0d9b6cd3327d2d7bf3d02e2af548a215b4f7b53805f1cdd:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_042108_002414_D927FB12 
X-CRM114-Status: GOOD (  17.05  )
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


On 2025/7/30 15:05, Krzysztof Kozlowski wrote:
> On Wed, Jul 30, 2025 at 02:43:51AM +0800, Xukai Wang wrote:
>> This patch adds the Device Tree binding for the clock controller
>> on Canaan k230. The binding defines the clocks and the required
>> properties to configure them correctly.
>>
>> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
>> ---
>>  .../devicetree/bindings/clock/canaan,k230-clk.yaml |  61 ++++++
>>  include/dt-bindings/clock/canaan,k230-clk.h        | 223 +++++++++++++++++++++
>>  2 files changed, 284 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..f2aa509b12bce1a69679f6d7e2853273233266d5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
>> @@ -0,0 +1,61 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/canaan,k230-clk.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Canaan Kendryte K230 Clock
>> +
>> +maintainers:
>> +  - Xukai Wang <kingxukai@zohomail.com>
>> +
>> +description:
>> +  The Canaan K230 clock controller generates various clocks for SoC
>> +  peripherals. See include/dt-bindings/clock/canaan,k230-clk.h for
>> +  valid clock IDs.
>> +
>> +properties:
>> +  compatible:
>> +    const: canaan,k230-clk
>> +
>> +  reg:
>> +    items:
>> +      - description: PLL control registers
>> +      - description: Sysclk control registers
>> +
>> +  clocks:
>> +    minItems: 1
> No, drop. Hardware is not flexible.
OK.
>
>> +    items:
>> +      - description: Main external reference clock
>> +      - description:
>> +          External clock which used as the pulse input
>> +          for the timer to provide timing signals.
> So what is the difference that you removed my Rb? Only this? I do not
> see any differences (and don't tell me, you claim some random indice
> numbers as change DT maintainer would need to re-review...)
Sorry about that. Since canaan/k230-clk.yaml was updated with new
clocks, I thought it might require a re-review. I didn't mean to cause
unnecessary noise.
>
>> +
>> +  clock-names:
>> +    minItems: 1
> No, drop. Hardware is not flexible.
OK.
>
>> +    items:
>> +      - const: osc24m
>> +      - const: timer-pulse-in
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - '#clock-cells'
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    clock-controller@91102000 {
>> +        compatible = "canaan,k230-clk";
>> +        reg = <0x91102000 0x40>,
>> +              <0x91100000 0x108>;
>> +        clocks = <&osc24m>;
>> +        clock-names = "osc24m";
> Incomplete. Post complete hardware.
OK.
>
>> +        #clock-cells = <1>;
>> +    };
>> diff --git a/include/dt-bindings/clock/canaan,k230-clk.h b/include/dt-bindings/clock/canaan,k230-clk.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..9eee9440a4f14583eac845b649e5685d623132e1
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/canaan,k230-clk.h
>> @@ -0,0 +1,223 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Kendryte Canaan K230 Clock Drivers
>> + *
>> + * Author: Xukai Wang <kingxukai@zohomail.com>
>> + */
>> +
>> +#ifndef __DT_BINDINGS_CANAAN_K230_CLOCK_H__
>> +#define __DT_BINDINGS_CANAAN_K230_CLOCK_H__
>> +
>> +/* Kendryte K230 SoC clock identifiers (arbitrary values) */
> Drop comment, redundant and obvious.
OK, I'll drop it.
>
> Best regards,
> Krzysztof
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
