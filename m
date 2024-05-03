Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F47C4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 12:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yV06/oM30s+iK+pIjRnWBHJEBMqE4wkKbcCfpNESK6U=; b=pe9tVa0BPKZLA1
	F8JW+BLgz04QIHjIEUH/EIfSaQXDxuyk6GYJzVSlRA0Xxxr/tN9ISAUZvfrTqhgp7qq1T0UZ6x1B5
	rZLaDUDFX9lqs0Ym0jSzaph6NZDlC8I3jqiHfnTaPA2soBhj6BsaYeTaO0BHsoALF6YAQSnFt0lVZ
	EYunrEl6AaIxGc3Xz9N38Fy7e+npH2c51TXQRmtqGcYL1rxGInlHY7kR+Rk2Y74F5yCr25RNU1OHk
	g0kdp9lsoT9UY1QJKB6rHpQeBbUR4sFpl6HiXR4OzgoJuu2pHdh/RweoKMZ/c7Gi37wDAbb2V89p9
	6dfYUd+0v0mRw/d6XczA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2rq5-0000000GOIG-1IB8;
	Fri, 03 May 2024 12:16:33 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2rpz-0000000GOGe-1OsQ
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 12:16:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E3FA66000C;
	Fri,  3 May 2024 12:16:18 +0000 (UTC)
Message-ID: <7ebc5b28-7115-494f-a607-e46c71214cce@ghiti.fr>
Date: Fri, 3 May 2024 14:16:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: uaccess: Allow the last potential unrolled copy
Content-Language: en-US
To: Xiao Wang <xiao.w.wang@intel.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: jerry.shih@sifive.com, nick.knight@sifive.com, ajones@ventanamicro.com,
 bjorn@rivosinc.com, andy.chiu@sifive.com, viro@zeniv.linux.org.uk,
 cleger@rivosinc.com, alexghiti@rivosinc.com, haicheng.li@intel.com,
 akira.tsukamoto@gmail.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240313103334.4036554-1-xiao.w.wang@intel.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240313103334.4036554-1-xiao.w.wang@intel.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_051627_540222_7FCF3CEF 
X-CRM114-Status: GOOD (  11.19  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Xiao,

On 13/03/2024 11:33, Xiao Wang wrote:
> When the dst buffer pointer points to the last accessible aligned addr, we
> could still run another iteration of unrolled copy.
>
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> ---
>   arch/riscv/lib/uaccess.S | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
> index 2e665f8f8fcc..1399d797d81b 100644
> --- a/arch/riscv/lib/uaccess.S
> +++ b/arch/riscv/lib/uaccess.S
> @@ -103,7 +103,7 @@ SYM_FUNC_START(fallback_scalar_usercopy)
>   	fixup REG_S   t4,  7*SZREG(a0), 10f
>   	addi	a0, a0, 8*SZREG
>   	addi	a1, a1, 8*SZREG
> -	bltu	a0, t0, 2b
> +	bleu	a0, t0, 2b
>   
>   	addi	t0, t0, 8*SZREG /* revert to original value */
>   	j	.Lbyte_copy_tail


I agree it is still safe to continue for another word_copy here.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
