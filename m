Return-Path: <SRS0=uiah=DN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E96EBC41604
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2020 18:45:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B8A520760
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2020 18:45:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SQce8o37"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B8A520760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fNBBAX8lDeqKvumGmAzcy8o50zDz6Vt5voHgx1O1aZs=; b=SQce8o37nx2dzuaTJr93kG6xv
	RsG8sfpY16v55MOOmjn87yMm57LkkXTUOshN/o3P1ekdjv5Wv37jv6VUxPlwZMZC72em5OuXPiEZO
	tNdjcyrtk37ZgibjvBI1I1c00opS0ByfrFRNGzwI3F2psMZJvdtWTdxX7FCbITzLGJ+MUf4hEhyCz
	Kp+X/lKRve3GnKzPRVcNAmfLCRGOjWR7h15c9byG9y0U0wQ69Rx490siUSrgkeMIXxLbjDe7/Ne37
	vHuY9GsdUhLqjgKVBndb4D8ie+Obas5yaRlVzeKZC8/xSqapB8oMBdM0BC4c4ko7Y6LUydTCoab9w
	iovfi36ZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPrxX-0005nq-MU; Tue, 06 Oct 2020 18:45:11 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPrxV-0005n9-7f
 for linux-riscv@lists.infradead.org; Tue, 06 Oct 2020 18:45:09 +0000
Received: by mail-oi1-f196.google.com with SMTP id 26so13681011ois.5
 for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2020 11:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Gx2hEzPdtZzxVHpX94NR3xMuo2CpHfX+aniPg7cGd7E=;
 b=SbtZPxLkHtHxWngXoQO7uWo6Ck+KGbBlxYaA8a3pfciqmiRHrpnaPJCQQrtFhiMidJ
 9xymMJgj2D9EuF/g66UVJJC/wl2hbUfIdUlMya8lA1u7l0pmwk+Xw6nMFmbvTr50VGBM
 YLPGG2SlVol+JyO5iDY7fPCzT+WZP2sgWo505oQBu1uPprgfxL+2JEtGK4WY5fuRn+mi
 7k7C1IUKN5p1YoHWHxjCVUirgVseZx9UrW4GA9kpa7Ut7aLaIUujwEF2SW4xXkmTxdX8
 9y359e1RiyKfv0GGg5O2//BKOgB6GhPSCdW6+LhBxBsdLt4bo2cNisA8u2cBgOSC2B56
 1pAA==
X-Gm-Message-State: AOAM531l9BD3eYZjWFoTSyywBWmbzwzTjQzQp3f/Hz4nhnVONsjcrdab
 jN57bNnGNQWsFyxTw8hMSw==
X-Google-Smtp-Source: ABdhPJzABpX06X77NC8/qtvdmovZtjI3oABOZsl06LFgqXj16pDUpDxTrxelm5/7+/R+Mqi+oZGlJQ==
X-Received: by 2002:aca:d946:: with SMTP id q67mr3561924oig.27.1602009908148; 
 Tue, 06 Oct 2020 11:45:08 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s124sm1494222oig.6.2020.10.06.11.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 11:45:07 -0700 (PDT)
Received: (nullmailer pid 2614391 invoked by uid 1000);
 Tue, 06 Oct 2020 18:45:06 -0000
Date: Tue, 6 Oct 2020 13:45:06 -0500
From: Rob Herring <robh@kernel.org>
To: Sagar Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: riscv: convert pwm bindings to
 json-schema
Message-ID: <20201006184506.GA2613769@bogus>
References: <1601393531-2402-1-git-send-email-sagar.kadam@sifive.com>
 <1601393531-2402-4-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1601393531-2402-4-git-send-email-sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_144509_345026_343E74A8 
X-CRM114-Status: UNSURE (   9.73  )
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
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 aou@eecs.berkeley.edu, jason@lakedaemon.net, linux-pwm@vger.kernel.org,
 sboyd@kernel.org, maz@kernel.org, mturquette@baylibre.com,
 u.kleine-koenig@pengutronix.de, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, yash.shah@sifive.com, thierry.reding@gmail.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, tglx@linutronix.de,
 lee.jones@linaro.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 29 Sep 2020 21:02:11 +0530, Sagar Kadam wrote:
> Convert device tree bindings for SiFive's PWM controller to YAML
> format.
> 
> Signed-off-by: Sagar Kadam <sagar.kadam@sifive.com>
> ---
>  .../devicetree/bindings/pwm/pwm-sifive.txt         | 33 -----------
>  .../devicetree/bindings/pwm/pwm-sifive.yaml        | 69 ++++++++++++++++++++++
>  2 files changed, 69 insertions(+), 33 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt
>  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
> 

Applied, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
