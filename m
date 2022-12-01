Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FCEC4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 11:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c9sbliNF7E6+i5HPaI4MlZzEo3P2QeaPYtfAG5QYgXw=; b=BTF7zgwsesh7c8
	mpp5IPm5CmBKBw3RK7ZdCcEM/bEJ0fw3mXGDUaV53gpnQ5XVuKTcPWOhqkc1AduICBjTHqq66dFvd
	iIWzridm1xG//1qujlqQ2u1DDwIEVpQRf5vLbthjMLkmcUq3iJZEGy0zjMM8KKrll7f5NeJh2+B3S
	yFKWGfvBJfn8g/RD5eXXpE/T2UDpAWWmV9e+u/MdlIMnGT0V3nBY52beNMz1EStxQwc1UdxDBdbQa
	OUdJIFEuMcBfEWGMmYci/5sTXpkZKBdKUUxm+osFtJaRnJFMrrA2EP8Ow5kzqAsgLfJrAKW6IAXxW
	Df1RrsxRk9FjMJ/4TsjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0i9l-007BtS-M7; Thu, 01 Dec 2022 11:55:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0i9i-007BrB-Rr
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 11:55:08 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p0i9c-0001H0-P0; Thu, 01 Dec 2022 12:55:00 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH] riscv: Apply a static assert to riscv_isa_ext_id
Date: Thu, 01 Dec 2022 12:55:00 +0100
Message-ID: <4469409.BEx9A2HvPv@diego>
In-Reply-To: <20221201113750.18021-1-ajones@ventanamicro.com>
References: <20221201113750.18021-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_035506_946939_BAE8AFE5 
X-CRM114-Status: GOOD (  18.03  )
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

Am Donnerstag, 1. Dezember 2022, 12:37:50 CET schrieb Andrew Jones:
> Add a static assert to ensure a RISCV_ISA_EXT_* enum is never
> created with a value >= RISCV_ISA_EXT_MAX. We can do this by
> putting RISCV_ISA_EXT_ID_MAX to more work. Before it was
> redundant with RISCV_ISA_EXT_MAX and hence only used to
> document the limit. Now it grows with the enum and is used to
> check the limit.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

> ---
>  arch/riscv/include/asm/hwcap.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index b22525290073..86328e3acb02 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -59,8 +59,9 @@ enum riscv_isa_ext_id {
>  	RISCV_ISA_EXT_ZIHINTPAUSE,
>  	RISCV_ISA_EXT_SSTC,
>  	RISCV_ISA_EXT_SVINVAL,
> -	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
> +	RISCV_ISA_EXT_ID_MAX
>  };
> +static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
>  
>  /*
>   * This enum represents the logical ID for each RISC-V ISA extension static
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
