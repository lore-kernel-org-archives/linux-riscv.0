Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4406C282D7
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 20:37:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A50BC21872
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 20:37:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eXT8A9I7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A50BC21872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M2PPwHKn6nbcMEpwj8xZ5VonSrjDKH6QVi7hw9HTbrE=; b=eXT8A9I7186+NL
	RHt2SidJcYizMY+eJEXCbKsjFFNGst0Ii2hGXJsIvvwJzy03f7//lE70nDqdyv7jml5LHNeI5ykBM
	AON+DBww0REpRnd91wJF2Cav/udCyaJqKFkyLlxOyMnqPhw3328Ym85U7hwFBPDWFtb0Z5Hf7gpPD
	JH0r9VbefetPozPENchmrES+081smTeJ8QMgb2rvDsaf7me/IKZeP6zJPzXuYlgDdGKm9of8B4658
	ftvUmiC976R3qLLvV1OsVFfJ8gv0TThIBBy3b8/oRq+XeAeyVXTLgpROA9bbMbwoGuOQtl2k214k7
	ipuRZT0gOhE+0a7dGKrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gu1I4-0004mR-Ne; Wed, 13 Feb 2019 20:37:56 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gu1I1-0004k9-PG
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 20:37:55 +0000
Received: by mail-ot1-f66.google.com with SMTP id z19so6694650otm.2
 for <linux-riscv@lists.infradead.org>; Wed, 13 Feb 2019 12:37:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3voqcrjL3lddC/ozmniVT3xEKHp7odJOLdH6cCVc9Zg=;
 b=bLnmqeuRX9DSZKz1wW/GD7C8+R0HduNfhpbdr1LCzu3vzHRwS3UD7rJfwqMZXmLntz
 CxWQy2z42/DfSHo386aIS+aBWVeWYVTBxHoVOwLZX/nDaEfpX54/9/bLKvnGSLPhpb+B
 rkeEWiAVlZ9vZY3l41tQNoysVbWi2df9O+q3MvNiMHyGUKyxQrxvYdInbJgdPk/Vrf+Y
 R26U0H13uhBw43xfHJXLFqKjiOtI6i+e0566kZX91uRtuVGU4O966RWyG3iSyv+nc+hG
 fAaWUdqHAPScO7ZxMLEetXbXoxj14jaxZbxGCqlnF+4Fw3E39Sa1ikOIE7HWYJyE0UtY
 YJuQ==
X-Gm-Message-State: AHQUAuZgJgzfpkLI7f3mldfM/Zw2YGolcgDttMDK13TqzxOgC2PLLjNu
 ObXKa9dHlPvpi3bmAQsyJA==
X-Google-Smtp-Source: AHgI3IbjNfHeTqSx3HupP3ww1rN82H76GaY3sbAyX1kKWLiOrdJcRlW9FD+RN4RDGZUt+dvIqM+puA==
X-Received: by 2002:aca:e5c9:: with SMTP id c192mr30475oih.118.1550090272993; 
 Wed, 13 Feb 2019 12:37:52 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r203sm136372oih.11.2019.02.13.12.37.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 13 Feb 2019 12:37:52 -0800 (PST)
Date: Wed, 13 Feb 2019 14:37:52 -0600
From: Rob Herring <robh@kernel.org>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v6 1/2] pwm: sifive: Add DT documentation for SiFive PWM
 Controller
Message-ID: <20190213203752.GA18326@bogus>
References: <1550049978-20705-1-git-send-email-yash.shah@sifive.com>
 <1550049978-20705-2-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1550049978-20705-2-git-send-email-yash.shah@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_123753_815872_D220992A 
X-CRM114-Status: GOOD (  17.18  )
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

On Wed, Feb 13, 2019 at 02:56:17PM +0530, Yash Shah wrote:
> DT documentation for PWM controller added.
> 
> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> [Atish: Compatible string update]
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  .../devicetree/bindings/pwm/pwm-sifive.txt         | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.txt b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> new file mode 100644
> index 0000000..3b9c64c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> @@ -0,0 +1,30 @@
> +SiFive PWM controller
> +
> +Unlike most other PWM controllers, the SiFive PWM controller currently only
> +supports one period for all channels in the PWM. All PWMs need to run at
> +the same period. The period also has significant restrictions on the values
> +it can achieve, which the driver rounds to the nearest achievable period.
> +PWM RTL that corresponds to the IP block version numbers can be found
> +here:
> +
> +https://github.com/sifive/sifive-blocks/tree/master/src/main/scala/devices/pwm
> +
> +Required properties:
> +- compatible: Should be "sifive,$socname-pwm" and "sifive,pwmX".
> +  Please refer to sifive-blocks-ip-versioning.txt for details.

Please specify what soc and IP version are used. Is sifive,pwm10 valid?

> +- reg: physical base address and length of the controller's registers
> +- clocks: Should contain a clock identifier for the PWM's parent clock.
> +- #pwm-cells: Should be 3. See pwm.txt in this directory
> +  for a description of the cell format.
> +- interrupts: one interrupt per PWM channel
> +
> +Examples:
> +
> +pwm:  pwm@10020000 {
> +	compatible = "sifive,fu540-c000-pwm", "sifive,pwm0";
> +	reg = <0x0 0x10020000 0x0 0x1000>;
> +	clocks = <&tlclk>;
> +	interrupt-parent = <&plic>;
> +	interrupts = <42 43 44 45>;
> +	#pwm-cells = <3>;
> +};
> -- 
> 1.9.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
