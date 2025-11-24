Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534E4CFD360
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 22:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uJFgGLzhFJfOoUwTXNu53Waz9EgeyKk7ZRc+d4gcHLE=; b=t1eWhGQC7EcjyB
	KxUQobIUF2nvrtYSQ7D/zJlLNqj+OHO+nN0JmVkZ/AVrsuhBsoNhrtc1c0IvnXxlx021nBlyqRfHQ
	NzAO8+pedRTFAMua40rMSvkZmWwrStO2RjU5s8PzvZIEuHAmzQDWOfmfn0lfE1CAB0nNtP+ZtCxtE
	j3JAtygTkoYGEJMdp0xyMFGmqRhfZGmSZSemKqNiM+KDtd2wmqmDyrzyf08pSzq1Q0Xo0ubQuQyfG
	7N89/guhgtRmGbG5ALvI8OzUgWTX16FbqXKXJ8novwq1LA7j6G+q02ujfUGZAQgrvIAUNG205NmRu
	sqfT52elFOZwqM26wguA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNej7-0000000CNvv-43v5;
	Mon, 24 Nov 2025 22:08:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNej5-0000000CNvW-3uyo
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 22:08:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A6FF8442FB;
	Mon, 24 Nov 2025 22:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442DBC4CEF1;
	Mon, 24 Nov 2025 22:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764022082;
	bh=tRIizhAm0T07j/KjWlRXHqsJfg1L4Mqka5PJmjK76b8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yi4Lmhlpw+CmUaQsBeZJ/CC0+dmrJeDNcb2LB4tkQo0gJ1gwcsormH560h7ZdKxZS
	 f0o5n8vJnBtRz5WTql7AOBmEYgDOdxOYvQqMU842AMM7Q3WkVDHSwwsDBIjPizJQg8
	 DcgwbQJiluIeZ8MltHdHv0W5vgeAVABVYPYXttj+4ekyBxh+mIRYUJg72/EVSGvmhN
	 BDlTITqJ5+ixP3E+STbmbZGLSLcBI8ttejkwOOpllGQgPwslKjJeK1wmJXjxQvd3S3
	 nb0sVqo4SiZJwj3bn4ax/hrbfkMP8MO6kOPacC5KeqEUPouboxVINkO/FDAHmMor6G
	 YAhEmb2jo6moA==
Date: Mon, 24 Nov 2025 14:08:00 -0800
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH 2/7] clk: thead: th1520-ap: Poll for PLL lock and wait
 for stability
Message-ID: <aSTXQG5yIIGFjflG@x1>
References: <20251120131416.26236-1-ziyao@disroot.org>
 <20251120131416.26236-3-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251120131416.26236-3-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_140804_012747_2BED9E16 
X-CRM114-Status: GOOD (  19.04  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Guo Ren <guoren@kernel.org>, Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 20, 2025 at 01:14:11PM +0000, Yao Zi wrote:
> All PLLs found on TH1520 SoC take 21250ns at maximum to lock, and their
> lock status is indicated by register PLL_STS (offset 0x80 inside AP
> clock controller). We should poll the register to ensure the PLL
> actually locks after enabling it.
> 
> Furthermore, a 30us delay is added after enabling the PLL, after which
> the PLL could be considered stable as stated by vendor clock code.
> 
> Fixes: 56a48c1833aa ("clk: thead: add support for enabling/disabling PLLs")
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 34 +++++++++++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)

Thanks for working on this patch series.

[...]
> @@ -299,9 +310,21 @@ static void ccu_pll_disable(struct clk_hw *hw)
>  static int ccu_pll_enable(struct clk_hw *hw)
>  {
>  	struct ccu_pll *pll = hw_to_ccu_pll(hw);
> +	u32 reg;
> +	int ret;
>  
> -	return regmap_clear_bits(pll->common.map, pll->common.cfg1,
> -				 TH1520_PLL_VCO_RST);
> +	regmap_clear_bits(pll->common.map, pll->common.cfg1,
> +			  TH1520_PLL_VCO_RST);
> +
> +	ret = regmap_read_poll_timeout_atomic(pll->common.map, TH1520_PLL_STS,
> +					      reg, reg & pll->lock_sts_mask,
> +					      5, TH1520_PLL_LOCK_TIMEOUT_US);

Is there a reason for the specific value of 5 uS polling delay?

> +	if (ret)
> +		return ret;
> +
> +	udelay(TH1520_PLL_STABLE_DELAY_US);

Is it the case that the 30 uS delay after the lock bit is set is just so
that it has the same behavior as the vendor's code? Or did you notice
stability problems without this?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
