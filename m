Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6808CCA100E
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 19:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LBFo9Ww8eqGN8BB+ZTtHFH6exQ0HZI7qOszzpy1mM40=; b=LkwgFxV/aXhJ6z
	XzdjE9jEqfe3XYTybZO5JuLgeePHshgOXzLxYqK2QFC1UeWa8vulipcyF+0yPC2FY0U/pBN6HMgkQ
	lSD7HBd305fbd9Mh6WFuaokm7Uq/D5AoRt+Fep2JzVgxnnCn1PfHCk4Nlx1Ep86ifF6+0oO6aGEvA
	xDlhxGnZvzX015SwhR9VFXauWexIu3TT4Nwi7mQsYvIpUFH6tvvXkyaz7i83eIgQqyJpNCoOXcmVR
	Q3r/zzz+ob4krRI0ikaHXPSrDwagK7nKgp2skr2RUFV9FlDqSXIxhszVM2ppm1C8P8JV9Q6U+osTv
	IblKX8iR7zK4o8wUpMTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWNT-00000001Z16-44Jb;
	Tue, 02 Sep 2025 19:09:11 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQYV-0000000HSmZ-0zbk
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 12:56:13 +0000
Received: from [192.168.0.104] (unknown [114.241.87.235])
	by APP-05 (Coremail) with SMTP id zQCowAAnf19E6bZoJf+7EA--.3611S2;
	Tue, 02 Sep 2025 20:55:32 +0800 (CST)
Message-ID: <680534b4-27e7-4506-885a-1c3dc9d12b8b@iscas.ac.cn>
Date: Tue, 2 Sep 2025 20:55:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: dts: spacemit: uart: remove sec_uart1 device
 node
To: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250902-02-k1-uart-clock-v2-1-f146918d44f6@gentoo.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20250902-02-k1-uart-clock-v2-1-f146918d44f6@gentoo.org>
X-CM-TRANSID: zQCowAAnf19E6bZoJf+7EA--.3611S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw1rKFWUGFyfGw1DGry8Zrb_yoW8GF18pa
	y7urZ3ArWfAF109FsrXw12krWrtrZYgFyS9F1UCr15GanIqayxKrZ3tr18ZF18Zwn5Aw1j
	gws5Xwn7WF4Yy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07betCcUUUUU=
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_055611_636927_BA58F653 
X-CRM114-Status: GOOD (  11.71  )
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


On 9/2/25 20:26, Yixun Lan wrote:
> [...]
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index abde8bb07c95c5a745736a2dd6f0c0e0d7c696e4..3094f75ed13badfc3db333be2b3195c61f57fddf 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -777,16 +777,7 @@ uart9: serial@d4017800 {
>  				status = "disabled";
>  			};
>  
> -			sec_uart1: serial@f0612000 {
> -				compatible = "spacemit,k1-uart",
> -					     "intel,xscale-uart";
> -				reg = <0x0 0xf0612000 0x0 0x100>;
> -				interrupts = <43>;
> -				clock-frequency = <14857000>;
> -				reg-shift = <2>;
> -				reg-io-width = <4>;
> -				status = "reserved"; /* for TEE usage */
> -			};
> +			/* sec_uart1: 0xf0612000, not available from Linux */

I know this is going back and forth a lot but I don't think that's a
good description of what's going on.

My preference is that we just drop this node altogether, just forgetting
that this thing even exists. But if you do think we want to keep the
information we can drop the clock-frequency property too and change its
status to something like:

  status = "disabled"; /* No clock defined */

Which also silences the warning - disabled nodes are allowed to be
incomplete.

My personal opinion is that I think sec_uart1 and TEE support feels too
theoretical to be worth caring about.

Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
