Return-Path: <SRS0=aCEi=AY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD501C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2020 09:16:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 980522067D
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2020 09:16:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wiu6gK/b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 980522067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Wumf/Jm8O9sAzCjXl2X8QXkRAju3DW1zVELl0kijX8g=; b=wiu6gK/bdKJi+3qEBTduFj/U8
	wLd2vHzWkcfQfO3n5w9rMmk9i92gKZUTvqOStTYXL5Kn3v0lE7BP70raP0CXzmIVs4vlz+ym3TF3o
	wFT8+TXoaWDiPvjt64aXHP7vrZrvjm1gMYVK5UpoxrPCmsOGRUL2SLBc5efiIEnCZ1/DY8bKnw8mV
	V7xlJTrrarNCKTz9YfBuDRzEGIwd12Z+N45DfVivR8WHf9D9B502XNInImsFZwCdlqJTSxEeTGl3A
	Zif3w4CxReBqpV75+8uLZCac/6PVsxePMJwjuSbEyQH1gAgL2+qSOZ78d05AsCT/5Pn/tIY0KxB0L
	b150DaglQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juuZi-0006YV-8e; Mon, 13 Jul 2020 09:16:38 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juuZg-0006Y2-Pz
 for linux-riscv@lists.infradead.org; Mon, 13 Jul 2020 09:16:37 +0000
Received: by mail-oi1-f193.google.com with SMTP id t4so10397259oij.9
 for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2020 02:16:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9nv2vtxhSh+ZKUdTydfbNIbF9mND4vrqOIiE1Ajf6/Y=;
 b=NZ6cDDzw292ys2ub1tnkOMWeEITOxzgcdInKxrJxAwi3kE2pzQY+yiAmL9kZ2Vltim
 R9nF0iH8TPNdpZL97U/FFaWtrzBeKWo2N7OgR2nFpHqbFvIr1qw/VNs3pmqzrgUbS7NN
 kCzM/2kCeTGVgNqpa972iPphMlO4fc7von7AKEjskvWC659psqmoNtipiXIevijxQvlw
 9232rtfJvMyBbDCi/jgenrL434hRCaBf1PTM2EdIxXjRvWSFhyTfCEGHQXQT9vt+ALS8
 qY8yowePKvlOTYEAuMtZKnEE4ZO0/2poTh7ToJeky83/GnUJ0J9DV741wAWxHhgipQP2
 Fdmw==
X-Gm-Message-State: AOAM5318xOXQ5A0kl1ti3iyVyswLc6JnAydmMWFQlnfLyoSUlCa4dvsL
 bgrr4ZqHmNmPzmmcHTJwr6pEBtRbyfykps6tTkw=
X-Google-Smtp-Source: ABdhPJyOy0X7AvLPgPT1hOSMERCtAXtP3F/7/Ig/A0LXkb1aAY4y0Dm1uV0JHAeN/dwmm0qFtnvwrS/KuGqrdgun+cU=
X-Received: by 2002:a05:6808:64a:: with SMTP id
 z10mr13204412oih.54.1594631795385; 
 Mon, 13 Jul 2020 02:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200710135706.537715-1-hch@lst.de>
 <20200710135706.537715-5-hch@lst.de>
In-Reply-To: <20200710135706.537715-5-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2020 11:16:24 +0200
Message-ID: <CAMuHMdXQGj=ic_8U4GRmpPtECsC=2pVi-Mjrek9RoC-126yDRg@mail.gmail.com>
Subject: Re: [PATCH 4/6] uaccess: remove segment_eq
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_051636_872795_B911A1A8 
X-CRM114-Status: GOOD (  10.16  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Linux-Arch <linux-arch@vger.kernel.org>, Nick Hu <nickhu@andestech.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vincent Chen <deanbo422@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 10, 2020 at 3:58 PM Christoph Hellwig <hch@lst.de> wrote:
> segment_eq is only used to implement uaccess_kernel.  Just open code
> uaccess_kernel in the arch uaccess headers and remove one layer of
> indirection.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

>  arch/m68k/include/asm/segment.h       | 2 +-

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
