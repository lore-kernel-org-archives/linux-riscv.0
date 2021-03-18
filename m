Return-Path: <SRS0=IhzG=IQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA01C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 22:49:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4223564F04
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 22:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4223564F04
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=izydg4Qdq3ZVtZr70zZBOm5L/TMkAkXiu+JEDGM995c=; b=JU9uZOzv0BpUQT//mWWOsl5gp
	6d2MTPg7FPyNi2n8+H3D0dS9/Gm8sw+SgIxKYbSbg/Bi1bU+LGaz2F2uy/BYwJ0LY6kvAmAsKKpH4
	zj1Au4cTztZGuqmAlTMsFTRdf3M9f+QsyEV0ra/lUmvdWAv7tBgxi14DLe711AGdZvCbrKcJYxXOM
	9peYOp0PELPVVooozCk5pMGP4IZtTwYAqzxCj054WFVG2d87zl2EW1s4Rgm/yScVThP94xtkBBKEE
	Nf6a8YNY5xnhEyMaVcSzhsz35IV6R0l0zaQLcGUv1P9mRl4M5V9mMbecn3LRTjFLe2Smv2rwk6ZTa
	kSpEkwErw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lN1Ri-0068VY-UY; Thu, 18 Mar 2021 22:48:51 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lN1Ra-0068Ul-Jl
 for linux-riscv@lists.infradead.org; Thu, 18 Mar 2021 22:48:48 +0000
Received: from mail-oo1-f52.google.com ([209.85.161.52]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M2OAi-1lPlne3CCE-003xrt for <linux-riscv@lists.infradead.org>; Thu, 18
 Mar 2021 23:48:36 +0100
Received: by mail-oo1-f52.google.com with SMTP id
 p2-20020a4aa8420000b02901bc7a7148c4so1833429oom.11
 for <linux-riscv@lists.infradead.org>; Thu, 18 Mar 2021 15:48:35 -0700 (PDT)
X-Gm-Message-State: AOAM533A08B551gIII8B2YzCo8SiV1MLvK9mHV1oKEGoBmgmn25/DtCl
 rsrNsEhz9hnuxjAzJmaP/pJ0/SdWBQf2hb7qfbI=
X-Google-Smtp-Source: ABdhPJzriXMf0junjgKfAFpob6C7mRSHBsdxwTUEGwvcUyZ9dAR7nBfn0W8tV1v+3FCWxdyFomUNC8vu3kHsz2FU5Pk=
X-Received: by 2002:a4a:8ed2:: with SMTP id c18mr9449721ool.66.1616107714223; 
 Thu, 18 Mar 2021 15:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210318224135.134344-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20210318224135.134344-1-ben.dooks@codethink.co.uk>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 18 Mar 2021 23:48:18 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1re8s4nacPQn=E2PnkxM5TQEihDu6XvV1Tg9y1J8iseQ@mail.gmail.com>
Message-ID: <CAK8P3a1re8s4nacPQn=E2PnkxM5TQEihDu6XvV1Tg9y1J8iseQ@mail.gmail.com>
Subject: Re: [PATCH] RFC: riscv: evaluate put_user() arg before enabling user
 access
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Terry Hu <kejia.hu@codethink.co.uk>
X-Provags-ID: V03:K1:ITVU9q3C4D/XSH5aYThSKdF4NtIqy7tMZU2q1ZRpESz8qinJmjA
 5r29wI7WnKeaE4mly69Dds4T6PHuDkvWhUXTyR+N3rGfQYgMB812kZ+jcxYWNALSRuSIOxM
 gsAzoH0fjzLLTo7RNtIUb3L0c4gaRHEQ4mkE5mJ3pHN5pNZ39uWOPocEhljHE8RYQE7gx3W
 3m3/QaWoxLqEJtt2nHc8g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:t3fgh6KSmjI=:Tj6nvuO6fa9vekya0+NGlI
 d+8XUV/uLhSHlENNAJAxRKAyRfQJThS+xLufkSHYobkGC7QcJSlOZpJE94BW2ryrFWtftqwdG
 UUAaq2DSuakLxGgKx2DbxKtL+x7+eJvS/D5BoIqiLkRaW+mA+e4Ek6x1Fqujwx9sOzqUXXdy6
 K7t9jhdkAUrUQEAlDTa/k1wj+ZxMEflN1Kgg9Mfl9XTKcZF0gooVrKPJbwCH5eE6zsi4Mo5yH
 1ZXKiPkKuzV8qnH+HDsESjaFh93a3izSTsU/ODhv/gt59QPfNlOW26alcAjaYOPdsVjFUw4dC
 7lmDczDupOduVwLK7Q6pCRBbl6esT1o0ElhL4Fo3SlCPq8pfTaI/rHDB86fIXeCTKczB7z9+5
 PWePn0YCcRgblVoouBfTfjS+Nemo0xn27GmcAr9p4QQlDT9BuoiK6tRNTfE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_224842_937452_9AEADD7E 
X-CRM114-Status: GOOD (  25.58  )
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

On Thu, Mar 18, 2021 at 11:41 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> The <asm/uaccess.h> header has a problem with
> put_user(a, ptr) if the 'a' is not a simple
> variable, such as a function. This can lead
> to the compiler producing code as so:
>
> 1:      enable_user_access()
> 2:      evaluate 'a'
> 3:      put 'a' to 'ptr'
> 4:      disable_user_acess()
>
> The issue is that 'a' is now being evaluated
> with the user memory protections disabled. So
> we try and force the evaulation by assinging
> 'x' to __val at the start, and hoping the
> compiler barriers in enable_user_access()
> do the job of ordering step 2 before step 1.
>
> This has shown up in a bug where 'a' sleeps
> and thus schedules out and loses the SR_SUM
> flag. This isn't sufficient to fully fix, but
> should reduce the window of opportunity.
>
> Cc: Arnd Bergman <arnd@arndb.de>

Reviewed-by: Arnd Bergman <arnd@arndb.de>

Note: your Signed-off-by seems to be missing.

> ---
>  arch/riscv/include/asm/uaccess.h | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index 824b2c9da75b..7bf90d462ec9 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -306,7 +306,10 @@ do {                                                               \
>   * data types like structures or arrays.
>   *
>   * @ptr must have pointer-to-simple-variable type, and @x must be assignable
> - * to the result of dereferencing @ptr.
> + * to the result of dereferencing @ptr. The @x is copied inside the macro
> + * to avoid code re-ordering where @x gets evaulated within the block that
> + * enables user-space access (thus possibly bypassing some of the protection
> + * this feautre provides).
>   *
>   * Caller must check the pointer with access_ok() before calling this
>   * function.
> @@ -316,12 +319,13 @@ do {                                                              \
>  #define __put_user(x, ptr)                                     \
>  ({                                                             \
>         __typeof__(*(ptr)) __user *__gu_ptr = (ptr);            \
> +       __typeof__(*__gu_ptr) __val = (x);                      \
>         long __pu_err = 0;                                      \

Side note: We should really change the first typeof to an __auto_type
here (and on all other architectures), but that's a separate change
and not strictly a bugfix.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
