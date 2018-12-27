Return-Path: <SRS0=Nd4X=PE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B767EC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Dec 2018 03:58:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 572962148E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Dec 2018 03:58:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VbD0J+Ti";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="a/kGpxmC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 572962148E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YI6hSfHd/Gu7CAQ+9CKFFTQ53u8LrxSpFN1tHOswnbo=; b=VbD0J+TieXQuyC
	LZ6G4f1JkX2Da5qKEVIaByX1DJ0n/cBSk3fQWy8obAcC2bRqhgnfUimTF1cBvRI5nIL1Uvez2XdAY
	sIfuhJf1LuHjil/2gah/CKPMJEzdY4Kq1AbSLF0ymKqITSMwW2LhNZkj2XAtEsZ4jzXB6qX5IigjQ
	wbJw1Fu5FNcNZOjWDbMKwHmZOkVD4Ur6XwJ/IHiW5FOfbV9+w2BlK4xGkejCy9SdBmF/IkIPN5yF8
	B94Up1TEpikhkIRSHPLsRoEYq7hw0FxcHCFSLtSgQIoisPQNvp9J63Ux4+hLIi7/M+XC8eBIGmGmB
	hbe4jeSaqKo8pzHrUPDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gcMoZ-0003WC-DM; Thu, 27 Dec 2018 03:58:31 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gcMoU-0003Kp-HZ
 for linux-riscv@lists.infradead.org; Thu, 27 Dec 2018 03:58:30 +0000
Received: by mail-wm1-x342.google.com with SMTP id n190so15756269wmd.0
 for <linux-riscv@lists.infradead.org>; Wed, 26 Dec 2018 19:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hWe2wpBd2D39MiGxDvt7Xxqdm6Vxh4rMpytdLJQK45o=;
 b=a/kGpxmCkjbt6lEu7r9USgPbiaqpYQvkfs8f1joj3Yg9ZkiHI7S2nOO02hzLrl3+u3
 JvUFhpj6b+4NXnNB6C0zRDsBA+uEV1a9/gg7j56nPMJ8Q7WE5Hmc8wURgLaj3byd2yGq
 YX1zFb4Q732/LBnT8CntKygKBTFmvj+dHtjit8Jmkqubcd+Ct5MnRTrId+jJNNxN8k6s
 dPnOA24DNDjAcxiTq05HeVWTry2C0IDt2T2+0IYSiYAnmlt3vhf5Z91nEfumiRb/EPwB
 su8cc2iipgr+y3FKcYE1sNI/NgepZ1n1z/+cLEva7D5j0UohqbG6f2/qigIdMQ0mGVwr
 A/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hWe2wpBd2D39MiGxDvt7Xxqdm6Vxh4rMpytdLJQK45o=;
 b=iAwdaRTDY9LsBu87oYnFw4q/h47hlYjrH5G2q0gyUfAUj4UTpRRMtoLgXKXUhwHFcg
 Vr525FDwqycbHHyxpmPe+o1glYmy4AGib4RhpxZLWLb1Wg4dhukOY8azpHMbeCUaFm+y
 jr55rDtDmZN/NTJD3+kpUCPUUtMFFU05qwRxlOx3NueXAUHOKb+bR1fYlWEjyvDSu2nR
 iFw14F0R3MxBpT2novAOYpCNBDWHYXvr2ldLcrXCnZKnRpea2lKubKxIf7CukTjWAtAG
 HczUl8LlMLDWks59Tc0LXbPXFRKtC0HhRXV4sSsZ1sBSOj9ww0y1kzZZb6LEet8Zcup7
 Tjng==
X-Gm-Message-State: AA+aEWYOTbUbHUxS4AZZh6heXmOmXqVJeqIdEAMbpO/pLYxL1y1go9TK
 EvufsGi7NKccDZMYca0HqbJcO0pkYhwkv1/jav4T8A==
X-Google-Smtp-Source: AFSGD/WFGOHrimI2VfSwwJThGTm5gQ+kUyw/HUS4fkfIGctjZOxzrYlJ+xkbrWkm9CQ77AGVkK7YHhrckQb0Oyyc/Dg=
X-Received: by 2002:a1c:a3c3:: with SMTP id m186mr19912199wme.16.1545883094136; 
 Wed, 26 Dec 2018 19:58:14 -0800 (PST)
MIME-Version: 1.0
References: <1545865741-22795-1-git-send-email-atish.patra@wdc.com>
 <1545865741-22795-4-git-send-email-atish.patra@wdc.com>
