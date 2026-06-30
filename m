Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F90EC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 22:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5U6TNfE4jPSF4UHj9/1CF+KHRkWtVoc/9hagC74Uklc=; b=zoZQO619FbOk+K
	1mWmhq2bDIxmo4IzQ2WTxIgAxiTWUAGFP9h5vbcxF06IeH/6mEH5/5R7xlnSubhHvrT5yr9xiiBNZ
	uOkI3GbXrcZUATQX7UBgc7RWJiRBLCoG1nMTX9m0Osm3WePJgIucflf5ccUjBDWORczBzQVLz/YcC
	1edSs4oXYtfxx2EUP+1JcT3ESlkR7IsmxfViwQUBXnHpaYaP2boT/TUMh9uRS26Qmiw+inr+PuoYo
	D/SMYX0Cq05aujJF4DPK7YUy5R86A/vXzSCVj8AHFYgNxniso/B+62xGwGvvTtHWmNnl1HNdIMZ3/
	CX+vHFFgTyr2yBkmelHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wehHq-00000000KXH-0fB0;
	Tue, 30 Jun 2026 22:50:38 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wehHm-00000000KWR-4BEe
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 22:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=4yOHXYidOTt8EhkcSsV80MxwAjWABsRVdmYL86w7iKY=; b=nv6C1qCZ52dQll0ATVWSGqe61j
	4GGPxai7Q/raLVXMvWoQ5+8asMYzfXqfDlrjwOhFvHTY3WNhIljufACORK1A1RSc8OnPrVv1uXV80
	7rB1YPCnN9fhwe2JG5MlrXWjvL6dMsr49mFyXqcMXWE2DDOVyFGB7HOCX74d9X29cGe85wgySbEkN
	fy+PxMWty6OyWs6rtTJHPf5an7OkYQ0ky4rGhtmqD6h3tbvpihcniA64emjVcZBu7PVaYzqqqugrA
	nH7+GXRf9t+Y7X42UW+55iH5NK+VaUjsMMAJJvh0E1v/AhgRoYMFgirglEIGDZF86rmEbMZEp8H00
	vOEyxhFQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wehHV-0000000DyYV-30ci;
	Wed, 01 Jul 2026 00:50:17 +0200
Date: Wed, 1 Jul 2026 00:50:17 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Yixun Lan <dlan@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Han Gao <gaohan@iscas.ac.cn>, Vivian Wang <wangruikang@iscas.ac.cn>,
	Drew Fustini <fustini@kernel.org>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: spacemit: k3: set hdma clock as critical
Message-ID: <akRIKSoI8zWlfcfJ@aurel32.net>
Mail-Followup-To: Yixun Lan <dlan@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Han Gao <gaohan@iscas.ac.cn>, Vivian Wang <wangruikang@iscas.ac.cn>,
	Drew Fustini <fustini@kernel.org>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
References: <20260630-06-clk-hdma-critial-v1-0-443c0ac88c5f@kernel.org>
 <20260630-06-clk-hdma-critial-v1-1-443c0ac88c5f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260630-06-clk-hdma-critial-v1-1-443c0ac88c5f@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_155035_075771_7D6958ED 
X-CRM114-Status: GOOD (  14.43  )
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

On 2026-06-30 08:53, Yixun Lan wrote:
> HDMA clock is responsible for the internal TCM access path of X100 RISC-V
> core, so set the clock flag as critical to prevent it from being shut off,
> otherwise the Linux system will hang.
> 
> Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
> Reported-by: Han Gao <gaohan@iscas.ac.cn>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/clk/spacemit/ccu-k3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
> index cb0c4277f72a..f0160b4c0e1b 100644
> --- a/drivers/clk/spacemit/ccu-k3.c
> +++ b/drivers/clk/spacemit/ccu-k3.c
> @@ -1026,7 +1026,7 @@ CCU_MUX_DIV_GATE_DEFINE(isim_vclk_out3, isim_vclk_parents, APMU_SNR_ISIM_VCLK_CT
>  /* APMU clocks end */
>  
>  /* DCIU clocks start */
> -CCU_GATE_DEFINE(hdma_clk, CCU_PARENT_HW(axi_clk), DCIU_DMASYS_CLK_EN, BIT(0), 0);
> +CCU_GATE_DEFINE(hdma_clk, CCU_PARENT_HW(axi_clk), DCIU_DMASYS_CLK_EN, BIT(0), CLK_IS_CRITICAL);
>  CCU_GATE_DEFINE(dma350_clk, CCU_PARENT_HW(axi_clk), DCIU_DMASYS_SDMA_CLK_EN, BIT(0), 0);
>  CCU_GATE_DEFINE(c2_tcm_pipe_clk, CCU_PARENT_HW(axi_clk), DCIU_C2_TCM_PIPE_CLK, BIT(0), 0);
>  CCU_GATE_DEFINE(c3_tcm_pipe_clk, CCU_PARENT_HW(axi_clk), DCIU_C3_TCM_PIPE_CLK, BIT(0), 0);

Thanks for the patch. It fixes a system hang occuring when a vector 
instruction access generates a page fault.

Tested-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
