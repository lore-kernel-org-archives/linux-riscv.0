Return-Path: <SRS0=Ejrw=IP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0513C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 03:36:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3921564F38
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 03:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3921564F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=GBCp/8im7zqjDzoY54onIpAktwpeqWGiGFMFmKbWPok=; b=jx6ZR6Mas7RdZ3VddQtF1GyHL
	K0QbV9gp/e3BDuPKmD0ta0OTaq7ccSHuDH4RKEXqQmL2B6ylJSpNXVdclw0D+AYRssAts4rSlleGG
	qdWW8EeRksqodaok57o3MO4mOSqDG6s1FRIfx2AFEqxSmkauZcPACZU8w7/X82gvowaX1gMwktxux
	qn9KeYCBgJU/uPMuHsC5pwD5G6SxQXzBHycz7QtKjo+0on9ntkhrpf7rhfUMJmq4W57tEvoP+FS/x
	4fp9w4I1Nqbpi0BhVwb4JKGeCwG38PJ3Zzv1U8T7pF4jPGAP0fHevpDGtMon+VAzjS9Lj2bGjK7mh
	BIr6rP4AQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMMym-002M8o-QS; Wed, 17 Mar 2021 03:36:16 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMMyg-002M7j-Fw
 for linux-riscv@lists.infradead.org; Wed, 17 Mar 2021 03:36:12 +0000
Received: by mail-pf1-x42a.google.com with SMTP id y200so165571pfb.5
 for <linux-riscv@lists.infradead.org>; Tue, 16 Mar 2021 20:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=W8H72798it9OolNWp4JLWdlboyq7CodcHmCStG5d+3I=;
 b=sDlO2kksnw7mXcOE//Cv43BSuy2P0zSuKgFBddBhhf2tC6IkJ7W8BGkCRbwRJ7nIUo
 GqgCZLicz29lrk2L/QY+ycBUwQ54L+COiFtCVbAyhfPue9O9HLmE+3MXXZWSfPwiSYPY
 Juh3VAVgr/ox9Y3wvQyITyQch8YaTdycI/X0HFkTlRZOFgXr66N5OfEamn59CD52L4xV
 546oJYhNFVDOsMVGi5ukeBqmCKNsBQLxV5HgVceq72qCEt+B0/CgEZ0RenvKSykQrKNB
 Ou5cUqZ8xgftMk0+KbL/8zGMZmKpbssPZAtAAI9o03G+MT6TrF1jGGLVuoHrqGxEwbzU
 nQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=W8H72798it9OolNWp4JLWdlboyq7CodcHmCStG5d+3I=;
 b=dzcDNHFYolih8TLskCLIQAKIFNirzmroZ2LBzyGv+8vPQbMp5H6xuLK74gkLxEHEll
 GdfKzYrfGgVms7X7ObZkRiDRWCXVldG2wQ4jTY7jR5vrOp89UlHT7Y86ukYF6WtJNZ3s
 RLr6gdfjV+CpjGo7Kc/nIOAa0uKyH7MjZWcznjnjSrVdbIv69FXf3vo8tqT4ESFVi3Dj
 /GzUa+Toe/OpjVq6/NYYgx6Bv9Qf4O1793p5LFVnFIC/YLQ6wVn9HN9yZ+HkiQAgAtxQ
 8TCaKNtzhSWRF9d71IkXZ6yrBV5gcXe7/IAfFA6n3N+6pma0M5uUImhp1kFXBWEcSflD
 V0Pg==
X-Gm-Message-State: AOAM532xVGAB3KrOk8OZG+gBh5DtC2yjBj+Aez0KC6mopTgSxsr73RbM
 MyshNme4nXwiREDk7WFWR76dlQ==
X-Google-Smtp-Source: ABdhPJwl5btd1ncxM6rY0CAXQzLiRZjgQVJn8fY2NbH9I7FpzCjOQ2Za5LRVxptThmI9urwNGwsHQw==
X-Received: by 2002:a63:6dca:: with SMTP id i193mr837247pgc.81.1615952166796; 
 Tue, 16 Mar 2021 20:36:06 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id s22sm724266pjs.42.2021.03.16.20.36.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 20:36:05 -0700 (PDT)
