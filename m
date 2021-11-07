Return-Path: <SRS0=VhLN=P2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F6C5C433EF
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Nov 2021 06:55:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2455461107
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Nov 2021 06:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2455461107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PyIU/wxFQcb+E8GQBn5vYTKUOmEgQDiHNEmkXokftTs=; b=zDZvvzh60LDFtN
	BumN+uTx+yJIaYLFvVt4FKQ/TRpqCNFVU77pMUbR+G282YFxgXNAuZEs2hSr3vY0PRCpZc+UIVsCC
	xlDfliCZMBTV+XscbHyU1I1Z/i5uhQbaq0nuhNTu0Lwf/4bAc6qElIpU5QGxLfp/qjm/jrET7xYGV
	W1kaRi/NZARLdgh4EyYofiklhBgjj/zlbaDQBHJJZSGgatbLjFtegYlc6WE8YsNLZBstDuFj2FaK8
	I5FqEmhDYGeGV3opM27dcv9wAnyLlTCA6iqZnmoY0qnWnsAIYEC/9Cw+rgxlrt6ODK2SRToMVKwhn
	IIBzQDyP0sstuWLNY2kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjc54-00E1Lz-C8; Sun, 07 Nov 2021 06:55:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjc51-00E1Kw-VC
 for linux-riscv@lists.infradead.org; Sun, 07 Nov 2021 06:55:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636268101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yJxY26/cYBZ6YUnCJ38vkDeluB/MLpmcQCfkiskEl8U=;
 b=Tv+tp2cGBvZYzfscOUhSnK39up2Wy9qULip7swrbhyHVyo7dgFsVp8xNa9tCzk15zx6nwc
 FW8wWdEP9S88Ml8N2yG7rIuj4OtltUYXad/2KICNqIMcXIMzSZBpcOCUhrCCXYEpsxVLds
 HtfbvaK2t8Ged0eYLzUh62xOTLbmpgQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-GFNOYy9AOCaY-UBl3zsJSg-1; Sun, 07 Nov 2021 01:54:59 -0500
X-MC-Unique: GFNOYy9AOCaY-UBl3zsJSg-1
Received: by mail-ed1-f69.google.com with SMTP id
 g3-20020a056402424300b003e2981e1edbso12378958edb.3
 for <linux-riscv@lists.infradead.org>; Sat, 06 Nov 2021 23:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yJxY26/cYBZ6YUnCJ38vkDeluB/MLpmcQCfkiskEl8U=;
 b=1rUIPyC8KxJ447lzFKu7Elf3/GBu6gf1OIOeqz4n0WO1psfy1WJJGeGior0mr2jBPu
 QOr4pOfUXCclHuBIVox/MNjWfq16Usm1OCCXz+bLMLL+982bkvPqjOXdfwnyOI0ps7nq
 mP9Sptbqo33EcOUzU6KOmhf15w+SazzSCYQ3WEzPkkgCL1L7E8/iX1YKPLjEJOQFfqPn
 sVdxMi9ug+tvnRO9tuXqE/NnDjAr5MQ/lzt5z8k26cZLX/NjAgoBMjsZ25BCStMF4ZoI
 n2S+LVjPp4fHFS4VzODmQNtnXusJ0H4yXgyyhc2LDoBdwvrw4nHPcHZ2LsqrRgHJvzIQ
 9uHQ==
X-Gm-Message-State: AOAM533KIGLPw5K4hu28gOy0cIf5/Om6LbDZ7AKmTBT3XYo0gxA+tMy5
 s8mMCs9xHZbT5hCUNohzdvVkdtlWyyntiCzXngcfzMeKa+j2faDMT50eSW+JaryjRSWbXe+K3NS
 9BnwPzdnRTvcWC5ISKE/UOp72TUg6XtF5BkX8PykgQwfj
X-Received: by 2002:a50:fc85:: with SMTP id f5mr7946879edq.8.1636268098474;
 Sat, 06 Nov 2021 23:54:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3JeyTAUUv8o0kc/nibngzlpFKOPtDfmfYLQzSCyA3aUKsNaviwN7rWxMuORlT5E2rClYGMWlmOJlUubTyk38=
X-Received: by 2002:a50:fc85:: with SMTP id f5mr7946829edq.8.1636268098241;
 Sat, 06 Nov 2021 23:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <20211025040607.92786-1-wefu@redhat.com>
 <20211025040607.92786-3-wefu@redhat.com>
 <YXZU/3/YmRGFrOXK@infradead.org>
 <CA+YCwKn1VA8=NSa=bdhP99jfpokYGHBvqVSKvZmdndQOz6UUPA@mail.gmail.com>
 <20211102060424.GA27015@lst.de>
In-Reply-To: <20211102060424.GA27015@lst.de>
From: Wei Fu <wefu@redhat.com>
Date: Sun, 7 Nov 2021 14:54:47 +0800
Message-ID: <CA+YCwKk8Fa4ifaoQR=nHGXM2AHx9S8Ofow8H5dZ0bmjL49t=rw@mail.gmail.com>
Subject: Re: [RESEND PATCH V3 2/2] riscv: add RISC-V Svpbmt extension supports
To: Christoph Hellwig <hch@lst.de>
Cc: Christoph Hellwig <hch@infradead.org>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 guoren@kernel.org, 
 christoph.muellner@vrull.eu, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
 Liu Shaohua <liush@allwinnertech.com>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, taiten.peng@canonical.com, 
 aniket.ponkshe@canonical.com, heinrich.schuchardt@canonical.com, 
 gordan.markus@canonical.com, guoren@linux.alibaba.com, 
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
X-CRM114-CacheID: sfid-20211106_235504_108710_9188FF0D 
X-CRM114-Status: GOOD (  14.36  )
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

Hi Christoph,

Great thanks for your review.

On Tue, Nov 2, 2021 at 2:04 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Oct 25, 2021 at 10:49:11PM +0800, Wei Fu wrote:
> > > > +                                             >> _PAGE_PFN_SHIFT);
> > >
> > > >  static inline unsigned long _pmd_pfn(pmd_t pmd)
> > > >  {
> > > > -     return pmd_val(pmd) >> _PAGE_PFN_SHIFT;
> > > > +     return (pmd_val(pmd) & _PAGE_CHG_MASK) >> _PAGE_PFN_SHIFT;
> > > >  }
> > >
> > > The "(pud_val(pud) & _PAGE_CHG_MASK) >> _PAGE_PFN_SHIFT" expression begs
> > > for readable and well-documented helper.
> >
> > How about these:
> > #define _chg_of_pmd(pmd)  (pmd_val(pmd) & _PAGE_CHG_MASK)
> > #define _chg_of_pud(pud)  (pud_val(pud) & _PAGE_CHG_MASK)
>
> I'd use inline functions instead of macros if possible, but otherwise
> yes.

Great thanks for your suggestion,  I will change this to inline :-)


>
> > How about :
> >
> > extern unsigned long  _svpbmt_mask
> > extern unsigned long _svpbmt_mt_pma
> > extern unsigned long _svpbmt_mt_nc
> > extern unsigned long _svpbmt_mt_io
> >
> > #define _PAGE_MT_MASK              _svpbmt_mask
> > #define _PAGE_MT_PMA        _svpbmt_mt_pma
> > #define _PAGE_MT_NC          _svpbmt_mt_nc
> > #define _PAGE_MT_IO           _svpbmt_mt_io
>
> Looks much better.
Thanks , will do this way

>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
