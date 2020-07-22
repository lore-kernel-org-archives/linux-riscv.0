Return-Path: <SRS0=J8tV=BB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C396C433E5
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 02:59:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A7E5207BB
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 02:59:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QtT8AyIx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="H/23LUgD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A7E5207BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=++ekDYpyjd2j4yDKPAKzCuOcAKpR1sje0DqM37uHMtI=; b=QtT8AyIxXnGjcrVFtoECsFkaf
	p6GaLPKi2qUl1JcD9kL6KA7NnRXaGUgNcLg2JC7s2BX+rSOIAj4cmNFka80wT11PJKH94RBuJDd5W
	UCXk+SZddmtSUfbC7MX9inIPq00kgXeqZ6AeOyvBjGvsu7T50j5BBEIxRY5NvCTTnoscdrjWcVQ2S
	iHmi59w40t4uV3sP5LR7VNGHcEcAGEo8Jl4q8drBffAzTApO7T3tLuf3te6iiKP/qU5CIvlSJJAcs
	am6O/uF+OEc52yY/V8YwpAimSzvKv+iUgfdn3Re0/M19YyTr6CpQgMj/nvXxa0mDMiQ8/IGFCmXoo
	hlnWyOKrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy4yK-0002gK-Qg; Wed, 22 Jul 2020 02:59:08 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy4yG-0002eN-VP
 for linux-riscv@lists.infradead.org; Wed, 22 Jul 2020 02:59:05 +0000
Received: by mail-pl1-x643.google.com with SMTP id d1so248903plr.8
 for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2020 19:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=zqjtHWRY+Z/a6TbVuhQHClnwHjzrKFN6ggxQIupkQnU=;
 b=H/23LUgD/A7MiXAUZsbdZnxzXZBpg0jc4/DCMydcRbAOgHU0MFNVOgSVnG1LouRg05
 UPcE11ZWmmpzoet7wRv6x4OVgqK7O3gcOKYstyufDzMleT8fsM/PPnRJryYgijQqI2s9
 kEC+lKYV49Cufy+esPwh1XS0CwO0egCM5WKGmmXR2bu8gJLNsxhoIdnYX4nk7F4SLsv/
 rTMhVLE+uU40GixvYQlNpcpMGhKHQx9npkpkpjBf/3OrweNyMFvjqzm9Pm8E0hReoxwg
 5/fRWeuY+f2Vc4biwAPxebGv3ALDvj8MmrePOq6/JG5B5zqaobWQa/GqnTxfyk14S3/b
 QtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=zqjtHWRY+Z/a6TbVuhQHClnwHjzrKFN6ggxQIupkQnU=;
 b=FtZCWUVreYxvSOTEn8JeGRWVG5H4nO5NSIJJSAR6J2btX9bQOIMz12HnWeGFBxjHKD
 cjQidF1eEEYaumbzVoNtCfEctzU3Suff4Xyu+V+XPPbnbGLtMW//svjRXfLUuIaWieGa
 1GfjIfABOtPd8JDcSXls3xjSZ0/EifwExOmIvs/wimpkXjo9yo65qE1ixgp7dX+SwiZi
 xFHQkbleiYPtZPLVjSsXlyut8xBEIyLzI09xhjOaYW0rhK0bnvaOa/6a+QAIguUFRwUI
 J6CbPU8TOCm+XgkSy2MYGiro4dLuW5R3gXPa1AHiVjDQ+HcXw6pzdjdraGCsLZBI87/k
 aW8A==
X-Gm-Message-State: AOAM533jye5WJaWriIUpmbSBEGb6Z11e9DKc7MIvOVdJ+7c4Q2hpf2i2
 OHiG3QccJ7oYBnN0uTsVyaYBaQ==
X-Google-Smtp-Source: ABdhPJzW60tSJTO9sdxoBuPAY/s/akhlaAe7a+/s3qIxa8fhbS9vtNMBh6/6hEJ6reEBwznNSR9Kxg==
X-Received: by 2002:a17:902:6901:: with SMTP id
 j1mr23930134plk.203.1595386741274; 
 Tue, 21 Jul 2020 19:59:01 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 22sm21362808pfh.157.2020.07.21.19.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 19:59:00 -0700 (PDT)
Date: Tue, 21 Jul 2020 19:59:00 -0700 (PDT)
X-Google-Original-Date: Tue, 21 Jul 2020 19:47:25 PDT (-0700)
Subject: Re: [PATCH 2/2] riscv: Simplify the checking for SR_PP
In-Reply-To: <4bac52941700cd7b714a41606df7b53f4cf24824.1594629047.git.greentime.hu@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: greentime.hu@sifive.com
Message-ID: <mhng-94c29866-a954-4eaf-916a-9ed87b560d19@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_225905_016791_4948A448 
X-CRM114-Status: GOOD (  17.85  )
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
Cc: greentime.hu@sifive.com, linux-riscv@lists.infradead.org,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 13 Jul 2020 01:32:16 PDT (-0700), greentime.hu@sifive.com wrote:
> This patch simplifies the checking for SR_MPP and SR_SPP. It uses SR_PP in the
> code flow for both m-mode and s-mode then we can remove the ifdef here.
>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  arch/riscv/kernel/entry.S | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 000984695cd6..597beae0d238 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -210,13 +210,8 @@ ret_from_syscall_rejected:
>  ret_from_exception:
>  	REG_L s0, PT_STATUS(sp)
>  	csrc CSR_STATUS, SR_IE
> -#ifdef CONFIG_RISCV_M_MODE
> -	/* the MPP value is too large to be used as an immediate arg for addi */
> -	li t0, SR_MPP
> +	li t0, SR_PP
>  	and s0, s0, t0
> -#else
> -	andi s0, s0, SR_SPP
> -#endif
>  	bnez s0, resume_kernel
>
>  resume_userspace:

This one is actually on a fairly fast path, so I can buy it's worth saving the
cycle.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
