Return-Path: <SRS0=XTRi=GV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 680A3C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 13:33:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1260321D93
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 13:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1260321D93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bSU49YW8qPCbToscgFcM/r+KK2Wf7+8SPPMoOWsbXUA=; b=mU7Xegzr78EyuYC1rCCyYwwwG
	p6GJqrBcrEvg4x1FA1ZblZfR6QugeidoSXrUQ+1xrxuy/oa8T4q+oJRgh5mdRd9kyS5G5Q1m64Rdn
	RVKBUyk4s2yf6j5N4K7FuSZenAEVIyfIHixLfmIoY0ioCfA6yvOprd3bR+aDbZnSwsUGUb9aaVL0R
	ix/gAhHCKHiF/p4tUPFPbXF3f8Rjfbh4v/Fo03qF3ab6ZGV6+zussFwTeN3RJBGsnXhX5zoIbqk6E
	+mbMkhUxBKEd+EJxXVonw7xL1H848MKvuFbiwjnt3x/YWIwlRopDZO8szw0ZXC2wYO66lUptYeAkx
	esjn5ydUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1Uem-0001gr-LD; Mon, 18 Jan 2021 13:33:20 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1Uek-0001g8-Pv
 for linux-riscv@lists.infradead.org; Mon, 18 Jan 2021 13:33:19 +0000
Received: by mail-ej1-x630.google.com with SMTP id g12so23710687ejf.8
 for <linux-riscv@lists.infradead.org>; Mon, 18 Jan 2021 05:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gpeJt4sFwqBjOrypvHBXhkahW36fR0StjLmTVgCtx60=;
 b=hDXxDkcaKc7QNbc330eLBN3cb3dfHrC+IXPmlM/8Py/JhfIlPFAZxIQKSIbwuW2O4w
 a4FAgystYnEPU62jeHwsnOV77tlhvsesS4V6/gTk1UUGjoefRmk6YImjixp6Gm8ukN/q
 h/Fko+ulgHMj6nqJAQLttZlsIMRG5wHnR4IK1l8CiPiIJjzV9b+bYyVDaMnXnXYKv8nI
 dAWjRidp+RY11T16qTQT/YCT5lPfKQZxSA3Emlc+gfCEzm4YQ7xRPsHHm5AXVRzLEnv+
 jIOZL6EnGbxbglqq00WoMynZCsR3iGkc7vqsgiklk+8hOTbvVQ6P2wxYQBJ0rAa4UDTt
 uoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gpeJt4sFwqBjOrypvHBXhkahW36fR0StjLmTVgCtx60=;
 b=HBTz31bOT3XE5tzgU1ZUvOIVnA02CRb6ewrIJ9mPu2Rzs6OgPopRuvOPgxJGQ8ZdCE
 yVjk5upluaI0yugyOhKZgCFL7Zh58E6R1qT60lXTo5uUK+CqOnUSTtk/zlLbKeYR/KQG
 cKwaBEI206WhW5B8ja4QDdoMTlsgo8rJ1ux3zErbhGWXyUhv7AWYyVXCMb2P/C4CffJI
 MK7iAwXK+8rr8eEYdP0g1HqY7Oy92d4E+LVVkXij+B1Hb5A/YMmVuBgmdE9UXHLJTiVl
 hK/pkq3RRawUOcBaUUYGJLPW5OckiV+LLTa2DZpNgCV5KYpJN9PyNN6txldeNFtW0/N7
 9J1Q==
X-Gm-Message-State: AOAM533B0N/SZbXPiTq4hJuTM7u2OdFcik47NJItIiJmdzMEL+e9x4F3
 7YZJ4lL04DneQDA18jx74ntQl8Rmu3aQe16+vM6+MA==
X-Google-Smtp-Source: ABdhPJwVX59jV33b/2juxlTLiEw7kRhKO1iEukLetuvO57JbX+1ydMf4Oy10iEUEc7vjhQI74tXtTpB5iSL87be58eE=
X-Received: by 2002:a17:906:388b:: with SMTP id
 q11mr4290515ejd.421.1610976797058; 
 Mon, 18 Jan 2021 05:33:17 -0800 (PST)
MIME-Version: 1.0
References: <20210112010307.200310-1-damien.lemoal@wdc.com>
In-Reply-To: <20210112010307.200310-1-damien.lemoal@wdc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Jan 2021 14:33:05 +0100
Message-ID: <CACRpkdbTazK7yLPVe79SoneD+tdiXv9GPvN29dSMgCZkf8Pjbg@mail.gmail.com>
Subject: Re: [PATCH v11 02/10] pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA
 driver
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_083319_002983_8D76E6A0 
X-CRM114-Status: UNSURE (   5.57  )
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
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Damien,

this looks all right to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Shall I apply just this one patch to the pinctrl tree?

I think the line that touches arch/*/Kconfig should be dropped
then, that better go to the SoC tree.

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
