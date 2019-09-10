Return-Path: <SRS0=VX3L=XF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D9CC4740A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 10 Sep 2019 09:52:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE808206CD
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 10 Sep 2019 09:52:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dcf6o+Gc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ljRKsul0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE808206CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lbKWitFWfKXX5kRLIlS+UvR7stNKtCauQyLTBzB2Xoc=; b=Dcf6o+Gc2KtNxq
	vPxjZ8/ytejQxtzEwnU5ONpPxfN6KNHy5A1KIbeKiCyff05OtppdEmgZD4naJ/NBvEMMktBjbBvuk
	1HySxPh/z6JNsrWMhlQyMfkwjc5LYyZ7+4DtEowOoe0ZNBqPli7RjLjbc/UGiKkvQNXRK8XB493hj
	+eR4Zn1b9oX4MHXJTP4wTJpxidzndzHOX+Map5M7eP9YN59evTXr1B3YPor2PwdD1DoGo33vyHBUd
	NhbTDdUxC2QOOiPExZphUwq+HJbBiTpzsZKNsDiQ/eRTjagAbfuRJ6DYElCn9yoWEwZ2faNssPAWI
	lhCRhvoIdLkup6lJJBtQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7cpN-0004MN-FO; Tue, 10 Sep 2019 09:52:49 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7cpL-0004Ld-3v
 for linux-riscv@lists.infradead.org; Tue, 10 Sep 2019 09:52:48 +0000
Received: by mail-lf1-x141.google.com with SMTP id w67so12911991lff.4
 for <linux-riscv@lists.infradead.org>; Tue, 10 Sep 2019 02:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UCCxiazzNKm8GfRdBMzix7RqbnKVVm8PwfIPcf8Ud9o=;
 b=ljRKsul0mZVE7hjuRdwu0vDFTakT8JFE/2cyerU5FPgdhHWt1rkLc/XVmzFSuCdPyA
 /G3lIV76GIKLQb3bB+uKUlq6zEOJp1/Jn7Bscc2/jQI6vtCMBKWUsj/fmMSyCEd2qNAL
 V1vG8Se1hHXhwDqAbg8s7vDI3Ibg8uD2ZzkbbiS48Sm3gFFKFoG/OpoGBsMLp+jl42NB
 CX+IqlW87dKEJnQTPMd2wc1doUzIXECqEdcQZZhRlbagUPN5NRb3QL2t3CHNXtubY7Qk
 qdl1LrhsmO8b1M0BjYMm7Z3hO+0+IS7IDQImB+80dHHcpeWxrs8aFoFmvgFMCl1SsLZg
 yH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UCCxiazzNKm8GfRdBMzix7RqbnKVVm8PwfIPcf8Ud9o=;
 b=PrNuCymjfNyk8N+Y0zvqoVQs6l+/Mw0xX4K1WfnbNqkf2hnkF2L4HZPKeCYBW8Og8E
 ELZflCcLtV9Z9Bd/p/awAokPV+Fr80N7QFmdeRPibkpcqd+4wbBdnmeWoDvR0jJPc6MW
 ghUTqklye29nkTEY3V5wKKByKxb/seW6tkO0C5dDVfYMbnY2tyvjFjtSenwjPXbvGt5a
 W1yrVbRu8DeZ4JhRmxQqMw6Y0HHpjkmRfJRuXVNajSn+hfQZ+vX3r0WSrWdAW/o4rOvs
 4lte2NdZS8LgXYX5bnlxU8EzNuatBlg2B9Dw9Llwxn5LWcJYL1VbfdXn45JFMfA0DPjl
 5etQ==
X-Gm-Message-State: APjAAAUZWiTozCnzL7VABzFQjFbc+/RZcOp5aEF0z55I2a+3lRpK62Y8
 A6RsUZOtMmWa2akP08e79C/DkWHDkpU9lsOp7mktKg==
X-Google-Smtp-Source: APXvYqx9y3L6l20MO17A9IA6zgodZQShZyGHzkSX5INuMhtqmNR4XtMFHhM2ZZJH9fSmw/HaeCyGmGFqU1WqfGLgg0o=
X-Received: by 2002:a19:770a:: with SMTP id s10mr2194571lfc.30.1568109163186; 
 Tue, 10 Sep 2019 02:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <1566379420-26762-1-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1566379420-26762-1-git-send-email-yash.shah@sifive.com>
From: Yash Shah <yash.shah@sifive.com>
Date: Tue, 10 Sep 2019 15:22:07 +0530
Message-ID: <CAJ2_jOGO-isv52rnwRusV7jtyCY_JWYWAj9opN3Zg6ZbZr-8-w@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: Add DT support for SiFive FU540 PWM driver
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190910_025247_225965_D09EC160 
X-CRM114-Status: GOOD (  12.50  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Sachin Ghadi <sachin.ghadi@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 linux-riscv@lists.infradead.org, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

Any comments on this patch?

- Yash

On Wed, Aug 21, 2019 at 2:53 PM Yash Shah <yash.shah@sifive.com> wrote:
>
> Add the PWM DT node in SiFive FU540 soc-specific DT file.
> Enable the PWM nodes in HiFive Unleashed board-specific DT file.
>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi          | 19 +++++++++++++++++++
>  arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts |  8 ++++++++
>  2 files changed, 27 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> index 42b5ec2..bb422db 100644
> --- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> +++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> @@ -230,6 +230,25 @@
>                         #size-cells = <0>;
>                         status = "disabled";
>                 };
> +               pwm0: pwm@10020000 {
> +                       compatible = "sifive,pwm0";
> +                       reg = <0x0 0x10020000 0x0 0x1000>;
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <42 43 44 45>;
> +                       clocks = <&prci PRCI_CLK_TLCLK>;
> +                       #pwm-cells = <3>;
> +                       status = "disabled";
> +               };
> +               pwm1: pwm@10021000 {
> +                       compatible = "sifive,pwm0";
> +                       reg = <0x0 0x10021000 0x0 0x1000>;
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <46 47 48 49>;
> +                       reg-names = "control";
> +                       clocks = <&prci PRCI_CLK_TLCLK>;
> +                       #pwm-cells = <3>;
> +                       status = "disabled";
> +               };
>
>         };
>  };
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> index 93d68cb..104d334 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> @@ -85,3 +85,11 @@
>                 reg = <0>;
>         };
>  };
> +
> +&pwm0 {
> +       status = "okay";
> +};
> +
> +&pwm1 {
> +       status = "okay";
> +};
> --
> 1.9.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
