Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64522C47258
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 09:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=So45En+R8hJjoEaVbdHe5nfonP+bmXCNeUzmnLT968M=; b=YDQOOoVNOzfCcx
	ZEJVl3149vDjbejzUpa0cixpawSnkjf1sk5kug/wfiRN1UYySxviKFaAkA8hiBenYiyXJyHNxv1c2
	fQTanLI26LcTm1eWrbFbFS9EGPQJyiWXyn+HJDNwYrvsDKuO//4LNJt3dVcyTXMTkRN4+AgiTcrSC
	iiZbsLQEvKRKdfPGiafiVZWNDqmUOR9bML4KdbaFk32wLoRPcNbwZVdd5OqC0XQEqhhrJUUICw/0H
	dCryUzQkgoFWfIRMxOSljeKtwhwC+3rbClH0WfNL5fxp0j1t7H2MVRsb128mDWgZSC7JLy+6Hr8rf
	bnplps3HRvHxT246O0+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPJWt-008T7X-2b;
	Mon, 15 Jan 2024 09:45:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPJWr-008T6u-1A
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 09:45:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1240D60C84;
	Mon, 15 Jan 2024 09:45:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD4DC433C7;
	Mon, 15 Jan 2024 09:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705311911;
	bh=9TfclVxenwhLNqqbdWKDJ6r7w6xibtjyrmpBf389HBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ip6EgncIonnMjh4DWPhEZNCM9CBa6b26cayPDOiKD1GdFdIxUVfTWSYtYD30rv8E6
	 1T6lBUoykAvfmpXP6wRDCEcSxYlMKPWjAzLnlkh2qjfJf2wFLYBO/wizlJVnI2XUNy
	 zBScSjHfZytimxRZBeNA6QxHqx0fW2dggJYZVzCD5mIVXU1zBhE/JCryjI/o02vhMt
	 h0m3JQGLg0L0xQCGQPhE6MA4jCN/duW0N7FCBSmkX/FJa6k929yQnX7P4EgAH0dSWu
	 JRkP4pSZmJwoegcc6yGFoh7QVDMAd4tGjzzlZo01tBo97mZSGA2Lh90cNrDKP3BJZm
	 N1L+pnBnRU2+A==
Date: Mon, 15 Jan 2024 17:32:20 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v2] riscv: select ARCH_HAS_FAST_MULTIPLIER
Message-ID: <ZaT7pNjWS3faGjv9@xhacker>
References: <20231202135202.4071-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231202135202.4071-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_014513_462536_8CBD2F7C 
X-CRM114-Status: GOOD (  22.41  )
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

On Sat, Dec 02, 2023 at 09:52:02PM +0800, Jisheng Zhang wrote:
> Currently, riscv linux requires at least IMA, so all platforms have a
> multiplier. And I assume the 'mul' efficiency is comparable or better
> than a sequence of five or so register-dependent arithmetic
> instructions. Select ARCH_HAS_FAST_MULTIPLIER to get slightly nicer
> codegen. Refer to commit f9b4192923fa ("[PATCH] bitops: hweight()
> speedup") for more details.
> 
> In a simple benchmark test calling hweight64() in a loop, it got:
> about 14% performance improvement on JH7110, tested on Milkv Mars.
> 
> about 23% performance improvement on TH1520 and SG2042, tested on
> Sipeed LPI4A and SG2042 platform.
> 
> a slight performance drop on CV1800B, tested on milkv duo. Among all
> riscv platforms in my hands, this is the only one which sees a slight
> performance drop. It means the 'mul' isn't quick enough. However, the
> situation exists on x86 too, for example, P4 doesn't have fast
> integer multiplies as said in the above commit, x86 also selects
> ARCH_HAS_FAST_MULTIPLIER. So let's select ARCH_HAS_FAST_MULTIPLIER
> which can benefit almost riscv platforms.
> 
> Samuel also provided some performance numbers:
> On Unmatched: 20% speedup for __sw_hweight32 and 30% speedup for
> __sw_hweight64.
> On D1: 8% speedup for __sw_hweight32 and 8% slowdown for
> __sw_hweight64.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Tested-by: Samuel Holland <samuel.holland@sifive.com>

Hi @Palmer,

I saw this simple patch is missed in your for-next tree, could you
please pick it up?

Thanks in advance

> ---
> 
> since v1:
>  - fix typo in commit msg
>  - add some performance numbers provided by Samuel
>  - collect Reviewed-by and Tested-by tag
> 
>  arch/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 95a2a06acc6a..e4834fa76417 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -23,6 +23,7 @@ config RISCV
>  	select ARCH_HAS_DEBUG_VIRTUAL if MMU
>  	select ARCH_HAS_DEBUG_VM_PGTABLE
>  	select ARCH_HAS_DEBUG_WX
> +	select ARCH_HAS_FAST_MULTIPLIER
>  	select ARCH_HAS_FORTIFY_SOURCE
>  	select ARCH_HAS_GCOV_PROFILE_ALL
>  	select ARCH_HAS_GIGANTIC_PAGE
> -- 
> 2.42.0
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
