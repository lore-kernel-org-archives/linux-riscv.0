Return-Path: <SRS0=7SDv=VY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B676C7618B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2019 08:16:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6FD4205C9
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2019 08:16:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RF0PUzFV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="gfW+j1g6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6FD4205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FoZ9FIeA3gHblIiC8jBMIiTXjdgC6aDWPgW8IQUDUgs=; b=RF0PUzFVXO+zMy
	N3etcRUvMLbXRJNIYnF6XdNi3Dz2kx/bXxms+ymy7RaoGvrXqITXCanee5QlSf65sZoWYyDeUROMT
	8XKAq9fUuI3AK2Zuxw4k70YS0rbC29DLe+6hKjLZEWFvqZm0ck/waGitigriM+A5F7EZg5rfczFba
	9kC3krbUNIAZ5MShEuL8/GWaqIvTkuHkzGtekWuenRUqiPclhjngQvCYHC5PvVzwdr2PJ+URgY3KS
	4Zc+6bIGNVlcxVNblRUTxINfMGZUoHIStS3/tKVnM4+/IDXGAUloZv570kAPSCIXxppI/6Vr/QTbH
	X/qit8CEc/EO2nFzRUwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrHsH-0001Rn-Tm; Sat, 27 Jul 2019 08:16:17 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrHsF-0001RW-S3
 for linux-riscv@lists.infradead.org; Sat, 27 Jul 2019 08:16:17 +0000
Received: by mail-io1-xd41.google.com with SMTP id m24so109681503ioo.2
 for <linux-riscv@lists.infradead.org>; Sat, 27 Jul 2019 01:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=GqXvr0YJl2rBiC4sDBh/Naqmgvh+22fz1v/WVxyKO8Q=;
 b=gfW+j1g6IacoC5Ik0W7a2UYx4s7aGeOHrCvJbQGmUPqYge3B6Sc1txqFo+8b5MMhm/
 O5lhaKX2aC0KVc/syCF5b/U8jT3a2uneniChY/9H64jh8CMYGFI43iUIlbaWMEL1O3AU
 Q4Wge+YRXbNKeKQJSkh6n7Qsg1bBGoYZdWG2x/ylDWGyQgoXyVPEGEJVceDLg+BzbMqn
 DOuiJ7bEhFbXyMqhRWNXckKLUoV8bS4AEeGkPXzEdlwQ1jJndhDQG3FiWtzmemBPqTwB
 9P0mT+nlpWdRGlakHqeFUDnroqX1Tk/V/vWE4pwxLqrLPZbpUR3qzxaec7kpir3sb7A1
 UcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=GqXvr0YJl2rBiC4sDBh/Naqmgvh+22fz1v/WVxyKO8Q=;
 b=mSPMXViWapARwmHmTBgXZRUf+DAwzp2+yjamLRpepnXMco18ex3ne86I8kDC14cohN
 9YyssVGddsp36X7BnQ7uv2dQ9pwxUmY6RHRMXCDbDzawhW6WP3xpJoGsVbwtU3GIfMo5
 GqLXZbXsINfa8mxeYiZu/U2Jf7yRAcbeM5OTK+YOtBsVJZXAaIKsvfTXei9gl6h72bLi
 3rbVC9vWYlllJMR3BKiDVDJ6l+1ZSoZgmOIkVQOELCByY9FDMKOny+5tpQiimP6GuXKn
 9G6YvFsr11T8jVFjrVC8VfTOGlwKhvQMW9GCqRrtFHuEztKOqs2t/Ew1Dmccv+l4YU4C
 ydNQ==
X-Gm-Message-State: APjAAAVyIsSmZRVoqrv15JDuaDrqNl3cn8fWXCQIvx8BF6jPhxPwervf
 LBpftDNx54I9bdoHEjN3q3zI9A==
X-Google-Smtp-Source: APXvYqwRBk0cI7n1B/EwEinyQeclw5edSgKcI3WQbSY4Fch27L/Mj0UphkvhCqCFfyw+IVbwdf9D4Q==
X-Received: by 2002:a5e:c241:: with SMTP id w1mr86156837iop.58.1564215374902; 
 Sat, 27 Jul 2019 01:16:14 -0700 (PDT)
Received: from localhost ([65.152.59.42])
 by smtp.gmail.com with ESMTPSA id y20sm45173594ion.77.2019.07.27.01.16.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 27 Jul 2019 01:16:14 -0700 (PDT)
Date: Sat, 27 Jul 2019 01:16:13 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH 3/4] RISC-V: Support case insensitive ISA string parsing.
In-Reply-To: <CAAhSdy0Eycc0ORSnh6LJeC_D_x9yLOkoc7OkPNuN6qOcZEGVWg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1907270108420.26998@viisi.sifive.com>
References: <20190726194638.8068-1-atish.patra@wdc.com>
 <20190726194638.8068-3-atish.patra@wdc.com>
 <alpine.DEB.2.21.9999.1907261346560.26670@viisi.sifive.com>
 <a8a6be2c-2dcb-fe58-2c32-e3baa357819c@wdc.com>
 <alpine.DEB.2.21.9999.1907261625220.26670@viisi.sifive.com>
 <MN2PR04MB6061790AFE4E0AAA838678028DC30@MN2PR04MB6061.namprd04.prod.outlook.com>
 <alpine.DEB.2.21.9999.1907270043190.26998@viisi.sifive.com>
 <CAAhSdy0Eycc0ORSnh6LJeC_D_x9yLOkoc7OkPNuN6qOcZEGVWg@mail.gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190727_011615_914360_17A55ED8 
X-CRM114-Status: UNSURE (   7.89  )
X-CRM114-Notice: Please train this message.
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
Cc: Anup Patel <Anup.Patel@wdc.com>, Alan Kao <alankao@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Johan Hovold <johan@kernel.org>, Atish Patra <Atish.Patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 27 Jul 2019, Anup Patel wrote:

> If your only objection is uppercase letter not agreeing with YMAL schema
> then why not fix the YMAL schema to have regex for RISC-V ISA string?

I don't agree with you that the specification compels software to accept 
arbitrary case combinations in the riscv,isa DT string.

> The YMAL schema should not enforce any artificial restriction which is
> theoretically allowed in the RISC-V spec.

Unless someone can come up with a compelling reason for why restricting 
the DT ISA strings to all lowercase letters and numbers is insufficient to 
express the full range of options in the spec, the additional complexity 
to add mixed-case parsing, both in this patch and in the other patches in 
this series, seems pointless.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
