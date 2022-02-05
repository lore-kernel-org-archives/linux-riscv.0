Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6382CC433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Feb 2022 16:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oL3tmiB8pG8seDL5BWFOhellGFgFKdT9OeW66xcGEmY=; b=QAkbte9CQE6MJV
	pRljbMj/lFiMYkDfWxdE6QQSPJdrcZHY+dk7CH9mYKVx0dx/ztW2aJ19UNfBAF/5+qo5O//fAxo78
	gnV1MmYqLxHghTGPc1gKElQfPuyFG0JypuA4F8rfL82vQsdkY1ISmcwxXbPYgzXqbucywleyXcEC6
	p30lzKgw3fUJWm6Tkuh0G8LvJSJC2tVH71lxVxJz8Z3TsWlArmVs9isRoXQhKzFD/TGMpXdNzywlg
	euqXjMwgu0dSy5elmriIKCQeRtZepFjU6/ArOaQMPQ9pawjS+TyGRSBaffsnDa79laGIHoKluGQgx
	ZHcGrGhECs5RA1d+HZwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGO6J-006pl5-3S; Sat, 05 Feb 2022 16:39:51 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGO6F-006pkb-LJ
 for linux-riscv@lists.infradead.org; Sat, 05 Feb 2022 16:39:49 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id z62so15807936ybc.11
 for <linux-riscv@lists.infradead.org>; Sat, 05 Feb 2022 08:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7F+8USHFDE8IayAm+TB2xQEiUJldw7h6gDGNLYqTghg=;
 b=INqO7QDQEdOAV5NoH9Y7AUOI2g2l/U2lGjIMvznW3n27VeK55yayt20t7PlVMrFhyK
 bklzh35WXNqbTyrLEmtI7XFQSMiCLL7nqoJDedC5VCZLPtwe/KVdn8RbF70HkfRkB5c0
 IDvJ0Q4NHYnqmC/6eip3l9Qb/odjZp3i5lOB5OxrnkEUZnp2x3zGbOw3Dobv1GAYqB9G
 9fCpc6SAKByvug8bkSA3jBVLyHZDG79nwC7vTEFGNNIHYs+RW+X5NyUq5d39swBfdo2h
 gG4TqD6rwEo53qmi0e7vo5GhZ3r3zm4w0gEwYLhgtrXpLyuPdsnegkNH5q+G0TpzIbpS
 7imQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7F+8USHFDE8IayAm+TB2xQEiUJldw7h6gDGNLYqTghg=;
 b=vVxvMnIImIwjdHPcakpbm/lukDWWUeONCUmn/BHmMk/l5fZHY1LHA8n7XUGJ0r1v3p
 lTc0Rkq463WpS+/FEm5YItRKMn7NLK1FnPtuoazOjIh+tEQIrVs4Y+7hF6iwjFRmQ0wv
 OvzpiStjGzCyJx2kS42owKukHub/ZAjwp1NcwwBaQYx5gPupYUXEPvt9Z1VqYObpK3NM
 r97kHRJgB/mEG+z8XbMZHiUWDzxZo/f9Fh0qef0e0nAAYSAwlAWaKAsmwXj6wWTYLdj/
 v/SD6BAN4AWVM7hdUrXo5v94hfhLfl0g4+aoyfstshMlSdhHz1CukIBuIMwCGa8rm4Ak
 ATzg==
X-Gm-Message-State: AOAM5335OSuyjK9ZDJYVVxeWuCqZwZA1ynVHsw5fw4sUhRh/ijoks82D
 GX/5dbzgF5boGDOZJb/z+S4Bhcq6QAUmgKtS0Mxz77kF/78=
X-Google-Smtp-Source: ABdhPJxatjV1lGXgcy/ZJt/lFciDDNKH16UbIV+scTjMNBRxuQkcfRgr07sLhM2ygYwNysEVT+WIb3RNxJMTLUUlyAA=
X-Received: by 2002:a25:a2c6:: with SMTP id c6mr3855899ybn.322.1644079186562; 
 Sat, 05 Feb 2022 08:39:46 -0800 (PST)
MIME-Version: 1.0
References: <20220204130142.21727-1-Niklas.Cassel@wdc.com>
In-Reply-To: <20220204130142.21727-1-Niklas.Cassel@wdc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 5 Feb 2022 17:39:35 +0100
Message-ID: <CACRpkdZX5Sd-bp1n5zmYv7biPuBoNMGW2+OQ9qUi3PKNeG-R=A@mail.gmail.com>
Subject: Re: [PATCH] gpio: sifive: use the correct register to read output
 values
To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 "damien.lemoal@opensource.wdc.com" <damien.lemoal@opensource.wdc.com>, 
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220205_083947_721769_827872EB 
X-CRM114-Status: UNSURE (   9.92  )
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

On Fri, Feb 4, 2022 at 2:02 PM Niklas Cassel <Niklas.Cassel@wdc.com> wrote:

> From: Niklas Cassel <niklas.cassel@wdc.com>

Hi Niklas, long time no C!

> Setting the output of a GPIO to 1 using gpiod_set_value(), followed by
> reading the same GPIO using gpiod_get_value(), will currently yield an
> incorrect result.
>
> This is because the SiFive GPIO device stores the output values in reg_set,
> not reg_dat.
>
> Supply the flag BGPIOF_READ_OUTPUT_REG_SET to bgpio_init() so that the
> generic driver reads the correct register.
>
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>

Looks like a straight-forward fix so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
