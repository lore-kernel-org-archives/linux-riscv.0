Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A2ADC433E7
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 15:55:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 489DB2064B
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 15:55:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oPckOhgz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="vZRZASGU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 489DB2064B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bX8O/gEpsCm0uSdW8jLLyF6QJ8TYfxh7WEYi6XaCwhY=; b=oPckOhgz+AMSochzYeXwN8hxG
	c9uWcdifiQx0mzjLjpbOBMP3hwzb/i9EZ7L5HbKzRaTkyQKjMWlZM1Me4Yd77lKWhpcEeVgoGBkQ4
	qc5IaBt0iLfR+iJ8Wp8qp0eDWmgfeq8j3mhJp6qCmNylRzqvtcQvSFmX7IgFg6pmO4X3Nw2RQP8vK
	8tmnFFnJFf64DENOf1izbI6epkqYVQKYPoEJPaYeqp7f+fqh2lbUSUT55EUwkFfh0Q8Dr0VT8h43Q
	cp00NNz1AtEAdsZfTq20EE73mTcswZFVSY3QWLgShqSkYsy24Q/dbw6Ky+N1sbEteo6+0gp9jMw5Q
	mLdB/4OYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw6E6-0004oP-LB; Thu, 16 Jul 2020 15:55:14 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw6E3-0004nk-NC
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 15:55:12 +0000
Received: by mail-wm1-x342.google.com with SMTP id f139so12089633wmf.5
 for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2020 08:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Wm5nrLpCBdqeYkmR+57rLRuzRzpNbn845e+5GZLhdQ=;
 b=vZRZASGUjzHUDNUcoWRJVEw/jprfGBhvzfE347Y80rA4PUsDvEPgDpQmwf0g9FfhVG
 9ikl4jTDrkinwreLaaXqxVE9fsGf/w9fU4498vUUFEQPHBZgRe7V2u3k3lvStIkGSTym
 XvIHE5c2u3SW7L2A7GKBpYNQHvdpyBtruaMdffJa3GalO0Ij4GTdmvbItV4mkVwuXQqO
 GlP19rGLfU0OCyQNdW1aonSGxS8+DSgLACEeO3w1G9lFmWrdkqwLBrINsrFBKCgj/t4y
 xnwsAPPbvpiFYmerLBDbqm5MY2knzZq+YZaIC3hS4jdOxPWgasXzLjuYUx7YjmzEnDAi
 l4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Wm5nrLpCBdqeYkmR+57rLRuzRzpNbn845e+5GZLhdQ=;
 b=PbztXOiIhK3KQYQM9zXh0oiLvcoElVdOJQusRcNTjS6AKl38Yl3NFYcnC5+ujWLUds
 mMvKHEK9+TcixzuzBJRNoI4DELZJUvLcXxLLZ1XPG3HPuScvj5l02c3iXJyze7Sh3uk+
 86HKWmZ7KPNl8hhnwrJf5HUGMOVusReNma4xpPp3h9U1NljUDbDCKeu7qbHL1pnlgcy6
 kUifrRiudv1ZTEy1t4A0UnNnRzzqyDOaWNXr5LOSoQgDQT8rVzJOmnCP4dTGc0ax0vvY
 QnqSL+KA64qC56vHbO7jAfGWGKxpxdmCATliMGip5iX7Ys+GMHDYARIbpI3h8CdmiVGb
 brWA==
X-Gm-Message-State: AOAM5300O1oovmZRR8px98r8Brf3zk3kgzHhbGOOiKKWXUWn8TLDGPQV
 8g5w9UVjncbU0Hx0hooqxUhfJ5tDV8eihcixH8h7Lg==
X-Google-Smtp-Source: ABdhPJzBrhvBt5WZDYVM9BB+5Ge01yxUo/KxdkO1suwsN8v/UCTxvNd1QhAwCk2imFJLL0ZsShqhItpxBSVnMqiMg+0=
X-Received: by 2002:a05:600c:2154:: with SMTP id
 v20mr5279691wml.185.1594914910499; 
 Thu, 16 Jul 2020 08:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200715071506.10994-1-anup.patel@wdc.com>
 <20200715071506.10994-5-anup.patel@wdc.com>
 <20200715175052.GA497000@bogus>
 <CAAhSdy04h-PD-=VhjB=5MOf=-RZMrMOcvEtbtUaDc3-kbV47BA@mail.gmail.com>
 <9c12dd2c-7285-5664-973e-3ec066eec0a2@linaro.org>
In-Reply-To: <9c12dd2c-7285-5664-973e-3ec066eec0a2@linaro.org>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 16 Jul 2020 21:24:58 +0530
Message-ID: <CAAhSdy1kOvXXecGM=qyWS5cpx9nq9RpahLrVaQAUg0VKFu7pYg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] dt-bindings: timer: Add CLINT bindings
To: Daniel Lezcano <daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_115511_879285_9C59800C 
X-CRM114-Status: UNSURE (   9.44  )
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
Cc: Rob Herring <robh@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
 Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Daniel,

On Thu, Jul 16, 2020 at 7:31 PM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
>
> Hi Anup,
>
>
> On 16/07/2020 14:32, Anup Patel wrote:
> > On Wed, Jul 15, 2020 at 11:20 PM Rob Herring <robh@kernel.org> wrote:
>
> [ ... ]
>
> > Thanks for these steps. I will fix and send v4.
>
> Please take the opportunity to clarify how you want the series to be merged.

This is yet another series which largely impacts arch/riscv because we are
factoring CLINT code from arch/riscv into it's own timer driver.

I think this can go via the RISC-V tree.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
