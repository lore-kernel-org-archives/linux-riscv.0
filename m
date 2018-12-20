Return-Path: <SRS0=M4pA=O5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5A2C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Dec 2018 21:31:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85188218FD
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Dec 2018 21:31:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tOTCTAef"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85188218FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5UOBRRFYcwxzi1Ze9T32CwkUk504dhyk4EeAvx+J2U=; b=tOTCTAef5IRI4D
	QEXZWfSLgSdkV7Nv46U/NtiQL81dj7JgbvULpNl+Y8lrKcVZlE4uRxk3ypQBJ5Iqu7ryaiSLx/Ooh
	26jGlEPjRV1cb/HIMfQqsq0KF0LTHCSOXkj15eCzzrgECKIaVHVRXYJnOrNyPEPRtKdLOObII7bVX
	swynVkz+26a+3Gx+AuxpQUnxEayvO2G4T/5BnGbqOYRmlW/KjpCFWIZoCLgJzNWLi0XHmQDZmt9hh
	ewzlMLtSflklws+4GXKPE06vPz0A6uuNt6jUBK2/FvW0uYuEWhxX7X8JSfVrSHFNhfxd2l5CxE3Rg
	Yx59AviiPADHFgfeOAIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ga5ur-0005cC-FJ; Thu, 20 Dec 2018 21:31:37 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ga5uo-0005bG-Ve
 for linux-riscv@lists.infradead.org; Thu, 20 Dec 2018 21:31:36 +0000
Received: by mail-oi1-f193.google.com with SMTP id x23so3139859oix.3
 for <linux-riscv@lists.infradead.org>; Thu, 20 Dec 2018 13:31:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gf+h2AhWr0ZeBTfaM0rmwldFKBNFrJgqCEN8pBT818o=;
 b=QSE6F8YfZmn7E1gv0owNzqUOo/e8i3RyxnIfjV/COl0sjzRtAeceu9FD5C/kGkeA9A
 96mAKPrrTsgKx3DravA5DBBjKpZH4az5599zFClPAdyxEPlGvN184BqchIuzuWoe+0yj
 DH7mZdM736ktAMzJvSrnO7tikAJzXbP+upQb9ZKsCgGRc2PGw/VRIVgt8KSQdGY/saQp
 0vPXqsTBje9XUtswAdSR8so7wNjBsA8o34l1Ls5n3oMQwySEHOdF5cgmavAtyYGp8wyv
 asgvQ5aBybhd+BR5tQ8RqdD/zs8O29G9Rtajik1o/s1eZRkItCx6EVRcXuRRtqaSd/77
 PSNA==
X-Gm-Message-State: AA+aEWaWTKqgVtsYFxnJxi82p3ZsGZEfHcBUsd4Gak8yJjNA1c1FtqmJ
 ThDR8BXJdL2cUj3vpNpTpA==
X-Google-Smtp-Source: AFSGD/X+eQWYNul+hjHdxrIEy4EuRkOivVA+V0BovFnLtSLVvyZgdKknXjRvl2baVbKiD5kjxknw2Q==
X-Received: by 2002:aca:ad53:: with SMTP id w80mr262988oie.148.1545341483984; 
 Thu, 20 Dec 2018 13:31:23 -0800 (PST)
Received: from localhost ([2607:fb90:1cd6:97bd:49af:e73e:5a36:3b50])
 by smtp.gmail.com with ESMTPSA id c78sm16608450oig.30.2018.12.20.13.31.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 20 Dec 2018 13:31:23 -0800 (PST)
Date: Thu, 20 Dec 2018 15:31:20 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 7/7] riscv: dts: add initial board data for the SiFive
 HiFive Unleashed
Message-ID: <20181220212618.GA27359@bogus>
References: <20181215052154.24347-1-paul.walmsley@sifive.com>
 <20181215052154.24347-8-paul.walmsley@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181215052154.24347-8-paul.walmsley@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181220_133135_017316_512FB7BF 
X-CRM114-Status: GOOD (  17.78  )
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
 Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Dec 14, 2018 at 09:21:54PM -0800, Paul Walmsley wrote:
> Add initial board data for the SiFive HiFive Unleashed A00.
> 
> Currently the data populated in this DT file describes the board
> DRAM configuration and the external clock sources that supply the
> PRCI.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: devicetree@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> ---
>  arch/riscv/boot/dts/Makefile                  |  2 +
>  arch/riscv/boot/dts/sifive/Makefile           |  4 ++
>  .../dts/sifive/hifive-unleashed-a00-fu540.dts | 39 +++++++++++++++++++
>  3 files changed, 45 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/Makefile
>  create mode 100644 arch/riscv/boot/dts/sifive/Makefile
>  create mode 100644 arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dts
> 
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> new file mode 100644
> index 000000000000..dcc3ada78455
> --- /dev/null
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +subdir-y += sifive
> diff --git a/arch/riscv/boot/dts/sifive/Makefile b/arch/riscv/boot/dts/sifive/Makefile
> new file mode 100644
> index 000000000000..e120ccf5649c
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sifive/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_SIFIVE) += hifive-unleashed-a00-fu540.dtb
> +
> +
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dts
> new file mode 100644
> index 000000000000..0c6afabe69e3
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dts
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: Apache-2.0
> +// SPDX-License-Identifier: GPL-2.0-or-later

This should be a single line with: (Apache-2.0 OR GPL-2.0+)

> +/* Copyright (c) 2018 SiFive, Inc */
> +/* See the file LICENSE for further information */
> +
> +/dts-v1/;
> +
> +#include "fu540-c000.dtsi"
> +
> +/ {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +	model = "SiFive HiFive Unleashed A00 (FU540-C000)"
> +	compatible = "sifive,hifive-unleashed-a00-fu540",
> +		"sifive,hifive-unleashed-fu540";

SoC compatible should be here too.

> +
> +	chosen {
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0x1f 0x80000000>;
> +	};
> +
> +	soc {
> +		hfclk: hfclk {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <33333333>;
> +			clock-output-names = "hfclk";
> +		};
> +		rtcclk: rtcclk {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <1000000>;
> +			clock-output-names = "rtcclk";
> +		};

Are these the clock inputs to the SoC or dummy clocks until you write a 
proper clock driver? If the former, they should be at the top level. 

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
