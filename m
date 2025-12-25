Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73BEE784A6
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Dec 2025 07:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W5vRxCIANuaZ3NuORUcbkKqHeAkMKK4Uihfkhf43Rv4=; b=vz4NEp6OUAfL0u
	lEIE8cIACVlg045EyO2jxZ4gJvwONFzmceXePs5OuThRFpt2I3CyFF3lUJHjrwsjba2r/TlKrXvln
	Ho7FJweBWYgqaUj4JRwcseoShBUCqRgHyU1LpxF6B1N+RvWp3s5VQ6P/RElgTxl6JxsmM4APtrMqM
	p7sTxx7qjAG4FPRbSwbAY89hPjdNgVDV7fCxiw2lPNMfBvT2g3K2tzMU3XpwUK4Vo3TzaPnvacXy+
	/Y7p6kQ92r8uoYKVjk1+AlqUrmjw960XCm8ClvtUP2+ThVWoWf5vXA5P9iSDO/SKjl1skQBd66Kgg
	XvJaoYDHO/MIT4GtEvkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYfWG-00000000AC2-0QHx;
	Thu, 25 Dec 2025 07:12:20 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYfWC-00000000ABh-07g2
	for linux-riscv@lists.infradead.org;
	Thu, 25 Dec 2025 07:12:18 +0000
Received: from duge-virtual-machine (unknown [223.160.207.251])
	by APP-03 (Coremail) with SMTP id rQCowADn_tWg40xpZeHvAQ--.12506S2;
	Thu, 25 Dec 2025 15:11:31 +0800 (CST)
Date: Thu, 25 Dec 2025 15:11:27 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Yangyu Chen <cyy@cyyself.name>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 10/11] riscv: dts: add initial canmv-k230 and k230-evb
 dts
Message-ID: <aUzjn3XHJTSl3vY9@duge-virtual-machine>
References: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
 <tencent_DF5D7CD182AFDA188E0FB80E314A21038D08@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_DF5D7CD182AFDA188E0FB80E314A21038D08@qq.com>
X-CM-TRANSID: rQCowADn_tWg40xpZeHvAQ--.12506S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKFy5Kr4xuFWkZFWUXw15XFb_yoWxtwb_Wr
	1fuw4FkF4DCFyIka4DZws5JF1fA3s7Cws8tr9xXrn7Xa4kXF1DCr1jv3yDXr4rA3ZxKFs3
	tFZxXFs3AFn2gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsxYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_JFC_Wr1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z2
	80aVCY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07jhmiiUUUUU=
X-Originating-IP: [223.160.207.251]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_231216_568846_4495DFF1 
X-CRM114-Status: UNSURE (   8.19  )
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

On Sat, Mar 23, 2024 at 08:12:22PM +0800, Yangyu Chen wrote:
...
> diff --git a/arch/riscv/boot/dts/canaan/k230.dtsi b/arch/riscv/boot/dts/canaan/k230.dtsi
...
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};

The aliases should be set in the board-level dts file,
so please consider removing the aliases.

...
> +
> +		plic: interrupt-controller@f00000000 {
> +			compatible = "canaan,k230-plic" ,"thead,c900-plic";
Incorrect comma separation. It should be: "canaan,k230-plic", "thead,c900-plic";
> +			reg = <0xf 0x00000000 0x0 0x04000000>;
> +			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
> +			interrupt-controller;
> +			#address-cells = <0>;
> +			#interrupt-cells = <2>;
...
> -- 
> 2.43.0
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
