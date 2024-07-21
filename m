Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE31C3DA5D
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Jul 2024 22:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=689RgHl9IHTEbW+YaIAdTqmfGQx0xWp8DMIxZ08agpE=; b=XNPPqNNtQEITXPg+HC04GYAcUk
	yInYCHfKX2pxJZLv7B8Rk/lpssKRmtE2Q+wKmrvVsWfLqjhnsXHGw0jIbPRCdZew0QQOlgpFbEzW6
	whkF39jaK8AhmAgj6G7FXOTRp2+9XGo1CnOsM6XQysx5J5cRQxLDLQkjDLuJFxXTnLTj9FYIRDkQX
	+Ueu3vRRyNUwukYhcCD0Q35hF+H/rUV5jYF2vyO1qMiR1kdKttDx7JRbe+26N6y8p8eHAyjTfnxIp
	q+9wYx4URYAGNtZd/urkAKv2gDsmHGL11MrUepK203fuPZAmBRFfZDVdlmkQ/KjhR4jWKxERhfb5a
	04AgCkeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVeiu-00000007eRl-2hfT;
	Sun, 21 Jul 2024 22:08:08 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVeiq-00000007eQt-3JdK
	for linux-riscv@lists.infradead.org;
	Sun, 21 Jul 2024 22:08:07 +0000
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CD9A23F2B8
	for <linux-riscv@lists.infradead.org>; Sun, 21 Jul 2024 22:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1721599679;
	bh=y5sr3lEv07by+NAwwOdiyaM6+TTZ7xKpJ82kUwR7sbg=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=V7j03+qrzYXaO6hBgVfXmic6Zbzm3///tcOWb6pDfrgs73AqiSADzcTS6b3H87zBK
	 3rqZdGtK/CLc7xLQOzOS2cR74fGNMNKIdwDrzAjwEtSzvxjaxpNbmUzItGFEkFaq2G
	 J7pZzT5cUcwqILOp6FRWf7s1fZr78fRXzodT4oZwHy4/gKbBBKKuomAgRMxFLNCIlr
	 1yIllrdAHyua7gn8OH10yUf0TUlwbFtoq0KKHpQgNqZf96nwFCj7nGoPc1zH5eCvRT
	 ZBO/n5Q7OlYBuaZiZkHrasKsP3USAyBSxj7+d/voC5NWrMcRNxKvSx4ZUdUvTG5B2k
	 pOyf89EL2rznA==
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3daa9f23fc8so3913390b6e.1
        for <linux-riscv@lists.infradead.org>; Sun, 21 Jul 2024 15:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721599679; x=1722204479;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y5sr3lEv07by+NAwwOdiyaM6+TTZ7xKpJ82kUwR7sbg=;
        b=Rd6dVXU7eeQLkb5HMhcVjrcxhVMDclwPxiZ0Nrpk8SV8juH6ooWAM9jbx3mkwSEMpA
         ASWAoOSqGv5dGHxjPbhK/MAAM+e1e2ZrxD7BeTj5vJ/C+v3oukPL5mS0e9R+UyDs8Qph
         DiYK3uiCM7LQiJTwpCR7Z81JDjHo5/VLPG13hVSndwd6QH2lO0EMmNSW4QYd99GU7M8n
         lMEAs7A/JM8Q3sxZ18GJtdp27GLtYeeX0XSgBbROCLvn/WsWtouGX97mAi2yqyLB14Do
         4E01b1O4ZRevwz0HeMZdwtnpYqrivcQeQvR6k3BZ/PkwWbNzPLUoQSfJbDwfbEneiaVH
         Th6g==
X-Gm-Message-State: AOJu0YwfVADF3xQrbUADb6kbSc5rp2vyzTuysJkM/lVbP1pFjQkVWpl2
	oS+jga8xNxYbd5COo9cZwba5Zjv5prOOpHj/oYMWKRqYdLR+fqhSIor8c3UFvysZm3r8ZeCCouO
	jxjNzvzBCQniD5fmc8QVVpK2sP8Nj9VUgvCdHDV9+R4JU8V2x6kJtfxt5Oc5N+0TP180B2st20o
	A28X3WGmjkX55Ve0ZafJwC3pcOP5na8C1kHUYCwV3BgrDsNC2Lot1Jdkb/
X-Received: by 2002:a05:6808:2384:b0:3d5:2e2f:bf9 with SMTP id 5614622812f47-3dae5fd6b6emr8114722b6e.30.1721599678742;
        Sun, 21 Jul 2024 15:07:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKu3rxDjbynntjHH+0+p7b3ltQUv9i7hhvrMnwR7SAjBoMSrD4QUg9VCnWIvxOUrarV5om39CY87FNWsSBz4A=
X-Received: by 2002:a05:6808:2384:b0:3d5:2e2f:bf9 with SMTP id
 5614622812f47-3dae5fd6b6emr8114702b6e.30.1721599678304; Sun, 21 Jul 2024
 15:07:58 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 21 Jul 2024 17:07:57 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240711-th1520-clk-v3-3-6ff17bb318fb@tenstorrent.com>
References: <20240711-th1520-clk-v3-0-6ff17bb318fb@tenstorrent.com> <20240711-th1520-clk-v3-3-6ff17bb318fb@tenstorrent.com>
Mime-Version: 1.0
Date: Sun, 21 Jul 2024 17:07:57 -0500
Message-ID: <CAJM55Z8uo-Z_9ruyqygK1pbBCTkCxMBVoF8GD2dajhTKOYrAfA@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] riscv: dts: thead: Add TH1520 AP_SUBSYS clock controller
To: Drew Fustini <dfustini@tenstorrent.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240721_150805_107267_7B18F78E 
X-CRM114-Status: GOOD (  12.68  )
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

Drew Fustini wrote:
> Add node for the AP_SUBSYS clock controller on the T-Head TH1520 SoC.
>
> Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
> Link: https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index d2fa25839012..10a38ed55658 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -5,6 +5,7 @@
>   */
>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/clock/thead,th1520-clk-ap.h>
>
>  / {
>  	compatible = "thead,th1520";
> @@ -161,6 +162,13 @@ soc {
>  		dma-noncoherent;
>  		ranges;
>
> +		clk: clock-controller@ffef010000 {
> +			compatible = "thead,th1520-clk-ap";
> +			reg = <0xff 0xef010000 0x0 0x1000>;
> +			clocks = <&osc>;
> +			#clock-cells = <1>;
> +		};

Please add this node so nodes are still sorted by address.

> +
>  		plic: interrupt-controller@ffd8000000 {
>  			compatible = "thead,th1520-plic", "thead,c900-plic";
>  			reg = <0xff 0xd8000000 0x0 0x01000000>;
>
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
