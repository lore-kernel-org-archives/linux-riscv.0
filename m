Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92792C35FFC
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Mar 2025 07:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N6/7nvZHLJQX3nqmwqOy4MZoPnp9OYZID+YGin2H8XU=; b=BiyFthiD1VCkZP
	Z4Y5N1lBJeqk9FbVu8wo8458yWGf7J2R/CDbB7+5VP+szaJO9NyItVxgTwDRvEA7K+sTnEMAWnXd9
	OEtmB1zx9scwo+0edXY5Vc+2l+QVc9jGdEbkodbqK+VlCiEm9xHfmfeNRHajsTGPKAz612EdNlQ0x
	VFpLi+TwEKeZcuAgdg/RyzmZYwSvw77sNFvZ1F+pri2GkCaXPJJJMmhrkrPvsFb0KkFXnrbxmrF5h
	GxzlRPgZBah2TgbFNHJ8THhk5Z7hpCmVHt/LYtim1WbHRCI5F/vQltd2kxA5Qfe2Pl3n6E6eFBnOC
	PdwsFe36ndjKLtj9zD+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvtN1-0000000H16r-0FqW;
	Sat, 22 Mar 2025 07:34:15 +0000
Received: from sender4-pp-o92.zoho.com ([136.143.188.92])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvtMy-0000000H15H-3FxJ
	for linux-riscv@lists.infradead.org;
	Sat, 22 Mar 2025 07:34:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1742628846; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BbVHTg/lXZ0/BfmT52We84mtU0Sd2e+gWxZ4rY/zNeXSTTzdPVm/X9Q0CiHKJNzvc8M+aM+vU47LQYofHK19phDaTCCmTK5Y5sLB6AKzhONja+thhK77Q62tsRpp/WTXN0lc+rfftS6oa1ukU6EPkUuWaf71ygVaKQw50VR5rtg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1742628846; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UJWGwSmM6R2Fl1f2HJVagURPx9n2oq24WYtXhSh6rlM=; 
	b=Xwq4mGIxp1fKgljJX+Y7wjw0kLz603t0FcoXg98tKRshrso8t/7KEZAaUUPrr8vELTm13CZ4332xLapVkU6MxdznkNdquxDmjIUgA5T5U8HHAU1PnrphpdofKwuFpgxiFH4a1GnJrJTOEflqo6lJeKIs3Lls2/4EZqShAWQzY2E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742628846;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:From:From:Subject:Subject:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=UJWGwSmM6R2Fl1f2HJVagURPx9n2oq24WYtXhSh6rlM=;
	b=d5CnVdSEG3aE6HJKi9kFODNnC+xAeRE8GlAldZNrKcXmXEev2runk+w1XWOZfST5
	bl2EYsNgKG/rs6K5JRkebvLBbRAnwJ0cJk3d6Og3T9mEnSZbgCOQAoTNIW2RzEfKpEf
	QUo6KgnpWzmQY44qHAeAdBz7qlTwu5DXXR51Dq9g=
Received: by mx.zohomail.com with SMTPS id 1742628844944113.08852694491645;
	Sat, 22 Mar 2025 00:34:04 -0700 (PDT)
Message-ID: <ef7a6ae8-4cc7-401a-81f1-0975c939176c@zohomail.com>
Date: Sat, 22 Mar 2025 15:33:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Xukai Wang <kingxukai@zohomail.com>
Subject: Re: [PATCH RESEND v5 2/3] clk: canaan: Add clock driver for Canaan
 K230
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Michael Turquette <mturquette@baylibre.com>
References: <20250320-b4-k230-clk-v5-0-0e9d089c5488@zohomail.com>
 <20250320-b4-k230-clk-v5-2-0e9d089c5488@zohomail.com>
 <fb9dba11-5a23-48a2-8b11-a544580eeaca@gmail.com>
Content-Language: en-US
In-Reply-To: <fb9dba11-5a23-48a2-8b11-a544580eeaca@gmail.com>
Feedback-ID: rr08011227694213b15691645fc5dee3060000846e6e90dc712a730651b5c0ca9f16e2afeab99011fa1f2ba5:zu08011227dc4ba870fae43f0f7d64d01a00000c05db20beae40b21e1fd964d227b011bc3a6ebef9c7cddc49:rf0801122b7e97f2d734872b03f8d1bba2000082c89c112c6e9e32b5b1c613199179b3fbcd8322557d58bc50111f3322:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_003412_886569_10BC3666 
X-CRM114-Status: UNSURE (   8.41  )
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

On 2025/3/20 15:09, Troy Mitchell wrote:
> On 2025/3/20 11:25, Xukai Wang wrote:
> ...
>> +struct k230_clk {
>> +	int id;
>> +	struct k230_sysclk *ksc;
>> +	struct clk_hw hw;
>> +};
>> +
>> +#define to_k230_clk(_hw)	container_of(_hw, struct k230_clk, hw)
>> +
>> +/* K230 SYSCLK. */
> Check other places and remove unnecessary comments.
OK, I get it.
>> +
>> +static unsigned long k230_pll_get_rate(struct clk_hw *hw, unsigned long parent_rate)
>> +{
>> +	struct k230_pll *pll = to_k230_pll(hw);
>> +	struct k230_sysclk *ksc = pll->ksc;
>> +	u32 reg;
>> +	u32 r, f, od;
>> +
>> +	reg = readl(pll->bypass);
>> +	if (reg & K230_PLL_BYPASS_ENABLE)
>> +		return parent_rate;
>> +
>> +	reg = readl(pll->lock);
>> +	if (!(reg & (K230_PLL_STATUS_MASK))) { /* unlocked */
> unnecessary comment and wrong position.
I'll modify it.
>> +		dev_err(&ksc->pdev->dev, "%s is unlock.\n", clk_hw_get_name(hw));
>> +		return 0;
>> +	}
>> +
>> +	reg = readl(pll->div);
>> +	r = ((reg >> K230_PLL_R_SHIFT) & K230_PLL_R_MASK) + 1;
>> +	f = ((reg >> K230_PLL_F_SHIFT) & K230_PLL_F_MASK) + 1;
>> +	od = ((reg >> K230_PLL_OD_SHIFT) & K230_PLL_OD_MASK) + 1;
>> +
>> +	return mul_u64_u32_div(parent_rate, f, r * od);
>> +}
>> +
> ...
>
>> +
>> +static int k230_clk_probe(struct platform_device *pdev)
>> +{
>> +	int ret;
>> +	struct k230_sysclk *ksc;
>> +
>> +	ksc = devm_kzalloc(&pdev->dev, sizeof(struct k230_sysclk), GFP_KERNEL);
> you can use `sizeof(*ksc)` instead. same below.
OK, I get it.

And thanks for your review.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
