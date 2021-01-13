Return-Path: <SRS0=HZsE=GQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F70C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jan 2021 21:19:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 262342085B
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jan 2021 21:19:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 262342085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ndsL02GRxMwXwBJlc9J/XFDYN8IEmXWJ5vtiBxt/1UY=; b=YiGUVhLv1gFkk+XSp2gM+psaN
	jSpBoRoTEWJQ7xhZzAyuBPLQdjM4/U2XIF1ZXH9lrckJqYKT4T/Ouyr+vdtclTNNLOYW0CCKp3+eU
	vR015mEw8GLejF9rAXEMP2ttl3lbV2JjsbDls6dBsm5Yy9u8kheoXhTQYkdQphBEiLTjQFxxYgb95
	3qbgUY5zsW7A5Jb5hbs6F7uiIUkxp4Q/oxhAA7ZQ5Vmz4jc50jL5iPl+dBvS+L0ZkbX9+mzGlSZ/F
	kgblphwk+1QRCXmuNKE7ocK8vDZTyVkHcEPUwYPDzTeTF8KHK0bMPE9PUFJcl197dn0vehJUWvZZk
	QXeWEqwng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kznXf-0001cB-15; Wed, 13 Jan 2021 21:18:59 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kznXc-0001bO-SJ
 for linux-riscv@lists.infradead.org; Wed, 13 Jan 2021 21:18:57 +0000
Received: by mail-io1-xd33.google.com with SMTP id n4so6984640iow.12
 for <linux-riscv@lists.infradead.org>; Wed, 13 Jan 2021 13:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=waKFB6GA285XYUzcTHakGiSixKq0KiGmEsssFeV+HcU=;
 b=sLyqmIMRtrDEpgd8hUYcKomPDvhR+5TKSM3xSuMxE1yaABj65Ejhp1BW087419h1v9
 WvSK79Qy/raS7f9ZfX7ael3Cz+N9O3Rm4+kWx+YCSpAsPy192B3T8oVwgvtrec8C1SvB
 aLITPpj6S36tS9OjS+eKkCw4CqO5HuE4l1xk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=waKFB6GA285XYUzcTHakGiSixKq0KiGmEsssFeV+HcU=;
 b=GzOarwQCgUT9U7TpXhE2e2mzyNeghMlTPEa0NpTATx5p+Hx+elP/64VrJKdjVJ7Gv9
 gMbf2O16mpmtpg1r/oX1WEhlcK24h/VjerAjDSuaJ3l99IlcpAoT98IjmrjXarH1xW/v
 dTdjc1K9YsHTX7Vk4sbaIC+wKYMAMV4vBJBK8RFh/1m5AdIm0tcJOUpYNM6vZYX2sTP0
 Zte4qUMlkgHC5COHzvyv/mVa/btC9U2NzzJsEgS3b6eZD0Yo7HfhwCoWY/14ByaLHqkf
 jQMybfO4wSUAD76dg6YsXWjp1bT14FAy17mq16K2B5U9Vh/ot01ZFcHfom6W1rfRSq8D
 lXxA==
X-Gm-Message-State: AOAM532gHU9rFK3PmZzb24E02Mo84KI4pSr11yEiV/GsELBJ/N3F9kr0
 FjUF/oiaztWrS67Vr503hSaX9TJuiJ3GQ9KED7cGiMt0KK0l
X-Google-Smtp-Source: ABdhPJzcOw9ELCFFc+UjCHiDGLDJPL5C9xFcpdHO8eQtmR2Op7+cWnQtw3digyxcPbPIWYeegTg7/ViEgnjauEor8RY=
X-Received: by 2002:a05:6e02:1608:: with SMTP id
 t8mr4103304ilu.79.1610572734186; 
 Wed, 13 Jan 2021 13:18:54 -0800 (PST)
MIME-Version: 1.0
References: <mvmk0ssu8yi.fsf@suse.de>
 <CAOnJCU+JmDaU1f3hAbyjR4__TVHJbjnZZ8th25i5Q-et_UxXeg@mail.gmail.com>
 <87pn2958oq.fsf@igel.home>
In-Reply-To: <87pn2958oq.fsf@igel.home>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 13 Jan 2021 13:18:43 -0800
Message-ID: <CAOnJCULc7PVkuA9uOzb4VDgtedGm2tNzg=hYDyGKAGNX0umn+w@mail.gmail.com>
Subject: Re: EFI booting crashes
To: Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_161857_069520_C2D02CA8 
X-CRM114-Status: GOOD (  11.35  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 13, 2021 at 4:21 AM Andreas Schwab <schwab@suse.de> wrote:
>
> On Jan 04 2021, Atish Patra wrote:
>
> > I just tested them with 5.11-rc2 with bootefi command from U-Boot on
> > Qemu. I booted both busybox and a Fedora image.
>
> What happens if you enable CONFIG_INTEGRITY_PLATFORM_KEYRING?
>

Ahh that enables LOAD_UEFI_KEYS which is not tested at all. I am not
surprised if something fell through cracks. I am looking into it.

> Andreas.
>
> --
> Andreas Schwab, SUSE Labs, schwab@suse.de
> GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
> "And now for something completely different."



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
