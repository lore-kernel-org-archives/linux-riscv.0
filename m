Return-Path: <SRS0=Nd4X=PE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067D0C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Dec 2018 03:36:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C751D21741
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Dec 2018 03:36:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fevGVLnt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="sKfZTrqR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C751D21741
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QWl7aS2aZDSotGYK9Oc/pudumTRQZtf4U7QZEYlWhsk=; b=fevGVLntpq/egf
	Xf3suJxxzGovLGw+YQAmzfu4yUqCoSvPOdO61CDhie1lAdoP7AXX+WQvqUOLtjoTSJENSy7HjCl0P
	A/vTO9IfAVCdXT0IKBxt1Vv21tX4rqFCEsXGY+K7c6D3gi9Aa9L/sz/lreVaNtht2bF7NzXXnkeP4
	hURcGjXQxPYlBMLXpEL31u4UXV8f2HbrLzOKfpH2Vf3/VNmHyvtDwv0+lLXh67sNiSq/pR1PaEygj
	V0fAcLEI5ivfX2YPXwb6pNJeAgL9jpearWaTx9F8MLOkiZM5a6rhlel+/zAZUd8P8+atV0oFT+uTI
	DnkfSRsjE6syadsig/6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gcMTe-0005qr-Ol; Thu, 27 Dec 2018 03:36:54 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gcMTZ-0005eu-31
 for linux-riscv@lists.infradead.org; Thu, 27 Dec 2018 03:36:53 +0000
Received: by mail-wr1-x443.google.com with SMTP id s12so17085325wrt.4
 for <linux-riscv@lists.infradead.org>; Wed, 26 Dec 2018 19:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AUBNZAgxqZfBaytyfOb+0LphpB3Zk2eeZxHObCF+N0Y=;
 b=sKfZTrqRJx4amkkQ2XUfGpJbQS++7AiWyXIt+nTg7Bn/F9FTMw3REp7NV5xiYdkSiC
 RFjn3+QU70CVjLLudpvNDHg4arNBH5kaaiRoQfmnQqXOkMtGxkp/z/fJMt4tk+KxcJXy
 phrLosh/NL8JT7yH4AgERpy4dqY9W2lMcZSZr6DIUmR+uXMYUPWnxSN1+70LA8Omg/UP
 1k/OxSpHOgn5qrZVBDKIF7KRteVoLj5vHsYpXhHktCql3SIZMpp2DPtvTaPsYM/KaFCP
 Cs2/mlBnKXQ3ApNf0gUJPeQ68KbmNZm3g9oIVUznBM8Uo5q3ejAAkQqTyydVU+DHSq7Q
 vUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AUBNZAgxqZfBaytyfOb+0LphpB3Zk2eeZxHObCF+N0Y=;
 b=B+DuJF0s/o5OIHz2FYOuq6fF39JopabL2KfjdLTB4jhWctIHgZboPNuVz/01MzvF9P
 AAiIDU35zq+rVOc3SxmRyDt2D0Uok3B/arOfiCkbWLZyn3b50ly8tDpXsM8jG5DqWjUc
 YiLGQwQkzBLnjX3mANP84uBTseTrlz2pfAkQmOaVX+X+IB8mblQA/rxB/Ik3YE+jbsjB
 XtU2v9bv0VXo8SSaPPnR74CrEYTKUsEU1QIsvFy7wQo+Zaj3E5XL+Xwbz2YcW2qkhdyg
 4RiHDqhpM3RLtQf3E/5dkEDN0lfVdMlJLZjXSd/0KbKWPZZcs5fUpAsTqPon/qzIH2wZ
 HA9A==
X-Gm-Message-State: AJcUukfa5wqG/3VWYRf6M89Er8w/GUFq0V1apKh41ASJjaS0mJQHhPNV
 OxA/qN2Ye3oCAqp8dKy5tbzsGzQDSBNUmNYmLfrhpQ==
X-Google-Smtp-Source: ALg8bN4G+CDxVgjsNrJPo0Pielf+bbaWCpaE4chVn86VCj7v5+qYj9jG+3cUKFro5aqud5/sMaoAhgYwbo+Lgb8ITmg=
X-Received: by 2002:adf:f5d1:: with SMTP id k17mr21949955wrp.59.1545881795255; 
 Wed, 26 Dec 2018 19:36:35 -0800 (PST)
MIME-Version: 1.0
References: <1545865741-22795-1-git-send-email-atish.patra@wdc.com>
 <1545865741-22795-2-git-send-email-atish.patra@wdc.com>
In-Reply-To: <1545865741-22795-2-git-send-email-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 27 Dec 2018 09:06:24 +0530
Message-ID: <CAAhSdy3Wd6tPrv-XDqETK8sBetYSg-mjHzZXJQJgUFeufEjPfA@mail.gmail.com>
Subject: Re: [PATCH 1/3] RISC-V: Do not wait indefinitely in __cpu_up
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181226_193649_138565_CCBC1901 
X-CRM114-Status: GOOD (  17.41  )
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
> In SMP path, __cpu_up waits for other CPU to come online
> indefinitely. This is wrong as other CPU might be disabled
> in machine mode and possible CPU is set to the cpus present
> in DT.
>
> Introduce a completion variable and waits only for a second.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/kernel/smpboot.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 18cda0e8..bb8cd242 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -39,6 +39,7 @@
>
>  void *__cpu_up_stack_pointer[NR_CPUS];
>  void *__cpu_up_task_pointer[NR_CPUS];
> +static DECLARE_COMPLETION(cpu_running);
>
>  void __init smp_prepare_boot_cpu(void)
>  {
> @@ -77,6 +78,7 @@ void __init setup_smp(void)
>
>  int __cpu_up(unsigned int cpu, struct task_struct *tidle)
>  {
> +       int ret = 0;
>         int hartid = cpuid_to_hartid_map(cpu);
>         tidle->thread_info.cpu = cpu;
>
> @@ -92,10 +94,15 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
>                   task_stack_page(tidle) + THREAD_SIZE);
>         WRITE_ONCE(__cpu_up_task_pointer[hartid], tidle);
>
> -       while (!cpu_online(cpu))
> -               cpu_relax();
> +       wait_for_completion_timeout(&cpu_running,
> +                                           msecs_to_jiffies(1000));
>
> -       return 0;
> +       if (!cpu_online(cpu)) {
> +               pr_crit("CPU%u: failed to come online\n", cpu);
> +               ret = -EIO;
> +       }
> +
> +       return ret;
>  }
>
>  void __init smp_cpus_done(unsigned int max_cpus)
> @@ -121,6 +128,7 @@ asmlinkage void __init smp_callin(void)
>          * a local TLB flush right now just in case.
>          */
>         local_flush_tlb_all();
> +       complete(&cpu_running);
>         /*
>          * Disable preemption before enabling interrupts, so we don't try to
>          * schedule a CPU that hasn't actually started yet.
> --
> 2.7.4
>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
