Return-Path: <SRS0=nw+9=RD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F087C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Feb 2019 18:42:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D37F1218CD
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Feb 2019 18:42:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XnVlEVF1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="NkVFf6vF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D37F1218CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4bLBPpt2ihVbbNg5Y+FofETnejPNzmgKNhqyUTusqhg=; b=XnVlEVF1+/eLZzTAFUqmdB+eg
	7pNdqjlngMu1rV2hfED/KxGlKm4Pr4U0jr1A07dI6YPrKYMzA8I+WUV4QyJIdOU5/TI1EhkNqqkTN
	iF7XCwLK8BvQBcoonbHzcJknO0gBvtRqRqMUShPNRMRCEaBRFg552N7BQBJstNBqrsMmRLmgcM+p+
	2SqdsvQIxtLFAweGhC5pijmqzVTRoJXSYJvz+VzLVLjdH5aI60mP0i9qmPMtOW6Xnxt7tK1KlIYqh
	xBm8S7DxBJcLLfhhK1VX17fb+UeerjPjgbCgec1Dskl2ebKTtfY1scnz8FBpWSYxf0+h97zebZQTv
	GpkBg25Vg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzQdD-0006KD-M8; Thu, 28 Feb 2019 18:42:07 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzQdA-0006Jr-Q6
 for linux-riscv@lists.infradead.org; Thu, 28 Feb 2019 18:42:06 +0000
Received: by mail-io1-xd35.google.com with SMTP id y6so17424650ioq.10
 for <linux-riscv@lists.infradead.org>; Thu, 28 Feb 2019 10:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=lKENW0lfL+uImCKJa0mT/ihzFsOGEnBI3FMQzx7IUrM=;
 b=NkVFf6vFnXJ9LM5B9gezgpzkRML+QPzVvup7aHlVIRfUG9tSwVbuNsutBFBy14ylr3
 nOPkZLMvx0IXO5Si8kje6cM0UxmYcuZbhsYskrKGC+vP33t9CZws98Zm+9/MlljJbFcl
 epYSAShS4B5AikGyDtlyXzZTLEpXDUs4jqOhFrf6xtCZ+VMq7WJZWFzJ2cYwNvwONgQV
 0pJ3EJuYGBsURiAPAWelnQk9P/YV17v6zSFXMPzs5ZpLSeLi3KKHyKt+4qAcgBZR+Mgg
 UP7VKfMkewudbQNk0iEaFxMaH8kZqXPjf6smuQyw9aIQkeB6WuDq2W5JqEdHOVYCS/0Y
 Yszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=lKENW0lfL+uImCKJa0mT/ihzFsOGEnBI3FMQzx7IUrM=;
 b=SHyzAqIv+YKs9G9rlhRFaohNFLz4Pd9+BdCrILBJ0Ugt/5E/wvUgtRwy0dOpitLgmc
 KPwM0ZGodJwyNBcmk7Hht8pSna9uxwZg1OHSXiZ1SO/Q6SecwZBCU4FucaPQTcUIzzuZ
 Bc7w7AbLD1Trd+w2YlaaDLCrB/ZZ+PnI58VHgQdDaAFKBpLm8/pL20S90zrshZYRdq3o
 /aEgPB0Q2+mzDUSVrcWaFvHgqnp1u6fM9S13avdf0+xgq8NbA/N9ldiyFdOjUSmW3U58
 6JS+BtHYhQ+CAc1eiAopGx9bNXhsfIXWJlmmyP0/QaJjP6lELUrEJBCNElD9vmSvs8dm
 hToA==
X-Gm-Message-State: APjAAAUTb0p32PPkfUcMzwgdylJ/k35bIPDYplgUVTwbMA5hpFjBrJP3
 /qYLN81+QLhCtqoj3GL8S09tVw==
