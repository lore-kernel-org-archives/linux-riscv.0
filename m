Return-Path: <SRS0=dvb3=PQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE517C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 12:00:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 794F7206B7
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 12:00:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Osq11q8I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="f5IldSnJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 794F7206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4BaC2Bl2+dU5rxk8nVzFxk8NxELbWJml5JeZ5D8d9nQ=; b=Osq11q8IgzeF4D
	yd2Af6PeN2HAJ4DC3oKt771ZxNNjtIQ2VRZLil35egARGKcOPYxI9Nd49H+RrhPl3JONsceaIpR23
	NXF7Q4xHek4kZZTsxl9VBUc0xPPRA7lY+L6x6tviPhPQ8Fq5nQinDHhiR/ViRlv1AvHbKS8UP7IPW
	+FMBXZLZTf6aTTgD35H7YDFS7RECaOL8vqLYkzaNl2IzvNmfK8K+s1uIm9DMXNjAR1wLnk1aQiKru
	awYqJdqSNEb+2mmvv3XA5m67PACFeB66IKiFI3y3KSXM94rF+9UI5GxpinTIax/98ot265wce3MwY
	cICPaw66EIK7PrxXYuZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggq37-0003N4-5r; Tue, 08 Jan 2019 12:00:01 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggq33-0003MD-Rx
 for linux-riscv@lists.infradead.org; Tue, 08 Jan 2019 11:59:59 +0000
Received: by mail-wr1-x444.google.com with SMTP id z5so3735002wrt.11
 for <linux-riscv@lists.infradead.org>; Tue, 08 Jan 2019 03:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B6+Mdwry/rSeNTTRL+5i0V1ZgR5fjtkD/lW5yWIBnyo=;
 b=f5IldSnJurHNa6rFqFFW58ThEuVg2vlbYLSEegNPjHWLMeYU2rcjq+arEMlM8Y4HOP
 L4bYcXrP3XebpSyjj7lft1Z3wMXi4JJtk9UrqPzgyNRPTuPHkov8+4uyqDsTjBUsKunm
 dIYdmV/z1k0bSsqLu/MKMvwO6HtWX5dDfAEd1f8kgxptFve2liCSRvZTV7rRat1GyTMz
 K/UkgyJIUAl/aENh8tDqiIjp4OeBQPghCumvDwrQzkXmd/j9DRRSKDIXcczRs6FbTKwY
 q8iqhELiv4DboqPVxhh3GnKuWdDx/F0VKPpritk2ZPvyx/zZ0F7qviWIbxbTOkB0c9vs
 bzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B6+Mdwry/rSeNTTRL+5i0V1ZgR5fjtkD/lW5yWIBnyo=;
 b=XdVK+9CHo3d9FnCnyESHNGX0H7iLL4wxSoOmxDRpa7Sx2KC00Jzs+DS0pXm9BS7uWz
 3ogbYy55tNThM9c/qBPsT/vaLbFVT9A4HkB5PHZa6i8zE01Yay8++9iiNW7wD2m/65H4
 Mf7oFuxy9soqdzHe43CL4izJ9ZUL1GxANLNIIlSt6/p23KDj87pLCmTJl/0VKBS4WNFy
 u7OdgY4VChZxG5JS33sMFOTA/FWMnU8T87ryTI9JIUMo3h9zWN100QMn8m99ioJ2idGo
 33a6fOCX1aieTmu6NYhda4WX7k22aqI2OigH/hVMl3JSxFmGt8PSoSu75bdZESgPGlL5
 7vQQ==
X-Gm-Message-State: AJcUukfU1WQ6jdNab/76/iosvQvYIIQDrQg8cjZmfH9Sq7Eol0ISxG/U
 AdILkc6G+GHeeWIxK1Rmb0Y/JQweNhMuupU7QOPK7g==
X-Google-Smtp-Source: ALg8bN4BkLPPVyO6mW0KyeS9UjJb7zJa2j7y4dwv2ao+tTtg2sFvGiYI6kgPZ+dsNLqgucK3IULizXWwMNBdy+29tW8=
X-Received: by 2002:adf:91a3:: with SMTP id 32mr1107409wri.99.1546948794020;
 Tue, 08 Jan 2019 03:59:54 -0800 (PST)
MIME-Version: 1.0
References: <1546940318-9752-1-git-send-email-atish.patra@wdc.com>
 <1546940318-9752-8-git-send-email-atish.patra@wdc.com>
In-Reply-To: <1546940318-9752-8-git-send-email-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 8 Jan 2019 17:29:43 +0530
Message-ID: <CAAhSdy17H_XpDea9bowUoinVmb17p8+ZAzZ7cyFuDfFDJ-LwaA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] RISC-V: Check and continue in case of an invalid
 cpuid.
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_035957_908997_E426A321 
X-CRM114-Status: GOOD (  13.50  )
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
Cc: =?UTF-8?Q?Patrick_St=C3=A4hlin?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Alan Kao <alankao@andestech.com>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Andreas Schwab <schwab@suse.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Michael Clark <michaeljclark@mac.com>, Marc Zyngier <marc.zyngier@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, Zong Li <zongbox@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Prefer, commit prefix "irqchip/irq-sifive-plic:" instead of "RISC-V:"

On Tue, Jan 8, 2019 at 3:08 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> riscv_hartid_to_cpuid can return invalid cpuid for a hart
> that is present in DT but was never brought up.
>
> Print the appropriate warning message and continue.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 5 +++++
>  1 file changed, 5 insertions(+)
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

Otherwise, looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
