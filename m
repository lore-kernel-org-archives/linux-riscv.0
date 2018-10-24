Return-Path: <SRS0=/L7I=NE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADAF6ECDE46
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 18:48:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EC02207DD
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 18:48:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fvfby3VU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EC02207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1YKjWRLxAz7JRydpqkkHhyN5GCPu7OygVKW+uL5gWOg=; b=Fvfby3VUph6K4i
	///FFw95IS25HWe8PLqDOiocQYNVsmuEHl4B8lQN7SRDWLx8qj3CWM3R5N/BvSOsdWYEffMEYkeZM
	uw1H9iddRBM7EblvNoHE9GDgZerGuhBg4IEstsV1I7VDwrJMhK1BsKsphok5Y0UyAXwaPmD2jp9XX
	G3G5O6NoLhdTkkH7zDYEDx47gIodkG/n0wf6Nnc2Ij94vgJIfZnRNyw/JOkyTMGJybSXtIRz2pMWP
	evR/SfIykAOalSrcI9f5eK6oYpiK9mDk1NInJuugR5lzMaMrSJCNn2fjy5ud8EgUJOQABR414ESkL
	xILB6PXxKoz2niPs7LQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFOCV-0002XE-5j; Wed, 24 Oct 2018 18:48:15 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFOCR-0002VO-3t
 for linux-riscv@lists.infradead.org; Wed, 24 Oct 2018 18:48:12 +0000
Received: by mail-oi1-f196.google.com with SMTP id 22-v6so4974432oiz.2
 for <linux-riscv@lists.infradead.org>; Wed, 24 Oct 2018 11:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1NkZzFYRgsDElNM8ngsz3f1bKhIZ4R18HX8fVURc9Ew=;
 b=MODQTCTanxRWtJpzdxB3UkxoJ29O7/rlTRkTwGoOzpilNSGLRZdzLDsT7HIPYHfj7d
 JTs3Y/14mWq5t4OEWZZ+bDKxr7yQMQYAAP1I7D2mkqHMX9ab1HCAPV5NRBaJWhFlYe+u
 yF+mD/UuPy+JIVa2mgpdvrw/bBgjHQ0kG9tNT+YIDWAI21pJmbeUdA9eqXc69l+vr0Sf
 o3PNdiHvHlKpRVzuxZ9hZTCi2+/6A0JznoXx+E8ZiGzYvWJd7+bJa/lRSKoJDzWnxjTo
 070s5Mi8TtiBakwXmvAgqsFDvL3Yd2PnmRQw1ZUXsdnqcJiLSRFpawyAIs+FuGA73RcM
 3M3g==
X-Gm-Message-State: AGRZ1gIv1cZqn29HWZhp2fAKDhV4wFJ0EF5fBAx0iiRpfdu3oufSaOUx
 YT6hyJXr5AsS0mtoE8DqAA==
X-Google-Smtp-Source: AJdET5fux4XPLGuA8vGYCGLj5kkpNTZgVuD/Kj/M5cpcVy6/8qyvhcynoqfT+Iuc2GuaPQ99A/Fw2g==
X-Received: by 2002:aca:c743:: with SMTP id
 x64-v6mr1942668oif.139.1540406879532; 
 Wed, 24 Oct 2018 11:47:59 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q16sm1677072otf.35.2018.10.24.11.47.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Oct 2018 11:47:58 -0700 (PDT)
Date: Wed, 24 Oct 2018 13:47:57 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: clk: add documentation for the
 SiFive PRCI driver
Message-ID: <20181024184757.GA22367@bogus>
References: <20181020135024.28573-1-paul.walmsley@sifive.com>
 <20181020135024.28573-3-paul.walmsley@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181020135024.28573-3-paul.walmsley@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181024_114811_201603_15AE7961 
X-CRM114-Status: GOOD (  21.06  )
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
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181024184757.ibTOFw3A37PCtqzemrfJdy3sZDHMrvvqLI8YIWewvFA@z>

On Sat, Oct 20, 2018 at 06:50:23AM -0700, Paul Walmsley wrote:
> Add DT binding documentation for the Linux driver for the SiFive
> PRCI clock & reset control IP block, as found on the SiFive
> FU540 chip.
> 
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Megan Wachs <megan@sifive.com>
> Cc: linux-clk@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> ---
> v2: remove out-of-date example, add documentation for the compatible
>     string and for the required PCB clock nodes
> 
> .../bindings/clock/sifive/fu540-prci.txt      | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
> new file mode 100644
> index 000000000000..d7c1e83fa5ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
> @@ -0,0 +1,43 @@
> +SiFive FU540 PRCI bindings
> +
> +On the FU540 family of SoCs, most system-wide clock and reset integration
> +is via the PRCI IP block.
> +
> +Required properties:
> +- compatible: Should be "sifive,<chip>-prci<version>".  As of the time this
> +              file was written, only one value is supported:
> +	      "sifive,fu540-c000-prci0"

What happens with this depends on the discussion on the other bindings.

Though here you are inconsistent without a fallback. Of course, I've 
never seen a clock controller be the same across SoCs.

> +- reg: Should describe the PRCI's register target physical address region
> +- clocks: Should point to the hfclk device tree node and the rtcclk
> +          device tree node.  The RTC clock here is not a time-of-day clock,
> +	  but is instead a high-stability clock source for system timers
> +	  and cycle counters.
> +- #clock-cells: Should be <1>
> +
> +The clock consumer should specify the desired clock via the clock ID
> +macros defined in include/linux/clk/sifive-fu540-prci.h.  These macros
> +begin with PRCI_CLK_.
> +
> +The hfclk and rtcclk nodes are required, and represent physical
> +crystals or resonators located on the PCB.
> +
> +Examples:
> +
> +hfclk: hfclk {
> +	#clock-cells = <0>;
> +	compatible = "fixed-clock";
> +	clock-frequency = <33333333>;
> +	clock-output-names = "hfclk";
> +};
> +rtcclk: rtcclk {
> +	#clock-cells = <0>;
> +	compatible = "fixed-clock";
> +	clock-frequency = <1000000>;
> +	clock-output-names = "rtcclk";
> +};
> +prci0: prci@10000000 {

clock-controller@...

> +	compatible = "sifive,fu540-c000-prci0";
> +	reg = <0x0 0x10000000 0x0 0x1000>;
> +	clocks = <&hfclk>, <&rtcclk>;
> +	#clock-cells = <1>;
> +};
> -- 
> 2.19.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
