Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5531DC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 12:51:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 147AD61039
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 12:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 147AD61039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=qTUSmaD8FWOuYFSafJCf9ZM7uXKL1tbwPYak1r1nD44=; b=neq
	J6ZFKoZTGYEjI7es8E7i5zGvdTd6CNZS7eBcSzVCtCqPXEch22o8qL6ZXhqBQjae33oD00SsiQU81
	GZgXqg8fy2OQ7R5m+xzBWmdAG5r4yfbCvhjHmwIOY9m45kQpadD5Ecv4bgN+xNhJQKrhxAbO/3PuA
	PvqiZ+HJvvX3VkA2TgSPGy9rOTNdwVXl7S71pBE+UE8USDolQ7mGNJF9VsoIhrsMW7wzMUCV9TL7R
	6jR/P0uFquDEI1C8D62CuU4YFanVPChWLGjXj0CP9whIn4C0aZOExaZW1ifSwLrvgCWVCtCvxe3ZI
	ZT9An3ZEbC0iUmTc22jcuHuxcbDqpng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg4s1-007puY-6q; Thu, 28 Oct 2021 12:51:01 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg4rx-007pt7-D8
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 12:50:59 +0000
Received: by mail-yb1-xb29.google.com with SMTP id a129so1824182yba.10
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 05:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=jatpfbG60nPx+xfZ9sH62pQN5+lXIx756ddlUolNXx4=;
 b=m5MBpMUwyBc/mhl55zXXHM+Jl3JDxNeWFddZp+lKi3XJ1bxm8XsElEWAWbU/8rl0rI
 RQr2DFaITa/ymrsTSd8UZblKtv1/WOAOS+mFyNpT4dO2T0B6tPiQTUQvgMWokVlPr9/O
 9+3MR/UtLGSLEWBylxABNjlBE7m0LlcvZPY4wXUBkREk5NldCIxxxSPjk1uzjYaUMl8g
 DVUwKlTFA1lUkr5EAzg7jXkV/7FUxECtvmy+MaI/buCJ09MqR8NPgSEGSr4/NQjPKJFp
 Tv+FvbMDEAQKfqyIJ/p2dvqHIu8+7YhsZ1AKLOKVOXo8nosQRv+WFdWXbzMh0XHDnfgh
 VTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=jatpfbG60nPx+xfZ9sH62pQN5+lXIx756ddlUolNXx4=;
 b=d6wpgG6db55HCFyqHkUDEJut/PME0S3oJebS9KHMV+M6saNpsS5QDoKbsKAQ4CsAbS
 FXsApRAeWRipxlIYqRY7zjUnf5o68KVErz4UiCnWK731/lkZcqZmlSjg4aZHoHSLc1AB
 T/WSyUwJSGMMJKOxXjW0arZN/LUGI0VoVs4SSqqcaYqsdmOl0zDWBS+In1KneiEMD6SR
 xq2jt/AP+lIlJbwI8ftyEbKLl2TSZIIXcRr5eNo5oI/tdTPm971TB4uGFuFAss86eyQb
 4oEty1ZodvTV7Sc1VC9tQVpsssTqke7qsE+wcjmRNHfiDnaVTFWOFxdIUM6I7S0oCWsF
 kpKA==
X-Gm-Message-State: AOAM531QYrnVPjt+wL8aqNlwg2KrwfDjDrnvili0vlGtcjGfTubBBZVc
 3vqZtWFtdgX0R8WJgW1pqwOoqBjd7xPoowvdRhZAyix/
X-Google-Smtp-Source: ABdhPJyetRdZbvdwkGQtMF3SXJC4ThEVZFaoS5pGbiq7bSuBztA0hUKDMXvvD+AThbxWeWgZlVamDezM1cV56cJ31FE=
X-Received: by 2002:a05:6902:1022:: with SMTP id
 x2mr4462653ybt.549.1635425455043; 
 Thu, 28 Oct 2021 05:50:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:82d0:0:0:0:0 with HTTP; Thu, 28 Oct 2021 05:50:54
 -0700 (PDT)
From: Laurentiu-Cristian Duca <laurentiu.duca@gmail.com>
Date: Thu, 28 Oct 2021 15:50:54 +0300
Message-ID: <CAPm8-H5ef1fVyjRnF8yStvocAEPdy949Jh=FUrrieQC0nB6FyA@mail.gmail.com>
Subject: objcopy of vmlinux is very large starting with linux5.7
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_055057_488804_673B53F2 
X-CRM114-Status: UNSURE (   3.54  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello riscv community,

Starting from a working config for linux-5.0 riscv32,
I built linux kernels and observed an undesired size difference of final output,
starting with linux 5.7.

Here is what I do:

cp ../linux-5.0/.config .
make -j5 ARCH=riscv CROSS_COMPILE=riscv32-buildroot-linux-gnu- oldconfig
- accept defaults for oldconfig
make -j5 ARCH=riscv CROSS_COMPILE=riscv32-buildroot-linux-gnu- vmlinux

riscv32-buildroot-linux-gnu-strip -o vmlinuxstr vmlinux
riscv32-buildroot-linux-gnu-objcopy -O binary vmlinuxstr kernel-riscv32.bin

before and up to linux5.6.19
-rwxrwxr-x 1 laur laur 4009312 oct 28 15:22 kernel-riscv32.bin
-rwxrwxr-x 1 laur laur 4777584 oct 28 15:22 vmlinux
-rwxrwxr-x 1 laur laur 4014356 oct 28 15:34 vmlinuxstr
starting with linux5.7
-rwxrwxr-x 1 laur laur 16923752 oct 28 15:26 kernel-riscv32.bin
-rwxrwxr-x 1 laur laur 4599284 oct 28 15:26 vmlinux
-rwxrwxr-x 1 laur laur 3829884 oct 28 15:34 vmlinuxstr

It's worth mentioning that all kernels work ok in simulator.
Does anybody know why is kernel-riscv32.bin so big in 5.7 and above?
I appreciate any idea.

Thank you,
Laurentiu-Cristian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
