Return-Path: <SRS0=VhLN=P2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B9AC433EF
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Nov 2021 07:23:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B51766137D
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Nov 2021 07:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B51766137D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lh3R4gQlHrzw2CicjyAubyDtd+3PeCz34VZTi97D+sY=; b=fdqxTUcNq7XVTY
	YqDfOTRz1j5AeTLm0vncWpogdFveE1u7rc0dRp09d/J63lHmRV4YTr1h3XPhFTtZmMapCkMK4oI6t
	mT/kFbrZv6SsshnzBcsgbgQ3cmhuqHp4xUUwRGAPXpPcBYVoQOtLpzFsa8stG2qSCTRRvtlqDARyM
	dJVH6tBZmJdxSx5qCr22706jk63OR38DN380qc+NLHlQPHZcwZb3ABpuOrVoTRzNmGqOac3pH+xzW
	OitwNCNPC2FfAyukklO9htrKI3YduN/8UXOTWsU1u8LVYPWoHEucKRMrVOUo0iutXA6bX2HuCYcGl
	5lblzxCie3t/YTcnq4vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjcWR-00E3xK-QJ; Sun, 07 Nov 2021 07:23:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjcWO-00E3wD-Mv
 for linux-riscv@lists.infradead.org; Sun, 07 Nov 2021 07:23:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636269799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3RtXOitkDbgmdNskpNGQcKeBZZxTugWOTNvXI1LA5eE=;
 b=bCXM91lgm+h6yR6tpMtGZMCen0v/YbezVFCs0Ebnh/WM0A/VOSZ2kRsy0YV3EcQkb1hlTv
 9rQaracggPqr2N2PrTP/ClDo8iNxkgJ5B/NANTLIcZZrye72IGdbZleM1O7R1Yg2Sk9xLH
 X4lj2ZdcX6ExuPWo2jpZ/GO59VXAsXA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-7AGIw5JoP4mqKDY0fvEYhA-1; Sun, 07 Nov 2021 02:23:16 -0500
X-MC-Unique: 7AGIw5JoP4mqKDY0fvEYhA-1
Received: by mail-ed1-f70.google.com with SMTP id
 i22-20020a05640242d600b003e28aecc0afso12352453edc.1
 for <linux-riscv@lists.infradead.org>; Sun, 07 Nov 2021 00:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3RtXOitkDbgmdNskpNGQcKeBZZxTugWOTNvXI1LA5eE=;
 b=YjsRza0RnUg7Zi1Z8mUW5Adk6j9LlviKArCJRUwNMNEF+aABNGdvesn8qUEtmp2nly
 5JBGeVs+aAKoE5Ip41q2h73eoaPWLkuH8VQ8BBPqsEvKCSBkiaLjtE47pjsLUY7hSH1p
 8mvhOFdJJrax79cw9HTSxm04Ogb2m/VAmJ5bUKnefRHtffEepW7iWxs5Fc7997hYeX0f
 wWTrXD1z9lEdYfsh6Q3KEEe4s+Wtlr+AG06dMCK2rJJjNksaV8JUt3+JqOs1sWb8IodU
 zI/bVnpWrVNvEYiCrfacLoxmAAGHO2Dt9kWv6hVq/rhWjaNyVm4N7jexSFrsd9kwo8TR
 iPFQ==
X-Gm-Message-State: AOAM530pICPMBQSdNLdICFwQvOd7IHjn1woRLK+UHCZ2gkcUOw87/JRn
 tIT3aZ/Hm6CzjcwBW+NQM3FBz6lFS+d5MHKUK5bm3JELLJni/6q+rqU2S2idNjMlU7yINACPjKL
 pawRD+O4rT9wIKW9WWJxzhPslwpeeGDW6sBBcI4lSQ3nd
X-Received: by 2002:a17:906:38db:: with SMTP id
 r27mr85071574ejd.338.1636269795647; 
 Sun, 07 Nov 2021 00:23:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzc1hDrt/xpwiHiY5HIv5cMTET4wPhXlkE0U9ViPpgyODZ9hbdRxlZZsANe0jpLXhSz8/oNdv2YoMc9tNBgi2M=
X-Received: by 2002:a17:906:38db:: with SMTP id
 r27mr85071546ejd.338.1636269795503; 
 Sun, 07 Nov 2021 00:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211025040607.92786-1-wefu@redhat.com>
 <20211025040607.92786-3-wefu@redhat.com>
 <YXZU/3/YmRGFrOXK@infradead.org>
 <CA+YCwKkX64A8p9vfLJHC3+LqOWyDg99eDBR0mjfB=H45BOyJLQ@mail.gmail.com>
 <20211102060734.GB27015@lst.de>
In-Reply-To: <20211102060734.GB27015@lst.de>
From: Wei Fu <wefu@redhat.com>
Date: Sun, 7 Nov 2021 15:23:00 +0800
Message-ID: <CA+YCwKntSMv56zFP9wzysbQAWixDGA1R4Nyrmhc4Tn=_Byc+TQ@mail.gmail.com>
Subject: Re: [RESEND PATCH V3 2/2] riscv: add RISC-V Svpbmt extension supports
To: Christoph Hellwig <hch@lst.de>
Cc: Christoph Hellwig <hch@infradead.org>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, 
 Guo Ren <guoren@kernel.org>,
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Liu Shaohua <liush@allwinnertech.com>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, Aniket Ponkshe <aniket.ponkshe@canonical.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Gordan Markus <gordan.markus@canonical.com>, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, 
 Daniel Lustig <dlustig@nvidia.com>, Greg Favor <gfavor@ventanamicro.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 Xinhaoqu <xinhaoqu@huawei.com>, Bill Huffman <huffman@cadence.com>, 
 Nick Kossifidis <mick@ics.forth.gr>, Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wefu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_002320_831769_132E2346 
X-CRM114-Status: GOOD (  15.62  )
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

Hi Chistoph,

On Tue, Nov 2, 2021 at 2:07 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Oct 25, 2021 at 06:55:09PM +0800, Wei Fu wrote:
> > How about this macro:
> > #define _SVPBMT_PMA         0x0UL
> > #define _SVPBMT_NC         BIT(61)
> > #define _SVPBMT_IO         BIT(62)
> > #define _SVPBMT_MASK         GENMASK(62, 61)
>
> Personally I find these macros highly confusing.
>
> #define _SVPBMT_PMA     0UL
> #define _SVPBMT_NC      (1UL << 61)
> #define _SVPBMT_IO      (1UL << 62).
> #define _SVPBMT_MASK    (_SVPBMT_NC  | _SVPBMT_IO)
>
> is much eaier to follow.  Note that we can probably just drop
> _SVPBMT_PMA entirely to make this even more readable.

sure, I can do this , thanks

>
> > > Also why not use the standard names for these _PAGE bits used by
> > > most other architectures?
> >
> > Which names are you suggesting? Would you mind providing an example ?
> > _PAGE_BIT_   for _PAGE_KERNEL_ ??
>
> Use _PAGE_NOCACHE for _SVPBMT_NC, and _PAGE_IO for _SVPBMT_IO.

OK, Sure , will do

Great thanks

>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
