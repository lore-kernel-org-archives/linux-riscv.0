Return-Path: <SRS0=Z+hV=TZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56BCBC07542
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 25 May 2019 18:10:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AEF5216E3
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 25 May 2019 18:10:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MHOWlzQU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="IQ60YP3w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AEF5216E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hjbSaay2z7/BBbpg0TmkxuMEUjgPNa+C8gUVkwvWmHg=; b=MHOWlzQUKg2TBD
	inUTTvO3m024Kleh9zHxJbukoe4pYp74kAyeN+Mhm0+ZfnLLtvL1PSwAAagNGxh+/3zMDRQZYEISf
	heICV66LywhR1EvYTBDknnfyQ+gKIfnwsC1geYhjVqLCgvR3ZpSHJtT+hDMOOKNHyjfdc2IZzapUU
	s0tcTJckI7zU9FaW2ls6LOKj1r8ppc2qxSZ+PWXqpV4d8vBYMYoqtgZ9jbX0A912fpLqyAqBaqt3I
	2vq9sg5zfmOdSNj+/mVme24HB44bBgEh4hd4yPHCeP3oovEnThcC7kAk68oReaVXqo+y/fwNrR931
	+e8uuw7lRR6jlM1A4GjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUb7A-0006z2-3q; Sat, 25 May 2019 18:09:52 +0000
Received: from mail-it1-x130.google.com ([2607:f8b0:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUb6w-0006mu-4E
 for linux-riscv@lists.infradead.org; Sat, 25 May 2019 18:09:45 +0000
Received: by mail-it1-x130.google.com with SMTP id h11so18500583itf.5
 for <linux-riscv@lists.infradead.org>; Sat, 25 May 2019 11:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=/JaboHZnwBxUnzeqi4AibllsqZoMBBRJcR7OzUX7KTo=;
 b=IQ60YP3wb1NiUfczQDEARl4dXc98AOjSH8tnQ7WxvhLP0kv9xSbH6SLGNnSEYMNRLQ
 jr6YdVUPVF3OVOCO0pkiXB4PP4TAkmu40s/NkXEUbhXPtQ3MH8dxZ/Cl4dFCPDwHnzRM
 prIRuxizYXcjonq8YX0pDDXLwsH6OJ6iWKAFcricTTIZYj66UtQJPTnAU76ixPoWOaZq
 ZB9vEwA3x9r1fMDF90Tx4d7EhbgolLI1B0CZNb1nFEZQp0GKQ+3kVtFLWoevKjZB4SlF
 yhJeRp7YOLh4RZ8SsIMxdhMoUUHO0EQW4elYMip4w29OLZhkyo6/82Y1jc1uXa8O9t0O
 SkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=/JaboHZnwBxUnzeqi4AibllsqZoMBBRJcR7OzUX7KTo=;
 b=ostYWhNjVHNw2aFuRYEVkLljt2GEOV+uXIQV1jQHWlh4n8g3KFpCpgxSyk9v1Kiovu
 73g0klClDik/S33UkG0REfjBTWnIHbTwBeVPnjZH+zUKG6jAGDKmiTDyNoTIONOba+n1
 TONi27yONigWvZCeTKZq9Xg4HyiBfUkjzlvJbE6aBxPgTA1XA5RvMaEoraPektSBidFB
 BN0HCa8TFmgqnQsLTxj/gZ+5OJPQdjFuBgRcWSH0Ex6sxZvrhuXZKBSpr33ZtJ8wxAhe
 Q98PmqvTCszz6kyypPS+c23jBk3VbRz3l00tPXBp/AXQu5waOUUMaFc0lBsRdVz2XEnK
 FXpQ==
X-Gm-Message-State: APjAAAUXek71uP4xj4A8Ea8rR/8KgWTJTv0jKDxTSqnozR1hH197eYNv
 S5iMjE2p6eUTA6+7xBZIzBtFyQ==
X-Google-Smtp-Source: APXvYqzvHc4gQutFUGlCUVjIl8eF8EVA69x1nY8wX8KqUyHou2jspyDrPIugJgtEJdRt8SLQ5t3bLg==
X-Received: by 2002:a24:3304:: with SMTP id k4mr16686643itk.161.1558807767236; 
 Sat, 25 May 2019 11:09:27 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 z21sm2353548ioz.16.2019.05.25.11.09.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 25 May 2019 11:09:26 -0700 (PDT)
Date: Sat, 25 May 2019 11:09:25 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Troy Benjegerdes <troy.benjegerdes@sifive.com>
Subject: Re: 5.2-rc1 boot on Unleashed
In-Reply-To: <2818D3E3-3BDB-442B-822D-0FD221BCCA05@sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1905251058100.15661@viisi.sifive.com>
References: <5c1ffb76-b18a-dbae-d3ad-f3d2cd41ee44@wdc.com>
 <alpine.DEB.2.21.9999.1905220942040.20842@viisi.sifive.com>
 <db248e63-c0bc-7fd8-cf2d-d13c8f140036@wdc.com>
 <alpine.DEB.2.21.9999.1905221334460.23235@viisi.sifive.com>
 <8F4FB234-FD5B-4AD6-99BD-57A40A79A024@sifive.com>
 <aac8c9b2-1b8d-e87d-88a5-f13222004a88@wdc.com>
 <2818D3E3-3BDB-442B-822D-0FD221BCCA05@sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190525_110938_206608_785D80E7 
X-CRM114-Status: GOOD (  10.36  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Anup Patel <Anup.Patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 24 May 2019, Troy Benjegerdes wrote:

> I have no issues updating the PRCI driver DT format if we also have the 
> rest of the DT entries needed to boot a working system

Now is the time to fix the U-boot PRCI issue upstream.  Fixing that should 
be straightforward, and should be enough to boot the system with initramfs 
and a serial console.  The missing patch is currently blocking others from 
using U-boot-based boot flows on Aloe.

> I just have not seen an example of that other than what I have at 
> https://github.com/sifive/HiFive_U-Boot/blob/regression/arch/riscv/dts/hifive_u540.dts

I sent you a pointer to a branch a few days ago that contains the most 
recent mainline-bound DTS data.  That should be enough to verify that the 
basic boot works.  If you want to keep up with the ongoing development of 
that data, the best bet is to subscribe to the linux-riscv mailing list.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
