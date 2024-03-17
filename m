Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED65C54E67
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Mar 2024 06:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m6IEwjZOXBqapR/MbAru2VDY1v4j3NDtVjy2UbNlNl4=; b=NE1/6spVe0Fn/k
	vxGT1fTxwpHz4D1IOOQXqoXtqMK4nFURAI9RqPnO2D4HWNnoFrgOMu1qGvCMe4v6eH0mrzjLaDO+Z
	hLmSrCSrBlspJKkN1292tLFY/umdfFQ8fNHkjRULLwJktNqV4mGxO0pSwxLRH+z4MQt/5Cm3PllJM
	to4Xoi+2Zx1P9ijU5V+t4SWxsyw3xv6SXXwKSQrUhR+kZfBZIjRuaQaWDq8x/vOKFBsy+TdpEd9pW
	yUx1raxlNi3U0pP2h90/N0yDtTz5LIbuaEFkCPGNhLZTGqOCrMe+098zgub5nhKOm1csXy6IBti9+
	JPpu+XtykvFUOn8KeSLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rljgY-00000004XwB-3s14;
	Sun, 17 Mar 2024 06:07:54 +0000
Received: from [50.53.2.121] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rljgW-00000004Xvp-30hS;
	Sun, 17 Mar 2024 06:07:52 +0000
Message-ID: <b9a6044e-c1d1-4d8e-88ab-43dbb9e2fa31@infradead.org>
Date: Sat, 16 Mar 2024 23:07:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: typo in comment for get_f64_reg
Content-Language: en-US
To: Xingyou Chen <rockrush@rockwork.org>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, ajones@ventanamicro.com,
 cleger@rivosinc.com, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 paul.walmsley@sifive.com
References: <20240317055556.9449-1-rockrush@rockwork.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240317055556.9449-1-rockrush@rockwork.org>
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



On 3/16/24 22:55, Xingyou Chen wrote:
> Signed-off-by: Xingyou Chen <rockrush@rockwork.org>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  arch/riscv/kernel/fpu.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/fpu.S b/arch/riscv/kernel/fpu.S
> index 2c543f130f93..327cf527dd7e 100644
> --- a/arch/riscv/kernel/fpu.S
> +++ b/arch/riscv/kernel/fpu.S
> @@ -211,7 +211,7 @@ SYM_FUNC_START(put_f64_reg)
>  SYM_FUNC_END(put_f64_reg)
>  
>  /*
> - * put_f64_reg - Get a 64 bits FP register value and returned it or store it to
> + * get_f64_reg - Get a 64 bits FP register value and returned it or store it to
>   *	 	 a pointer.
>   * a0 = FP register index to be retrieved
>   * a1 = If xlen == 32, pointer which should be loaded with the FP register value

-- 
#Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
