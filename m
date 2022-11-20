Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F52C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Nov 2022 18:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=11tWDSu8doVxUU1V0kTwn52Y7ofdmjkfz2eMMmBp2iA=; b=F/MWRcE0FAttgf
	bDZElZd7Bhfiv4c9sKA9qInhjKfeF7/i2Bqs77kJBBgvTpJ/0IKge61cy8F+Ey9EJHqKvfeUdRJm8
	mWmgjTBn6Bizoq037aTTWFxYr06vJahpvhdh2pxVJredO24t3L/8s0BlTt8u2k5CUnW5honsZIIuJ
	eXFSu1/AToe9NoC/yaMNhDMQlrkLzmqzz6IOP+Az+rYqZ0N0JKR7Szvox3QWGRP/C9Odmh3xn9ybo
	C2wAQcT7hR6rctaKhwzJ9Zs3ZU4PY5IaQaQ9os8j3zktnohP1aAoG4rELkknjgNik6cKBod9UqYrM
	ll56RQu5nKANSFHUWG1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owp8o-006ENZ-N2; Sun, 20 Nov 2022 18:34:06 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owp8l-006EJW-9C
	for linux-riscv@lists.infradead.org; Sun, 20 Nov 2022 18:34:05 +0000
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EFBFE3F133
	for <linux-riscv@lists.infradead.org>; Sun, 20 Nov 2022 18:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1668969239;
	bh=dG5PIPBE2GHp36S+UZp6jaADUVR1TUqcHiS7ewQr4PU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=SbWXCInKdDQssy1xUZsYmVFeMLi8G1MJ1Tnt3QF+bkLi12zm0K9k1uXNEJx93Z9I0
	 S1QQ9p03/vdTlqf5Yykkz5oG77gg+HO41T0bihYgM2pcJVac6gGm7zkHvv03Nz2BzI
	 FvmzO8hcJZ4R+onAfZwDavoHaKuPE3+o2Luk7yU334IVAQZvYGronVj9ZiAgscEQqC
	 Ej5w6U6G31Fus+FwFIj8JQgAGhjlX0H/l5pkQBm6m1vOob/TdPRy7xa6xeU4BRd9Bm
	 41wRTEr3f04XGWUh7IbN+2MsGbIrKVO/a1Ry6rH9A2oMwjFxrOcqIVM/kEnqEsa+B0
	 ypAfl8eWtxcOA==
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-393c38f7bcfso74139557b3.5
        for <linux-riscv@lists.infradead.org>; Sun, 20 Nov 2022 10:33:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dG5PIPBE2GHp36S+UZp6jaADUVR1TUqcHiS7ewQr4PU=;
        b=OohAb1IrwBLGTutQWhgx6BCKJwX0KS9GugkZsbol+kVwALseJJmiNLtEC5almNDfkN
         eYYpHhIxHdUyNLwhrvhzLiOfd/8ZMjFpwolYMRgMga7OkW9U+dMaAHnRfxq6JksW4QA7
         UyQ6Ux/guDXZr35Izkr8kDaW9RCh3t5NcHi3PqXqmZ65ep4zyF8W7K76aW69Ru4sdCNW
         gDgRQRCFgz0oJBVNETPxYbiy0rR9SQbnsKIwbeQZ7NlF/2dj4gwafspUXXmfFIDv/6ri
         YQwJRl4m2U9Dq9ACbrCAlA9iW5dGgOJC82KiQqPH7KMzu3REgbbvuHXV+KZa8+HCUk2U
         Lc/w==
X-Gm-Message-State: ANoB5pmRFwSR5kybH3zPTJ36zF2Gh9FCR4MLLVKUKMr29+3FENsS/n1U
	kORzuBhJ8kfj/NgW+ex17/4q+KBl39hEnn6WHIgv1cl8G5HdgZkoOM+G925PSYm+jf/3aL1gRA5
	RyViNUyKybl6JArt1R2l0hgChBoHvXtrrXF6ZuZtIUa5FXgSjqwrEMYTy1eqfBw==
X-Received: by 2002:a25:ce45:0:b0:6de:39c1:9cb3 with SMTP id x66-20020a25ce45000000b006de39c19cb3mr4557858ybe.469.1668969238858;
        Sun, 20 Nov 2022 10:33:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7D5wi+VzurwIIfkrVA4oYQhDY3qKyG8JzAj9UB/Ym70XQ6dHirKxuyiYefeUUYc4HmKc2qyRnz8/hamiUIt4E=
X-Received: by 2002:a25:ce45:0:b0:6de:39c1:9cb3 with SMTP id
 x66-20020a25ce45000000b006de39c19cb3mr4557849ybe.469.1668969238637; Sun, 20
 Nov 2022 10:33:58 -0800 (PST)
MIME-Version: 1.0
References: <20221120082114.3030-1-jszhang@kernel.org> <20221120082114.3030-6-jszhang@kernel.org>
 <CAJM55Z_f=zp3Z=wno_yr7csAUMQ472RiZXD19CrDTTxmGAmU4w@mail.gmail.com> <Y3ppF88SuYAPOjbU@spud>
In-Reply-To: <Y3ppF88SuYAPOjbU@spud>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Sun, 20 Nov 2022 19:33:42 +0100
Message-ID: <CAJM55Z95sJzn0zQJF5pGQkeMWTRj8FLyO6i+52idJ4ZMLOT5tg@mail.gmail.com>
Subject: Re: [PATCH 5/7] riscv: dts: bouffalolab: add the bl808 SoC base
 device tree
To: Conor Dooley <conor@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_103403_812465_E2B7E8E8 
X-CRM114-Status: GOOD (  14.76  )
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

On Sun, 20 Nov 2022 at 18:51, Conor Dooley <conor@kernel.org> wrote:
>
> On Sun, Nov 20, 2022 at 03:57:17PM +0100, Emil Renner Berthing wrote:
> > On Sun, 20 Nov 2022 at 09:32, Jisheng Zhang <jszhang@kernel.org> wrote:
> > >
> > > Add a baisc dtsi for the bouffalolab bl808 SoC.
>
> > > +       xtal: xtal-clk {
> > > +               compatible = "fixed-clock";
> > > +               clock-frequency = <40000000>;
> >
> > This was discussed many times before, but I think the conclusion was
> > that the frequency is a property of the crystal on the board, so this
> > should be 0 in the SoC dtsi, and then overwritten in the board device
> > tree.
>
> Or set nothing in soc.dtsi so that dtbs_check can be used to see if
> someone forgot to set a clock for their board?

Sure. That sounds even better.

> > > +               clock-output-names = "xtal";
> > > +               #clock-cells = <0>;
> > > +       };
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
