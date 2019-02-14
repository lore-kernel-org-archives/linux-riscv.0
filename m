Return-Path: <SRS0=J1nd=QV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F8EC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 08:11:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA0B4222A1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 08:11:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U/KEksta"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA0B4222A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BAzx+KmBgyyvntk9b1uinIco9H+BSz89mQdgTZRExWo=; b=U/KEkstaGhHKTE
	8KkwH51h3JFQddURMSvluxNQin9By8u9wrax/elFaZi5lxlmErgUOKrGDgWT0PWLvoYDjPi5BG4vD
	zn+kjKix1CsvYihZz09Q3flB1sT7HYFvp+LWsYpxfAEILxake8103GL84MwnbprHloJSvhEolHJqv
	oiPYOy9sGOn7frPuC187XzfR5T3DbH0YKqgUljhqbOejARMCammWDxOLRXvGvxfcuRb22sOUTC0wL
	q10sJUaVGphfFEGqdKtCSjw3dqsF7mnP8TfJPl+Nac9N3lPr3ZI9zPf6HJrukXHMxHGAqVfus7ugB
	vD/92mJj+vMq3scEmVcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guC7E-0002sP-3S; Thu, 14 Feb 2019 08:11:28 +0000
Received: from mail-vs1-f68.google.com ([209.85.217.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guC7B-0002rw-5O
 for linux-riscv@lists.infradead.org; Thu, 14 Feb 2019 08:11:26 +0000
Received: by mail-vs1-f68.google.com with SMTP id z18so3115293vso.7
 for <linux-riscv@lists.infradead.org>; Thu, 14 Feb 2019 00:11:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4a3D100K5NwmmTPJJ0s35hte8UB4taiTrnr7PheOHpw=;
 b=UF7nqwDnnXUY9oBnGEFtUICsxVypm1n2q4Sdh7LC7qOCxQ4jAM050FvjOaiqt371Cy
 FyiLTHTueMeGaJLywxWahJqPeloGDsxdCUOVPVhEWiBQ6hMCEV+Dp3jPvLBd7VHLO+lC
 00ajqdBduTpw2fDq0nKxJYxKltg62WlXwrIPOr8n7tJAm9BlvUP+ggdRB6rIZFTDeDRz
 jr+NEW0pXJ3GhF9WRE9+takLhmcgWmfREYUjI12xsCEan62UFeqUVAOSthZJ8vv02Bpw
 FDfpBZ7xyxJqWv1qW61T7mppLFDNxVxgepo7Mqey25r6sFYno3iSYFDhFhnofhz71aWo
 W6SQ==
X-Gm-Message-State: AHQUAuZ58f+4ArTV0iJ2rDlQkNfKtsVS7B5e1k6/FuzJX8eG32cEUEDK
 B+BhMjVIpiOyNbPs2ixaB8fL3QxSLsHMHAcTm80=
X-Google-Smtp-Source: AHgI3IbxtQI24QYjPRnNrEhWZ+8rGpNy2/UZnWXN5HqiJOduvEND65+eZoiExYXcsXnh4oeImmJLyQnV8CZhtYrIpSc=
X-Received: by 2002:a67:541:: with SMTP id 62mr1260865vsf.11.1550131883912;
 Thu, 14 Feb 2019 00:11:23 -0800 (PST)
MIME-Version: 1.0
References: <20190213174005.28785-1-hch@lst.de>
 <20190213174005.28785-8-hch@lst.de>
In-Reply-To: <20190213174005.28785-8-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Feb 2019 09:11:12 +0100
Message-ID: <CAMuHMdWDBaz1hLxmeGa7k3mzt-8GAoGVEQVSfeVX2CCpqrY-KA@mail.gmail.com>
Subject: Re: [PATCH 07/11] init: consolidate the GENERIC_CALIBRATE_DELAY symbol
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_001125_204832_F6992C26 
X-CRM114-Status: UNSURE (   9.25  )
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

On Thu, Feb 14, 2019 at 3:25 AM Christoph Hellwig <hch@lst.de> wrote:
> Add one definition to init/Kconfig and let the architectures select it
> if supported.  The only complication is xtensa, where it is a user
> visible option - we introduce a xtensa-specific symbol instead to work
> around this.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

>  arch/m68k/Kconfig       | 5 +----

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
