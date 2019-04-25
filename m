Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152BBC10F03
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 08:17:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7329214AE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 08:17:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SBYwU2dl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="OW30lv7+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7329214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MigAVpUDM1d7AEx4a4Lb0TqlianGpdkX508VrIt7s9w=; b=SBYwU2dlGJgijM
	GLObqn6o7WlUUMKXHtEIU+WUUSDUUGOoU0wDvw7aXwP0qpfmycXhftvByjhrAV/Cu7kKl5B8vSFDc
	byXG0vvA4MZWqq7oAD1qmEIFyjV0yZ/Y6oar2WO301wb86UbO5+aO28ny0eCo+7mkOViIQ0gdsLM4
	eO4HRUqSe44SyyIvwTKmoCjKhnQ7U5Po0mujG2zsXEmdZ877YzBSKGZCjnrdNk6LWvKy7UPC8YVZx
	kQ8bseOmmT0vIqCbgM1e1xYb144B4g//kfUaxupZRIsUaIFUj1pQ2Bw4KgDtAAOgwYBpq910iIZ4z
	z7cd+CQhvhPWVjtGfwHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJZZf-0007of-2a; Thu, 25 Apr 2019 08:17:43 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJZZc-0007o0-6Z
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 08:17:41 +0000
Received: by mail-wr1-x441.google.com with SMTP id f14so28414746wrj.5
 for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2019 01:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U9RYUwqYs8GxnXHLt/p3Fz6x5DoO+pRsegYtnMfkhYI=;
 b=OW30lv7+KMGA1SvNnrC1b9nUxyPmrhzCwlLdnhO49dL4Y2a3DCBE1TGq2LS2gO18ts
 bNVhuCfsZ2dYI3OqebC2QB1SRjQyM8HndAJuRSFxsqmU2dZMcJZEI7+EKm+0iNNErUvP
 52/iFBVr5IzSt08jveciUgxVXttQ4d+GdNmM85RPSBT+SIpqMnNYT2HJSqz0kv46BH1Y
 c1jvlsP+FOxDQ2Eg8X2Aq4+t1Hpdi2lnJoocoAulmgT7hjtdGbSEUapFtuldk2nhAmRd
 2MrOCtd9qhO2QzTLwNQFqCnF8Bg0YurSosNVvqYW6ASIR/06jfc0vrWzlgJmgrIEY1do
 1vIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U9RYUwqYs8GxnXHLt/p3Fz6x5DoO+pRsegYtnMfkhYI=;
 b=XFeuhBkmc6qZFR811/QQMtEgjAEo4ruofAyLqxnJ+jnyEFPJ9lyT4YVV3Hj7TOanfY
 ntudHWy/MsXYZs8jSF91a/p0Py96Y3eki1K+23vctNO3xRNUjMkYW8rUkzDgGosYQXxu
 dhN6WP6E4VBB7Kb/pxePkqWBRLNShouLU20un1V2S4RvQXv2nHa9K0L52+0Pnr7PzVdu
 lJVUkzR5CXu97LSZJ/NhLUcQ71DltB7rTV4YQHuHt/5kVx4BmPfyBImaNq/tj9oQjPrO
 os1eYvcSI5t8r5Ik9HFDrol3AbD7h7jyJHwscV1GjzQekRPdnRH26SfQj+Fyqn1oPafR
 BP3A==
X-Gm-Message-State: APjAAAVDpZquHma31wmUPhjUVHfzs7UMIGY9FB2lqtPOmJuXBM+pvyG4
 uQe0ERiM0x5dk7RmcpJrpv4Ifmjvz6SsTSfqmltrtQ==
X-Google-Smtp-Source: APXvYqz6cL1WMgmusMQg+hkMCdQCzrq7wzmGiwVnpGvldT/cM4eqPWnf8C8tW1NZQkbZOu5U4n7+NAWd4McNqKXyRO0=
X-Received: by 2002:a5d:5346:: with SMTP id t6mr4334662wrv.59.1556180257986;
 Thu, 25 Apr 2019 01:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190425055015.45487-1-anup.patel@wdc.com>
 <20190425055015.45487-3-anup.patel@wdc.com>
 <20190425055757.GA30545@infradead.org>
 <CAAhSdy36q1R8HQRG3kXDqj5JoJbO_drignvO7wCHJ3-6wkE5rw@mail.gmail.com>
 <20190425080117.GA3575@infradead.org>
In-Reply-To: <20190425080117.GA3575@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 25 Apr 2019 13:47:26 +0530
Message-ID: <CAAhSdy3rEPGHkHEL9gSnEQVArFxXNNfPsbUHrQjqMf+Qbqw0zw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] RISC-V: Add interrupt related SCAUSE defines in
 asm/csr.h
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_011740_288756_43063E7E 
X-CRM114-Status: UNSURE (   7.85  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 25, 2019 at 1:31 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Thu, Apr 25, 2019 at 12:46:52PM +0530, Anup Patel wrote:
> > On Thu, Apr 25, 2019 at 11:28 AM Christoph Hellwig <hch@infradead.org> wrote:
> > >
> > > > +#ifdef CONFIG_64BIT
> > > > +#define SCAUSE_IRQ_FLAG              _AC(0x8000000000000000, UL)
> > > > +#else
> > > > +#define SCAUSE_IRQ_FLAG              _AC(0x80000000, UL)
> > > > +#endif
> > >
> > > Please keep the existing defintion that doesn't need an ifdef..
> >
> > Sure, will do.
>
> While we're at it: I don't think we need both INTERRUPT_CAUSE_FLAG and
> SCAUSE_IRQ_FLAG.

Oops, I already send v5. Saw your comment just now.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
