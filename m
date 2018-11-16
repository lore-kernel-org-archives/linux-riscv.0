Return-Path: <SRS0=ssm3=N3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D3E4C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 16 Nov 2018 23:19:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A1E72086A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 16 Nov 2018 23:19:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="amebAzIG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="l75j07P/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A1E72086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6mrYzPwWJqBRu+Q4M7KVswG22BYNTLu25G2yGP7cTLE=; b=amebAzIGiiSBYfOyuRqC0dtPr
	t4/Vydtn3QC846+lzySVxrcNDJEpMzgOnmMz5032VDsBrUZFGu0vZeNDajRWxjZ/cYRISCam/AFtF
	iLZIvNaUxT1XZTuvRc5Ag7G5HjiUdCIYYlrBD7Xgasae3Nwiol5XMaxsPhl1L1wrmP7diIOj+WO90
	aSbFKQhe3wAFAP0WDD3S9pC2qMifpcCXvmVYRkBAZ/DKgr2XLR3FDujaLOJuonhj0rwbssuM1Mhy6
	u0S8h7Ku0sAXwZR+aUtMk9tRs5nuaAugzPjkF/1GxzgZxchuOZwmaztx0Bp7/KHy7teb2ccnUm8TL
	B1IJi8NFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gNnON-0000Z8-Eb; Fri, 16 Nov 2018 23:19:15 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNnOK-0000YQ-3i
 for linux-riscv@lists.infradead.org; Fri, 16 Nov 2018 23:19:13 +0000
Received: by mail-pf1-x441.google.com with SMTP id s9-v6so12063144pfm.13
 for <linux-riscv@lists.infradead.org>; Fri, 16 Nov 2018 15:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=qcbldZMu68BJoiL+02D1gKTjracjjQPQiOLPdGDzgRk=;
 b=l75j07P/X5D4FNJGd4UMUHMyfZRCenOAlrIGdH0cisJCx8KyEv9yxS7vLKzm+kiY4p
 AWQi9x/zpru83EyswwA33XiSBs7erCnf/W9HZxHepioT4AH3U4N+ySy3FeJb0M/4qsDA
 fXTr6YYWcaN80oGDLovrRMxTWM/3uw2m4tIc6sL+/sdPD/tHWwREmpR+YQ6Jwxu0xttw
 uooND78pjFZKrNwui186jZOu1qAO+QX0XEShMYUnVbhpajJsha/gnbEG58crw/iFUW20
 qHB7Eq2IKoSSgl0oBWOBZv8VlIraOXQ35iYKoUNBPf3BJCxyLLikezpHe0wYFtqLJXoH
 gz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=qcbldZMu68BJoiL+02D1gKTjracjjQPQiOLPdGDzgRk=;
 b=Yz7uOv4vl4Tc3imcpNIWmNDauaupR06N6ZK3u4eVkPhaWCs61YTDWk7I+cAWCPgmbz
 oEoG0Ia6KqMEIf7UXvJv+s0co2F5T9COechnlWsN4E7Mp+qJs7ZaXuLaRghnradH0wdC
 J841pMhPLsvCv1YiWlqYCXLxLYRG605A5x0rD9bmdqmTYVKJQQ36JrTfOiEu8iF3dI+E
 dBpLd9Cq5ZQ2bNMFT2ltu3OTPQMmJUW68oLbhebUXwEqhCudG+keiVFvl7g5QAXhf6sf
 Hu2/fdSBcQ1Ib8TSr5sK4Cx7ofR1auwk6iqTgmHrENDZgUSdBH1ef5lExQoGig54GCbI
 v4zA==
X-Gm-Message-State: AGRZ1gIMRmBXYhI0fKRzjyzH0Zb4K2cTRybGEgSV4H75lsMjkUFo8Yc1
 rwCx8D9bmLCmCtB1B0RX3Ibobg==
X-Google-Smtp-Source: AJdET5fCNgKV0w9IoDCnzl4SeI+cwIBQG0BErv15el1OXqjZtWFXUcLL1wNSm78kUzQWEibWBDSD8w==
X-Received: by 2002:a63:1b48:: with SMTP id b8mr11792119pgm.187.1542410341553; 
 Fri, 16 Nov 2018 15:19:01 -0800 (PST)
