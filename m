Return-Path: <SRS0=J1nd=QV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A040C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 08:13:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F03522229F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 08:13:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LuheED2R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F03522229F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ECNbuNtrngCz7FsXIJb45fKU2VdZ2/gofzwUQ2+8gPs=; b=LuheED2RP7HOsJ
	zlyKcZMfNtZdawJApxAooOUB860jEIvcYtudEtgtoMPNdUCRh4BtkcfszLIZukssJrHYaFa3opSV7
	aP8XD5k509FS6SECwSg1gLOzwqXMn87r4VCsUcB/WnsXZI750cPD/JC43COiDdyYx0L2NPW0PQGvM
	0yh19q3cz4JuRIktRzlE2bmWg969djF+p9H8NxuWziVRmdS1z42HKUHK37Ko4M5T1KtKsQBJw7Iwf
	YnBp7+L0QpOWg1xTCINt6fefDRoroBrDfiXrTJ9by02pH73NIuVcSixznOii8YS1Ql8iK1wvHOAus
	9C48XpQHE610xA5541QQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guC9C-00036P-OI; Thu, 14 Feb 2019 08:13:30 +0000
Received: from mail-ua1-f65.google.com ([209.85.222.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guC99-00035s-E2
 for linux-riscv@lists.infradead.org; Thu, 14 Feb 2019 08:13:30 +0000
Received: by mail-ua1-f65.google.com with SMTP id z24so1721996ual.8
 for <linux-riscv@lists.infradead.org>; Thu, 14 Feb 2019 00:13:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oDHSHKTHIgYnWNuqdjR3jG49iOOy8VGtWQxLsAaEpHQ=;
 b=ZIg/iqRWedMywYC7hqk4nK6HGBwz48Jtwpqi2gr/xf51KU3P4gmHPvlU/EnYAt2oMQ
 xlHYmqIwLCC5PvOMIS1VfIq2WbFc7Tct6OefaFhIrh2tEPFVXBTPdrpjzo1rcQ79onkv
 zy5MruuJ0ouKEFwk/nmHfyxIMOYmH9H1tPrn1ysQMidk+gPReO/U+RVtc6zT8m7wzJJ/
 VQH3C2iArBX81zNrUO4rBMpKQPqn5SN5Ky/5Hqq6LgboYcRLHHaxeAF7VgxvwG1ZfRer
 VpyJwuqFvzWhnw7uA8rUPXcZoOb1uiSyUr/UvgVfAAaM87hf3MNcyPosV6X4AwQ8y7hu
 +YRg==
X-Gm-Message-State: AHQUAuapCX6g6x4VGSlj2k+tfXga8GmxjoLL7bPtovletXqr8iMstbQq
 pr+6bh1/g0m5tpG+aQmEAw2DecRhSjFsLjpSK0I=
X-Google-Smtp-Source: AHgI3IaE7cLxRKK27MHaxfzygEbpt/ImKUPXYqD0AR24BwNoDeuAjGZAMxX2/11NraL7sUOPNQIVEL+mp2wcl+dGTyg=
X-Received: by 2002:a9f:2726:: with SMTP id a35mr1290069uaa.75.1550132006060; 
 Thu, 14 Feb 2019 00:13:26 -0800 (PST)
MIME-Version: 1.0
References: <20190213174005.28785-1-hch@lst.de>
 <20190213174005.28785-11-hch@lst.de>
In-Reply-To: <20190213174005.28785-11-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Feb 2019 09:13:13 +0100
Message-ID: <CAMuHMdXPF4ohqzEnT_rnwKWi6r13cDMTtEinh-TpZ6YpSaQ=WA@mail.gmail.com>
Subject: Re: [PATCH 10/11] lib: consolidate the GENERIC_HWEIGHT symbol
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_001328_675708_632C0C9B 
X-CRM114-Status: UNSURE (   8.60  )
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
Cc: linux-xtensa@linux-xtensa.org, linux-s390 <linux-s390@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-riscv@lists.infradead.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 14, 2019 at 3:11 AM Christoph Hellwig <hch@lst.de> wrote:
> Introduce a new ARCH_HAS_HWEIGHT symbol for alpha and ia64, and just
> default to the generic version otherwise.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

>  arch/m68k/Kconfig       | 4 ----

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
