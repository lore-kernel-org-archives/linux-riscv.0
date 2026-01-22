Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3488C44500
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 08:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zMO+yrjRxLQPMmWztar+XP+Gx1c04hUKAO81uXL2mxo=; b=ADgZhNz32+mYE5
	2U24Vpb44jo+kNbZTBU+uvLbjL4wqO6J0uma/EZriIway4nLCUEvt2K3usEiraapjSwHlUUms+IgB
	+WcilKtoB3kL1rGpavKD45OvicKnFuvyGtvt0TIga5RvFpyjvxlGABf6j9aLJD7MBOhD106KLG6GM
	PUXxOZZJB/PJmD2kOHC45TOZTDiPqz3jCf+hV18fVwKN0crTC4iryNootn+HCtK4tEfrUAT4oNYHY
	ybNXyzHuzDiUfrhCb5qWzJ/pS7MkedN2n2YK1d3+DSv/SL8N2PY3r2IXtFHMecKzhg6Qj1uK8DpWe
	ynhDLzCpGkp9C5Jys1ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipiV-00000006cq6-3P2P;
	Thu, 22 Jan 2026 08:06:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipiR-00000006cpg-3ybt
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 08:06:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769069212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xnAUpn2svZoy/oq95lU8MjW2YyOALbOwRLuDG6KCbUY=;
	b=SkrotNcnJ7C/ROyMmdelAZTl8O6wSBcYq4IYukNHUKKtT6KtIqa0QY4HSBZine7RrBXwND
	iO7cCedLtZyrBn0ZatAclfoTXAZ+yUGINUlnRMNFjh0Xod/PhzEMeoHVth60YfqxR+22sp
	xduvvPNiftkLbvjEJa+SIZRzJvN6TYs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-d3b12X80OPqdbcCopmcp-g-1; Thu, 22 Jan 2026 03:06:51 -0500
X-MC-Unique: d3b12X80OPqdbcCopmcp-g-1
X-Mimecast-MFC-AGG-ID: d3b12X80OPqdbcCopmcp-g_1769069210
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-47d5bd981c8so5023765e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 00:06:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769069210; x=1769674010;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xnAUpn2svZoy/oq95lU8MjW2YyOALbOwRLuDG6KCbUY=;
        b=mrQjeC0b0BGy9L0knIL9VIMHTxp1Xo/yaMZk9HH5mV9wBG3T0kIRzmN1zCXsHqqLGl
         Z6+HrpchQnOGCwC0xUVXbXei0xH9v+RMtfMHVb3CGI+z/DSbgCMnIV6At+0MHqr1Xoq+
         CDZbJ16+umC273mMmaJj8SI1udoN8ARyEOP9bbFU0tAW6AnS3wjwH1UOn/bu08csO5iV
         kR9SO4oPyW+z634dUOT0S97sWA0aLrUSniO2eeoFQLf8UymE5D//51FdPULS9XKNNuhJ
         zDP+7xYQTquZOTYhvJHzlc4S13aAL+oMlkfCXyAuHSviEFSSbRZx4Svp9vKDLBYplNcd
         vkww==
X-Forwarded-Encrypted: i=1; AJvYcCUXUFuXWodKDxD/24QxdtjtEf4pC7gl1YKol9W6b0L5Srh+JqlSVKvacOUgzrcGiVHX3mJFkvfhFJjntg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRRrHiEC7Gn1MVsT7x7JtQgPLZMa3HcPCaFwQt3I7mUOgR2iNz
	50nWn7Nwkbz+4OinPrFGo+nswjeHS8ulOw5OfmP8K+3EBMWeOZH5y4V+QzQoeJvSAK3K+Dr6qr9
	8ACbpdMgE5VPMc/RePSk4lnACGCiML6hVVK+P4NHkDtY5Vwn5U9/JGmueI9oF/V9S5JUUQA==
X-Gm-Gg: AZuq6aLlX1C98Cc/9Q1pwEVfQqPGFH/XjAirgi4pKYSzP2WJWSH9DI+OBPc+X6iUEB5
	a6Nzj7GIfIsVk6revusDrFVKncG73t8x2OlI4Id9hZMkqT1GAxlV3b+Hz/v/Ho5bLQ5Ridi3knm
	RE5tqJ1qtsvSRiBAv24hOSsBol6KKp8rH7bcrV5ZV4e/Eosjl7koVxYYAiJHxS8swTWJ0kFi3UO
	T3u1ycXKLcHJskqeQSkhglC7mukZ5F2mfhgpDpoSwaidDTT2JLVqIjXPqEn5tJcBOWT9pYXL49Y
	fsTuRrqbYYhwgM1DLzntYZa69fvWodjqtx3cKnAERDsxNraM75HcJYMLMy6lO4aHtUdkpkBpyfG
	SB1vXDLAQFwYa7rtt1ptqUBp5gOS/vzzL4v8Pxe0Nryn29fPTwEk/XHbVYtNwcjibMRtY
X-Received: by 2002:a05:600c:46ce:b0:477:7b16:5f9f with SMTP id 5b1f17b1804b1-4801eb0efe0mr306255055e9.31.1769069209716;
        Thu, 22 Jan 2026 00:06:49 -0800 (PST)
X-Received: by 2002:a05:600c:46ce:b0:477:7b16:5f9f with SMTP id 5b1f17b1804b1-4801eb0efe0mr306254515e9.31.1769069209274;
        Thu, 22 Jan 2026 00:06:49 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48042c38063sm44525215e9.12.2026.01.22.00.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 00:06:48 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Yixun Lan <dlan@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Troy
 Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>, Alex Elder <elder@riscstar.com>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] i2c: spacemit: drop IRQF_ONESHOT flag from IRQ request
In-Reply-To: <20260122-05-k1-i2c-irq-v1-1-9b8d94bbcd22@kernel.org>
References: <20260122-05-k1-i2c-irq-v1-1-9b8d94bbcd22@kernel.org>
Date: Thu, 22 Jan 2026 09:06:47 +0100
Message-ID: <87tswedqaw.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZxzUpDwomU76f14iXUqf8XtsI_jDTpGtGTNL4O7Iygo_1769069210
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_000656_060071_9C584E80 
X-CRM114-Status: UNSURE (   7.37  )
X-CRM114-Notice: Please train this message.
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

Yixun Lan <dlan@kernel.org> writes:

> In commit aef30c8d569c ("genirq: Warn about using IRQF_ONESHOT without a
> threaded handler")[1], it will check IRQF_ONESHOT flag in IRQ request,
> and gives a warning if there is no threaded handler. Drop this flag to
> fix this warning.
>
> Link: https://lore.kernel.org/r/20260112134013.eQWyReHR@linutronix.de/ [1]
> Fixes: 5ea558473fa3 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
