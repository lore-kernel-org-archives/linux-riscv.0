Return-Path: <SRS0=Yzoz=SF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE44AC4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 02:39:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEE2020882
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 02:39:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j8z03lvb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lkcl.net header.i=@lkcl.net header.b="gFWdCtdT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEE2020882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lkcl.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qvhdkz033VNapIXghL9hJwV3mduITKkFcIilB1KiHUo=; b=j8z03lvbe739na
	6fs00IkQwAmfx9K+53gW6QdRe5iCkshC3gbF1R23m5xA+qs/9FyeuaUICE4dbzxvwLaEbbnlUkMnK
	DCBodGaMS3LjdBosLxbcBOwc/mjK3zdc4Ei9Ikhv6SLQVXmQfMASBObADkokNa3prVbIsnF6Wgubm
	ztR/9wgTBxZVBa6C0idF43ScBP52sYhE264XoZA3pzmiNOngYgOdoFW3cAGBBld6R4tQnppnO9zHZ
	DSXYKFJQnFTb2nF5OXsBSIKfYL2YpkXSCqh7acZ/gWbWSiNwYu3u21Z8CDGqo6QFaDh3GBYe3/Ntl
	2mbvIfyYtwL2ogqr6SBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBVoZ-0005LB-Er; Wed, 03 Apr 2019 02:39:47 +0000
Received: from lkcl.net ([217.147.94.29])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBVoW-0005Kn-Bm
 for linux-riscv@lists.infradead.org; Wed, 03 Apr 2019 02:39:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lkcl.net;
 s=201607131; 
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
 bh=c/nu/qxHschDikE+tGS1g6N9erA4g3ZmsT+3z2Nh3Bc=; 
 b=gFWdCtdTtpnUJ/5mQcYT0LpLyeotuynQt3agC4vY6y+hWW3oLNoJ/cQvIb+20n3nuNx764gL3HpA5pnpE1mu7/GQNpuX9EVes2+bwkh3v9x1nONtymhvOZCGpKhOSA4JDRo7D2D0P5iCOlDyQP08fMstD4jMxaXRLEjqgV5HhP8=;
Received: from mail-lf1-f54.google.com ([209.85.167.54])
 by lkcl.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <lkcl@lkcl.net>) id 1hBVoQ-0006da-SQ
 for linux-riscv@lists.infradead.org; Wed, 03 Apr 2019 02:39:39 +0000
Received: by mail-lf1-f54.google.com with SMTP id v71so5669196lfa.11
 for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2019 19:39:23 -0700 (PDT)
X-Gm-Message-State: APjAAAWp5WHVnP5br1Iz/paHIWjPk2PgBsbZ3Esa7oUBnfLQrI2nU1VE
 6xX7s0sOXVDcwbNHA/myfdto9r37WmglfBEudBM=
X-Google-Smtp-Source: APXvYqxx3KGRD6XFr6dshoseJtgU0fqdpiODKHAh3jUoEKsO7y4e3JSmU7lfr0SWqgwk1ZZJi/MDm70HJAYIDgV7gAs=
X-Received: by 2002:a19:5506:: with SMTP id n6mr5147381lfe.119.1554259157808; 
 Tue, 02 Apr 2019 19:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <CABwTF4UW8YePYr9Ad65VSvef4-Y42VEvNUs=hPWyWcyH295zCw@mail.gmail.com>
 <mhng-0d3fa726-2ae0-44d4-9024-9c321c466e50@palmer-si-x1c4>
In-Reply-To: <mhng-0d3fa726-2ae0-44d4-9024-9c321c466e50@palmer-si-x1c4>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Date: Wed, 3 Apr 2019 02:39:06 +0000
X-Gmail-Original-Message-ID: <CAPweEDyK4vdeMR3R74GsT3hz6vJudpb5NHvsOxq5KnABjomUSg@mail.gmail.com>
Message-ID: <CAPweEDyK4vdeMR3R74GsT3hz6vJudpb5NHvsOxq5KnABjomUSg@mail.gmail.com>
Subject: Re: [isa-dev] UNIX-Class Platform Specification Working Group
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_193944_545774_26B934D2 
X-CRM114-Status: GOOD (  10.61  )
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
Cc: RISC-V ISA Dev <isa-dev@groups.riscv.org>, Gurjeet Singh <gurjeet@singh.im>,
 Atish Patra <Atish.Patra@wdc.com>, RISC-V SW Dev <sw-dev@groups.riscv.org>,
 RISC-V HW Dev <hw-dev@groups.riscv.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 3, 2019 at 2:53 AM Palmer Dabbelt <palmer@sifive.com> wrote:

> On Tue, 02 Apr 2019 16:42:30 PDT (-0700), gurjeet@singh.im wrote:
> > Not that I'm interested in participating, but just curious as to how these
> > officially approved groups work. Is there a mailing list for this group? Is
> > it open to public? How does one request to participate in these lists? How
> > does one follow along in these conversations, that is, where are the
> > mailing list archives for this group?
>
> There is (or will soon be) an internal RISC-V foundation mailing list.  You
> sign up for it via your RISC-V foundation account

so that it is perfectly clear to all who may wish (or need) to participate

(1) what are the terms and conditions under which a "RISC-V foundation
account" may be obtained

(2) are the archives of the "internal RISC-V foundation mailing list"
to be made public and transparent so that businesses who have
mandatory transparency and third party audit and accountability
requirements are not seen to be "hiding something" by participating?

l.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
