Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAFAC54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 07:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=swTg1i+MkHJeX+MriZuLnyPb8cLwn+GEfCOKxvs/Pc8=; b=t0WQfP/Pbz3b2C
	l5H3SHpKthtxneJfCvLHKwg/gzDJweNTrvYLBOxoXe66wKWrw+hkLuhuVBr6Jwaylh1NHfN+b5k8m
	43GIdRM6hoQJUq0n4oZwfSn8wXdhTO4xISNBPSa7yxXbRqNyzQh8ciReZpg9f2I4bXWKwiCFsejgN
	jXfPdwSyAAPDE17thRX9C1K86BEj3mmXNu8EsV/2A9s9blbSf0KAhwB/V84317qvGAq/olE/pg16K
	PAJugH3bkTFXt2HCIfEmqrzPdn5u2R4S9vLIeJ7UCMjrv+ezhMX63rv1ofQwBH556YygfBFETYJVd
	BvA4gIBLpJUu/ioJ+wSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roeyQ-0000000FyG2-2Lv3;
	Mon, 25 Mar 2024 07:42:26 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roeyL-0000000FyDC-126a
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 07:42:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E80040002;
	Mon, 25 Mar 2024 07:42:17 +0000 (UTC)
Message-ID: <dc1e2be5-73e1-409b-85bd-6c216a8b76bd@ghiti.fr>
Date: Mon, 25 Mar 2024 08:42:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Fix spurious errors from __get/put_kernel_nofault
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20240312022030.320789-1-samuel.holland@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240312022030.320789-1-samuel.holland@sifive.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_004221_690735_A554B45C 
X-CRM114-Status: GOOD (  17.72  )
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

Hi Samuel,

On 12/03/2024 03:19, Samuel Holland wrote:
> These macros did not initialize __kr_err, so they could fail even if
> the access did not fault.
>
> Cc: stable@vger.kernel.org
> Fixes: d464118cdc41 ("riscv: implement __get_kernel_nofault and __put_user_nofault")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> Found while testing the unaligned access speed series[1]. The observed
> behavior was that with RISCV_EFFICIENT_UNALIGNED_ACCESS=y, the
> copy_from_kernel_nofault() in prepend_copy() failed every time when
> filling out /proc/self/mounts, so all of the mount points were "xxx".
>
> I'm surprised this hasn't been seen before. For reference, I'm compiling
> with clang 18.
>
> [1]: https://lore.kernel.org/linux-riscv/20240308-disable_misaligned_probe_config-v9-0-a388770ba0ce@rivosinc.com/
>
>   arch/riscv/include/asm/uaccess.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index ec0cab9fbddd..72ec1d9bd3f3 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -319,7 +319,7 @@ unsigned long __must_check clear_user(void __user *to, unsigned long n)
>   
>   #define __get_kernel_nofault(dst, src, type, err_label)			\
>   do {									\
> -	long __kr_err;							\
> +	long __kr_err = 0;						\
>   									\
>   	__get_user_nocheck(*((type *)(dst)), (type *)(src), __kr_err);	\
>   	if (unlikely(__kr_err))						\
> @@ -328,7 +328,7 @@ do {									\
>   
>   #define __put_kernel_nofault(dst, src, type, err_label)			\
>   do {									\
> -	long __kr_err;							\
> +	long __kr_err = 0;						\
>   									\
>   	__put_user_nocheck(*((type *)(src)), (type *)(dst), __kr_err);	\
>   	if (unlikely(__kr_err))						\


That's a good a catch! Surprising indeed that we did not find this 
before, that's the second bug in the uaccess routines in the last 3 (or 
4) releases, maybe we should improve our coverage here, I'll see what we 
can do.

You can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
