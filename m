Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50E0C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Apr 2022 11:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oS37LhZY9LmvM7yxfSkRVBUdP39db5/QYrvsMMNQvwo=; b=WtixJQxRQuI/jZ
	4mheQyhiUWzVV8L0PRgDOiNWtLtU4mHbav88aGpjBI+PlfrSBFDY7vgqFs9gqFSwnlgiT3em6dyzY
	tu5HPRsO5WMXbNuVKqzZVBHCm7qkg5BTShKKbyijjRu7B1sbGZzzcYRYSB6Ow6deRkfJ/xkRc6DC5
	sELKMhiawBVd1XrGpoj+k/ZFBF8R5o8Xv6Td4RYEi0NtDLZ2Zhb/YLYIpKX0QU5sV3XFbqZJMmJ3Q
	7diLXHloDUXbMz31qPH0dMzhwbxVQQbR+gtWElCsI8tyEZdkO7B9SvDRoqiTw2rwVwdW2hYxX0GBY
	ywND5UrU/Y9TYvYlb1rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ney6W-005Lvk-ID; Thu, 14 Apr 2022 11:57:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ney6I-005LrO-Du; Thu, 14 Apr 2022 11:57:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CAEBC61B6C;
 Thu, 14 Apr 2022 11:57:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30E56C385A9;
 Thu, 14 Apr 2022 11:57:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="KqULyDW2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1649937439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P5/ULzB2dBV6wVJcVqNwMtw/WLd6F6dq7ksMxHzz5tA=;
 b=KqULyDW2bpNuV43D2qfWcLectqKb2+7LIu91z7Q5tNQEiQHJqWtgnzvY6NqNuYPtq+cgRe
 tg79MdGbG9du4wXdelQZLIoTe7afsL/n2nIea9nRhw//O5bqgubZJiGBapql2hSBobsFeS
 bOnl6O1rryOEcTmj4DTw28tt+f4lj9g=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fb5d31d3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 14 Apr 2022 11:57:19 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id
 e7-20020a4aaac7000000b00330e3ddfd4bso830716oon.8; 
 Thu, 14 Apr 2022 04:57:19 -0700 (PDT)
X-Gm-Message-State: AOAM530mA9wPgUyKx2JSzVXWG/N/9Y881rpPGJXBuyHWAhvTs2NvMiVu
 2/7mG7Tc7jloPHoJd7pVG7YnXKKW+K4CEEbyTMI=
X-Google-Smtp-Source: ABdhPJyKcg613GF5x9fgeLFiZXh8/mhAmu2M+VzMPDTSDm44Qulp172KDH/PBSl3qtPO19ZfXo8qsw8aP1vhDQLRj1E=
X-Received: by 2002:a25:fe0c:0:b0:641:2884:2c7e with SMTP id
 k12-20020a25fe0c000000b0064128842c7emr1344925ybe.382.1649937427424; Thu, 14
 Apr 2022 04:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220413115411.21489-1-Jason@zx2c4.com>
 <20220413115411.21489-2-Jason@zx2c4.com>
 <Ylfzi1lNWTH1wjLA@shell.armlinux.org.uk>
In-Reply-To: <Ylfzi1lNWTH1wjLA@shell.armlinux.org.uk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 14 Apr 2022 13:56:56 +0200
X-Gmail-Original-Message-ID: <CAHmME9q8R+uHNF_VBkJezfWn78kyw0RgGf-36JJKs6t3h3wQnA@mail.gmail.com>
Message-ID: <CAHmME9q8R+uHNF_VBkJezfWn78kyw0RgGf-36JJKs6t3h3wQnA@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] timekeeping: add raw clock fallback for
 random_get_entropy()
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Arnd Bergmann <arnd@arndb.de>, "Theodore Ts'o" <tytso@mit.edu>, 
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 "David S . Miller" <davem@davemloft.net>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
 John Stultz <john.stultz@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Dinh Nguyen <dinguyen@kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 sparclinux <sparclinux@vger.kernel.org>, linux-um@lists.infradead.org, 
 X86 ML <x86@kernel.org>, linux-xtensa@linux-xtensa.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_045726_550634_8DC34FD1 
X-CRM114-Status: GOOD (  12.43  )
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

Hi Russell,

On Thu, Apr 14, 2022 at 12:12 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> I'm surprised this didn't trigger checkpatch to warn. From
> coding-style:
>
> 6.1) Function prototypes
> Do not use the ``extern`` keyword with function declarations as this makes
> lines longer and isn't strictly necessary.

Okay, will do for v+1.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
