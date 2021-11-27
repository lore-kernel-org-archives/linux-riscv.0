Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F431C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Nov 2021 19:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R/cXukazMXigqX5cn/E+BH1jAh7kEzAhmlCQNAA1zWM=; b=ixe9+Wm+TUDCeK
	fYr3rP8nNFrG9asXE+rJT1Qj15BDBxBPpx4o2fpAPOX5fzHUEUEDXyF9xkQxqVj9gfFSXkL0/jMbl
	ALWr3FVrsArvD4iCPK1P5Sa8SU1p8eMrl/ywDhhcMI7DFdH/ZcxVe/whGcg05a6gQTAk7lRH6zT7d
	zj0uxn2YFljvFqlMEC+Clb7IeIPFGvGaWFrvUoSPNk5L/0T9MZLDUp1+YdrRe3kekvWOFUPOcLbGi
	pyD7/EuG0T7u9PdCtweD990vFk/sMdxywoL3v685FAwPZM2FW3uNqByg2tZ/q/t9ZxScjENGYTNvU
	BIXHw68ZZo+BeFSJLMMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mr3GZ-00EHIl-5Z; Sat, 27 Nov 2021 19:21:43 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mr3GW-00EHI7-DM
 for linux-riscv@lists.infradead.org; Sat, 27 Nov 2021 19:21:42 +0000
Received: by mail-yb1-xb30.google.com with SMTP id v7so29575585ybq.0
 for <linux-riscv@lists.infradead.org>; Sat, 27 Nov 2021 11:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GPTEsVd8L/qgtedGXg8tCxgoVeCdwj/SNLHqkRKMp1Q=;
 b=HRzdwNX78qudIyrJ0A89abuLwyl0Inc+DCkIbl2N8bFzCmhYH0nE2CK22QRmBwrncr
 uGn0BL+EJjPv7iKBWAYifS9Rtyg55MffQXiypB6mVR7dX+KIwRpR2sZ6q9q6Aa0d14Yl
 Pg748NC0LMggx/7lGaGG/avAi9B8u67S0ENIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GPTEsVd8L/qgtedGXg8tCxgoVeCdwj/SNLHqkRKMp1Q=;
 b=JGGJI5zfGed0OZYqY5W7mx+/U6HiA5hc8R3Hte3MwF9dngPTMmIjq6imKiE21q8Ei7
 lf7m/HAVYE1TYksT+1HyGs9XN0yO7AynptCmA64KlzCQLRiWbx8STnSvM7kx12NQDp25
 oe2TXJgONfF2kEwUL5sYXlnmctO8lhouUgj9bt9lZvdx5zWNJwaPXcM4BIjOQIjxmLsm
 XzmSNKzF/r51r1nkrGFlRP5D9sGmKfec64JwOrEREOAmq+j4wJz0pvsRQVJpHqTznEuw
 BAfauUsa2w9uhcM/wzYVLPhaOMuMIhJcg/0aF/6wVmdYS84QSaIUJzZe4YIITIUUapiO
 36+g==
X-Gm-Message-State: AOAM5316RDrFLLZZsL2bDZrDfsiuLDJuZGqzo1qVLQZSIYGpFqDjcrEk
 /13wtvNZeGFhz8N2K08SsgeyCOnYD+Xe5v+savzZ
X-Google-Smtp-Source: ABdhPJyo8tW8RoKqYEawGG4QSNv0yHwoeBOkEaHHs7riL9cwzAAM/pZ7pJPUcbyLeMq2fKRhngb3JkrY0DZRB/0O7V4=
X-Received: by 2002:a25:748d:: with SMTP id
 p135mr25906993ybc.169.1638040899293; 
 Sat, 27 Nov 2021 11:21:39 -0800 (PST)
MIME-Version: 1.0
References: <20211126223123.1125916-1-colin.i.king@gmail.com>
In-Reply-To: <20211126223123.1125916-1-colin.i.king@gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Sat, 27 Nov 2021 11:21:28 -0800
Message-ID: <CAOnJCU+QRiFYjDfDr=7v+k2Th6fTxNzec3z86x-y578+WzSSrw@mail.gmail.com>
Subject: Re: [PATCH] riscv: perf_event: Remove redundant initialization of
 variable ret
To: colin.i.king@googlemail.com
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, 
 Namhyung Kim <namhyung@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-perf-users@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, kernel-janitors@vger.kernel.org,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211127_112140_528476_920694AE 
X-CRM114-Status: GOOD (  19.68  )
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

On Fri, Nov 26, 2021 at 2:31 PM Colin Ian King
<colin.i.king@googlemail.com> wrote:
>
> The variable ret is being initialized with a value that is never
> read, it is being updated later on. The assignment is redundant and
> can be removed. Clean up the incorrectly indented following
> declaration of variable code and move to the same line as the
> declaration of variable ret.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  arch/riscv/kernel/perf_event.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>

This file will be removed in favor of a platform driver that has more
rich support for perf.
https://lkml.org/lkml/2021/10/25/1427

> diff --git a/arch/riscv/kernel/perf_event.c b/arch/riscv/kernel/perf_event.c
> index c835f0362d94..cf3e2ac9bbb2 100644
> --- a/arch/riscv/kernel/perf_event.c
> +++ b/arch/riscv/kernel/perf_event.c
> @@ -156,8 +156,7 @@ static int riscv_map_cache_decode(u64 config, unsigned int *type,
>  static int riscv_map_cache_event(u64 config)
>  {
>         unsigned int type, op, result;
> -       int err = -ENOENT;
> -               int code;
> +       int err, code;
>
>         err = riscv_map_cache_decode(config, &type, &op, &result);
>         if (!riscv_pmu->cache_events || err)
> --
> 2.33.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
