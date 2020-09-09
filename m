Return-Path: <SRS0=4W5w=CS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2630AC433E2
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 03:12:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B11A220EDD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 03:12:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xupNgLNV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="TReKjmiI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B11A220EDD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=4Jo0dtk59kH4o3y69PH7/iqBQb/DnlJCxMH8Kxg6/L4=; b=xupNgLNV6JrVOLG1fhMyodSEP
	sohngacOE4YQAdlWVFtprqH9Rh1zEct0RL9a/xo7iegDufFjSGfu3BIDsaEpmqJWzMaX1oTT8RHhQ
	RrVsHC6/JOUc+vjq3y8rKhI5ev53JouXbSIT0OuoWOJT9SalslpkYf82S5DpJNzVXwgV+L7kNgdPc
	4xGm1QpUWqE50VKUvWncCYK9m+o7GJCl+Yrl9S+WjWdrDbfv84lVxD99T/Zx1U4OZx4Xdza83URsp
	P3JqZiPhcxNtwRPhlVMO/Cu8PXfP6VuhgUz4M8i6nQZa0k+kro1ZezK6nkZQDJblJCNnapqwmDUoj
	MABAOwIwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFqWz-0002Ad-O3; Wed, 09 Sep 2020 03:12:21 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFqWy-0002A0-4D
 for linux-riscv@lists.infradead.org; Wed, 09 Sep 2020 03:12:21 +0000
Received: by mail-pf1-x443.google.com with SMTP id w7so897576pfi.4
 for <linux-riscv@lists.infradead.org>; Tue, 08 Sep 2020 20:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=68ipujDablGcEJonPET//NBEYZiQNXSeSF+EeohflME=;
 b=TReKjmiIL072PrYgIA4/D2VQXd+J56RQ/DSJXM7PBArTdXh4/GxSAbvdgGzsHJAyn7
 ZzJPgLqDko2UBN0UMQ3m456optZlKtqlwx+HGq60uJYI57g0ev1xOoEGkDujuTfmrTRo
 FiH/R/Czt0dHCsH1fPA2Uzh2Ecn3HY2ieoZ+DwzBrbfkiDk1bLTXUWeOuqtQtPb3I8Hl
 nrCx1lN7nhoqvEuuNM+G9SPLizyqNFZ3Dls+kQWqSvFJQiPVPYXD/2VYDJ5DyPQLz03B
 1AQRz66PFO6KIS+LKsdx//tDLK7+cJRDShEZyTFsprfBX/yQz0MF5rCeCwec0jk3i8oG
 dXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=68ipujDablGcEJonPET//NBEYZiQNXSeSF+EeohflME=;
 b=EvzZRfwuszHs1wISMAbK1B+87xjjr0xc7lMHjg/v5HM48JuYcScS9PSeib+cZhxkEX
 eb9jZEvyjngZ/sIBdydbLh2BNcmoZo6ome9UnCEdi8r+mgY+v5R7y2ly72w81cpovvaC
 PP4U9SMZJw3HFlXWE/Z9aC+Z8F0DK8AzyxFZf48tcRLFSsXmAK9HKIvGIQ25eYUNIXsN
 1VSPw4U9vz+dQt9+2JVvMuMSc3zBlbAMRYcSOV2M6RLbXJlcKdC8pFAFhoTxslUvmeR9
 EwDD2HF7De/MObRHLzwcattt9Zb2er+EdDVaXsTfPbZdJfkOUW9SJ6qZopTLSjLINEJw
 7TyA==
X-Gm-Message-State: AOAM531EGHIVyumBcJM0EFx0L5XHcgb1M/BB1ue16pT28eA3gZXhWvAW
 KTlJT4Q/kJp0qYyLFx3fQYzmCQ==
X-Google-Smtp-Source: ABdhPJwexB0r5HrP0KwYZnG4eojTsfNQqFJlDv8+/BCwJd3a9eEytgZ8MppW46t1gK2A2ChRvfFYPw==
X-Received: by 2002:a63:5b64:: with SMTP id l36mr1371109pgm.413.1599621136651; 
 Tue, 08 Sep 2020 20:12:16 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id b20sm809072pfb.198.2020.09.08.20.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 20:12:16 -0700 (PDT)
Date: Tue, 08 Sep 2020 20:12:16 -0700 (PDT)
X-Google-Original-Date: Tue, 08 Sep 2020 20:12:09 PDT (-0700)
Subject: Re: [PATCH v2 2/3] soc: sifive: Add SiFive specific Cadence DDR
 controller driver
In-Reply-To: <20200907061126.GA14999@infradead.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Christoph Hellwig <hch@infradead.org>, dkangude@cadence.com
Message-ID: <mhng-d2a95187-c772-4c5d-b30b-b053a3195177@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_231220_313969_4D4DC85D 
X-CRM114-Status: GOOD (  24.61  )
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
Cc: devicetree@vger.kernel.org, tony.luck@intel.com,
 linux-kernel@vger.kernel.org, rrichter@marvell.com, sachin.ghadi@sifive.com,
 yash.shah@sifive.com, robh+dt@kernel.org, bp@alien8.de,
 Paul Walmsley <paul.walmsley@sifive.com>, james.morse@arm.com,
 linux-riscv@lists.infradead.org, mchehab@kernel.org, aou@eecs.berkeley.edu,
 linux-edac@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 06 Sep 2020 23:11:26 PDT (-0700), Christoph Hellwig wrote:
> On Mon, Sep 07, 2020 at 11:17:58AM +0530, Yash Shah wrote:
>> Add a driver to manage the Cadence DDR controller present on SiFive SoCs
>> At present the driver manages the EDAC feature of the DDR controller.
>> Additional features may be added to the driver in future to control
>> other aspects of the DDR controller.
>
> So if this is a generic(ish) Cadence IP block shouldn't it be named
> Cadence and made generic?  Or is the frontend somehow SiFive specific?

For some reason I thought we had a SiFive-specific interface to this, but I may
have gotten that confused with something else as it's been a while.  Someone
from SiFive would probably have a better idea, but it looks like the person I'd
ask isn't thereany more so I'm all out of options ;)

It looks like there was a very similar driver posted by Dhananjay Kangude from
Cadence in April: https://lkml.org/lkml/2020/4/6/358 .  Some of the register
definitions seem to be different, but the code I looked at is very similar so
there's at least some bits that could be shared.  I found a v4 of that patch
set, but that was back in May: https://lkml.org/lkml/2020/5/11/912 .  It
alludes to a v5, but I can't find one.  I've added Dhananjay, maybe he knows
what's up?

I don't know enough about the block to know if the subtle difference in
register names/offsets means.  They look properly jumbled up (ie, not just an
offset), so maybe there's just different versions or that's the SiFive-specific
part I had bouncing around my head?  Either way, it seems like one driver with
some simple configuration could handle both of these -- either sticking the
offsets in the DT (if they're going to be different everywhere) or by coming up
with some version sort of thing (if there's a handful of these).

I'm now also a bit worried about the provenace of this code.  The two drivers
are errily similar -- for example, the variable definitions in handle_ce()

       u64 err_c_addr = 0x0;
       u64 err_c_data = 0x0;
       u32 err_c_synd, err_c_id;
       u32 sig_val_l, sig_val_h;

are exactly the same.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
