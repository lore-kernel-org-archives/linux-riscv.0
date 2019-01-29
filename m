Return-Path: <SRS0=xvkM=QF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D202CC282CD
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 29 Jan 2019 00:04:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D62E214DA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 29 Jan 2019 00:04:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i27WL722";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lkcl.net header.i=@lkcl.net header.b="C4492BGO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D62E214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lkcl.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SuI+dZh6Vew5SbsSpSD7Qz4CKdL/prQLT1bf2hA63mc=; b=i27WL722QnK4v7
	6D0GTuVxrIC8ozBJJyA2+lFLTavPQpsBJsd1MAG0qcnbhH/d/KHJdZGyQZ7DZodhJraC4X+Wdj3pk
	rBLkjUgySNl6JvT0CYGc9s3WdmoqqpeR/u89p3Gl3w8jg2zmeSApRSwp2Ul3rrISsfSIPERipRG6a
	Fp3aqe9jr5nwBP83qLwMVHmcUxHQUX0gDWL8FXKM7Q+VDnRNjC3aN+iDVi1SOjAkiv2m4gTF7Mgsd
	hvo8q3IpUElqR6dEQjyk4De3/gQXQyJk5Id63qDWHXhhe05Ffb+pQ5SxWTwV7WuHbcb7K9wQezohz
	P9znOEkrgWfQHeHFpnIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goGt0-000110-Mv; Tue, 29 Jan 2019 00:04:18 +0000
Received: from lkcl.net ([217.147.94.29])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goGsx-00010e-ON
 for linux-riscv@lists.infradead.org; Tue, 29 Jan 2019 00:04:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lkcl.net;
 s=201607131; 
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
 bh=EM7oH2MmiT+c3lE5R47s+w6X9cOS9rH8lDx6EBe+NJ8=; 
 b=C4492BGOsbB0qxfGO5lPMXjdCYqsCXfUhVgRMYkrf54sODHQbVcxJXMuuCaQop7AQDWLo3w882fv/fHHhVIWqZyZLjJTuRqWkg9sQWMcXT2cKaM7NKJ8/lAEsRfxM3OnoO8p5Enut04DE+guVPCEBKduDVx2cDHv5KVOVwuVvjg=;
Received: from mail-lf1-f52.google.com ([209.85.167.52])
 by lkcl.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <lkcl@lkcl.net>) id 1goGsw-0000Br-5L
 for linux-riscv@lists.infradead.org; Tue, 29 Jan 2019 00:04:14 +0000
Received: by mail-lf1-f52.google.com with SMTP id p6so13312746lfc.1
 for <linux-riscv@lists.infradead.org>; Mon, 28 Jan 2019 16:03:53 -0800 (PST)
X-Gm-Message-State: AJcUukcgRiB0jjDRpEoM4M7X0IQwNPuEjPHE1AMJpRAarT2IgBC9rO/D
 rTKLK2BuUFoCTpe5IlJIh8/aV/M5ZaQfz1XMnYE=
X-Google-Smtp-Source: ALg8bN7nfh2+E8WakR/GsdtSsPExQGIVui/VMkA+i7w9PjOQzyp4QgjttHldcR8xLUhUOB1Lv0Qsr5bZPn1PhyAXAwk=
X-Received: by 2002:a19:4ed9:: with SMTP id u86mr18616641lfk.78.1548720227556; 
 Mon, 28 Jan 2019 16:03:47 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <7efecac7-17bd-5fc1-d0de-9fd498db4751@wdc.com>
 <d476c0e2b525fb0642b3155a247495cb1850c208.camel@kernel.crashing.org>
 <452be0d3-da8e-643e-9f91-c38f0af36ffd@suse.de>
 <CAPweEDwdByUTHnbKGS-LbwGzqsjjWciWOBnPOKkNqupY--vV2A@mail.gmail.com>
 <033872b8-49d5-2731-118f-967488f4763f@suse.de>
 <CAP6exYJRhw=nnhdrNQc7wOBUTYk0-LNaRQrhin7fqxeXMrEhkQ@mail.gmail.com>
 <CAP8PnuS4vE-w07dENEpJWx_nu-yx3fsyM3nu3kUQoVFW5nzJcQ@mail.gmail.com>
In-Reply-To: <CAP8PnuS4vE-w07dENEpJWx_nu-yx3fsyM3nu3kUQoVFW5nzJcQ@mail.gmail.com>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Date: Tue, 29 Jan 2019 00:03:35 +0000
X-Gmail-Original-Message-ID: <CAPweEDw9VaELAwS1N=9nRxT-rgj64fCWyBGb+E5v+_wtgpfJfA@mail.gmail.com>
Message-ID: <CAPweEDw9VaELAwS1N=9nRxT-rgj64fCWyBGb+E5v+_wtgpfJfA@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: Bruce Hoult <brucehoult@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_160415_965787_878B7D15 
X-CRM114-Status: GOOD (  12.58  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 Christoph Hellwig <hch@infradead.org>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Olof Johansson <olof.johansson@gmail.com>,
 "alankao@andestech.com" <alankao@andestech.com>,
 "abner.chang@hpe.com" <abner.chang@hpe.com>, Atish Patra <atish.patra@wdc.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexander Graf <agraf@suse.de>,
 "zong@andestech.com" <zong@andestech.com>, ron minnich <rminnich@gmail.com>,
 "sw-dev@groups.riscv.org" <sw-dev@groups.riscv.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>,
 "mick@ics.forth.gr" <mick@ics.forth.gr>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 28, 2019 at 11:22 PM Bruce Hoult <brucehoult@sifive.com> wrote:

> On Mon, Jan 28, 2019 at 11:40 AM ron minnich <rminnich@gmail.com> wrote:
> > Short form: if the PMP makes it impossible to measure, disable and
> > replace firmware from the kernel, then PMP is a bug, not a feature.
>
> I disagree.
>
> The owner/user should be able to change the SBI, perhaps by booting
> into a special mode.

 ah, we have a bit of cross-over.  the problem is that there is a
financial disincentive to add such modes to all types of products.

 take an example: a DRM-locking mechanism endorsed and lobbied by the
Mafia Picture Association of America (the MPAA).  they want the
bootloader locked, so that the OS can be locked, so that the
applications can be locked, so that they can get their cut of revenues
and people cannot copy movies.

 if you are not familiar with how intrusive this really is, try buying
a portable USB DVD Drive and try to simply write data to it, on a
GNU/Linux system.  it will FAIL, but worse than that the DVD Drive
will *self-destruct* and never even read let alone write DVDs again,
and the reason it will fail is because there is a little-known
conspiracy between proprietary OS writers and the DVD manufacturers,
where if certain secret IDE commands are not sent to the DVD Drive
whilst it is writing, it *will* self-destruct

[in 2004 i actually had to take 3 such products back to Best Buy.
each one systematically failed, the moment i tried to use it to take
backups.  in the end i had to get an internal IDE drive]

 now... do you think that the Mafiaaa would be happy to learn of a
proposal to allow *users* to bypass the "security" that they lobbied
so hard for so long to have added into products?

 what do you think would happen to a company that tried to sell
product that had such "insecure" bypass mechanisms in it?  do you
believe that they would have *any* ODM clients take up their processor
as part of products?

 so unfortunately, with so much money involved in bringing processors
to market, "should" may be viewed by investors as "financially
irresponsible".  which makes me really annoyed, as the whole thing is
just so utterly unethical.

 l.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
