Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C83DC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 14:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/PyclzUkXnVjMS1f88hbKthjGL/0j04AmoHNN+cmoOE=; b=y6MdKWo/VlsmO/
	rPr1yItulNe58Y/j0bRc3Oclz/PhWOE183L19zNtlmyrY1Zh2W4HEu71TxfFGujvm6JZFfqtL9jmh
	/IkQNBWZXNQGrk2c5jFEEVBEIkX2CDnWVsISyC363ea1Ixn09tDctY/2SGwqcAVW5ZzloJHCxFYoF
	DGE+0ITwbngngh/jb5ry7DtG52SQ17HY0EBfQ3kab42uUJpiTk/ckRgdVmtqgL2uAXiRuux2TMR69
	ZpUjjS1ovg25LlkH75NkX3ppSNGX4GJwHah0SAn9ox9ThRI+hgJRj/GGAtWSqxCY5pzMqHAtMopwV
	zQvSCrd5v7EDHmD/9PcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFxj1-0006hq-2Q;
	Wed, 20 Dec 2023 14:39:07 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFxiy-0006hM-1Q
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 14:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703083139;
	bh=R2rCuNyBRNg+TZc+54PKcT/z1boJ+LwN+LmqAXkaP/E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X0tJIcSNYys6pId5gicm+KV2lXyiMvnfhqnbfLkeIrLVagWhtD9/nu0HkawJJDZ92
	 9LsuYl+fGgBv71HfR/uf8KTiD3CMZSj0sOBklIQxsM7Nej+ajAsdmOsxJVrCS763gY
	 By0r6Vufa3ZmiJ/gxTKM8ac/SMsKZn4nDWjaN/GCMp6wIsVjT34bLCAzM5MBUSlMrm
	 nvLayth3R3flPJztmXFpey/7AbgNVk49+TAZ4dIIFW3PyrOZ29r95hz8Vtm0EvMiCI
	 F2VOLNYuqLcFguIbZ419VfnJUrRi6jZMHEd73Z3z7rlO72UReuFNxBsXxX5mz/NMlw
	 xFGETRxG0hMMQ==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id F30873781F8F;
	Wed, 20 Dec 2023 14:38:57 +0000 (UTC)
Message-ID: <3b2d41cd-4c0a-4277-8650-e6da37139023@collabora.com>
Date: Wed, 20 Dec 2023 16:38:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] riscv: dts: starfive: jh7100: Add sysmain and gmac
 DT nodes
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Jacob Keller <jacob.e.keller@intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, kernel@collabora.com
References: <20231220004638.2463643-1-cristian.ciocaltea@collabora.com>
 <20231220004638.2463643-2-cristian.ciocaltea@collabora.com>
 <CAJM55Z9DhojDTDPEqx3NO5g61=ezRg-U9odixbZugcXRRVmS7w@mail.gmail.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAJM55Z9DhojDTDPEqx3NO5g61=ezRg-U9odixbZugcXRRVmS7w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_063904_679069_8DCA6A47 
X-CRM114-Status: GOOD (  16.34  )
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

On 12/20/23 15:43, Emil Renner Berthing wrote:
> Cristian Ciocaltea wrote:
>> Provide the sysmain and gmac DT nodes supporting the DWMAC found on the
>> StarFive JH7100 SoC.
>>
>> Co-developed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
>> ---
>>  arch/riscv/boot/dts/starfive/jh7100.dtsi | 36 ++++++++++++++++++++++++
>>  1 file changed, 36 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
>> index c216aaecac53..2ebdebe6a81c 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
>> @@ -204,6 +204,37 @@ sdio1: mmc@10010000 {
>>  			status = "disabled";
>>  		};
>>
>> +		gmac: ethernet@10020000 {
>> +			compatible = "starfive,jh7100-dwmac", "snps,dwmac";
>> +			reg = <0x0 0x10020000 0x0 0x10000>;
>> +			clocks = <&clkgen JH7100_CLK_GMAC_ROOT_DIV>,
>> +				 <&clkgen JH7100_CLK_GMAC_AHB>,
>> +				 <&clkgen JH7100_CLK_GMAC_PTP_REF>,
>> +				 <&clkgen JH7100_CLK_GMAC_TX_INV>,
>> +				 <&clkgen JH7100_CLK_GMAC_GTX>;
>> +			clock-names = "stmmaceth", "pclk", "ptp_ref", "tx", "gtx";
>> +			resets = <&rstgen JH7100_RSTN_GMAC_AHB>;
>> +			reset-names = "ahb";
>> +			interrupts = <6>, <7>;
>> +			interrupt-names = "macirq", "eth_wake_irq";
>> +			max-frame-size = <9000>;
>> +			snps,multicast-filter-bins = <32>;
>> +			snps,perfect-filter-entries = <128>;
>> +			starfive,syscon = <&sysmain 0x70 0>;
>> +			rx-fifo-depth = <32768>;
>> +			tx-fifo-depth = <16384>;
>> +			snps,axi-config = <&stmmac_axi_setup>;
>> +			snps,fixed-burst;
>> +			snps,force_thresh_dma_mode;
> 
> Compared to v4 you're missing a
> 
>   snps,no-pbl-x8;
> 
> here. It might be the right thing to do, but then I would have expected
> it to me mentioned in the cover letter version history.

Oh yes, I missed to add this to the changelog, sorry!  I dropped that
because the property is only valid for snps,dwmac-{3.50a, 4.10a, 4.20a,
5.20} compatibles, while we have plain snps,dwmac to handle 3.7x.

We could have probably used snps,dwmac-3.70a or snps,dwmac-3.710, but
I'm not sure which is the exact chip revision and it wouldn't really
change anything as there is no special handling for them in the
snps,dwmac.yaml binding.

>> +			status = "disabled";
>> +
>> +			stmmac_axi_setup: stmmac-axi-config {
>> +				snps,wr_osr_lmt = <16>;
>> +				snps,rd_osr_lmt = <16>;
>> +				snps,blen = <256 128 64 32 0 0 0>;
>> +			};
>> +		};
>> +
>>  		clkgen: clock-controller@11800000 {
>>  			compatible = "starfive,jh7100-clkgen";
>>  			reg = <0x0 0x11800000 0x0 0x10000>;
>> @@ -218,6 +249,11 @@ rstgen: reset-controller@11840000 {
>>  			#reset-cells = <1>;
>>  		};
>>
>> +		sysmain: syscon@11850000 {
>> +			compatible = "starfive,jh7100-sysmain", "syscon";
>> +			reg = <0x0 0x11850000 0x0 0x10000>;
>> +		};
>> +
>>  		i2c0: i2c@118b0000 {
>>  			compatible = "snps,designware-i2c";
>>  			reg = <0x0 0x118b0000 0x0 0x10000>;
>> --
>> 2.43.0
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
