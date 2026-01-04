Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB523C2A06C
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jan 2026 09:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=krss+dWeFyVQ/wkBPaIiYNAbvjYVIgts/AN2KTioW2I=; b=BqVsb125Pb6mNJ
	n7fDihUSFjsdQ1r9Ixh8UZVsvzfuhM3D/ahuFJ3jkFj3inpD/cJntKN3bAY46XiAU4FGII6W6hq2H
	fR5QBKhrB4MvoHhoprxEt+269vRm7duFXhl8kMPLEPFI0gThSmaEl3bWiCi62qzEqqd8/ljgZKBaE
	wawpKkPA1AMbPOE5Dc06vY1U+Aor3SSSYSgBKS2TpknwN6WyEUuK1S8odUlBhRyBoGDUeJyut7FSK
	zGm8/5mrApH7qUFawenWbD6UzJGbVjtgD/MCbyJZAoxKfXnzpCxA0+fvhM35RBanYogW8ejdTOX8b
	vFAa2ZmGEV/liwf4egIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcK9R-0000000A8J6-09T4;
	Sun, 04 Jan 2026 09:11:53 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcK9O-0000000A8Ij-0BNA
	for linux-riscv@lists.infradead.org;
	Sun, 04 Jan 2026 09:11:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1767517889; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KsrWPos6ny4u9+U5SqBfYsen6Vw6r1JjFnk/oEA3GtIfIQ6EL/2v8a8rQJa+jmcWwKks0uCB8BTOCVuw965VrAlYftU2+uIEcG//aAZz2jvw/vc9YOzZ9G8zUrKuJ2dghierrpqyO9HfX1q517FBefLMilBmEM6UwVg6FqOY/jo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767517889; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=L05UvUaL84OUDJeTop5CqpzB9OlZRXWekgv+Sku6Q4k=; 
	b=QcjO4VttNLb19KI2tbkCYeoLnzJLiFgf8/r+WHeKyidcOGOuJ9YMpDq14C/izBz6ZKg4Ikz/pQZ87D+ZIIAwbkAd8uTaW4TXG2PEaAxZqxIfsyHyhy1Qq8q3BfwatV+kD0DRcMpe2yfn1t0CTLyFFjY+OxcZzWedaUGKb85iajY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767517889;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:Subject:Subject:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=L05UvUaL84OUDJeTop5CqpzB9OlZRXWekgv+Sku6Q4k=;
	b=m6Jy/Y7VzUBo5saIRAcl52rOCEeZIi0Teta+PF8qWS8gf0YSjykYzC0qJgJc4DI2
	D8a+3o4BW5OeLI5ZjwjurMSxXGrk6wcM/JrZ5QFVWFv2wevxepcYrkgDAqDOVhtr4Ae
	RsINBggvd8FNiUgDQPbRyccx7+m6f9ZHLTFERVrg=
Received: by mx.zohomail.com with SMTPS id 1767517885291893.0220610416135;
	Sun, 4 Jan 2026 01:11:25 -0800 (PST)
Mime-Version: 1.0
Date: Sun, 04 Jan 2026 17:11:09 +0800
Message-Id: <DFFOSJU7PN4A.KER1R2GT8EYZ@pigmoral.tech>
Cc: "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Brian Masney" <bmasney@redhat.com>
Subject: Re: [PATCH v4 1/6] clk: correct clk_div_mask() return value for
 width == 32
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "David Laight" <david.laight.linux@gmail.com>, "Junhui Liu"
 <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251231-dr1v90-cru-v4-0-1db8c877eb91@pigmoral.tech>
 <20251231-dr1v90-cru-v4-1-1db8c877eb91@pigmoral.tech>
 <20251231105651.430f75f8@pumpkin>
In-Reply-To: <20251231105651.430f75f8@pumpkin>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_011150_461428_28D22DD4 
X-CRM114-Status: GOOD (  17.57  )
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

Hi David,

On Wed Dec 31, 2025 at 6:56 PM CST, David Laight wrote:
> On Wed, 31 Dec 2025 14:40:05 +0800
> Junhui Liu <junhui.liu@pigmoral.tech> wrote:
>
>> The macro clk_div_mask() currently wraps to zero when width is 32 due to
>> 1 << 32 being undefined behavior. This leads to incorrect mask generation
>> and prevents correct retrieval of register field values for 32-bit-wide
>> dividers.
>> 
>> Although it is unlikely to exhaust all U32_MAX div, some clock IPs may rely
>> on a 32-bit val entry in their div_table to match a div, so providing a
>> full 32-bit mask is necessary.
>> 
>> Fix this by casting 1 to long, ensuring proper behavior for valid widths up
>> to 32.
>> 
>> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> Reviewed-by: Brian Masney <bmasney@redhat.com>
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> ---
>>  include/linux/clk-provider.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
>> index 630705a47129..a651ccaf1b44 100644
>> --- a/include/linux/clk-provider.h
>> +++ b/include/linux/clk-provider.h
>> @@ -720,7 +720,7 @@ struct clk_divider {
>>  	spinlock_t	*lock;
>>  };
>>  
>> -#define clk_div_mask(width)	((1 << (width)) - 1)
>> +#define clk_div_mask(width)	((1L << (width)) - 1)
>
> That makes no difference on 32bit architectures.

You're right. Thanks for pointing it out.

> I also suspect you need to ensure the value is 'unsigned int'.
> If you can guarantee that width isn't zero (probably true), then:
> #define clk_div_mask(width) ((2u << (width) - 1) - 1)
> should have the desired value for widths 1..32.
> It probably adds an extra instruction.
> (OTOH so does passing width as 'u8'.)
>

Thanks for your suggestion. After further consideration, I prefer using
the standard GENMASK macro instead:

#define clk_div_mask(width) GENMASK((width) - 1, 0)

Using a unified kernel macro is better for maintenance and it also
benefits from the compile time checks in GENMASK for constant inputs.
This approach also supports a width range of 1..32, and even up to 64 on
64-bit architectures.

-- 
Best regards,
Junhui Liu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
