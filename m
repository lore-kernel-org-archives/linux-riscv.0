Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D78CC38A2D
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Oct 2022 09:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PCNw1htxFiQ2JhcOE/mVVPNhA3Vl3WCCHsdIqImcyLo=; b=YPt8ZrMc4f5lJw
	/sds55GMC27i3KElBu8lL7RTkA7p5zPgSs6AkcJxgvO//F4Guc1awUCeFpGenEp5fZQrODluwqOUq
	dYMiqDZ//JuwpNAap+F9KAsJo1OJMzh3aeUHfLLGQ1sS2qkzHVi38n3WOtVLpfSXWdssEDT/7xk3w
	YtHnpjX7lcAcXiALyfIi8wJIIxgcv7YiJi8ZY3gn6YM83+gKklDKTMGZHU9B2D3FksV9GnB+KGCq2
	aNAQIpdPdQ0U0rkOt9+kawkvgBmupOO6F3Rc2fDgCzpgz0suC79LR7yFj6BGCKqm+3jixOd9L03wD
	tNk7t08WCtvo9kHzZD7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omtq7-000QIw-QF; Mon, 24 Oct 2022 09:33:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omtq5-000QIA-Bg
	for linux-riscv@lists.infradead.org; Mon, 24 Oct 2022 09:33:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1666604024; x=1698140024;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YcAFKfmv1KCoQ7MBgfCc1n+l6QQHHbo++YhnpeMA5Kk=;
  b=o79siwBZjGWuh9/KtCvonQ7s1k3/doLAspxlrQTj4O1qxbKUUZtSysLs
   wPrRfRB2fDCXTY8EPaKkSruQPe3XvU8dhcpebFODnGYEnw67GCdGWl+LJ
   2x9j86ZQZSjSI2QRLH43qlOnuGXfOc10L54gS5dRXD0Xg+oApLl0zxFv9
   w1vBBI2seiZJIfIlkzmAW661CiawXH4Yw6AcS92YaGzZb8pKxchTMjFKO
   dwcBjWJSt4qaw0jUP/it/pY1VVWDi/+d+TDpv/IuXXMfr7DT+lx260cUp
   riKNNxtRpgto6eORDrW6Lrns2S8X5E+DpwCmzuaYgG0+gaY+9sr2Gkikj
   w==;
X-IronPort-AV: E=Sophos;i="5.95,207,1661842800"; 
   d="scan'208";a="196726355"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Oct 2022 02:33:43 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 24 Oct 2022 02:33:43 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 24 Oct 2022 02:33:42 -0700
Date: Mon, 24 Oct 2022 10:33:26 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>, Anup Patel <apatel@ventanamicro.com>, Atish
 Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v2 3/3] RISC-V: Ensure Zicbom has a valid block size
Message-ID: <Y1Zb5q2XTwVaMWxl@wendy>
References: <20221024091309.406906-1-ajones@ventanamicro.com>
 <20221024091309.406906-4-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221024091309.406906-4-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_023345_427249_5A125BBF 
X-CRM114-Status: GOOD (  21.24  )
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

On Mon, Oct 24, 2022 at 11:13:09AM +0200, Andrew Jones wrote:
> When a DT puts zicbom in the isa string, but does not provide a block
> size, ALT_CMO_OP() will attempt to do cache operations on address
> zero since the start address will be ANDed with zero. We can't simply
> BUG() in riscv_init_cbom_blocksize() when we fail to find a block
> size because the failure will happen before logging works, leaving
> users to scratch their heads as to why the boot hung. Instead, ensure
> Zicbom is disabled and output an error which will hopefully alert
> people that the DT needs to be fixed. While at it, add a check that
> the block size is a power-of-2 too.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  arch/riscv/kernel/cpufeature.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 220be7222129..93e45560af30 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -9,6 +9,7 @@
>  #include <linux/bitmap.h>
>  #include <linux/ctype.h>
>  #include <linux/libfdt.h>
> +#include <linux/log2.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <asm/alternative.h>
> @@ -70,6 +71,18 @@ EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
>  
>  static bool riscv_isa_extension_check(int id)
>  {
> +	switch (id) {
> +	case RISCV_ISA_EXT_ZICBOM:
> +		if (!riscv_cbom_block_size) {
> +			pr_err("Zicbom detected in ISA string, but no cbom-block-size found\n");
> +			return false;
> +		} else if (!is_power_of_2(riscv_cbom_block_size)) {
> +			pr_err("cbom-block-size present, but is not a power-of-2\n");
> +			return false;
> +		}
> +		return true;
> +	}
> +
>  	return true;
>  }
>  
> -- 
> 2.37.3
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
