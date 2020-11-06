Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B54C388F2
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 07:14:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AE492071A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 07:14:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pBsAfAh7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="1E8Cv1Hy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AE492071A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=JfUFqUoGbirx/DL5fzt8if51vy5CM+ed/+tw/Ld41oU=; b=pBsAfAh72xsA844YNhK0FQByO
	11d9UTSxdDvV1SarCIGlyIclhDhNkBnZhDipwDQlrErPoCFg7LNZgZbOjr/yrF5tBszIw23pYq2nK
	QKiaZ9pGLhwbAF7+2O7Y0bb9RPX/eq8424VCvZANWb7eYAV5PdEmXWOjFkEUwVtHDvQxk/onG7ql/
	xHderaPVKyLbtN4f2f3+GpdWrK8Z/tmjXRue9l5KRusMz3x9M0ziO4hBMhJwdeiMeJ2sWjrXTQ/77
	wWqgXfVKPr4KgU5aS9VXSAXF32H7Bxg9u12pI7+3Uur7xYBrSUNgnXNYsBvixuXHOk8sQDwXAZMtB
	LACUcvQPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kavxE-0002tO-1H; Fri, 06 Nov 2020 07:14:36 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kavxB-0002sY-He
 for linux-riscv@lists.infradead.org; Fri, 06 Nov 2020 07:14:34 +0000
Received: by mail-pf1-x442.google.com with SMTP id c20so478442pfr.8
 for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2020 23:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=+Piha8VRBp8+ABlDdw/zFXnSHjLCcihzCPtaMvSeL+s=;
 b=1E8Cv1HyuTxPOIRLmn/t3EWIwovW0X8ZJs13Yf4blUOLrBM2aZIMd9R9Nf8RMEaJw8
 tEYW7X+lYD8EP3J1aUqC2ZZvnn2kmW7rEz/2Jmg7dElK8Xki51IW0qZFr4B/1h7M3gF1
 1QpFlQ4RCRQ4pLiKdiT6jtV+nByEHQfvEBTMo31NIauXwxDFnsVPWfrd6d6UFAVQGNF5
 LcCtvNTJZGNQvXBdGyC0m2D48MpFjzOWM+Cnh0KMJBfNZJW25u+tCJtH2Jher0VoRrWV
 mjazf3sbi/uzaZvO/s3vbwj1xOst1TAFC9Oq9MeBEYrccZcOYVIllQSy0OAWo5IWH3cl
 CRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=+Piha8VRBp8+ABlDdw/zFXnSHjLCcihzCPtaMvSeL+s=;
 b=lNHXdKcAeINdZuLwdPFL/bI3W0UNSfA/Z2I25siOqnpy/r2t0XhLy9ytLNQc0uP/zy
 1QEn+2/Z4/Hq/n8AvXNRPqCcufI1DHbWlZpeoO0eWz/rZC2brJEvTTVTgVf3cDQgSiQl
 lXdKv05knRaqHNMsesrftiGvlPZ7gErxwDWDGYi4GbuK1ON6SaM0Sclc3vrSHzjaCfx0
 xPhEZ3apXvl9V2jCaAEFd+tqrEsfw7b4OvbJAld1bU6pTiWFdtGy2k2D9UYplSDQGNqn
 w3Xsdll10nDR+YU/MyM0cbOH0KSGIBJ55bDJAp/++8Ydv4gK+JaZUlsBDNcAZrE0h/oN
 CYng==
X-Gm-Message-State: AOAM531cj57mcH7/3T3fTIjopcur+HHD1IeFW98Kba4fZi7wP6i7upzv
 sp2dzPZwxeZ/iHBxzQQJ/i8yJ7JUCbLOtA/7
X-Google-Smtp-Source: ABdhPJzHqCiCqsQUBzAIQzq5DjGLQfwbLJHmExQ+BAND3aO3XHwfh3I/b4IlrlHIywMcv42kbIWYAw==
X-Received: by 2002:a17:90a:cf18:: with SMTP id
 h24mr1063004pju.72.1604646871023; 
 Thu, 05 Nov 2020 23:14:31 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q11sm593465pgm.79.2020.11.05.23.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 23:14:30 -0800 (PST)
Date: Thu, 05 Nov 2020 23:14:30 -0800 (PST)
X-Google-Original-Date: Thu, 05 Nov 2020 22:54:25 PST (-0800)
Subject: Re: [PATCH] riscv: Make RISCV_TIMER depends on RISCV_SBI
In-Reply-To: <20201028131230.72907-1-wangkefeng.wang@huawei.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-f818810c-0b46-485b-b870-8ef35b2b318d@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_021433_704167_54BC2BDD 
X-CRM114-Status: GOOD (  18.74  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: wangkefeng.wang@huawei.com, linux-riscv@lists.infradead.org,
 aou@eecs.berkeley.edu, daniel.lezcano@linaro.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 28 Oct 2020 06:12:30 PDT (-0700), wangkefeng.wang@huawei.com wrote:
> The riscv timer is set via SBI timer call, let's make RISCV_TIMER
> depends on RISCV_SBI, and it also fixes some build issue.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  drivers/clocksource/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 68b087bff59c..2be849bb794a 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -654,7 +654,7 @@ config ATCPIT100_TIMER
>
>  config RISCV_TIMER
>  	bool "Timer for the RISC-V platform" if COMPILE_TEST
> -	depends on GENERIC_SCHED_CLOCK && RISCV
> +	depends on GENERIC_SCHED_CLOCK && RISCV && RISCV_SBI
>  	select TIMER_PROBE
>  	select TIMER_OF
>  	help

This should probably be

Fixes: 2bc3fc877aa9 ("RISC-V: Remove CLINT related code from timer and arch")

not really a bug in that commit, but since then the memory-mapped and SBI
timers have been split and therefor there's no way this driver can do anything
without SBI support.

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
