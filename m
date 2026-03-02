Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD2DE9B37D
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 13:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ran1b0VZfsRt6huRyRhQB/ukHwdcB7s1Kxm1qKP7B9w=; b=EoR0Yh/Gu0TIP2
	HnYef/uirocgFyJp1llfsz7OuNuzC1Jm3fU6ULnFf/WAXqFXk98KRakKyIyx33Mdj1K/1cEdYJdFK
	r/Bxpg0/TVKyRG5V3wmdea8nr51+QEJz7EWl5jomf6wfDmd1jQ6UlBcpM3q1jON/Ei1TdMWnIH/Ia
	2tRGCa57XW+I0bAiGY1Y9cQrRulJVxz4iJbT7RU0xpoO8lt2NjhldNK31/mSJ57QjANj4+pWpsOV1
	vg34wBQAidDxX6/B7JGLyRmgWOpzeuh5SpVpizMxHdmSXDIztr+b3QfU6pUJ9Yv2yTbSxtoiBoiEo
	/WA/9L7H4XaFrsxnGOIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx31K-0000000D4AN-47uL;
	Mon, 02 Mar 2026 13:09:11 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx31H-0000000D49L-0wny
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 13:09:09 +0000
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EE1D64018D
	for <linux-riscv@lists.infradead.org>; Mon,  2 Mar 2026 13:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1772456942;
	bh=/ECnSn+s6d8RzhavbIFJQEnGNDdcB3vQZ0KecCsizik=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=I49+4W+Ab2x+4ZdPUFs9STW9xcFgMw8YgZgl8zxAIbTWXOdvF0wfhvEZ/MxTdIzRg
	 K/md4a3aLpI/F9LYncSvlnHi2BUXprfB7g2B4+NbcQK8AWmDL7Wv1MdhZBDzx5+Bhd
	 KLn9tfiIg9BBHsWkqpIkQPGArAnE+sJRhA7/MhwMnbVPOpAuz9bBnl0AZcx0byDrRR
	 Nkfr6V5usv4p7KzItQvE1hKGHeu87zIW7tZG5rzvmYOvGZT7T1Icyz4m0fdexBS8wQ
	 /SEEB7Ppk42UUx0UxfgGZY+PVmP/35dkFuEa3QJmRuytNXSBArv74HQhYqHs+L/fdI
	 ZuIhidBmppOcMpK4cQvxqzRxtTUWgeHTe+RJLeyDw2XXlLLJEMTwBuXIlvEKhhSI7X
	 ifjtKO0v5ovCTkUKf/i5rx+umDz6aY4ytU4e0Rq2SYu4VUWC3/4RuZdRO+mDWRmza0
	 +OF9Rc7TwR9utGrIDSJSCG5Rf9bTOI1dv6BQmUxTgnvRw/radfJeLdM7nBEAlCApV5
	 YP9WYPUUAzRulEE0lrTOpDpZdV40JJSLgXrcIuNBhRO2mUFda1uUEGmiZP8etWrZ0u
	 Msp5OX0wCrHsRTPMe5vgC+UcvrfcPPpsA6pHGD4SzLygD1ja4k43i7G1j5HO07IOMR
	 jBNQpyPH0gNcGbH1I9v3M6Ac=
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b8f5bce308dso420837366b.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 05:09:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772456942; cv=none;
        d=google.com; s=arc-20240605;
        b=T6Qx9cHnZk2f3MVqNXLEA+uB646WCiI/xdD9my3JRDKIC8wrQFGDgToEhsmZJ1i5Hz
         XX5b5f8zY7Y89EY3nggfau+MlQkuJJX3Xw1d4VNhWIiHcTdf6V/mPaYnJqxaPC7YtDdJ
         qjjZEBI1YmA0Eaa7t3AYmqETvlIojIQAq61B9gWgTa+rURkvtF9+cLUNHhkCU0TSuBqq
         bF2DIEQlxoHb8rWIxnG3Ux+fN2bq0xqeXGkAxkI1CarD0vOD1ZfaHAVesPb9vqelIrqa
         xnt5rk3+M4Mj19JJJ0u4VwYBAgrdZthtgPBkLv41VYNe+gEkSfV5EZufo/MqvPwS4ypB
         +Nvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version;
        bh=/ECnSn+s6d8RzhavbIFJQEnGNDdcB3vQZ0KecCsizik=;
        fh=BX13K7n7Uz1jvpLjQiS+123wi8Zq/+lP0NYuV7nS6pM=;
        b=Rv/s7Zf8QQyvMkQCIn5fDxxiTOCquLXxn7fSbgHY7U++DQYQpdAGBZsVzcTxFfx1sr
         78mPicC9CIKQTYjm8CzAGf8ASkosFmXfE0Wk6BE2XlRj6ErdE0cmfVeJBhJcnX7ZdrRl
         HRggDXiqn7Z5QWqGjrbXDJLlAZa5UCvmAtPrg83h8I0IciWYVAVmxdR5PDo5rhvsA11H
         Jx6Hi38hoZh5YiUU2eOspAIHL+1v+OveKHB2uVB4abaVktMDUshl0WwRfI5boDIIdUPF
         421rcrVDGqSGDOt2TDEUGCz9nStD0mdqM+wzA6AIcW8bzHTd4j/YNIbGnCivl5cdxc2t
         JvmA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772456942; x=1773061742;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ECnSn+s6d8RzhavbIFJQEnGNDdcB3vQZ0KecCsizik=;
        b=qczf/EyYGDt+G04JNDxQvIv7N4PEshAi+doQcbvga4wMiuV2Yu5KAYo770vVHmYwm4
         kkmTCsZNAbV/PTjzeOv6GH2a8DqJIIYpEZShdrkjLaI9jebY1Nn+rZkf+8i8lXNHBweg
         6K0CxfL5WETOEnbbqLvL+4x3niy+5NoWdfyzVZLSCb07dvLvjzn5ACKZblz+P3inB4H5
         KpiXQSqm13MOF4/NENi2+tWxcXAD/OeGKdvvguRBpInl1BUyS3j4PHnp1AUfdvc4DfNX
         9Q5Om6zPuZvMi8jdqYYZwsz5DBONOrms/2+loBgN15a4mH0MbAgJd3n0GTAQcobtWpAY
         GfjA==
