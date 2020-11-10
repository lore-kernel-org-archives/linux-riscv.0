Return-Path: <SRS0=iBsL=EQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C587CC56201
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2020 14:40:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40AFF20678
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2020 14:40:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bvIoxP7j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yMvmv62j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40AFF20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m4cvO0t96edS3Knu/o1s637NKVQ7qJnKc94qp/J8YsM=; b=bvIoxP7jFsHfOjtngIznyiAZ3
	zcRRCl1mEXhaiChorU/XiarZR6v2NLA5zHA49bZu5nba73HS7NxjAZdFaz4rNp2mWHXx32e2JVSbK
	umE647KqBYSH5HutGPVnKLmHEMwQdjcMiqxIsWLC3BqTfkkBMgYiU2M7taS9jcGhgB1PnaDhyRnbo
	54SalM4GiCkcTd6cuL+QTp5p2yKvzo8/np8furGTwZAQXHCCXKzl/MzmVtkCw2Q7Y/FPiavGsdpnq
	fph5s3SWdu9weOEtROe2cqJf8TrJHFUobxNUKHOKK2JeieFpkegvBflv8NeR2OwTdtmxvz3LGvRal
	4LK4EinrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcUog-0003vK-Eq; Tue, 10 Nov 2020 14:40:14 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcUod-0003uZ-Vi
 for linux-riscv@lists.infradead.org; Tue, 10 Nov 2020 14:40:13 +0000
Received: by mail-lf1-x142.google.com with SMTP id r9so4152782lfn.11
 for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2020 06:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XMIR0x3v/SOduiNJI+iAqXslKNdg1Phd+avxtEvAmZ0=;
 b=yMvmv62jzEb5fWYRyJZ4EfNvXQWxI0M2a6MD6A14Kx2zX0+pJwr0BFTgurkn/NFcYN
 SEuffXDjbLtIeQtWDaXAhzdEJoRKIeHAT5dvDEySvCGFrvh9bPI0L3QFezJRcPZWqkwR
 FIQqy4YacfO3Oj7lxlpiIQnlZ4lyLWMQFP58iJL3VeCk2S/Z0o+9+n36DPvrUm3djefP
 Nf8fsoRkRTr406syuJyIdGYjtpWJFYIFc/AlaHKP8gv0mbHpRynDsz7F35XR6HyAaEkO
 LEgu4epTlp38o7p3nKYvORMzrP2I8j9HTmYhHZ1PbN3l0woZQdGi2pyG9yox7ZCDvkr+
 JmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XMIR0x3v/SOduiNJI+iAqXslKNdg1Phd+avxtEvAmZ0=;
 b=kkcGLR1oEXugY0LYMUPaY5Isi4NqQLbjhZg05Sm7D4QnTPaWj5BWme5YuSSu4xVMne
 vIZrI/NToWmlnDK8lAWZEdyHa9DP+EYqAd1HrvyuWtHvELuYoy/HyHzJa998RHT0ESKh
 zNiNzc5FObbMc2OxAbcucshvoj6eKQ+DexLo3tgn8g6XQemcUBhaLf9PFYlolAvKlrtw
 QiWM1Lza06Afy/g7hIj1PdQHw6JZy32uEbuuYvoQ5KZVf0o2q0rpFazp+FoRK2A+zrcu
 67Eq8QdKQoKAOv1EuqkWHRijN/A3h5/OxI5+RdIF5kFms0DmqvFJXzsrAGmtr4iAPnwM
 0S2g==
X-Gm-Message-State: AOAM533qJGWsDl5Fjkcs70VsTfoN50SDjYjzZ8xloWWv+m+kCGaznTNg
 3gpQCocgHTHjXY+mhTLb7Y8nGBsko4E83PhCWxyjoQ==
X-Google-Smtp-Source: ABdhPJwZKZCcPYORmeuUmPxVdMBipXbwsghexY2Fo6mTCT8Nwc9BfXeRqZ9vpij7/rcd11cpqaaXACeFiLO1OmB0y3k=
X-Received: by 2002:a19:ca05:: with SMTP id a5mr4591668lfg.571.1605019208781; 
 Tue, 10 Nov 2020 06:40:08 -0800 (PST)
MIME-Version: 1.0
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-10-damien.lemoal@wdc.com>
In-Reply-To: <20201107081420.60325-10-damien.lemoal@wdc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Nov 2020 15:39:57 +0100
Message-ID: <CACRpkda1Pd3hTiEHWDOAz3zCMA6WK4VmvjkNv0O_ckFaWQ-zSw@mail.gmail.com>
Subject: Re: [PATCH 09/32] riscv: Fix SiFive gpio probe
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_094012_263583_202CA004 
X-CRM114-Status: UNSURE (   9.34  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Mark Brown <broonie@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 linux-spi <linux-spi@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 Sean Anderson <seanga2@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Nov 7, 2020 at 9:14 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:

> Fix the check on the number of IRQs to allow up to the maximum (32)
> instead of only the maximum minus one.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>

I just ripped this patch out of your patch set and applied it to
the GPIO tree with some minor change to the subject.

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
