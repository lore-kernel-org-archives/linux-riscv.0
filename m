Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B718C5478C
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 10:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EyuRUwYWBYxg03jXckEy2PweVXvaTuJ+9Y1ZVW5cpU0=; b=DvF3O+2bRc81Oi
	RC8BuGj2nOrVKYfbr2eAEAYViToX3WW3XDJMnDvhgO8K6emc9Nq7Y/P4H0X6+D2ME19BfAJak4PHG
	ssva1FJ+7QfglVw7Nby2n4zJaBythHkFTCkfqEWizT4LQvAHyrr1sv1fqNUOSeVnRHYxFkBTL7Wl0
	0rprGyarsEUTtlRSRzYuymBY+cardJBN4eDzdXRXGHsHRS4EUmb7T0luXwyqQcgo0nOPrKAKwhDL3
	JlhVjFu0TY66UgggfSZ6a/Og6n61SQP5gGKPPdhn/b2jX7tpPYFTpiFU5lN+yJXMEy5OuSTl1V7Sb
	9hN7BZFuLRm2qT/wljmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSiN-00000008tEi-1JNL;
	Fri, 23 Feb 2024 10:23:35 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdShs-00000008t6y-2Toi
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 10:23:13 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20240223102259euoutp019d9c2495f13584eb09211dc573f3cbbc~2dtgVjXNn0060800608euoutp01B
	for <linux-riscv@lists.infradead.org>; Fri, 23 Feb 2024 10:22:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20240223102259euoutp019d9c2495f13584eb09211dc573f3cbbc~2dtgVjXNn0060800608euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1708683779;
	bh=ZoO3Xw3beBfOH2K4b6ClmDrpMhFy7CJvowWF4KEavmA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=dKYo6Jl8RYbrO1Rlbxo6SZ7VFB1AS7yc1k5mVBV2jf3tgaS4Vnst4aFdkZZC0Qy2l
	 fjG0tM5AprcHq9XmptPrKQ52oPsGgk30P13THwyaW7O7hcVvkQoaEb7mzrV7CtJYEl
	 CwF3ZL3B9/2sjnMrYCuparmte3YV/fjZLjSV9Ifw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240223102258eucas1p1902f3cc38815751513a8ae0f71831059~2dtgBehQa0375303753eucas1p1q;
	Fri, 23 Feb 2024 10:22:58 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 86.D2.09552.20278D56; Fri, 23
	Feb 2024 10:22:58 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240223102258eucas1p119f38e40f769c883c0a502e9e26be888~2dtflWkNh1871718717eucas1p1L;
	Fri, 23 Feb 2024 10:22:58 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240223102258eusmtrp24d7c0f8b76d3bb5b36c7edf81c4d8f0d~2dtfkiTaw1303513035eusmtrp2a;
	Fri, 23 Feb 2024 10:22:58 +0000 (GMT)
X-AuditID: cbfec7f5-853ff70000002550-4b-65d87202dde3
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 02.E4.09146.20278D56; Fri, 23
	Feb 2024 10:22:58 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240223102256eusmtip2a43c558aeeb85bdd1a05aede28ca5078~2dteXDeEb1205012050eusmtip2J;
	Fri, 23 Feb 2024 10:22:56 +0000 (GMT)
