Return-Path: <SRS0=n+Lk=AU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624E4C433DF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 20:48:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D3C920775
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 20:48:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jDXMG/Hs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="YmgJb4OE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D3C920775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=dfqf/JffBo0GKgBQLIEtqkaC83d9/Fvu25YvUznhzJ4=; b=jDXMG/Hs4Q85djlq2/6BCJM2C
	cJrOPnbrTtx4PapWawhdlBAlQBbWtGo2KnT4hhsuq34deHXs34+HeFM9dsbd0IBj8hUvnQvfpDEO1
	1MsCycd8pWQozbLqi2V3jdH0ofLMUn3DxZ3x2cgIGB0Msx3sZex6DZ7YVJjFqQLZSdEL0R6NOaliD
	fCB8D2m3NFqEKUt0d4x8c9ZZXy0BWqNUmwJRPwlqjdVb/auURsx7TU35ldxDkJUFMYNPpCMRoG/nD
	BVYa9y/16y6lsamcvKeZCAiXKsHDEzoxd5A71OWWmgsqK2qxJoc7Xiz5vbYqyPo5Y8hMZ3JfXQ/kY
	7QhOYH2qQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtdSl-0008GE-Vh; Thu, 09 Jul 2020 20:48:12 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtdSj-0008FB-3E
 for linux-riscv@lists.infradead.org; Thu, 09 Jul 2020 20:48:10 +0000
Received: by mail-pf1-x444.google.com with SMTP id u5so1513439pfn.7
 for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2020 13:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=jTCvng34NAGF7sMyc3FbW/vYJ5gq3hAUCGDsqstPZWo=;
 b=YmgJb4OEbddjH0aFgvWclH8eux8u4VwcyedrNoJtrVQkfpTtpBm5hdY++YaXJujf75
 VbLGwBST0wWJ/+Rim4vPOWS+12yWlSQg+e/oV909bcXY9p2ivYnUl9iR1boNfefgAVMV
 vBS4/oLaiqntS4cu4W8SI9wkHy1Bb5CP0SljRkgeFIUaa2Pbw2h1sbt/Q6zAUqV0//nz
 PLo4PhVxOgUa3fGrGYML2CFqfL9W+yL49TBBzB01/r10q2/e5kuFdnVWNe+jc84HSqjV
 EMuCacfRJqDZ2WkUykLBKaKwOLoJ9PlSTwlO9qobcn4hogY4uyP+SbVYmSKHght1Q8hX
 Vf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=jTCvng34NAGF7sMyc3FbW/vYJ5gq3hAUCGDsqstPZWo=;
 b=XFx8imCVMsTdRK7Dj6vbPjTJR721W35vf8POi1EQuelwwW5OPrQhS2odSG8qicS4hR
 AYjDWjaMG3OZ5fLRwUIqQzjsrnEMt3pZ1whsyQrSkuPp6P3q/czb7nV0o5yh95+hF+pJ
 jmtfxq+b2MD56NoT5u9o+JNxoWrJVODpQwcn7XRAuFo2KRnKcuJEibUD4otJ/9NZPXMs
 nv0GjqVIT7hOZWt+BFhqX3zeifrCWGPq7GilSsxoYRhGXxQg6u3I+R+Fh9Chg3AlveHb
 IeeeN1pwaBivhMD/0nIbSRSRNxkVsP2eWFxl5Np1FgDikfY1Zw6jHV6ehMiT5bCFLrpW
 9pVw==
X-Gm-Message-State: AOAM531PSKH0Y7QHWTInzLvRPKK/fGovWBg6voSce7z6vsg/MnQt+h/Y
 GnOTRla6a4a1/BJHdsxbnnnMkQ==
X-Google-Smtp-Source: ABdhPJzD08leG5+HDEW9JWrbjTdvca8V3V6gw8P3OjNQsMeXQUduJQNOkbwOIjqGHIZryWcZESievw==
X-Received: by 2002:a63:4d3:: with SMTP id 202mr55805628pge.14.1594327686420; 
 Thu, 09 Jul 2020 13:48:06 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id r191sm3631054pfr.181.2020.07.09.13.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 13:48:05 -0700 (PDT)
Date: Thu, 09 Jul 2020 13:48:05 -0700 (PDT)
X-Google-Original-Date: Thu, 09 Jul 2020 13:47:53 PDT (-0700)
Subject: Re: [PATCH 0/3] Dynamic CPU frequency switching for the HiFive
In-Reply-To: <mvmtuylcb4h.fsf@suse.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: schwab@suse.de
Message-ID: <mhng-da95d8d4-c593-4c23-a543-bfe9d8c8e40b@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_164809_154143_C4058002 
X-CRM114-Status: GOOD (  15.44  )
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 david.abdurachmanov@gmail.com, anup@brainfault.org, lollivier@baylibre.com,
 linux-kernel@vger.kernel.org, green.wan@sifive.com,
 Atish Patra <Atish.Patra@wdc.com>, yash.shah@sifive.com, robh+dt@kernel.org,
 Alistair Francis <Alistair.Francis@wdc.com>, sachin.ghadi@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 bmeng.cn@gmail.com, deepa.kernel@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 06 Jul 2020 01:15:42 PDT (-0700), schwab@suse.de wrote:
> On Jul 03 2020, Yash Shah wrote:
>
>> Yes, you are right. The userspace governor is the only one supported.
>
> That doesn't make sense to me.  How is the userspace governor different
> from any other governor?

It's not.

The issue here is that pretty much everything is on one clock, including all
the cores and the simple IO devices.  These IO devices have programmable clock
dividers that need to mesh up with the input clock rate in order to operate
correctly.  There's no way to do that atomicly WRT the device's clock, so we
have to pause device IO while messing with the clocks.

I bet there's some issue with 4cbd7814bbd5 ("tty: sifive: Finish transmission
before changing the clock") that's causing the serial to get corrupted, and I
guess I'd start with all the issues I pointed out in the patch text :).
Presumably we need to fix the SPI driver as well, in much the same fashion
(though hopefully with fewer hardware surprises to work around).  I'd be way
more worried about ChipLink, as I don't know how that's clocked.  IIRC Ethernet
has its own clock so it should be safe.

I'd be very skeptical about turning on dynamic frequency scaling for the HiFive
Unleashed, as it's probably just not worth chasing the long tail of bugs.  Even
allowing the userspace governor is a bit sketchy, but given that it's a very
early dev board I assume these sorts of problems are expected.

If we do ever turn dynamic frequency scaling on it's not going to default to
allowing 1.4GHz, from what I saw speeds much over 1GHz don't work for most
people.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
