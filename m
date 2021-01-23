Return-Path: <SRS0=mxd0=G2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51649C433E0
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Jan 2021 04:26:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 068692376F
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Jan 2021 04:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 068692376F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=niEXt5lkzdrRlraxy2ZwwNLddq9NKx2dJba4CbX4GCg=; b=MGkriD7XpcCXkffFoob5aumZn
	0g90i+vA3gCDevSM6wEL/ijfyxm5M3Ca20adfhCd0Wxm6tAo+Fv9I2l/6oUZ7fmaSku77NYFCyI9+
	mceNlwlJU3O2O8x+WtkWT+XIG4x2GBa2VRIJprB/by3/6ZdLCUPcSzYule07dhoXQgFwu+JEPR6XU
	Z+DKgkD31US5cOqPGlz6i82l4ichLEfLVtN3ih66xubLl443ScgQn+TTMlWOxfhAkvgJmL+ZNYcnh
	qA8hAxwNuKq5zf3Hwa3PGuX6mUQxvcz5JLqVKR3mZh5mo2EdrMKkr9sDYhXTJrcbIWOhMvDZIR1qM
	iXNeGAh1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3AUq-000543-BH; Sat, 23 Jan 2021 04:26:00 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3AUp-00053a-0c
 for linux-riscv@lists.infradead.org; Sat, 23 Jan 2021 04:25:59 +0000
Received: by mail-pg1-x52f.google.com with SMTP id v19so5181941pgj.12
 for <linux-riscv@lists.infradead.org>; Fri, 22 Jan 2021 20:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=HsTH23mTsBXTUCD9PYfUtYW7PMHmRqFx/62RuOOhwWE=;
 b=H6dbeZ4IKz/jHoKDvrRiNfcm29zDT322Qo6oWUxEEYCW69JaisrCzd7yp0BoucfsJ9
 F335oNUhCJqnoOVi7YlS4/Oi7j8PDv8z/66Vor3rN4jGeJfA1U9TY68j0Vhs+8LvwWZn
 7QAeoeY/Ix0tYM+FjfwhN1QzjaO9yT2zezKDVTLKQXtnPDI4e5Cw2S3RfYALs2GvfD0Q
 rfUjRbD/etRvr3wALx9OxzZXJTfwjNNwSLs6fe/CbHQD99TSZyiZnKl5E+Uyz0VHV+yA
 ofwzsjwwtLzuNyfoIHw7wwVo1yv7sQXyRKSW5N7i9aJqMtY/bErm4iJArNCtv2XtUrDN
 Sv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=HsTH23mTsBXTUCD9PYfUtYW7PMHmRqFx/62RuOOhwWE=;
 b=Zx7BkgTV5av1kAzKvLwRPH9orOV/SpEYS00aOkNkigRzXuhg1fNdEe6fOv80J8Ev3w
 nqqzHXc/gSlEpo1OLLrxZzLOkPCltO5u3QoloKg0rad71M/pE0q6rUQOaXxs5rS1GbqI
 7dsHymiP1ilsH+itAoLZl3s0Ujr2SjI4u7biuvgdeyFNJ48fw7TQq9kxUlx4V3qmqaEs
 wg7EIRNDpOKNdNNPJu1WjAvfjIbxFEuMgdRbzUA6eoDQLApf4QTUiYvs5aUfv4mNtrEt
 iglF1sV7Oz1Dv3L+SVTaLj3sla/EetExdvo640T2Vcr8n43DvhDtrs9OtjAeA81Uu3OU
 YtXQ==
X-Gm-Message-State: AOAM531iU2KjwLr/SfthP5KN/5oqqB5A1aPBGNDFV185SMp2uo++VDyL
 8JgKlG8hbperXsHce2qZPmVavg==
X-Google-Smtp-Source: ABdhPJzGTiXE96kFTsRM8zJTqDWKPdMLEh8GQ+kyr14hxbw338i0lgZa4y87kwM3dSETJtrxDp8LLA==
X-Received: by 2002:a63:e24f:: with SMTP id y15mr7821856pgj.366.1611375956854; 
 Fri, 22 Jan 2021 20:25:56 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id t2sm10844097pga.45.2021.01.22.20.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 20:25:55 -0800 (PST)
Date: Fri, 22 Jan 2021 20:25:55 -0800 (PST)
X-Google-Original-Date: Fri, 22 Jan 2021 20:16:14 PST (-0800)
Subject: Re: [PATCH] arch/riscv:fix typo in a comment in
 arch/riscv/kernel/image-vars.h
In-Reply-To: <20210121015513.2258-1-tangchunyou@163.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tangchunyou@163.com
Message-ID: <mhng-11923d80-18d3-4d0a-a0f8-8ca93ee307a1@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_232559_056553_19A805BB 
X-CRM114-Status: GOOD (  17.72  )
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
Cc: aou@eecs.berkeley.edu, anup@brainfault.org, zhangwen@yulong.com,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 tangchunyou@yulong.com, ardb@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 20 Jan 2021 17:55:13 PST (-0800), tangchunyou@163.com wrote:
> From: tangchunyou <tangchunyou@yulong.com>
>
> "kerne" -> "kernel"
>
> Signed-off-by: WenZhang <zhangwen@yulong.com>
> ---
>  arch/riscv/kernel/image-vars.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
> index 8c212ef..71a76a6 100644
> --- a/arch/riscv/kernel/image-vars.h
> +++ b/arch/riscv/kernel/image-vars.h
> @@ -3,7 +3,7 @@
>   * Copyright (C) 2020 Western Digital Corporation or its affiliates.
>   * Linker script variables to be set after section resolution, as
>   * ld.lld does not like variables assigned before SECTIONS is processed.
> - * Based on arch/arm64/kerne/image-vars.h
> + * Based on arch/arm64/kernel/image-vars.h
>   */
>  #ifndef __RISCV_KERNEL_IMAGE_VARS_H
>  #define __RISCV_KERNEL_IMAGE_VARS_H

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
