Return-Path: <SRS0=nw+9=RD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E69C10F00
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Feb 2019 17:59:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86F2B20863
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Feb 2019 17:59:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FcmvlFt9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="Gd7u26Jv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86F2B20863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:
	Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:
	Date:Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HLFuNh8H9KYfiSCaWXZZ6OT4ycc26F0vv3R4rJD7/uo=; b=FcmvlFt9E7eOT8o+BJdJ3G6jD
	NOdkv4QrMtwug5+4NQ7ETjVL96WwvP3MXXHVtzY+eWN3LdFhGSkkffakx+Jn2ye2Y0QPDhwtnA3k4
	GQhHnxa3oKcHTCQnwhtTlUzhVS7LXPwRJHy5QCagw0brJHU0gE0HXgyP/zmeUwEZ2yJQN0g9HHBbc
	4ofXDSAeKJnspgKhG/2ywfaU5jj+8HeZmQ34RMnTHShkowdgN0XIT4j0A/GGRb6MwobcB6dSpc3e0
	aLc0kinDvZp+2IwsQAMz/d7Ne4BVYT7Nwrv44T7sJ4kuqeEf7MP/tCQIXDhFrZ5qqEAty+6648dDF
	hvz32exJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzPxZ-0008PI-6S; Thu, 28 Feb 2019 17:59:05 +0000
Received: from a9-30.smtp-out.amazonses.com ([54.240.9.30])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzPxW-0008Nw-8W
 for linux-riscv@lists.infradead.org; Thu, 28 Feb 2019 17:59:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=ug7nbtf4gccmlpwj322ax3p6ow6yfsug; d=amazonses.com; t=1551376737;
 h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type:Content-ID:Feedback-ID;
 bh=IDOIuimLD4+fy9FjbR/A3jv76PtRWAo4Go0vT7bYYb4=;
 b=Gd7u26Jv4kaeCjzAVoY5rSTNShM3eMrWsUZPZzUizXxzLK9nnnHOPvEe3pmEgQsf
 BuYgqG46L8R/gjSfM43nUf1w5A4BqGgon9KW94N71AgY4Fqyu4km6TsAmvoXR7VSQDZ
 YUJiaCqfrcQ0AzxDQPzcrkml/aMMs/lZDc0/zA5E=
Date: Thu, 28 Feb 2019 17:58:57 +0000
From: Christopher Lameter <cl@linux.com>
X-X-Sender: cl@nuc-kabylake
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: per-cpu thoughts
In-Reply-To: <alpine.DEB.2.21.9999.1902280418110.10847@viisi.sifive.com>
Message-ID: <0100016935426418-5eaf2d86-8a0f-4c1f-91b7-b4d872d6ba48-000000@email.amazonses.com>
References: <mhng-840b0a81-50e1-4783-a784-638195b9305b@palmer-si-x1c4>
 <0100016915bc54e5-22f89b41-21e8-4133-9550-e85f4223ea32-000000@email.amazonses.com>
 <2acd8a4393d4e9c526bcfa4aca63e4cf@mailhost.ics.forth.gr>
 <0100016915ec5184-5c0a50db-1b61-428f-ae2c-d23ce8d465d5-000000@email.amazonses.com>
 <CAJ+HfNidsF3Lnx4s4sG+=Zmt95JYScg+BKB5=u6wMUoSkHo5FA@mail.gmail.com>
 <0100016916c7cda0-9622bc7c-b8db-4967-83e6-43692aa58ec8-000000@email.amazonses.com>
 <alpine.DEB.2.21.9999.1902280418110.10847@viisi.sifive.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-2068049845-1551356423=:10847"
Content-ID: <alpine.DEB.2.21.1902281156041.2548@nuc-kabylake>
X-SES-Outgoing: 2019.02.28-54.240.9.30
Feedback-ID: 1.us-east-1.fQZZZ0Xtj2+TD7V5apTT/NrT6QKuPgzCT/IC7XYgDKI=:AmazonSES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190228_095902_410495_2358AC06 
X-CRM114-Status: GOOD (  14.54  )
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
Cc: Nick Kossifidis <mick@ics.forth.gr>,
 =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>,
 Paul Walmsley <paul@pwsan.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2068049845-1551356423=:10847
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.1902281156042.2548@nuc-kabylake>

On Thu, 28 Feb 2019, Paul Walmsley wrote:

> On Fri, 22 Feb 2019, Christopher Lameter wrote:
>
> > On Fri, 22 Feb 2019, Björn Töpel wrote:
> >
> > > > The problem is that the register needs to be referenced by the amo
> > > > instruction. Can amoadd increment an address relative to a scratch
> > > > register?
> > > >
> > >
> > > It cannot. So, we'll end up with (at least) a preempt disabled region...
> >
> > If we need to do that then we already have so much overhead due to that
> > processing that it may not be worthwhile. lc/sc overhead is minor compared
> > to switching preempt on and off I think.
>
> Is it strictly necessary to disable and re-enable preemption?

It is necessary if CONFIG_PREEMPT is set because then the execution can be
interrupted at any time and rescheduled on another hardware thread.

> On a UMA system, it might be preferable to risk the cost of the cache line
> bounce than to flip preemption off and on - assuming there's no other
> impact.

Its not the cost of a cache line bounce. The counter data will be
corrupted since the RMW operations is not properly serialized. The counter
data will be read from one processor, then the execution context may
change and the writeback may occur either to the new execution context
per cpu area (where we overwrite the old value) or to the old exeuction context
per cpu are (where the counter may already have been incremented by other
code that ran in that context)

--8323329-2068049845-1551356423=:10847
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-2068049845-1551356423=:10847--

