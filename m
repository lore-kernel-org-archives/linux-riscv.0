Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52288CAC589
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 07:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LtJCsIcyK1fms58Q93ieaWjotrZVs1f42OI7JbtnKXs=; b=KnHgMH62xuMsFq
	V8x64YoUqkw3O38OzkbIBHVGaIqUC4ak5qIeXddZKlmKcauavNSEEzbAZXMMYC2lXxgykRHiwdsvB
	gzOhh+HqGp8rIYAlFvA2RaPXaNrwcrctQXhcYfaGoFi7kwb+Yzegt40GR7FZ7RdfRCAfsg3fe1MgP
	lAU1v0JZ6X87Tbrzey/J1GTEPzK/1vue2v37UwiWKu5DTz2cgl7HBPvWvCSUiZMmpo8hilEyTkfN+
	3sbyTBLck/aUQXMqJdzo+MwJAEaHh1IwGlu1qXXpTEF9/XcYyX2af7ph/atKJMOWIwb9yGfXhCpEP
	l2Hjdl1UghKHvJaaO5iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvt4W-00000005K6V-21Wq;
	Tue, 09 Sep 2025 07:47:24 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsNf-000000051aK-3AgO
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 07:03:10 +0000
Received: from [192.168.0.102] (unknown [114.241.87.235])
	by APP-05 (Coremail) with SMTP id zQCowABH6RIf0b9o6DPiAQ--.22178S2;
	Tue, 09 Sep 2025 15:02:56 +0800 (CST)
Message-ID: <8ca70773-42b0-4dcc-8b54-338594e9a8ea@iscas.ac.cn>
Date: Tue, 9 Sep 2025 15:02:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] clk: canaan: Add clock driver for Canaan K230
To: Xukai Wang <kingxukai@zohomail.com>, Yao Zi <ziyao@disroot.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>
References: <20250905-b4-k230-clk-v8-0-96caa02d5428@zohomail.com>
 <20250905-b4-k230-clk-v8-2-96caa02d5428@zohomail.com> <aLz4Q7LZFEfQQGUj@pie>
 <0947d9cc-86ba-46e0-92aa-04f4714e7a20@zohomail.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <0947d9cc-86ba-46e0-92aa-04f4714e7a20@zohomail.com>
X-CM-TRANSID: zQCowABH6RIf0b9o6DPiAQ--.22178S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWF1rWr4xAFW3Zr1fWr18Grg_yoW5GFWkpr
	yIgFy8tF4DJF17Cw12va9rWr1Yyws0qa4SkrykGFyxJ3Z0k34IqF1Skrn5uayUArnrt3WS
	v3y5try7CFZYyFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxU3QzVUUUUU
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_000308_179276_1C3A309C 
X-CRM114-Status: GOOD (  15.98  )
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


On 9/8/25 22:13, Xukai Wang wrote:
>>> [...]
>>>
>>> +
>>> +static int k230_clk_set_rate_mul_div(struct clk_hw *hw, unsigned long rate,
>>> +				     unsigned long parent_rate)
>>> +{
>>> +	struct k230_clk_rate *clk = hw_to_k230_clk_rate(hw);
>>> +	struct k230_clk_rate_self *rate_self = &clk->clk;
>>> +	u32 div, mul, div_reg, mul_reg;
>>> +
>>> +	if (rate > parent_rate)
>>> +		return -EINVAL;
>>> +
>>> +	if (rate_self->read_only)
>>> +		return 0;
>>> +
>>> +	if (k230_clk_find_approximate_mul_div(rate_self->mul_min, rate_self->mul_max,
>>> +					      rate_self->div_min, rate_self->div_max,
>>> +					      rate, parent_rate, &div, &mul))
>>> +		return -EINVAL;
>>> +
>>> +	guard(spinlock)(rate_self->lock);
>>> +
>>> +	div_reg = readl(rate_self->reg + clk->div_reg_off);
>>> +	div_reg |= ((div - 1) & rate_self->div_mask) << (rate_self->div_shift);
>>> +	div_reg |= BIT(rate_self->write_enable_bit);
>>> +	writel(div_reg, rate_self->reg + clk->div_reg_off);
>>> +
>>> +	mul_reg = readl(rate_self->reg + clk->mul_reg_off);
>>> +	mul_reg |= ((mul - 1) & rate_self->mul_mask) << (rate_self->mul_shift);
>>> +	mul_reg |= BIT(rate_self->write_enable_bit);
>>> +	writel(mul_reg, rate_self->reg + clk->mul_reg_off);
>>> +
>>> +	return 0;
>>> +}
>> There are three variants of rate clocks, mul-only, div-only and mul-div
>> ones, which are similar to clk-multiplier, clk-divider,
>> clk-fractional-divider.
>>
>> The only difference is to setup new parameters for K230's rate clocks,
>> a register bit, described as k230_clk_rate_self.write_enable_bit, must
>> be set first.
> Actually, I think the differences are not limited to just the
> write_enable_bit. There are also distinct mul_min, mul_max, div_min, and
> div_max values, which are not typically just 1 and (1 << bit_width) as
> in standard clock divider or multiplier structures.

So the part I have been thinking about is, consider just checking the
{mul,div}_{min,max} values to determine which kind it is? As is this is
just redundant information, since you can infer whether there is a
configurable multiplier by checking if mul_{min,max} are equal. Same for
div_{min,max}.

Vivian "dramforever" Wang

> For example, the div_min for hs_sd_card_src_rate is 2, not 1. This
> affects the calculation of the approximate divider, and cannot be fully
> represented if we only use the clk_divider structure.
>
> Another example is ls_codec_adc_rate, where mul_min is 0x10, mul_max is
> 0x1B9, div_min is 0xC35, and div_max is 0x3D09. These specific ranges
> cannot be described using the normal clk_fractional_divider structure.
>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
