Return-Path: <SRS0=sMkx=M3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 967ACC4338F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 03:55:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59CB160D07
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 03:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59CB160D07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=MdOawBjrVdOBoaGCNonclkEXjmsr1bZlNcZMEc+0gN8=; b=PobRjsAnuliKeGyRKA2/0jPxrY
	z9JynApOa+rHtwBq5Et9AjdzI1kOlgo4UY7c+CevxTAYCUg4H5Uvw1LkjwLeh3Vq9T8g0jn3rL8hC
	oMqVz0VL18rrdkLwLu7Yx4SG2ihyGy1gcQvjviz3HL0v8DELwztbRG+TJSylVUDGVlW90fwIzqMs0
	x8gbhJW0KHi48vbuZIGCdwrzssLZdX84YEzvMM5C5hLMdXvZJuUZ7PaEE0o1sf9As2jZ9COs7yllZ
	MdFsSDMrlxVSWbakEIpZVogD2eTEBP89NC6i+i9kfGqTzu1UPsmlWbRvoF8HeahH9xsrR4fKEExZD
	0t1PFOIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mB7zm-004iBC-M2; Wed, 04 Aug 2021 03:55:06 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mB7zj-004iAQ-3M
 for linux-riscv@lists.infradead.org; Wed, 04 Aug 2021 03:55:04 +0000
Received: by mail-pj1-x1031.google.com with SMTP id j1so1117754pjv.3
 for <linux-riscv@lists.infradead.org>; Tue, 03 Aug 2021 20:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ty5sLKqikCprhTqXBn7mGVyZPTaeUkfmadpSzK6JouQ=;
 b=ub6PdD8k3w2qptjxXHE5ll6eh2H8dMg78J/6cmuXDJ0rWjrUYp3rW0p04ilG70NiZB
 tl9ovXiC7aNVJ+ke5F5IQ2j6J1ce3PyGpFj6PIuKXdpVeFDbeRM0jm6TbvDyKjKiq5Bf
 zo+tiR8vRhPcNg1qPgf+Vtdn7ELSlT5+/4KgIY6mOMseLH5MwVbupXF/XYlc2aNLtBq0
 a/lqZH+yOIPBbf/pCfqC2h9aTH5vqvJuaDtJieqEmw7l8uSF2YhwP5qPCwhjQq4s+hjf
 qlQ/DoXAZCNswBIQnZR6HlGSE7RprVxFy5BTat0nUg/Wyc1++9mRoX7zOt0NCcCpEEaX
 2gKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ty5sLKqikCprhTqXBn7mGVyZPTaeUkfmadpSzK6JouQ=;
 b=APz02R1Rr7/TQdLRqX/hdS/UfT06lEMKKh1EekiogY1AzyxbVmcwsqP8PV3GOLd3nE
 GhvZKMmBxdRNkP/OGZQcG9YPzOP3VI3mCdC2Lf3FD8OM8XHtgqr279Bcri0RySNqFmL4
 wdgPjcin2qu1v2S4K1ErFgafT3k/jdc/R9h7jDtMOo7JXrlr0oP65vSE0lUmPnyyM0mi
 Xo4IEaKdeM7Y8zvlxwepKijSx91FdyUhYRn9s2I168dySpWhImmLM/BATaJGmdVvBCVt
 vfB8exv3WcRaZWv68yLKz1HqQ8jFE91w6vgScbzN/95oGyKfpUlEiIqPpxF94gSmctZp
 pN/g==
X-Gm-Message-State: AOAM533gxyI8Q4R+4aT4VLDqQNsO4Y2kYPUGp2Mi5T0M1NCoZKdBkK8k
 JEVUtY4YUSFCLPB2WcBIFEDhQg==
X-Google-Smtp-Source: ABdhPJys6OFdQt2MwhQaEwuFopeRUiCsAm/1W1vzJ8t9FF0RiA0oORbu+y3XDvWSuPjEpIhVar+o6Q==
X-Received: by 2002:a17:902:9f8c:b029:12b:da2e:9463 with SMTP id
 g12-20020a1709029f8cb029012bda2e9463mr21466279plq.79.1628049302336; 
 Tue, 03 Aug 2021 20:55:02 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id n1sm816200pgt.63.2021.08.03.20.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 20:55:01 -0700 (PDT)
Date: Tue, 03 Aug 2021 20:55:01 -0700 (PDT)
X-Google-Original-Date: Tue, 03 Aug 2021 20:54:46 PDT (-0700)
Subject: Re: [PATCH 2/2] riscv: dts: microchip: Add ethernet0 to the aliases
 node
In-Reply-To: <CAMuHMdVfRSGQcBQEFVbUZjoRBKHxPJnbXkddZvF8vcSDQ1v5jg@mail.gmail.com>
CC: bmeng.cn@gmail.com, lewis.hanly@microchip.com,
 Atish Patra <Atish.Patra@wdc.com>, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 bin.meng@windriver.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: geert@linux-m68k.org
Message-ID: <mhng-78538c33-fe7b-4eea-83c7-5dfe4f5824d1@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_205503_184150_2E4E312A 
X-CRM114-Status: GOOD (  22.07  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 16 Jul 2021 04:34:02 PDT (-0700), geert@linux-m68k.org wrote:
> Hi Bin,
>
> On Fri, Jul 16, 2021 at 12:14 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>> On Fri, Jul 16, 2021 at 5:23 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> > On Fri, Jul 2, 2021 at 3:44 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>> > > --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
>> > > +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
>> > > @@ -9,6 +9,10 @@ / {
>> > >         model = "Microchip MPFS Icicle Kit";
>> > >         compatible = "microchip,mpfs-icicle-kit";
>> > >
>> > > +       aliases {
>> > > +               ethernet0 = &emac1;
>> > > +       };
>> > > +
>> > >         chosen {
>> > >         };
>> >
>> > This should be added to the board DTS (microchip-mpfs-icicle-kit.dts)
>> > instead.
>>
>> I was wondering the same thing before doing this, but when I checked
>> all other DTS in arch/riscv/boot I found the aliases node is put in
>> the SoC dtsi file instead of the board on so I think that's the
>> convention.
>
> The numbering of the aliases is supposed to match the labels on the
> board, hence it is board-specific, not SoC-specific.
>
> Gr{oetje,eeting}s,
>
>                         Geert

I don't see a v2 of this.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
