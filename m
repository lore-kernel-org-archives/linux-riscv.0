Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49793ECAAA2
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Aug 2022 23:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=qHsChv8wbRyyjSrR5JzMaRTcki4sdnlObLBy8sk7WCg=; b=hNgvRQC2/oS7obzXSEe537JXhD
	4zdOMsVfa3Sm//hq84oELIEoAQ10m8ew2JJOQRPHIwTgUdNp3FnVfq0YW89o84FOzWA/KbcIkclni
	986dgSPfzfaASX4eKVIe5JuAHF6TZ/3t4lz+sBjbktusRdnM9V7bcTzdqjPj6ri1+rkBoF2EklE+I
	+u0EGncEZ0sj9p0TpLhLU4Zaq0W83j9s6skS4qxbrQN2b1xD0zpXm+r5V+rtURvHpQexq9Z9dnRHS
	jWv3KUgUxjgFP5dg/643EzeBxUa+HUtB8k5d2608bK5M8WOSr/t2Rsavu5JkwUxd+q9xO/UICtLZu
	QIFeqoNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRMMI-004Bxj-HI; Thu, 25 Aug 2022 23:33:58 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRMME-004Bv6-IJ
	for linux-riscv@lists.infradead.org; Thu, 25 Aug 2022 23:33:56 +0000
Received: by mail-pl1-x62d.google.com with SMTP id g8so127227plq.11
        for <linux-riscv@lists.infradead.org>; Thu, 25 Aug 2022 16:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=gD00xKTMu9pUUKx0DjES0MX650cqDlqhZMM3ktRyv+I=;
        b=yiiI2/SKiWFiOe9wBEXZ5mLGxl03PFFtuUiaThMSnnhb7TqcqzSZgbIJhARWoFpuPC
         uel9w2Z8TmqxYvt7GMMh8800NdWlq/YOJN6rpG3P4/Dtb3vQl4hDuJvWZkk52gcZCCsf
         UroPu4AhHB52gswaOqJbpvpzwleYCVvnWU6UWUQrS6HYXj5IEH0jIJ1vM/ieDUrlZh+R
         emV7Q6WwVsdJQwy4bFV3lKSPRdCQ6hbaSSuSxQuY4F+9uvLD9fja39WGrxp4pJvKuiVk
         aG5IoY06cgm6jcQwhRTL+I2tvfuNWsqhVl8bPbrBxSSrFi+QrLRrnbk/FbOXO+Rx4xnX
         EbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=gD00xKTMu9pUUKx0DjES0MX650cqDlqhZMM3ktRyv+I=;
        b=s2EJl0XklqZbyBcztPvmB92pW7avC59mWNwJ238c0zLddv+sSdwLT/DMdZ8d6mGtbb
         vShiQZbYoHVlUp3QTXb/oueB7iW0m1x7wf620ZvX8T8KfCncXciGC5dRTn824sIQYDwf
         LshKMLL+DiQL5OhqjDUaiwhd8xlV7Z3ILG/oU+tOfHJQdwSHqpvFG/NiHt1K8U2lXz7w
         SNAXVuC/DcneslfasGL8dZrnFK6ncan7OWA+yfqox5OEEBF906tXzqxQdElbE+w1YiU2
         eCIvngcRpLdZ14TTCe99WvaGTjAAs1Xq7xU/vMEVz2MtY91HlUSW/WHKDLJG73cNk8Ny
         N4/A==
X-Gm-Message-State: ACgBeo1Yy+gDLVrwfiaiCsX9t0q1/y1k9OG/jY8OYI9+yjPipsORHdiZ
	vX/5Rq5GO8Y5BR6VVw9HoR3WDdcVsbv+zA==
X-Google-Smtp-Source: AA6agR7y7crU3XAktl8ezNLTMCi6k5jhw7mM41d71GCEf1q79k8wCyRM25VG9mL5/1kicj8TTpaxxQ==
X-Received: by 2002:a17:903:40d2:b0:172:9a0b:f34a with SMTP id t18-20020a17090340d200b001729a0bf34amr1225526pld.105.1661470431896;
        Thu, 25 Aug 2022 16:33:51 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id b14-20020aa78ece000000b0052d98fbf8f3sm206224pfr.56.2022.08.25.16.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 16:33:51 -0700 (PDT)
Date: Thu, 25 Aug 2022 16:33:51 -0700 (PDT)
X-Google-Original-Date: Thu, 25 Aug 2022 16:33:48 PDT (-0700)
Subject: Re: [GIT PULL] Microchip RISC-V devicetree fixes for 6.0-rc3
In-Reply-To: <c6b6cc45-f758-908d-9d27-4dbad29f50e1@microchip.com>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor.Dooley@microchip.com
Message-ID: <mhng-c74292db-a17f-4fdc-90dc-3ed54b18545f@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_163354_843301_6CD1423B 
X-CRM114-Status: GOOD (  22.94  )
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

On Thu, 25 Aug 2022 11:17:45 PDT (-0700), Conor.Dooley@microchip.com wrote:
> Hey Palmer,
> 
> Couple fixes here for -rc3.. Notably the patch from Heinrich as it
> stops the console being /flooded/ by error messages from the l2
> cache controller's interrupt handler.
> 
> Unfortunately, that fix brought with it another dtbs_check warning
> for which I have submitted patches:
> 
> https://lore.kernel.org/linux-riscv/20220825180417.1259360-1-mail@conchuod.ie
> 
> On track for zero warnings in v6.1 though, patches are applied for
> the others in the pci tree.
> 
> Thanks,
> Conor.
> 
> The following changes since commit 69dac8e431af26173ca0a1ebc87054e01c585bcc:
> 
>   Merge tag 'riscv-for-linus-5.20-mw2' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2022-08-12 18:39:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/dt-fixes-for-palmer-6.0-rc3
> 
> for you to fetch changes up to e4009c5fa77b4356aa37ce002e9f9952dfd7a615:
> 
>   riscv: dts: microchip: mpfs: remove pci axi address translation property (2022-08-23 22:15:55 +0100)
> 
> ----------------------------------------------------------------
> Microchip RISC-V devicetree fixes for 6.0-rc3
> 
> Two sets of fixes this time around:
> - A fix for the interrupt ordering of the l2-cache controller. If the
>   driver is enabled, it would spam the console /constantly/, rendering
>   the system useless.
> - General cleanup for some bogus properties in the dt, part of my quest
>   for zero dtbs_check warnings.
> 
> On that note, the interrupt ordering adds a dtbs_check warning - but I
> considered that fixing the potentially useless system was more of a
> priority.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> ----------------------------------------------------------------
> Conor Dooley (4):
>       riscv: dts: microchip: mpfs: fix incorrect pcie child node name
>       riscv: dts: microchip: mpfs: remove ti,fifo-depth property
>       riscv: dts: microchip: mpfs: remove bogus card-detect-delay
>       riscv: dts: microchip: mpfs: remove pci axi address translation property
> 
> Heinrich Schuchardt (1):
>       riscv: dts: microchip: correct L2 cache interrupts
> 
>  arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts | 3 ---
>  arch/riscv/boot/dts/microchip/mpfs-polarberry.dts | 3 ---
>  arch/riscv/boot/dts/microchip/mpfs.dtsi           | 5 ++---
>  3 files changed, 2 insertions(+), 9 deletions(-)

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
