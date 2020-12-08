Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0944C4361B
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 09:39:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 693D123A52
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 09:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 693D123A52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1OvmIf4tjQ17tqnPI/vmMFsM5e9XIs+qGqaK65p+qDs=; b=s483B8ehZDWtd2wNl2S3RxOfj
	CoCNAeI7WDSyUG0WnlXwhXsMyE3jmeGvmSi7p3TyVY8b/E2xQBkbzwgLw2cflmLOhtsK8tspmtbqo
	YbzflrekJ6yshGGXbtGCxgVDr9ENn2gEymySNlHejzOZ7cieT2kOL2emv2954W6xwutZnVFgqapTt
	H+YSSk9d00AAXMZJkuqYwrxD78+uYgrVgiJyWmAiQiBtYmaAqdPSlGb2c8fkvl98Bhl30972OGnU4
	fKCxxllq9i/6E5ioisL/Ctfg7gpMUz/uSr7KXV+B/rqHaqICh6lMbEA/IUyTTOKm+4jzO5bytIhe2
	q7zOajMwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmZSW-0002mq-EN; Tue, 08 Dec 2020 09:39:00 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmZST-0002mB-9M
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 09:38:58 +0000
Received: by mail-lj1-x241.google.com with SMTP id a1so17019681ljq.3
 for <linux-riscv@lists.infradead.org>; Tue, 08 Dec 2020 01:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Df6CqLv6JOagx1Y8po8wBRxgE1D965nfEA75Zeqy5oU=;
 b=hiBfGGso9wRtqNNhBBDBX1PZJI4bsFd8GYtW1arlG6wQ4COUeIZUEbdlyvCERMJMNo
 G3mKLQX6l8yLU9kEnfD7DSvjlpMv/k/voYdOTNP7XWZPPJ/qSQk8mxqGTTh8jNzexWF+
 IM8Az+l2VS7WmMT17YcIg6P/3wHd3R+VH1SSg9INsPTtt3qSUiUthy5zd7hakcqWkB+O
 qSfwe3vWou5ZGLP9SOQvoHKDMgFZGQ1O3JUjz3sj++5TS4p8K381xHRqUXYIzwKWdgKO
 FQZL/lFJPkZkG5N/3mq019RC7s6wgK9FMFx6XuoeVpbfGEDxYEjwM070MoklamNKuEIX
 cY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Df6CqLv6JOagx1Y8po8wBRxgE1D965nfEA75Zeqy5oU=;
 b=KYuWFQXJFP+GWdwTJUgkyWu7z+FJ5T3kjUjY9K2GXKJEMfHvyBK/kAj/CA+ChdBXz2
 0uE6rFpUIo/vupGunGQ3jUCSO//TyuQRZcHbRtKQbcc/lRMtJgw3KMtGMPmgH1T8nt1Q
 AdvNPMa8UPmzy3ZT0yt7UP76HiAs2AD3SpVrmKFLYSJ/NUSsmXyvY+nQsVOd1zrmbCSf
 mdQarrSgal5WhKrb4Se3oVHB9KDZoTGfMBvy5Ddg3r+48nF0giGBLfalmSBoN8A/WAYO
 EphLfAliW6xm2GsEh1gDY1NWlLuDP1+ojDd4ueQHAw0pMT59YU/zPFNIK0HavytvQiql
 TSBg==
X-Gm-Message-State: AOAM533WPogsWabf7PKqZwIajbRo30nyzH/LbuTYnW1M+O1yBeweMR0E
 ncQg1k+QKI/MYhNwOx6QkpnCM3hAW1lytHN65b5RDQ==
X-Google-Smtp-Source: ABdhPJxQWX+drL6yggghfNbiTL59lvfCIOzavoQ1GoTxnH37PaUwIwrN8fyjAkWeHJ5nGm3eQq7eo4VvW5wksxdLa68=
X-Received: by 2002:a2e:910f:: with SMTP id m15mr10801861ljg.467.1607420334616; 
 Tue, 08 Dec 2020 01:38:54 -0800 (PST)
MIME-Version: 1.0
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <0080d492-2f07-d1c6-d18c-73d4204a5d40@metux.net>
In-Reply-To: <0080d492-2f07-d1c6-d18c-73d4204a5d40@metux.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Dec 2020 10:38:43 +0100
Message-ID: <CACRpkdb4R4yHcUV2KbGEC_RkU+QmH6Xg7X+qee8sEa9TURGr8A@mail.gmail.com>
Subject: Re: Howto listen to/handle gpio state changes ? Re: [PATCH v2 2/2]
 drivers: gpio: add virtio-gpio guest driver
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_043857_686514_10D434EC 
X-CRM114-Status: GOOD (  10.36  )
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
Cc: Jonathan Corbet <corbet@lwn.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv@lists.infradead.org, "Enrico Weigelt,
 metux IT consult" <info@metux.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Dec 5, 2020 at 9:15 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:

> The virtio-gpio device/host can raise a signal on line state change.
> Kinda IRQ, but not actually running through real IRQs, instead by a
> message running though queue. (hmm, kida MSI ? :o).
>
> I've tried allocating an IRQ range and calling generic_handle_irq(),
> but then I'm getting unhanled IRQ trap.

This is Bartosz territory, but the gpio-mockup.c driver will insert
IRQs into the system, he went and added really core stuff
into kernel/irq to make this happen. Notice that in Kconfig
it does:

select IRQ_SIM

Then this is used:
include/linux/irq_sim.h

This is intended for simulating IRQs and both GPIO and IIO use it.
I think this inserts IRQs from debugfs and I have no idea how
flexible that is.

If it is suitable for what you want to do I don't know but it's
virtio so...

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
