Return-Path: <SRS0=N7Yn=RL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11AAFC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 16:46:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C40E020868
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 16:46:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rDb0ioW7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="TRUna0/p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C40E020868
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9IJ3xheLA4xKT/1bA1HYapeW3yfXqbdp5HaiOIpdZFQ=; b=rDb0ioW7vCIEEB
	bmj0eTE4LPHEoLLN++pHJKPAD2F5qF1wOe+UrC7gT/W8Q99nXxIemTh1/cem55MpO5M9fhudDrtyM
	KLrsZ/0gjWld0OfsjGSBTqvMgaCmVtozYJdqk8NV1C/BKZWy0EuhcMarttzBn/9UAaJvU4Ng4NFBg
	HqBruKIibSQ/rUSVIVwdZBci+F3lN7S99SrNfhfq/ijBi7krZ0guL40hjcXp3kQzUhO8tFobM7Rut
	o7Yoqaz69pPWLza6mQiS42/vmS2ToeBxNZwe03CUffjfHnG7hfp/amfZwUPkGSijif316T93y2Q0x
	cCORktT/jZsicO2rIa9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2Ie3-0001y0-86; Fri, 08 Mar 2019 16:46:51 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2Idz-0001xP-NV
 for linux-riscv@lists.infradead.org; Fri, 08 Mar 2019 16:46:49 +0000
Received: by mail-wr1-x444.google.com with SMTP id o17so22086973wrw.3
 for <linux-riscv@lists.infradead.org>; Fri, 08 Mar 2019 08:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DIpaRLvOzZNwMscpkkxKJVmuVgsRf3J6nNx4d9r5CbA=;
 b=TRUna0/paVeNQRxA5heaq2+x36Mx4bSFOxVbPnFTJ1ChUpvcgmfU4mVmGeHfqknuLa
 2/+/5ez++pldRpsFJClwEnf9nHqe0DptlrXQRg/TN17i00mJhj2dD4+7nCdJU4NTYyi2
 CktcNXXbtxGdjqzNaOKYmntGMGh7ZSOOoUk+vVcXx2v/CdY98JWOLMbKqxGGquawc4hV
 qLm9qlU1omFBV88lwm1T6OwpiDRYZ8JKs2wghX5fXck6jv+gGJHt6aGhf8VQWT4jRW65
 JId7nw+8rKTH9rowYcDo0WBDjgM2J6IraxRu7/R+y+xsi9kxFh5ksrXvCVr4yO9hgSSh
 aVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DIpaRLvOzZNwMscpkkxKJVmuVgsRf3J6nNx4d9r5CbA=;
 b=Fc7sQlLcnv1CCWye57Ex+dupqLuGj9+MxaPWgdM5wWCdaqKm7AQyl6AU8E6h041ch+
 knGN6Y/+LnSZKHQ8pdimUBRtfVuqU4+hKUsH0kqfLJv/PYNzvao7UnBqwTPJlNRk60Cy
 a7cCQKN5QFO6cJV0D38LTt32UoSRJYRIICCp3sZxLYoOfd9MsVjMbjNFCV7xNHLXko8Z
 5r7OsprfRHMkkEs01Pm+Ta4lm/0ZuKs+0mvTrIVlq40bIpHkyVqGwoDMVdZ/GfYGIEBc
 6z4/sQWtDruFZPedNjYjleCseplGKgATMi+DAid5c4JGNQXUoGVaT8erpPaIpNJ0fq58
 dVYw==
X-Gm-Message-State: APjAAAUL9dIeA9XpTewayl1HVMBEmHYdpCoKwzJr1jPWsn7E087w4jK6
 Kegwlo1aJwxNjBvUI28EetDIuFAAPIpGokBbEZx61g==
