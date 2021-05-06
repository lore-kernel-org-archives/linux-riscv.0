Return-Path: <SRS0=VC1f=KB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 390E1C433B4
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 06:42:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7F066112D
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 06:42:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7F066112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=2+pImB2Xh9j7fsWtc+NAmO3KMJtl4F9noy21fUzxuS8=; b=PITWrLY3XGYtNMqIetxevG33g
	XoREI0V/aoNp4IZqECn6Ug2auAxrWWKF9RtkD0JpnbV52Rb1RcNNtG4UVDigMJgxEbWyxwBDPykfC
	lut34+D2/4kW1MLLFkQTrZcF4qTtoYIAVabWfz42YaXcRPeoxSrKvcATQvwmA3Aaqvy02lCvM0w5S
	I3Tl1uMrIXTyVVlIN98opXqIb1MYF/LtTxDGO2ek744dQNj6a5WlEp5t4YTrO2lwuchYAKTCj+R70
	lqBK5fo0WY+3zWOWtiRr35nYFIJKm/zTPER+mzpLMUzAy8eh5aaWaHRSmLLNRHDXNjxxeDkU8zBdG
	RuzQ6iV6w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leXhx-003NsV-Rf; Thu, 06 May 2021 06:42:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leXhr-003Nri-OA
 for linux-riscv@desiato.infradead.org; Thu, 06 May 2021 06:41:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=tcjOW0GNebxM0lkkYwBauVKed6xLu5wjE7gUFkINsAE=; b=n5ReXaVqGq/UqmwFnc3+/LxR9y
 JG3BahyZPDN2VPwOvkJ5mnDBsc7m09ibqxnX7uvek7O1eNxNIxWnLsfl4zaZNEdYOqHzzcrmUPMGI
 iZO/1mILtn+1D1pwjB+fGXZNXaLf1sfGRFfMm0YpBFeurX5t75qT6Al9/Ext9xwPqCHy8LsAgWnXV
 2b+Q/s6AejfGj0VBYDFWbmeb9la66yJlmdFBz8kgFlemWfcHBqlNxrG0MbYz3iQfb52id35Pnpp83
 9cdzsv/3C9GrJi7xHcWapH0qvHktbEVDxBfCk+BhWX70iKbm/wt/E3nLQllr0n8ltwjnm4hOF4HEw
 qZRloYMQ==;
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leXhn-005dtA-Ba
 for linux-riscv@lists.infradead.org; Thu, 06 May 2021 06:41:54 +0000
Received: by mail-pg1-x52b.google.com with SMTP id t22so4119840pgu.0
 for <linux-riscv@lists.infradead.org>; Wed, 05 May 2021 23:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=tcjOW0GNebxM0lkkYwBauVKed6xLu5wjE7gUFkINsAE=;
 b=1M369Bnnqg5S80HQ72qCWHgDeHuYJ+w863PTLBD4ebwKvVk4VjzZHzL2T/glvixrNt
 8LZZqv/jCjTQ3I9ehojb+xgNHcbUmK/h216fGPzBmrCyiD8PIcHKZXPgvw5Gxz5Brsuk
 BqzFNOJpFzSpm978m18e3xl3q6HW+Z9NA7E69v453lIV9SmMntrl4iIkwcqndWwwNy3x
 es1TiG5R8P9h9cpEwQJQEWW847GdPexs1W9qoqIiiYOfsDo5tztFn5El/96as4PuThTJ
 BjmFMN3Ie32m4j+7OyI0v+X4IuvzaNcWIpJ/Zoc5hE3ZLbzr73I72ogYEDivRxTY09kQ
 LlzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=tcjOW0GNebxM0lkkYwBauVKed6xLu5wjE7gUFkINsAE=;
 b=L/bDu5PDFqhY4RoT5yGv+zSBaYgCZo21olP+008uLVN+BzV+kwjI4fdk863b5gZotk
 K/x5Wv0d4BnsPM/+AuxZ61tkgB3/jc4QxFRoDPHSmYz4ZlKIxeoo4wkd5OM1dV5QhND3
 WsPZD8/Vgl6DqZo5hceeFCPRXPeZEYmpOuRhAc5MZLfmXrahVT2KhRZKG9o9Jce9cVEP
 QLrdmDRTNwInR/hyV6mSPg8KUcSo6/mDBDuZs1dq7WVTIT1OrE2ikK0NVCLrjNWIaofc
 59Gsmgw907jH5KJXEBL0VAiZ9bodNByn+mQIxfeVBPfeB/FjYMQKpCnHW8kb3rlGNqrN
 PIQA==
