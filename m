Return-Path: <SRS0=UFm3=P5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6334C2F421
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 21 Jan 2019 14:59:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 936AF20870
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 21 Jan 2019 14:59:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ITHvRUTX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 936AF20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c+5SgvwhCIO1eEcxI3zVrjvV6k/ibwO1GQLs6Cw6EII=; b=ITHvRUTXSBhEgE
	e52+XQJW62UoywZ9/BS5aVYlg1noXzEhDjkxp84t2ecdZhltdxPSNP/GYtuk0OjL3mHqf3N4RsmdZ
	ccfcn0ysCeXEgEvTsgYxKlCqCCdG2cdXOrKk6TTF0u22jcqQHiWEYQFfJrtAiPpaGlE+HQIU/5HiI
	9Zln/e/Mw5tij842aulkTckXXrLa95vTt314cqQEHrA8J6vQ74x6wF5QrRU3P3xfgWeTjbUrUDgfr
	AQkhk49TeNcunVXkyiF/omnrGQldt1qSUo8RXHphuMyzRxs8hdxfZx/RIl2y7JF227o9y91TpXzoz
	YL3g1+bFsn3WrbXm5uXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glb2a-0005zt-AP; Mon, 21 Jan 2019 14:59:08 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glb2W-0005zS-GC
 for linux-riscv@lists.infradead.org; Mon, 21 Jan 2019 14:59:06 +0000
Received: by mail-oi1-f193.google.com with SMTP id m6so14720035oig.11
 for <linux-riscv@lists.infradead.org>; Mon, 21 Jan 2019 06:59:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=C/9Uug1Ejuv4f8YRQX5ceM4h66n/a0h50B849R+4uA8=;
 b=K9HQxSIGfYGuNAU2G85xqX04KltibjDIV3UEs/dFjQCP1s0F69FOV0irkB9t7SdtHR
 VwMm29rYFDmyI5juZYnNMxTExCPHFYGcPs5ZdUbwv2JI2WzNwIV8lgfGJ+SklSAWvp49
 /Zsvqngg6ZX6e22NJ7Zij0pJpyBZM5CsjTKeWd96QR8JIxi+SSNeBITB+FCSwGK1tstE
 tw4a/TYVGTUodmWeMa4mHoEWxV7wUGW6+IfVJQPl5Uj7RmgynGAlSkMWI0unhrFb/Eb9
 mo074WY34tI2nUnJJalqnvpevSZPTSL6dGNUugCzMRLSJY89Cyw5+vpbpWuz0jA1j35l
 +VMg==
X-Gm-Message-State: AJcUukd/I2mk9YPGd/TW4WzKsqNgUHVMOIVy9ZXa53PtjYVnuH4pSJ22
 T2RQwdjM84mM/TZYKHlfU4nbZW0=
X-Google-Smtp-Source: ALg8bN401f+OXx2xpMJU9jIWKbBAfydSwLBnDZh+3Vs/dVKpKl0Nw/Cq6Dt6z72aRCOajW93SemtZA==
X-Received: by 2002:aca:3403:: with SMTP id b3mr5647994oia.242.1548082743063; 
 Mon, 21 Jan 2019 06:59:03 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u136sm6309367oie.38.2019.01.21.06.59.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 21 Jan 2019 06:59:02 -0800 (PST)
Date: Mon, 21 Jan 2019 08:59:02 -0600
From: Rob Herring <robh@kernel.org>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v4 1/2] pwm: sifive: Add DT documentation for SiFive PWM
 Controller
Message-ID: <20190121145901.GA7547@bogus>
References: <1548066043-1252-1-git-send-email-yash.shah@sifive.com>
 <1548066043-1252-2-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1548066043-1252-2-git-send-email-yash.shah@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_065904_537332_EF01E882 
X-CRM114-Status: GOOD (  19.06  )
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

On Mon, Jan 21, 2019 at 03:50:42PM +0530, Yash Shah wrote:
> DT documentation for PWM controller added.
> 
> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> [Atish: Compatible string update]
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  .../devicetree/bindings/pwm/pwm-sifive.txt         | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.txt b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> new file mode 100644
> index 0000000..b207908
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> @@ -0,0 +1,37 @@
> +SiFive PWM controller
> +
> +Unlike most other PWM controllers, the SiFive PWM controller currently only
> +supports one period for all channels in the PWM. This is set globally in DTS.
> +The period also has significant restrictions on the values it can achieve,
> +which the driver rounds to the nearest achievable frequency.
> +
> +Required properties:
> +- compatible: Should be "sifive,pwmX" and "sifive,$socname-pwm".

The order here is wrong.

You still need to enumeration valid version numbers. Is 'sifive,pwm20' 
valid?

> +  Please refer to sifive-blocks-ip-versioning.txt for details.
> +- reg: physical base address and length of the controller's registers
> +- clocks: Should contain a clock identifier for the PWM's parent clock.
> +- #pwm-cells: Should be 2.
> +  Refer to bindings/pwm/pwm.txt for details.
> +- sifive,period-ns: the driver will get as close to this period as it can
> +- interrupts: one interrupt per PWM channel

How many channels? If variable, is the a max number?

> +
> +PWM RTL that corresponds to the IP block version numbers can be found
> +here:
> +
> +https://github.com/sifive/sifive-blocks/tree/master/src/main/scala/devices/pwm

Put this in the description at the top.

> +
> +Further information on the format of the IP
> +block-specific version numbers can be found in
> +Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt

You already said this.

> +
> +Examples:
> +
> +pwm:  pwm@10020000 {
> +	compatible = "sifive,fu540-c000-pwm","sifive,pwm0";

Space after the ',' needed.

> +	reg = <0x0 0x10020000 0x0 0x1000>;
> +	clocks = <&tlclk>;
> +	interrupt-parent = <&plic>;
> +	interrupts = <42 43 44 45>;
> +	#pwm-cells = <2>;
> +	sifive,period-ns = <1000000>;
> +};
> -- 
> 1.9.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
