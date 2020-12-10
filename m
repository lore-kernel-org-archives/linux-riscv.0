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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F17C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 13:35:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70E1B22D06
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 13:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70E1B22D06
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p7/AvAiN0UMfqdIrvMrgq1t2TdIDQlIyvYe2ARQiQvw=; b=QeXQu747X6a2iDM7h/zZykjZ1
	WTe/iaCbTUEvbRJ7EAsyjF0uQkDN7J4F89bzfgLLTa1KmoGWX/qyOI+VFzEyXi8pR+b1sMfFTuAUF
	YHFx8hogPn34rSo5tReu8AFFRQzfsw3P1TMV/t3Og01rQ19Not47YVq5q3LPYsDn9JTubyneKySqm
	po/srv3rztRTePkRRrVFHeP4kwgqrzauEzXrSTk5xAXr/aiMN5pGrElyVpdc/9Wti34YMqqGKvlUG
	qtYcvFq/FWKi/ogZD38rG7880ydiKW3G/rvLMt/DIQ5U5v002Y7ylwObgRg/wYsaPCjJLZYSoAKbu
	Dt0tynnAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knM5u-0001P7-IR; Thu, 10 Dec 2020 13:34:54 +0000
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knM5r-0001OL-Of
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 13:34:52 +0000
Received: by mail-yb1-xb42.google.com with SMTP id w127so4708178ybw.8
 for <linux-riscv@lists.infradead.org>; Thu, 10 Dec 2020 05:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U/roqOTkuyKuA5LDRyyEuc0O+uuXLFYRIA0JUlY59Bk=;
 b=I+i0gWaLA7UKfNFgJQDCwWrfCS9iCPpQ0A4zUjzU8Y4ZvassZGOITAyYroE6aiVQxp
 3C7S5fsGAcLvMA+eO0LiCzFAgyULX0jvv67m3oN432kQWKEeC312EQnW9kOU3Nm7vWce
 Ut5c1HlGF8+9XribssMqLCLY7I9i1aMW2lk0fCNwQphjzMxMT+gK001vflbpbYgzShJi
 uDcK/EXnVddWy4lPExw0YitK4tkoB/hkd8bGOcAoimf6NKx1l9QZOa3CtXBOS8qL5eF1
 IUJ/umFa6xMIOtZjhIlBnnFs/ayjL55MRiHZSmGPBddw+TYPs486F3uyhWOww9DiUad4
 afHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U/roqOTkuyKuA5LDRyyEuc0O+uuXLFYRIA0JUlY59Bk=;
 b=ghsjGAzmWR4r7pi4FXeWWu4x2gjZZh7o6P+XECHtNqVB2o+eY3AHaXsR2Ww172a9G+
 q4avL6nQkPlYuP49hIPW6SAQQxXkZpVMl7G32tnRzocvpCLweOI9HY6qGpIuqSBP+0i4
 hsCB/RLuQRJAdqnji8SqESkPAKz8z43iYN4d2GF+ZAOxHwxy3FGsiekHXfn6Dtpt3AEg
 OWILjCAvGm4cLiOeLnMRnwuHjvwyI+Z1n3pAnxTsmmx3INqMuerJ6nUMrPtJHqO4zbjh
 BHrp3Mc2qIWGEt3RZpic6SQiq30Pi2EiI/43HXsGdXCceVMtco8LLfg0gbEhv1r8CObB
 68kw==
X-Gm-Message-State: AOAM5324ioEVFgK9+yCl8fqndqf4DMqs8RF3HkkbZ9sDOyfi63rmC6LF
 +iGWGv7p58l2LEppBbUDQLj77gYwEhvNLcevFhI=
X-Google-Smtp-Source: ABdhPJwOblTPqsGeuSVQCngMDfoO16GBD7DpLAVnesO53oahEPxk3iPPRkVlWRjT5EhD+gYUQuxuFgXEhYqvKK6vfrs=
X-Received: by 2002:a25:690b:: with SMTP id e11mr10757041ybc.314.1607607289459; 
 Thu, 10 Dec 2020 05:34:49 -0800 (PST)
MIME-Version: 1.0
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
 <1607403341-57214-2-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1607403341-57214-2-git-send-email-yash.shah@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 10 Dec 2020 21:34:37 +0800
Message-ID: <CAEUhbmWVn=W7y+xFGrmpNhQUEqLP-SjKoqeWZ=xgeVaMo5qO=A@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] dt-bindings: riscv: Update DT binding docs to
 support SiFive FU740 SoC
To: Yash Shah <yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_083451_830158_18754DEC 
X-CRM114-Status: GOOD (  10.84  )
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

On Tue, Dec 8, 2020 at 3:06 PM Yash Shah <yash.shah@sifive.com> wrote:
>
> Add new compatible strings in cpus.yaml to support the E71 and U74 CPU
> cores ("harts") that are present on FU740-C000 SoC.
>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
