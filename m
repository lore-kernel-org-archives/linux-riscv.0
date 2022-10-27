Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79626ECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 23:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=edYCh4rI+1nAbN1FyomJ1DSD4Z9Lp0gcXjWyW96U4rQ=; b=H0FSabMb3rv8ZXTkbxB39fQNeq
	Tc+KPPcu9R07RuLEKKUkddMLVEJ0AeFrTtUQnMsf+ckijv1zlMoH0OV+GwtMkLiIElJ+JPAP1Cccx
	WJrD2KKWlF5And+FEdwgIZllpQ6xpodJsdntlXR9AY7RluuAEPwsYaD+7Cgl4GqbACAlSAe+ZixrB
	bO0jzPLRAGc+374h7lVyVOpg7rhLSql6XwU4nTRGIcPw3CFxfgRnid1jjqw6l7GCtJE1jNGKVeEkn
	a6HNfQqH8qhoi55uFuTD7ICv2HxCpdw7KTJYmPK7Ig6nsUVc66inhBwo1I0rn0jrtThkrx4vWTbny
	5oiRY3MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooByH-00FAsr-EG; Thu, 27 Oct 2022 23:07:33 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooBy8-00FAno-Ol
	for linux-riscv@lists.infradead.org; Thu, 27 Oct 2022 23:07:29 +0000
Received: by mail-pg1-x532.google.com with SMTP id 78so3139448pgb.13
        for <linux-riscv@lists.infradead.org>; Thu, 27 Oct 2022 16:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7ZwQDjmVNpyM8eGvcKf07ueI+SDPbraRsgxG6I2tAA=;
        b=WisfFTtx21I3yqt1Nw+D22CSWrVOJmj7hFRDeeNpMuh+d9TYXw1VuJ49uIHY7FDFLf
         QwNjrKCjuMdoT0p+T6bSTq8jqPodRhe10wL6RwRkSS4M3+ewLLesWmMJnSd3teIhxL+N
         zDbAru2xMUit2cvozy+Ra1M8Srys3eY/J78hs7ltUjNshk31fVWeiNBctB4sD5s1A7xD
         D319ddMvV7NzwR0LxPDQR9gp7jBJQHiM+Hzb4odFWCvVOgn0tgYnv6o7UFMPVAEmwjcV
         6+9Cm28Nd3IeXH6kUDaNcHaKUdnt5WOV1rG7gig5Cdw2uZWmT28LRAIHHzz9fCgtXhbm
         bexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7ZwQDjmVNpyM8eGvcKf07ueI+SDPbraRsgxG6I2tAA=;
        b=WFjthNsOWgZwIyTJQJwhadQlti6q2t61aPQvdTbzo4yAAyP8zGIRC64adWZBex7sCo
         KQ6wHtd5Fx4QDCiEZ1WV+ioxKYdHP08bQ46PhImrs9mFaj0A9gMSul1YnvQXaZ3IrAFc
         czRHWJarrvEMfCJp8W/remGmDpsNbPNalLIy3ah7Rlx/H2XX+cuXo9n90rFmPy1daKFn
         5ZXZQy9Fk3kKLjA6u6Ii/Wo2mSt9XzXt8tEKZEbXPOGmXD+u6I3WzIgKANYmnkDKTyAq
         +0bNHcDNFUDccf+jXswkgfDQ4LN0euYiMGnlwd1j3FE99/KvzUrInNPrfjA7S64hNw6E
         Ui8w==
X-Gm-Message-State: ACrzQf0frIPN7Enwf0hGnfSOj4DhGrsgh5Knxf0I0coTbLvr7LW21U3E
	CFmJCaU8DcSMo7jCqhzjrfeAbw==
X-Google-Smtp-Source: AMsMyM4lCRpo1/qoPrU+4TKGZmkjoDHiZs2bxqR+mCtLWFWFfk6AdJihtpcbgbgxmAwz131aJaiFcw==
X-Received: by 2002:a05:6a00:2342:b0:56b:e64c:e065 with SMTP id j2-20020a056a00234200b0056be64ce065mr21562480pfj.32.1666912044311;
        Thu, 27 Oct 2022 16:07:24 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id f4-20020a62db04000000b00560cdb3784bsm1665664pfg.60.2022.10.27.16.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 16:07:23 -0700 (PDT)
Date: Thu, 27 Oct 2022 16:07:23 -0700 (PDT)
X-Google-Original-Date: Thu, 27 Oct 2022 15:45:24 PDT (-0700)
Subject: Re: [PATCH] Revert "clocksource/drivers/riscv: Events are stopped during CPU suspend"
In-Reply-To: <20221023185444.678573-1-conor@kernel.org>
CC: daniel.lezcano@linaro.org, tglx@linutronix.de,
  Conor Dooley <conor.dooley@microchip.com>, samuel@sholland.org, aou@eecs.berkeley.edu, atishp@atishpatra.org,
  dmitriy@oss-tech.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-57a8ff91-b9b1-4667-96be-3f8fed25dcc6@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_160724_880901_84530408 
