Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4BBC83F03
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 14:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mVGgj/Hab4Yp1mVatv/qz5CAGwaMg1tc43wTT1DeCII=; b=sm//Z4E3Zv6A43
	/wK8bztidPOkKQR5tHo9mm1cIqQW/goPJuhWM3C3/tD2BaDmYyftGkOnaxjw5wEUvkabB+pbV6YhE
	x0xGETN16r2Vyp+0nuuQstqywelj5T8WsTtvorVm/XBlQLeqEh+GP61uiENJ6JZdU5mPISSgO/y18
	hWYUAlzrgJxksZQ1ig2nYVxYw8CP2JKVXh3lm4RtWc2kD+EA80QfGI5mcb58Dfa5wxpVxWtKOptU6
	2F4N0ynLLpTUXQ54LktafAra1I7xOt8LfDPKmdseM8d1w3bcy9Ru4GFSfn6Ue7sqlq04WFnjAbg7q
	GEer+S73jWioJsHGcNpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKZv-0000000Bayf-0JXQ;
	Thu, 03 Jul 2025 14:06:19 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJ6J-0000000BLAP-3VPa
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 12:31:42 +0000
Received: from [192.168.0.105] (unknown [114.241.87.235])
	by APP-05 (Coremail) with SMTP id zQCowAC3Dl8YeGZoHT+zAA--.45946S2;
	Thu, 03 Jul 2025 20:31:20 +0800 (CST)
Message-ID: <17733827-8038-4c85-9bb1-0148a50ca10f@iscas.ac.cn>
Date: Thu, 3 Jul 2025 20:31:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 1/2] dt-bindings: net: Add support for
 SpacemiT K1
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Junhui Liu <junhui.liu@pigmoral.tech>,
 Conor Dooley <conor.dooley@microchip.com>, netdev@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Jakub Kicinski <kuba@kernel.org>,
 linux-riscv@lists.infradead.org, Simon Horman <horms@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
 Vivian Wang <uwu@dram.page>, Yixun Lan <dlan@gentoo.org>,
 spacemit@lists.linux.dev, Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paolo Abeni <pabeni@redhat.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>
References: <20250703-net-k1-emac-v4-0-686d09c4cfa8@iscas.ac.cn>
 <20250703-net-k1-emac-v4-1-686d09c4cfa8@iscas.ac.cn>
 <175153978342.612698.13197728053938266111.robh@kernel.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <175153978342.612698.13197728053938266111.robh@kernel.org>
X-CM-TRANSID: zQCowAC3Dl8YeGZoHT+zAA--.45946S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cry3WF48Kr4UWryfuF13CFg_yoW8uF43pa
	ySkwnIkrWjvFy7Jw43tr92v3WFgr4ftFyaqFy2gr17t3Z8XF4ftrWS9r48uF18CrWrJa4f
	Zw17u3WxGry5AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxU3wIDUUUUU
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_053140_277242_57004AB0 
X-CRM114-Status: GOOD (  15.13  )
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


On 7/3/25 18:49, Rob Herring (Arm) wrote:
> On Thu, 03 Jul 2025 17:42:02 +0800, Vivian Wang wrote:
>> The Ethernet MACs on SpacemiT K1 appears to be a custom design. SpacemiT
>> refers to them as "EMAC", so let's just call them "spacemit,k1-emac".
>>
>> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>   .../devicetree/bindings/net/spacemit,k1-emac.yaml  | 81 ++++++++++++++++++++++
>>   1 file changed, 81 insertions(+)
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/net/spacemit,k1-emac.example.dts:36.36-37 syntax error
> FATAL ERROR: Unable to parse input tree

My bad. The example still depends on the reset bindings for the constant 
RESET_EMAC0. I just tried with reset v12 [1] and that fixes it.

[1]: https://lore.kernel.org/spacemit/20250702113709.291748-2-elder@riscstar.com/

Vivian "dramforever" Wang

> make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/net/spacemit,k1-emac.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1519: dt_binding_check] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250703-net-k1-emac-v4-1-686d09c4cfa8@iscas.ac.cn
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
