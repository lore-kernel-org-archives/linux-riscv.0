Return-Path: <SRS0=oZWO=CY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E215DC433E2
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 00:07:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95451208DB
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 00:07:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W4KUfKZ9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fCupoy2y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95451208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cWQp6otbN7sLrAVAGAc5rrfHFHbCk9RyrnMIxv5Yg2Q=; b=W4KUfKZ9GnCI/WepHK/l1z5nR
	a71z7UaNRabudPoigDHsxDN7pAfOvHeZGuTkgB+X8PqcEjWkaGwxESHJ4oaiz89Hz3FSKDJeb4vry
	iAmSbfYOySvTGi9Q4M7dyXd7J3pht1ixX4JAo3Xs68Kn1JB23tf41JnQpPFoiZQvRjFHjzykHKAgi
	gyu5ILIZG7d0pJl5jxBvXnqhvIT1e0djeSXJYxmVUQMk9deCPl09Rfewg9n0hAjQ/eeg53ZlBW/uc
	ULKmHe6y3Ph4NZENVNn7jC7jTI4VnM52h+FzGSTF2woNok9QMuYG0ul0gfO6h6BvjKXjZu3CopTZE
	L1lknsSyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHyUz-0005T3-3g; Tue, 15 Sep 2020 00:07:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHyUw-0005Se-Bu
 for linux-riscv@lists.infradead.org; Tue, 15 Sep 2020 00:07:03 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 53530208DB;
 Tue, 15 Sep 2020 00:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600128421;
 bh=687u1BUQg/1ZmnPl6dLZ+wNLHLAr+aXXJgaQZx/yQZ4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=fCupoy2yZi1b6Lon2fshR3NSKREDyGmA8OXZZ7nkc8e9fHSbXXXzzvQWnR27mYkZ/
 /UXWPHwy7KxvlYyhm8h1QnPCb+Z5SkjR72zmGqznIBzh9OGOI8duUmba83ZR+djuxq
 wwAib1y1b3pUN10aSoObe7D152uPGBFdt7WsXPvM=
MIME-Version: 1.0
In-Reply-To: <1599734644-4791-2-git-send-email-sagar.kadam@sifive.com>
References: <1599734644-4791-1-git-send-email-sagar.kadam@sifive.com>
 <1599734644-4791-2-git-send-email-sagar.kadam@sifive.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: fu540: prci: convert PRCI bindings to
 json-schema
From: Stephen Boyd <sboyd@kernel.org>
To: Sagar Kadam <sagar.kadam@sifive.com>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Mon, 14 Sep 2020 17:07:00 -0700
Message-ID: <160012842007.4188128.14895985041717484631@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_200702_540832_EB935EA7 
X-CRM114-Status: GOOD (  18.54  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, jason@lakedaemon.net, maz@kernel.org,
 mturquette@baylibre.com, u.kleine-koenig@pengutronix.de, yash.shah@sifive.com,
 robh+dt@kernel.org, palmer@dabbelt.com, Sagar Kadam <sagar.kadam@sifive.com>,
 paul.walmsley@sifive.com, thierry.reding@gmail.com, tglx@linutronix.de,
 lee.jones@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Sagar Kadam (2020-09-10 03:44:02)
> diff --git a/Documentation/devicetree/bindings/clock/sifive/fu540-prci.yaml b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.yaml
> new file mode 100644
> index 0000000..49386cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2020 SiFive, Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/sifive/fu540-prci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiFive FU540 Power Reset Clock Interrupt Controller (PRCI)
> +
> +maintainers:
> +  - Sagar Kadam <sagar.kadam@sifive.com>
> +  - Paul Walmsley  <paul.walmsley@sifive.com>
> +
> +description:
> +  On the FU540 family of SoCs, most system-wide clock and reset integration
> +  is via the PRCI IP block.
> +  The clock consumer should specify the desired clock via the clock ID
> +  macros defined in include/dt-bindings/clock/sifive-fu540-prci.h.
> +  These macros begin with PRCI_CLK_.
> +
> +  The hfclk and rtcclk nodes are required, and represent physical
> +  crystals or resonators located on the PCB.  These nodes should be present
> +  underneath /, rather than /soc.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sifive,fu540-c000-prci
> +    description:
> +      Should have "sifive,<soc>-prci", only one value is supported

Drop description and have 

    compatible:
      const: sifive,fu540-c000-prci

> +
> +  reg:
> +    maxItems: 1
> +    description: Describe the PRCI's register target physical address region

Drop description.

> +
> +  clocks:
> +    description:
> +      Should point to the hfclk device tree node and the rtcclk device tree node.

s/device tree node//g

> +      The RTC clock here is not a time-of-day clock, but is instead a high-stability
> +      clock source for system timers and cycle counters.

Better to have:

    clocks:
      items:
        - const: high frequency clock
	- const: RTC clock

Can you add clock-names too? Making it optional is OK.

> +  "#clock-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - "#clock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    //hfclk and rtcclk present under /, in PCB-specific DT data
> +    hfclk: hfclk {
> +      #clock-cells = <0>;
> +      compatible = "fixed-clock";
> +      clock-frequency = <33333333>;
> +      clock-output-names = "hfclk";
> +    };

Add a newline here?

> +    rtcclk: rtcclk {
> +      #clock-cells = <0>;
> +      compatible = "fixed-clock";
> +      clock-frequency = <1000000>;
> +      clock-output-names = "rtcclk";
> +    };

These may not be necessary either, just have the clock-controller node
reference phandles?

> +
> +    //under /soc, in SoC-specific DT data

Don't think this comment is necessary.

> +    prci: clock-controller@10000000 {
> +      compatible = "sifive,fu540-c000-prci";
> +      reg = <0x10000000 0x1000>;
> +      clocks = <&hfclk>, <&rtcclk>;
> +      #clock-cells = <1>;
> +    };

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
