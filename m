Return-Path: <SRS0=jEvo=KT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D63EC04FF3
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 17:59:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E36F861002
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 17:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E36F861002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a9dZWC5YzPzb7HdlUKTmQBtnvViPsSQPibeJ5/79ARU=; b=zZ8DHOlvEVf+oK
	MNZ6nOqPSfpMXutclDxdiskwA6k8/tjeT44a7pZbdwtMAwTcx7WbtNktjZz5Y5T5A76p1u+utc4Mw
	JUZROIAZUa6zflrxQW2o2RP8AbBAxV41ptdhoakMC29ZepM0RgTgWN1xyS3Gm72mW94xGekTCZPvN
	5oe/gQKGTR8IsxpjubK34wLh4eKlzybxVg5xksTOesDo+n4VLz4MlrFKDyNcSXt8Qh+xl27gR/ehW
	J+1HbTG8Sfu1YcOBBhoExQ+jDlIHD9AajmtU7azNmMm4Eyo0AO92+Bgrq41rN77IamDCoQUS/hmCS
	BzqVvAhQ93FdtYncBvTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llEqn-001N62-HO; Mon, 24 May 2021 17:58:49 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll8ju-000s49-EU
 for linux-riscv@lists.infradead.org; Mon, 24 May 2021 11:27:21 +0000
Received: by mail-yb1-xb36.google.com with SMTP id w206so5923402ybg.7
 for <linux-riscv@lists.infradead.org>; Mon, 24 May 2021 04:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n4lZKQ7D/b+Y1RnAe1IHv907xEM4UrKrYxjGnKdhmJs=;
 b=kCzxdZSgQ+Qvkuemg1RliV7PQ15KS5a1Qe+OwDcyfwKRqZeAeqlfwqbMGUopNBnIGO
 xV7tKYPuyGNDSKbtaR5y5JTrluPYIrSv+x8WL4KkqbqDpwfn8gmHIv8y1mjjlb32uubI
 mpZujOUm6T+yU1K4psAp0SByHHHZxtsFW91ACMCFLavQWd+vdcrJzhfeJABoSlyFw8mq
 5VImmopVl4M+pEntrlWzGFmO4UESaMhuUe1vhotgHvf1w0503oYPNlau5+SvFNteTdZD
 SPgs1sG5x09+Z1s4CBdp50r+5+w3KJxgzfxR5YRlYN3J8gUZk/+1Fp7P038BtOhnedpi
 H0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n4lZKQ7D/b+Y1RnAe1IHv907xEM4UrKrYxjGnKdhmJs=;
 b=J5bWVfOPv6l9KnaQG0rLpgU/bWALaAfYsVBE4PJuBmtJtwO41OhMk8KudXQjPSWnR3
 uvUuXARCu+o+MgO2y9mDHlNTUIhv5ehyF5S0G/BwV3OHRO32mSRZQSQXwkfsZtg2b5ve
 z74qNRx/oKSQe4c2L+VGOjgW1juTh/+0EElvesxHnri9M+OLrQJ2trr7/AsqlKQKhX5h
 iNnihxA5sA9yd8yqXsMrAOea/cN7X/uwQoAHHwXEovOcak6A4qPfnfdP8jfB9MyO6p5I
 k9S1ZjxbFn7CYyS7c1nbBGSCL7FL4uj/7Q482fXW2wa1XCwG9YUfJdIVq00QO4uETqlB
 eAxA==
X-Gm-Message-State: AOAM5330MnpBVLJvhOxymaQQI1hg0vxPBpO55qtkImkszbh83UXr64h/
 KAR5QWOuRkKymvhGaAuL8hRL2L+0q/tpm7lpZig=
X-Google-Smtp-Source: ABdhPJy2CiQGQD9PVjlvfc77AiGZksg4u2goErRpB2fkP/7pbqKE9HS5KbzuJSWj6Tjl5TG5N7AmZEE5geyLUdWuD1U=
X-Received: by 2002:a25:b78e:: with SMTP id n14mr35491542ybh.474.1621855635345; 
 Mon, 24 May 2021 04:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
In-Reply-To: <20201203191135.21576-2-info@metux.net>
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Mon, 24 May 2021 16:57:03 +0530
Message-ID: <CAOh2x=kcM351ObubnQSzUa=FVBQUmAUhz4u8ExORUthQQ0WbGQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
To: "Enrico Weigelt, metux IT consult" <info@metux.net>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Vincent Guittot <vincent.guittot@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, 
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 bgolaszewski@baylibre.com, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Linux Documentation <linux-doc@vger.kernel.org>, linux-gpio@vger.kernel.org, 
 virtualization@lists.linux-foundation.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_042718_512473_644FEFC5 
X-CRM114-Status: GOOD (  12.44  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Dec 4, 2020 at 12:51 AM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> Introducing new gpio driver for virtual GPIO devices via virtio.
>
> The driver allows routing gpio control into VM guests, eg. brigding
> virtual gpios to specific host gpios, or attaching simulators for
> automatic application testing.
>
> Changes v2:
>     * fixed uapi header license
>     * sorted include's
>     * fixed formatting
>     * fixed unneeded devm allocation - plain kzalloc/kfree is enough
>     * fixed missing devm_kzalloc fail check
>     * use devm_kcalloc() for array allocation
>     * added virtio-gpio protocol specification

Hi Enrico,

We (Linaro's Project Stratos
https://linaro.atlassian.net/wiki/spaces/STR/overview)
 are interested in this stuff. I was trying to look at the last status
of all this. Few
questions for you:

- Was the spec ever posted to virtio-dev list ? I thought that's the
very first step before
we merge the code.

- Any follow up on this patchset ?

Thanks. I will be happy to help otherwise and have cycles to work on
this if you need my help.

--
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
