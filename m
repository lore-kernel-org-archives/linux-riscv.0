Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB38C388F7
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 02:03:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48E3620719
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 02:03:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EiyFKKhA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="OifMrK+x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48E3620719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=v5gIlDZk2EO8Hcezhy9mFeS3vgvF24d5Mtk3KgMCzAo=; b=EiyFKKhAu0B9Y8JKsOxRh9yOi
	N+V6knpdKR+UgQ3dCAk41YnUoHuvEjvp5AUxAQFA4SKpY6LtNrBkh+SSAoB9s42jyUaMXgDZ/9R1+
	tt3uOdFX6Vl58o51E6CBuFMQzHkjnQUc4tMqyM3fSl9Itv1QXBlycno0w32hliXpbjzInjW+wAMTz
	QTodYZK/c2PSvDeiFdtSfoSYjAswAyb42FfGP5zdvf0MFev2gGDAYuipFmnsJM5PTrP1YftkCqlfU
	MfQfOcBmUaHm2tAixxmzBxlO9xuBtCwKEC0o1P3hkUb2wQvFbZrilAKz31WYDSofWQpwbIfwUOC3v
	or3iOKRCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kar5j-0000b5-6H; Fri, 06 Nov 2020 02:03:03 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kar5g-0000Zv-Oz
 for linux-riscv@lists.infradead.org; Fri, 06 Nov 2020 02:03:01 +0000
Received: by mail-pg1-x544.google.com with SMTP id h6so2736671pgk.4
 for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2020 18:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=MfUR8zFkzj3kr4PPBmXznA83GIqjmqrQi8dR4mnY5LM=;
 b=OifMrK+xYjA8lLgOUadiWJP+wSmcvuyLPJy8oZM5a4NU04wONUPxxyyTv0muleVrpf
 pKcbl7OS+5OBXTUQ5QZuvqqwhB/dix35NP+i273CjetfCHbFbdiq5r7cx47LwHz75s4M
 3sxaBTtvg0MYq/ttNf3mI9L6qr+lst9TdEAJ1rChG5EmJSI89BoqB0XyvQ8/N5KfYrJe
 r4feXgllxVNASUUFjmRMjgT8j6IZKT9eSEesWG/x9A8z3F2FdVj9PvwaBR33Vh1YVeFN
 0CDTmgTxUZpq5+dmcr69uz2gR3O5V1UDu39p3T9twUe7FUxW3DlZ1evqVwSvx15ZAws4
 ShMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=MfUR8zFkzj3kr4PPBmXznA83GIqjmqrQi8dR4mnY5LM=;
 b=LqATgFGZS/+CohwMwTB6hYqaAK+nj/HHb88w/JFy2QbpMhl7Ooy9XlPMESLjrl8gEV
 VufFTnum7KyP7WBFCq/x8vYdDveXQsBNuDD14kvhoFSSOtzTX7hW+YynKAk5NgSS6dtK
 uEUjxiNn8hfSsi71lviCUCx2ss1Jz0OAT7S/g4tT2sH/S/BwiKHYmglaaZ29E0rZwHS5
 BYSfbRyw2NCV+U09wKP7ANrHAZYfjR8bSs01bd3CLdreSCcKeeZzKe9mORSWKyA55Ke6
 owKN56tbJ1XNGkxZY6XA27ReWUlAy2CMPSk2vjZ+NVKFuS551WjKDBD/FIJ/c6rLljPD
 xjlA==
X-Gm-Message-State: AOAM532gv0Vh52jOGbqhmT+NABeQy09HkeyfdXVVaBkis6QwnDKyC6pp
 bADFqYvGpanEBFciK1FD70ynHA==
X-Google-Smtp-Source: ABdhPJxYtyDZKGpxHAIXw60/WyXXonc+jGAUmrNQl1hZQ7jn6G63WSJpYGmmn54EdIUI/L3TW85EsA==
X-Received: by 2002:a17:90a:d104:: with SMTP id
 l4mr5261081pju.194.1604628178688; 
 Thu, 05 Nov 2020 18:02:58 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id i10sm3467604pjz.44.2020.11.05.18.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 18:02:58 -0800 (PST)
Date: Thu, 05 Nov 2020 18:02:58 -0800 (PST)
X-Google-Original-Date: Thu, 05 Nov 2020 18:02:56 PST (-0800)
Subject: Re: [RFC PATCH] irqchip/sifive-plic: Fix getting wrong chip_data when
 interrupt is hierarchy
In-Reply-To: <87y2jl81ft.fsf@nanos.tec.linutronix.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tglx@linutronix.de
Message-ID: <mhng-8b35a163-6996-484c-a9e9-09662614f1b1@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_210300_867170_36102BD1 
X-CRM114-Status: GOOD (  15.09  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: jason@lakedaemon.net, geert+renesas@glider.be,
 Marc Zyngier <maz@kernel.org>, anup@brainfault.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 greentime.hu@sifive.com, linux-riscv@lists.infradead.org, uli+renesas@fpond.eu
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 01 Nov 2020 08:52:06 PST (-0800), tglx@linutronix.de wrote:
> On Sun, Nov 01 2020 at 12:10, Marc Zyngier wrote:
>
>> On Thu, 29 Oct 2020 10:37:38 +0800, Greentime Hu wrote:
>>> This oops is caused by a wrong chip_data and it is because plic_irq_unmask
>>> uses irq_get_chip_data(irq_data->irq) to get the chip_data. However it may
>>> get another irq_data with the same irq_data->irq if it is hierarchy.
>>>
>>> In this case, it will get irq_data of sifive_gpio_irqchip instead of
>>> plic_chip so that it will get a wrong chip_data and then the wrong lmask
>>> of it to cause this oops.
>>>
>>> [...]
>>
>> Applied to irq/irqchip-next, thanks!
>
> That should go into urgent, the offending commit is in Linus tree already

I agree.  I'm assuming that's for Marc, but LMK if you guys want me to take it.

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
