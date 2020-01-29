Return-Path: <SRS0=idEI=3S=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC933C33CB2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 29 Jan 2020 10:02:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E93B20708
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 29 Jan 2020 10:02:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RxZ6E97a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Oi4ghENt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E93B20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NMxi53oQhLqzBIhRfkCNH6OHdDETWpd2dLEfkOHx2Uc=; b=RxZ6E97aHRsD0Y10PvUFjk/c3
	GORo0kMzN7GMiNaY5/QrvgKKn/mt/ifTOqH85Hs1MHgGBlqc8HwoxcDhFd6b79UrjzGknbuNigMGw
	AyfdL82+qUxZeIGglngfxwXuSA53BTo/EY6l1PDDqgME1JRQ2+9/K806n3qOmhS+0GhO+XJBDgQdJ
	tBZyX1jqi4Es+mlSGCT4DQpLUZeiL5jSsB7jVP4LdyyxLwBugfLyZtryl+3pqPHO7X6Cnf0UpMp8I
	CIWE+o15ypleBZ8A6NwEHs8gHgnH3EVirDkdbAcJrKSGOlro4Uxz7RbZuHPfU98gKXZEXQUaYoKUH
	EGEPKKDTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwkBN-0003Jg-JU; Wed, 29 Jan 2020 10:02:49 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwkBK-0003JC-TX
 for linux-riscv@lists.infradead.org; Wed, 29 Jan 2020 10:02:48 +0000
Received: by mail-lj1-x243.google.com with SMTP id x7so17720859ljc.1
 for <linux-riscv@lists.infradead.org>; Wed, 29 Jan 2020 02:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NMxi53oQhLqzBIhRfkCNH6OHdDETWpd2dLEfkOHx2Uc=;
 b=Oi4ghENtW6WcAZoWHyXkSoZL6u7K78YhV9BGUbXfC6h6iBLme0/mQHB5Ff2rNV0E6B
 On7RkAea/ORZqEDHsxpTTRJ4e8w4Dr/ZSGZ7EuaRWqhlipZW+SzN7agWqJvr30hjw0mr
 maGoxAwSH46ouE/d+AHJD5+unObzitFq5uiQ5dTuteai1qfGVsL1Gdvd7/eWX0HdFQfY
 XjtoTXtzE0WnVZ/WjTsHYubHx5SVEI0eHDsG4NvncsMPBujwg7rToS4rRJfF0yOv0Jp/
 YPoUAOBGsgvdON/p45jmIfTn8+EifTTXAmFTcc8LILl5rDhfg9yLO4+GcHBkGZGHHpVp
 wZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NMxi53oQhLqzBIhRfkCNH6OHdDETWpd2dLEfkOHx2Uc=;
 b=OsrdUtT54WZJCM7tKEY4GAk7/ve79L4k9Gr0sPbd12lNqNA9ZXEnZrOcZIxRfD51z5
 tsOLL53qgrN6YiRQaEOfdmQO2wHCvbErwSjqTJR7MrgrO94l0/fQbM3e/g2pP+SmGC5W
 g/cb6Znj4QfysF+hY0AnOZB5E+t/1fd6kiTypXIidf2XaENGszXc7mBkQUOfrTF9B4ua
 f/ex8otZaOp9myT2UaRcgoUUtk9lBd42+Xd+JrWl2mzNtljwDorgdh0sl3gEBLbE7nJf
 eXAGsXLULUaStEKSNNWfmR2NwGedwhV4RjGFN3Ac5XWFeR0FPYuTqn+0AuEvpWcqepzP
 DCxg==
X-Gm-Message-State: APjAAAV1OreyzgZufuPO3KoY/m7nBgOgYkOvhzMpmw3DYpJEGw1TcFvY
 VL4QsvPF1qpnqIWPERHQGqlSEnWdQxf9As3YQObTug/MVSs=
X-Google-Smtp-Source: APXvYqwETGQUBQ9evnWRAidnF08QHwkw7wCuB5Ih+rKtEwQzqb/TOP2aY3kVf4fXyMdZkgiY/Zpkwkp5E9sI99kmEjg=
X-Received: by 2002:a2e:81c3:: with SMTP id s3mr15670925ljg.168.1580292163302; 
 Wed, 29 Jan 2020 02:02:43 -0800 (PST)
MIME-Version: 1.0
References: <1580189061-14091-1-git-send-email-yash.shah@sifive.com>
 <ecb0e9404a3f6256a7ba1fe48b5a1471@kernel.org>
In-Reply-To: <ecb0e9404a3f6256a7ba1fe48b5a1471@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Jan 2020 11:02:32 +0100
Message-ID: <CACRpkdaQWB6toqVoPZCO=pfnMBFW+hXc027azu92NdOMqR_qNg@mail.gmail.com>
Subject: Re: [PATCH] gpio/sifive: fix static checker warning
To: Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200129_020246_963487_29461F45 
X-CRM114-Status: UNSURE (   6.89  )
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
Cc: Atish Patra <atish.patra@wdc.com>, "Wesley W. Terpstra" <wesley@sifive.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Yash Shah <yash.shah@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Sachin Ghadi <sachin.ghadi@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jan 28, 2020 at 2:21 PM Marc Zyngier <maz@kernel.org> wrote:

> Linus, do you want me to queue this via the irqchip tree (given that
> it is where the original bug came from)? Or would you rather take it?

I can take it, I just need to get my own changes for GPIO in first
so I'll apply this past v5.6-rc1.

Yours,
Linus Walleij

