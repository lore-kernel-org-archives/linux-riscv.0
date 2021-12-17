Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34ACC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 08:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AMnPHKtG5gF5me2Pl/AJ3jlhsuelqnORH1JUc+6knZs=; b=Dn3LXrIhvBJJqn
	Pzkimv3DXcwUMwt5tKI1S9sC0cb86MJ5BXfrHV7HpNQ74yit/bnk1DcEebrx2CubJfNm7pd2JHT7Z
	008kXNmG7PCnNlHG1YqlIX90zw+g0fPxAXgWgtU1WlK+5uruU9U+abF8MmfLNc/HDHGR2XDz7UIse
	/126MnLmCdWlDwuytLjp5HPOz55niAxvp2WloADbapRqmkZzDn1VBL1GF8tmnkLSFbFbFM2HgC2Er
	Z1B6Ti90M/o2iM5XOhtMhvkZQ0FXDB8/GxWCwpN/et5t3r222VwFrUwrRv/QJk6hFrT+dat4/409S
	u5/w7iCTFt2/B9eYGjEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my8Cf-008xS6-GD; Fri, 17 Dec 2021 08:02:57 +0000
Received: from mail-ua1-f47.google.com ([209.85.222.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my8CY-008xQa-Bd
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 08:02:51 +0000
Received: by mail-ua1-f47.google.com with SMTP id 30so2770205uag.13
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 00:02:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fx7tWOtL8mG5j0QcSY4U9yZmw2gjvIvwXDDbEmQGZfE=;
 b=OoIga8kywuqxx5iAmnyS1BwL1yQAKQtWKsvZM8sWwOx26yRrj7S27A3E/YLSj/NE4T
 xaXSnBmQVfd7ecDbGlBiZfE+raNVb4CTqQasZQ4Nrovkz8WSY9dCWey1zhFKXgUmhwpd
 6DBsX1nb8uVGCQ6hh+nwjpoKIFyWTnx7JGYnN9XPXbdldKt1H/p3Ly9mPf1bgKjBdHFE
 fm5kyMrx09jJFOoCojkRld7N8mTTRmx9vYcNNop40z0NgDetdd/MllQvvriKagP/aAI8
 aRwZwrhllnn0NZLQOW5+21wYkhJWnY3Xu7Pci4N0KmTO/Il7D7ASzVhU8H/hkC6HkM7L
 1rug==
X-Gm-Message-State: AOAM531dWmPi9L3SLd9I4RnfmcI5vW5fe1uwiD3MYC2UqK1ePqB3L1CR
 7gDgDYS8lYV5TNRg+WF5ZSUDc86hzLraKg==
X-Google-Smtp-Source: ABdhPJwp7e97ONPY1ERIudgqNU/99Sr8NgW/BW8CKjHVfpKfrUj4AOnAeWTVfUHLpUDFgN9dKs3GmQ==
X-Received: by 2002:a67:31c9:: with SMTP id x192mr530336vsx.63.1639728168017; 
 Fri, 17 Dec 2021 00:02:48 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com.
 [209.85.222.47])
 by smtp.gmail.com with ESMTPSA id x9sm1866902vkn.36.2021.12.17.00.02.47
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 00:02:47 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id o1so2878194uap.4
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 00:02:47 -0800 (PST)
X-Received: by 2002:a05:6102:c89:: with SMTP id f9mr552893vst.68.1639728167350; 
 Fri, 17 Dec 2021 00:02:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639661878.git.geert@linux-m68k.org>
 <Ybuvg3h+VLCMji4J@robh.at.kernel.org>
In-Reply-To: <Ybuvg3h+VLCMji4J@robh.at.kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Dec 2021 09:02:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVzknbzS6wL2=e1RGHB69fGDZM_C8R61aDz29PNmr5bAg@mail.gmail.com>
Message-ID: <CAMuHMdVzknbzS6wL2=e1RGHB69fGDZM_C8R61aDz29PNmr5bAg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] dt-bindings: interrupt-controller: sifive,plic:
 Miscellaneous improvements
To: Rob Herring <robh@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Marc Zyngier <maz@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_000250_431088_779A8C28 
X-CRM114-Status: GOOD (  19.21  )
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

Hi Rob,

On Thu, Dec 16, 2021 at 10:28 PM Rob Herring <robh@kernel.org> wrote:
> On Thu, Dec 16, 2021 at 02:41:20PM +0100, Geert Uytterhoeven wrote:
> > This patch series contains two improvements for the SiFive PLIC DT
> > bindings.
>
> Lore is thoroughly confused with this and several other series. It seems
> to be doing subject matching and pretty loosely.

My apologies, that's purely due to a silly mistake on my side.
I sent out 3 patch series without noticing I still had two cover
letters from previous "b4 am" sessions in my working dir, so they
were mailed out as part of the series, too :-(

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
