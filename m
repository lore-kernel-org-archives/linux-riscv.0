Return-Path: <SRS0=N7Yn=RL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0239C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 16:51:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FEFA20868
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 16:51:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HBs+iIS4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="GNLPVRVA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FEFA20868
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Hr5WFnlPuOJTA2+ZckjT72Ll065pyovvl48XNvkOdY=; b=HBs+iIS4NLIJbb
	bfSXcxqnXqArhCcoA6qqjeckyfDNVd4CoecKUFlONV+MK5tMOPN76KUcsoVgqqpGb4M3gy+w8t7iS
	yvIdcN4X+ChXMZlr1C/GYNFVdNAN6USRwR7jmxHlSpLwyWMbijvRrJvmuXR3OjvJkTG/7biS8LWz1
	h2xiwF/B0eMRzMF3Ky7prONAVyE5+S+Q7fUvvHhUJMNq/O7pezlOV50/VvhfWenkGU3TGUsPNufBU
	ooF2R1CdousnslwvQ2BkSV49CTuQOo/WwT6OFqyYflBTqwet70l5kBSKziFWtVlLXpHtZPZPb6Vor
	WKBk/LI+7kFjZRv7c8JA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2Ii8-0004G1-Nm; Fri, 08 Mar 2019 16:51:04 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2Ii6-0004F7-J9
 for linux-riscv@lists.infradead.org; Fri, 08 Mar 2019 16:51:03 +0000
Received: by mail-wr1-x443.google.com with SMTP id r5so22072162wrg.9
 for <linux-riscv@lists.infradead.org>; Fri, 08 Mar 2019 08:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+z8Od9AixfYskPB6eV8OIUfvqEv6oVn0j6RyaDtylcQ=;
 b=GNLPVRVA+F6P8ViCoLy+SrQQZCiYvi1NxmYoZhNtf0aVQM9V+AAqP7H8XPWh5aCNq8
 qd7GunyTpuy4JbvBtxlVooxXMaSEHLT51nycLQr/H66jaah3oZBJ2y5aNRfru0RfSQM0
 pMHL/OpIJ0mnzEQacJlJABSxxokdkTxos94D75KLwLKzTqMvGNNjU1QKCc7AG/RuQmqL
 E5/sEoFByqwj3EuqcUKL6cxkaHLynb/ZyrJ+QtskijCdB18hJz0lW2K/bvx5VEiU59ei
 0vwjDzpucL1il+Ci7Lkzpdohu7SlBTmM3jfypSmaUhlR1y59UwZfg2WCzo0OzC3mTRX/
 r83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+z8Od9AixfYskPB6eV8OIUfvqEv6oVn0j6RyaDtylcQ=;
 b=KJwixXdQuD0N8vYhZvxyJ9/u0rIufv10VUbz+ZCFYlJgncnG7aaBZ1WH2G0vF9FsgE
 17FszfqM8iPpU13Gm5xDHIwUI0AybuaMxYLqccoyNx7jCDtEfoHQHPUgEik2UFsBM5WZ
 g2q8CGlfTQHORxFdooBaTGP5gFfSz6eb1gDvo1SANyUCumS7JPrhtxyZXRowbyWgZumK
 uAj1EylOPpHQdADFXqnDJwqIVx1RzkuSfONWd02PE2xTWKFr8J9xK78ExOjAnTO3S2ji
 unEXXZMlBFzYMZ/vnM86u5d2l0sUggwsaCzGgg5ODgzosXjWPUXcJ+x/lfOVJvrgxkGC
 A2JA==
X-Gm-Message-State: APjAAAXBKuVevB26ZMi9qS5YqtJip1yySIPNB3/e9X14lfyQhzBdyjZa
 4DvShxqeTOB6pjcVPt5i+0qdTdcHi1XBbPjxp5Aaew==
X-Google-Smtp-Source: APXvYqxTIIsNgFd12IBy/b4i7Y/SXU5GXa9nCMOjglwGoaKjxKOrw9n2OacqNI0FrYjLduXrmK37ftN23XA3ZMUZD50=
X-Received: by 2002:a5d:52ca:: with SMTP id r10mr12160790wrv.187.1552063860580; 
 Fri, 08 Mar 2019 08:51:00 -0800 (PST)
MIME-Version: 1.0
References: <LO2P265MB08471CC8597FD60691334624D64C0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
 <20190308143928.GC32707@infradead.org>
 <04cbcd8e-77b4-b3fa-8f9e-3aa07db781fc@garyguo.net>
 <20190308163125.GB310@infradead.org>
In-Reply-To: <20190308163125.GB310@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 8 Mar 2019 22:20:49 +0530
Message-ID: <CAAhSdy3n4F6EE0RYwozH2U2W+WMGJ_eVYs7-ny8Y2szoUeaksQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] riscv: rewrite tlb flush for performance improvement
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190308_085102_627974_018B9F8C 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Gary Guo <gary@garyguo.net>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 8, 2019 at 10:01 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Fri, Mar 08, 2019 at 03:55:43PM +0000, Gary Guo wrote:
> > The problem is that technically SBI should hide the details, and we
> > should automatically, and transparently benefit from architectural
> > hardware acceleration.
>
> But it doesn't.  The SBI effectively requires an additional trap,
> which makes the whole thing a little pointless.  I'd much rather
> have well working code in the kernel, and if people want to do
> hardware based TLB flushing to propose a well defined Supervisor
> ABI extension for it.

For your information, the IPI triggering is also done using SBI call
so we are not saving much by not using SBI calls for remote SFENCE.

If a platform implements remote TLB flushing in HW then OpenSBI
can use that HW mechanism instead of IPIs. For Linux, the platform
remote TLB flush acceleration will be abstracted by SBI calls.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
