Return-Path: <SRS0=uiah=DN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D062AC41604
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2020 18:44:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 623A120760
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2020 18:44:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gFjGNsFd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 623A120760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DWBqlRqwMPgqzpPMlJ6XseUo7U0Ge9vPVyUk7pZTz0o=; b=gFjGNsFde4tvVqpKUgcxJZMmZ
	FeF8Pix2YIBLiLLqQJw0TVsPd4AQIkW/2mqUY0AImkgjGvk+7SpuPd4b4bfR2KESaCNgYuHuKYaYv
	uB/9ipstodIIeyqhHhW/8gmyqDAJIki5+M4b+4xaOfNA3UaLBF7YjuKEOTtM3YIelz/DEUGKmA951
	z3S20NLDFCI3hWyuF8LGp0UGI2TaXGgBdVkLAw0Z0jp+creJGOU4C6ChoTFlb67bkvqCFxlahGffF
	15ge46kBu0jCZvRX7/6kJBErwIt8voR/sp6BeSoZidrA4k2v+Vnav7ae9MFjMlncZz91rYvh8JYio
	osbxsWi5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPrwW-0005h1-1K; Tue, 06 Oct 2020 18:44:08 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPrwS-0005gK-Rc
 for linux-riscv@lists.infradead.org; Tue, 06 Oct 2020 18:44:05 +0000
Received: by mail-oi1-f195.google.com with SMTP id x69so13658577oia.8
 for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2020 11:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QPuBu1BxS0jmnEo7HpZE3PSY1Wh/IlpmREYij20Z0dU=;
 b=XuyLRlErdi2m/G4NCnQJFzG0/Dp6gkk025Ap53/kGoHTTQ0XeqWOtnHYoMNyKwmJyC
 1Av9UvtxzlLl1/iUTkc66q8eomLZSBngzZFaYcAwQ5t7WUCO/FzvdWLIDklY4Pni0G+N
 OmcP1DuxJKl0Xf9hC4vHdxSDx/lao2IrOmHb90zTC90Zdd8G9PuURkgvLgdokbYSXcXj
 LPAG6jvQYyOJwPC4Ny8eMt7Sy6S2HzdUDDlbZCO0f+cq8ljdUxOFgtOtcjiKhbgnWYFN
 3HPWAPPl7Bfsm/moJ19v2JXvfdoJdd+H9AOy0pLgqCJXJcX46xUffGlgA9hXm9s8Zm3t
 5g9g==
X-Gm-Message-State: AOAM530Ws9KtlJuDB1vqKuehyUexJLCxnW1KK+8Fhvo1VzwTJ/lvyG2r
 byl+2oI8CtRBQSQb6SfU3g==
X-Google-Smtp-Source: ABdhPJz6Th+dbt15TLclLFiiDoMAIpndrkDTFe1hRaVx5++j8iJOWfP0J8cvUjxibMsRWna3mkmf/A==
X-Received: by 2002:aca:1007:: with SMTP id 7mr3484570oiq.63.1602009842213;
 Tue, 06 Oct 2020 11:44:02 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i5sm1467898otj.19.2020.10.06.11.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 11:44:01 -0700 (PDT)
Received: (nullmailer pid 2612500 invoked by uid 1000);
 Tue, 06 Oct 2020 18:44:00 -0000
Date: Tue, 6 Oct 2020 13:44:00 -0500
From: Rob Herring <robh@kernel.org>
To: Sagar Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: riscv: convert plic bindings to
 json-schema
Message-ID: <20201006184400.GA2612444@bogus>
References: <1601393531-2402-1-git-send-email-sagar.kadam@sifive.com>
 <1601393531-2402-3-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1601393531-2402-3-git-send-email-sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_144404_906960_159F52ED 
X-CRM114-Status: UNSURE (   9.64  )
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, tglx@linutronix.de,
 jason@lakedaemon.net, linux-pwm@vger.kernel.org, sboyd@kernel.org,
 maz@kernel.org, mturquette@baylibre.com, u.kleine-koenig@pengutronix.de,
 linux-kernel@vger.kernel.org, yash.shah@sifive.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org, lee.jones@linaro.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 29 Sep 2020 21:02:10 +0530, Sagar Kadam wrote:
> Convert device tree bindings for SiFive's PLIC to YAML format
> 
> Signed-off-by: Sagar Kadam <sagar.kadam@sifive.com>
> ---
>  .../interrupt-controller/sifive,plic-1.0.0.txt     | 58 -------------
>  .../interrupt-controller/sifive,plic-1.0.0.yaml    | 97 ++++++++++++++++++++++
>  2 files changed, 97 insertions(+), 58 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> 

Applied, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