X-Gm-Message-State: AOAM532OCkJrs6CdzVdmgzrzKpNWO/nAG/268HQpzXHWmhHExTX0oeyA
 a6bGy5pyxi5OcS5swwLrs/Zv+DzpvsvG7w==
X-Google-Smtp-Source: ABdhPJwuMSAR+7p/akc/AnQ3NoF4xg3h4cv/q6ycf5qyVv3lOeS/uIX6uJnRIItavOOxYeh4ozDhsA==
X-Received: by 2002:a62:8208:0:b029:289:112f:d43d with SMTP id
 w8-20020a6282080000b0290289112fd43dmr2748978pfd.61.1620283310399; 
 Wed, 05 May 2021 23:41:50 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id n27sm1165085pfv.142.2021.05.05.23.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 23:41:49 -0700 (PDT)
Date: Wed, 05 May 2021 23:41:49 -0700 (PDT)
X-Google-Original-Date: Wed, 05 May 2021 23:41:46 PDT (-0700)
Subject: Re: [PATCH v2] riscv: Only extend kernel reservation if mapped
 read-only
In-Reply-To: <02e05df076da23fc0f52c944bbf0a5cb99e95bd6.1619708542.git.geert+renesas@glider.be>
CC: alex@ghiti.fr, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 Damien Le Moal <Damien.LeMoal@wdc.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, geert+renesas@glider.be
From: Palmer Dabbelt <palmer@dabbelt.com>
To: geert+renesas@glider.be
Message-ID: <mhng-9100bcaa-03ab-4f62-939a-aeb911d0640d@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_234151_418564_F14D2473 
X-CRM114-Status: GOOD (  27.11  )
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

On Thu, 29 Apr 2021 08:05:00 PDT (-0700), geert+renesas@glider.be wrote:
> When the kernel mapping was moved outside of the linear mapping, the
> kernel memory reservation was increased, to take into account mapping
> granularity.  However, this is done unconditionally, regardless of
> whether the kernel memory is mapped read-only or not.
>
> If this extension is not needed, up to 2 MiB may be lost, which has a
> big impact on e.g. Canaan K210 (64-bit nommu) platforms with only 8 MiB
> of RAM.
>
> Reclaim the lost memory by only extending the reserved region when
> needed, i.e. depending on a simplified version of the conditional logic
> around the call to protect_kernel_linear_mapping_text_rodata().
>
> Fixes: 2bfc6cd81bd17e43 ("riscv: Move kernel mapping outside of linear mapping")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Simplify the conditional, as STRICT_KERNEL_RWX depends on
>     MMU && !XIP_KERNEL.
>
> Only tested on K210 (SiPeed MAIX BiT):
>
>     -Memory: 5852K/8192K available (1344K kernel code, 147K rwdata, 272K rodata, 106K init, 72K bss, 2340K reserved, 0K cma-reserved)
>     +Memory: 5948K/8192K available (1344K kernel code, 147K rwdata, 272K rodata, 106K init, 72K bss, 2244K reserved, 0K cma-reserved)
>
> Yes, I was lucky, as only 96 KiB was lost ;-)
> ---
>  arch/riscv/mm/init.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 788eb222deacf994..3ebc0f5d2b73b42b 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -136,11 +136,16 @@ void __init setup_bootmem(void)
>
>  	/*
>  	 * Reserve from the start of the kernel to the end of the kernel
> -	 * and make sure we align the reservation on PMD_SIZE since we will
> +	 */
> +#if defined(CONFIG_64BIT) && defined(CONFIG_STRICT_KERNEL_RWX)
> +	/*
> +	 * Make sure we align the reservation on PMD_SIZE since we will
>  	 * map the kernel in the linear mapping as read-only: we do not want
>  	 * any allocation to happen between _end and the next pmd aligned page.
>  	 */
> -	memblock_reserve(vmlinux_start, (vmlinux_end - vmlinux_start + PMD_SIZE - 1) & PMD_MASK);
> +	vmlinux_end = (vmlinux_end + PMD_SIZE - 1) & PMD_MASK;
> +#endif
> +	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
>
>  	/*
>  	 * memblock allocator is not aware of the fact that last 4K bytes of

Thanks, this is on for-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
