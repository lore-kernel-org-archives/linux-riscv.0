Return-Path: <SRS0=wRFB=R6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C46C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 14:02:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 911BB2146F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 14:02:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fcq0UcuS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="JR7085O0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 911BB2146F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rVA/94OyKASVTEWVDgZ9sHfgjCg8EcADdcYP7gtAIL0=; b=fcq0UcuSjHMJPq
	FkLXKhxsW0ofvjJqQxbqd0rVowcYoYM/Ti2kMXs40bgEgu2tVvhex+gzwuwQCI4JXNrERFlkJ2nX6
	eFuO1P+mBsfOeW8WNuIJW3BKFb7ry6J3ZDWQ2BRaZjGEv5gaWdyXsG5fGNolI2g6KjwIFIbkWuyJI
	ID6RcRBxAhYGAeu7l0I5kfaQf7ZNjZKGC+xyDJUVOLvlYwkTWssk/2+mE12FaznrJ7IeS6LgYKG74
	xsSJXXYYbvEtP+JtXs17lQ8Wd6qLgTr8MvBhkohrMKM6aNKsvOZtdiC53x8d4i/tHLNHsVi9iJkKs
	1JCvgFydfsw++jY6xnrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h998h-0007yB-KB; Wed, 27 Mar 2019 14:02:47 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h998e-0007xs-HY
 for linux-riscv@lists.infradead.org; Wed, 27 Mar 2019 14:02:46 +0000
Received: by mail-wr1-x441.google.com with SMTP id p10so18765717wrq.1
 for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2019 07:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JoV6bHeNIWFARGZA9fpZFkp4vt76l1ftGl/d9i602jk=;
 b=JR7085O087ON4qh3se8Ob4x8KaZ/8TKWkBubB1RIJOnZ73mWzX6ZUO3HH2PFSwUVu2
 2Mnuwe8oeQxPGAkuD6qTTt8wIN8Yf0EBGmzb200YlrxzrHAz0mZP0bkL+g4JQqyney4I
 D6uYV9r5bbdd0N5eSYjDdL4pBUEmS+PEvJcpED1BHrdgMkQ9Kde/6AmyUJHMapwCAUgK
 p5Sj9yZLqSkD0NLCJf0jzWUCY+YMvuKMHiBi04FpiQ1pnhvvCHQqDVp+i6APkDJf2u2/
 QyPmFh2BgCLNnf6kRgD3JqXTqZvIhCdt5JM5CNjZYp2F3vKu1UBkm0UHMqHjx9LUWG6a
 R5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JoV6bHeNIWFARGZA9fpZFkp4vt76l1ftGl/d9i602jk=;
 b=NPItf5I/I+nwAHeTxc/I867BbR4pv4Dkg+ScNvpbYzElnaoeT1v6YlqazuZlpH9fPX
 1dsENzpw7o7MnrWctWi7Ry2TGRMjkb6O/fWyDYDCFThcyNTxreE7e6ZHIoS8TLleS46m
 m1mfhXUqmkcczpuY1XwzIZBM28ctO4LvJ7xh+lTxbT/VCp0N1L1Nmvz/do6D3x4nvqrR
 uVU2jjg1a+BAbEc9NVX7mIIMQQ8FJRE6GKOtdZ9/3zBcPZQLCYxK8wjl/5Q1rQycQAoZ
 oIO0VksdFU478Kb4vk+tvJDN0wmOL+Y4/pNgjXuP2wiTlAhmOa8YgVvdryQEdOWjShVs
 EJWA==
X-Gm-Message-State: APjAAAXooWA28jLyyGVlraACP5xLBcCua4S/B7GYls3ga8B6VIZ1IK8x
 HCAIkQBZ4FSQCWzSYOt+Xp/n6WbQzsvLnL6zT2QYFQ==
X-Google-Smtp-Source: APXvYqxegEcblAAV9k0hlKqCN+vFlscaWLUFUBFCzJWluTmPjmcu7C3LtNaHKreASp6eAwm0ODeI47k9Wuti/sSyIio=
X-Received: by 2002:a5d:5108:: with SMTP id s8mr21441512wrt.99.1553695362323; 
 Wed, 27 Mar 2019 07:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190327100201.32220-1-anup.patel@wdc.com>
 <7edf91f1-1df5-5513-d372-d84edd12edf3@garyguo.net>
 <CAAhSdy1+rc9ge02uqNvse5Z6XmDxsRH0G=5GnMsh+6m1LMLFYg@mail.gmail.com>
 <74227a1d-3928-3e92-c7a9-5c3e093b29ab@garyguo.net>
In-Reply-To: <74227a1d-3928-3e92-c7a9-5c3e093b29ab@garyguo.net>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 27 Mar 2019 19:32:31 +0530
Message-ID: <CAAhSdy1K6OiZ2nDGcERi7J1z-i6hDC2eWubYDnSqPGCxQKkn5g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Implement ASID allocator
To: Gary Guo <gary@garyguo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_070244_721970_5138FC95 
X-CRM114-Status: UNSURE (   6.22  )
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
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 27, 2019 at 7:12 PM Gary Guo <gary@garyguo.net> wrote:
>
> I would also like to mention that your code assumes 64-bit atomics
> support which we don't have on 32-bit systems. Using 32-bit to track
> ASID generations isn't sufficient and will cause overflows. That's why I
> have asid_generation_overflow to handle the case (this is super
> error-prone as well).

Thanks for catching. I will fix issues with 32bit systems and send v2
soon.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
