Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA65CA5FA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 22:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yioyp5bDXyKBuN+mfSkL0BFqf4fzNFhgW30CZ/+/CKk=; b=L3jhQ7IHx6YuBF
	0TRDUruuXOWI+fidbrynvuLyNqWEXuKddYvw6Ad3XI1/DZrhsnf4SlSd7e0nEhxLolnol37X7lcAI
	KxuKrCoHSr4EVGOCzecaWCBhy9t5QxeKiHqU+guuPGtOuZ9MO2eM4N2PI2NdyYVg/eLPr51rzBsh4
	aeJgIryTMOYm8b7z4rCMg5sCnIoOxHzXsSjrUT2D+RkBG3yTUBnRL/pnhUjzi4uTlSUJNwHppyOLt
	fT23b5g/nDWbCeo+v9uOdRlakrN3RFMJyvX8x7MQXyj0Yjm0RLDmfEwN/dBuBMm9j4UhG0xwIl0CG
	dCTKI+A7rvm2ZtwOE2xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBgTW-00000004ifF-0q7x;
	Tue, 29 Sep 2026 22:39:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBgTV-00000004if1-2GLF
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 22:39:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7344D600D4;
	Tue, 29 Sep 2026 22:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE3A1F000FF;
	Tue, 29 Sep 2026 22:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790721540;
	bh=Tui9/2fNizQMJViOJ/jcDTiMpXk/WgbdMbC6Oe3y1U4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KZiih5CJsFaqq/I60AsDf6L72WDBP7Rj8aqyGWyCHw4svoG9p8VOocWBSCbpsQEpW
	 JV0teRJCN+RqsWsMvzwl74GWrppIVqLJBl7KAqbWoWAmMxVI/WZYlW4awmjgKfuby3
	 VGKw0oNg+2LD/mwh2jVMIfq9yCHxfbXAZQwtc3cvu9d+AeO8BhGai3r2qf+zgMa4YX
	 YPy5Uun65k1g+XuzyNrWRh4m3mntUNx455zvaTUE4Q6sWBd2KL1NJiv4g/xNUZBEU6
	 P9QI6iobASrVULKLwnQqAz0R7N0EMTivfnv5qh3cYCDvmAhjLrIGVBOj6ifNjcRGqA
	 DIcILCbEpfU/g==
Date: Tue, 29 Sep 2026 15:38:58 -0700
From: Drew Fustini <fustini@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] riscv: dts: thead: enable AP6256 Wi-Fi on Milk-V
 Meles
Message-ID: <arw-AtrtmdkicuBs@thelio>
References: <20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn>
 <20260929-rv-meles-v1-3-effdd14a76e8@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260929-rv-meles-v1-3-effdd14a76e8@iscas.ac.cn>
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

On Tue, Sep 29, 2026 at 06:22:47PM +0800, Han Gao wrote:
> Connect AP6256 to SDIO1 with its fixed supplies and PMIC LPO clock.
> Use GPIO0_20 for WL_REG_ON and GPIO0_21 for the host-wake interrupt.
> Keep GPIO1_24 low to select the external antenna by default.
> 
> Use the existing BCM43456 binding and the 198 MHz board limit.
> Keep module power during suspend and assign mmc2 to SDIO1.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  arch/riscv/boot/dts/thead/th1520-milkv-meles.dts | 93 ++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts b/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
> index 3714047190789bfccd8ff6810342d7ff865e74e4..92b44cb90f57f4830efd29145744c005afa73119 100644
> --- a/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
[..]
> @@ -206,6 +249,26 @@ rx-pins {
>  	};
>  };
>  
> +&padctrl1_apsys {
> +	wifi_enable_pins: wifi-enable-0 {
> +		gpio-pins {
> +			pins = "GPIO0_20";
> +			bias-disable;
> +			drive-strength = <7>;
> +			input-disable;
> +		};
> +	};
> +
> +	wifi_host_wake_pins: wifi-host-wake-0 {
> +		gpio-pins {
> +			pins = "GPIO0_21";

This node needs function = "gpio". It is interrupt-only so nothing
selects the GPIO mux. I can fix this up when applying to save a v2.

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
