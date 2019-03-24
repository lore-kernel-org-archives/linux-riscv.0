Return-Path: <SRS0=PVrh=R3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F34EC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 09:41:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFECC222A9
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 09:41:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bukBwVpt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="X4JCDZbh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFECC222A9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kkPSX7hvbyqvyUriaqOjHcWPAYYzm0vtnaiqJjU2NLw=; b=bukBwVptyPq1zq
	W4Ar7snpKZa3CUISMZHJN83kHBvul6NA/INhvHRn1emQLbYhF7oLDUQ/+rkEQoROLo9Z/Qrqfofdi
	+FLn0STdTJuLlVmjj4GUL40tH5Ta61oDxJ/PcaVPS96rgycf8JVPcIWaVhBUaCW9Uj5i+SpXmvUQ/
	5QYEsJu4WBvi88dCIjmpLUe5XP97Qp1YZXoklG6IOvSRJVsl9GjQ2wpjkVWxHOwDjmM4hCoug5Mvv
	iK6LTywav3Y7YoSnlywpBtL1gg/yeorXzC8Dbkm8z887upxCeRWwyIJsFfmMYPKzqsUatclc6MQR5
	Ya6BydYIYaaMfC4663mQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7zd4-0003uZ-IS; Sun, 24 Mar 2019 09:41:22 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7zd0-0003tx-AN
 for linux-riscv@lists.infradead.org; Sun, 24 Mar 2019 09:41:20 +0000
Received: by mail-wm1-x342.google.com with SMTP id q16so5978341wmj.3
 for <linux-riscv@lists.infradead.org>; Sun, 24 Mar 2019 02:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3WhNTGW6MX1juYG4Py5asoJQlpF4UkqKi4VGvnrTU4E=;
 b=X4JCDZbhfunePkgItnMYUQQulbjdoafRQ9MhW49erSEmsvZ7MjgFjA4moQe+Co/fkz
 ey4qt0UdTolUYIX0PGN3ochICVlAqbSQC11ezJy7+PXIRqiHEyfJNxZ3viBZ5/+7x/gY
 5YCAjDZo3bgH5DdAJQcOpKM7t/mQ7XXR/shbIziMlq+LEk9+xGg2nH/hRLJmTCDKwFmt
 X1bIRyJGIPICyKeKgtNfDuhpHxFzDmztY+AYHe7g9j0Ftelbn7KnX62EZ75sB6WJYIX6
 HaEoiaUFcHOse+usM9O3kLzdVHqHjW71NxKG3Fb7RsQ91k5g2+v2ytW59fizGvWNk8XS
 +VLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3WhNTGW6MX1juYG4Py5asoJQlpF4UkqKi4VGvnrTU4E=;
 b=hcOxM0TdqPGVbVDEieC1dCFvN+b6Np2+4MPARq124bBW00xcOhMjatg8l5reL8XSHP
 OFGUi8A1PRdfdYL+v7xRxubm8VUQsVkqSkF1zU3oRqIwpt69CH/UOFMqhRRJ8/FdIifE
 KEZSDSDbo8npSnJIybgS+QiSlycj70nwFwLcCC2ShNf75ozcYft0g5jvAvj2ayWTDf8W
 iKFRQXY/oBqBjN/0kR4gb8O3G8NfZljBKFntiKu6txzRRanqvdIlYmqU3N6C3/sY1EZv
 o4FXcI85JDHqY28lmlgjdgGmZiMTAWcDb/ge1yc1OWY1iW6lcbWH+zjbjKsFVROaATyP
 ABTQ==
X-Gm-Message-State: APjAAAW9Rib+J79cvcoiw54s8z1Wu0C9SLZNNsC1a4UUnOtxwdpmeZ5d
 fiN3JOjtF1O7TwxZ5pitGr/qCpCoONwUdFQjx/3YpCf/
X-Google-Smtp-Source: APXvYqwt5d/zZLGhOMZrGuGRVgzjUEAdGXBjkvPPNT6/53YwKBk2oMy7rYxKtpmQ2AdgrnqkYkk/E9U+nBdBYWgR3gE=
X-Received: by 2002:a1c:1a46:: with SMTP id a67mr1995532wma.21.1553420473740; 
 Sun, 24 Mar 2019 02:41:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy0mUboGJH_GJbsGFBwcukjttVQcTGfzwkaMFQb9ZVY4Mg@mail.gmail.com>
 <20190322104209.GB24367@rapoport-lnx> <20190322132556.GB19263@infradead.org>
 <CAAhSdy1VS8-3npcZUzjicnKGsjHcc6WH3Co6Hx2=GvttoatWcA@mail.gmail.com>
 <20190322134043.GA18818@infradead.org>
 <CAAhSdy2qbU1uhnVQvh0C_FOoKDy-Y0ZTUryAKD97xAXXGQSdCA@mail.gmail.com>
 <20190323172153.GA9085@infradead.org>
 <CAAhSdy07GsHXpG9MJZ4aiB5uG7D+9RA+17Nb1MrWdFg9ee6rUA@mail.gmail.com>
 <LO2P265MB0847CF97521DEF5AB0EA7B21D65D0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
 <CAAhSdy1gSMVk-45iHK9yA2hwNgkfwk9UwNu_zOWVXmhBk1MMzA@mail.gmail.com>
 <20190324060526.GA19357@rapoport-lnx>
In-Reply-To: <20190324060526.GA19357@rapoport-lnx>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 24 Mar 2019 15:11:02 +0530
Message-ID: <CAAhSdy3BnbY2Nd1=KmDt-ym5Q8Zvd7Top7_JSArx84oa4KkV+Q@mail.gmail.com>
Subject: Re: 32bit kernel is broken for Linux-5.1-rc1 due to GCC cmodel=medlow
To: Mike Rapoport <rppt@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_024118_412415_26D47B63 
X-CRM114-Status: GOOD (  11.17  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Anup Patel <anup.patel@wdc.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <atish.patra@wdc.com>, Gary Guo <gary@garyguo.net>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Mar 24, 2019 at 11:35 AM Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> On Sun, Mar 24, 2019 at 08:40:35AM +0530, Anup Patel wrote:
> > On Sun, Mar 24, 2019 at 7:26 AM Gary Guo <gary@garyguo.net> wrote:
> > >
> > > I think what he means is to force the file containing setup_vm to be compiled using medany, even if cmodel is configured to be medlow.
> >
> > Ahh, sorry I misread previously.
> >
> > I have not explored having separate file for just setup_vm() but I am sure
> > we cannot link two object files different code model and it will cause linker
> > error.
>
> Currently kernel/setup.c is always compiled with cmodel=medany:
>
> CFLAGS_setup.o := -mcmodel=medany
>
> I suppose that's what made it possible to have setup_vm() properly access
> global variables with relative addressing.
>
> Now when setup_vm() has been moved to mm/init.c, it's compiled with the
> cmodel chosen by the kernel configuration.
>
> AFAIU Christoph's suggestion was to move load_pa_offset and pfn_base to
> mm/init.c and add
>
> CFLAGS_init.o := -mcmodel=medany
>
> to mm/Makefile.

Cool, this looks good to me.

I will try this and send RC fix soon.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
