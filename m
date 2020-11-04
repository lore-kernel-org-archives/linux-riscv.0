Return-Path: <SRS0=Bqyv=EK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B17C2D0A3
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 17:34:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCD1020782
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 17:34:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qdxAjGEy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="JuS/bSEq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCD1020782
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GALgwFSH8mCaNGxIgE63VBPF72chg5Ikxna+H4t6wVg=; b=qdxAjGEy1rwGHPz8EYzEaiBob
	/HmNSO5lBnBD04cveU4YR0Mu7QL1GOYxYLMESH9S7+I0o8uoRTBBVwM47cvKtRvwmGnWxVUn0AsQ4
	8YBF7jmOuw1+wWSVQFYH9VYjvIRlp7f8Z+QQrFa9drEzzp6vU78M8CuW6W+0lJxiKOa1he2wYxVwR
	BBI1RYFpMyH0XcQBDN1LnJbRIpJTg+qcdTmg/+1NRmBAtQTgSRi29w8RzSoDHkH1t5HwLha7GmYyw
	ZmIsZj7Oj5QsP0kYWbI3Ybo9reyJ2PvZ4yQR1OZ8w4NTYTbkdzzhLUg3FYizggJwaFDaRYqoDfabm
	V+MnKPBiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaMfu-0006Jl-8y; Wed, 04 Nov 2020 17:34:22 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaMfr-0006HM-2X
 for linux-riscv@lists.infradead.org; Wed, 04 Nov 2020 17:34:20 +0000
Received: by mail-io1-xd41.google.com with SMTP id m9so9350034iox.10
 for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2020 09:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ct2PY9LkWFmX9fT2YdZ4CV5EO43udOgGQO7/+0Zgyk8=;
 b=JuS/bSEqv8Rd8NgAU+w1gAZYL/Hv1RpTBXJIfKE/k5xsv7MCU2v7AgwLDFGk7BiOM9
 4DuLRaGsVyYNW4hcWDPkasB2Zt8x9Jy9V1Ciea1Z9v24Q/xuTHY4TvD8nd04m6Iosg4T
 FQlh+9gAdf6ItOgcaUNzl2Bgn3vwmZK3vQ3+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ct2PY9LkWFmX9fT2YdZ4CV5EO43udOgGQO7/+0Zgyk8=;
 b=hifq5AaYyRBlHfwWTJvtngjaHiWieGyrcvqYZ+JGLf3+93cxDNzomUACGmnCOxA1t+
 1QKBT04zj9YalmBRXBp1249/xMR0JDS9CDn/ZZLGaXw7Zi3VfP3du2xRquRh/FPU7iTm
 cKrYQXUXTTg8fxr8LAS0UJUjurT7N0/HUriYqLPMhxYJzzqqXMfoUEEPLLugiTwPyFkf
 nC/w+7ZE+52aTu4qWAUGBGd+f8z2Xh0Qx7N9//hxJSjtlYbAYpEIyoi1P5w7DhymyfdA
 mX/g7dpO8NMPhTkggcfxVtciLuNR4S/RRyXlqnGA4RH4MKkq+OjjDL/uVCmpUGQJjmB2
 YGiA==
X-Gm-Message-State: AOAM531GfwHgWrzdIJeklcK2HUxsOanWAbUdRkgZmZg7Xa0nXN7hsE8+
 ZiGxsgFL7jX/UDOMrlWTFWJHqB2Vlk0HiJAT2LIB
X-Google-Smtp-Source: ABdhPJyJV/dcyIewst6iqEfDvybptXZoPwlby3oty/BdC9ElFPB8x7yR0BsEoNO7Wo8jBpOQt0yyTAl4NzlLU74Q6n8=
X-Received: by 2002:a5d:9842:: with SMTP id p2mr18834800ios.113.1604511255519; 
 Wed, 04 Nov 2020 09:34:15 -0800 (PST)
MIME-Version: 1.0
References: <20201104061501.91153-1-wangkefeng.wang@huawei.com>
 <20201104061501.91153-3-wangkefeng.wang@huawei.com>
In-Reply-To: <20201104061501.91153-3-wangkefeng.wang@huawei.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 4 Nov 2020 09:34:03 -0800
Message-ID: <CAOnJCU+nBEkzVpWJBPuZXxep1NqLHehV_efNcu-b86NVkYx9mA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] riscv: Clean up boot dir
To: Kefeng Wang <wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_123419_231058_91D6210C 
X-CRM114-Status: GOOD (  14.75  )
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
Cc: Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 3, 2020 at 10:10 PM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> Let's remove all files under riscv boot dir by using archclean rule.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/Makefile      | 3 +++
>  arch/riscv/boot/Makefile | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 0d9ecb959962..8c29e553ef7f 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -101,3 +101,6 @@ Image.%: Image
>
>  zinstall install:
>         $(Q)$(MAKE) $(build)=$(boot) $@
> +
> +archclean:
> +       $(Q)$(MAKE) $(clean)=$(boot)
> diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
> index c59fca695f9d..03404c84f971 100644
> --- a/arch/riscv/boot/Makefile
> +++ b/arch/riscv/boot/Makefile
> @@ -18,7 +18,7 @@ KCOV_INSTRUMENT := n
>
>  OBJCOPYFLAGS_Image :=-O binary -R .note -R .note.gnu.build-id -R .comment -S
>
> -targets := Image loader
> +targets := Image Image.* loader loader.o loader.lds loader.bin
>
>  $(obj)/Image: vmlinux FORCE
>         $(call if_changed,objcopy)
> --
> 2.26.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
