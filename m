Return-Path: <SRS0=WUGv=KU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D677BC2B9F8
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 12:33:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C43361409
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 12:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C43361409
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=20ZQTPQQETnOfHzQ53j0lyeDJJzpr6uIl45zTFykXXo=; b=o0Xe8fzY0c3Adp
	v2TrBMCkZd+eW5IxbqW1jCnajnE966taANvgtZWtfqQA+o3nKi24XrmSe3Tt5m2qsus//0J3vRr0z
	tVWJMGggaeDzf4eiEPRrfHCjF7Ud9f8UP90inTsr9YWIGn4sA7fDVNIQzu5QPOL5e+Zdx1+MNWNPj
	LKXri8GsDY64DM+To59suv4I9oQkB7nsdnysAxJrs1DWIU9xYSf9RwGlmhNnp3aPTVQVfFJpYXRZS
	n7j4DPn+hKsjoNoGvURg1lekStNl6XGssznGBFe4HCMOlKz/rDv6L83b78ORQJU/0LklVKV9Ne0q6
	aVxrwtaKCjSczPuQHcnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llWEr-0053mB-KU; Tue, 25 May 2021 12:32:49 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llWEn-0053jq-TD
 for linux-riscv@lists.infradead.org; Tue, 25 May 2021 12:32:47 +0000
Received: by mail-wr1-x42d.google.com with SMTP id y14so29973589wrm.13
 for <linux-riscv@lists.infradead.org>; Tue, 25 May 2021 05:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sFy/LCaXB1SRilva8CJ6mi6jxkEQV+dWKl9QiGNHUsg=;
 b=s2myp/MyFCHOHtpxco8bZqGgOkPGygWKSZEMO5NAtVwE7ob5u1K956l3GFDdI8BvXp
 6huP+HAe5CK3gwN1qVuy1yHJgr5u1dVVw844eZ4sUbKonuWYdz7uDbugoZn7ZPs1Pijh
 RbxX8EkV57WppSRghckgfI2u2zN49d7zF0mrxQWOQevslGVYdY+W5vNXe/K6tY41C+GL
 4gD18WUuLnhhTN19n0BJxOF6Z2aY/EJ2Gqed5nPh6W1riNawh/tLQcBEp/+rhWKYfs2Z
 Uk+XNOTGlJ3BlTkWJnbNqo1hdeDOAb78BDm7BZsf2uwGyjXnG1AwvQ0MsayaKfHJ+tEQ
 KYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sFy/LCaXB1SRilva8CJ6mi6jxkEQV+dWKl9QiGNHUsg=;
 b=CTKpzzeMpV8PBCvflF0naGLNsO9ojYKHon94YCXd1D4jOaBTOSx3limMoNIF0vP0gK
 TlqLCwU+wYYi99+6U7BkyDBfAz87Gdrj77r4UohFJRmKadZw5cxNuLPClzgTSgeEQbik
 XhTvqCUADAtdqMchHmN1h30mClTi2Aex9D/vsaaHFiUmL/hqOcsVlOBQol6rsCkKA4jD
 IQFrg1DykP3/koHPHbA/huFwdnPhOuAnuTHh0DTmg0WwoU8ucqs7JRsS0RDydLdGjTjI
 FWwb/whHH8AY3sQq+hVLNpi6O8NADy+zLneyUoHFa25UfThQavXzPjmdjSoKi+tRE/Tl
 LGMA==
X-Gm-Message-State: AOAM532PrWSonubg4uPK1/dEXhJU4E3Sf0iYgmiTdNwNAIntugheGW8m
 J0BVXzBaEPyHV6zc5Q+pngK5J9rLnZC/U+JkwGn2Qw==
X-Google-Smtp-Source: ABdhPJwmnDH3iFAvmCNe+NjWKkYYKkEISVmzhPeoZ89aTiS5cvv29wco+Is3CTtZH/UHKJezW1DX4vg3l9OBcF2kkmY=
X-Received: by 2002:adf:e38c:: with SMTP id e12mr26636946wrm.128.1621945963328; 
 Tue, 25 May 2021 05:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <1621945234-37878-1-git-send-email-guoren@kernel.org>
In-Reply-To: <1621945234-37878-1-git-send-email-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 25 May 2021 18:02:31 +0530
Message-ID: <CAAhSdy3b455vEhsMtL_swSnt1udP_z_dM_zcXvRfLN5ikjY8_A@mail.gmail.com>
Subject: Re: [PATCH] arch: Cleanup unused functions
To: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
 Michal Simek <monstr@monstr.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_053246_016940_89877763 
X-CRM114-Status: GOOD (  19.16  )
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

On Tue, May 25, 2021 at 5:52 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> These functions haven't been used, so just remove them. The patch
> has been tested with riscv, but I only use grep to check the
> microblaze's.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Michal Simek <monstr@monstr.eu>
> Cc: Christoph Hellwig <hch@lst.de>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/microblaze/include/asm/page.h |  3 ---
>  arch/riscv/include/asm/page.h      | 10 ----------
>  2 files changed, 13 deletions(-)
>
> diff --git a/arch/microblaze/include/asm/page.h b/arch/microblaze/include/asm/page.h
> index bf681f2..ce55097 100644
> --- a/arch/microblaze/include/asm/page.h
> +++ b/arch/microblaze/include/asm/page.h
> @@ -35,9 +35,6 @@
>
>  #define ARCH_SLAB_MINALIGN     L1_CACHE_BYTES
>
> -#define PAGE_UP(addr)  (((addr)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)))
> -#define PAGE_DOWN(addr)        ((addr)&(~((PAGE_SIZE)-1)))
> -
>  /*
>   * PAGE_OFFSET -- the first address of the first page of memory. With MMU
>   * it is set to the kernel start address (aligned on a page boundary).
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index 6a7761c..a1b888f 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -37,16 +37,6 @@
>
>  #ifndef __ASSEMBLY__
>
> -#define PAGE_UP(addr)  (((addr)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)))
> -#define PAGE_DOWN(addr)        ((addr)&(~((PAGE_SIZE)-1)))
> -
> -/* align addr on a size boundary - adjust address up/down if needed */
> -#define _ALIGN_UP(addr, size)  (((addr)+((size)-1))&(~((size)-1)))
> -#define _ALIGN_DOWN(addr, size)        ((addr)&(~((size)-1)))
> -
> -/* align addr on a size boundary - adjust address up if needed */
> -#define _ALIGN(addr, size)     _ALIGN_UP(addr, size)
> -
>  #define clear_page(pgaddr)                     memset((pgaddr), 0, PAGE_SIZE)
>  #define copy_page(to, from)                    memcpy((to), (from), PAGE_SIZE)
>
> --
> 2.7.4
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
