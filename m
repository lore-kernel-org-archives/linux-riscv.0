Return-Path: <SRS0=tGDq=36=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01FC2C352A4
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2020 12:55:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCE7D208C4
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2020 12:55:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aheptMKM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DRgSEasH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCE7D208C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=if4MUnW+MXwsU+saJV38n0v9tUH8Lchg2aKYG4Eb7X4=; b=aheptMKM1vDqGr1fqLWfFEmkp
	u0Brep3adq/bDjaBl0ihxG7dvKVUvxLSVlN2eGKy+bIFpyUWaQkjekLl1CUChkeCLQO1yzhL9oJk7
	0RF2hXQXauwOkRNTavhhmJ8PSnn6mV/Do6ryl3bT0bhEvasQpqR45TUf6uLQq86sj/wIzG0Iy+XJL
	ZPwa5t2YUPsRr+tINKenDMjEgQdYmgDcrd1Wc51Z0KcFssGedZTBLvNqLmuI5VhVZBkiX1uPiOALj
	Jp+Gf2DqKoLZMIixcyaWhT2G0txQlJA9wLsuAfFmknvDxw/a4mRiA2RdxVLmhq6dyM1HJWEGpZxUs
	FXDsUbinw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j18b1-0001GB-Vj; Mon, 10 Feb 2020 12:55:27 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j18az-0001Fd-JG
 for linux-riscv@lists.infradead.org; Mon, 10 Feb 2020 12:55:26 +0000
Received: by mail-lj1-x242.google.com with SMTP id x14so6971675ljd.13
 for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2020 04:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=if4MUnW+MXwsU+saJV38n0v9tUH8Lchg2aKYG4Eb7X4=;
 b=DRgSEasHs7rZLw8lwalhqqVwwrJjzEeFMhK6P7OyXSdnl1DnOjoLg7S3gtTFtG1htL
 8PqvxVm0XTS0ARlV0Rhr7kA/HGQ98L++ubs/qGWrRLGfGhT3sbDc3YwalzhPLs6a74J1
 0zs5HgYZS0WfWx4rXHM1ViEZd6aQ2LPaODzPEUHW4doJisbhmv3LJDVkk9uNQ9AGMU48
 rOCv+R3N2LIgD24H2MZaSb8xHONLDBmb9N6AXv9x8UQQNdNVv8WrCeIyoE7TBNormu9u
 SwACo3uBmfPBjB3nMNEDFgCiR27a6t8gUVOj/myILUNlkzfVpDhWmNFUOBlD1+ODtgre
 aNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=if4MUnW+MXwsU+saJV38n0v9tUH8Lchg2aKYG4Eb7X4=;
 b=Kca0KaVrJduULFWe6V1e87plkg1XBpCrzbY7lJRF31JHbZHtfw1LxeHoyVV0bQOoKT
 cRIg9er3pxBM5M9PAurcLLJhfsftRyxmgVf0V9++hZYkT8X5N8MWAcZchuKtojwXT/cS
 Ox5T7iKzdMpxdu7mry4guRMyyUTn7+hTyyimFNx76Bbzm+INYW0x9e6yathsWIAn9fBG
 tHQCk3geUdIoHsiZJGH/MzaXfn116UKgVmn4eJGlTHTMxXeIyXZb5DURsFORKjBnwNrI
 vnygLb0+zJV8ADhv2PevnnwCsc0AWcLpCdAk9f+bnJ0ORfN49eXlnfWLWpV4jK3v7eHy
 Vobw==
X-Gm-Message-State: APjAAAWmd/jHXBTZhhfMFhDNgvJOXyAruzwrKjwpsBQTy0+Pe8b8usj5
 C4aflqE6XnyWpY6zCp+VF1nRksXTHjxixleGXEMNXA==
X-Google-Smtp-Source: APXvYqw+civ1ODb6zso+c7GW7rfrr9mBNsfxXp5/xK8t7tww8joCEz2Wgykxa4HgCnO9fVri1gLiHP82cmonCoITb+A=
X-Received: by 2002:a2e:2a84:: with SMTP id q126mr847097ljq.258.1581339321285; 
 Mon, 10 Feb 2020 04:55:21 -0800 (PST)
MIME-Version: 1.0
References: <1580189061-14091-1-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1580189061-14091-1-git-send-email-yash.shah@sifive.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Feb 2020 13:55:10 +0100
Message-ID: <CACRpkdY2Zahr0mLUp+dBOzZbthsttLS=oKitPJVS_xQh8RwZqA@mail.gmail.com>
Subject: Re: [PATCH] gpio/sifive: fix static checker warning
To: Yash Shah <yash.shah@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200210_045525_694404_4D3697CF 
X-CRM114-Status: UNSURE (   7.62  )
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
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Sachin Ghadi <sachin.ghadi@sifive.com>,
 Marc Zyngier <maz@kernel.org>, linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jan 28, 2020 at 6:24 AM Yash Shah <yash.shah@sifive.com> wrote:

> Typcasting "irq_state" leads to the below static checker warning:
> The fix is to declare "irq_state" as unsigned long instead of u32.
>
>         drivers/gpio/gpio-sifive.c:97 sifive_gpio_irq_enable()
>         warn: passing casted pointer '&chip->irq_state' to
>         'assign_bit()' 32 vs 64.
>
> Fixes: 96868dce644d ("gpio/sifive: Add GPIO driver for SiFive SoCs")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>

Patch applied for GPIO fixes.

Yours,
Linus Walleij

