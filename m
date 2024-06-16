Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A298BC27C53
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jun 2024 22:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xBfMSfyjgbY7FZecRWp+DlDLTY0tm+CsG9NAsQ2uovA=; b=13MIGhp06cAcDb
	fdTD/6Pu+2FmcF0AqVpd59IzmW5GAOVCYipd+ws1SkdKvjNh3J3RqyXctmHU/13vtxNCEuJ/pfI+u
	C+SD1Cu6B3Sbwxb5XxjCGJPatWkydL8DSzmrAIrCneUpkMC9e7VD0tQjN12OnWMIPQJsseDv5o05K
	6sTpZt0JwtYPRyKWpn/daYnrTa4gl/FCbfXpnKkZOmCRIVEL22aYIKi++IfO/eb6szhiKHUt8FfXG
	5tioxfaoYcl2pz/Lm2bDgAfKjtMz9BGphtDKUNI9cDWvGvygZrn6ZyYZF6xnqEwoh3q6RgGV4IaKf
	ZWZkQPOVVLN0eV2WXcMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIyki-00000008TaU-2wJ1;
	Sun, 16 Jun 2024 22:53:36 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIykf-00000008Ta2-3ReW
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jun 2024 22:53:35 +0000
Date: Sun, 16 Jun 2024 22:53:14 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup.patel@wdc.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 7/9] riscv: dts: add initial SpacemiT K1 SoC device
 tree
Message-ID: <20240616225314.GA3988639@ofsar>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
 <tencent_701082E2DAE48E2FB857316321778D737C08@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_701082E2DAE48E2FB857316321778D737C08@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_155333_913124_BF911021 
X-CRM114-Status: UNSURE (   6.23  )
X-CRM114-Notice: Please train this message.
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

On 01:20 Mon 17 Jun     , Yangyu Chen wrote:
> Banana Pi BPI-F3 motherboard is powered by SpacemiT K1[1].
> 
.. snip
> +		uart0: serial@d4017000 {
> +			compatible = "intel,xscale-uart";
are you sure the uart IP is fully compatible with xscale?
otherwise I'd suggest to introduce a vendor specific one..

> +			reg = <0x0 0xd4017000 0x0 0x100>;
> +			interrupts = <42>;
> +			clock-frequency = <14000000>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			status = "disabled";
> +		};
> +	};
> +};
it's better to also add other uart nodes, I feel it's more complete

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
