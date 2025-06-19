Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E474C7115D
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 18:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D1J+Gqa900w8Jb/2t5TIxw/2hDfWZA2XVs/Njaydiw4=; b=Awq+DoYpLLyhJK
	u1xKjpq13wZ2d3tfi3vbm5mioQ7ABORcdywMD9wfYD+Rv0zUtgov1IDmPzXu7ecGS4kLifctT7qwI
	tqZx6t9mZfMDC6Ox3BzLvS/oFevFDyT65DDaH7kF/5mnZPF3m3WTfp0Spt3mdjJs6IqnthiLYW4Oe
	W3fhBTwYyhzx9lF6SxlrsAwRe1ck2YXqdEDckLO0nDxy6szjXxQBw/CLXEyzPkMLE3ftpXD+A2lNH
	21zM6qT1Ml4iMkEV/LaBib4LSY4GiWaJ6otXHYvpI86xqfQHpRwxOluy0NiurLBpTdkdlr7s3j+3C
	8UyPkTHPo0R3vBTxP2Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSK7S-0000000DtSD-3rcw;
	Thu, 19 Jun 2025 18:36:14 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSGvR-0000000DNFV-3cbF
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 15:11:39 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-86cdb34a56cso26247139f.3
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jun 2025 08:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1750345895; x=1750950695; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oFGwKffzZxxx+liHIJgaBF+mW0zmVCScmb0c46n6Kak=;
        b=FxPQ6DtkhH6omeYA7wmKBig/eSbMuZCXvd6L3KEwIsBKba7WK9hkYpCKzAeoA7NP7W
         jKUOZa9UKryRsOuylzJAvHzXekL9k1jYWozqrj5C3+kf/3szKPsjf9zWXC1NdjnrM6u4
         lrjB9muLJuX8wrkgpyakSCJFZ8FZ19vB/huoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750345895; x=1750950695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oFGwKffzZxxx+liHIJgaBF+mW0zmVCScmb0c46n6Kak=;
        b=Cvs+YXQ2/VPlHwi0d2Es9xDGAH4DQfDJm8ChlG2Nf0is9m9Jwn35bdLsPWAkzY7Xrl
         GuVgRD7R6gYfbTAF2fm/OTXKa0GN0d7WVbdBlKKjzsTFHoqPq90PEipTXe/ueUR8MWUx
         Ux/P1Yk+1MLHV7+tvZq8565tDckrLQPCbIUwKlAz0jvDMTDrNmd2TvG25SKpkntsHs65
         eu9/x4WsnEXmm7ZHMbdH7x4w9egoNSa2vbg6mXbOwntRQ/XkR+68kukP36dzqRV0yTGP
         /mvzRXqlVZlIuZuMh4F3HTkXFeBD4RmehSM0QNUq3PbRumTbdtR5H8AilWNfQ/D4Kmu7
         bTxQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8Dbizwq5kPYJjG/HiGK2X5bdWFyXpDVFIKoHKXpOLyI28p9s1m2tZbNMv64x/X9sKwTbweN/JPKZzLA==@lists.infradead.org
X-Gm-Message-State: AOJu0YySOI4UdUyp+Ex40LNKkCQPzTXDhIdKkGBEYuA8cBTyi2CknzQ1
	AAxkM3MSb14qZIQjbpoDS2+hn08l8ymmZxLxx9P6YoDTRdlE7CvG6yxfDxyEgJ0V+Q==
X-Gm-Gg: ASbGncvVSLRwq7kxpzYa+TZBoIlP/i6queg/yUk1lJuKbTuy33EMtihF9cmF8oe2Aq6
	9B1Ch3cYu501ARMHy4earq+lYrd1CwAlk4mrqfH4a399rFG/mT+NYm1BDFuQr/QAdBJ7YEUMZMn
	tuWkY6nR/eCSOp5lqPL8e4S8J3ITMBmG4eQxKFUunR8kV+1BBp/hLmAMyXpqJitpdodDYAaRg6B
	1/ePU352oIEmvRsSfJW/Kr/WJscm58qAtwv6d6pJ7ZsLy/rF2FputPsL7uk7ILvbcLY77bw8wVp
	QfUDIdC0YOl3T7PYk00H9/Fs1SYYH52X76wODcuwCzKMODcM5hieNU79D8nVS8x9aSasUJ2ta1f
	B5er5SBldf4TeeJh9CFlTiZtDo7vEuDE=
X-Google-Smtp-Source: AGHT+IF6bvglZ3cpBSripQco+ttcnZ5jzG2rPUkRsO79qncZB/5WB1V0utxb8yyQkNyJncd7lYe5LA==
X-Received: by 2002:a05:6602:6424:b0:862:fe54:df4e with SMTP id ca18e2360f4ac-875ded5d849mr2848267139f.7.1750345894752;
        Thu, 19 Jun 2025 08:11:34 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id ca18e2360f4ac-875d5829e9dsm302704139f.37.2025.06.19.08.11.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 08:11:33 -0700 (PDT)
Message-ID: <5cc644f8-7394-48f2-b62b-1e7cd5ce27d3@ieee.org>
Date: Thu, 19 Jun 2025 10:11:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] riscv: dts: spacemit: Add DMA translation buses for
 K1
To: Vivian Wang <wangruikang@iscas.ac.cn>, Yixun Lan <dlan@gentoo.org>,
 Guodong Xu <guodong@riscstar.com>, Ze Huang <huangze@whut.edu.cn>,
 spacemit@lists.linux.dev