X-CRM114-Status: GOOD (  23.64  )
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

On Sun, 23 Oct 2022 11:54:44 PDT (-0700), Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> This reverts commit 232ccac1bd9b5bfe73895f527c08623e7fa0752d.
> If an AXI read to the PCIe controller on PolarFire SoC times out, the
> system will stall, with an expected:
> 	 io scheduler mq-deadline registered
> 	 io scheduler kyber registered
> 	 microchip-pcie 2000000000.pcie: host bridge /soc/pcie@2000000000 ranges:
> 	 microchip-pcie 2000000000.pcie:      MEM 0x2008000000..0x2087ffffff -> 0x0008000000
> 	 microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
> 	 microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
> 	 microchip-pcie 2000000000.pcie: axi read request error
> 	 microchip-pcie 2000000000.pcie: axi read timeout
> 	 microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
> 	 microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
> 	 microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
> 	 microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
> 	 microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
> 	 microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
> 	 Freeing initrd memory: 7336K
> 	 mc_event_handler: 667402 callbacks suppressed
> 	 microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
> 	 microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
> 	 microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
> 	 microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
> 	 microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
> 	 microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
> 	 microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
> 	 microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
> 	 microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
> 	 microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
> 	 mc_event_handler: 666588 callbacks suppressed
> <truncated>
> 	microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
> 	mc_event_handler: 666748 callbacks suppressed
> 	microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
> 	microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
> 	microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
> 	microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
> 	microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
> 	microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
> 	microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
> 	microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
> 	microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
> 	microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
> 	rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> 	rcu: 	0-...0: (1 GPs behind) idle=19f/1/0x4000000000000002 softirq=34/36 fqs=2626
> 		(detected by 1, t=5256 jiffies, g=-1151, q=1143 ncpus=4)
> 	Task dump for CPU 0:
> 	task:swapper/0       state:R  running task     stack:    0 pid:    1 ppid:     0 flags:0x00000008
> 	Call Trace:
> 	mc_event_handler: 666648 callbacks suppressed
>
>  With this patch applied, the system just locks up without RCU stalling:
> 	io scheduler mq-deadline registered
> 	io scheduler kyber registered
> 	microchip-pcie 2000000000.pcie: host bridge /soc/pcie@2000000000 ranges:
> 	microchip-pcie 2000000000.pcie:      MEM 0x2008000000..0x2087ffffff -> 0x0008000000
> 	microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
> 	microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
> 	microchip-pcie 2000000000.pcie: axi read request error
> 	microchip-pcie 2000000000.pcie: axi read timeout
> 	microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
> 	microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
> 	microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
> 	microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
> 	microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
> 	microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
> 	Freeing initrd memory: 7332K
>
> Link: https://lore.kernel.org/linux-riscv/YzYTNQRxLr7Q9JR0@spud/
> Fixes: 232ccac1bd9b ("clocksource/drivers/riscv: Events are stopped during CPU suspend")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> I don't really want to post a revert, but it's been nearly a month since
> I posted about my issue initially & 2 weeks without a reply to Palmer's
> comments.
> CC: samuel@sholland.org
> CC: aou@eecs.berkeley.edu
> CC: atishp@atishpatra.org
> CC: daniel.lezcano@linaro.org
> CC: dmitriy@oss-tech.org
> CC: linux-kernel@vger.kernel.org
> CC: linux-riscv@lists.infradead.org
> CC: palmer@dabbelt.com
> CC: paul.walmsley@sifive.com
> CC: tglx@linutronix.de
> ---
>  drivers/clocksource/timer-riscv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index 969a552da8d2..a0d66fabf073 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -51,7 +51,7 @@ static int riscv_clock_next_event(unsigned long delta,
>  static unsigned int riscv_clock_event_irq;
>  static DEFINE_PER_CPU(struct clock_event_device, riscv_clock_event) = {
>  	.name			= "riscv_timer_clockevent",
> -	.features		= CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_C3STOP,
> +	.features		= CLOCK_EVT_FEAT_ONESHOT,
>  	.rating			= 100,
>  	.set_next_event		= riscv_clock_next_event,
>  };

There's some discussion on that linked patch and we don't really have a 
fix yet, but IMO we're better off reverting this as it breaks the common 
case and it's not clear this is even a sane way to fix the bug.

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
