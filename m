Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B910DC6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 22:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ciievncz/1Jps9rLtIzlmhQJPxmdB1HtJJWzpswATSs=; b=iKMBalvb38KxZI
	1R+Bdk8JVEJCzuMotD0WqIWZXIc3zXWjv5bhR73eRO1szbr24+tCGFA6OLVl53VjCtwQqgDaeZ/G2
	ErVJGZhTAXI5YnoJAUG6lbHMkGX6of3Dir4vFJvSCqh0U6oHPNmXtgopAaf2z7EGIsyVaxrZv1qI5
	aH+uXSrR+nIOXAWm/PQe1Zz28VyQESJcPDeGDLt0IyZVXmU+b2ysLnWvMLPR8t12EKY2tiFA646dE
	BlaFJypd8G4TBdn9t+rJ9Q/HLxGc+YJSGYg7XWHosFoeTA5noellgeAwhOzSk7YMZDcI7MX3j8txB
	Z9AeR4XiYW6e3SPYK7lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pekIV-00Dwo0-0r;
	Tue, 21 Mar 2023 22:17:39 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pekIQ-00Dwml-2C;
	Tue, 21 Mar 2023 22:17:36 +0000
Received: from [192.168.1.90] (unknown [188.24.179.102])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A31A866030D8;
	Tue, 21 Mar 2023 22:17:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679437052;
	bh=kISYc8jF93sURnyHntnC1OZ2p4p1sWgcPPfEJiI3pho=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DAlF+kqBJ+TEevV3l2dvq4UP4emcgYVVXEzpExVl2nEEZQG5wPo/gPGRhrebUJ4jB
	 6UuwSHDZL7gQadG/0pX/QwT7ZZZFuhysxpycz/tYEs+BX1pZC9hNMfwaFnJ8FI718S
	 HX3dybyqVznpzuASOX/4MQKrkzxdElPKo0R0J7/oCJbOGQbBgfu15V3g2EEsCgKg3O
	 I7C7YYalHMeiFiBzzMhgrgJqZtMzR9T1ai92Kz63OL3ffXAXSla6rJHdZbhEmEzNB6
	 EftcQErQx9ncAjS18lQI5SGVnMHuwCrZxx0b1cCZ3EZvTR5On2hyhy1IxBeDicRKnm
	 r++47+MMC+UQA==
Message-ID: <7cd34af7-94e7-b5e2-053c-4cc831e4cfc4@collabora.com>
Date: Wed, 22 Mar 2023 00:17:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 01/10] dt-bindings: serial: snps-dw-apb-uart: Switch
 dma-names order
To: Conor Dooley <conor@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Heiko Stuebner <heiko@sntech.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, kernel@collabora.com
References: <20230321215624.78383-1-cristian.ciocaltea@collabora.com>
 <20230321215624.78383-2-cristian.ciocaltea@collabora.com>
 <5287504e-c0f7-4964-8a61-fd49b7ee9547@spud>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <5287504e-c0f7-4964-8a61-fd49b7ee9547@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_151734_848857_E0655495 
X-CRM114-Status: GOOD (  14.69  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/22/23 00:09, Conor Dooley wrote:
> On Tue, Mar 21, 2023 at 11:56:15PM +0200, Cristian Ciocaltea wrote:
>> Commit 370f696e4474 ("dt-bindings: serial: snps-dw-apb-uart: add dma &
>> dma-names properties") documented dma-names property to handle Allwinner
>> D1 dtbs_check warnings, but relies on the rx->tx ordering, which is the
>> reverse of what a different board expects:
>>
>>    rk3326-odroid-go2.dtb: serial@ff030000: dma-names:0: 'rx' was expected
>>
>> A quick and incomplete check shows the inconsistency is present in many
>> other DTS files:
> 
>> The initial proposed solution was to allow a flexible dma-names order in
>> the binding, due to potential ABI breakage concerns after fixing the DTS
>> files. But luckily the Allwinner boards are not really affected, since
>> all of them are using a shared DMA channel for rx and tx:
> 
>> Switch dma-names order to tx->rx as the first step in fixing the
>> inconsistency. The remaining DTS fixes will be handled by separate
>> patches.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Thanks for doing all of the switch overs too. I should've probably
> broadened my searching beyond the allwinner platforms when I initially
> added this, so yeah, thanks.

Thanks for the quick review! And no worries, I'm glad I could help, 
hopefully I didn't miss anything..

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
