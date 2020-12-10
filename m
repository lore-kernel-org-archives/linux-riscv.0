Return-Path: <SRS0=mXjn=FO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 837ECC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 03:57:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DE2723C43
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 03:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DE2723C43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4aRHQ/alG3mrzcq4FKXUkc2tWe1sicqSsOpGj4/qmlc=; b=i2rmapm5ikrF92cASOohrl7S0
	dQAq5SSFq/i+Iwqk5A+WDafumVqSiYoNptbsJUgGJA8ITRXjeHj6dlFF+qwYGrhMh2nydaPvyR+Ju
	7SF12CUmJUNISZCy8ZKwx5JtVl36MOsJ0fhertDrgdU2Ll1Wf2+9AoyTTMrfiioD1UaqFctWBbQnf
	i4qCVFnykd0UNLJXWE0j3FW/+TNqJbtLaI/aY91dsM8e7ttI95sgserxV/PH4X7qaxcrDdvw8U/8a
	oj1Daiy2eVboytUmLjTxsvtYCOEH14NF7hMfANPMxGxgtHqryJHBkZcM+J1lXTg4jsX95cl01Whpi
	TgOuV7BOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knD5H-0007ew-Q9; Thu, 10 Dec 2020 03:57:39 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knD5C-0007cq-On
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 03:57:37 +0000
Received: by mail-oi1-f195.google.com with SMTP id q25so4273562oij.10
 for <linux-riscv@lists.infradead.org>; Wed, 09 Dec 2020 19:57:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vwi7EsUY4QX9MoPeQj2F3XyThczy9Eoa3ygKqHwraM8=;
 b=fzSrtvDXu05XIr+nYQ9wW3Gjdr0w890QUOjfiM8g0jwyANhyGR3UerlDFLkgln70T7
 awxGKiogjmh1PGTQmroSF0nIZtAFw0keHx7BTfeVplRNCyocBpy2ESV+Gm0xN54xvEqG
 u99uc95Dg2zRzwVcVYIngHl99bE0VxAfWhDzLeEDPjYBCERXKs2hu+2mi3/b1c8UX3zT
 tLddxbxz/i72379R286gFZJWOsmkTkLOGaK6xy3jKOshhFgRDDJJfN+KlIQCxvkc3XgQ
 d+NaXQc74HxqjlV6xDcvPYhP1u+vxxo7RhQ7HND2uAIDssoAGrN0Ryy0qOrM2cjWZwPS
 ia9Q==
X-Gm-Message-State: AOAM530DTVjyY547ogQjXlbBPg/ASMyfNcQZWDK5yR5I1fZxH3QgPefN
 bTX/pBl+H81l+742UhUdyQ==
X-Google-Smtp-Source: ABdhPJxbSXwk6hsl3+9BW2YHSj4lcS2keAbSmvQEVrJIpw4Z8Up+ovo6oO7C665COkov1yF+JyIGug==
X-Received: by 2002:aca:f3c6:: with SMTP id r189mr4189959oih.83.1607572654025; 
 Wed, 09 Dec 2020 19:57:34 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q3sm839505ota.53.2020.12.09.19.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 19:57:33 -0800 (PST)
Received: (nullmailer pid 1635431 invoked by uid 1000);
 Thu, 10 Dec 2020 03:57:31 -0000
Date: Wed, 9 Dec 2020 21:57:31 -0600
From: Rob Herring <robh@kernel.org>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v2 5/9] dt-bindings: gpio: Update DT binding docs to
 support SiFive FU740 SoC
Message-ID: <20201210035731.GA1635391@robh.at.kernel.org>
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
 <1607403341-57214-6-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607403341-57214-6-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_225734_951201_A5268E49 
X-CRM114-Status: UNSURE (   9.15  )
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
Cc: linux-pwm@vger.kernel.org, peter@korsgaard.com, aou@eecs.berkeley.edu,
 andrew@lunn.ch, gregkh@linuxfoundation.org, broonie@kernel.org,
 paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-spi@vger.kernel.org, bgolaszewski@baylibre.com,
 devicetree@vger.kernel.org, thierry.reding@gmail.com, palmer@dabbelt.com,
 linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
 u.kleine-koenig@pengutronix.de, linux-riscv@lists.infradead.org,
 lee.jones@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 08 Dec 2020 10:25:37 +0530, Yash Shah wrote:
> Add new compatible strings to the DT binding documents to support SiFive
> FU740-C000.
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  Documentation/devicetree/bindings/gpio/sifive,gpio.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
