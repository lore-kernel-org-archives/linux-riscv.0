Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9C3E8FDA7
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Dec 2025 11:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iiYxTNOr9Xen7CsI9yKWGu767zzDiQ1jUXdKGyUnNxs=; b=NItmDNy0fRceX2
	KW2+3Zr+85MGTMjAvEhaB1v2HRKzZ+50arMkxiVLndxcWXqNy0yUx8oQqTkXnB+E3I92lH/tt8QH6
	wRyuBS8f4z4JVu8RebBs0yvm3hA8pkp7O1lFIV1UOBLa8da5+i9vVbtR1mBWLRoDoqndOcJn3uAdp
	4uBeheiIkmlNmTip5OjRecD8CF0axe1oWSKOZTjzDlBet2EAxLYw9eA9hVLpsATf86g7/sfqHcpGm
	7/vEoZiNvkGTwgy9bSKe5lpSg3S/GB0OF3oa8jG9ryDN4ZD8+BpWOs65FHpg9F+eChbJNX708Wu8/
	GzezaC/m/K3H0DEYMebA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ6B8-000000019Wg-41nk;
	Fri, 26 Dec 2025 11:40:18 +0000
Received: from mail12.out.flockmail.com ([52.7.194.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ6B6-000000019WE-15Hf
	for linux-riscv@lists.infradead.org;
	Fri, 26 Dec 2025 11:40:17 +0000
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4dd3ZM6GTQz2xDK;
	Fri, 26 Dec 2025 11:40:11 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=+MVXjyTjnpv8ySZ72fp3o6XSzP+ZPlo9JjXRLopZJuQ=;
	c=relaxed/relaxed; d=ziyao.cc;
	h=subject:message-id:references:date:from:cc:to:mime-version:in-reply-to:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1766749211; v=1;
	b=D9/r7Fe3rMBLfuc4fqi3N8J4LjrsrtuMNr8iTUFAZQPh9KBGyLDIIa99BMpsrgLdtElBW0Qr
	GrhABI7KJLjyQufOvYqly+AE9BUn39DAbsrHwvof66q4yFWZXPWAK8W0Ujc+Qqjnek6x1HBeazi
	urT2WLy1z60o0gY6fMKEDCWk=
Received: from pie (unknown [117.171.66.90])
	by smtp-out.flockmail.com (Postfix) with ESMTPA id 4dd3ZG0Hzzz2xBN;
	Fri, 26 Dec 2025 11:40:05 +0000 (UTC)
Date: Fri, 26 Dec 2025 11:39:56 +0000
Feedback-ID: :me@ziyao.cc:ziyao.cc:flockmailId
From: Yao Zi <me@ziyao.cc>
To: Yixun Lan <dlan@gentoo.org>, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Haylen Chu <heylenay@4d2.org>, Guodong Xu <guodong@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] clk: spacemit: k3: add the clock tree
Message-ID: <aU50DIe9qMneb0GT@pie>
References: <20251226-k3-clk-v3-0-602ce93bb6c3@gentoo.org>
 <20251226-k3-clk-v3-5-602ce93bb6c3@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251226-k3-clk-v3-5-602ce93bb6c3@gentoo.org>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1766749211720356104.27573.6619602783841146947@prod-use1-smtp-out1001.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=WtDRMcfv c=1 sm=1 tr=0 ts=694e741b
	a=rBp+3XZz9uO5KTvnfbZ58A==:117 a=rBp+3XZz9uO5KTvnfbZ58A==:17
	a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10 a=CEWIc4RMnpUA:10 a=7mOBRU54AAAA:8
	a=wGuAUZxNjwbEZGsxmboA:9 a=CjuIK1q_8ugA:10 a=wa9RWnbW_A1YIeRBVszw:22
	a=3z85VNIBY5UIEeAh_hcH:22 a=NWVoK91CQySWRX1oVYDe:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_034016_404840_2BDBF823 
X-CRM114-Status: GOOD (  17.99  )
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

On Fri, Dec 26, 2025 at 07:01:20PM +0800, Yixun Lan wrote:
> Add clock support to SpacemiT K3 SoC, the clock tree consist of several
> blocks which are APBC, APBS, APMU, DCIU, MPUM.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/clk/spacemit/Kconfig      |    6 +
>  drivers/clk/spacemit/Makefile     |    3 +
>  drivers/clk/spacemit/ccu-k3.c     | 1482 +++++++++++++++++++++++++++++++++++++
>  drivers/clk/spacemit/ccu_common.c |    3 +-
>  4 files changed, 1493 insertions(+), 1 deletion(-)

...

> diff --git a/drivers/clk/spacemit/ccu_common.c b/drivers/clk/spacemit/ccu_common.c
> index f1a837aafb46..5132f73be68d 100644
> --- a/drivers/clk/spacemit/ccu_common.c
> +++ b/drivers/clk/spacemit/ccu_common.c
> @@ -144,7 +144,8 @@ int spacemit_ccu_probe(struct platform_device *pdev)
>  	 * are in APBS region. Reference to MPMU syscon is required to check PLL
>  	 * status.
>  	 */
> -	if (of_device_is_compatible(dev->of_node, "spacemit,k1-pll")) {
> +	if (of_device_is_compatible(dev->of_node, "spacemit,k1-pll") ||
> +		of_device_is_compatible(dev->of_node, "spacemit,k3-pll")) {

To me it's better to add a argument to spacemit_ccu_probe to specify the
compatible of PLL, so we don't need to modify ccu_common.c each time a
new SoC is introduced, and the condition won't be pretty long in the
future.

It isn't a serious issue for now, and I think this piece of code is
acceptable.

>  		struct device_node *mpmu = of_parse_phandle(dev->of_node,
>  							    "spacemit,mpmu", 0);
>  		if (!mpmu)

Regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