Received: from localhost ([216.234.200.180])
 by smtp.gmail.com with ESMTPSA id 19sm16308474pfs.108.2018.11.16.15.19.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 16 Nov 2018 15:19:00 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date: Fri, 16 Nov 2018 15:18:59 -0800 (PST)
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: clk: add documentation for the SiFive
 PRCI driver
In-Reply-To: <20181024184757.GA22367@bogus>
Message-ID: <alpine.DEB.2.21.9999.1811161510590.25712@viisi.sifive.com>
References: <20181020135024.28573-1-paul.walmsley@sifive.com>
 <20181020135024.28573-3-paul.walmsley@sifive.com>
 <20181024184757.GA22367@bogus>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181116_151912_153688_79C25897 
X-CRM114-Status: GOOD (  18.03  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Walmsley <paul@pwsan.com>, Stephen Boyd <sboyd@kernel.org>,
 Megan Wachs <megan@sifive.com>, Michael Turquette <mturquette@baylibre.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181116231859.JAxTrdqLL7Pv-ghkQZvPfNAik-zJyvr617bFRZdTkU0@z>

On Wed, 24 Oct 2018, Rob Herring wrote:

> On Sat, Oct 20, 2018 at 06:50:23AM -0700, Paul Walmsley wrote:
>> Add DT binding documentation for the Linux driver for the SiFive
>> PRCI clock & reset control IP block, as found on the SiFive
>> FU540 chip.
>>
>> Cc: Michael Turquette <mturquette@baylibre.com>
>> Cc: Stephen Boyd <sboyd@kernel.org>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Palmer Dabbelt <palmer@sifive.com>
>> Cc: Megan Wachs <megan@sifive.com>
>> Cc: linux-clk@vger.kernel.org
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-riscv@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
>> Signed-off-by: Paul Walmsley <paul@pwsan.com>
>> ---
>> v2: remove out-of-date example, add documentation for the compatible
>>     string and for the required PCB clock nodes
>>
>> .../bindings/clock/sifive/fu540-prci.txt      | 43 +++++++++++++++++++
>>  1 file changed, 43 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
>>
>> diff --git a/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
>> new file mode 100644
>> index 000000000000..d7c1e83fa5ed
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
>> @@ -0,0 +1,43 @@
>> +SiFive FU540 PRCI bindings
>> +
>> +On the FU540 family of SoCs, most system-wide clock and reset integration
>> +is via the PRCI IP block.
>> +
>> +Required properties:
>> +- compatible: Should be "sifive,<chip>-prci<version>".  As of the time this
>> +              file was written, only one value is supported:
>> +	      "sifive,fu540-c000-prci0"
>
> What happens with this depends on the discussion on the other bindings.

We'll drop the trailing 0 since the SoC identifier prefix should be 
sufficiently precise.

> Though here you are inconsistent without a fallback. Of course, I've
> never seen a clock controller be the same across SoCs.

As you write, the assumption is that chip integration IP blocks like this 
one are likely to be specific to individual SoCs.

This may not be universally true for SiFive looking into the future, but 
since we don't yet have a clear sense of the extent of exact reuse (i.e. 
chip "families"), am not yet comfortable with advocating something like 
"sifive,prci0" yet, as we do with the sifive-blocks.

>> +- reg: Should describe the PRCI's register target physical address region
>> +- clocks: Should point to the hfclk device tree node and the rtcclk
>> +          device tree node.  The RTC clock here is not a time-of-day clock,
>> +	  but is instead a high-stability clock source for system timers
>> +	  and cycle counters.
>> +- #clock-cells: Should be <1>
>> +
>> +The clock consumer should specify the desired clock via the clock ID
>> +macros defined in include/linux/clk/sifive-fu540-prci.h.  These macros
>> +begin with PRCI_CLK_.
>> +
>> +The hfclk and rtcclk nodes are required, and represent physical
>> +crystals or resonators located on the PCB.
>> +
>> +Examples:
>> +
>> +hfclk: hfclk {
>> +	#clock-cells = <0>;
>> +	compatible = "fixed-clock";
>> +	clock-frequency = <33333333>;
>> +	clock-output-names = "hfclk";
>> +};
>> +rtcclk: rtcclk {
>> +	#clock-cells = <0>;
>> +	compatible = "fixed-clock";
>> +	clock-frequency = <1000000>;
>> +	clock-output-names = "rtcclk";
>> +};
>> +prci0: prci@10000000 {
>
> clock-controller@...

Thanks; fixed.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
