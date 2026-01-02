Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFCFFA3739
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jan 2026 12:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	References:MIME-Version:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=umhyswmOLObkb6lYnyoeFsIxHnHx0ELLUhw+wACqtlc=; b=fh5eiYBUyYr6PG5ivJZ7HU+PqZ
	6HhneFAGfCGCdgkPVTUSbKytsbUabJ6zVSqcAfxBBhqGJQwZmCAmkmxUq0UJiVDrAaB26WGq9ZXkk
	JIvZJrX3SX8eXDBTw/4C87mUKkt83+kws14nD3GYutGcEOfsfJMJgTVexbqIVML9ePRipQXcW57ze
	nG4JhAxExjuupY+Lu0JWAFRgwY4aP9UV8j3qT66VA5ShgNBmMXDk5FB3uo2lPT2olGKPcfc9ELaqw
	vQRUbQe6fOXwdXD7Vj7KocosjrO7keWdEZcLk2qn+1IQ55H5zLHKPwNpqw/10jLHVtVoFeiA+jWQY
	jRZLXerA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbdtR-00000008AeZ-0Pf9;
	Fri, 02 Jan 2026 12:04:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbdtP-00000008AeQ-2cky
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jan 2026 12:04:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B801260126
	for <linux-riscv@lists.infradead.org>; Fri,  2 Jan 2026 12:04:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6708FC116C6
	for <linux-riscv@lists.infradead.org>; Fri,  2 Jan 2026 12:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767355470;
	bh=59k3WvNfbtsHGqp3wrH4jG/zkpNkZY4RPujBPr3N4Ec=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=SfnBg3z6JXiRoZflPmOVGUHFuruFYuiE+zkZrLeS0AEQTeec4jgW+4ZJJziClTTQE
	 tXZ8fJVnTWbUb/KXHS+l5x8LEQF5LKb9u5iQRQqZgLXMtp7cyTk8GQKj6+Phfmy1wA
	 2Lx0oLJf4/0Cd//JpD7TwLulUvSEWolWSBZJMFveLSX30K5lfjQ2fIoIVgW/ToD3NX
	 UMeVez8z4WOgOi7b3n/tFCiRsH0y+xZr3Sap6cH0I+19WMv7KyWW9eJMHjq9Xnr/V4
	 bVxKz8oG+2sJVFGs1VETgutBH2D8fJlYRWeUwSQpbQPxhBG80r2sYtRPNnntR7wyrf
	 9DFt5+7ZqJh2A==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-37cd7f9de7cso101092751fa.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Jan 2026 04:04:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUkjDWiY4eTGu2uICnaCkOcMrH0TMw9TjFC8uNbsJP+OXRZ4V1YgY4mX9lQTWwFEyOxaoxEOU1T627dNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi1QaAGVve3Q/Zc33S/4OKrxDRYFko6WbAuPZIhL1ZhYyzN9j3
	WNSI1VDcik98/TsPU2FRhJO0tR97qSgXnn8kNInqgmOCBrKJTr1SGy3ZGr4Sedex6JHsYk6WPeJ
	ZYtJKbCDWz/l1XTw5KtKaM8sbb38bG1kr3kmzTxfnAg==
X-Google-Smtp-Source: AGHT+IFUiX6/gBsxHBbe8XiBBJNLN4AHx3ry+rnXue2rQrXSZAdwUQSv/gaC9bW4w7uNTZPy0KYDhnlDKOZnmPqAmek=
X-Received: by 2002:a05:651c:241:b0:37a:84e5:a1cc with SMTP id
 38308e7fff4ca-381216b59b9mr125204291fa.22.1767355469012; Fri, 02 Jan 2026
 04:04:29 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Jan 2026 12:04:27 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Jan 2026 12:04:27 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260102113643-GYA2060252@gentoo.org>
MIME-Version: 1.0
References: <20251229-02-k3-gpio-v1-0-269e76785abb@gentoo.org>
 <20251229-02-k3-gpio-v1-2-269e76785abb@gentoo.org> <CAMRc=MfHzP+xm-uX+jad5gPOGDpR23O6mB+xcSvF6ZiZfnxQjg@mail.gmail.com>
 <20260102113643-GYA2060252@gentoo.org>
Date: Fri, 2 Jan 2026 12:04:27 +0000
X-Gmail-Original-Message-ID: <CAMRc=MeHbod4CaUX7aff_guK531dwyoYhqPOP0rP=i9ydAKmmg@mail.gmail.com>
X-Gm-Features: AQt7F2rbDr8PJDI60jTnbkM-CN_H7pZqQh59NrJ8eglG_7JODhy0DFRdFCZvpcI
Message-ID: <CAMRc=MeHbod4CaUX7aff_guK531dwyoYhqPOP0rP=i9ydAKmmg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: spacemit: Add GPIO support for K3 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
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

On Fri, 2 Jan 2026 12:36:43 +0100, Yixun Lan <dlan@gentoo.org> said:
>
>> >  static u32 spacemit_gpio_bank_index(struct spacemit_gpio_bank *gb)
>> >  {
>> >         return (u32)(gb - gb->sg->sgb);
>> > @@ -60,13 +70,14 @@ static u32 spacemit_gpio_bank_index(struct spacemit_gpio_bank *gb)
>> >  static irqreturn_t spacemit_gpio_irq_handler(int irq, void *dev_id)
>> >  {
>> >         struct spacemit_gpio_bank *gb = dev_id;
>> > +       struct spacemit_gpio *sg = gb->sg;
>> >         unsigned long pending;
>> >         u32 n, gedr;
>> >
>> > -       gedr = readl(gb->base + SPACEMIT_GEDR);
>> > +       gedr = readl(gb->base + to_spacemit_gpio_regs(sg)->gedr);
>>
>> Since you're already touching all these register accesses - can you
>> maybe provide dedicated wrapper functions around readl()/writel() and
>> avoid any file-wide changes in the future if anything requires further
>> modification?
>>
> can you elaborate a bit further on this?
> I don't get how a wrapper helper could help to avoid file-wide changes..
>

Just create functions called "spacemit_gpio_read/write()" that wrap the
readl()/writel() and its arguments.

Like:

static u32 spacemit_gpio_read(struct spacemit_gpio_bank *gb, unsigned long reg)
{
	return readl(gb->base + func_to_convert_reg_enum_to_offset(reg));
}

Looks cleaner at call sites even if it's a bit more complex. Just create an
array mapping the register enum to offset and assign it to platform data.

Bart

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
