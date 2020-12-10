Return-Path: <SRS0=mXjn=FO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9367C4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 13:35:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93F6B221E2
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 13:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93F6B221E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Lu+LwiAgBGAOGtH8dWnqE7t87yU10TKuOQHnLPROc04=; b=JXGb63qy4kE6/eEA+xa6ohu6u
	idT1AOBDu65ODO/dd9qOkAD+LlUEwykqySEoKpsNv/Vk+/f9OU0XftZSTpi/OYsAtOziwsfWHBtJJ
	Or87WtT9zSJOAAXyPdrur3/B5zYNXSGpNBs7wYonDeYBB7HwIfeOOUdg52g4q07TR41lrHNJDwL3V
	peywdUV5IYhCZqeey1wkyT0IQ3KEh63jFyfnPkT6Z3gthztM6bu1ZX73P//RDqOro8PjjeMOn61Vx
	culFs2nfr68wb9BC45k9eKMJ2kWgtBPIctiHYmqifu7IM1nF8AADliJXQSA4jzTLZIZTIOPdEf0v+
	S4bPQF4jA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knM68-0001UZ-3x; Thu, 10 Dec 2020 13:35:08 +0000
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knM65-0001TK-9M
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 13:35:06 +0000
Received: by mail-yb1-xb41.google.com with SMTP id u203so4733898ybb.2
 for <linux-riscv@lists.infradead.org>; Thu, 10 Dec 2020 05:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PruGUtDJdsgm777wkWNoe3vOXDaPQKYGDAojPXnGM3g=;
 b=qr+ZqQ2F4EZQfgdy8K+Kqs+ju2va5nhDTYEtOvAiGmiJX2+U4h7E0rqdX/PQIbTGh+
 CaNBjYsEAXvrBdvcJyqNLGW4vI71xB9Nunla2/S8Xyg076OROcaxIxeqZTo87P3ZrpEK
 Tpyw6ehpSlxTCxW21MgYgUT/F7qeRYG8LkRURerN8L1ZKKDe4UG5A5J53BhFNdTcPG/Y
 CJlzYxOG+uJgGNDy4V8xNEcrr5hALBb9Ini1MUiJq1CqsUQiqthZCmUX5zIc5YHmI0Qy
 OVaNLCOIWBxSV2WCJM383Thx15WG8Z/Tf8K5+nJcmuQC/qSm75GCDSEV190GMIGubzD8
 TUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PruGUtDJdsgm777wkWNoe3vOXDaPQKYGDAojPXnGM3g=;
 b=eQHXXw0AX5EUgME0um/duS9lfbuG+ccrDYNT8AinqP7uaKFJ+fXgfFXmkQULtzkP9V
 0zN6QRS+Q2dJW4PaV9mqoZXlq5JM1rvFSgmlDyF34axP8L3JC46ZPS+9iqOiTCE8ecx+
 tE/5uPrMk0yiaX5IP01f0I8hp6Khqzpdt6pgV0Q8BhmM2Hl45KWEPWWN7CeePSF2lJD2
 bLNRWb2a62BNWgbr0AwsiUnsY4lqTOJAO37l4ATAcNz49YXtNLHFStJeFwz4gGaR09XZ
 lJtOm1pdFPM5YD/1gKCuwSgCNTPZqRYbjw/NdKrR4Ksqr0Rwv1sXvNpPQrlsr279W0nO
 9nBg==
X-Gm-Message-State: AOAM531PHvB8cWzDT+M9/9SJgHK+ovwmExuRQ+PEb03rBagBp+pNVVe3
 i5Kxxwc9HvA0R9pm5w/UqhCDtvsNkvlOIUCfwK0=
X-Google-Smtp-Source: ABdhPJwt8733zr6N4yj6FxVSgrph3s9l4oGe3cVPbzqFrVlmw6Xv6Vu14kyHNxg5hkVg18XwvFJU42O68ypfOORJOLs=
X-Received: by 2002:a5b:2c6:: with SMTP id h6mr10931588ybp.306.1607607303436; 
 Thu, 10 Dec 2020 05:35:03 -0800 (PST)
MIME-Version: 1.0
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
 <1607403341-57214-9-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1607403341-57214-9-git-send-email-yash.shah@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 10 Dec 2020 21:34:51 +0800
Message-ID: <CAEUhbmUPvu6bRDSnA4aUNNZRdjzfYSQOVvkN=PrqAxCK5oCngg@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] dt-bindings: riscv: Update YAML doc to support
 SiFive HiFive Unmatched board
To: Yash Shah <yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_083505_401123_DD804E38 
X-CRM114-Status: GOOD (  10.26  )
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
Cc: linux-pwm@vger.kernel.org, Peter Korsgaard <peter@korsgaard.com>,
 Albert Ou <aou@eecs.berkeley.edu>, devicetree <devicetree@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-spi@vger.kernel.org, andrew@lunn.ch,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, broonie@kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, lee.jones@linaro.org,
 Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Dec 8, 2020 at 3:05 PM Yash Shah <yash.shah@sifive.com> wrote:
>
> Add new compatible strings to the YAML DT binding document to support
> SiFive's HiFive Unmatched board
>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  Documentation/devicetree/bindings/riscv/sifive.yaml | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
