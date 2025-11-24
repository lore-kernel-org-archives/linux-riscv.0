Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2478CFD360
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 22:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AO6zX8OCGBe+mYKC8IzegEomBW7oWKXfh5upqyPcSCU=; b=baCQgDf0a9icL4
	7wh/+vNC8/rVpuQWikEv6FafwZhhz2BvTiZvb99dHdbJEK880/zwuciKS1NGoSsI73klo1DW0JS7N
	94FuTqS3YRPIyQq63nAnKTvWjYWc7v9s+gp2YQDfcpvzIxdtRENLN3ujFAsjRhwZM5U3/19K8Uxl2
	bj9W5B3XxzaGX8ghNVJ7SGRLB5V23wQ9H+VfybyvZ4vnz0NXymXd5+ELqwyNHQ6i59qxDsSVyvWUh
	w2WXe9cyjw3i7NVJ7gVQ75N5jm8oMnXn4FQv++BIqHg1KwATdaQFuWjo18Uw8f0IZEklxWUXcznm/
	u9blVmhRrWcV1zQkaKUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNep9-0000000COBH-3DpA;
	Mon, 24 Nov 2025 22:14:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNep8-0000000COB9-49ek
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 22:14:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D176160176;
	Mon, 24 Nov 2025 22:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438F8C4CEF1;
	Mon, 24 Nov 2025 22:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764022457;
	bh=X5rTnBSBrVgTkVzp28RbqSqmTe/kFqDgUr/E2r+hfVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mwAGam3oa7VeJpzni0NHbgXIU0YCP3OlbDkDHxRhfvjCeDKMLtMUmeYfMXRqiOP67
	 MrNXONg5LMA9h00ZLewitRoBiGMLDk60hP/6nVqS+Vd1kwWzh7KFWW6UYVzKLmUysh
	 XqHQ5UWGssDCvO5efPcOYxHHQu2OTAIRYThzPZEEtOes16BFmPh7DdKlE5wBly1pM0
	 mPaC+c5MVUukAYoOzI+JaWv97qK0j5SSvsCHX/Swd9wqegDWPEkyPc01fSXi5mHemq
	 nP2FpH/0tFelPvxKL4efp5BAgwQgLE3J+VrpLZ2m5qxQrFZrGFjlo0/FRJQq3UJTOf
	 jfBJ5/MY46rGw==
Date: Mon, 24 Nov 2025 14:14:15 -0800
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH 5/7] clk: thead: th1520-ap: Add macro to define
 multiplexers with flags
Message-ID: <aSTYt3mlJCC0f5TG@x1>
References: <20251120131416.26236-1-ziyao@disroot.org>
 <20251120131416.26236-6-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251120131416.26236-6-ziyao@disroot.org>
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

On Thu, Nov 20, 2025 at 01:14:14PM +0000, Yao Zi wrote:
> The new macro, TH_CCU_MUX_FLAGS, extends TH_CCU_MUX macro by adding two
> parameters to specify clock flags and multiplexer flags.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> index bf8e80c39a9e..79f001a047b2 100644
> --- a/drivers/clk/thead/clk-th1520-ap.c
> +++ b/drivers/clk/thead/clk-th1520-ap.c
> @@ -101,17 +101,22 @@ struct ccu_pll {
>  		.flags	= _flags,					\
>  	}
>  
> -#define TH_CCU_MUX(_name, _parents, _shift, _width)			\
> +#define TH_CCU_MUX_FLAGS(_name, _parents, _shift, _width, _flags,	\
> +			 _mux_flags)					\
>  	{								\
>  		.mask		= GENMASK(_width - 1, 0),		\

checkpatch warns [1] about this line:

CHECK: Macro argument '_width' may be better as '(_width)' to avoid precedence issues

I noticed it in the patchwork CI results [2] but I think we can ignore
that as this patch is not actually changing that line.

Thanks,
Drew

[1] https://gist.github.com/linux-riscv-bot/a335020c99ef628bb38e0a4ea85e0c45
[2] https://patchwork.kernel.org/project/linux-riscv/patch/20251120131416.26236-6-ziyao@disroot.org/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
