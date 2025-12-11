Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611F7D3E78A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Dec 2025 03:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yNiS4A1ECEZ2VEsbR+R/9HQCXP5r0t4PadU8nlL67/I=; b=c9cTLhDB5xsKyZ
	kCzoo5oaCY/56wk8LRzOrmw5gH3fbHaUXML2guI5hug4qIiOnENwlcyGaGWr0Qj9ZEteu4fNucRym
	2LSvEmVhvzfy3oNgdc67ClPJk7VK+5LXQ3jkIJTI1EeXp5eeV7Rtm3sC2sdUJ76cRgnk0zz4pMPfr
	YCZeHC1/2UjhF//VF2aVshDyOqoIbZvkOSpqeRCkekUU8+j83HhBZi9fDrPh9w2zYJa9TfQQyJifO
	RUDqXqXLvnLlAEpJ6sblQn5+JVzADAV0aiDLoUOJTEO/YLMfXXBxk2B49I/xS48yT5U7666UIpMPz
	D8GiSP5bhi8oku7ljWug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTXKH-0000000GA4F-19Am;
	Thu, 11 Dec 2025 03:26:45 +0000
Received: from mail78.out.titan.email ([3.216.99.58])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTXKE-0000000GA3Y-2EgM
	for linux-riscv@lists.infradead.org;
	Thu, 11 Dec 2025 03:26:44 +0000
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4dRdKp3tpQz9rx9;
	Thu, 11 Dec 2025 03:26:38 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=G/iuUnjpcIevUzMMPzirSlOjACwdcdZsgXjZiOGXtCw=;
	c=relaxed/relaxed; d=ziyao.cc;
	h=subject:references:mime-version:from:to:cc:in-reply-to:date:message-id:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1765423598; v=1;
	b=NaNJjnf9R54AbOoy9olS0jWo1uXGTAv3OqUnuRGk/uFu3dmsvOK7Vdfhg38BX15wkCfu6kMt
	+DdgogPii7wGeSAcUujQpKIYMck4LqNfrgpTAzRzi7+KC0WxpX/LWgZCdx9+i2EZDcQcTUp34S4
	9KKgMlERIteK+fwOYnTrx3Oo=
Received: from pie (unknown [117.171.66.90])
	by smtp-out.flockmail.com (Postfix) with ESMTPA id 4dRdKk13CSz9rwy;
	Thu, 11 Dec 2025 03:26:33 +0000 (UTC)
Date: Thu, 11 Dec 2025 03:26:25 +0000
Feedback-ID: :me@ziyao.cc:ziyao.cc:flockmailId
From: Yao Zi <me@ziyao.cc>
To: Yixun Lan <dlan@gentoo.org>, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Haylen Chu <heylenay@4d2.org>, Inochi Amaoto <inochiama@gmail.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/4] clk: spacemit: ccu_mix: add inverted enable gate
 clock
Message-ID: <aTo54Q3luukdJiJw@pie>
References: <20251211-k3-clk-v1-0-8ee47c70c5bc@gentoo.org>
 <20251211-k3-clk-v1-2-8ee47c70c5bc@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251211-k3-clk-v1-2-8ee47c70c5bc@gentoo.org>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1765423598363540247.21635.6277641652149414312@prod-use1-smtp-out1003.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=TPG/S0la c=1 sm=1 tr=0 ts=693a39ee
	a=rBp+3XZz9uO5KTvnfbZ58A==:117 a=rBp+3XZz9uO5KTvnfbZ58A==:17
	a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10 a=CEWIc4RMnpUA:10 a=7mOBRU54AAAA:8
	a=sWB5wAynvVkB54t-ZH0A:9 a=CjuIK1q_8ugA:10 a=wa9RWnbW_A1YIeRBVszw:22
	a=3z85VNIBY5UIEeAh_hcH:22 a=NWVoK91CQySWRX1oVYDe:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_192642_680236_038C3E10 
X-CRM114-Status: GOOD (  13.30  )
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

On Thu, Dec 11, 2025 at 09:19:42AM +0800, Yixun Lan wrote:
> K3 SoC has the clock IP which support to write value 0 for enabling the
> clock, while write 1 for disabling it, thus the enable BIT is inverted.
> So, introduce a flag to support the inverted gate clock.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/clk/spacemit/ccu_mix.c | 12 ++++++++----
>  drivers/clk/spacemit/ccu_mix.h | 12 ++++++++++++
>  2 files changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
> index 7b7990875372..14fbf7048c89 100644
> --- a/drivers/clk/spacemit/ccu_mix.c
> +++ b/drivers/clk/spacemit/ccu_mix.c
> @@ -16,17 +16,19 @@
>  static void ccu_gate_disable(struct clk_hw *hw)
>  {
>  	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> +	struct ccu_gate_config *gate = &mix->gate;
> +	u32 val = gate->inverted ? gate->mask : 0;
>  
> -	ccu_update(&mix->common, ctrl, mix->gate.mask, 0);
> +	ccu_update(&mix->common, ctrl, gate->mask, val);
>  }
>  
>  static int ccu_gate_enable(struct clk_hw *hw)
>  {
>  	struct ccu_mix *mix = hw_to_ccu_mix(hw);
>  	struct ccu_gate_config *gate = &mix->gate;
> +	u32 val = gate->inverted ? 0 : gate->mask;
>  
> -	ccu_update(&mix->common, ctrl, gate->mask, gate->mask);
> -
> +	ccu_update(&mix->common, ctrl, gate->mask, val);

An unrelated blank line gets removed here, is this intended?

>  	return 0;
>  }

Regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
