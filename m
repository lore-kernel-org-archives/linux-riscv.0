Return-Path: <SRS0=NPVC=TC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06AD1C43219
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  2 May 2019 18:58:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCD7420645
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  2 May 2019 18:58:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eeH0/WPh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="czjywQBH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCD7420645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bNqzjYa85DMC1ZdRMLd46NLUZJLNMQzOXMV6/hvX+NM=; b=eeH0/WPhYQFTvt
	vVFYiM3NvLczO00lJOGSq3G6FXNz0zKu7wSJnekLpTTZwBDRNXJCwPyOJyV95YD/dn7XGB2iXgVRS
	cwn7cfAg6WjyQTMR3eWb5k//euq2HdsguDKk4psxMmz+Utz4nweTdsKtaw44FlxWJ7YEcu5FExZ9k
	HaLBVYCdKBgHI3wH6UqVL5A2hYVVQfKsXBKYQGJvmRu1rzSFJrYvtY4q9pCv96XSBsA1Tjp4Gfjog
	5O1B4LhaPsGmqspElGrhKUb36X5M1kZu174Q7fApBJsOtiK8A9GnGYF+NTxLvrFle7rTNwtetyyoq
	3oUVMxp+r0OlWD00EEGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hMGuP-0007JT-Lc; Thu, 02 May 2019 18:58:17 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMGuM-0007J7-MY
 for linux-riscv@lists.infradead.org; Thu, 02 May 2019 18:58:16 +0000
Received: by mail-pg1-x544.google.com with SMTP id e6so1476771pgc.4
 for <linux-riscv@lists.infradead.org>; Thu, 02 May 2019 11:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=5FgSWzT6cp2rvJ1/txB98YcNdupdx1c0jgM9/LDh5nA=;
 b=czjywQBHbF0HA0icUfD5qcGpwPG3KMZkyi3FO1PvySKIAEdrS3LBSNyBEwB/WJZkDE
 z4GOfEWnt/T5/aTAsPev7b/4n6zxo3xHvW1hpiZDxFYiLhxaWd5v8Y7Ju5fcFrsszttJ
 oPTqz6uy/8U0CeTBuOyFcuDmfMjW6dmDfvM6B9cm43s5hRMX/r7JP8VFj4eaX6IR8Ydi
 RsYZnO0o8J/IgIpYifiWy1s3319OwkDHVDEYdl7nRAoCPxBKQrKepf1AOsDP82+bU0nG
 n2eSTYzXxYfx+u0fMIMix0W+jqcjR0vv15MwD1OKqAXGvyFmYJQR6iemBYbNm+EEBdLx
 XuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=5FgSWzT6cp2rvJ1/txB98YcNdupdx1c0jgM9/LDh5nA=;
 b=QgiqpXQZ8/+WUTYLNtWMU2APmbrUG34Zh1OwopBTq+HTgXavlBJF34UWXkAfBPnI7V
 Rd1aonYm3XS7bz5mc1VbmBRABqdsXT2lXxXmkaMK19MwLbRdH+dTGx6z9I4YbT6AcfER
 I7jKsS4HfKKNiJiQo005S+39GB6siJrVZwPL5LZfLTH/sK4hOWKZlB5bLbp1L05qCNhm
 bQ67Td+kyOXdtkNurCxgm/wCOnC199cEVa5+iMfAsJEOTC0D5xPT929nIY30C3PWKzh8
 tHqxhmMHFrTgZoSOO+/XPQUkFmm2Rl6/wyyGj5+vyC8FD85qsO7t3yITCY/sbPoVhfBM
 1gpQ==
X-Gm-Message-State: APjAAAUS6LUHZhxEEHKdF2K05mru0JxTde5qtVBj+u9pJaigD8kIkskW
 RGbtn4OP8G7SKXLXZm8hnv5TzAkaQTyoRg==
X-Google-Smtp-Source: APXvYqxRLqzZyute+oKqyMi3R2+Lo0Yovv9sNOI08RvIWIN78cB1mkCzZthekg8/lTPfNIgyB2pVTQ==
X-Received: by 2002:a62:7089:: with SMTP id l131mr6047867pfc.158.1556823493889; 
 Thu, 02 May 2019 11:58:13 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:e50d:c7fa:92aa:c53d])
 by smtp.googlemail.com with ESMTPSA id
 j12sm19593256pff.148.2019.05.02.11.58.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 May 2019 11:58:13 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org,
 gregkh@linuxfoundation.org
Subject: Re: [PATCH v5 2/2] tty: serial: add driver for the SiFive UART
In-Reply-To: <20190413020111.23400-3-paul.walmsley@sifive.com>
References: <20190413020111.23400-1-paul.walmsley@sifive.com>
 <20190413020111.23400-3-paul.walmsley@sifive.com>
Date: Thu, 02 May 2019 11:58:12 -0700
Message-ID: <7hpnp0lm4b.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190502_115814_737693_8F2154CC 
X-CRM114-Status: GOOD (  11.13  )
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
Cc: Paul Walmsley <paul@pwsan.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Wesley Terpstra <wesley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>,
 Julia Lawall <julia.lawall@lip6.fr>, Paul Walmsley <paul.walmsley@sifive.com>,
 Jiri Slaby <jslaby@suse.com>, Andreas Schwab <schwab@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Paul Walmsley <paul.walmsley@sifive.com> writes:

> Add a serial driver for the SiFive UART, found on SiFive FU540 devices
> (among others).
>
> The underlying serial IP block is relatively basic, and currently does
> not support serial break detection.  Further information on the IP
> block can be found in the documentation and Chisel sources:
>
>     https://static.dev.sifive.com/FU540-C000-v1.0.pdf
>
>     https://github.com/sifive/sifive-blocks/tree/master/src/main/scala/devices/uart
>
> This driver was written in collaboration with Wesley Terpstra
> <wesley@sifive.com>.
>
> Tested on a SiFive HiFive Unleashed A00 board, using BBL and the open-
> source FSBL (using a DT file based on what's targeted for mainline).
>
> This revision incorporates changes based on comments by Julia Lawall
> <julia.lawall@lip6.fr>, Emil Renner Berthing <kernel@esmil.dk>, and
> Andreas Schwab <schwab@suse.de>.  Thanks also to Andreas for testing
> the driver with his userspace and reporting a bug with the
> set_termios implementation.
>
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jslaby@suse.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Wesley Terpstra <wesley@sifive.com>
> Cc: linux-serial@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Julia Lawall <julia.lawall@lip6.fr>
> Cc: Emil Renner Berthing <kernel@esmil.dk>
> Cc: Andreas Schwab <schwab@suse.de>

Tested-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
