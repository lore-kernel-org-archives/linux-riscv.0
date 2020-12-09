Return-Path: <SRS0=PU6a=FN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85716C4361B
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 11:19:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37199233A1
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 11:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37199233A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=creKJjhgai6zz1/aALb0lMFfAfA2f9knjF+qV29i3gg=; b=LLkufVHRGb7msGW4ftSQFhOBW
	Oxtt2zun+YXH8B7g7r9wb6H1Z6Vi0IHav1UEeib0FNZZEvdG2Ql4PyIUv3HOGJ6BUd+LF/onfttWE
	UkCsUPUtTQd3a9s81L3dODlpnasdEvx67+DxDE3Gh3lOE2yRDL5WBq7FJJ9DzSLoAU1Usz3hgQX3V
	qYFIoqbSZPwl3SnbWsUr4PypTdYe7IKmXzghcH8Y/EXSLTfJiISzfUeAepHC+DqKQA71y7ZyltK/Z
	AHajG+ro3FZWPn1beGEtTfwt9JipMssk/2PUSaZtoOHCrCGc7QaIla3/+zfvU58sWm6QG9GXu5kO9
	Zq9vugu8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmxVI-0006mD-UX; Wed, 09 Dec 2020 11:19:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmxVH-0006lo-Lr
 for linux-riscv@lists.infradead.org; Wed, 09 Dec 2020 11:19:28 +0000
X-Gm-Message-State: AOAM532ETgqcNpV4z7D+jxoEM8Hvr7VWnDppYtzMTuoSWqBOy8yLGIyk
 ie2Gmii4t1rUeEpZH0aMKdo5Vnajdzk9L9JK7q4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607512766;
 bh=U8CiCE+927eWk1WjnrHEeDDVKhi+XWJxlcOhS4QhpHE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CZbfYp5eMW4vCNbBV9SJiILwyOwti8/kZsAVsYvK2NDemL3iD6lIVzx6OIJEzAsWN
 K7x05Wm2fieBTM1ho1osVEiUn4PDp5UA/CU+Z08ZXp4Zz0dKo11UaIjzG6QhQ0V8kk
 PtKS7Mx+K8wZf/TTtpqjFwiyKbSmLsa5ATNjqokNb/UtL8Te498LaiXp/3Sv+J7B0+
 fEyxHwC6s2/HAlh66Tv3eglhNIQdcjWYfLF610MdIfaY8OjsdW/JTUqSY3wvAtnGAl
 7QogIuRU22jLlxkLW6zhhTRccEomhcXrCKo8BJhDFfjA3QRJ48x00BzLy2atC0/7rv
 gm5xle3EZOSYA==
X-Google-Smtp-Source: ABdhPJy+RZN5YZE70pJEXGADA4yibSdAI8aJxjowtgSH9QR1iHKhytI8wUUYsRy7Qa7sG+nxaBUGbjy4r0F/blrkE+c=
X-Received: by 2002:a9d:6317:: with SMTP id q23mr1277831otk.251.1607512765731; 
 Wed, 09 Dec 2020 03:19:25 -0800 (PST)
MIME-Version: 1.0
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <0080d492-2f07-d1c6-d18c-73d4204a5d40@metux.net>
 <CACRpkdb4R4yHcUV2KbGEC_RkU+QmH6Xg7X+qee8sEa9TURGr8A@mail.gmail.com>
 <51d3efb7-b7eb-83d7-673a-308dd51616d3@metux.net>
 <CACRpkdbqVoT56H88hoZwDqV0kW_8XTaE5TkMQsg-RRrPqgF=cQ@mail.gmail.com>
In-Reply-To: <CACRpkdbqVoT56H88hoZwDqV0kW_8XTaE5TkMQsg-RRrPqgF=cQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 9 Dec 2020 12:19:09 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1PRQGUXkjdSmqxXSONX_ZoCgsfx8hJBUdBUk14tyzErA@mail.gmail.com>
Message-ID: <CAK8P3a1PRQGUXkjdSmqxXSONX_ZoCgsfx8hJBUdBUk14tyzErA@mail.gmail.com>
Subject: Re: Howto listen to/handle gpio state changes ? Re: [PATCH v2 2/2]
 drivers: gpio: add virtio-gpio guest driver
To: Linus Walleij <linus.walleij@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_061927_793630_FD1021AC 
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Jason Wang <jasowang@redhat.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, "Enrico Weigelt,
 metux IT consult" <lkml@metux.net>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, "Enrico Weigelt,
 metux IT consult" <info@metux.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Dec 9, 2020 at 9:51 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Dec 8, 2020 at 3:07 PM Enrico Weigelt, metux IT consult <lkml@metux.net> wrote:

> What we need to understand is if your new usecase is an outlier
> so it is simplest modeled by a "mock" irq_chip or we have to design
> something new altogether like notifications on changes. I suspect
> irq_chip would be best because all drivers using GPIOs for interrupts
> are expecting interrupts, and it would be an enormous task to
> change them all and really annoying to create a new mechanism
> on the side.

I would expect the platform abstraction to actually be close enough
to a chained irqchip that it actually works: the notification should
come in via vring_interrupt(), which is a normal interrupt handler
that calls vq->vq.callback(), calling generic_handle_irq() (and
possibly chained_irq_enter()/chained_irq_exit() around it) like the
other gpio drivers do should just work here I think, and if it did
not, then I would expect this to be just a bug in the driver rather
than something missing in the gpio framework.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
