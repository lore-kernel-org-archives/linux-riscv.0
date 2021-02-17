Return-Path: <SRS0=wXp/=HT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C68A2C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Feb 2021 04:36:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78F1664DF5
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Feb 2021 04:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78F1664DF5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AmDhWKNgMtEP7RVcUVEb6RS2eZt0IvcGPglEBTVwnsI=; b=Us0+X2hpmlj26u1UZDedEC2r4
	kzNTQ3MsmI8mrD6Pbj+DKOMzBdxlI8VKXOKbTrhvI0kwNh7XQHDBTvZxDgAWPvQ404D6aMBidQmBJ
	l5Q/0TluIMnAFLsGSz3pFy5/xyg/6WQZgr1SfpOtnPrJfSjwbzpyYsx+nqrS580R2HxrPZehH++0D
	43GYEgnhRbh/LG5dDdZFKw7IUoBoh/LpM4gemRXgfrK17dUSK+A9uwGEgZFtMZcZbcVsyaA5zWeHw
	Myzcrf9Dal0OpXQal1aXeak9dXvSMKsGKOfeF26fcutexU+p896kDcwx/fN+ByHR0I+AfJsb+EMt0
	kk5iBLY6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCEZg-0005wP-34; Wed, 17 Feb 2021 04:36:28 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCEZc-0005w5-NR
 for linux-riscv@lists.infradead.org; Wed, 17 Feb 2021 04:36:25 +0000
Received: by mail-qk1-x72a.google.com with SMTP id q85so11682693qke.8
 for <linux-riscv@lists.infradead.org>; Tue, 16 Feb 2021 20:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6J1GmYvA/+r4w6cyqpq1BgRwLTNew4xipzHCaPLiO+k=;
 b=r+4dznntt42QbgjXzjAmAmf5DPvX2HGGeoFS1a+r5fCP+CW2V6wh7QsYPc4M+HZPSZ
 jKH7z/CKMpRNKit3l06pPkO55i+L0WcvClkX3dn9XgFaengVB2C8O/aQcki1M2ibddst
 QbSRAACaM7b6PMMyetBxXXhe+KdvcEzkdPI4TyKwKpnXebciJqB9S2+FDNIYVvDkjN4b
 rw5ZsfwohEHCFs4+9StA0gm3fD0h2DwX2b5U0uyKyW9wTub/ASb2BreDDhMrFGIy9YAf
 3wCzVs7CTeBVIU4/jog2x2hlj9U+DsQ135EyCvT0J9H6byQzm5B3mZ2nzbA3Ftx9ni5H
 Pl2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6J1GmYvA/+r4w6cyqpq1BgRwLTNew4xipzHCaPLiO+k=;
 b=AZCp57TYur60SO2F8BoqtuUbOFa8ytEENpFPpUMckJ4iwYfCTpZf+feL8/xsFAe86y
 PXYDG/pTQicvizWAlB+wyFVpBc3PZgg/kHloUEXSZBipwjfaz3EaAkmBcO5QCJsvS0PC
 o0eHCJ6pmdgLbPb+t9R3Kyt96tP7iUg3b1BN1UeND/mLaqgibZBJu+x1wzuJVnJdnm5o
 CKln1/V2lUwHO9ehsk1h6in3meRMQs/Nx4yp7bXMhqf3+wLvgU48fWc3LIkqai4aISPp
 yge07LXeYIwx3BaseZxplCbX24WRYQRbi+aXoBmNOT32v5VvMl8C8WQO3HmvAHXDgVWB
 vVHA==
X-Gm-Message-State: AOAM530a/QcYi39effYGwoli9yI12Bs4Q1miFZ+aj1uYfk7ICxzAKTNx
 ecBGCzysq3DyVREzLnDnzum2ZUjMlOTzAqG8UKQPWk8cVRYBPw==
X-Google-Smtp-Source: ABdhPJz/X/mRhg7ASznCeddUse4XP5MMYBeM8wJyRX25mLurrVMCa8E6Tx/LyYmVMqnqwvbgXIyi8U9kABSHOCvQNAM=
X-Received: by 2002:a37:a757:: with SMTP id q84mr22382685qke.501.1613536582438; 
 Tue, 16 Feb 2021 20:36:22 -0800 (PST)
MIME-Version: 1.0
References: <20210216173305.2500-1-tklauser@distanz.ch>
In-Reply-To: <20210216173305.2500-1-tklauser@distanz.ch>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 17 Feb 2021 05:36:11 +0100
Message-ID: <CACT4Y+YVvbh1LTzN1AVrP9xm9cJuYs+kC-yTKQTgBxnRH_XSpA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Disable KSAN_SANITIZE for vDSO
To: Tobias Klauser <tklauser@distanz.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_233624_831713_2040BD29 
X-CRM114-Status: GOOD (  17.09  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 16, 2021 at 6:33 PM Tobias Klauser <tklauser@distanz.ch> wrote:
>
> Dmitry Vyukov reports:
> > I've localized one issue with riscv/KASAN:
> > KASAN breaks VDSO and that's I think the root cause of weird faults I
> > saw earlier. The following patch fixes it.
> > Could somebody please upstream this fix? I don't know how to add/run
> > tests for this.
>
> Verified the fix on a kernel with KASAN enabled using vDSO selftests.
>
> Link: https://lore.kernel.org/lkml/CACT4Y+ZNJBnkKHXUf=tm_yuowvZvHwN=0rmJ=7J+xFd+9r_6pQ@mail.gmail.com/
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Tested-by: Tobias Klauser <tklauser@distanz.ch>
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

Thanks for the quick fix!

Tested-by: Dmitry Vyukov <dvyukov@google.com>

> ---
>  arch/riscv/kernel/vdso/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index 0cfd6da784f8..71a315e73cbe 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -32,9 +32,10 @@ CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
>  # Disable -pg to prevent insert call site
>  CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os
>
> -# Disable gcov profiling for VDSO code
> +# Disable profiling and instrumentation for VDSO code
>  GCOV_PROFILE := n
>  KCOV_INSTRUMENT := n
> +KASAN_SANITIZE := n
>
>  # Force dependency
>  $(obj)/vdso.o: $(obj)/vdso.so
> --
> 2.30.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