X-Forwarded-Encrypted: i=1; AJvYcCUOBG1qjfYT/66FIK+kFUJN4OiRM2rCkP4kBrjN/+bxJM8iO8Z293Tir0T5DIQniPKm5u4FlWofC7o/3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn7r0BaU311RnOZpNILULbt3jENmESl7EHKLSL5uoU/X+tIrku
	hp9U70orH+Y9HAiMK7za5wtwE0xy5QsIsULCRCgFX019KZJzo15DDixXaOLzYaG7+pwNSVYQzG+
	Q4feM+W3KQQxCvri/r6NNmkaMI2MT83JFeUrwfoXmh/cDhSA50D9O512t7U1LcPIMm5TleCOp00
	xAwzLLEVxFweNPgskoAdid6huk8D5q+h/CHLnLoWOJ5aUG0VBSZ0ZVpr7go8wn
X-Gm-Gg: ATEYQzzwALdHBET66MQcwiHLb4zv6f2byqsQffeEotuZHdeRxLgB8timNTcNoX8Ue1b
	JMrCeV5jofZw237wWxoI5f25fV1oBsYFOLx54ngqLvkdU+YgSToyxgqyKEP1Zp3qe7oA23Psec+
	sgf13rv//9hiKGBUmqqTNNZz84islPvHy8hG0azrek/rVh1QtCwQTt//56VoGzOIzQyRC1Soqd2
	fzE
X-Received: by 2002:a17:906:9fc8:b0:b87:efa:8786 with SMTP id a640c23a62f3a-b937657d99fmr789097066b.55.1772456942116;
        Mon, 02 Mar 2026 05:09:02 -0800 (PST)
