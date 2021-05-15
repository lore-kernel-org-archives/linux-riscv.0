Return-Path: <SRS0=yiB6=KK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D5CC433ED
	for <linux-riscv@archiver.kernel.org>; Sat, 15 May 2021 09:56:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 015D26112D
	for <linux-riscv@archiver.kernel.org>; Sat, 15 May 2021 09:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 015D26112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lGb/USjZPVmY6Z0oN0NSQSi8+ZRaUmygNP8w2KoEDU8=; b=hPByDz4c1qYmbHlKKEKnhhSIn
	TU6FG8c7FNkYIPcSy6vhzwb9nktbq+27U6th3OH3nP1Ny7iso0jHQRYESLXrflMGlRaoTb/IVph1Q
	mDMwyVMvsxym/UrSks7sTaYDPIK8W/5Qq3TbPPY+5tQ0lT5Rg0ZN9n5+VHNtrOhjKS2xuO4QtNmNK
	F/mDLP/iID9WTsLL/ZBat/zv+37ddKtwwcRcNgVDvDXNPfEf3uTz7DEn4CTxKvvQBuZ0C7psdXU0d
	HjpfB5U2OkNWCpSUK4IBQoLD9abERVHpTiEsf4HwCNUWaewaSvdSywHWBuWDo35Ez6obwDqGjA4wH
	iGHYc/tGg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhr1w-00A6sM-IW; Sat, 15 May 2021 09:56:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhr1u-00A6rT-06; Sat, 15 May 2021 09:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=URxN4xoRvZzE6HfX66ZUIxndi4gFFt0GbtPHvIyYxcw=; b=oPwg12KozdL933Q39YXl2b29XD
 SkbIWz/cP2fdS67MGafRXocsoDdoTPH/OYjFtweMlEHGuKt3zBd+R2YqP1I/9g9eWnPsfJ/xiW3Rb
 DpRgLsAQFkqt81RGZMKbhFJGc8n2LZrQC7Y+6EptB9n1Ptt4NgS0I8nOrdkV0LHE1UkPeBGRLVeiP
 eXY2DZ3N1YeMxiWzdPF4d2yzTHu7LwxibnWx8pLUfN8Sjh2qwrfJTovP/MNFkPdJ//VQi5eeEwrP8
 VvPQhGm3TJSD2eLZg5gTL16KIv5UZKTZjpx0p0DYKUvxXHOKmx8qlTIBbf37zDk4lMdFATVxh+qSo
 Ss9p0AZA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhr1r-00CTfQ-I6; Sat, 15 May 2021 09:56:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC6B5613F5;
 Sat, 15 May 2021 09:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621072575;
 bh=xTDtBJ9V9VYwOUf/uC9UTFd+NHYG7n2WkwAKLnOotog=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZfV7S2lgmdAvPgP/14Cz0gdHfnetBWdk+Q+d8pV0P00a1HmCgumdcMwm0PNT+Pqjw
 e/MA68F5K9M9Qphu5vpeMC6AffSf74ZmrYjMh2DZMw/qgkXpSi0gdGanccgi7MiBWX
 dQsLBQU1zqe75bZWo2v2x6VW3SFEXUPoJp8HBwG60r2B1UzIuucQ+j9sbcAOlKfX3T
 AeJotkFM/hq26/v31msWgWjR7qBNa0cYdrndqqdPuS1oerK+SHRbB/aLV/+SbPJp7t
 25Qlc1z5N91oBQvdAaoxmTPLyaSt/mDe39Dtn5h//hEXZwh+HQX52Peq/j/HaxA5U7
 AR6vH0QbEmzjA==
Received: by mail-wr1-f48.google.com with SMTP id m9so1522790wrx.3;
 Sat, 15 May 2021 02:56:14 -0700 (PDT)
X-Gm-Message-State: AOAM531u4wvbmLS3cOl2YlR7H6K/VVe1fJomuDX98XgtAFqxWgWxVlJ5
 lyTUQ7Kqq71BlKh5UHcUUNtXVK02oyL4/Z+0ZeE=
X-Google-Smtp-Source: ABdhPJyU1TeHsTyhdSvAyF4C1QTcXoaRrpe2s4yt2wtnu6GWm1DoLujaxn1SkUeZ3N6LZcimtNJwCO6vX/IPuQocx+g=
X-Received: by 2002:adf:fe04:: with SMTP id n4mr6852056wrr.361.1621072573589; 
 Sat, 15 May 2021 02:56:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210514220942.879805-1-arnd@kernel.org>
 <20210515064015.GA26545@lst.de>
In-Reply-To: <20210515064015.GA26545@lst.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 15 May 2021 11:55:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2ukLgV3K3sW8gkkz6cvKh+wmP_C0av2hnYcftfXMPTWA@mail.gmail.com>
Message-ID: <CAK8P3a2ukLgV3K3sW8gkkz6cvKh+wmP_C0av2hnYcftfXMPTWA@mail.gmail.com>
Subject: Re: [PATCH 0/5] asm-generic: strncpy_from_user/strnlen_user cleanup
To: Christoph Hellwig <hch@lst.de>
Cc: linux-arch <linux-arch@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Vineet Gupta <vgupta@synopsys.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Brian Cain <bcain@codeaurora.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Jeff Dike <jdike@addtoit.com>, 
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Sid Manning <sidneym@codeaurora.org>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, 
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, 
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-um <linux-um@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210515_025615_646570_44AA0FB8 
X-CRM114-Status: GOOD (  13.80  )
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

On Sat, May 15, 2021 at 8:40 AM Christoph Hellwig <hch@lst.de> wrote:
>
> I generall like this consolidation, but for the patches that remote
> the arch / asm-generic versions, can you please elaborate a little
> more why the lib version is preferable?  The current commit logs are
> not very informative.

Indeed. I do remember writing the patches last year thinking "this should
really get fixed", but apparently I failed to describe the actual problem at
the time. I have gone through it again and annotated what I found now,
but I have a feeling that there were additional problems with the old
code that I still did not capture.

Sending v2 now: same code, more text.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
