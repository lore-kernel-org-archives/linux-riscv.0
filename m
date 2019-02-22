Return-Path: <SRS0=tgI3=Q5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5749CC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Feb 2019 19:56:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1302020700
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Feb 2019 19:56:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UmqmjW64";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="ACpqIAik"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1302020700
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+m1zv+WNiOGzpKTwMFJ7Rxy83q+bFzem2hs18RUONx0=; b=UmqmjW643szD+0WG1n/5dhlwJ
	HPyIQM2+nfEcDEoAcLB/ParZ6SesLUSzRxDZJ+xWn5hBJQfz2hyO2DXtO8WIBnrBjBVOVUANP5E01
	Lkxq/X2x1bzopEUY6jcYZCDzqtDjHjLbYwQ/GA8lL3U9mcxdJar2TXLNdR8aWV6dW6XNcPE3kz48y
	6SLisUHWxU/FBtqN4lnrU48BXWQ9gw6OlR+i4pdk4N2vRpxqt7co6/YCZJSTcQQNtZv2lkj592F8D
	c7CJ7BoN11xk/U6djNfjMufp2vEuetrwkkfxVaxnjq1tUfTgGCaYwnkUs88RvvTgNm1wRVGanV3J5
	ZL4rsRhFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxGvy-0006av-9g; Fri, 22 Feb 2019 19:56:34 +0000
Received: from a9-32.smtp-out.amazonses.com ([54.240.9.32])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxGvv-0006aV-6G
 for linux-riscv@lists.infradead.org; Fri, 22 Feb 2019 19:56:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=ug7nbtf4gccmlpwj322ax3p6ow6yfsug; d=amazonses.com; t=1550865387;
 h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type:Feedback-ID;
 bh=yOwBC67SnQnf5LadpmjG8imXAUii78tucrw54nZjg7Y=;
 b=ACpqIAik0BxToHoRFFbJGxOTHrSQZanh9RXR3hGDVUCtUkOvZ+m4bUptxXQzLWlM
 u41YCt35hYyAiaDzrmoRnOXredmSwim6uq0CuYWriiMUI9WO2ZCpwW1Iv1lSw2EOREr
 i1hFV8MFoao5zLmiw5sXG2ZbrQQKWL2+PA1Cycn4=
Date: Fri, 22 Feb 2019 19:56:27 +0000
From: Christopher Lameter <cl@linux.com>
X-X-Sender: cl@nuc-kabylake
To: =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>
Subject: Re: per-cpu thoughts
In-Reply-To: <CAJ+HfNidsF3Lnx4s4sG+=Zmt95JYScg+BKB5=u6wMUoSkHo5FA@mail.gmail.com>
Message-ID: <0100016916c7cda0-9622bc7c-b8db-4967-83e6-43692aa58ec8-000000@email.amazonses.com>
References: <mhng-840b0a81-50e1-4783-a784-638195b9305b@palmer-si-x1c4>
 <0100016915bc54e5-22f89b41-21e8-4133-9550-e85f4223ea32-000000@email.amazonses.com>
 <2acd8a4393d4e9c526bcfa4aca63e4cf@mailhost.ics.forth.gr>
 <0100016915ec5184-5c0a50db-1b61-428f-ae2c-d23ce8d465d5-000000@email.amazonses.com>
 <CAJ+HfNidsF3Lnx4s4sG+=Zmt95JYScg+BKB5=u6wMUoSkHo5FA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1869833838-1550865385=:30554"
X-SES-Outgoing: 2019.02.22-54.240.9.32
Feedback-ID: 1.us-east-1.fQZZZ0Xtj2+TD7V5apTT/NrT6QKuPgzCT/IC7XYgDKI=:AmazonSES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190222_115631_341963_8958CA36 
X-CRM114-Status: UNSURE (   6.75  )
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
Cc: Nick Kossifidis <mick@ics.forth.gr>, Paul Walmsley <paul@pwsan.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1869833838-1550865385=:30554
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 22 Feb 2019, Björn Töpel wrote:

> > The problem is that the register needs to be referenced by the amo
> > instruction. Can amoadd increment an address relative to a scratch
> > register?
> >
>
> It cannot. So, we'll end up with (at least) a preempt disabled region...

If we need to do that then we already have so much overhead due to that
processing that it may not be worthwhile. lc/sc overhead is minor compared
to switching preempt on and off I think.



--8323329-1869833838-1550865385=:30554
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1869833838-1550865385=:30554--

