Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339FB606A33B
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 01:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mc9UwImC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nf7mnAS7upMzSLDP6OjiUmTbt1g5TVapPaHosDrdPaM=; b=mc9UwImCo427SFwrmhXDllAhzt
	Pji9EHiuRmyAbXhGiIJS5Qry1Pldv6CgAHBVkd2+MbOnwHp2eLtL2qh2q/mtTkM/uljRH1DAQP0ci
	bMHBhcA36nkCzAshE7yeVN/Qgohzx3IsBxCDr6QpxJg84mFfmb75bAuT2THzncscEgYwe9q9pFAbx
	0dKITWTTrSdG+cN2+yYu5VWHEX+l6Le3h/rAfeq0zLl+ZdNjGDpnG6ytuvUNVtDtGWfCV2FEaAyoB
	WZscOHNambP6K8X377fwAxEINpgYg99PlYW6YTirDjH/tx09hflof3m9Wldpg6awNfcXpillxbC8i
	wJJs+03A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJMZ-00000008Jqj-2IyH;
	Thu, 12 Nov 2026 01:12:27 +0000
Received: from azure-sdnproxy.icoremail.net ([207.46.229.174])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJMW-00000008Jq9-1N4m
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 01:12:26 +0000
Received: from dongxuyang$eswincomputing.com ( [10.12.96.41] ) by
 ajax-webmail-app2 (Coremail) ; Thu, 12 Nov 2026 09:12:05 +0800 (GMT+08:00)
Date: Thu, 12 Nov 2026 09:12:05 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Xuyang Dong" <dongxuyang@eswincomputing.com>
To: "Han Gao" <gaohan@iscas.ac.cn>,
	"Yifeng Huang" <huangyifeng@eswincomputing.com>,
	"Stephen Boyd" <sboyd@kernel.org>,
	"Brian Masney" <bmasney+clk@redhat.com>,
	"Jerome Brunet" <jbrunet+clk@baylibre.com>
Cc: "Brian Masney" <bmasney@redhat.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	"Min Lin" <linmin@eswincomputing.com>,
	"Pinkesh Vaghela" <pinkesh.vaghela@einfochips.com>,
	"Pritesh Patel" <pritesh.patel@einfochips.com>,
	"Han Gao" <rabenda.cn@gmail.com>
Subject: Re: [PATCH] clk: eswin: Keep the TCU AXI clock enabled
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20261110-eic7700-tcu-aclk-v1-1-72db82bf59c1@iscas.ac.cn>
References: <20261110-eic7700-tcu-aclk-v1-1-72db82bf59c1@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <b81e73b.6e7.1a1cd4fdbb8.Coremail.dongxuyang@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TQJkCgAnPqFlEvVqyMiJAA--.15625W
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/1tbiAgEJAmr0mS0Ic
	gAAsY
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_171224_743534_0C516B5E 
X-CRM114-Status: GOOD (  13.16  )
X-Spam-Score: -2.6 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> 
> The SMMU TCU needs its AXI clock for DMA, even in bypass mode. No driver
> claims this clock, so clk_disable_unused() gates it and DMA through the
> SMMU stalls. On the HiFive Premier P550, this hangs firmware loading of
> an RX550 graphics card.
> 
> Mark the clock as critical.
> 
> Fixes: cd44f127c1d4 ("clk: eswin: Add eic7700 clock driver")
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
> Tested on the HiFive Premier P550 with an RX550 graphics card:
> 
> - Without this patch, amdgpu stalls while loading the RX550 firmware
>   and CPUs can no longer be halted.
> - With only the TCU AXI clock kept enabled (the TCU configuration clock
>   is still managed normally), amdgpu initializes and the IB ring tests
>   pass without any manual register writes.
> ---
>  drivers/clk/eswin/clk-eic7700.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/eswin/clk-eic7700.c b/drivers/clk/eswin/clk-eic7700.c
> index 43a47fe16ab14ae1d1cacc3a0da0203e412541c0..7c95055f13eb782a03723e4475d63060d37711aa 100644
> --- a/drivers/clk/eswin/clk-eic7700.c
> +++ b/drivers/clk/eswin/clk-eic7700.c
> @@ -832,8 +832,10 @@ static struct eswin_clk_info eic7700_clks[] = {
>  	ESWIN_GATE_TYPE(EIC7700_CLK_GATE_D2D_CFG_CLK, "gate_d2d_cfg_clk",
>  			EIC7700_CLK_MUX_SYSCFG_CLK_ROOT_2MUX1_GFREE,
>  			CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_D2D_CFG, 31, 0),
> +	/* DMA through the SMMU still needs the TCU AXI clock in bypass mode. */
>  	ESWIN_GATE_TYPE(EIC7700_CLK_GATE_TCU_ACLK, "gate_tcu_aclk",
> -			EIC7700_CLK_DIV_DDR_ACLK_DYNM, CLK_SET_RATE_PARENT,
> +			EIC7700_CLK_DIV_DDR_ACLK_DYNM,
> +			CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>  			EIC7700_REG_OFFSET_TCU_ACLK, 31, 0),
>  	ESWIN_GATE_TYPE(EIC7700_CLK_GATE_TCU_CFG_CLK, "gate_tcu_cfg_clk",
>  			EIC7700_CLK_MUX_SYSCFG_CLK_ROOT_2MUX1_GFREE,
> 

Acked-by: Xuyang Dong <dongxuyang@eswincomputing.com>

Thanks,
Xuyang Dong
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
