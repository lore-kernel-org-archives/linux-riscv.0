Return-Path: <SRS0=0BIX=N5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D82FC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Sep 2021 03:37:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2737F6109F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Sep 2021 03:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2737F6109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fQ4tI3mRcMju2B/Wcqh7HWWHfW64ls43s5UUOJ0ICow=; b=PMp2muPj5BZDfE
	F9f/T/Kfu4Irq6SZuUq3turFgCCdAynY31pJZAtL70hh5foGG8hCkZ4fvLV2sDtN4yEovsD4bdeoL
	urn5M/LGSibtxH8iab4Ikr7w95ngKx3Okt0AnjJNarAtcJWztpHlbSjq6uKG/zjGOQMKdNS82mjES
	gn5uvdWim1IvgyLV6Q2HWk7nqi4ofX6gYltQhS0oFVgL8pxBdqwoERQ0kzOAUk+ynY7QM3wyGQbgq
	Lj9kLnHyTHK8sakd9V2akv7RDSbsOSl0zfu+rHPUDVl7iqs4sZKHlI/O7HiJawL+4z0b8w1VVpM0h
	TgjGIeaEL7K55rFm49EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNRue-002Me9-3v; Tue, 07 Sep 2021 03:36:44 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNRua-002MdL-Uj
 for linux-riscv@lists.infradead.org; Tue, 07 Sep 2021 03:36:42 +0000
Received: by mail-wr1-x436.google.com with SMTP id t18so1564898wrb.0
 for <linux-riscv@lists.infradead.org>; Mon, 06 Sep 2021 20:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kFELlCxACkPlVqOqccw5bz/5Ef/2jWKLWio/1Ljd534=;
 b=MNytY5sC4yk+LE2yIrQUn4UbJewA24iX2y7cU4snKj2frfStKGIw9fmt62Wjs6mg0D
 WsTmOnLKSRFv1bLPiM9WahCcDyjbYW3H6mVYNVOHemm/cGk1SkkMYa/xStEIsawZfICo
 Ky0aNyy5xAZT3FqYqBIRENMy33XbOOsW5oNZ/GuwjcuALXZqmkBfRoaODP8ps1qb24HO
 3suPmJ2xTvpkmZVBsqd2hsXA7pEVpJ0ih2oF3SgeO89HdbuMCCKvvpTKIpACrZN6ggt5
 3R0DPxoE6kVq4ogkouS7oQVGOzejWrltmL46pBmiefuC4xRVf8nEmjVlRgUHVCgTyp+R
 Df/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kFELlCxACkPlVqOqccw5bz/5Ef/2jWKLWio/1Ljd534=;
 b=P9sNWaAkzVPCSTmhUCQSz6XXa7D4UJlPpdLlyUpHjILsoSrdRd6S7n5kmVfbmT7kS+
 ze3Fqt2Ws2EdtF735vIW9QRlPx+D1wfRZ0lUEOMvpAygiBiDTvnQu4BJrvxd4a40nfKI
 lrYR/EYa1YwrcbBmnJhQjwY3VP2RI9RBO1qE02jnk9acHfbE5py/oglNRqpNqHaW0/I+
 q57bqxxfrGAyv4tUrJwfh4p7sx0mLK52Xeu2eHB+sLOt+o+YI76LJPj3GgGGNrMgbTSK
 pWJRga2Rb3ZDTXSq+KMKd5YfteZwBYHqDP2MOjU67lQr7nOV3udG6SHPxtyPGleOxADD
 m4dg==
X-Gm-Message-State: AOAM530aTYPBb5BltjeZJWJnooKJ55oV3zEHOgJ//9JpvMhSI7+IRk0X
 br0D9AVT7N0m+0AIvM5kAQS4jXHoJxZCOvm3/4/dkA==
X-Google-Smtp-Source: ABdhPJw0jsRQpQYdLTeQEAq/WEySFTHLaluzVK0XmoOQYkXfHBdDEWdGDJSkJJCNVq+B7V2qp0ZSHoMCdHQuIOJCYtI=
X-Received: by 2002:adf:f984:: with SMTP id f4mr16548430wrr.331.1630985798777; 
 Mon, 06 Sep 2021 20:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210907002847.111633-1-dimitri.ledkov@canonical.com>
In-Reply-To: <20210907002847.111633-1-dimitri.ledkov@canonical.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 7 Sep 2021 09:06:27 +0530
Message-ID: <CAAhSdy0E5x3e4mkYtL0gk6be2hZEF8KbSTP4DpWCkH_ce3AvYg@mail.gmail.com>
Subject: Re: [PATCH] riscv: set default pm_power_off to NULL
To: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_203641_095801_A1C91ABB 
X-CRM114-Status: GOOD (  19.38  )
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

On Tue, Sep 7, 2021 at 5:59 AM Dimitri John Ledkov
<dimitri.ledkov@canonical.com> wrote:
>
> Set pm_power_off to NULL like on all other architectures, check if it
> is set in machine_halt() and machine_power_off() and fallback to
> default_power_off if no other power driver got registered.
>
> This brings riscv architecture inline with all other architectures,
> and allows to reuse exiting power drivers unmodified.
>
> Kernels without legacy SBI v0.1 extensions (CONFIG_RISCV_SBI_V01 is
> not set), do not set pm_power_off to sbi_shutdown(). There is no
> support for SBI v0.3 system reset extension either. This prevents
> using gpio_poweroff on SiFive HiFive Unmatched.
>
> Tested on SiFive HiFive unmatched, with a dtb specifying gpio-poweroff
> node and kernel complied without CONFIG_RISCV_SBI_V01.
>
> BugLink: https://bugs.launchpad.net/bugs/1942806
> Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

BTW, SBI v0.3 system reset patch can be merged any day
because SBI v0.3 spec is already released.

Regards,
Anup

> ---
>  arch/riscv/kernel/reset.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
> index ee5878d968..9c842c4168 100644
> --- a/arch/riscv/kernel/reset.c
> +++ b/arch/riscv/kernel/reset.c
> @@ -12,7 +12,7 @@ static void default_power_off(void)
>                 wait_for_interrupt();
>  }
>
> -void (*pm_power_off)(void) = default_power_off;
> +void (*pm_power_off)(void) = NULL;
>  EXPORT_SYMBOL(pm_power_off);
>
>  void machine_restart(char *cmd)
> @@ -23,10 +23,16 @@ void machine_restart(char *cmd)
>
>  void machine_halt(void)
>  {
> -       pm_power_off();
> +       if (pm_power_off != NULL)
> +               pm_power_off();
> +       else
> +               default_power_off();
>  }
>
>  void machine_power_off(void)
>  {
> -       pm_power_off();
> +       if (pm_power_off != NULL)
> +               pm_power_off();
> +       else
> +               default_power_off();
>  }
> --
> 2.30.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
