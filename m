Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5FF8C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 18:47:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7011E60ED5
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 18:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7011E60ED5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fLFa+2BeJRFFI8Wwh7PQ4WSMW3S9hswTrlbi0NCczOQ=; b=R370QvHj25oKdf
	gqym1qtZWWrA5DoaGyznFhyKa9AZ96J/NsP9BxKx8TtIbFzGpOZpvnmLUvLDE8/MRUUOO2fzKz7xz
	8P2VEmm0OQVMN/kt1sF7DpYEuWd1qlJqWFoZ2K7GFwL5xU2WK6yS2Vgw9mcqqBHpX4K8lqBvjGJBU
	i/yLGermiDJrRGc1ek9BBx3c7tSaL+HYFS+RET/mB9XhajlZHDz/PTzWbNqwqbaiZyI8emGChJriu
	fRMXMeqQnpfP0ieBbzklPa73thBaMc1jIJgg0LJl+6TtYQ9faZt0claaOTcQcjjUvfO+KE4wzgMT+
	fUE+ozq6+Q+d2ooldFQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mihlG-009ol8-SN; Thu, 04 Nov 2021 18:46:54 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mihl3-009ohx-OR; Thu, 04 Nov 2021 18:46:43 +0000
Received: by mail-ot1-f52.google.com with SMTP id
 q33-20020a056830442100b0055abeab1e9aso9570200otv.7; 
 Thu, 04 Nov 2021 11:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DibJrm4A9ig/vBo1EjDioFiIQk3mKd4WJjbVURulMb4=;
 b=EtEAMOx5lAjtvS5ZQdi9OLEJAANZXmrkSC2muxOTHgu/mvaSnbAxX+373NQCadX4ov
 pVR0P9UzeuGD5WWcCHFu/CQVIcK8k58rCEslnNBpqOHk6ehM9YAgoIJ+iFXZhbz5leFE
 w27TBw2TenmsU6MOj4NCRwfXXsgZqoc007393UAgZBwsB4Xxw9TPGssAphZhDj7vE8L2
 gj0zlJphkWQ079MHXrjoN3dP4Mh4xeLhtQj4/4cFnqGjwkB7e+LolbMIq05P4Uwzymi7
 FUa2NipdMZTXOTJiwJ4LWNstVV/MNXUN2FGLF9LkziNFMo79DZOWV1Jx+Y/VqfaPahNR
 b7Eg==
X-Gm-Message-State: AOAM530000RrxqujTXIDz3zS99YGSR+pzmrGMWYidgHa33fJX89ArRK9
 CVw/wyW9i8ofLjwkN9xVVpcBkPOGl4FkQwzf4eo=
X-Google-Smtp-Source: ABdhPJwQnNjp3uYgBocO01tJttUYZD/1g6MMnI1UZa5kkK2HlPf3uKpAJyavXP4I/0VCGiDu5nLKWC0dOwvQGzLN8DY=
X-Received: by 2002:a9d:a64:: with SMTP id 91mr33119161otg.198.1636051600270; 
 Thu, 04 Nov 2021 11:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211029123855.80344-1-ulf.hansson@linaro.org>
In-Reply-To: <20211029123855.80344-1-ulf.hansson@linaro.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 4 Nov 2021 19:46:29 +0100
Message-ID: <CAJZ5v0gMNP_MLCJiZq8FCCOXxh+V31gTCx5OCNpP-__9Pq0_uA@mail.gmail.com>
Subject: Re: [PATCH v2] PM: sleep: Fix runtime PM based cpuidle support
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Linux PM <linux-pm@vger.kernel.org>,
 Maulik Shah <mkshah@codeaurora.org>, Anup Patel <anup.patel@wdc.com>, 
 Len Brown <len.brown@intel.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-riscv@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211104_114641_817465_EA39CF2B 
X-CRM114-Status: GOOD (  22.40  )
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

On Fri, Oct 29, 2021 at 2:39 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> In the cpuidle-psci case, runtime PM in combination with the generic PM
> domain (genpd), may be used when entering/exiting a shared idlestate. More
> precisely, genpd relies on runtime PM to be enabled for the attached device
> (in this case it belongs to a CPU), to properly manage the reference
> counting of its PM domain.
>
> This works fine most of the time, but during system suspend in
> dpm_suspend_late(), the PM core disables runtime PM for all devices. Beyond
> this point, calls to pm_runtime_get_sync() to runtime resume a device may
> fail and therefore it could also mess up the reference counting in genpd.
>
> To fix this problem, let's call wake_up_all_idle_cpus() in
> dpm_suspend_late(), prior to disabling runtime PM. In this way a device
> that belongs to a CPU, becomes runtime resumed through cpuidle-psci and
> stays like that, because the runtime PM usage count has been bumped in
> device_prepare().
>
> Diagnosed-by: Maulik Shah <mkshah@codeaurora.org>
> Suggested-by: Rafael J. Wysocki <rafael@kernel.org>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>
> Changes in v2:
>         - Moved away from using cpuidle_pause|resume() to solve the problem, but
>         instead just waking up idle CPUs is suffient, due to other recent merged
>         changes.
>
> ---
>  drivers/base/power/main.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> index ac4dde8fdb8b..2fb08d4f1aca 100644
> --- a/drivers/base/power/main.c
> +++ b/drivers/base/power/main.c
> @@ -1463,6 +1463,7 @@ int dpm_suspend_late(pm_message_t state)
>         int error = 0;
>
>         trace_suspend_resume(TPS("dpm_suspend_late"), state.event, true);
> +       wake_up_all_idle_cpus();
>         mutex_lock(&dpm_list_mtx);
>         pm_transition = state;
>         async_error = 0;
> --

Applied as 5.16-rc material, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
