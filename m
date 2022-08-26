Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4B7ECAAD2
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 08:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=olxIiXEKV6HQYlGXdita+oo/OjFwKtCfBANuKaCqxFA=; b=b5cDdntgdYOg3N
	SBu/ypLUJuPgpRvj7Gh+iGK0W9hgO5KIg/QDzvVk+pgvhEFRhsG++6WuM8QqbdN2F3HDIsqZLReFz
	yTRZnxMVm5WhIY7E6XwiXpY4EXnAL5Mlb0aOm0g+trm35WLhr6rBr0T1fip6P0WAUZKr43HG8Qh5n
	umm424k50df2cA+ceHUWgEziPkbYInsf5XAxZEhR8di0ZZClWQm0lMsv6B4Dsqpxq3Ud8Xj9cVEmo
	9vtkY426XHaycHM5OOnYzp8eJSJclPt0lZxoOEt7Wf1cQZ7DplHy9wC0dhRZrwq2PeyZOBnX/9p4g
	JhKsLg2A0yBRT65LDT1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRUc3-00H0IE-Mj; Fri, 26 Aug 2022 08:22:47 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRUc0-00H0Fz-VU
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 08:22:46 +0000
Received: by mail-ej1-x62a.google.com with SMTP id bj12so1718938ejb.13
        for <linux-riscv@lists.infradead.org>; Fri, 26 Aug 2022 01:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=FkjE6GGUo5m4bQQxcxS9cC2SHMb+1PtXHXgXEs/AakI=;
        b=J8AHzY00e7vOUMndst4CE5NEyNLo1kreuduD834orDAuKaERoW0ZAXNbuR3ArhAzO2
         wBC1P8YXH5CjHjXL1vK0NgP/x1bDu5ZyJCdIv2gWrFbDSqL6XUGwHjmRC1h1VAMp2RYe
         RvIMIrdUR3n6KgZFv5dV6aR7bvu9Tv1rwSCzLS79DJIXo9sQ8eyPi3X8Ob8edyPwQozE
         Jh+vetNalim7teCGBzeV7lfRV0jg3QFoAyqeb3Me8vX7w9EP84IR7GWyckggefRzW5SY
         MJ6/+D6I1arLhHdd1ACPyYbo9Hb3vJfCapwmhD2PJ/bHiD9SNuGoZSfXWSnwyfZess7u
         q5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=FkjE6GGUo5m4bQQxcxS9cC2SHMb+1PtXHXgXEs/AakI=;
        b=wtxD1kPnmTahgOte1wRKaq9OVx5macSb+6c0nAA8zksyBABosJN4NjXYizBg6ey7Xb
         mGuKyC8wIzatRyV58vX+0dAKJf4VzxtGiSq/j7rolB0i8wnC6Kgt6lLjS5me+CRwB1U4
         T/iMrB7W8Egdj8p8B5o7aHOGSEuxFu+LHol93OfXGWCoysBzpRnprLyb4hoodbMx0/qU
         ndJB0a8l/dilSp/5v0ZTKp3F0MZQ321zugKQt+b1wna4zmFTGxbNfzuIAtXtIE9WmOV8
         +FamySAKIGzJoGkvjDdHZKq6k+oFW2PbTc8+Mku8lLMwFXVMwgSz8P5adz+uApypqqr2
         5jNw==
X-Gm-Message-State: ACgBeo2+aZetodg8nhzuja4mssvZMUBDP9yskjQV0MVk1Asu91dDvs/r
	OUX+8Yv8WEcx2FStf+VL2RLLI/N+zeHaWG6NWCax3w==
X-Google-Smtp-Source: AA6agR7vmSRcjidQzAHSj1ZN34Lh2USrc196LGQSLvsjNYigmEaK006EtBkxYxY4U4QIcbVPUgQlNM6zCi1SJk5BKGU=
X-Received: by 2002:a17:907:6293:b0:73d:b27b:e594 with SMTP id
 nd19-20020a170907629300b0073db27be594mr4913613ejc.526.1661502159873; Fri, 26
 Aug 2022 01:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220805134908.749935-1-conor.dooley@microchip.com>
 <CACRpkdb1jnq2C+ke1i-tis-2jMLjxbb14YusMRp607Avm4k6ow@mail.gmail.com> <9056a25e-930d-7ac7-25c8-169d43191974@microchip.com>
In-Reply-To: <9056a25e-930d-7ac7-25c8-169d43191974@microchip.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Aug 2022 10:22:28 +0200
Message-ID: <CACRpkdYJC-Wxq_xqAmisavuq3+d7_f5p0f1_EbZy-uPy2kip1g@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add PolarFire SoC dt bindings
To: Conor.Dooley@microchip.com
Cc: Daire.McNamara@microchip.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	broonie@kernel.org, wsa@kernel.org, thierry.reding@gmail.com, 
	u.kleine-koenig@pengutronix.de, jassisinghbrar@gmail.com, brgl@bgdev.pl, 
	wg@grandegger.com, mkl@pengutronix.de, gregkh@linuxfoundation.org, 
	arnd@arndb.de, olof@lixom.net, mturquette@baylibre.com, sboyd@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_012245_052357_9EF8E7B2 
X-CRM114-Status: UNSURE (   8.98  )
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

On Sat, Aug 20, 2022 at 12:21 AM <Conor.Dooley@microchip.com> wrote:
> On 19/08/2022 23:13, Linus Walleij wrote:

> >
> > The Subject on this patch is wrong?
>
> How so?

It says it adds bindings but it adds a maintainer for the bindings.
Which is implicit since it is patching MAINTAINERS.

No big deal, sorry for an early morning OCD-thing from my side.

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
