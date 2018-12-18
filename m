Return-Path: <SRS0=2lO5=O3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2838CC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Dec 2018 17:20:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC9CE218A3
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Dec 2018 17:20:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EeqOInWh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC9CE218A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JRyDRU8HkM5qXH/HfFviVBf8hbJVnLGjkE4iatfYsZI=; b=EeqOInWh3QccLa
	lR8f/EkJxgK6qBSU2TY6BIUXK0fw6fvwT7jH2bcmcZMk2MYBQ6dEAqO8tKPSr4HJqoJmYzmJNuTS8
	D9o32dbF0FPLQOEpyvZV2Vk3Ekh2tPBsJCqi592W5F8XwYs4dMfmxu8FlmnBb8W4g5+t3VbRxpPHM
	QyY2OdWgXZAI8xhHouB41wOlwK6ZATu+MK0fp++a63gJQ2uje63CMaBzQmA6EjFzqihP/BXTGEECZ
	kdWxkqtJao0eT/cw2/zjK49HLv3bcDbKnwCSE5+oEaxpwx8d0nTLnW2EYJ4imTmp06YwovVP0mpGk
	wPP1zE0ScH6xo4NzY7HA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZJ31-0002rl-UI; Tue, 18 Dec 2018 17:20:47 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZJ2y-0002li-4K
 for linux-riscv@lists.infradead.org; Tue, 18 Dec 2018 17:20:45 +0000
Received: by mail-oi1-f193.google.com with SMTP id c206so2606401oib.0
 for <linux-riscv@lists.infradead.org>; Tue, 18 Dec 2018 09:20:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ay0IswX+sRWNKX5ziAV2hvU/TN5PQDEK6pFJnClTI3Q=;
 b=Q2xK39J42lv2bwhUVVhKNJkWHezxlrDfb54mJ6HHhSRjPRGpRMX6KxbfQ0Efwmz0QJ
 KFx/2oHZWT9qQXvHTStPLgQk8C8YnKMcILHe0JuDbob11Ykdc/N5rECr8TK63aqaDUN/
 jm/QNTY+FPTMdJnLI+oELW7mlfr31YG9L2eVuy8mfAiScFNsGeoYMUqfgU0JFIas1gED
 N/pOhHjVmyj4TS+k9lRjT6AlH1I5b9bPtez6CG54kudpNpWeUkBeUKoU/Ki5TERwxNji
 UBuOKiq9gKtfknDqCL9U3waffui4EmVd5U/XtTBEL3OUUG/JGC/aJcwwB/+f9ymn9mfL
 1eBw==
X-Gm-Message-State: AA+aEWazXK7GEnWoi2DPLqGTroB2+CAtv6c10Yz7IPt8blXWyD55ckB6
 DTkBtyLb1/h8Bl54UR2vQg==
X-Google-Smtp-Source: AFSGD/WvNjfb6eF+KnwrvCaF1Q03GxUQflfTylnXk3tkWA2mz++vItu2t/i0MNrl4EfD8GPJvPaIzA==
X-Received: by 2002:aca:a60d:: with SMTP id p13mr8771745oie.2.1545153632929;
 Tue, 18 Dec 2018 09:20:32 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s66sm13246235oia.55.2018.12.18.09.20.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Dec 2018 09:20:32 -0800 (PST)
Date: Tue, 18 Dec 2018 11:20:31 -0600
From: Rob Herring <robh@kernel.org>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [RFC v2 1/2] pwm: sifive: Add DT documentation for SiFive PWM
 Controller
Message-ID: <20181218172031.GA7272@bogus>
References: <1544768442-12530-1-git-send-email-yash.shah@sifive.com>
 <1544768442-12530-2-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1544768442-12530-2-git-send-email-yash.shah@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181218_092044_181432_8772B358 
X-CRM114-Status: GOOD (  19.76  )
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
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 palmer@sifive.com, linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com,
 thierry.reding@gmail.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Dec 14, 2018 at 11:50:41AM +0530, Yash Shah wrote:
> DT documentation for PWM controller added with updated compatible
> string.
> 
> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> [Atish: Compatible string update]
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  .../devicetree/bindings/pwm/pwm-sifive.txt         | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.txt b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> new file mode 100644
> index 0000000..250d8ee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> @@ -0,0 +1,44 @@
> +SiFive PWM controller
> +
> +Unlike most other PWM controllers, the SiFive PWM controller currently only
> +supports one period for all channels in the PWM. This is set globally in DTS.
> +The period also has significant restrictions on the values it can achieve,
> +which the driver rounds to the nearest achievable frequency.
> +
> +Required properties:
> +- compatible: should be something similar to "sifive,<chip>-pwm" for
> +	      the PWM as integrated on a particular chip, and
> +	      "sifive,pwm<version>" for the general PWM IP block
> +	      programming model. Supported compatible strings are:
> +	      "sifive,fu540-c000-pwm" for the SiFive PWM v0 as
> +	      integrated onto the SiFive FU540 chip, and "sifive,pwm0"
> +	      for the SiFive PWM v0 IP block with no chip integration
> +	      tweaks.

This should reference the common doc Paul has written and not re-explain 
the versioning scheme again.

> +- reg: physical base address and length of the controller's registers
> +- clocks: The frequency the controller runs at
> +- #pwm-cells: Should be 2.
> +  The first cell is the PWM channel number
> +  The second cell is the PWM polarity
> +- sifive,approx-period: the driver will get as close to this period as it can

Needs a unit suffix as defined in property-units.txt

> +- interrupts: one interrupt per PWM channel
> +
> +PWM RTL that corresponds to the IP block version numbers can be found
> +here:
> +
> +https://github.com/sifive/sifive-blocks/tree/master/src/main/scala/devices/pwm
> +
> +Further information on the format of the IP
> +block-specific version numbers can be found in
> +Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
> +
> +Examples:
> +
> +pwm:  pwm@10020000 {
> +	compatible = "sifive,fu540-c000-pwm","sifive,pwm0";
> +	reg = <0x0 0x10020000 0x0 0x1000>;
> +	clocks = <&tlclk>;
> +	interrupt-parent = <&plic>;
> +	interrupts = <42 43 44 45>;
> +	#pwm-cells = <2>;
> +	sifive,approx-period = <1000000>;
> +};
> -- 
> 1.9.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