In-Reply-To: <1545865741-22795-4-git-send-email-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 27 Dec 2018 09:28:03 +0530
Message-ID: <CAAhSdy20-r5e1EQ7yTawbxXs0NgFkfg8L8VLRUFLL=NcXfCD2w@mail.gmail.com>
Subject: Re: [PATCH 3/3] RISC-V: Fix non-smp kernel boot on SMP systems
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181226_195826_582032_9CD702D7 
X-CRM114-Status: GOOD (  19.69  )
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
Cc: Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Patrick_St=C3=A4hlin?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Michael Clark <michaeljclark@mac.com>, Marc Zyngier <marc.zyngier@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 27, 2018 at 4:39 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> In non-smp configuration, hartid can be higher that NR_CPUS.
> riscv_of_processor_hartid should not be compared to hartid to
> NR_CPUS in that case. Moreover, this function checks all the
> DT properties of a hart node. NR_CPUS comparison seems out of
> place.

This only explains change in arch/riscv/kernel/cpu.c

Create separate patch for it.

>
> Do cpuid comparison with NR_CPUs in smp setup code. Update the

Create separate patch for change in arch/riscv/kernel/smp.c

> drivers to handle appropriate code as well.

Create separate patches for riscv_timer and irq-sifive-plic.c
because they will probably go via different gitrepos.

>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/kernel/cpu.c           |  4 ----
>  arch/riscv/kernel/smp.c           |  1 -
>  arch/riscv/kernel/smpboot.c       |  5 +++++
>  drivers/clocksource/riscv_timer.c | 21 ++++++++++++++++++---
>  drivers/irqchip/irq-sifive-plic.c |  5 +++++
>  5 files changed, 28 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index b4a7d442..251ffab6 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -34,10 +34,6 @@ int riscv_of_processor_hartid(struct device_node *node)
>                 pr_warn("Found CPU without hart ID\n");
>                 return -(ENODEV);
>         }
> -       if (hart >= NR_CPUS) {
> -               pr_info("Found hart ID %d, which is above NR_CPUs.  Disabling this hart\n", hart);
> -               return -(ENODEV);
> -       }
>
>         if (of_property_read_string(node, "status", &status)) {
>                 pr_warn("CPU with hartid=%d has no \"status\" property\n", hart);
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index 57b1383e..9ea7ac7d 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -49,7 +49,6 @@ int riscv_hartid_to_cpuid(int hartid)
>                         return i;
>
>         pr_err("Couldn't find cpu id for hartid [%d]\n", hartid);
> -       BUG();

Have a separate patch with explanation about why
we don't need BUG() here.

>         return i;
>  }
>
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index bb8cd242..05291840 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -66,6 +66,11 @@ void __init setup_smp(void)
>                         found_boot_cpu = 1;
>                         continue;
>                 }
> +               if (cpuid >= NR_CPUS) {
> +                       pr_warn("Invalid cpuid [%d] for hartid [%d]\n",
> +                               cpuid, hart);
> +                       break;
> +               }
>
>                 cpuid_to_hartid_map(cpuid) = hart;
>                 set_cpu_possible(cpuid, true);
> diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/riscv_timer.c
> index 084e97dc..acf2af10 100644
> --- a/drivers/clocksource/riscv_timer.c
> +++ b/drivers/clocksource/riscv_timer.c
> @@ -89,20 +89,35 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>         struct clocksource *cs;
>
>         hartid = riscv_of_processor_hartid(n);
> +       if (hartid < 0) {
> +               pr_warn("Not valid hartid for node [%pOF] error = [%d]\n",
> +                       n, hartid);
> +               return hartid;
> +       }
>         cpuid = riscv_hartid_to_cpuid(hartid);
>
> +       if (cpuid < 0)
> +               pr_warn("Invalid cpuid for hartid [%d]\n", hartid);
> +
>         if (cpuid != smp_processor_id())
>                 return 0;
>
> +       pr_err("%s: Registering clocksource cpuid [%d] hartid [%d]\n",
> +              __func__, cpuid, hartid);
>         cs = per_cpu_ptr(&riscv_clocksource, cpuid);
> -       clocksource_register_hz(cs, riscv_timebase);
> +       error = clocksource_register_hz(cs, riscv_timebase);
>
> +       if (error) {
> +               pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
> +                      error, cpuid);
> +               return error;
> +       }
>         error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
>                          "clockevents/riscv/timer:starting",
>                          riscv_timer_starting_cpu, riscv_timer_dying_cpu);
>         if (error)
> -               pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
> -                      error, cpuid);
> +               pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
> +                      error);
>         return error;
>  }
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index 357e9daf..254ecd76 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -237,6 +237,11 @@ static int __init plic_init(struct device_node *node,
>                 }
>
>                 cpu = riscv_hartid_to_cpuid(hartid);
> +               if (cpu < 0) {
> +                       pr_warn("Invalid cpuid for context %d\n", i);
> +                       continue;
> +               }
> +
>                 handler = per_cpu_ptr(&plic_handlers, cpu);
>                 handler->present = true;
>                 handler->ctxid = i;
> --
> 2.7.4
>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