X-Google-Smtp-Source: APXvYqwVGJblG8i/pbuzbPkTmnbdNlXtl1uVay0Kru1iMMnMMcmv6VP1ugBn67M5q5HAnbvPdFvFUO+2TxMRBmJxj5I=
X-Received: by 2002:a5d:52ca:: with SMTP id r10mr12146932wrv.187.1552063604194; 
 Fri, 08 Mar 2019 08:46:44 -0800 (PST)
MIME-Version: 1.0
References: <LO2P265MB08471CC8597FD60691334624D64C0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
 <20190308143928.GC32707@infradead.org>
 <04cbcd8e-77b4-b3fa-8f9e-3aa07db781fc@garyguo.net>
In-Reply-To: <04cbcd8e-77b4-b3fa-8f9e-3aa07db781fc@garyguo.net>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 8 Mar 2019 22:16:32 +0530
Message-ID: <CAAhSdy2RYPKYbZ3B97ZmDy9D7dt0oMMxqTcrN8UBABskabYtTw@mail.gmail.com>
Subject: Re: [PATCH 3/3] riscv: rewrite tlb flush for performance improvement
To: Gary Guo <gary@garyguo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190308_084647_899383_5C5F73B5 
X-CRM114-Status: GOOD (  17.09  )
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
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 8, 2019 at 9:25 PM Gary Guo <gary@garyguo.net> wrote:
>
> On 08/03/2019 14:39, Christoph Hellwig wrote:
> >> +menu "Virtual memory management"
> >> +
> >> +config RISCV_TLBI_IPI
> >> +    bool "Use IPI instead of SBI for remote TLB shootdown"
> >> +    default n
> >> +    help
> >> +      Instead of using remote TLB shootdown interfaces provided by SBI,
> >> +      use IPI to handle remote TLB shootdown within Linux kernel.
> >> +
> >> +      BBL/OpenSBI are currently ignoring ASID and address range provided
> >> +      by SBI call argument, and do a full TLB flush instead. This may
> >> +      negatively impact performance on implementations with page-level
> >> +      sfence.vma support.
> >> +
> >> +      If you don't know what to do here, say N.
> >
> > Requiring a kconfig here is rather sad.  For now I would just
> > switch entirely to your non-SBI version as doing SBI calls for this
> > is rather pointless to start with.  Either we get real architectural
> > hardware acceleration, or we might as well use IPIs ourselves.
> >
>
> The problem is that technically SBI should hide the details, and we
> should automatically, and transparently benefit from architectural
> hardware acceleration. The only issue is that the SBI isn't doing it
> well at the moment, which to me looks more like an erratum. Once SBI is
> doing its job, we should switch back and use SBI instead. We can change
> to default value to Y first, but I do believe we should still be able to
> use SBI-version if necessary, e.g. to test SBI implementation.

Currently OpenSBI is in feature parity with BBL and now we are trying
to do things in a better way. We will certainly implement
SBI_REMOTE_SFENCE_VMA and SBI_REMOTE_SFENCE_VMA_ASID
in a better way instead of flushing everything.

Here's the link to track OpenSBI work:
https://github.com/riscv/opensbi/issues/87

I agree with you SBI calls should hide details of remote SFENCE
so that in-future some platform can have platform specific way to
accelerate remote SFENCE which is abstracted by SBI calls.

There is one more advantage in using SBI calls (apart from above)
for virtualization. Let's say we have a Guest/VM with more than one
VCPUs. It is possible that Guest VCPUs run on same host CPU in
which case the hypervisor can avoid unnecessary IPIs if Guest Linux
is using SBI calls for remote SFENCE. Now if Guest Linux uses its
own IPI based implementation then it will do redundant IPIs when
Guest VCPUs are running on same host CPU.

in summary, we should certainly use SBI calls for remote SFENCE to:
1. Allow SBI calls to hide platform specific acceleration
2. Be more virtualization friendly allowing hypervisor to optimize IPIs

>
>
> > That being said if there are strong arguments to keep the old code
> > I'd still prefer that to be runtime selectable.

We should certainly keep it runtime selectable.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
