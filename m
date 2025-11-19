Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90789CF3186
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 09:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m0/VenCpTBmROOGdiJ69fiPA19qQOx2EFK3n3Y4qC6Q=; b=1i5/qRBn0XJnpw
	Zk0210fZpXuIAYW0rUYgwvZPaeoP/S1xLKKxCqRD/NoR8MG97oTQOtQrozU+BF0TYaMb4Sg8Khuof
	aMj0vfOkaqDowdXKFgYpxKa6aZjH0kLU0iWOPpRnvxGDE/Kq94b2flkVsQDiLdLH6lNRhHLUMRrr3
	9e5RfSJ4qltAU53SdN/gDz9+GQIIJ6pM9SX+IbT5yqzwnUeLv8+FjjtjbYxXU8zVfTFdobvfXSFTI
	HPcaEUzFKjuNeS69HHPZWJPLJfoqaahqpq5slFxrrCk+ZhVR1ly2A1oRnUViJnG1mEI5GjB2qZyqr
	kagOpprkNGap0N52nIIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLeuN-00000002uLK-49f8;
	Wed, 19 Nov 2025 09:55:27 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLeuJ-00000002uKA-0EMz
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 09:55:26 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251119095517euoutp017d1854aeb12c82428fa86d0f956322dd~5X9mOizbJ0857708577euoutp01Y
	for <linux-riscv@lists.infradead.org>; Wed, 19 Nov 2025 09:55:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251119095517euoutp017d1854aeb12c82428fa86d0f956322dd~5X9mOizbJ0857708577euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763546117;
	bh=L9QUbT5sfOfSl3yIBpPIQUHqDme8WznARKwtO6/UvWc=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=uPmwArdO3anYJSblTHIv1FqLZgXX/Pg8rCYKAcM+LI0I49VBk/SyIV0lp7vIufial
	 hPm7nJ6mOy+30TLQRaHTLQXuhmuI3ejU8K5wCbEGxXF0BUfeGYET4bYBkF3J4e+EpH
	 /JlmQ8o5qfMTC3SnmLMjmTwChk7CTASiryfl5T0E=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251119095516eucas1p2f3b258d1a710192d3ca6068433be4b85~5X9l2Ux8E1400214002eucas1p2R;
	Wed, 19 Nov 2025 09:55:16 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251119095514eusmtip2bf01f8bfcbc9230cf2e7669fc51637bf~5X9kNe68a0439904399eusmtip2m;
	Wed, 19 Nov 2025 09:55:14 +0000 (GMT)
Message-ID: <765d114d-6a03-4535-a644-5e7581dfbccc@samsung.com>
Date: Wed, 19 Nov 2025 10:55:13 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without
 interrupts
To: Geert Uytterhoeven <geert@linux-m68k.org>, Krzysztof Kozlowski
	<krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Saravana
	Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
	Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
	Ghiti <alex@ghiti.fr>, Samuel Holland <samuel@sholland.org>, Marc Zyngier
	<maz@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-samsung-soc
	<linux-samsung-soc@vger.kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMuHMdXgq=Zv3GQes_d_eyCcB7m--PaEGSQJtUWiRjj-7gBVkw@mail.gmail.com>
X-CMS-MailID: 20251119095516eucas1p2f3b258d1a710192d3ca6068433be4b85
X-Msg-Generator: CA
X-RootMTR: 20251119085902eucas1p223cb580bdd4cef2698382835c77210e8
X-EPHeader: CA
X-CMS-RootMailID: 20251119085902eucas1p223cb580bdd4cef2698382835c77210e8
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
	<b037f67a-b241-4689-9914-57ff578c1454@sirena.org.uk>
	<1a4d2276-75e1-4aa0-8ff2-c932ce5d6edc@kernel.org>
	<CGME20251119085902eucas1p223cb580bdd4cef2698382835c77210e8@eucas1p2.samsung.com>
	<CAMuHMdXgq=Zv3GQes_d_eyCcB7m--PaEGSQJtUWiRjj-7gBVkw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_015523_741137_AC3393B6 
X-CRM114-Status: GOOD (  20.20  )
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

Hi Geert,

On 19.11.2025 09:53, Geert Uytterhoeven wrote:
> On Tue, 18 Nov 2025 at 20:55, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On 18/11/2025 20:34, Mark Brown wrote:
>>> On Fri, Nov 14, 2025 at 11:47:54AM +0100, Geert Uytterhoeven wrote:
>>>> The Devicetree Specification states:
>>>>
>>>>      The root of the interrupt tree is determined when traversal of the
>>>>      interrupt tree reaches an interrupt controller node without an
>>>>      interrupts property and thus no explicit interrupt parent.
>>>>
>>>> However, of_irq_init() gratuitously assumes that a node without
>>>> interrupts has an actual interrupt parent if it finds an
>>>> interrupt-parent property higher up in the device tree.  Hence when such
>>>> a property is present (e.g. in the root node), the root interrupt
>>>> controller may not be detected as such, causing a panic:
>>> I'm seeing a boot regression on the TI x15 platform in -next which
>>> bisects to this patch in -next, unfortunately even with earlycon (though
>>> just earlycon, I don't know the platform specific runes) the board just
>>> dies with no output:
>>>
>>>    https://protect2.fireeye.com/v1/url?k=7efe2b91-216202bb-7effa0de-000babe598f7-79b85fd5422be185&q=1&e=a2b4aea0-c947-472b-ae80-9160750f84a2&u=https%3A%2F%2Fvalidation.linaro.org%2Fscheduler%2Fjob%2F4252918%23L409
>>>
>>> It does seem like a plausible patch for this sort of issue though, and
>>> the bisect converges smoothly:
>> All Samsung platforms fail as well. I was waiting with bisection but
>> Marek was as usually very fast:
>>
>> https://lore.kernel.org/all/20251118115037.1866871-1-m.szyprowski@samsung.com/
> Yeah, the various ti,omap[45]-wugen-mpu nodes have interrupt-parent
> properties, but no interrupts{-extended} properties.
>
> Does the following (whitespace-damaged) patch, to restore finding an
> explicit interrupt-parent, fix the issue?

This also fixes Exynos case without any need for the changes in 
arch/arm/mach-exynos/suspend.c. The question is which approach is preferred?

> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -685,6 +685,8 @@ void __init of_irq_init(const struct of_device_id *matches)
>                  desc->interrupt_parent = of_parse_phandle(np,
> "interrupts-extended", 0);
>                  if (!desc->interrupt_parent && of_property_present(np,
> "interrupts"))
>                          desc->interrupt_parent = of_irq_find_parent(np);
> +               if (!desc->interrupt_parent)
> +                       desc->interrupt_parent = of_parse_phandle(np,
> "interrupt-parent", 0);
>                  if (desc->interrupt_parent == np) {
>                          of_node_put(desc->interrupt_parent);
>                          desc->interrupt_parent = NULL;
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
