Return-Path: <SRS0=dvb3=PQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB5CC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 11:49:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A91D1206B7
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 11:49:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PNyY2JRl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="Sjr30I2e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A91D1206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J22C3+XX1TGBWwCr/geTYkDdN6BZ9txqj1dFmY6H1f4=; b=PNyY2JRlxP5ubw
	8FKdErK/Z5GOk7TtA5RX/LyEiuBCNPNLg45kWBDKGlq1Wddn+tNlp92m58S1rYJaJWRko+KLbtL2J
	nTzn/QG/eJvY7Ufl3RF6QxSXRyepf2BTKO/fMNE+EuWvkxgN5H83DQTPoStO03VqvSRpdAzobCyk+
	kIAhbTQYGDSPulpFuKoDVa9g2FCTFkX4dQcHdHAMQydvRHtpfQVQERoicuKmGDVL+HhAwHDYUSHVz
	S+zTRZRcHQmaHgi0qkmvrb1M19HFAgNGZ5t2MsMyIDSxQ9TIMJnS1UaVRy6ZO7GUowSffG3ehMMav
	9Ib4gfnaMfWa1ZmSYj8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggptB-0007aY-GR; Tue, 08 Jan 2019 11:49:45 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggpt8-0007a9-Iq
 for linux-riscv@lists.infradead.org; Tue, 08 Jan 2019 11:49:43 +0000
Received: by mail-wr1-x442.google.com with SMTP id t6so3696181wrr.12
 for <linux-riscv@lists.infradead.org>; Tue, 08 Jan 2019 03:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YU8sH6viOntqgZUUKSU5EN2OBCWmmABCsIsJ/nFFgT8=;
 b=Sjr30I2eXvkoganrTMZz1QEUTpkPkShpdPHN6iyZPeBFV/ENz4RKNh7HZtgIqE1zir
 STNU1kmJAU7+QjvqTGx8tAxPQtzxIYx4LoTCO7+V74ox+HJRDHtlI0gicNguMnuIm5RF
 3yb1We9woWYmnqT0flzKjyBTpCQm6IuxNusK037N+jJbwKiJYYjwUz1DJ8TedvsS9Z7K
 4I/AWYpfkIq3qEBKRhKJELhrL2ew0DhCT4oUKXhzZSQMqgEwmhws2i7WCa6UlkRQaKqh
 KZJibTWr5C1a6ZEFImm4j+zmYti3SHgJXhALEdIvP8VLoROTpIbm+KpRu5G9Pw2YebjH
 fd3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YU8sH6viOntqgZUUKSU5EN2OBCWmmABCsIsJ/nFFgT8=;
 b=Qo5k++Sd6N5M/klO1yrGCws/SYHLsWwZCjf6TH47l93idH554EQZDmD8SQqUa+7txJ
 YYM5whtBjAkmocDZCqxaOOFJUS22Mp9IwOinSnAt7yOE8MErqyP+JezjaSvNt5wg6ZXd
 BxrdVLVR1Wsk5NWl4apgQPQa92fjixEuQo4e31SNakhBaPG4HDmxFiaAMuGQ2r6C3AHA
 a0gdEZ/3yvsagaPDUce5KWKuHOjTbfBiZeC/9LpidtifEva8M31jzfpHiC2KOazXfhFe
 0DDMOR3HvAQRVKPoq3JfRio/cqN94KwkF7tmcKWBZNCWkJGCVwsgFJ9AUtXVCDB1vZSb
 WBGg==
X-Gm-Message-State: AJcUukdJl1OUWJrJwBh5zdCZUIoT+KZO+7T/aWGXev33VBNrW6DuWQTd
 5+fg1sZHoW2nQcJ2qVHeruCDsBfgPf1lEIcW76N0fQ==
X-Google-Smtp-Source: ALg8bN7lVCwuJVluZT27lSHsmMrkdDNnoaj2qJP0aC52MKFDFcbD/tENFyulDm+tPSx4ePn6GzXMegKGRiUQO8OZD/4=
X-Received: by 2002:adf:8506:: with SMTP id 6mr1282487wrh.128.1546948180695;
 Tue, 08 Jan 2019 03:49:40 -0800 (PST)
MIME-Version: 1.0
References: <1546940318-9752-1-git-send-email-atish.patra@wdc.com>
 <1546940318-9752-6-git-send-email-atish.patra@wdc.com>
In-Reply-To: <1546940318-9752-6-git-send-email-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 8 Jan 2019 17:19:29 +0530
Message-ID: <CAAhSdy2XfTvyg+OxNYWzcwtPLB=0VJMGovzYcFTQyS36H-ZDYg@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] RISC-V: Compare cpuid with NR_CPUS before mapping.
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_034942_625910_F81BDF53 
X-CRM114-Status: GOOD (  13.63  )
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

On Tue, Jan 8, 2019 at 3:08 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> We should never have a cpuid greater that NR_CPUS. Compare
> with NR_CPUS before creating the mapping between logical
> and physical CPU ids. This is also mandatory as NR_CPUS
> check is removed from riscv_of_processor_hartid.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/kernel/smpboot.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 32e14572..7954470b 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -69,6 +69,11 @@ void __init setup_smp(void)
>                         of_node_put(dn);
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
> --
> 2.7.4
>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
