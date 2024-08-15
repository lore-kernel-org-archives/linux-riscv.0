Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF6CC3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 12:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mETzErM+25jvcz7tWXRicMs78/9t4v+3FqhQV3h8HjQ=; b=ewaaBY6zAtHR4aGmUU+rPrrm1Q
	IYjAoNWTnrTMr174Wb6QKoqHeMFuf+T6fpK2Bu04UnjzQo6Dw7SpHJBdXMoGsgSs3CgNxMcxlm2KU
	XmdLDKURpLiZn/AhK0NluN+ccfN9usn7b21BSMIZL7vSWyzWV7B/9BECKkgDJaHIG3s/aaR3gjt+l
	brs6ePaeAMCX3LVQz0JOsOUe4vlLWCX8cyY4W3B4C8yQeLwgveMNME+NETLQlC3HBRWA4FZn+xHgv
	HBwfvq/Eo4K+29uitNHZH3Vsybe4sOujOsBC4oejv0svsTNzt/AvL/XdF1vwGfDBaOe5o8vbuMPiK
	YQ4a+NLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seZDz-00000009qML-17tI;
	Thu, 15 Aug 2024 12:05:03 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seZDt-00000009qL2-49Cf
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 12:05:01 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 35DE13F322
	for <linux-riscv@lists.infradead.org>; Thu, 15 Aug 2024 12:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1723723493;
	bh=7ZBFQryseJrs4bYfDgEEs/HpYyXTP2lyjLbjfwARrdw=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Z3+MH6VvMQPmOWFzo4ZiLFBm6V6HZEo3W2hjlPkzfEr0vRsvK2ifsO9aCwmNS4ijK
	 DSHxPVgpJnwi/GfDP0IN0PKRunGDy61fgmV1tHTsCKT/PZxgYeyR2mrrwXNAlKbjEP
	 P8/xjpMMRTziIlPEYmwqRNuCwgfQh5CJNP9APZXW8k+UzGGtOsVTmIibqA0seamuUZ
	 TwLTR3R9TtEHz5NZOXYOnF64hwTcJn8TKLTIjUqKh7tZchFnOGFNeFJFTp/2uhP/nw
	 d9PBfTvpUjEApIYnt/BkdyWuL3TnpBrOPCaHml9YcEwi+XX+liBZ7QMUpwfgk5KJ95
	 xZ6Z1EWi33TZw==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-44fe92a34d2so10754381cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Aug 2024 05:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723723492; x=1724328292;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZBFQryseJrs4bYfDgEEs/HpYyXTP2lyjLbjfwARrdw=;
        b=CkGMytfXSKH4qVnLpeuGkNV1DJwK/WKNr63iixgTa6sXOP4H38EOLDCzhNZHCQoe/m
         mlABdwtLM04yEjLfljzoiTSf375wOULMVk6PvwyJXmH4gJu+EWvpdBJYigSz9VPIMLtu
         yQCvXehXm7vxC5h2oOGUb5syJJXOJEhKMusDGNfZ7rvjTGNRt0Njt7O1d4YX+0M526mw
         DKn9BPVg8oZEZdJfrMXVubpMgtGHpFqvX0bQ68c9YleSPIJa4o5Y2Y0YAAKGvZfR37m8
         eop1W9LLeh5rkWVPM6mmZQtJItvVVlp1WKf+ys2sMPBOps2UBG65g91/HZk7rWEsV9Js
         2XOw==
