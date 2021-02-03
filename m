Return-Path: <SRS0=OV2N=HF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63435C433E6
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 02:35:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1014964F6A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 02:35:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1014964F6A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=jeFR4/G15CmkEaKrJ1CVYpXaTHrRsQ88SOobPKpwzbQ=; b=Hox6H7bUSpcrYluVhinyQ8/ea
	yBxA4UsJVkrN0qN9KemnfrpiPvXFVuiIYS5QqFLSHCU1Qiz/cQt4DbICC++tAcOoSUSLKoJ3DxLp1
	akWsGbzDavk1FMR6O4E/p7YTsDpZ/IQDeWNXVi4MHqCG8IiTtSEgZfZbUtomkmlK4wu+tqdKHCO8i
	AxPJDAxuD8CpWyVDKP8+YYJgfdAbgzJaYbObud49LpGaBpFa8+N7mQG+5U01j+XjaR2zS5Ex7MyNY
	/sl0xV2H2XESpVRqDtUecIlTE9ymH2kguJXx+2+KoDXsTyRxzldApQ5+TceuBhkjquixzJfWTgYmW
	+zKFrgDbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l780T-0005QH-So; Wed, 03 Feb 2021 02:35:01 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l780R-0005Oa-4a
 for linux-riscv@lists.infradead.org; Wed, 03 Feb 2021 02:35:00 +0000
Received: by mail-pg1-x52c.google.com with SMTP id s23so14982749pgh.11
 for <linux-riscv@lists.infradead.org>; Tue, 02 Feb 2021 18:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ne1JKbl2xYwrXX2qMgmxDsV3cfU3kyRYQzt/TMMEZaU=;
 b=WjMLaeZqHgQQrmNTQUTxDOOfOs3/Vr7b8wvBXLkwARbC/rw6HL+RXVh63Zbakdkh/2
 /Hj4LFOajBggkMOg4uN/yAZcFN3AlgbRfFHmvadYKCuvvMrurAqIg8khrmsZ5Y7tvkuR
 wOGDyUI0FXqRkGnBmK/xjKpwyUd/QiEqE6atpRGBFVpAckU/S/W4DWnfV1ZqM020OurQ
 PTSJq2STJxsUxNP+uVtgJpHLQ3eDikWBqC/2KPevKBv4LqoTh5wx13q5j2QpZToSJEI0
 HDawL1FCzz4RqXl8TvzABtEW+j0bNCHIrpijjEEqdfZNIPWhoLN/A6tvTkHxWOp+sETw
 kFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ne1JKbl2xYwrXX2qMgmxDsV3cfU3kyRYQzt/TMMEZaU=;
 b=N3bCp/+d/jYf1Aj2jwdeEuCMbecwIqX5vJ3A3AHwTl0Fg3i8kC9X1ZSzaU9YmQjhlx
 3bhgD/R7rVFguAD94w0ynfcRnpVt7vHcXz9vIlX6iP6gJe3QJwv3qeHGLRKVUamh/BMM
 kffh0WRtVcsAuTxMnvBuOeBwAYHp0czdM+H97dRL9SkVIIdidVAy+GrF12IvzXwRCG9G
 dv8F8IpgCeci00PzezDuCxr5tQEq+hgl/6sgudjd9HBhbbJpRJ2OYV5ZyMawFcgKS64D
 900MPMMja2qsP6mVOK2QJNcYS290TuA45NdrM6eRWXPrlKQ0LuNDlZkOoLTY8RyulN4k
 0k6A==
X-Gm-Message-State: AOAM530nZzuJ1KY0XlEEOcofzenmjHlalv+yngY5+VLmQclEd857ZbYF
 uXHOACAxDz+WU05O2lSOQUa6Yg==
X-Google-Smtp-Source: ABdhPJx2w8/CzL5MkRNREZh521egDSJFbkvPWPHdogBYBo2u/S/mTbENTFOlU3sLFpnYqWgv69hmRg==
X-Received: by 2002:aa7:8044:0:b029:1c7:eecb:aafa with SMTP id
 y4-20020aa780440000b02901c7eecbaafamr979685pfm.33.1612319696937; 
 Tue, 02 Feb 2021 18:34:56 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id p16sm295829pfq.28.2021.02.02.18.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 18:34:56 -0800 (PST)
Date: Tue, 02 Feb 2021 18:34:56 -0800 (PST)
X-Google-Original-Date: Tue, 02 Feb 2021 18:32:47 PST (-0800)
Subject: Re: [PATCH 2/3] riscv: Align on L1_CACHE_BYTES when STRICT_KERNEL_RWX
In-Reply-To: <20210129190038.1001626-2-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-4fdfe85d-490e-4968-b927-afc7b34801e0@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_213459_254405_E4E39EA1 
X-CRM114-Status: GOOD (  17.69  )
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
Cc: svancau@gmail.com, aou@eecs.berkeley.edu, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 ndesaulniers@gooogle.com, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 ardb@kernel.org, kirill.shutemov@linux.intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 29 Jan 2021 11:00:37 PST (-0800), Atish Patra wrote:
> From: Sebastien Van Cauwenberghe <svancau@gmail.com>
>
> Allows the sections to be aligned on smaller boundaries and
> therefore results in a smaller kernel image size.
>
> Signed-off-by: Sebastien Van Cauwenberghe <svancau@gmail.com>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/include/asm/set_memory.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
> index 211eb8244a45..8b80c80c7f1a 100644
> --- a/arch/riscv/include/asm/set_memory.h
> +++ b/arch/riscv/include/asm/set_memory.h
> @@ -32,14 +32,14 @@ bool kernel_page_present(struct page *page);
>
>  #endif /* __ASSEMBLY__ */
>
> -#ifdef CONFIG_ARCH_HAS_STRICT_KERNEL_RWX
> +#ifdef CONFIG_STRICT_KERNEL_RWX
>  #ifdef CONFIG_64BIT
>  #define SECTION_ALIGN (1 << 21)
>  #else
>  #define SECTION_ALIGN (1 << 22)
>  #endif
> -#else /* !CONFIG_ARCH_HAS_STRICT_KERNEL_RWX */
> +#else /* !CONFIG_STRICT_KERNEL_RWX */
>  #define SECTION_ALIGN L1_CACHE_BYTES
> -#endif /* CONFIG_ARCH_HAS_STRICT_KERNEL_RWX */
> +#endif /* CONFIG_STRICT_KERNEL_RWX */
>
>  #endif /* _ASM_RISCV_SET_MEMORY_H */

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
