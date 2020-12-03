Return-Path: <SRS0=jyWZ=FH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE919C4361A
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 22:35:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61D6B2231F
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 22:35:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61D6B2231F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a2NToYDqXD72+Va2Qy9XzHQw4sa+QUuakpUE1dKmKL4=; b=S/siFtCz/2sNr5A2eP6NOXMNn
	Wp/bxzdmMYAkg49+E0RmeucmsoyqCKgpwa7ExP2Xn9syLY8ov6DnDML53eA1D3q8+XVsywYThEBiZ
	GRuRI6im8IFCMPb4nZNovIJoDPlT07Q2Ivaj/5o/EYXmtOylIj4C1n9YXHH1wmiX1wZQOXY5uchw3
	P+SIPlqj6xrWp4iGacdtmZrYjGeR0gSDb1w7m1X9O8Z6DgTbwNUwMReZUME+uxveg1yvdGPTfyPl1
	uypJYlTGHIKXjZVcEk2oZRed+gMM7msifA8k7N0vdKY5CxCtzFcRBIDF3T4xRhtRKlJPIUb8pIo3I
	PjFUkJ8gQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkxBv-0005s2-2j; Thu, 03 Dec 2020 22:35:11 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkxBs-0005rb-Dv
 for linux-riscv@lists.infradead.org; Thu, 03 Dec 2020 22:35:09 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 8C7D422EE3;
 Thu,  3 Dec 2020 23:35:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1607034902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ApfT7BqS8VKiR7VF/My//B2mRx4iTy2qjCIfLunfdUw=;
 b=efhjip1akBRMhoA4AZ1iYwiyRFfTJ2jJZXPUNttZ+SWLTGrw1BybFcWmKR9LYhPYB3BxZq
 PKcwhY0GcDIueAwovbzzjFXM3v3ToOSQ23lRvauplrzDcC04LtmYZMeEV7IXXBOoeuJ0to
 +1YObOy0QhiBdvpqOUv8GPFrVarMmV8=
MIME-Version: 1.0
Date: Thu, 03 Dec 2020 23:35:02 +0100
From: Michael Walle <michael@walle.cc>
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH] drivers: gpio: add virtio-gpio guest driver
In-Reply-To: <f14c0197-b346-7af5-9dd0-9b8018baaeaf@metux.net>
References: <20201127183003.2849-1-info@metux.net>
 <CAMpxmJXJLTzM20xLCoM4spjibXbA-FfdPmOBp1QcV+9cScNNMw@mail.gmail.com>
 <f14c0197-b346-7af5-9dd0-9b8018baaeaf@metux.net>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <b287f185d554b5a87b82ea8ca79cb5a2@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_173508_612979_39CFF963 
X-CRM114-Status: UNSURE (   8.72  )
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, virtualization@lists.linux-foundation.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-gpio <linux-gpio@vger.kernel.org>, linux-riscv@lists.infradead.org,
 "Enrico Weigelt, metux
 IT consult" <info@metux.net>, Linus Walleij <linus.walleij@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am 2020-12-03 20:00, schrieb Enrico Weigelt, metux IT consult:
> On 02.12.20 15:15, Bartosz Golaszewski wrote:
>>> +               bufwalk = name_buffer;
>>> +
>>> +               while (idx < priv->num_gpios &&
>>> +                      bufwalk < (name_buffer+cf.names_size)) {
>>> +                       gpio_names[idx] = (strlen(bufwalk) ? bufwalk 
>>> : NULL);
>>> +                       bufwalk += strlen(bufwalk)+1;
>>> +                       idx++;
>> 
>> 
>> Something's wrong with indentation here.
> 
> i dont think so: the "bufwalk ..." line belongs to the while expression
> and is right under the "idx", as it should be. I didn't want to break 
> up
> at the "<" operator. shall i do this instead ?

Or don't break the lines at all. Both lines don't add up to more than 
100 chars,
right?

-michael

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