X-Google-Smtp-Source: APXvYqxI488vlK0n1Voi9GC16byAKI5aA7czWZMFuVIbwxEbsju/lHcwwgiHJtXpDFaReZgx0silSw==
X-Received: by 2002:a6b:d319:: with SMTP id s25mr495009iob.158.1551379323538; 
 Thu, 28 Feb 2019 10:42:03 -0800 (PST)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 x84sm3057768ita.32.2019.02.28.10.42.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Feb 2019 10:42:02 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date: Thu, 28 Feb 2019 10:42:02 -0800 (PST)
To: Christopher Lameter <cl@linux.com>
Subject: Re: per-cpu thoughts
In-Reply-To: <0100016935426418-5eaf2d86-8a0f-4c1f-91b7-b4d872d6ba48-000000@email.amazonses.com>
Message-ID: <alpine.DEB.2.21.9999.1902281034390.10196@viisi.sifive.com>
References: <mhng-840b0a81-50e1-4783-a784-638195b9305b@palmer-si-x1c4>
 <0100016915bc54e5-22f89b41-21e8-4133-9550-e85f4223ea32-000000@email.amazonses.com>
 <2acd8a4393d4e9c526bcfa4aca63e4cf@mailhost.ics.forth.gr>
 <0100016915ec5184-5c0a50db-1b61-428f-ae2c-d23ce8d465d5-000000@email.amazonses.com>
 <CAJ+HfNidsF3Lnx4s4sG+=Zmt95JYScg+BKB5=u6wMUoSkHo5FA@mail.gmail.com>
 <0100016916c7cda0-9622bc7c-b8db-4967-83e6-43692aa58ec8-000000@email.amazonses.com>
 <alpine.DEB.2.21.9999.1902280418110.10847@viisi.sifive.com>
 <0100016935426418-5eaf2d86-8a0f-4c1f-91b7-b4d872d6ba48-000000@email.amazonses.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1482853260-1551379322=:10196"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190228_104204_880189_B776EB92 
X-CRM114-Status: GOOD (  17.41  )
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
Cc: Paul Walmsley <paul@pwsan.com>,
 =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1482853260-1551379322=:10196
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 28 Feb 2019, Christopher Lameter wrote:

> On Thu, 28 Feb 2019, Paul Walmsley wrote:
>=20
> > On Fri, 22 Feb 2019, Christopher Lameter wrote:
> >
> > > On Fri, 22 Feb 2019, Bj=C3=B6rn T=C3=B6pel wrote:
> > >
> > > > > The problem is that the register needs to be referenced by the am=
o
> > > > > instruction. Can amoadd increment an address relative to a scratc=
h
> > > > > register?
> > > > >
> > > >
> > > > It cannot. So, we'll end up with (at least) a preempt disabled regi=
on...
> > >
> > > If we need to do that then we already have so much overhead due to th=
at
> > > processing that it may not be worthwhile. lc/sc overhead is minor com=
pared
> > > to switching preempt on and off I think.
> >
> > Is it strictly necessary to disable and re-enable preemption?
>=20
> It is necessary if CONFIG_PREEMPT is set because then the execution can b=
e
> interrupted at any time and rescheduled on another hardware thread.
>=20
> > On a UMA system, it might be preferable to risk the cost of the cache l=
ine
> > bounce than to flip preemption off and on - assuming there's no other
> > impact.
>=20
> Its not the cost of a cache line bounce. The counter data will be
> corrupted since the RMW operations is not properly serialized. The counte=
r
> data will be read from one processor, then the execution context may
> change and the writeback may occur either to the new execution context
> per cpu area (where we overwrite the old value) or to the old exeuction c=
ontext
> per cpu are (where the counter may already have been incremented by other
> code that ran in that context)

This is the AMO-based sequence that Palmer wrote in his E-mail:

   li t0, 1
   la t1, counter
   amoadd.w zero, t0, 0(t1)

The RMW takes place in the amoadd, and executes atomically from the point=
=20
of view of all cores in the cache coherency domain.=20

Or am I misunderstanding you?


- Paul
--8323329-1482853260-1551379322=:10196
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1482853260-1551379322=:10196--

