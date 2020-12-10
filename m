Return-Path: <SRS0=mXjn=FO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B820EC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 03:59:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C93523BAC
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 03:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C93523BAC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/wnSr77N3jpMUm0+6YEtm4Z01/C/X6y5S83EZuluPhI=; b=fKrprKuxaGiLDCFEUekdUHCYO
	2zfRfTrgmfNH5KuDu6cPiDapPpzrT/WYvlrr+gXN6GDLp6nFctFerptyg1E9OjchYFGBcvBPj1Z3T
	yEjzn5oe3st4tfOmYGgjsC4bv6gf5/w2tqKqUlSFrQ4ZinRfRXSXiCtF2k1MG2BEAjbHGcV+lDlkl
	Jp6Tt01QfWAlvGdPcHH2taon+nkXjVv1NmehrUFrv5UZqXE8f8rJWyhB1OVh0VTznCTepiDbfXwcO
	8ngY5sGRMFvaouYxkM6byK3nGUOHRSkRuzMjw/CBEoQlIa954tDHJsJX60TI74IBXQAYHO7n3wb6T
	vQLUIChHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knD6z-00084q-8c; Thu, 10 Dec 2020 03:59:25 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knD6x-00084D-8n
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 03:59:24 +0000
Received: by mail-oi1-f195.google.com with SMTP id s2so4308524oij.2
 for <linux-riscv@lists.infradead.org>; Wed, 09 Dec 2020 19:59:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6oGGK+dOGnoINWzCvubHZwwfiFrKLTQRjMEQW/QxQb0=;
 b=nNaZLTDKuy5dId+6iR4vRGrdz45lbRf4ZK87pbeEssFhie7HiwypAsVquEnk1nh/Mf
 +YBG+Ysby4fzpXLl5u0VaWEs2AlkwOgVsDb2m4LhZtH/lAk2be1JqXQHNPTzU60m1bOo
 2gmHhRvvDxM3+vw80W6pN4x+PeBcxUEyN83v2bz71riyBnjY5vMDXm/DvAub9rJDexUc
 Hn0c6RgsENjpiROqpjV+SzaRynEqBscokgQea9wQRzNCYwtN5ihHy2HDa8WRJWPvlCDp
 UMhVlCqEsUN2Xn0nAPLmASyESDjIgToeL0lRzH7Vt10pK71Z+pSWm0jnCgnZBe3z4f9M
 h6SA==
X-Gm-Message-State: AOAM530EhjhdSjRm+VoR+mOGDrWfpLTRHC2gyzt/haqinQR8VQfApztH
 Bp2eeHls54M00W2xPHJdqg==
X-Google-Smtp-Source: ABdhPJzEJCziD7jzt8D07hIPtVj4iDG6Ls9LzxABH6iHQCPLAjSuLffty8DXLKn3cyFZUEmG/e2Tew==
X-Received: by 2002:aca:6044:: with SMTP id u65mr4205383oib.109.1607572762746; 
 Wed, 09 Dec 2020 19:59:22 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g12sm795862oos.8.2020.12.09.19.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 19:59:22 -0800 (PST)
Received: (nullmailer pid 1638029 invoked by uid 1000);
 Thu, 10 Dec 2020 03:59:20 -0000
Date: Wed, 9 Dec 2020 21:59:20 -0600
From: Rob Herring <robh@kernel.org>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v2 8/9] dt-bindings: riscv: Update YAML doc to support
 SiFive HiFive Unmatched board
Message-ID: <20201210035920.GA1637999@robh.at.kernel.org>
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
 <1607403341-57214-9-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607403341-57214-9-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_225923_363977_D7ACAFCC 
X-CRM114-Status: UNSURE (   9.30  )
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
Cc: devicetree@vger.kernel.org, peter@korsgaard.com, aou@eecs.berkeley.edu,
 robh+dt@kernel.org, bgolaszewski@baylibre.com, gregkh@linuxfoundation.org,
 broonie@kernel.org, u.kleine-koenig@pengutronix.de,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-spi@vger.kernel.org, andrew@lunn.ch, linux-gpio@vger.kernel.org,
 thierry.reding@gmail.com, palmer@dabbelt.com, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, lee.jones@linaro.org,
 linus.walleij@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 08 Dec 2020 10:25:40 +0530, Yash Shah wrote:
> Add new compatible strings to the YAML DT binding document to support
> SiFive's HiFive Unmatched board
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  Documentation/devicetree/bindings/riscv/sifive.yaml | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
