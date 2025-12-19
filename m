Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185ADD74961
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 08:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KKXhcHitaIfYLXvfZEBPcu2J0lTXOg1KtfYMpSQXOaM=; b=corPr9XY/2BSfb
	bcH3dVdJBnJBztDKT00pYozIgLefC3ry8NFVyQpOOe5IMJQ4IrIpqPrVV7OUSg8pxTYWZDUx2SrDd
	Exg2XaQaT7NBc+ldcLTajeIJW4AfkuO4MbdKdJNbSvle98Ox7b+ySgcYkZfUfkf3taPTh/915wv8p
	cpdHAymFQo7QTE7ji5Q7E0pWFcy6sgfuVAbWBBuoMYPeybnxo23tpo32cLGE2NY6y01lfrh4gb7ge
	7IXFfBoOAnu2acDxmvs3oJQv0ThrNX4XFES0nwZy4Xw5xZx4k+IoA0tO1xuY7r4YZH4cVhkSuZJMT
	W6ca+2Q8AU74uVl2431w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVum-00000009sF0-0DgI;
	Fri, 19 Dec 2025 08:32:44 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVui-00000009sEX-3A6s
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 08:32:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1766133150; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mO3BsCtyHVBRwY0bLlTdjrDimIvWWXM50aUIsz5/QFfeYR0S5kj7KkZu9JThgegwbJNygsyX7MCN1Vv/V0Dnyf9bZ+h0/mHQVTygLzSzG4oe4BE6agn4Q0ZXgWMLFSeRuYuswP9blScoaX5hUdnTtW+M+toawMAs2TGlsFShnco=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766133150; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qD8jT2s+CQPUn8ahKa2Vl1fnycgNsJt25eb304sEF90=; 
	b=MuTetyo/VX0yQ9sSHArt/8K88nHgXZLZxt0fxeyQOYW8FzRy3TC7dbLjlG/jjbIy8nauo/f1MrFkzlFY80DvR8Q9hEQuTwYN1Z9LNLQlbLx/Cv5AkLzB4BIQpLgdqvIyDC8WlfL/9LsOhL/EnzQfhaYS5WKu+hTzHhsg7AMesfQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766133150;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:Subject:Subject:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=qD8jT2s+CQPUn8ahKa2Vl1fnycgNsJt25eb304sEF90=;
	b=ebTc6WOgLBeiZrhOn/NeZPSoafkCMInRijQ5XavpzJ7B+7Nvzy/36tNv1sBP/Sz6
	S8/oCxFNa4mMAVCAWoET7ewzsxNhbjJhYD3aMBboBu0l0Qytz1HPbf8FOOhBkSHJOTQ
	XeOMXbp0CJnvYSHylJNw7+Diq28o+UrwtVxES920=
Received: by mx.zohomail.com with SMTPS id 1766133148865100.9592386002613;
	Fri, 19 Dec 2025 00:32:28 -0800 (PST)
Mime-Version: 1.0
Date: Fri, 19 Dec 2025 16:32:18 +0800
Message-Id: <DF21Y2Y8FHSY.148HX8VXOFBHV@pigmoral.tech>
Cc: "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 3/6] clk: anlogic: add cru support for Anlogic DR1V90
 SoC
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Brian Masney" <bmasney@redhat.com>, "Junhui Liu"
 <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251216-dr1v90-cru-v3-0-52cc938d1db0@pigmoral.tech>
 <20251216-dr1v90-cru-v3-3-52cc938d1db0@pigmoral.tech>
 <aUSQLB1fmYgQe_Fg@redhat.com>
In-Reply-To: <aUSQLB1fmYgQe_Fg@redhat.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_003241_170070_3B4724C7 
X-CRM114-Status: GOOD (  16.28  )
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

Hi Brian,
Thanks for your review.

On Fri Dec 19, 2025 at 7:37 AM CST, Brian Masney wrote:
> Hi Junhui,
>
> On Tue, Dec 16, 2025 at 11:39:43AM +0800, Junhui Liu wrote:
>> +static long cru_div_gate_round_rate(struct clk_hw *hw, unsigned long rate,
>> +				    unsigned long *prate)
>> +{
>> +	struct clk_divider *divider = to_clk_divider(hw);
>> +
>> +	return divider_round_rate(hw, rate, prate, divider->table,
>> +				  divider->width, divider->flags);
>> +}
>
> The round_rate clk op is deprecated and I'm really close to being able
> to remove this from the clk core. Please only use determine_rate()
> below.

Thanks! I will remove the round_rate() implementation and use
determine_rate() only.

>
>> +static int cru_div_gate_determine_rate(struct clk_hw *hw,
>> +				       struct clk_rate_request *req)
>> +{
>> +	struct cru_div_gate *div_gate = hw_to_cru_div_gate(hw);
>> +	struct clk_divider *divider = &div_gate->divider;
>> +	unsigned long maxdiv, mindiv;
>> +	int div = 0;
>> +
>> +	maxdiv = clk_div_mask(divider->width) + 1;
>> +	mindiv = div_gate->min + 1;
>> +
>> +	div = DIV_ROUND_UP_ULL(req->best_parent_rate, req->rate);
>> +	div = div > maxdiv ? maxdiv : div;
>> +	div = div < mindiv ? mindiv : div;
>> +
>> +	req->rate = DIV_ROUND_UP_ULL(req->best_parent_rate, div);
>> +
>> +	return 0;
>> +}
>
> [snip]
>
>> +const struct clk_ops dr1_cru_div_gate_ops = {
>> +	.enable = cru_div_gate_enable,
>> +	.disable = cru_div_gate_disable,
>> +	.is_enabled = cru_div_gate_is_enabled,
>> +	.recalc_rate = cru_div_gate_recalc_rate,
>> +	.round_rate = cru_div_gate_round_rate,
>> +	.determine_rate = cru_div_gate_determine_rate,
>
> When round_rate() and determine_rate() are both defined in the provider,
> only the determine_rate() will be used. Just drop your round_rate()
> implementation.

You're right, it's redundant here. I'll remove it in the next version.

>
> I didn't look into anything else on this patch. This showed up on my
> search for new implementations.
>
> Brian

-- 
Best regards,
Junhui Liu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
