Return-Path: <SRS0=Ejrw=IP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC530C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 03:36:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57D3564F38
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 03:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57D3564F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=AsI0O6pSVpg1lSFU2mK/6kS5EOmDplTE7aSSXTbW/wc=; b=FZt6tPHTUtP+o8bgWPkuo1VJ0
	BluOEO40+XOgx3hWCfrpzodoiN2IDQdSMNt8ELgB1nLkTcVF/P1GHiGtKzNfvrNPzBIJh+qoHusi4
	LpuykrHh5ptogeTVVozsZnPAqkoQ9VOWgD14c4EZExcTSGQbr0m1MWWCVxGZ5BPMsSO+SbcLqadFF
	IS8QQOBVAbKzxSBRYLzNEeixdETbLxKJPbna/OrRTpOnjvCcHleYhXXPkEIGX2BgGfllw5mw8cZjC
	jDFqEW0FT/D/UQpj6++yvnE+p80kaxYU4gcwjUdWQjAp5elVz6xfjYjF5AjOTAlskFUdr4rXb+VOP
	7k2Ci7XFQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMMyr-002M9M-5e; Wed, 17 Mar 2021 03:36:21 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMMyh-002M7o-7a
 for linux-riscv@lists.infradead.org; Wed, 17 Mar 2021 03:36:14 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 ot17-20020a17090b3b51b0290109c9ac3c34so175451pjb.4
 for <linux-riscv@lists.infradead.org>; Tue, 16 Mar 2021 20:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=vgC4Hi1wlvfUamR+lmJh7JgDIUhelSU6Ukx+EhusVr8=;
 b=Gnx8QJNkZubSSIyu4WGdQec8Ajw0vvWuYdvfhDVqP7/7F/Z57lmQ5MThtB12qZYecE
 4ERfVxOn9an7bDs4FarZsNvAl1HKlaJ6ZwlO6KQTd0o1thIC2T191NBL/f+ZSg5AX8kn
 QLCAn7bmHEql+ZdPe4za5vCUVQacHBJRX4DuA7ybt9GHapatznswao4DWqwjEoE1+Ei3
 r3cayDqbinfJCWfQFAXEYCBsQ6i4i4FfLF77IPJLbsSkSTX4mS9LenT+OwfBn/cqKMoN
 1UuanW+nOKrqWL8LyoFcXPDO64EhOXQ90gf2lzYZ9bMO5w8zTPVCioRp3wdrhxMUXyJx
 /YIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=vgC4Hi1wlvfUamR+lmJh7JgDIUhelSU6Ukx+EhusVr8=;
 b=OyiROBnbkwqACDgzEt0Swgtvb5Yd1vTStF8drTGraqkv09AJzucTPQtCK/MrGzJt9Y
 wmLUe0FltqzFVK9XqjldOIhJJYewSlpIV57QPVjecMmZ4o7Gzn6QMsKcpLO6Bl5k8uSi
 ylhLuDU6g76nZ5tiDlwk6Jz3xWwiaWpCChmqujBfhgDOcSxMHBG8Ce+upuTINbpkYKlq
 mv14MoXMdciFaACRknH/DqbQLpLC/C+b3dEXMqxub6LQT/7vCsdQoJT2pAoXbVDcYq7m
 0l2Vj8vXiUlQbkJWyEk9cCNPvp4CyE+rZwh2frAOvqyE/zKBszqL/g8uVAwiIwt5tpA5
 OYQg==
X-Gm-Message-State: AOAM531xAoMKOiZB4B0AN8eJuGOLiCkW8dOabQUM1+qvoO6eujUB00QB
 kRIVx2jpT59wvFfwnUell7Ll7YEn2qRGnvsI
X-Google-Smtp-Source: ABdhPJw4lISaavZJujC21CQLMCa8XgLKbdbcKmBpGRJonPttIAH9wkgW/3AMFz4qmzc6iC1nUozPtQ==
X-Received: by 2002:a17:90b:1082:: with SMTP id
 gj2mr2223421pjb.155.1615952168886; 
 Tue, 16 Mar 2021 20:36:08 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id bj15sm730816pjb.9.2021.03.16.20.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 20:36:08 -0700 (PDT)
Date: Tue, 16 Mar 2021 20:36:08 -0700 (PDT)
X-Google-Original-Date: Tue, 16 Mar 2021 20:33:59 PDT (-0700)
Subject: Re: [PATCH 2/4] clocksource: riscv: Using CPUHP_AP_ONLINE_DYN
In-Reply-To: <1614608902-85038-2-git-send-email-guoren@kernel.org>
CC: guoren@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, 
 linux-csky@vger.kernel.org, linux-arch@vger.kernel.org,
 guoren@linux.alibaba.com, peterz@infradead.org, 
 tglx@linutronix.de, Arnd Bergmann <arnd@arndb.de>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Anup Patel <Anup.Patel@wdc.com>, Christoph Hellwig <hch@lst.de>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: guoren@kernel.org
Message-ID: <mhng-2d96ba73-2578-4f60-b81b-75da618ff41e@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_033611_515353_263E85D7 
X-CRM114-Status: GOOD (  18.23  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 01 Mar 2021 06:28:20 PST (-0800), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Remove RISC-V clocksource custom definitions in hotplug.h:
>  - CPUHP_AP_RISCV_TIMER_STARTING
>
> For coding convention.
>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> Tested-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Link: https://lore.kernel.org/lkml/CAHk-=wjM+kCsKqNdb=c0hKsv=J7-3Q1zmM15vp6_=8S5XfGMtA@mail.gmail.com/
> ---
>  drivers/clocksource/timer-riscv.c | 4 ++--
>  include/linux/cpuhotplug.h        | 1 -
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index c51c5ed..43aee27 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -150,10 +150,10 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>  		return error;
>  	}
>
> -	error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
> +	error = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
>  			 "clockevents/riscv/timer:starting",
>  			 riscv_timer_starting_cpu, riscv_timer_dying_cpu);
> -	if (error)
> +	if (error < 0)
>  		pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
>  		       error);
>  	return error;
> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> index 14f49fd..f60538b 100644
> --- a/include/linux/cpuhotplug.h
> +++ b/include/linux/cpuhotplug.h
> @@ -130,7 +130,6 @@ enum cpuhp_state {
>  	CPUHP_AP_MARCO_TIMER_STARTING,
>  	CPUHP_AP_MIPS_GIC_TIMER_STARTING,
>  	CPUHP_AP_ARC_TIMER_STARTING,
> -	CPUHP_AP_RISCV_TIMER_STARTING,
>  	CPUHP_AP_CLINT_TIMER_STARTING,
>  	CPUHP_AP_CSKY_TIMER_STARTING,
>  	CPUHP_AP_HYPERV_TIMER_STARTING,

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Just like the previous one.  Presumably CLINT is ours as well?

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