X-Received: by 2002:a17:906:9fc8:b0:b87:efa:8786 with SMTP id
 a640c23a62f3a-b937657d99fmr789091166b.55.1772456941578; Mon, 02 Mar 2026
 05:09:01 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Mar 2026 08:08:59 -0500
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Mar 2026 08:08:59 -0500
MIME-Version: 1.0
In-Reply-To: <20260227075718.2243818-1-inochiama@gmail.com>
References: <20260227075718.2243818-1-inochiama@gmail.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Mon, 2 Mar 2026 08:08:59 -0500
X-Gm-Features: AaiRm52b-jdW2UNX8CSDWuKrreJ-aGAWnKXn668LfKMnXa2Ks1b4qAF3c1WKw8E
Message-ID: <CAJM55Z_soPhC9P03edfq_A-GN07PbGqu31aHgE_5kKhkQwkMmQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 0/3] riscv: spacemit: Add ethernet support for K3
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Choong Yong Liang <yong.liang.choong@linux.intel.com>, 
	Conor Dooley <conor+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paolo Abeni <pabeni@redhat.com>, Paul Walmsley <pjw@kernel.org>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Richard Cochran <richardcochran@gmail.com>, 
	Rob Herring <robh@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <me@ziyao.cc>, Yixun Lan <dlan@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_050907_553958_57335258 
X-CRM114-Status: GOOD (  19.61  )
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

Quoting Inochi Amaoto (2026-02-27 08:57:14)
> Add initial support for ethernet controller of the Spacemit K3 SoC.
> This ethernet controller is almost a standard Synopsys DesignWare
> MAC (version 5.40a). This controller require a syscon device to
> configure some basic features, like interface type and internal delay.

I don't know how we can accept this when it can't be tested since it still
doesn't come with the device tree nodes. If you don't want it to be part of the
series, just share a tree where this code is working. There are plenty of free
public git hosting sites available.

/Emil

>
> Change from v4:
> - https://lore.kernel.org/netdev/20260130022705.1059214-1-inochiama@gmail.com
> patch 1:
> 1 Apply Rob's tag.
> 2 Adjust clock description according to Russell's suggestion.
> patch 3:
> 1. Add set_phy_intf_sel() and get_interfaces() hook, suggested by Russell.
>
> Change from v3:
> - https://lore.kernel.org/netdev/20260128072931.875041-1-inochiama@gmail.com
> patch 1:
> 1. fix the uncorrect compatible string postion
> patch 3:
> 1. add "CTRL_" prefix to all ctrl register definition
> 2. only use delay config 0 to calculate delay code.
> 3. fix typo in the comment
>
> Change from v2:
> - https://lore.kernel.org/netdev/20260121071315.940130-1-inochiama@gmail.com
> patch 1:
> 1. remove not needed compatible for select
> 2. drop empty line in "spacemit,apmu" properties
> 3. add spacemit,apmu properties to required.
> patch 3:
> 1. remove misused phy_fix_phy_mode_for_mac_delays.
> 2. use local tx clock instead of the clk_tx_i in the dwmac.
>
> Change from v1:
> - https://lore.kernel.org/netdev/20260120043609.910302-1-inochiama@gmail.com
> patch 1:
> 1. remove phy clock
> patch 3:
> 1. improve comment and include something special about Spacmit K3 dwmac
> 2. reorder the included file
> 3. fix wrong delay macro used in spacemit_dwmac_set_delay.
> 4. add check for maximum supported delay.
> 5. use DIV_ROUND_CLOSEST to calculate best delay configuration.
> 6. use assign for the ctrl register initial value.
> 7. fix input when calling of_property_read_u32().
>
> Inochi Amaoto (3):
>   dt-bindings: net: Add support for Spacemit K3 dwmac
>   net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
>   net: stmmac: Add glue layer for Spacemit K3 SoC
>
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
>  .../bindings/net/spacemit,k3-dwmac.yaml       | 103 ++++++++
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>  .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 226 ++++++++++++++++++
>  .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
>  6 files changed, 345 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
>
> --
> 2.53.0
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
