Return-Path: <SRS0=WyFe=RO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE095C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 16:28:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A29C206DF
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 16:28:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S6N963oO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="mxZHGysO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A29C206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SH2SIy+Rlq9rdNzwjVYiIQs3xuwD91sDdqpmdRtVRds=; b=S6N963oOqWGK6z
	LRhHe5FyziNTx6XHl07t2mQ7OuCsy0YP6Y5dppoxXD2ggxgdPBvWMRiOn4N8BzKWLotINvIxSwS4U
	wfkbxB/0b07KDip6PiYfLuufa6EnphvEocvRZSdrioXF0eobn174FJfZJmA0AHl0vdyxa24zyaWxT
	vgTDdjh+U6YbDsbwGxFLNZeUc/8laY+7W7HQ0EKBxUDHbsSZcIWApD4Mo5HZl8E0SfISypPAbP/f2
	OjBaf1jwdyrLAS2aoCWlNCwgzGKntF3X6MQ36UpYQASN60iAP/FJjpMDsOBTltfcqwyzVGPtOKXRM
	Thcba3VZplTGFkAgwR+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3NnD-0005gz-KQ; Mon, 11 Mar 2019 16:28:47 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3NnA-0005gR-Cr
 for linux-riscv@lists.infradead.org; Mon, 11 Mar 2019 16:28:46 +0000
Received: by mail-wr1-x441.google.com with SMTP id g18so2430496wru.3
 for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2019 09:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C3JvtuP5Tp/ge8jUIedneaWQ9Zu5ydrCPjhZ8S+usMc=;
 b=mxZHGysOXaJCCRRPwkfBgqndOrsF5Y+niecq8FdUM8Dqev1bWmqlCJW9x5VIhBZ3FT
 mY6m6ff6sCQuLAro3QcBu6rwAWK39Y2zXmz/o4PdstYwynbjP/FCew/UMYi1TIpMysjO
 n3yo2NQ6009vwjXfVAGkcNT3eIVWs4LGgrCN9uw5ROne8LCXsWCV77xfi3uQsqZ+YETX
 LLDiGtTnp0qlc8SfMa0IoNYhDIoflJ/UAMpeN1YrkSrr9abi1bTzF4vyq4L5dO07He52
 qy8MLJSusdJIUxYa2JXgnhFH/Cmcrw+/vcLo2z5aISl3Mm4Ji1n3C918S7sPunuZyyV1
 OC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C3JvtuP5Tp/ge8jUIedneaWQ9Zu5ydrCPjhZ8S+usMc=;
 b=SjdM5HuaOICvPoijpVETdZnKECvh/2Ao+zanaogDkjvJ/w0pUxo1EjlbTzHDkndPeX
 N9d7XuDeT16facwBo7O+SHoVBAYOBtp1zybbC1lNAeAxSKFsUyLngkENm4XfAabVLumT
 6srcs4LignaF+xiuTLiXcHf2a9Cr50HyIeL03lFJhGAQOzkpkYf+aP8RAEtR2VGdj1Cu
 EY1MidPoh1N76Qo6dODXAnuKkApRidW1zsBUUn5uPdJ4Y9Ez2iQ93Y3n2//IBwyfm3Gr
 JLcTRbGA3+l/PoYfeM7g3wbtdofkGANWLvfgVdyIzWW4d4ovqPBwYkLyNB7tF8YO4iIF
 fbMw==
X-Gm-Message-State: APjAAAViOq9igosTLrrycZ6c37nhcBvdPs7SSe1JaXWtQZGaZHW8HrHy
 Ax/fJ6Y5qpjOU/+M//Ny94GXcl3LKq6W9J3rnB17HA==
X-Google-Smtp-Source: APXvYqxIXBjZPSyZnI16hEEZnttd58r9Mphm1A2+iSNCw2yZYcdfapTCEkm8nuUzSJEqam/rGnwpUPqd13Aaf5a3zZ8=
X-Received: by 2002:adf:ea52:: with SMTP id j18mr6338788wrn.99.1552321720887; 
 Mon, 11 Mar 2019 09:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <LO2P265MB08471CC8597FD60691334624D64C0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
 <20190308143928.GC32707@infradead.org>
 <04cbcd8e-77b4-b3fa-8f9e-3aa07db781fc@garyguo.net>
 <20190308163125.GB310@infradead.org>
 <CAAhSdy3n4F6EE0RYwozH2U2W+WMGJ_eVYs7-ny8Y2szoUeaksQ@mail.gmail.com>
 <20190308171804.GA27005@infradead.org>
 <CAAhSdy1HBgn99x3V4=ytYEzf3cTiwT1ogBs193ZxFTVxTDbgsQ@mail.gmail.com>
 <CAAhSdy18xNqbbQvBLj8pHB=vWM8KqhUfNN-6Bw7J4J2ONB8i=g@mail.gmail.com>
 <20190311155314.GA21041@infradead.org>
In-Reply-To: <20190311155314.GA21041@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 Mar 2019 21:58:28 +0530
Message-ID: <CAAhSdy3HdeKguKdWtMoco5A8_aQ-0U3Bb-6Cp+7QSQC-h7BbgQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] riscv: rewrite tlb flush for performance improvement
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_092844_570776_09FE23E7 
X-CRM114-Status: GOOD (  10.80  )
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

On Mon, Mar 11, 2019 at 9:23 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, Mar 11, 2019 at 02:19:54AM +0530, Anup Patel wrote:
> > There are also use-cases to run two separate OSes on same SOC
> > without virtualization. In such cases, both OSes cannot have access
> > to CLINT for triggering IPIs.
>
> And sometimes pigs can fly (no, really!).  But we should optimize
> for performance on hardware we have not build some ivory towers
> for grand architectures of the future.

IMHO, we should not restrict use-cases of Linux RISC-V kernel. The
Linux RISC-V kernel should have mechanism to do remote TLB flushes
using both SBI calls as well as using it's own IPIs. We should let users
decide what mechanism of remote TLB flushes they want.

>
> And with that I don't mean cutting corners and weird micro-optimization,
> but to think hard what layering makes sense.
>
> Having to trap into machine mode software to flush TLBs does not make
> sense in any normal architecture.

That's your view of a "normal architecture". How I see this is that RISC-V
is allowing CPU designers to implement their own way of remote TLB flush
which a very unique thing.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
