Return-Path: <SRS0=abkI=NS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E99AC46464
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 17:35:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7640F20862
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 17:35:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NTsfiDif";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="0cQ87MPg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7640F20862
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZkTWz9vYcYaIoa9ysdd2H5UVJf/tnuw5PvJI77wu6GA=; b=NTsfiDif7/Rol0EcSuPzyS1ozo
	ZEt0dvmbbWNGKO5ug4xoYeFCZtuAYQCi+I3sTU41MPva18Hp4g+ap/ppxeqlOxrXPOz+6AkTt9Zy4
	wahFU+nKCM5f7By2O6PSbekEGD+2Wa53KHzXbnVUOTIKjyDb1IIk7QnWWHoJnlD8/F6+4T8xJBtvJ
	MYaxlIlmJloQpIvDXcUwVP4bpTCOCqgtju0L43spRo+7a7GDH17TYIPQxOZGgyuJwdqAMuv1F/Yfq
	m+TLRKLKyjOuhuvlOykiELEOYkEeWEpqXCNEn2ElSV8cb2j+AccFzUkNxrNhs/qxsxQ2jAe4nGNY6
	0oKRvbaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKRjz-0007wk-Ic; Wed, 07 Nov 2018 17:35:43 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKRjq-0007nJ-An
 for linux-riscv@lists.infradead.org; Wed, 07 Nov 2018 17:35:35 +0000
Received: by mail-lf1-x141.google.com with SMTP id h192so12096447lfg.3
 for <linux-riscv@lists.infradead.org>; Wed, 07 Nov 2018 09:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=kxiK8t8nrB5BiFSgCypjx4FyMuciPUXkoznEtv5DHSo=;
 b=0cQ87MPgW9Gze993K84WEuJVFgT406flsSE+gadrtkJwsGYqKVNEylVayvPzQ3nBd8
 3JZj7R5jwThpv3WzHwdPS9k5Dj9vrp1nyMersYlp+i8udzVJg9QlHl+FonyAxtDTnIDX
 zhoZEdsnLkCekz1tC4XmResoHTKM4Qvpgz4dc4TRmGYlLyUzf3M2tiqwnoYVefOmeO6c
 jKlEuOhpYFdKHNvNqVzCn9bUoECooGrk31mg+4bDKkrTCBnsoB2KFXXDE4cEo/xG7Q0D
 /tvo4wrjCd3mU/f2AXhyGpugB/yuPqiQUs9br89I5b2Gp5sJMkB5ULzXJ+CgTTZiUyG1
 O0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=kxiK8t8nrB5BiFSgCypjx4FyMuciPUXkoznEtv5DHSo=;
 b=i24X/vTkMjjpXgICBY7E4ZuuC00wJYqk5GW1E31gyCd/LXyX4ctYhFXFir+5p5RAQL
 LGhC7Lzv83CfQRFnOSlz1IOaVpqVe/3/ymulj4bEr3cuLNCs957cGdC0yfZyIP+26T3S
 9FBPRFfcfNwOkGe4EKEUeHew7QrIcaJLeq6c//oKNlv1yP0t2ialBVNx53p5IBjyxpR+
 rIcAyjdNQT9bXYHipBgR4+t0qhXfqbGS46bMAxmIlGP7Ifaxzu/vFxHabo/9sbdo4NTc
 7lgKDHqL2cEZ5Kmf6Mrl/U+HW1TCHSLkgrZmQunHllZY0uJL6D1DJ7TBVKlGT4CfV2dX
 hPsQ==
X-Gm-Message-State: AGRZ1gLJyHOEJ6FnM//g12qVYZHUUkrAX8/nK3I424YWh0ooomY3flv7
 Mu0KxQyMGx6piP7nFOGlSxOjzN/Dxl+mIg1uE45r5Q==
X-Google-Smtp-Source: AJdET5c6P8Vo0JzLVQlX1ep8j/8CXkS86Sc+cS09nfgrkap+T6xoMh+ceRmnF4pE1LeAYUOAemhS5uAO6VpvL5XS0PE=
X-Received: by 2002:a19:df41:: with SMTP id q1mr707154lfj.25.1541612122240;
 Wed, 07 Nov 2018 09:35:22 -0800 (PST)
MIME-Version: 1.0
References: <CAOesGMgVPsK9YsV2nGoBptWwtHYv=3yMytLx2_tF_ujS5c5p3Q@mail.gmail.com>
 <20181107171723.GI9919@thunk.org>
In-Reply-To: <20181107171723.GI9919@thunk.org>
From: Olof Johansson <olof@lixom.net>
Date: Wed, 7 Nov 2018 09:35:09 -0800
Message-ID:
 <CAOesGMheCcvDQCd+7fyh4yOk4BYDfm2QRqsdawqA_fg8s9YYEQ@mail.gmail.com>
Subject: Re: [TECH TOPIC] SoC maintainer group
To: Theodore Tso <tytso@mit.edu>,
 ksummit <ksummit-discuss@lists.linuxfoundation.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, 
 linux-clk <linux-clk@vger.kernel.org>, linux-gpio@vger.kernel.org, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Russell King <rmk@armlinux.org.uk>, 
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Mark Brown <broonie@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
 Kevin Hilman <khilman@kernel.org>, Stephen Boyd <sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181107_093534_366355_FF33E96A 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
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
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181107173509.3FkXJNoaes26eFedZVINd5TgWttkT53rU0xIO1UQ7kc@z>

On Wed, Nov 7, 2018 at 9:17 AM Theodore Y. Ts'o <tytso@mit.edu> wrote:
>
> On Tue, Nov 06, 2018 at 02:16:27PM -0800, Olof Johansson wrote:
> >
> > Olof Johansson (arm-soc)
> > Arnd Bergmann (arm-soc)
> > Kevin Hilman (arm-soc)
> > Mike Turquette (clk)
> > Stephen Boyd (clk)
> > Linus Walleij (pinctrl + more)
> > Mike Brown (gpio/regmap + more)
>
> Could the poeple listed on this list please list potential schedule conflicts?
>
> I'm going to assume we should avoid: Andriod uConf, RISC-V uConf,
> Device Tree uConf.  What are other potential conflicts.  I'm going to
> guess this might be "interesting" to schedule.  :-)

Yeah, apologies for adding a bunch of cross-coordination this late too.

It's likely going to be conflict-ridden no matter what we do. RISC-V
and DT are the main conflicts, Android probably has a bit less.

Tuesday afternoon looks least conflict-y when I squint at the
schedule, or Thursday afternoon (but ideally not overlapping with
Daniel's DRM/gitlab session).



-Olof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
