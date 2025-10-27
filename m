Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996A0CCF9E5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 11:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u1O29c5e8MhNhIyk1tERiN5ExWmfzr2ryjpFSWsJMHw=; b=H+BZuI4/n5uDXu
	KuJt2ZEMjTP2L+dGg7DF0v50KijttdE/UMJGPDAANbeIng0CYRW0wAbbydor3Rp0JrogK4OQsI03O
	ddn6MQx2lGfW7HsAnBTUnEaA/jcYSvi6Ad/zsq9zl9zIG3lR6j7LaFVp7EYCPBe89IeKPNnfJErnA
	JCd707iYI1qSJgtu+gqZq4Yyx7Xzm6AzRBzRWOl4JPqstEA7H0pSCO64HJQuu70QfKZRTwiOXVu8Z
	x+faGSBaAoH6XJCyNkEeQCbn3MXoExdfEErPRGg4yoV8nm4kcZDLefFtxXSVBqHUnyrBi6M70etpg
	6kavyzVhcQ3hUilNoL5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLps-0000000DpIX-18Ll;
	Mon, 27 Oct 2025 11:56:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLpr-0000000DpI3-0Ddc
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 11:56:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B367611F7;
	Mon, 27 Oct 2025 11:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82500C4CEF1;
	Mon, 27 Oct 2025 11:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761566186;
	bh=sS1lIlP0t/Ne7eJT0CnV8aE5TtS6WT4gJ2MXWuhWQWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NTR3uudJBfLWhNLSRn3Wtwg9aDPkR2gB+WJWl/df0PCoUi43ruJfSAycB5vsYR7oe
	 iFdgNJXzkGPo0OFXaO1ymYdeWEdtnnSh95Snn+VgYz6H3FQ29DwMPqri+/Ojab656y
	 jqdIBih0bGnmez5tdtCKFGX5KM1s+hJl1F1h0FRgh1iLkf6WnuTOueA4UULvE9BWNF
	 PBT8BPRfSMtZKX1KKdAfgBzCpwWCSyWtZ/J5DpVeSHFJ2tuOVYRXLl4GU8fAzA6ZT7
	 Sez7ZjoezZbp+mXHWVlIebRKZt5pbt1o29YiqDIO16ET7Fz3WJjaYNn3Ly4KtbCF6k
	 bfZjv0VW3TCIw==
Date: Mon, 27 Oct 2025 11:56:15 +0000
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH v3 5/5] riscv: dts: thead: Add reset controllers of more
 subsystems for TH1520
Message-ID: <aP9d3-deezGtCbHr@gen8>
References: <20251014131032.49616-1-ziyao@disroot.org>
 <20251014131032.49616-6-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251014131032.49616-6-ziyao@disroot.org>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Michal Wilczynski <m.wilczynski@samsung.com>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 14, 2025 at 01:10:32PM +0000, Yao Zi wrote:
> Describe reset controllers for VI, MISC, AP, DSP and AO subsystems. The
> one for AO subsystem is marked as reserved, since it may be used by AON
> firmware.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 37 +++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index e680d1a7c821..15d64eaea89f 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -277,6 +277,12 @@ clint: timer@ffdc000000 {
>  					      <&cpu3_intc 3>, <&cpu3_intc 7>;
>  		};
>  
> +		rst_vi: reset-controller@ffe4040100 {
> +			compatible = "thead,th1520-reset-vi";
> +			reg = <0xff 0xe4040100 0x0 0x8>;

Is this intentional so that the first VI_SUBSYS register, VISYS_SW_RST
at offset 0x100, will have an offset of 0 from the thead,th1520-reset-vi
reg in the driver?

[snip]
> +		rst_dsp: reset-controller@ffef040028 {
> +			compatible = "thead,th1520-reset-dsp";
> +			reg = <0xff 0xef040028 0x0 0x4>;

Similar to rst_vi, is this intentional so that the first register,
DSPSYS_SW_RST at offset 0x28, will have an offset of 0 in the driver?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
