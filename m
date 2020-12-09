Return-Path: <SRS0=PU6a=FN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44250C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 08:51:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD0E123609
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 08:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD0E123609
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tbBmyW0pPStmmQFOD0/0/6P5Qb9zmYyyiwG0G8RF2BI=; b=Jn7TUIq+1HZLIL18oRHAa58RV
	kVQg8CWQ8EXaEcpY9HeA1ADwKc44nhZSSqlwFntvL1c996o181SQ7WQSfN7S04qMPccGf1Yjh23yv
	0ezhpOaAQ+PerXotRYnhUxYN63fWU28Z4G3tTmckkumXJMul2ZgYPbPyfRGyVnl4rncpu7VqfbsTF
	gZ0cOib8Blq+h+xiC2h+XMz5jvpBJMMjNnA8ZY+m8dxlOFfqPXrVrKFRmeWs1AxnhyasZb/bhUUqb
	jfnwrPWdOFr3UAgK1LHS0eTbvRWDjeF5jqXIRgPVy9yQ+n2qw2r/1UaQWoEWCHMr/Vc1EW58D7NcE
	xUlEq+GGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmvCO-000784-7q; Wed, 09 Dec 2020 08:51:48 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmvCL-00077A-KO
 for linux-riscv@lists.infradead.org; Wed, 09 Dec 2020 08:51:46 +0000
Received: by mail-lj1-x244.google.com with SMTP id y22so1310183ljn.9
 for <linux-riscv@lists.infradead.org>; Wed, 09 Dec 2020 00:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2LZygKLdMeXtg6UECM3hwilY+T5j2Bz/7hXfM4FH8eM=;
 b=epPtSSR/7bb7N5MVhrvn8mmG61DUhbJ5ceSBz3zdi5ttU8hgJi895CvkV+jIJ/6Elk
 faLbAlJ0Ct8dkmLFvgIrcS2c+E739IaF5RCxecfGNHm3mm9cz8saP5sgGgYp+X1PV4bC
 8mhsjose2UwRapucDt1waykXBayMMNhXuMNDIMFXYNitjuaFIJIsgeaGcS06BwcAfxiT
 KnhaJQskTWoexBWR6Z8n6Tmma+HZsp8I7wCXBC5u3Xfmk6pam3fV2CZ4Ur7GSbOGsa+I
 mOEm5C+iR1V90Ai9/YLl2ZsKt3HZkVjDOpFbulodrKnOwGlU5c4D2BW0bjsEGeVxZrhT
 woEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2LZygKLdMeXtg6UECM3hwilY+T5j2Bz/7hXfM4FH8eM=;
 b=HAs20xzStMOIz9BdFSpT4gXPxUNB8Td6lThE9dW2xsWcvPh0wpII5ByiktYrmXii2v
 0oxcdhUnb7tw9BIwU9PzCPCDj3iR7vyOkv7LsUIQqbEGiZSwOg2p6+jmNlQgckLtiNi5
 QB2F1YTeW1ZwzLtT/5Zd5JszIZEDSx90HdCVrZ6xoL6SNpDUmWBeAqb4Za9S0Vh5YnxP
 wtfu+ChHO6WL8iwooWjr6YFzM0sip5qJYuZkctd21wcCV1oTnXEizzRCWK5TigSfPPoq
 MzFwjeOy82KhMJfrX9bxn+Ln++UJ7IDv2IDJ1VaGzMB8May7CNr7f5IDXLYtSrSUOzTp
 CxWw==
X-Gm-Message-State: AOAM530zCeTVooBjokwmdhKQroEQvYsUYRGvPqv+asfuo5FDUE099hgl
 gWg9JyiS/G6ehipSa2bOWIuoQsmyv9bOakt6Ioah2w==
X-Google-Smtp-Source: ABdhPJzppB0j8WgWv6IdUZKKIGJXOVBgkHuLGiXKbyH9OU440iaPPvmtmnyjuDh6a/e9QQ8jwdYfQNzIxLD6F6BmUpY=
X-Received: by 2002:a2e:910f:: with SMTP id m15mr622232ljg.467.1607503901332; 
 Wed, 09 Dec 2020 00:51:41 -0800 (PST)
MIME-Version: 1.0
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <0080d492-2f07-d1c6-d18c-73d4204a5d40@metux.net>
 <CACRpkdb4R4yHcUV2KbGEC_RkU+QmH6Xg7X+qee8sEa9TURGr8A@mail.gmail.com>
 <51d3efb7-b7eb-83d7-673a-308dd51616d3@metux.net>
In-Reply-To: <51d3efb7-b7eb-83d7-673a-308dd51616d3@metux.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Dec 2020 09:51:30 +0100
Message-ID: <CACRpkdbqVoT56H88hoZwDqV0kW_8XTaE5TkMQsg-RRrPqgF=cQ@mail.gmail.com>
Subject: Re: Howto listen to/handle gpio state changes ? Re: [PATCH v2 2/2]
 drivers: gpio: add virtio-gpio guest driver
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_035145_977313_CB9E8CB4 
X-CRM114-Status: GOOD (  13.08  )
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv@lists.infradead.org, "Enrico Weigelt,
 metux IT consult" <info@metux.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Dec 8, 2020 at 3:07 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:

> I've been looking for some more direct notification callback for gpio
> consumers: here the consumer would register itself as a listener on
> some gpio_desc and called back when something changes (with data what
> exactly changed, eg. "gpio #3 input switched to high").
>
> Seems we currently just have the indirect path via interrupts.

I don't know how indirect it is, it seems pretty direct to me. The subsystem
was designed in response to how the hardware in front of the developers
worked.

So far we have had:
- Cascaded interrupts
- Dedicated (hieararchical) interrupts
- Message Signalled Interrupts

And if you now bring something else to the show then it's not like the
subsystem was designed for some abstract quality such as
generic notification of events that occurred, all practical instances
have been around actual IRQs and that is why it is using
struct irq_chip.

What we need to understand is if your new usecase is an outlier
so it is simplest modeled by a "mock" irq_chip or we have to design
something new altogether like notifications on changes. I suspect
irq_chip would be best because all drivers using GPIOs for interrupts
are expecting interrupts, and it would be an enormous task to
change them all and really annoying to create a new mechanism
on the side.

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
