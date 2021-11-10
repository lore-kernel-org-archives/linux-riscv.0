Return-Path: <SRS0=I72s=P5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1550C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 19:08:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D8FF61058
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 19:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D8FF61058
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=azoewpm3d4nBCo0RtXLx4oJWcEOUwOClZfp6xSZv3C8=; b=ko638UzQLkzPRA
	QPRYE6sdfw47cBySEeb1xR/Tjk02NYFjRpx9YdU/kjpfjaEhA7wFQOT4H75oXSAo2loNPkSSAx2vz
	nDUpZHppiUhBxoiIbcfpLEv0zBNOJj/PzV3MQg8m+V/ZCMJEddc2Hr3VtAcsKuSXZyNSnAwsKcJRU
	el+GXrXPnPz9GTCR5kQLC8ScfNMECoCy5LYi4dn/REiER/MOQZ/KhHX/qHjjp+ZwK7+aykUN7k/Tw
	BVNHG3GS//B4r0FT8LvktrwpRFUUe4VYLzIjpgv3iJiKjmSvHiHTK6IMBRueEpgZH1iErndINvs3k
	3qlDA1kIoPkFKR8smP7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mksx0-0065vU-41; Wed, 10 Nov 2021 19:08:02 +0000
Received: from mail-ua1-f43.google.com ([209.85.222.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkswm-0065sZ-QW; Wed, 10 Nov 2021 19:07:50 +0000
Received: by mail-ua1-f43.google.com with SMTP id e10so6991153uab.3;
 Wed, 10 Nov 2021 11:07:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JVkOVIMojOtjUqioksXn7GnT56ja9tgOLgQ+4277MEE=;
 b=UvgUUGBNPg8/TsMgwRnNJgrswCxZh8kus5w6NbWkan504smVvpdEs/oig3T9G5eFJd
 sdev9r/BZyBf1MMbEOUtynqEdUHUtue08ZPHobjrnyemiRXjBGmYiXtdJUy/HWDOZOeH
 8Ukf1fsuOHRKwwbrZpy+TdwuwaPBgHFOLHtnigdaU7iwLgWFX1LqcSDG5kzDxYp9CNzD
 pfKSEpjDY0FBSfMVMTSTkL47gOFr/DwUubgi4vYztD7syL8OxzBKRYKBgZMDERXgJ2pk
 EZgxtHylrsZ9j3Ggs/kbEAx+MeJOwIeCGu26vkytdwohXGmBV+HAkJJb7Z8bkby9MGzH
 WOWQ==
X-Gm-Message-State: AOAM5324VGMmATHlEtshddwoJVy56vYlmx/cccjIUMUH9fZjpQKBA1JF
 Dw9n/UMmv0lhftLfXsPpfyd8lkOeDtyyow==
X-Google-Smtp-Source: ABdhPJy//8Riu/3AjGNDbtQrSsFYt88h0Iaa1e8dlDTYifdvOPndxWRF3RGok/C3NKIJYNg+QIg+aA==
X-Received: by 2002:a05:6102:a4c:: with SMTP id
 i12mr1369756vss.41.1636571266167; 
 Wed, 10 Nov 2021 11:07:46 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com.
 [209.85.222.52])
 by smtp.gmail.com with ESMTPSA id i4sm467230vka.48.2021.11.10.11.07.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 11:07:45 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id az37so6881338uab.13;
 Wed, 10 Nov 2021 11:07:45 -0800 (PST)
X-Received: by 2002:a05:6102:2910:: with SMTP id
 cz16mr2351290vsb.9.1636571265036; 
 Wed, 10 Nov 2021 11:07:45 -0800 (PST)
MIME-Version: 1.0
References: <ef59d6fd3b2201b912d5eaa7f7a037d8f9adb744.1636561068.git.geert+renesas@glider.be>
 <ddcfa4b9-f7f4-04f5-89f2-b04c284e1945@prevas.dk>
In-Reply-To: <ddcfa4b9-f7f4-04f5-89f2-b04c284e1945@prevas.dk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Nov 2021 20:07:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX_h9Tz8C-2SYyrS_G5BBbBNctqRA1mgKbhmYJxWzF-hg@mail.gmail.com>
Message-ID: <CAMuHMdX_h9Tz8C-2SYyrS_G5BBbBNctqRA1mgKbhmYJxWzF-hg@mail.gmail.com>
Subject: Re: [PATCH/RFC] of: Shrink struct of_device_id
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_110748_882782_847DC3C5 
X-CRM114-Status: GOOD (  28.15  )
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

Hi Rasmus,

On Wed, Nov 10, 2021 at 5:51 PM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
> On 10/11/2021 17.23, Geert Uytterhoeven wrote:
> > Currently struct of_device_id is 196 (32-bit) or 200 (64-bit) bytes
> > large.  It contains fixed-size strings for a name, a type, and a
> > compatible value, but the first two are barely used.
> > OF device ID tables contain multiple entries, plus an empty sentinel
> > entry.
> >
> > Statistics for my current kernel source tree:
> >   - 4487 tables with 16836 entries (3367200 bytes)
> >   - 176 names (average 6.7 max 23 chars)
> >   - 66 types (average 5.1 max 21 chars)
> >   - 12192 compatible values (average 18.0 max 45 chars)
> > Taking into account the minimum needed size to store the strings, only
> > 6.9% of the allocated space is used...
> >
> > Reduce kernel size by reducing the sizes of the fixed strings by one
> > half.
>
> Tried something like this 2.5 years ago:
> https://lore.kernel.org/lkml/20190425203101.9403-1-linux@rasmusvillemoes.dk/

I wasn't aware of that.  I reworked some code which used multiple
of_find_compatible_node() calls before, and noticed the end result
had grown a lot due to the sheer size of of_device_id
("[PATCH] soc: renesas: Consolidate product register handling",
 https://lore.kernel.org/all/057721f46c7499de4133135488f0f3da7fb39265.1636570669.git.geert+renesas@glider.be).

> I think that there might be some not-in-tree code that relies on the
> existing layout. I considered adding a CONFIG_ knob, either for these
> sizes in particular, or more generally a def_bool y "CONFIG_LEGACY"
> which embedded folks that build the entire distro from source and don't
> have any legacy things can turn off, and then get more sensible defaults
> all around.

Most of that should have been gone since the #ifdef KERNEL was removed
from include/linux/mod_devicetable.h in commit 6543becf26fff612
("mod/file2alias: make modalias generation safe for cross compiling").
Of course you can never know for sure...

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
