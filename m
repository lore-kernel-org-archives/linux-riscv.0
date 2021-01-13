Return-Path: <SRS0=HZsE=GQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED73C433E9
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jan 2021 04:36:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECE1423131
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jan 2021 04:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECE1423131
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=we1hljp1P8qxnDTz7aue+grOJvmFCBwkgazuQIuhioM=; b=KHLR7qjcTkbQ42gRHbI/hIc+D
	xwBsM1d82Cbx17SfHhK2gLU1CO5DAwtpM2f0wpJo923yUgTFw5+pXAZgFuJfMjJT/1GyyghTywnAp
	z4bpg1fSEoztrvC62vLYNRmJX6WKbhfN462lB+Up9PRJYtwDThPWGxFYGrk3FGaLUGynx4hKM3ynD
	h/pdvfAjer3STniXQWLIq5Pi7PuLp0c/4nEGipM2ikskxtWd7v2VkKbfo9s4wSA4++A8KSCZSV0ig
	QNh0mGDNdU3eTqCuXa2OAvqxtgNI1gO2uN5k+hhJCDOoi+7NfM/ZxaQMVUqeIxCZVi6XOEsC9+I0Q
	fdZyg1ugQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzXtb-0005YA-8r; Wed, 13 Jan 2021 04:36:35 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzXtY-0005VC-2Z
 for linux-riscv@lists.infradead.org; Wed, 13 Jan 2021 04:36:33 +0000
Received: by mail-pf1-x435.google.com with SMTP id w2so444209pfc.13
 for <linux-riscv@lists.infradead.org>; Tue, 12 Jan 2021 20:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=v8M6I4uoOoWPXGUxC7pSdwXF3g2dnNPkk0v2MpAf+W8=;
 b=lfLH3Q7jtZb/zf63+ZlMqsMcC8w3F5TQb86l4tvMJ69W3kq9KJ3fNfaGxUiHB8IYVt
 YZiKcz792a4vWjRFEsZ28UV0IDQJqaC0PAx7LIIXajyJrdb2MaWTfCyiUvS0PsjapXoX
 2mHjkVOv/ewD8RJZrwRx+okz602BY2KY1CKhHe2l4UNTvgBQvkmAy1rYeQKaqyPS5CFs
 OeF02veA+IG+TauO/+YvgLo+mdhPRq0rPMFV4Zik2UZJtky4dN4uyg714S6z7FPVTOKh
 0rM4JDCiWKFVR/krPTch5aK/hRh2CMSAzd5fkJC1+2FjLdMxhn1iD8U87o0q8cpdywkK
 wlGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=v8M6I4uoOoWPXGUxC7pSdwXF3g2dnNPkk0v2MpAf+W8=;
 b=KZcqaLZchlxksXbmD6f522Gz9GiH1f5hghacoeFlf3JpGvcS+exmfn+lCWYzp+plKI
 DAJqDwpT6OHT/BdT5X5xzHXLXfDnArrvyIz2oeo8243REc48uyjJjnfFkc3cFUAeInwx
 TVAjQTbym/zfyl+h6q2Sg+OGzleHHi0A7xWj6FQJZU7di+UsZ51ZoU3niDe6Z8OU8jvO
 CTjNCLJbtgvKV140en/H/5xdTQW8EK3UTWgnj7CVSY73lRpi96XbQViXOYexRbRVlj9q
 W30yO7AF8uCJRnhSmbZ9G1ODf48ajzUcfJigIvwKysWtbuArRB2gUIQ6ri0MbK+AZEAA
 eg3Q==
X-Gm-Message-State: AOAM531wvMbPKWszT+/LVpWeDfscL/DPmnwfQLlRsgTOu/Gapsnty8Dm
 TsstZU/VBT+84RUTOi5IwBEMVQ==
X-Google-Smtp-Source: ABdhPJytECWo9XHp2+7rMUBWFv2+jhZFSXfHRB71mo37McQGfiaXyJ4UdNIVwo05BSbwt6jorS/6VA==
X-Received: by 2002:a63:f64c:: with SMTP id u12mr343978pgj.98.1610512587525;
 Tue, 12 Jan 2021 20:36:27 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id a136sm786958pfd.149.2021.01.12.20.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 20:36:26 -0800 (PST)
Date: Tue, 12 Jan 2021 20:36:26 -0800 (PST)
X-Google-Original-Date: Tue, 12 Jan 2021 20:16:53 PST (-0800)
Subject: Re: [PATCH] riscv: Trace irq on only interrupt is enabled
In-Reply-To: <20201219002051.2891577-1-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-46e80f20-f58a-4f1b-b162-e2ad7b6df816@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_233632_245995_91BC625A 
X-CRM114-Status: GOOD (  19.63  )
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
Cc: guoren@linux.alibaba.com, Anup Patel <Anup.Patel@wdc.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 aou@eecs.berkeley.edu, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 18 Dec 2020 16:20:51 PST (-0800), Atish Patra wrote:
> We should call irq trace only if interrupt is going to be enabled during
> excecption handling. Otherwise, it results in following warning during
> boot with lock debugging enabled.
>
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] DEBUG_LOCKS_WARN_ON(early_boot_irqs_disabled)
> [    0.000000] WARNING: CPU: 0 PID: 0 at kernel/locking/lockdep.c:4085 lockdep_hardirqs_on_prepare+0x22a/0x22e
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.10.0-00022-ge20097fb37e2-dirty #548
> [    0.000000] epc: c005d5d4 ra : c005d5d4 sp : c1c01e80
> [    0.000000]  gp : c1d456e0 tp : c1c0a980 t0 : 00000000
> [    0.000000]  t1 : ffffffff t2 : 00000000 s0 : c1c01ea0
> [    0.000000]  s1 : c100f360 a0 : 0000002d a1 : c00666ee
> [    0.000000]  a2 : 00000000 a3 : 00000000 a4 : 00000000
> [    0.000000]  a5 : 00000000 a6 : c1c6b390 a7 : 3ffff00e
> [    0.000000]  s2 : c2384fe8 s3 : 00000000 s4 : 00000001
> [    0.000000]  s5 : c1c0a980 s6 : c1d48000 s7 : c1613b4c
> [    0.000000]  s8 : 00000fff s9 : 80000200 s10: c1613b40
> [    0.000000]  s11: 00000000 t3 : 00000000 t4 : 00000000
> [    0.000000]  t5 : 00000001 t6 : 00000000
>
> Fixes: 3c4697982982 ("riscv:Enable LOCKDEP_SUPPORT & fixup TRACE_IRQFLAGS_SUPPORT")
> Cc: stable@vger.kernel.org
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/kernel/entry.S | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 524d918f3601..7dea5ee5a3ac 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -124,15 +124,15 @@ skip_context_tracking:
>  	REG_L a1, (a1)
>  	jr a1
>  1:
> -#ifdef CONFIG_TRACE_IRQFLAGS
> -	call trace_hardirqs_on
> -#endif
>  	/*
>  	 * Exceptions run with interrupts enabled or disabled depending on the
>  	 * state of SR_PIE in m/sstatus.
>  	 */
>  	andi t0, s1, SR_PIE
>  	beqz t0, 1f
> +#ifdef CONFIG_TRACE_IRQFLAGS
> +	call trace_hardirqs_on
> +#endif
>  	csrs CSR_STATUS, SR_IE
>
>  1:

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