X-Forwarded-Encrypted: i=1; AJvYcCVs/k51+VKosjgHhOsR2en0bkLA3pHnla9u9W4yI0FX8kzeO2d8W3Fcn1Mj5pOevEl4nkgDZgMGkcktJDsYLwlesATUYHEXxz9YOjLkSq2M
X-Gm-Message-State: AOJu0YwbuCr749wS3xrjYd6gcIa1x0A0fkEmQJH/yhgRh2rjoPpEZUOS
	Kja5Pzh7COD/8uFp2wUvxtRv/YwCQj51CofJ4w9uu/AODdJ+T3rRgv1HF1S8aqyI/IUDA7GXmlA
	Pxf5Q0z07pZMC9QKqadW1HMC5Nv/sVBO7LvZ4mqEWnk30z+7zfR5cdOxCPVD4FSxl23jdZ7ZxOk
	Ga4zxN/r1Me+MYm+sk8uysIIW114Jpy7v3fYilBz+2puszQl/ePKgdchXJ
X-Received: by 2002:a05:622a:1f98:b0:44f:f06a:d6f5 with SMTP id d75a77b69052e-4535bb370dcmr69186591cf.36.1723723492108;
        Thu, 15 Aug 2024 05:04:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCrKqnX67yXWeSCk7DjtbJqRwQJAnNVtCSUPATh5Fgv3rkpF5FNHMjzutwyyeGqOQ3p5D88tr/8ufomoR/zBU=
X-Received: by 2002:a05:622a:1f98:b0:44f:f06a:d6f5 with SMTP id
 d75a77b69052e-4535bb370dcmr69186251cf.36.1723723491700; Thu, 15 Aug 2024
 05:04:51 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Aug 2024 05:04:51 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <87ttfmm2ns.ffs@tglx>
References: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
 <87jzgjnh9z.ffs@tglx> <CAJM55Z8WERQgs=QMyFGWvAHOpwcnOAudBqovaEuDudPSXCvL5Q@mail.gmail.com>
 <87ttfmm2ns.ffs@tglx>
Mime-Version: 1.0
Date: Thu, 15 Aug 2024 05:04:51 -0700
Message-ID: <CAJM55Z88H635Crc-Aeq+K0qcAk7NC89WVTAFdXDd2aQKQ7QmEg@mail.gmail.com>
Subject: Re: [PATCH v1 0/9] Fix Allwinner D1 boot regression
To: Thomas Gleixner <tglx@linutronix.de>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Anup Patel <apatel@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_050458_632589_EAD3D722 
X-CRM114-Status: GOOD (  14.84  )
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

Thomas Gleixner wrote:
> On Thu, Aug 15 2024 at 03:29, Emil Renner Berthing wrote:
> > Thomas Gleixner wrote:
> > Thanks for looking at this! Unfortunately the above patch isn't enough to fix
> > the issue:
> >
> > https://termbin.com/7sgc
> >
> > It still hangs after the "[    0.176451] cpuidle: using governor teo" message
> > until the watchdog reboots the systems.
>
> So what's puzzling is that there is a timer installed early on:
>
> [    0.000000] clocksource: riscv_clocksource: ....
>
> That same init function installs the per cpu riscv clockevent, so there
> should be a timer available.
>
> The deffered probing of the PLIC driver delays obviously the probing of
> the sun4i timer, but that should not matter when another timer is
> available. So the sun4i driver might be a red herring.
>
> Can you please add "ignore_loglevel initcall_debug" to the command line
> and provide the output of a booting and a failing kernel?

6.11-rc3 + these reverts:  https://termbin.com/q6wk
6.11-rc3 + Samuel's patch: https://termbin.com/7cgs

> And on the booting kernel please provide the output from:
>
> # cat /sys/devices/system/clockevents/clockevent0/current_device
> # cat /sys/devices/system/clockevents/broadcast/current_device
> # cat /sys/devices/system/clocksource/clocksource0/current_clocksource

On both a 6.8.6 kernel and 6.11-rc3 + reverts I get:

  # cat /sys/devices/system/clockevents/clockevent0/current_device
  sun4i_tick
  # cat /sys/devices/system/clockevents/broadcast/current_device
  riscv_timer_clockevent
  # cat /sys/devices/system/clocksource/clocksource0/current_clocksource
  riscv_clocksource

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