Date: Tue, 16 Mar 2021 20:36:05 -0700 (PDT)
X-Google-Original-Date: Tue, 16 Mar 2021 20:33:16 PDT (-0700)
Subject: Re: [PATCH 1/4] irqchip: riscv: Using CPUHP_AP_ONLINE_DYN
In-Reply-To: <1614608902-85038-1-git-send-email-guoren@kernel.org>
CC: guoren@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, 
 linux-csky@vger.kernel.org, linux-arch@vger.kernel.org,
 guoren@linux.alibaba.com, peterz@infradead.org, 
 tglx@linutronix.de, Arnd Bergmann <arnd@arndb.de>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Anup Patel <Anup.Patel@wdc.com>, Atish Patra <Atish.Patra@wdc.com>,
 Christoph Hellwig <hch@lst.de>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: guoren@kernel.org
Message-ID: <mhng-94d75abc-8624-469c-ac51-0d9c82eabb07@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_033610_628137_D81DA6A1 
X-CRM114-Status: GOOD (  17.74  )
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

On Mon, 01 Mar 2021 06:28:19 PST (-0800), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Remove RISC-V irqchip custom definitions in hotplug.h:
>  - CPUHP_AP_IRQ_RISCV_STARTING
>  - CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING
>
> For coding convention.
>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Atish Patra <atish.patra@wdc.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Tested-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Link: https://lore.kernel.org/lkml/CAHk-=wjM+kCsKqNdb=c0hKsv=J7-3Q1zmM15vp6_=8S5XfGMtA@mail.gmail.com/
> ---
>  drivers/irqchip/irq-riscv-intc.c  | 2 +-
>  drivers/irqchip/irq-sifive-plic.c | 2 +-
>  include/linux/cpuhotplug.h        | 2 --
>  3 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
> index 8017f6d..2c37f3a 100644
> --- a/drivers/irqchip/irq-riscv-intc.c
> +++ b/drivers/irqchip/irq-riscv-intc.c
> @@ -125,7 +125,7 @@ static int __init riscv_intc_init(struct device_node *node,
>  		return rc;
>  	}
>
> -	cpuhp_setup_state(CPUHP_AP_IRQ_RISCV_STARTING,
> +	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
>  			  "irqchip/riscv/intc:starting",
>  			  riscv_intc_cpu_starting,
>  			  riscv_intc_cpu_dying);
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index 6f432d2..f499f1b 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -375,7 +375,7 @@ static int __init plic_init(struct device_node *node,
>  	 */
>  	handler = this_cpu_ptr(&plic_handlers);
>  	if (handler->present && !plic_cpuhp_setup_done) {
> -		cpuhp_setup_state(CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING,
> +		cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
>  				  "irqchip/sifive/plic:starting",
>  				  plic_starting_cpu, plic_dying_cpu);
>  		plic_cpuhp_setup_done = true;
> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> index f14adb8..14f49fd 100644
> --- a/include/linux/cpuhotplug.h
> +++ b/include/linux/cpuhotplug.h
> @@ -103,8 +103,6 @@ enum cpuhp_state {
>  	CPUHP_AP_IRQ_ARMADA_XP_STARTING,
>  	CPUHP_AP_IRQ_BCM2836_STARTING,
>  	CPUHP_AP_IRQ_MIPS_GIC_STARTING,
> -	CPUHP_AP_IRQ_RISCV_STARTING,
> -	CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING,
>  	CPUHP_AP_ARM_MVEBU_COHERENCY,
>  	CPUHP_AP_MICROCODE_LOADER,
>  	CPUHP_AP_PERF_X86_AMD_UNCORE_STARTING,

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

I'm going to assume this is going in through an irqchip tree, but LMK if you
want me to take it via mine.  This isn't really my sort of thing, so I'd prefer
at least an Ack.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
