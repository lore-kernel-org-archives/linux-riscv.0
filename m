Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A98C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Apr 2022 13:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PQxqW92koYXZLyBpU2SiTDoSmLtz03pKa0lnoRUMqq4=; b=tCnlO4vcOByYZD
	TM/3l1f373cmEtQYRfEzT7rkdCSdsZd+m+FZAyu/BuZYL93mdLv7L5juEb1Fk/ssrZOCUaktW1TQz
	v40ANficAj6mKhpGkg5coNji/kp2zfBUKZQGx5c3tNbBjyRAHC4u4uGg3Ef50zxEWbkm2i0CVezeW
	qpk389XYQ6dYsgKG0uBKP1Zoi7Zb8jC7BijnCN6G+Z5ctRpomheADnXTrdEGaZxatSROuRCVhyyEW
	ZGXnlp5sBbojq1vPK9vwEzsrz90p1q+KOK4JAb94DnHjr2pb4RO5WJQKkOe9rK0luO5W/uJ5wbbc/
	OLGFYYQxaAn8pah9RL7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbMTP-00F2e3-BF; Mon, 04 Apr 2022 13:10:23 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbMTM-00F2ZZ-PT
 for linux-riscv@lists.infradead.org; Mon, 04 Apr 2022 13:10:22 +0000
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.95) with esmtps (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1nbMSf-00426f-IX; Mon, 04 Apr 2022 15:09:37 +0200
Received: from dynamic-077-183-077-178.77.183.pool.telefonica.de
 ([77.183.77.178] helo=[192.168.1.9])
 by inpost2.zedat.fu-berlin.de (Exim 4.95) with esmtpsa (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1nbMSf-0001in-BQ; Mon, 04 Apr 2022 15:09:37 +0200
Message-ID: <9c99caa1-d92d-2527-0918-17ee22a46637@physik.fu-berlin.de>
Date: Mon, 4 Apr 2022 15:09:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PULL] remove arch/h8300
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 "moderated list:H8/300 ARCHITECTURE"
 <uclinux-h8-devel@lists.sourceforge.jp>,
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Linux-sh list <linux-sh@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <Yib9F5SqKda/nH9c@infradead.org>
 <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org>
 <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 77.183.77.178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_061021_003283_DFD2A282 
X-CRM114-Status: GOOD (  11.63  )
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

Hello Arnd!

On 4/4/22 15:07, Arnd Bergmann wrote:
> 2. arch/sh Hitachi/Renesas sh2 (non-j2) support appears to be in a similar state
>     to h8300, I don't think anyone would miss it
> 
> 8<----- This may we where we want to draw the line ----
> 
> 3. arch/sh j2 support was added in 2016 and doesn't see a lot of
> changes, but I think
>     Rich still cares about it and wants to add J32 support (with MMU)
> in the future
> 
> 4. m68k Dragonball, Coldfire v2 and Coldfire v3 are just as obsolete as SH2 as
>    hardware is concerned, but Greg Ungerer keeps maintaining it, along with the
>    newer Coldfire v4 (with MMU)

I'm always interested in everything m68k and SH, so if something needs attention,
I'm happy to help. I actually have SH-2 hardware at home although I haven't tried
a recent kernel.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
