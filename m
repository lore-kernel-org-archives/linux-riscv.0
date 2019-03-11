Return-Path: <SRS0=WyFe=RO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E666DC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 15:51:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6A4120657
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 15:51:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E1cGSPTP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="Azq5T9dX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6A4120657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:
	Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:
	Date:Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bu8EGzC48E05hiCi0G6rDVkFlyxfUCsed5VDOzwlOrQ=; b=E1cGSPTPtEo5VBJAvo4y+4siW
	0F3GfkJabaaYMl7u7un/RqhP9f6M34xhzaG93zsyhXSvEJP88PHPp10HO+/iN1ylm4bvIl35Q2zPt
	LBuYIe9DVMHiYuZN0jYC0vG3xRFvbA9T8ldyvGj9Kc8UClUuOwrB5ROpOcqpUghCDN7rPbFQ3oNNE
	ksD10Y5yD1OuYSxxN9Us403FvQeY2DM6LsGevXOxUsrYR2h9NJHdiYb1WcM4uQjxCsyh6oBafbqgk
	H7i60zEnth/Bt9/i+Gmyt+Ab18ZxFGZgA7IRctuxREMjm3YtEubBlEVhVa2ssTo/T8kJDIMPmcSdW
	pQGNZXsVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3NDM-0005ZX-SA; Mon, 11 Mar 2019 15:51:44 +0000
Received: from a9-112.smtp-out.amazonses.com ([54.240.9.112])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3NDJ-0005Z9-OZ
 for linux-riscv@lists.infradead.org; Mon, 11 Mar 2019 15:51:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=ug7nbtf4gccmlpwj322ax3p6ow6yfsug; d=amazonses.com; t=1552319498;
 h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type:Content-ID:Feedback-ID;
 bh=mk/MC4eJTXuC3cOVik1Sqw3+IFcXqaPyYKTZbR1qIFM=;
 b=Azq5T9dX14ED0s7ETbbP3954wsnYk+Yy73d+vQTGJF2UuqWQ7QEFQrjk7H0+qYyu
 er7c+aEvpmtAS67eEh0Ap7xikfw9AR5wlyCBUlOSqgHm0H87RFcbIFFrJLfIvTFBwes
 9It8GvO//3dIcmK9M2zG10vlgtwsQOoFPoZiFmW8=
Date: Mon, 11 Mar 2019 15:51:38 +0000
From: Christopher Lameter <cl@linux.com>
X-X-Sender: cl@nuc-kabylake
To: =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>
Subject: Re: per-cpu thoughts
In-Reply-To: <CAJ+HfNh6bc1A8vskxqJ9CP11aPdTgrPS2SOgLGXMLyefogFLtw@mail.gmail.com>
Message-ID: <010001696d73c925-5f894cf1-aa67-4e05-8e76-123a4b4c6904-000000@email.amazonses.com>
References: <CAJ+HfNgSx49dRXDdJGovb=auAjSB703bN9tULjibW1OKHuHcPg@mail.gmail.com>
 <mhng-79f13983-1ea9-4f9a-949a-87dac2060f42@palmer-si-x1c4>
 <CAJ+HfNhmUdz4y81VNnTOsvyvSNw3i3E=qR+F0Qa7XThSOAiJ1A@mail.gmail.com>
 <010001696d414b3a-d35fa0a2-01fa-4e8c-be57-ff703610755a-000000@email.amazonses.com>
 <CAJ+HfNh6bc1A8vskxqJ9CP11aPdTgrPS2SOgLGXMLyefogFLtw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1319697670-1552319201=:28418"
Content-ID: <alpine.DEB.2.21.1903111048300.28490@nuc-kabylake>
X-SES-Outgoing: 2019.03.11-54.240.9.112
Feedback-ID: 1.us-east-1.fQZZZ0Xtj2+TD7V5apTT/NrT6QKuPgzCT/IC7XYgDKI=:AmazonSES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_085141_860817_764FE984 
X-CRM114-Status: UNSURE (   9.55  )
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

--8323329-1319697670-1552319201=:28418
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.1903111048301.28490@nuc-kabylake>

On Mon, 11 Mar 2019, Bj�rn T�pel wrote:

> > > Hmm, you mean AMO *with* preempt_{dis,en}able, right? (No, interrupt
> > > disable, only preemption.)
> >
> > If you disable preemption then you dont need AMO anymore. In fact that is
> > the default fallback generic implementation. Just dont do anything and you
> > already have that solution.
>
> But the generic one disables interrupts, right?

No it doesnt.

> I believe the rational for RV is similar to ARM's; AMO+preemption
> disable regions is *slightly* better than the generic, but not as good
> as the IA one. Or am I missing something?>

Looks to me that the better solution for  ARM may be to drop its
implementation and revert to the generic one.

The overhead of AMOs is likely too high to justify using those. And the
LC/SC overhead is also generating useless overhead.

If you benchmark those then please be aware that the kernel uses
__this_xxx ops in places where the preempt disable is not needed. The
savings come in the form of this_xxx ops where we avoid the overhead of
enabling and disabling preemption (which can be significant especialy
given the scheduler actions).

--8323329-1319697670-1552319201=:28418
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1319697670-1552319201=:28418--

