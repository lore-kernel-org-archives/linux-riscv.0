Return-Path: <SRS0=q2sy=AK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D73EC433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 23:34:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D00C20786
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 23:34:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cO/DOqE0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="RX9BaxYF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D00C20786
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=NtQ3+KfgJMxgFpVm4FIqVHRzn7Erzvu2eOdlXSGZXtg=; b=cO/DOqE0bCAY5CbSu6jbQQ2oj
	kKDezY4i1CeF5harn62nDuTiYriTR0R+k2IwulgWhmvDOpXRV80gGHmuj7+EdbhSdayx3HlVd+7sl
	6BckCKBxmm3G2KlGnLlG8f7ZH8463dHi4aC3px1MZUfqX0h/C4gzmfYYX/XRU0OyTZicgyNtZQcQq
	blNbtI8RV5Hi6wprC5M+03KDaDZ+rPZ8Z+c43YMI3U/9WjZcvxUvJfIgi9rWZrfzU6UvuT+t2RrNY
	MMUhlW1cBHUK1usvXnpC+0j3Pn8ID+kfGDUcy2b3JWFn3pPLcrSh0V1RnhuP+H6WKpgqGA6mg7wvk
	QbXllyszA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq3I3-0007op-Aj; Mon, 29 Jun 2020 23:34:19 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq3Hz-0007oE-9H
 for linux-riscv@lists.infradead.org; Mon, 29 Jun 2020 23:34:16 +0000
Received: by mail-pj1-x1044.google.com with SMTP id d6so8677759pjs.3
 for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2020 16:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Hg4NcTCj/IpKtz7wajO6KOiH6Qh4hIgKqaxhF9d2K/Y=;
 b=RX9BaxYF4c36rrH3fZ1WkWZFU/gGAw817z2vWTfYSuQf1p9IDNfZrcvAjhuo3olA9y
 oKplBpngaTSAtUmcLlARTdE5t2NAY4sE/Bxo7St9RETviaRPdLKgMgImUusuRBm1em6L
 xFzA9hlwtK6Y8VtfTNeVf8FRa0ppBhMFEXN4MKbKo55+OBAHE7v4I1qvLOsuYB0R7ZXt
 CVQfdZL9tqEbPG4rA9LCYTyZOR8bpTZZvNDFTf/SBtUA8y+uyjqOspxkD+Yz0845l9nC
 oGhNqZ+AihyPlUXQpiO4dL+2wPkgnoarJZTNKIo4Oz30xV1Rr6l9O0veq0iuxSttxXAT
 FJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Hg4NcTCj/IpKtz7wajO6KOiH6Qh4hIgKqaxhF9d2K/Y=;
 b=SAPZA2LzvnISEiMUuhWSLkKuZ3/Y9E4MOcN6ZQ0XcVx8PqJw5LMxhn0qBtAyxxSzJG
 QWRlVfVKGN4VOykIB6ZgtQvonD76jl9Kx+GR+VbEObW3sxaWr2Y8hp5jKA4MlkdQEV+k
 qtfXudW8RlvpqZQxk2xUlYLnIPUriLHVa2geVWIArdYHK57K9wwhP2OjdokMYEGgUxXN
 iLZeol6pX9rwClQuLB3euRT7AkGzZeH+d+E6Y1YJS8uiurrrHiWWN1wpYrSwYCjs3yDl
 0ZM9ELTWGv8OEDq3RLzDR9hpry/Aqgtljx//FVth9NNeGjtSR1juwbQo2zRSRr/2PpdK
 ucTQ==
X-Gm-Message-State: AOAM532UVar5MEXPlRGuOEHEdNkjbfGU4+2P6wlH1F2IiU88Ki4+8pyU
 JDYYxxgtTIgH9NJdrfaEvs5T8Q==
X-Google-Smtp-Source: ABdhPJyeXKsR9/YkJWUi1Eb9n61S2PLpkQv/VrGe7uSNFC57NxbCXC6ZwbfII55jb66BZ7S8+q0iWQ==
X-Received: by 2002:a17:90b:3d7:: with SMTP id
 go23mr19731077pjb.157.1593473651120; 
 Mon, 29 Jun 2020 16:34:11 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id n189sm653777pfn.108.2020.06.29.16.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 16:34:10 -0700 (PDT)
Date: Mon, 29 Jun 2020 16:34:10 -0700 (PDT)
X-Google-Original-Date: Mon, 29 Jun 2020 16:34:08 PDT (-0700)
Subject: Re: [PATCH] clk: sifive: allocate sufficient memory for struct
 __prci_data
In-Reply-To: <159347302727.1987609.17461999827407726291@swboyd.mtv.corp.google.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: sboyd@kernel.org
Message-ID: <mhng-f15789ef-8446-4dbe-a483-19d2f6c37b96@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
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
Cc: schwab@suse.de, mturquette@baylibre.com, stable@vger.kernel.org,
 vincent.chen@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 29 Jun 2020 16:23:47 PDT (-0700), sboyd@kernel.org wrote:
> Quoting Palmer Dabbelt (2020-06-25 15:13:39)
>> On Mon, 22 Jun 2020 18:24:17 PDT (-0700), vincent.chen@sifive.com wrote:
>> > The (struct __prci_data).hw_clks.hws is an array with dynamic elements.
>> > Using struct_size(pd, hw_clks.hws, ARRAY_SIZE(__prci_init_clocks))
>> > instead of sizeof(*pd) to get the correct memory size of
>> > struct __prci_data for sifive/fu540-prci. After applying this
>> > modifications, the kernel runs smoothly with CONFIG_SLAB_FREELIST_RANDOM
>> > enabled on the HiFive unleashed board.
>> >
>> > Fixes: 30b8e27e3b58 ("clk: sifive: add a driver for the SiFive FU540 PRCI IP block")
>> > Cc: stable@vger.kernel.org
>> > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
>> > ---
>> >  drivers/clk/sifive/fu540-prci.c | 5 ++++-
>> >  1 file changed, 4 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/clk/sifive/fu540-prci.c b/drivers/clk/sifive/fu540-prci.c
>> > index 6282ee2f361c..a8901f90a61a 100644
>> > --- a/drivers/clk/sifive/fu540-prci.c
>> > +++ b/drivers/clk/sifive/fu540-prci.c
>> > @@ -586,7 +586,10 @@ static int sifive_fu540_prci_probe(struct platform_device *pdev)
>> >       struct __prci_data *pd;
>> >       int r;
>> >
>> > -     pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
>> > +     pd = devm_kzalloc(dev,
>> > +                       struct_size(pd, hw_clks.hws,
>> > +                                   ARRAY_SIZE(__prci_init_clocks)),
>> > +                       GFP_KERNEL);
>> >       if (!pd)
>> >               return -ENOMEM;
>> 
>> This is on fixes, thanks!
>
> Does that mean applied to sifive tree? I see it in next but only noticed
> this by chance because it wasn't sent to the linux-clk mailing list.

Sorry, I was going a bit too fast and didn't realize this wasn't in arch/riscv/
so I didn't wait for an ack.  I put it on my fixes branch, which is what I sent
for the RCs.  That's merged into linux-next as well, as far as I understand
that's the normal way to do things.  It ended up in Linus' tree as d0a5fdf4cc83
("clk: sifive: allocate sufficient memory for struct __prci_data"), which is in
rc3.

We don't really have a SiFive tree, the SiFive stuff just goes in through the
RISC-V tree.  In theory I've been meaning to split them up for a while, but
given the maintainers are the same I just never got around to doing so.

LMK if I screwed something up.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
