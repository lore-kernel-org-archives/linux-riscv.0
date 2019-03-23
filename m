Return-Path: <SRS0=pIoZ=R2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F5C5C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2019 11:15:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C3E9218E2
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2019 11:15:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bxhgTikw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="cMRLo8EU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C3E9218E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+tPMbkzoUCqQARJWYogxzwht1kY4NIIzvfVmhjzivJE=; b=bxhgTikwm8pTpP
	VUwhxRZnNZS/WUTcezOPO3MoapwUIVymhEyUH5IXpKAdNVkEx7oCTlLSgxNN7cdBaRHEetTi42YJY
	PlwOeaF4e74IT9yY5hgIAdirGZ+Szrl3bjb7HiG+6sJ0UalbrZVKD3aMNopeou+FJNLFhqoZxca2U
	EP4cJJ3tJM8qBG7QJrYm+emecTN+w69bipTQmW4TydnMaK9SPngiFG7L5Yt8HwZDYAUb30Oui8xWG
	cQNy2qqIJj8spfFwzWWPrqS1E5rx9fzR2NdB36pVnZzesECenzPS+o7Z28HDj/AOsGATpJ4qWAGEL
	/aS8wkL1ZOxR2HbtGo1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7ecd-00006D-5E; Sat, 23 Mar 2019 11:15:31 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7eca-00005X-4b
 for linux-riscv@lists.infradead.org; Sat, 23 Mar 2019 11:15:29 +0000
Received: by mail-wr1-x443.google.com with SMTP id s15so4955318wra.12
 for <linux-riscv@lists.infradead.org>; Sat, 23 Mar 2019 04:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gKVh9qYR9JrCsh7E8CFx7WgqHzSCvuhqj6pXjebU0Ho=;
 b=cMRLo8EUypIuvd/GfvKnDpu+NxfR9z8X6slb0C9oRtWsLVgzlDsBVnQN0rNA+43Ht8
 GL5V/C6lHcJ4tf62E5CpR6J5fDgtEmEv3UC21A2CYd5fCrx79jPYvlEY7ESsQoPBCsTm
 rmQ567WPodQ1nCJNOCuj4b9HeCejqu07KNnaaR1lf1HKnOX1QRBYaeGDSVl2JX0YRqqT
 kgUpZS1joEyFZ+wdEh/57Uo0c0U1YLu+7MEv2uzJzdjqdPCtDlxesB86dGXuyvZNUKyG
 GCKC8DgtbHVe4J/8wg0FWKT4rlgsYFN4ELMeFwgnLfJy+heP8dGHMeZHaegTJwAVcSpL
 IBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gKVh9qYR9JrCsh7E8CFx7WgqHzSCvuhqj6pXjebU0Ho=;
 b=QqpPMp769XHvy9qv9JJRiI2zsht5SMD2qIrb62O0nFhDfsQuE3YsFSYMV09iQm3r7d
 u2ZYjeMjyfB49mOYw0igOtCb7TIHDmYUl/67QpYALVHGe8EbcrIbzMDDoHv2kvzoamAz
 8d4YHDxHmR2dgIVYDsJSednoZGdiJgvhUNlWOd7rOyPEXjjAgoHWFProFJHLPXaPvXwF
 yi65PMDLgqDoJx8vj9Dka09Khg67OI8hDIwWevKKFvxCylu/QNjYXyl2mESSLsjv11w0
 ahREOhnTpLBn+81umrYgPYmy0XV3BCxyMumQsYlpwiubM67wmvt2nustiUB0AXL6tA7B
 Mk6A==
X-Gm-Message-State: APjAAAX6Epk7s6KWIf6og34YfTenPY6j8mPoCIHHODMkEpR+cjJmnNSe
 A/DIU0I2sV7QUEAoBx8vfAO0U4VeyiiKghDdkoI2vg==
X-Google-Smtp-Source: APXvYqw9uWKvVrgJIxlNXmYLy1uYsebw7CCivgGbSqUqeGo24jqUiTDfuYkB3dTVWnh11uTSOSkMc9kqQx+rD4VDgQk=
X-Received: by 2002:a5d:5108:: with SMTP id s8mr8758761wrt.99.1553339723383;
 Sat, 23 Mar 2019 04:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190322215411.19362-1-atish.patra@wdc.com>
In-Reply-To: <20190322215411.19362-1-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 23 Mar 2019 16:45:12 +0530
Message-ID: <CAAhSdy2MNA3A-vYD+WJqZAF9L8nScVjh7ZNQDdPpJNB+=BoWkw@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/riscv: Fix clocksource mask
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190323_041528_245842_38417C22 
X-CRM114-Status: GOOD (  14.43  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Mar 23, 2019 at 3:24 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> For all riscv architectures (RV32, RV64 and RV128), the clocksource
> is a 64 bit incrementing counter.
>
> Fix the clock source mask accordingly.
>
> Tested on both 64bit and 32 bit virt machine in QEMU.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  drivers/clocksource/timer-riscv.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index e8163693..5e6038fb 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -58,7 +58,7 @@ static u64 riscv_sched_clock(void)
>  static DEFINE_PER_CPU(struct clocksource, riscv_clocksource) = {
>         .name           = "riscv_clocksource",
>         .rating         = 300,
> -       .mask           = CLOCKSOURCE_MASK(BITS_PER_LONG),
> +       .mask           = CLOCKSOURCE_MASK(64),
>         .flags          = CLOCK_SOURCE_IS_CONTINUOUS,
>         .read           = riscv_clocksource_rdtime,
>  };
> @@ -120,8 +120,7 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>                 return error;
>         }
>
> -       sched_clock_register(riscv_sched_clock,
> -                       BITS_PER_LONG, riscv_timebase);
> +       sched_clock_register(riscv_sched_clock, 64, riscv_timebase);
>
>         error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
>                          "clockevents/riscv/timer:starting",
> --
> 2.21.0
>

Looks good to me.

It would be great if you can add "Fixes:" line and
"Cc: stable@vger.kernel.org"

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
