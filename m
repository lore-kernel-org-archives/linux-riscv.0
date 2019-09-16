Return-Path: <SRS0=O4lQ=XL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D15C4CECD
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2019 16:12:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A94EF20678
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2019 16:12:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LPw94+Wd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="FcKOD68Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A94EF20678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=FZotUPkbY91Ra++XOr8bQPiZv3/TrELNQ7u931NuHk8=; b=LPw94+WdMJRS9/o0vtdgvvXDe
	zfvg1VtQ1sNUfiSkTGNyEundrzfVrjhQH339KVD8mQJBb6bu6TpJOkffnWDEteLHNIlCPUmtwtt7i
	psD0ap+VVx0ijyEuo4s71o55oAC7YtvGgRE9HkQWhC3qWlfd9Gk0nDvp+FgaZWQzLaMr11MKTrCba
	78qab1XlB3XpmrXfAUlNjuaWpyon4HQRq84WOmeHcyqHAJU2KiYLdxSJtj8kGPgzadBgOUGigRLFx
	GIJ+21mT1aNms+KomJwQZF8GTe2Eo426FFFxKEGVsBtesdax1gljMCgpnUtNk1HCCprKWgsnlvhhc
	ZKOH9DMzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9tbs-0001Uc-Br; Mon, 16 Sep 2019 16:12:16 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9tbp-0001Tk-1I
 for linux-riscv@lists.infradead.org; Mon, 16 Sep 2019 16:12:14 +0000
Received: by mail-pg1-x544.google.com with SMTP id w10so265685pgj.7
 for <linux-riscv@lists.infradead.org>; Mon, 16 Sep 2019 09:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ukGKzeQPiPEN2lY4FZKKhDC0scsYCbLIRezpYkGEnF0=;
 b=FcKOD68QvYkg/1znS/5QrPPjZXv1QqH3fSK02oc1bQKW0SYkWoBRFY6PxGg06yy0vy
 Gs0ZPsn6syFlKJbmV+0D1OEPzqwRYjqxq3XjpoyLe4EPDEEtGybpzwPAwZDL2X6nRUWR
 0hBr73Y+Xcmun0vUwyv07NC2OeEq2h0MOqqNJpYIN//5tFEjfAErHegVySR5pdKk48AL
 c/DeGoJrrbR6tViGA+Mk9waaSgMA6qNWt5vgKlcsXnPmq33h2mXRdKFHUBMnRHy/vmIA
 qK++wUW/pwm4QDry1/6EKTSbOdK16U7MX4dqjP3bqR5eEsd6DYZcohc4P3QfAr94S1c4
 qlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ukGKzeQPiPEN2lY4FZKKhDC0scsYCbLIRezpYkGEnF0=;
 b=OqogEaGQtX7TlPFDUKqVv16X54VlCOG7hKuWb1tepgVcRiaPsltP5rAoODaXgIIzRm
 eomCzYSXbbzuPYCM9VCOVAJqgk32oxGHFuhJae5sj4pdtAQ5rUK+Q3ejelUSV3E1jGve
 z5y1+Tuyee85ZXj/JoorBIE9XIMvRJxfcizr8EfvBl4C9c3JYbJp8PYx/T+VM6KQxxR7
 udUtUtErB3lq+QGYnEGzP9y6qjLul7UkYFDvpbjvCuqy9YID6B7VyqZ/g7+nM+3L7qUH
 ow9NAQh6V0RA72fl4KQ6z0k/esymNRYRaUuEOqpZbXJ+P3RZcnVuOx/pB33UMfI1Jwwh
 7//w==
X-Gm-Message-State: APjAAAUpch5o5EVp7yzFlMxmWcsx1oFC3VRn9yhckOibUvg3upoxCBuo
 ZFlXAeJND7ou3gu7Z+mCTNmO8w==
X-Google-Smtp-Source: APXvYqxGwHBnWhE1JX8v2f0UHWjla9dhYdqMsX29OJQAB0Zsm8tHG2v71dQ/iUvU9YoelteZGOUV1w==
X-Received: by 2002:a63:f84b:: with SMTP id v11mr1321632pgj.187.1568650331586; 
 Mon, 16 Sep 2019 09:12:11 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 31sm8888334pgr.55.2019.09.16.09.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 09:12:09 -0700 (PDT)
Date: Mon, 16 Sep 2019 09:12:09 -0700 (PDT)
X-Google-Original-Date: Mon, 16 Sep 2019 08:32:58 PDT (-0700)
Subject: Re: [PATCH] serial/sifive: select SERIAL_EARLYCON
In-Reply-To: <20190916064253.GA24654@lst.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <mhng-671404fb-c86e-444a-86fb-b1ba027b1c36@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190916_091213_141345_329D10F0 
X-CRM114-Status: GOOD (  10.25  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Greg KH <gregkh@linuxfoundation.org>, schwab@suse.de,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, jslaby@suse.com, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 15 Sep 2019 23:42:53 PDT (-0700), Christoph Hellwig wrote:
> On Fri, Sep 13, 2019 at 01:40:27PM -0700, Palmer Dabbelt wrote:
>> OpenEmbedded passes "earlycon=sbi", which I can find in the doumentation.
>> I can't find anything about just "earlycon".  I've sent a patch adding sbi
>> to the list of earlycon arguments.
>
> earlycon without arguments is documented, although just for ARM64.
> I can send a patch to update it to properly cover all DT platforms
> in addition.

Thanks.  I've kind of lost track of the thread, but assuming that does the 
"automatically pick an earlycon" stuff then that's probably what we should be 
using in the distros.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
