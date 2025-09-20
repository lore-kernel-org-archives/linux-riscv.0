Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AB4CAC592
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 02:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cOU+m0WvI7l+1Lp1fFP9b4oQdZZeUEhdCcrV5fwGIlg=; b=r2WldLehQIoSbp
	gy1PFRMIDxyxVbcnE1WyqSRmTBOMWcND5qgV+tiZBnGpp9K1+Csbj3AzI3DuehPSHSTm+1P4kYwE0
	x4v6iAEyuCo0PAZMQN5lt30WB1ILxfPZJubsc/Jz8944QsJqxeaOhyHwVpb7kBa3jWoMinomB0dMk
	fhezoRBPTZ90tuM1/N0opc8DNzMKI+03gAWvhl+87jHChXKiF3f3YWie5TEgK7epc0rcqaoNL/wJP
	Sd0AmSe42Ubtc4z2w/ay3JQKjggmv6c2tcSI3kxEX33wkyeOAJH3OFtXr3SmBrTqiu8j0rjt8M76B
	+XjTA4xJYDXk5iEJrcNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzno0-00000004bOm-2ywA;
	Sat, 20 Sep 2025 02:58:32 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uznnw-00000004bOL-0jdH
	for linux-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 02:58:30 +0000
Received: from [192.168.0.102] (unknown [114.241.87.235])
	by APP-03 (Coremail) with SMTP id rQCowACX54EzGM5obAbXAw--.5582S2;
	Sat, 20 Sep 2025 10:57:55 +0800 (CST)
Message-ID: <50456256-fc9e-4de5-a512-5749b832dc3a@iscas.ac.cn>
Date: Sat, 20 Sep 2025 10:57:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: define a SPI controller node
To: Alex Elder <elder@riscstar.com>, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dlan@gentoo.org, ziyao@disroot.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250919155914.935608-1-elder@riscstar.com>
 <20250919155914.935608-4-elder@riscstar.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20250919155914.935608-4-elder@riscstar.com>
X-CM-TRANSID: rQCowACX54EzGM5obAbXAw--.5582S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZw4xCw1xZFy3WF13Wr13CFg_yoWDtFb_G3
	ZruayIganrCFnrWFyDWw1ftr40vrs2krWrtwn7Gry7Gan5Wr1kGa18Ja15Ar4UGr1aqr93
	Ca15tF4kJwsFkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbV8YjsxI4VWkCwAYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07jDKsUUUUUU=
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_195828_586162_B05962D8 
X-CRM114-Status: UNSURE (   8.76  )
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

On 9/19/25 23:59, Alex Elder wrote:

> [...]
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 6cdcd80a7c83b..f8c37d16968e4 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -856,6 +856,22 @@ storage-bus {
>  			#size-cells = <2>;
>  			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
>  
> +			spi3: spi@d401c000 {
> +				compatible = "spacemit,k1-spi";
> +				reg = <0x0 0xd401c000 0x0 0x30>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&syscon_apbc CLK_SSP3>,
> +					 <&syscon_apbc CLK_SSP3_BUS>;
> +				clock-names = "core", "bus";
> +				resets = <&syscon_apbc RESET_SSP3>;
> +				interrupts = <55>;
> +				dmas = <&pdma 20>,
> +				       <&pdma 19>;
> +				dma-names = "rx", "tx";
> +				status = "disabled";
> +			};
> +

Is storage-bus the right place for SPI? I'd have thought that SPI
wouldn't need its own dma-ranges if it does DMA though &pdma.

I know "dram_range4" is where SpacemiT put it but I'm not sure if that
makes sense now.

Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
