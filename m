Return-Path: <SRS0=Bqyv=EK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B75C2D0A3
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 17:34:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E3CB20759
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 17:34:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2eqBFMX4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="AZD0MCoR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E3CB20759
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cn6c6SdEwAKn5B7/I0MoRmH7H4pLobNliCbu8ntKf+A=; b=2eqBFMX4rthoiwjX1hO+piNJz
	PlSMHyLCMPMQuNtdvJPHeEgcEtXfOy1GBgVv0yYgYZ+Fj6AmcHnUXKWaibafQhdWVwbvHxUhs+fb5
	qsx3vxfKhCFExUQo6qAPDT/mGF1ssYlFM5U0nVUgksNt8lcJddGFPvXho/dR319XFmEy0FCVRlDPc
	jqhFUuTipL3uEVL8a9CWbBqV+5TSWIqy6LYf3fjPMOxWeCJX2Tg7FBUkVeTDxS3fBoMNFN443Ngq6
	2BAgm3Pk9ITJWEjwOWyCbnCFAkwSzSKSqsg+8/NnXJEVezUF/8SjscbJQYfhGdR+S3kmE6Stag4A/
	xpkzPeh/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaMgK-0006Uy-Ft; Wed, 04 Nov 2020 17:34:48 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaMgE-0006RY-Gf
 for linux-riscv@lists.infradead.org; Wed, 04 Nov 2020 17:34:45 +0000
Received: by mail-il1-x142.google.com with SMTP id n5so20037242ile.7
 for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2020 09:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6WmjKlfBhCjdqrgN3bND2vyvfn3sNx2l7o8gw6f2LLs=;
 b=AZD0MCoR5iTr3XrHNyI+yQkr3eL5TLJM9ZIzq2FPHOh1vMA53SYbXuIkMtmGe7QqRx
 A4+1HlIS1GgyDfTh5SzMKEcsUR1ssJfActQv+sTfVAQJ5Gj+0PzfuXGtyzhC7611ihjd
 zumMrUuvgTMKVHvPYBkE/RBdjsTVpfusq7b1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6WmjKlfBhCjdqrgN3bND2vyvfn3sNx2l7o8gw6f2LLs=;
 b=CaXCKzF1BDyEJivvpNJFrOAvbcd5w579DA6YCigSoFDePEYTw3p2LaF1LqD0udyMnT
 Cn5yHA9nQD7iYeBHAASncf7FTwhTEfoCc2rlZm2xKbz7E6sqwbi3lnjEpIRD3mEFzev2
 byN0ymBbKg1P0dLsFUL9rMdhWqXiF5OdtcFwpdhLawK4+CGBMku5MBAM3VV8LiEp6Tso
 Xu7Q/TZpX01xtHvjvVmdAQRxu01EBOM/FvxBDqVxtOtwsE1eMP1rS4R6vFScMhdnUKcb
 DbxGWdPSxSBfORlc++u/hYAltF+riCmcH6tZ5lQwV/I85CTr8fid5vnFAW249DtbosJS
 FOkw==
X-Gm-Message-State: AOAM531+HMVh40PH4gYTjKvr8W5RHHyLTWnIrX1Akmrdx4eDYQvAfPP3
 WGwwyGKQhx3sRKM4Je9nbsVLRkTOe9/lgD7ALDy8
X-Google-Smtp-Source: ABdhPJxRFpF7t4lK8Tl0b9hUZ/OQE0iRQF0WVmONIkD9BrytTP12XLtsw1Doml8ihHiXuJFzqXf5efIUFJ8wfG+RcVI=
X-Received: by 2002:a92:1f8d:: with SMTP id f13mr20357934ilf.77.1604511280124; 
 Wed, 04 Nov 2020 09:34:40 -0800 (PST)
MIME-Version: 1.0
References: <20201104061501.91153-1-wangkefeng.wang@huawei.com>
 <20201104061501.91153-4-wangkefeng.wang@huawei.com>
In-Reply-To: <20201104061501.91153-4-wangkefeng.wang@huawei.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 4 Nov 2020 09:34:28 -0800
Message-ID: <CAOnJCUJGPi8fPhBRuBtktO=VO1GJYsfjyg9edDWQRU6bxaofZg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] riscv: Ignore Image.* and loader.bin
To: Kefeng Wang <wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_123442_598774_A199CC7A 
X-CRM114-Status: GOOD (  15.18  )
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
> Do not track all compressed Image and loader.bin.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/boot/.gitignore | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/.gitignore b/arch/riscv/boot/.gitignore
> index 574c10f8ff68..90e66adb7de5 100644
> --- a/arch/riscv/boot/.gitignore
> +++ b/arch/riscv/boot/.gitignore
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  Image
> -Image.gz
> +Image.*
>  loader
>  loader.lds
> +loader.bin
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
