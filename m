Return-Path: <SRS0=HQJf=P3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1EB5C61CE8
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 10:35:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F2402086D
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 10:35:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XA5vu0GT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="t/VVmGyK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F2402086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n2o4K9ZHEKRrmxQCu9ja6pNLF3JnzERDus6HSvEdWF0=; b=XA5vu0GT1U1Upr
	BljpYJjJXVh+RHrGZ14YeIFb9xfqoaqXJ5rYPanOlyXVN+J1VEzP1bcRELSA3gfhUp/UPeqA5prKu
	up3TgcHEe8n0oUi9jxurs2jDWyoHogmekn+7XWxizU93BCw1T4B39XLJBr1liS44sjh5MYAAyoqmz
	tKhC7PbUdz5E/4l8sE677IoKhLRqUDnsTuvOgC1Tw6m61Jci1u3URK+nVktUD1JD5zYD47lZA0qOk
	KSqUFjEdG9dJm+ZPQVozS4LMAFIcCip6QpP6wgeKcY5LS50MIXeH7toSBO8KDJ5qTgtEj06ay6bOI
	l/19zfJ5R7JyysIL8a1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gknxu-0007Wg-26; Sat, 19 Jan 2019 10:35:02 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gknxr-0007SM-5n
 for linux-riscv@lists.infradead.org; Sat, 19 Jan 2019 10:35:00 +0000
Received: by mail-wr1-x443.google.com with SMTP id 96so18001973wrb.2
 for <linux-riscv@lists.infradead.org>; Sat, 19 Jan 2019 02:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CkUmWDBjCMtfVKlV4ecOQV/Ujv3/pkXiRQoWHg8eKiI=;
 b=t/VVmGyK+9vB5Atv7O4bhKJCEAmlqnbInUcXPKuklH33fe3/T7hs5iUr7bJodB25eO
 9xlpqtK8R1DnhE9vbFLNnKXnro1kWh6xk0Z5Dwb2c2B+1yJNfYJIuJMECygN1MWylaCr
 u2D1vWep9fPaT92L5hDPzIE5neCrKmGIyoZehfy8MK/WD215qOt2B6AUflzQ5ap1L4AK
 Us2C8YnJp1obfvYim7a5VH2d/fg0DJJXW/6JLl0SBAxgU8r8o8cCa6OPkNJBlb+eOGxx
 XWsk/CNANv9eOzU+h1euPhLosmT8H2mNvch1FcT20juBlRp916tvuwdXx7Moh3H1g6Cj
 re5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CkUmWDBjCMtfVKlV4ecOQV/Ujv3/pkXiRQoWHg8eKiI=;
 b=lZvAIH1ADyHAwjkf792CMj6OGgn9t/DAlQTbpP2wZPqZd9yHZuS/zDJtE+EN/x4Nea
 VVrtTgL1RCCmcGyNZYTW2Tc0s3NELW/P8Q/q8YVosyMIUhNf7XqTlujw+9+iru0j1Si4
 gCCc0YtiMNkrMo+opeCYn67Gptbq8i868Ix6hkjKLP+SKzTjUORWaF4878odho44fMvf
 J4Rm8iRJ9iFE3M7qsq05flqTJnBkHy29xTaUwCHk2/JafOxdTec2f9eVtC92Jy5GXe/3
 UCuxi1BZUnZNAbuVxeE5YWXjpjzTby4kKjwua0lMk3JxfdfFCuqlTrQCjGZackLoq9+Z
 ea4g==
X-Gm-Message-State: AJcUukeEnwKA7p/bJd7i2DeO/t7+47X740ua9OgnJ+DujhGOUsg3d/Jm
 EL+FcgQv1oAn8C+jn/DIGgkuzG5NTi2ZbZN6YXBV2Q==
X-Google-Smtp-Source: ALg8bN495QBLZFYLzeE3tFxwmCxmy7a+HOh7IyNyajAK1Kb0tVz3w5uoDtFeuuRZ8UXzbbnyKjNp6kR2Tv+Cinkv//s=
X-Received: by 2002:adf:8506:: with SMTP id 6mr21021554wrh.128.1547894094415; 
 Sat, 19 Jan 2019 02:34:54 -0800 (PST)
MIME-Version: 1.0
References: <20190107161047.10516-1-anup@brainfault.org>
 <20190107161047.10516-2-anup@brainfault.org>
 <20190115134336.GB13216@infradead.org>
In-Reply-To: <20190115134336.GB13216@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 19 Jan 2019 16:04:43 +0530
Message-ID: <CAAhSdy3+aVMyXdECYwTp6=T9DyenEg4Q2uEhmJtfUJDokFbRWg@mail.gmail.com>
Subject: Re: [PATCH 1/5] RISC-V: Move free_initrd_mem() to kernel/setup.c
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190119_023459_311287_27253E73 
X-CRM114-Status: UNSURE (   9.81  )
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
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jan 15, 2019 at 7:13 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, Jan 07, 2019 at 09:40:43PM +0530, Anup Patel wrote:
> > From: Anup Patel <anup.patel@wdc.com>
> >
> > We move free_initrd_mem() to kernel/setup.c so that all initrd
> > related functions are in one place.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
>
> Looks fine:
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
>
> Talking about free_initrd_mem - don't we need to call free_reserved_area
> to actually release the memory?

Yes, we should. Thanks for pointing.

I will include separate patch for it.

Thanks,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