Cc: Vivian Wang <uwu@dram.page>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250617-k1-dma-buses-rfc-wip-v1-1-c8ec192fbf58@iscas.ac.cn>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250617-k1-dma-buses-rfc-wip-v1-1-c8ec192fbf58@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_081138_038543_59263CF3 
X-CRM114-Status: GOOD (  35.47  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 6/17/25 12:21 AM, Vivian Wang wrote:
> The SpacemiT K1 has various static translations of DMA accesses. Add
> these as simple-bus nodes. Devices actually using these translation will
> be added in later patches.
> 
> The bus names are assigned according to consensus with SpacemiT [1].
> 
> [1] https://lore.kernel.org/all/CAH1PCMaC+imcMZCFYtRdmH6ge=dPgnANn_GqVfsGRS=+YhyJCw@mail.gmail.com/

So what you include here very closely matches what Guodong
said in the message above.  Yours differs from his proposal
and that makes it hard to compare them.  I have a few comments
on that below.

> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
> This is my concrete proposal for representing DMA translations for
> SpacemiT K1.

It's worth acknowledging that this is derived from what Guodong
proposed (it's not "your" proposal in that respect).  That said,
yours is a more complete and "formal" RFP than what he wrote.

> For context, memory on the SpacemiT K1 is split into two chunks:
> 
> - 0x0000_0000 to 0x8000_0000: First 2 GiB of memory
> - 0x1_0000_0000 above: Rest of memory
> 
> DMA-capable devices on the K1 all have access to the lower 2G of memory
> through an identity mapping. However, for the upper region of memory,
> each device falls under one of six different mappings. The mappings are
> provided in this patch as simple-bus nodes that device nodes should be
> added to.
> 
> This patch is an RFC because it is not meant to be applied, or at least,
> not certainly meant to be applied. Instead, this is an attempt to come
> to a consensus on how these bus nodes should look like.

I think the above is what Krzysztof might not have seen.  Perhaps
it could have been made more clear--maybe in the "main" description
section (above the ---) or even the subject line.

> More specifically, I propose that the process proceeds as follows:
> 
> - Firstly, relevant parties agree on these bus nodes given here.
> - After that, each time the first user of a bus appears, the series
>    should include a patch to add the bus required for that driver.
> - If a driver being submitted uses the same bus as another one that has
>    been submitted but hasn't yet landed, it can depend on the bus patch
>    from that previous series.

Getting agreement is good, but otherwise this is basically
the process Guodong was suggesting, right?

> For conventions regarding coding style, I propose that:
> 
> - #address-cells and #size-cells are 2 for consistency
> - These bus nodes are put at the end of /soc, inside /soc
> - These bus nodes are sorted alphabetically, not in vendor's order
> - Devices are added into *-bus nodes directly, not appended towards the
>    end with a label reference

I do like that you're trying to be more complete and explicit
on what you think needs agreement on.

> The K1 DMA translations are *not* interconnects, since they do not
> provide any configuration capabilities.
> 
> These bus nodes names and properties are provided compliant with
> "simple-bus" bindings, and should pass "make dtbs_check".
> 
> Remaining questions:
> 
> - Should storage-bus exist? Or should drivers under it simply specify
>    32-bit DMA?

Explicitly saying storage devices have one-to-one mapping
seems informative, to me.

> ---
>   arch/riscv/boot/dts/spacemit/k1.dtsi | 53 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 53 insertions(+)

The short summary of what differs between your proposal
and what Guodong said is:
- You sort nodes alphabetically, Guodong did not
- You dropped the unit address
- You dropped the comments he had, which indicated which
   devices "belonged" to each mapping
- You added a compatible property to each ("simple-bus")
- You added an explicit (empty) ranges property to each
- You add #address-cells and #size-cells properties, both 2
- Your dma-ranges properties are identical to Guodong's,
   for all nodes

My comments:
- I agree with you that a unit address doesn't really make
   sense, because there is no meaningful ordering
- Sorting alphabetically also makes sense to me
- I think the comments about devices associated with each
   mapping were informative

I think Yixun should manage getting consensus on this
(i.e., he should sign off on the RFP somehow).

					-Alex

> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index c0f8c5fca975d73b6ea6886da13fcf55289cb16c..efefed21b9fa1ab9c6ac3d24cd0cca8958b85184 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -562,5 +562,58 @@ sec_uart1: serial@f0612000 {
>   			reg-io-width = <4>;
>   			status = "reserved"; /* for TEE usage */
>   		};
> +
> +		camera-bus {
> +			compatible = "simple-bus";
> +			ranges;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
> +				     <0x0 0x80000000 0x1 0x00000000 0x1 0x80000000>;
> +		};
> +
> +		dma-bus {
> +			compatible = "simple-bus";
> +			ranges;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
> +				     <0x1 0x00000000 0x1 0x80000000 0x3 0x00000000>;
> +		};
> +
> +		multimedia-bus {
> +			compatible = "simple-bus";
> +			ranges;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
> +				     <0x0 0x80000000 0x1 0x00000000 0x3 0x80000000>;
> +		};
> +
> +		network-bus {
> +			compatible = "simple-bus";
> +			ranges;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
> +				     <0x0 0x80000000 0x1 0x00000000 0x0 0x80000000>;
> +		};
> +
> +		pcie-bus {
> +			compatible = "simple-bus";
> +			ranges;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
> +				     <0x0 0xb8000000 0x1 0x38000000 0x3 0x48000000>;
> +		};
> +
> +		storage-bus {
> +			compatible = "simple-bus";
> +			ranges;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
> +		};
>   	};
>   };
> 
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250616-k1-dma-buses-rfc-wip-3be7a01f47c8
> 
> Best regards,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
