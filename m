Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D36BF8FA66
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 12:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CHXFURaXn3C5HsYF4frBgVS7LRJE8VL3vJXfWf8NWzY=; b=rJRvxDjEGc17Ov
	516OiHoyhcfk0N3zyCOevq1jU7hgKHoEdv2drU7uc9bomd8M7YF1DyQUTKLk5QCJoezbFibol5Yda
	DA5dE5UBQf2vKLjM8TF+eJeM9rjasKpwiEzd5QJkh72HU6SjvHKW6l2Skkfcx83JXJ/ERYTKQLT3J
	P6RbgrjQQBvLsx+lTWE8RfgIaEaRd+ukTX8m6DcqAkGkj3ekySQvW+nJKirQlZffQ10j88iBJpX2X
	bQ6sDmmaRUjKj2VwrCpDN6aIOjQwT3+TxXeXJITIkpNql0k1s1SttOJ5vMtIA4oZFhcaKLtngRVXw
	TF1cms+F+Ep42P718DCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFA3i-00000008ZzR-3ZJK;
	Tue, 21 Apr 2026 12:18:30 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFA3g-00000008Zz3-1Q3u
	for linux-riscv@lists.infradead.org;
	Tue, 21 Apr 2026 12:18:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776773908; x=1808309908;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=PenIqUUnQCpm0dma4EMkb9a/RBxddIPYadbHh0p8JIw=;
  b=c425Jxo7GT01EXeOf8s+3hqZo6Iihd+jJySR/4tRfJdaDnfODgMDN/Dh
   09EihiL8ALw1GlKlvbBZUCCuvf3N5EWmkdgWeDW5SDa+/8AGKywzt2/jn
   TUQyS3cwuhv07QSyRXdmbTgJUlUeE6ZAYgPx+MdjzjzGapfREGp569MdW
   osOCHfT78y1IpHUi/Ws00kkQ38/qPC0WhwP6wRAJCEtritZmQUGZ+FIn2
   mYsr425EFKhm7i9EKNaY5NxHNYhER5ItN3h6WIz5SnbmeVDcxRsbrUy03
   XAhswYWHOJv8MURObRnXIjziDufvEXouTP+YwwEDm9BpZc5KDFXpcn0ZP
   g==;
X-CSE-ConnectionGUID: gyrd1482SA+hwxt+YTjGYQ==
X-CSE-MsgGUID: Wmrw1bsaSne+KgyFP3Xn+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="89175858"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="89175858"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 05:18:27 -0700
X-CSE-ConnectionGUID: CEpZVInFQBKIBerpdjfasQ==
X-CSE-MsgGUID: Jpeca53kSheybGJEYT2xhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="229347174"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.105])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 05:18:21 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 21 Apr 2026 15:18:18 +0300 (EEST)
To: Jia Wang <wangjia@ultrarisc.com>
cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
    linux-serial <linux-serial@vger.kernel.org>, 
    linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] serial: 8250_dw: Use a fixed CPR value for
 UltraRISC DP1000 UART
In-Reply-To: <20260421-ultrarisc-serial-v3-2-3d7f09c2420e@ultrarisc.com>
Message-ID: <979c9543-3ea0-25de-f97b-9c6d2fa3ac61@linux.intel.com>
References: <20260421-ultrarisc-serial-v3-0-3d7f09c2420e@ultrarisc.com> <20260421-ultrarisc-serial-v3-2-3d7f09c2420e@ultrarisc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_051828_521385_C1C072A8 
X-CRM114-Status: GOOD (  18.99  )
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

On Tue, 21 Apr 2026, Jia Wang wrote:

> The UltraRISC DP1000 UART does not provide the standard CPR register used
> by 8250_dw to discover port capabilities.
> 
> Provide a fixed CPR value for the DP1000-specific compatible so the
> driver can configure the port correctly.
> 
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
>  drivers/tty/serial/8250/8250_dw.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
> index 94beadb4024d..ca6dbdf75918 100644
> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -962,6 +962,12 @@ static const struct dw8250_platform_data dw8250_intc10ee = {
>  	.quirks = DW_UART_QUIRK_IER_KICK,
>  };
>  
> +static const struct dw8250_platform_data dw8250_ultrarisc_dp1000_data = {
> +	.usr_reg = DW_UART_USR,
> +	.cpr_value = 0x00022022,

Hi,

Please construct the cpr_value by ORing DW_UART_CPR_* defines together.
For fields, FIELD_PREP_CONST() may be useful.

In order to be able to use the DW_UART_CPR_* defines, they need to be 
moved into 8250_dwlib.h (I'd move all DW_UART register defines in a 
preparatory patch).

I know the existing Renesas' .cpr_value doesn't follow this convention but 
that could be converted as well (in another patch, or leave the Renesas 
entry conversion to me if you don't want to do that).

> +	.quirks = DW_UART_QUIRK_CPR_VALUE,
> +};
> +
>  static const struct of_device_id dw8250_of_match[] = {
>  	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
>  	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
> @@ -969,6 +975,7 @@ static const struct of_device_id dw8250_of_match[] = {
>  	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },
>  	{ .compatible = "sophgo,sg2044-uart", .data = &dw8250_skip_set_rate_data },
>  	{ .compatible = "starfive,jh7100-uart", .data = &dw8250_skip_set_rate_data },
> +	{ .compatible = "ultrarisc,dp1000-uart", .data = &dw8250_ultrarisc_dp1000_data },
>  	{ /* Sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, dw8250_of_match);
> 
> 

-- 
 i.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
