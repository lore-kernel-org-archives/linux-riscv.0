Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF43D10F5F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 14:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hl+ZczCNsSC/0zkjjFpV0lgy0zMEhar28WsTphtwRNw=; b=qpb8BIzA293Wwv
	X/m/MUwGDijtgWCSMSs1jEnHLEigginVUy67NGhSkv0JHQqPF23T69RC5UbLtE7TaF14VJEl1MeKa
	Mez84UeVNAyCTBEVqdIqYJqzlecoZaASdGPND0NPisIXIixXd18BtyTs4L/Ghbg2B7XPLUf8k5kIc
	iPWGX2QBhvv53KfLEnPANYnj9G/d1hjhS8GQRwHPX8H5Izf3VQhumqAj2rQQ1HiCQq6dPbf+cxiIv
	SQH30IU4/zDkLnDKmgH+oABG9vcsdP+DPcBSBzb4rbWgibpWxLBG/7gHs/HiXd8KC4Vz+fG81lPJD
	9ieFniANymZHe/57wDMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGsN-0000000F8Rp-09Ae;
	Wed, 26 Nov 2025 14:52:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGsL-0000000F8RD-1TIZ
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 14:52:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 25D1843C2E;
	Wed, 26 Nov 2025 14:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA5EC4CEF8;
	Wed, 26 Nov 2025 14:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764168728;
	bh=/74vt1wLn3+rm0dgzz3/LNuVx0j7rjTd7baJ/SYk8AM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nyw+WcUQ7QSYKvf6wezEamKmiyBYM04xUfnv5bwOL0E5nqP2N0ztvewCWm52Zxp9y
	 o94JbfSlu8BLWmtJqHyFbqJiEZvNB/hcSpLKZhe6OOn6q/ZHRcKoe0ddJ9w7TbMgA+
	 1O+FKE+jx1kUpKz/PU7pLhzQ/m2WipEQsYI6S8Ey1GUu6egcjJBXlfE1L9lrF/U5XV
	 k/OKe17lvW5yLelWzsaap78f55rwQy84r9v8wHtkzUPXJoxB+a7IPENviSNUxPdd6f
	 Qidov0tRgNKAywqD57PVZiLxeHHC7tqU3imEQQV1A+sWFrhcrQX+xpjqTo7UFYAweh
	 eMB3J2zoViyRw==
Date: Wed, 26 Nov 2025 08:52:00 -0600
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH 2/7] clk: thead: th1520-ap: Poll for PLL lock and wait
 for stability
Message-ID: <aScUELnY-TC8kVzV@gen8>
References: <20251120131416.26236-1-ziyao@disroot.org>
 <20251120131416.26236-3-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251120131416.26236-3-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_065209_432526_73F5C4ED 
X-CRM114-Status: GOOD (  20.27  )
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
> 
> diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
[...]
> +/*
> + * All PLLs in TH1520 take 21250ns at maximum to lock, let's take its double
> + * for safety.
> + */
> +#define TH1520_PLL_LOCK_TIMEOUT_US	44
> +#define TH1520_PLL_STABLE_DELAY_US	30

I'm taking a second look at this and I think it might be best to add a
define for the polling loop delay of 5. It could be helpful when other
people read the code later.

[...]
> +	ret = regmap_read_poll_timeout_atomic(pll->common.map, TH1520_PLL_STS,
> +					      reg, reg & pll->lock_sts_mask,
> +					      5, TH1520_PLL_LOCK_TIMEOUT_US);

The loop delay is only used here but I think using a #define would make
it more readable.

Other than that:
Reviewed-by: Drew Fustini <fustini@kernel.org>

If no other changes are needed I could fix this up on apply. Let's see
what other comments there may be. It's too late for me to send a 6.19
clk pull request so this will have to target the next merge window. I
can put it into linux-next once 6.19-rc1 is released.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
