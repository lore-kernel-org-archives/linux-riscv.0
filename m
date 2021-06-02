Return-Path: <SRS0=2RK3=K4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22CDC4708F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jun 2021 13:19:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69D286023D
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jun 2021 13:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69D286023D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3MdWORENMfGSK7VNjP3VKHiWq8UPi4UM4ovm4nHmWto=; b=CJ8Tdx/59lNAOo
	IllrCoz3FmJSKCOKdSoT6khD6F/HKbAm0FsItbJ8n0xWkonxOVBWElhFhfBViRCfkMLUeITnYNU6T
	hblDW+LeSNBA+rFwO6UotA/d9Nb/6OPBxy8AxLRV4/LHJhCYX/hlR/UuWJl7YS2OuIYQchbksjZ+T
	zhLaUQKHGY6WP4AjsbpVRfIgS89v92wnGWZBAMlmbU59ZwdAYGz8UMOZ1PAZnIDGt8NIaDeIxB8xl
	CwyqS5s5jyX+XJFzlZdBsZ//0+tFImVb8QXqh/TIjQJNVmqOCLdnQJUnQnWy+v1GcVsJBMmhyJ3v4
	BX1JEut8iGt9J0mPx8Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loQlx-004KYU-0K; Wed, 02 Jun 2021 13:19:01 +0000
Received: from mail-ua1-f48.google.com ([209.85.222.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loQlp-004KV2-Hs
 for linux-riscv@lists.infradead.org; Wed, 02 Jun 2021 13:18:59 +0000
Received: by mail-ua1-f48.google.com with SMTP id m23so1241995uao.12
 for <linux-riscv@lists.infradead.org>; Wed, 02 Jun 2021 06:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uH5yxU+BzRF90wWQwBO4VM5milL3akGJBti5j4uOIZE=;
 b=s6OLJzCVfowSoFK+Kn+Dhlq9dbdZvw299TRcMkIdw5Yuw3QzvKXt83rm00ZYmdAzHh
 /1dzY+TZZYI7BxQvrF0FDyUZF9EMiKzASt4L13dLl6SCkUavqGGqBrk3O90KyRB0h+lE
 5vqtpcRDiNuA4hyi2GEWpaPREnpTT8jFXAL3Ypr8EXcRsTLjM2LEkV+hLkRG4wNmfK+c
 hawPsG2yo23cDzABvRJQmn8X+GmEu9mJER+1cYC3lQAxQ/foh9xbWloSO7ggqM4k6Djv
 ehNToKgNW35e/8OEm0Hun2TjV2n0awAldfNx1NCqo7S6PU2Wlxzae8ooaKznyMLri193
 rSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uH5yxU+BzRF90wWQwBO4VM5milL3akGJBti5j4uOIZE=;
 b=t1QutOH8URk62p/MZlRA/e3V+jwGzfwjeglJBDnFerwVpJHvTrDLNO+xQ1+kn12iZp
 iNPY4PD8dA+pERWHQaFNmtzWF1vgPeJ8MQec/oyTDfBIO90N0BtxhB/m9IIfEGon6nVB
 BmiVUfm7g1TaBEVKS+WXyk1XOOIJkPRuaPiR085KhukjJ6lzv5wg+TKa7DpBXp5Edxyu
 48sVBy76dL/8clkvrUNyBfw/mG3HtdQ97h5d0iYgIww2QQ4gsB5NEZHpoucN/wWBlcUU
 i46GpqQvnTcqzVjoGhisX+ee8sB6QCdK0bbmqqEyv6HQpkJAoZFHKRcZ9r6wIj0dbX5B
 l4nw==
X-Gm-Message-State: AOAM53008jIq/J+ww0yv7w/dzeFmlm60wQKSzMm1BgmeW3+xznvD8f6b
 c6GZ282no6ydWnHePJPuAV4RSXMFdlVy/rJhIlExGw==
X-Google-Smtp-Source: ABdhPJyvipLZfILhu87oS/az2/HBFVuElK4GQ6Srx/B1cgHvOyXaym3QLEigUlS/OUkA08r+m8+miEhdsQUfZ9i5/94=
X-Received: by 2002:ab0:100f:: with SMTP id f15mr21456136uab.100.1622639870335; 
 Wed, 02 Jun 2021 06:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210602112321.2241566-1-anup.patel@wdc.com>
 <20210602112321.2241566-6-anup.patel@wdc.com>
In-Reply-To: <20210602112321.2241566-6-anup.patel@wdc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 2 Jun 2021 15:17:13 +0200
Message-ID: <CAPDyKFq2tvvAD=2RiePZzce=+OsDaxLWqz+90pTKjTTzqVqcHQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/8] cpuidle: Factor-out power domain related code from
 PSCI domain driver
To: Anup Patel <anup.patel@wdc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, 
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
 Sandeep Tripathy <milun.tripathy@gmail.com>, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Liush <liush@allwinnertech.com>, 
 Anup Patel <anup@brainfault.org>, DTML <devicetree@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_061853_616829_C26AD103 
X-CRM114-Status: GOOD (  12.33  )
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

On Wed, 2 Jun 2021 at 13:24, Anup Patel <anup.patel@wdc.com> wrote:
>
> The generic power domain related code in PSCI domain driver is largely
> independent of PSCI and can be shared with RISC-V SBI domain driver
> hence we factor-out this code into dt_idle_genpd.c and dt_idle_genpd.h.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

A small nitpick below.

[...]

> +EXPORT_SYMBOL_GPL(dt_idle_pd_free);

Do we really need to export this symbol? Looks like there are only
built-in cpuidle drivers that are going to use it. At least for now.

As a matter of fact, the same comment applies to all cases of
EXPORT_SYMBOL_GPL from $subject patch. Can we drop all of them?

[...]

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
