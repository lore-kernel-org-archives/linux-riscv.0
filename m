Return-Path: <SRS0=FYYd=4V=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FBE7C3F2CD
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2020 03:46:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 451A620726
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2020 03:46:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p9M32/cO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="krmkkN4V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 451A620726
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Dl4yIvdbNV8zUEZF0iJKHHNN3Cn7sHrjK08gaKgENUM=; b=p9M32/cOCRQsZvYVwtBvY+MPu
	CGX9hw6ZMVokh0jviR1QP/YjxwdBw1PKh6WxZGICOLYsAMPJp1xE6YrsaBEhKgZ5VJu+VNF1Z+kf+
	KstzZxLcGMUkL4/CTMurPPME+uCM6kJS0bqJ4VtMFq86p8SPVnF4KziedKXEXbSfCpVooSVVeKxW4
	G0gMV1TQYAqaFex/2OeDpRbmhc+XvWAIBmjbvhFkHqkXyRWmL6SKRYGZd/lbMeBGFu7nIYjZOUTNr
	UbxPVWTIJyl6r3DIaNdfprybuROZz2VNO5hfCQGsqsvZyy5HHSmqiR/kb+wmlZtvj624pHek3+ABa
	DlwE4DdtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9Kyu-0007j5-6p; Wed, 04 Mar 2020 03:46:00 +0000
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9Kyr-0007iH-76
 for linux-riscv@lists.infradead.org; Wed, 04 Mar 2020 03:45:58 +0000
Received: by mail-wr1-f68.google.com with SMTP id j16so581991wrt.3
 for <linux-riscv@lists.infradead.org>; Tue, 03 Mar 2020 19:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dl4yIvdbNV8zUEZF0iJKHHNN3Cn7sHrjK08gaKgENUM=;
 b=krmkkN4V5zPIpMl1EPpZRD1webC/631MVKogbzCnK4d3YjLOrLOZDWnsNmM0IRwePB
 u5+remgX6B5Eyqy3000CS47e+Kuyh/oI4sNBIieCN5H+74G63bcAhvFyKLz5Diq/791C
 YGVGx3dST5jJ25lsJomJdOvOkADYQmUdBo5j3cDRmtGuXZZ4i8bdxBean3nmBoigyKHL
 avDmfaDxbG0Zf8KtISwZmadDC0AbpK5ft/vqa+VAqW1axj3EdTP+g7B9C8VgaOhwQvfI
 WWiwk7Y1or5Hmq42pVli4ci+9t82SN0Y5T0gz2/GbLHlS1Ao2uggNWioPKIkx/A/7OG6
 BfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dl4yIvdbNV8zUEZF0iJKHHNN3Cn7sHrjK08gaKgENUM=;
 b=GBbIl0xZIGhcwrkRf8SwPyzZ9CmN7QbPJvlKApyLQxQ/+Y2y947+1zUHIJqYyBei6j
 sqkgY4PCX8U2OXg48KRQ0UD0KQrEH4Bip6r5F8E/blACZeA4tnIvJxzEc2G4jLzvMTdA
 ubuq7Uc7wx4cYtsYS3Nk/8Q3u2tdNSf9SQ7zgnwBshuS0QIqYJAWE1JG26CpmRCqaV2d
 WOx8Hx38hytvU9+eLXlmBn/W7O6oymKbzt0umFLrh4WftQqS4HRbrWwaOoLilxuE3E+m
 OxtmdcYWwqVOHbUCcMUfSPQ/E65wXmV4Xj27y/osWfBv382p7zQcof+KXaL3p4dj0Th4
 Vwtg==
X-Gm-Message-State: ANhLgQ0GdGZVh66InNDi8Ot3zfw+BaZ9SM0Gh3mFfQPbZ+lIDhSCO0TI
 gwX6uEcpXATkBNSJZLfz+xSmOYlJLGFLbe2QCA++BA==
X-Google-Smtp-Source: ADFU+vvJT3jupIF+x5Oj1qF5HLpZyr9Rp5nN4jMR5lQXgXCYyIIUg56PeBlrGlO8WTISClOKWSw3x4YkD0iH1eNa1gA=
X-Received: by 2002:adf:e90d:: with SMTP id f13mr1649750wrm.0.1583293549186;
 Tue, 03 Mar 2020 19:45:49 -0800 (PST)
MIME-Version: 1.0
References: <1582084147-24516-1-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1582084147-24516-1-git-send-email-yash.shah@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 4 Mar 2020 09:15:38 +0530
Message-ID: <CAAhSdy0jGQ+PZnwjb63Wpu-pyhUWCJdnspNJOwMbYyOxBTnJfQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: Add GPIO reboot method to HiFive Unleashed
 DTS file
To: Yash Shah <yash.shah@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_194557_398156_3D7A4224 
X-CRM114-Status: GOOD (  12.84  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 19, 2020 at 9:19 AM Yash Shah <yash.shah@sifive.com> wrote:
>
> Add the ability to reboot the HiFive Unleashed board via GPIO.
>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> index 609198c..4a2729f 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> @@ -2,6 +2,7 @@
>  /* Copyright (c) 2018-2019 SiFive, Inc */
>
>  #include "fu540-c000.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
>
>  /* Clock frequency (in Hz) of the PCB crystal for rtcclk */
>  #define RTCCLK_FREQ            1000000
> @@ -41,6 +42,10 @@
>                 clock-frequency = <RTCCLK_FREQ>;
>                 clock-output-names = "rtcclk";
>         };
> +       gpio-restart {
> +               compatible = "gpio-restart";
> +               gpios = <&gpio 10 GPIO_ACTIVE_LOW>;
> +       };
>  };
>
>  &uart0 {
> --
> 2.7.4
>

