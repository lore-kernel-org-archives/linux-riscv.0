Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD9CCA5FB1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 10:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JWEZvge3B9TrPsbBPIjwlim2kvotoQd9n8pGR0Je8E8=; b=JxOfeqJ7agMSTs
	6ijX8pgmzmxq1yxt8KzfZkV2n/CS6Cijv/e25RyRbFjH831P+JLNFGkh1aafP2ppLdSotJYldu2pf
	3gpC8lxeJ6eYSydm5iK7rKPmGapjLlROCnttZpsNThS1dEfdQE7LsBGoOhmuwWMHrlejVBAsrYHpd
	PFeiU+QxQ7aMFG8ifxsZIMV6LnCWzSfuW5xXn4GPrrYambFLtJ+v6SrLfntsR2yC9qa4zfQPKYoxj
	V15F8bqkPkfBOokg8Tae7FisPHsOH55BD9m82dUWn/E7jfI8s+GyM8VloD4GKbeTUxgn28ePUb+1q
	hyMw6L61+85sfkf2PwDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrcu-00000005lcn-1xdD;
	Wed, 30 Sep 2026 10:33:28 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrcp-00000005lb3-3wKY
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 10:33:27 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260930103316euoutp02b8fb5392aa656a201aaa596cea8ae476~aErr8r_t_2602026020euoutp02O
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 10:33:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260930103316euoutp02b8fb5392aa656a201aaa596cea8ae476~aErr8r_t_2602026020euoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1790764396;
	bh=FJ+htCVvKAhLkwC8CUAuytt3OB7IBWbiwLyL2rvPoSg=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=E2lOBVIo/7n1IPo2fFD6qsSxcKMCFCoNKB79E6YI9JVI3ET/dGqoHL7EsoEM5F3d2
	 kV0R6PwC6d+dXDLN/0VgElM3s3wu40j9RkJIhNAlFWC2Q1xj1VfKbje48WvsZoDLm3
	 zLk3l3+dXG+F6trEvKNgxC4KIAldNa7VQ0vVtGJ4=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260930103315eucas1p1dc6504dfed6803e1f6c1a9d4156e3da0~aErrrMstU2676926769eucas1p19;
	Wed, 30 Sep 2026 10:33:15 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260930103314eusmtip169db81e9f1c9f97f31c91e3ec55f06e6~aErqyiXeU0732407324eusmtip1b;
	Wed, 30 Sep 2026 10:33:14 +0000 (GMT)
Message-ID: <a95a44d9-6572-40f4-ab6d-1c160ecd5349@samsung.com>
Date: Wed, 30 Sep 2026 12:33:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pwm: th1520: Fix 32-bit build with COMPILE_TEST
To: FUJITA Tomonori <tomo@flapping.org>, fustini@kernel.org,
	guoren@kernel.org, ukleinek@kernel.org, wefu@redhat.com
Cc: a.hindborg@kernel.org, acourbot@nvidia.com, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
	daniel.almeida@collabora.com, gary@garyguo.net,
	linux-riscv@lists.infradead.org, lossin@kernel.org, ojeda@kernel.org,
	tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, FUJITA Tomonori
	<fujita.tomonori@gmail.com>, stable@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20260930101257.1649945-1-tomo@flapping.org>
X-CMS-MailID: 20260930103315eucas1p1dc6504dfed6803e1f6c1a9d4156e3da0
X-Msg-Generator: CA
X-RootMTR: 20260930101334eucas1p2ec64abcf499a296767711f13ad70c486
X-EPHeader: CA
X-CMS-RootMailID: 20260930101334eucas1p2ec64abcf499a296767711f13ad70c486
References: <CGME20260930101334eucas1p2ec64abcf499a296767711f13ad70c486@eucas1p2.samsung.com>
	<20260930101257.1649945-1-tomo@flapping.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_033324_245283_50350B61 
X-CRM114-Status: GOOD (  21.17  )
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



On 9/30/26 12:12, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> Fix the following build error on 32-bit ARM with COMPILE_TEST:
> 
>   ERROR: modpost: drivers/pwm/pwm_th1520.ko: symbol '__aeabi_uldivmod' undefined!
> 
> The driver divides u64 values when it converts between nanoseconds and
> clock cycles. On 32-bit ARM, these divisions are compiled to calls to
> __aeabi_uldivmod, which the kernel does not provide.
> 
> The TH1520 is a 64-bit RISC-V SoC, so the driver is only used on
> 64-bit kernels. There is no point in compile testing it on 32-bit.
> Limit COMPILE_TEST to 64BIT instead of changing the arithmetic to use
> the div64 helpers.
> 
> Fixes: 3c180003dffb ("pwm: th1520: Fix missing Kconfig dependencies")
> Cc: stable@vger.kernel.org
> Reported-by: Andreas Hindborg <a.hindborg@kernel.org>
> Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/291565-Help/topic/64bit.20division.20in.20.60pwm_th1520.2Ers.60/near/626825599
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
> v2:
> - Fix a typo in the commit message
> - Add Cc: stable, Reported-by and Closes tags
> - Add Reviewed-by tags from Andreas and Gary
> - Rebase on v7.3-rc5
> 
> v1: https://lore.kernel.org/all/20260929095612.1072417-1-tomo@flapping.org/
> ---
>  drivers/pwm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> index 729776086879..abecd95b0c3c 100644
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -772,7 +772,7 @@ config PWM_TEGRA
>  
>  config PWM_TH1520
>  	tristate "TH1520 PWM support"
> -	depends on ARCH_THEAD || COMPILE_TEST
> +	depends on ARCH_THEAD || (COMPILE_TEST && 64BIT)
>  	depends on RUST
>  	depends on HAS_IOMEM && COMMON_CLK
>  	select RUST_PWM_ABSTRACTIONS
> 
> base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e

Reviewed-by: Michal Wilczynski <m.wilczynski@samsung.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