Message-ID: <481aa3b9-55c2-4ccb-bb4a-58b924d77ad7@samsung.com>
Date: Fri, 23 Feb 2024 11:22:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 02/25] genirq/irqdomain: Remove the param count
 restriction from select()
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas
	Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
	Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
	<frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20240127161753.114685-3-apatel@ventanamicro.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf0xTVxjN7X197xVXfBRZr+BkqYrRIWjU5Bodk9jMt/GPLlsGuqEdvACh
	FPJqlbFsMGEOKnOiUUrTIQYya7Uwyg8pDMeajkadtSkZEpCQCQTpCv4ANwSBUR5u/HfO+c53
	z/d9uTSUTYnD6QzNMY7XqNQKMoho7nxxb4uI7+G21v4YhXvPbcRFT8bF2Oh1AVzsfhc3PbYQ
	+Hq7W4QvOd1iXOGfJ/GZR39CbBvsFuOuVhOJmyeKSGw33RLj0a5SiE8ZV+Jv2p0U1jtmSVxu
	eQRxg+0C3BvKdhfXE+yFmd8J1j86SrB2Yz/FVtl0rM1SQrIPun8m2XG3m2IbavJZb+F9ip19
	0USwE7a1B147FLQnlVNnHOf42LijQeme6ogcjzT3+ZXYAnBxhR5IaMTsQM0lY4QeBNEyxgxQ
	n6eTEsgkQF9/d3KJTAD0rPYy+aplvNEKhMIVgK5WlC2RpwC1eQdhwCVl4lDbMxMVwASzAf3S
	2EQKegi6VTFEBHAYE4kGeg2LnlAmBVlH6hcxZOSod+iSKPDoKuaOCM2caSGFQiVEZR1bAphk
	tiH9mH5RlyyEPWm5BwVPJLoxZoKBZsQ8lCDry0kozK1EzsohsYBDkc/VSAl4DZq3C2mI+Rag
	qpmBJXIWoIKRXiC4dqMH7umFOHohYhOqa40V5HjUZr5GBWTEBKOesRBhiGB0rrkcCrIUFZ+S
	Ce4oZHTV/hf7q8cLzwKFcdldjMv2Ny5bx/h/bhUgLEDO6bRZaZx2u4Y7EaNVZWl1mrSYlOws
	G1j4nHfmXM9bgNn3NMYBRDRwAERDxSqpN7OHk0lTVZ/ncXz2EV6n5rQOEEETCrl0Q2okJ2PS
	VMe4TI7L4fhXVREtCS8QXb0dtj4nnTQM1yWU5P01jT+8K2PqMqP/1nzv6FDevdnpVL+Vm7E3
	yTzcdu3NJK95bdc/tx86B32fDHjY8wMq5+55InmNTh13/O2+PfJ3XLs+KK0wHKxpsE7FJ9zv
	b4KbO8ZjL0Z1f9X/RaVz5erQMCU9k5xn9qfHGSYS8uPtr+unffRcQ+2nJftWlLn58i83Re9r
	Dfe/X7ouURYCD55MWlfdN9SV/dHNiBRHrm+nJfjjjJDJlmHqhynFe6rtv9VgZkSSH31dnJPY
	/tPjXdZCpamI2lr3kph/w3paLjtRfhlW8aeVyet9fl/97P6iQ4XVthufzR0+sP8PuT1xOtKw
	eucOBaFNV23bDHmt6l8BSnLFCwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupileLIzCtJLcpLzFFi42I5/e/4PV2mohupBvuXclrcmqRu0fLhHavF
	rEvHGS06zrlZbH2/isVizd5zTBbzj5xjtZj55j+bRd+Lh8wWmx5fY7W4vGsOm8W2zy1sFjvn
	nGS1eHm5h9mibRa/ReveI+wWXYf+sllMX/WC2WLzpqnMDsIe1zo2snhM/X2GxePNy5csHjtn
	3WX3WLCp1GPTqk42jzvX9rB5vDt3jt1j85J6j0vN19k9/v7cyuLxeZNcAE+Unk1RfmlJqkJG
	fnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsaFxdIFF3grvi7Xb2Cc
	xt3FyMkhIWAi8W7LWsYuRi4OIYGljBJHfq5ihkjISJyc1sAKYQtL/LnWxQZR9J5RYv2552wg
	CV4BO4ndn+awg9gsAqoS+7dshYoLSpyc+YQFxBYVkJe4f2sGWI2wQLLE2ucbwWxmAXGJW0/m
	M4EMFRE4zSTx/M0bMIdZYAGzxKHTj8GqhAQKJVZf2wJmswkYSnS97QLbwAm0+cOO88wQk8wk
	urZ2MULY8hLb385hnsAoNAvJIbOQLJyFpGUWkpYFjCyrGEVSS4tz03OLDfWKE3OLS/PS9ZLz
	czcxAhPFtmM/N+9gnPfqo94hRiYOxkOMEhzMSiK8l7JvpArxpiRWVqUW5ccXleakFh9iNAWG
	xkRmKdHkfGCqyiuJNzQzMDU0MbM0MLU0M1YS5/Us6EgUEkhPLEnNTk0tSC2C6WPi4JRqYGpu
	1nLLOGEsofI6ckOXv+n5VfY3fzrknLPYvSvzYM6Z/a81E3jdP73aEzzZnXuNTbDwykl7BOdH
	zSpW/zdLUNQnO7BM90JNyvGYz6fzt/xcWvG+YJn9harL+j+mPtH7tvLN/UXHJzNWZszpTdjx
	QsBryn4m9xB5Pz7Nue9O83PnFLEH2lgGBc0JLtM/8NrRUP3FjK/1Z3ZbfqsOnDlrpuuvyr2F
	08Lal+o3rNVJ0P+bfyRhtcbfjQXTnrIqCH13D13G/VRwy9P3BtUs0jHJHx6kHvq2MvqikJLJ
	rB//F35PMEn8srjTeW6nt3WQdExJWYiHj/2Zw5t3BXxYOKlgwcmWnHzHl643U0yay5nX+Cix
	FGckGmoxFxUnAgA2lDDwnQMAAA==
X-CMS-MailID: 20240223102258eucas1p119f38e40f769c883c0a502e9e26be888
X-Msg-Generator: CA
X-RootMTR: 20240223102258eucas1p119f38e40f769c883c0a502e9e26be888
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240223102258eucas1p119f38e40f769c883c0a502e9e26be888
References: <20240127161753.114685-1-apatel@ventanamicro.com>
	<20240127161753.114685-3-apatel@ventanamicro.com>
	<CGME20240223102258eucas1p119f38e40f769c883c0a502e9e26be888@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_022307_530279_FE370892 
X-CRM114-Status: GOOD (  18.37  )
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
Cc: devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Dear All,

On 27.01.2024 17:17, Anup Patel wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
>
> Now that the GIC-v3 callback can handle invocation with a fwspec parameter
> count of 0 lift the restriction in the core code and invoke select()
> unconditionally when the domain provides it.
>
> Preparatory change for per device MSI domains.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>


This patch landed recently in linux-next (next-20240221) as commit 
de1ff306dcf4 ("genirq/irqdomain: Remove the param count restriction from 
select()"). I've noticed that it breaks booting of Qualcomm's Robotics 
RB5 ARM64 board (arch/arm64/boot/dts/qcom/qrb5165-rb5.dts). Booting 
freezes after "clk: Disabling unused clocks", but this is probably a 
consequence of some earlier failure. Reverting $subject on top of 
next-20240221 fixes this problem. Let me know how can I help debugging 
this issue.


> ---
>   kernel/irq/irqdomain.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> index 0bdef4fe925b..8fee37918195 100644
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -448,7 +448,7 @@ struct irq_domain *irq_find_matching_fwspec(struct irq_fwspec *fwspec,
>   	 */
>   	mutex_lock(&irq_domain_mutex);
>   	list_for_each_entry(h, &irq_domain_list, link) {
> -		if (h->ops->select && fwspec->param_count)
> +		if (h->ops->select)
>   			rc = h->ops->select(h, fwspec, bus_token);
>   		else if (h->ops->match)
>   			rc = h->ops->match(h, to_of_node(fwnode), bus_token);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
