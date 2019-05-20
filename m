Return-Path: <SRS0=cYQk=TU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A16CC04AAC
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 20 May 2019 14:37:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F237216B7
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 20 May 2019 14:37:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TYt7k5gq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+g3cxGK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F237216B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o/6rJtoQhMsWHa6YmKIKoUufYG2JXQwlHZrwlYmOSNE=; b=TYt7k5gqxUBDYO
	0hU4dUnsbcJPGuLjnzzlh5kEWWDAfFy+qQyBfnrIHyvm5gtjrfzCDBaDKSN6lmXubAUyetz1U2NYF
	XTwHwqvJiZ1pyauAzkG6FK8s8vnLw/eB51yX2qKAMjmYqLBZodVdk0RjzTiKbQfJwzPFD96CXLVM9
	axgFV8+2NbWcuSghgXGNtG9xiv7AkRwHSGByObIrWBUH1OXzxYULHS0EAGQZYr/aGBzFSCh888Vll
	qSVdk9hWvWHr27QcX/7pVPYO3mqqumuyQkw5GoSeEYMKHemK+Fv8+Tgz9ymv9TU9U6Pro97l5Aeav
	gaXvlIFVp2OscrbFET6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSjPr-0005Sw-T2; Mon, 20 May 2019 14:37:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSjPR-0004rr-2P
 for linux-riscv@lists.infradead.org; Mon, 20 May 2019 14:37:04 +0000
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 13A47216C4
 for <linux-riscv@lists.infradead.org>; Mon, 20 May 2019 14:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558363020;
 bh=knrqwf5MAsU6lMqPaPAX06elGTJ1YYogOCMk0BvpCBs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=f+g3cxGKZSYjQDxSwzvKTrnbkxGEz0+zDhjdW6xxHIddsfd3cH3pdiRKSsYEs5Syo
 0mu+TLKXYy+EBgR4SPTNArk/zXFRGLxmARAIU1hSJ0JlhaqJq0XOylTb7v+I+4F/B/
 am2ErhBpPKCK8CBWVUsqov+2h6WyoDKvJWy48JO4=
Received: by mail-qk1-f179.google.com with SMTP id w25so8905423qkj.11
 for <linux-riscv@lists.infradead.org>; Mon, 20 May 2019 07:37:00 -0700 (PDT)
X-Gm-Message-State: APjAAAVjNpGbhjuHMPR/ytGuDg2AiuVWZmD4143zkGNZQmEQmR+HSbWY
 oVtefTDiGpkpwFFlg3T5WTPkKCDfVOI/jz4OXg==
X-Google-Smtp-Source: APXvYqwOf9Z8nbXUZPSOt15qYtcOeclLXjXToptke87YGvm4/v/PJxK1Ifu47Dtn/ZUAoLrSKRzG6YspjAeBF/yeABM=
X-Received: by 2002:a37:a8d7:: with SMTP id
 r206mr46423501qke.264.1558363019267; 
 Mon, 20 May 2019 07:36:59 -0700 (PDT)
MIME-Version: 1.0
References: <1558361478-4381-1-git-send-email-sagar.kadam@sifive.com>
 <1558361478-4381-2-git-send-email-sagar.kadam@sifive.com>
In-Reply-To: <1558361478-4381-2-git-send-email-sagar.kadam@sifive.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 20 May 2019 09:36:48 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+6uL+wqi=5cp1X9JdBfmLDzGz5UjwfqKCCESyhsemnhQ@mail.gmail.com>
Message-ID: <CAL_Jsq+6uL+wqi=5cp1X9JdBfmLDzGz5UjwfqKCCESyhsemnhQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: i2c: extend existing opencore
 bindings.
To: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_073702_024615_BF92129F 
X-CRM114-Status: GOOD (  17.30  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>,
 peter@korsgaard.com, devicetree@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, May 20, 2019 at 9:12 AM Sagar Shrikant Kadam
<sagar.kadam@sifive.com> wrote:
>
> Add FU540-C000 specific device tree bindings to already
> available i2-ocores file. This device is available on
> HiFive Unleashed Rev A00 board. Move interrupt and interrupt
> parents under optional property list as these can be optional.
>
> The FU540-C000 SoC from sifive, has an Opencore's I2C block
> reimplementation.
>
> The DT compatibility string for this IP is present in HDL and available at.
> https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/devices/i2c/I2C.scala#L73
>
> Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-ocores.txt | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> index 17bef9a..b73960e 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> @@ -2,8 +2,11 @@ Device tree configuration for i2c-ocores
>
>  Required properties:
>  - compatible      : "opencores,i2c-ocores" or "aeroflexgaisler,i2cmst"
> +                    "sifive,fu540-c000-i2c" or "sifive,i2c0".

It's not an OR because both are required. Please reformat to 1 valid
combination per line.

> +                   for Opencore based I2C IP block reimplemented in
> +                   FU540-C000 SoC.Please refer sifive-blocks-ip-versioning.txt
> +                   for additional details.
>  - reg             : bus address start and address range size of device
> -- interrupts      : interrupt number
>  - clocks          : handle to the controller clock; see the note below.
>                      Mutually exclusive with opencores,ip-clock-frequency
>  - opencores,ip-clock-frequency: frequency of the controller clock in Hz;
> @@ -12,6 +15,8 @@ Required properties:
>  - #size-cells     : should be <0>
>
>  Optional properties:
> +- interrupt-parent: handle to interrupt controller.

Drop this. interrupt-parent is implied.

> +- interrupts      : interrupt number.
>  - clock-frequency : frequency of bus clock in Hz; see the note below.
>                      Defaults to 100 KHz when the property is not specified
>  - reg-shift       : device register offsets are shifted by this value
> --
> 1.9.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
