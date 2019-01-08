Return-Path: <SRS0=dvb3=PQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCCA5C43444
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 15:33:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD93121019
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 15:33:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uX6tNGzM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="nfYLxhyg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD93121019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mta5OY42rP2Xt0TEqafq/uf+dzOeep8lP2NDsunHzYg=; b=uX6tNGzMX3wAYB
	RGoXOvCwths1QyEedKrlGklPyoXvwaZqWaINRBVUckBZSaG7QBuSUsDLmtqheTFqYOokGLw/xLRTs
	BsoxZl0U0OCx6IoO9ZLnOKVIeSZapWKemw1nShd8cElxeYAReaaBE6wfVERw33PYt2OBghvLncPWc
	NwWPEnVot2sJLuKMecbwxOhVfzckMYCj2mDlFA6bFk1kzEbCVL02gP9cJaRIwX37gUHdxUS6RbtPs
	UdFitJB2tpBdy/5cQjC1hhp8dxXhs+pwRgligUqw0fzklJ2Gfis+DU+poLbdRwPDbwG4eGnGoTev+
	2jhAHAQV2PNXZzDZbiZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggtNi-00008C-Gw; Tue, 08 Jan 2019 15:33:30 +0000
Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggtNe-00007h-HX
 for linux-riscv@lists.infradead.org; Tue, 08 Jan 2019 15:33:28 +0000
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id x08FX5mb020696
 for <linux-riscv@lists.infradead.org>; Wed, 9 Jan 2019 00:33:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x08FX5mb020696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1546961586;
 bh=LQPAha78p1HdGEOw/+HOSVmjiCEBVHG9OH8+5nRjDXM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nfYLxhygb44lhetpxe6J0JzMmmwr41+VdNBBM5vEJ3/FuUDHsxhdzlKNhjEFVmBLX
 /zbCfbPeruPPLAq9SJMLh8VK3J3uKfKQSNAW2x/PyQYj6rLtwcgR97QOOrtRsiZtuo
 AyWYcw6YlX8sqSIm36EkqIJUgth7BNL9lrFPVyZp1Saw5dl67ObIyPOYAatJoKWuzj
 jHUkeBlp9YUduVcQkbAJFKvANUrLhHuqekBQa0o1WFy4jv8fIVcDHF/hevu7Tn32Jt
 xGFJcFRNq0dkGixKw41lR1mdtP4JrddmCxklqy1diO8bU2GfXHoga3v5l5zH7cZ9yc
 bHBdQH7vexjRw==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id y27so2728331vsi.1
 for <linux-riscv@lists.infradead.org>; Tue, 08 Jan 2019 07:33:05 -0800 (PST)
X-Gm-Message-State: AJcUukcJtAuhSn+ytFGnUe3syAClYYP4h+QmxGQaCLzzNX280SwedWY7
 oEbOCACjxpmXMcavyCcaLZHU3mfiGMnE0L3h41M=
X-Google-Smtp-Source: ALg8bN4zwJf60tEd8jwfN7+Nb1jFcxO+xLEgXSz53PG8ujjktkHKI+pGN4SaRdDw6eAdTUUVDLjnKur14xYyNJ5b8Q8=
X-Received: by 2002:a67:a858:: with SMTP id r85mr862339vse.215.1546961584270; 
 Tue, 08 Jan 2019 07:33:04 -0800 (PST)
MIME-Version: 1.0
References: <1546904307-11124-1-git-send-email-yamada.masahiro@socionext.com>
 <20190108111032.GP3235@lianli.shorne-pla.net>
In-Reply-To: <20190108111032.GP3235@lianli.shorne-pla.net>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 9 Jan 2019 00:32:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS+grgqHM-ht0CCTmZHp+JRvr=Q+sJOo0URqRgTAYRs0w@mail.gmail.com>
Message-ID: <CAK7LNAS+grgqHM-ht0CCTmZHp+JRvr=Q+sJOo0URqRgTAYRs0w@mail.gmail.com>
Subject: Re: [PATCH] arch: unexport asm/shmparam.h for all architectures
To: Stafford Horne <shorne@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_073326_794549_DF85EDCA 
X-CRM114-Status: GOOD (  10.48  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Guo Ren <guoren@kernel.org>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 linux-arch <linux-arch@vger.kernel.org>, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 Jonas Bonn <jonas@southpole.se>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, openrisc@lists.librecores.org,
 Greentime Hu <green.hu@gmail.com>, Nicolas Dichtel <nicolas.dichtel@6wind.com>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Michal Simek <monstr@monstr.eu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Kuo <rkuo@codeaurora.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Stafford,



On Tue, Jan 8, 2019 at 8:12 PM Stafford Horne <shorne@gmail.com> wrote:
>
> What is this patch based on?  I tried to apply it to 5.0-rc1 and am having an
> issue with applying the arch/openrisc/include/uapi/asm/Kbuild part.


Based on Linus' latest tree.
(commit 3bd6e94be)

v5.0-rc1 is NOT the latest.



> It seems shmparam.h is not there. It was removed with the others in your
> ("d6e4b3e326d8") arch: remove redundant UAPI generic-y defines, commit a few
> days ago.
>
> Note, I can't compile 5.0-rc1 without the first part of this patch.  So please
> get it merged asap :)


I notice the breakage of several arches after v5.0-rc1 release,
so I asked Linus to pick up 3d6e94be.

I had already noticed
having shmparam.h in uapi is werid,
but I decided to fix the build errors first.


-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
