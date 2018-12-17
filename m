Return-Path: <SRS0=sGlk=O2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB3B4C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Dec 2018 12:42:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E6E320672
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Dec 2018 12:42:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DXvrpqDG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3Jp7+1G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E6E320672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4XRgiG5ZbFGp5QY69QryviWf5asu94c/U33KJ27FFG0=; b=DXvrpqDGdvVU9q
	xBB7SQ/LSjGUsoddnQA+FtBroME3mtY58zV0+bnrr/hJYYQLAL1T2WekdnVjzyDowMHyEPcmo4zDv
	b17CSa3bEYdVDErXQbEOgQSpLco1rlySyeF6+BmquJnpglOemLxvAQq4rX0f+wOjQYQi2aI3769Ui
	CyFUyOdaxga4tp1Dpw/H0FniSsRPIkW9mLeKC7fj9S5nEWY6e1/gOq5uKVdQ7pEnZ5MFlEFnxyoB1
	2tgElKFg2aJSXxbpI5eEV1AeKwvnP+ucG9xRFE5YtnXKYHlkjCBxDkQsbIBNYo8ahvuSOjvc5MzL2
	Xb2ChvoZhyyA2miXfbwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gYsE2-0007cG-Tz; Mon, 17 Dec 2018 12:42:22 +0000
Received: from mail-vk1-xa42.google.com ([2607:f8b0:4864:20::a42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYsDv-0007aD-LW
 for linux-riscv@lists.infradead.org; Mon, 17 Dec 2018 12:42:21 +0000
Received: by mail-vk1-xa42.google.com with SMTP id n126so2785196vke.12
 for <linux-riscv@lists.infradead.org>; Mon, 17 Dec 2018 04:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TtyFcVBedzMxFLG59RZKAfIlxn3+DODcgZM1y/wmfQU=;
 b=O3Jp7+1GPORwaga6lcHlsKvlGpjqHzdpGeVUy2FmYvUBMasByJjSY7OysswIQ7LZqy
 0q022YuY8dMd8mpE3ki/lVsoubbkXIfwW2NeDeJd3pYKWiQOJng0qr4zf9TZRiYX3qUI
 WP8F7DRPcPzOUbRHNr1yFvcBhm1oxpMad3qOVmBYZzDYPrckI54096e3oDcr/t4+zwG/
 M3/KIM/n5fY5+w71kk7czDOJhicrza76mudATlg6hPgP/n/TVSrZlcJIB3vApFU0Auum
 FDbenOioy5ZXJEwJQNuWkNJ1OI2qsF1XacbzW0OYJ9ZrkqDi+pNgjufdH6qhf9qzoI3e
 1FYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TtyFcVBedzMxFLG59RZKAfIlxn3+DODcgZM1y/wmfQU=;
 b=TXXaasqvsvHRCadMwegTQAjBWUFgPJKIgSsNj/sgLvgdKSey9t8wpDqNO97Yg1BI6C
 ZCMJyjDZhOlASy9+GMSiCVoZcVGMsUW/Y0B+7B9iCoCCOEBdit94fr6nEPrDHJmVTSKn
 bVWUNF4wu6gra3NVLNJ0z7cioQY1Xpdw8pNQipB2yGTNVhrXWNYIkxA6+03juiYSNLnW
 HhpWsmR7yEivLkKt5f8NxXPx1Mh/3rg1TKiOBkB5yABbPFI+0Ji09y9T5zRKTNFkPhUH
 2oLBDDQIeUFO6JJugUMv9p+iUOc7Yoh9TEu/z2jj+D/+PAvuzG/kVQGS7Y4fORBIxet9
 Ww4g==
X-Gm-Message-State: AA+aEWb2OkUWHwVnxStOuOW7CdzDwqjqZ/YO1/XNFptewyJ/cDqJN0kj
 4WLOynuLAcm8Ia9qS7x0pnP2W1uVN23vAEfw/JmVDTi7
X-Google-Smtp-Source: AFSGD/XGgppbqo9Gixq3qn5jIqjzzXvOHODKxen2oo1Odim1pootqZIMpEe0MXXk5MSLgez4vepgZPZ2nggdH0o5CBc=
X-Received: by 2002:a1f:a051:: with SMTP id j78mr3305842vke.35.1545050524015; 
 Mon, 17 Dec 2018 04:42:04 -0800 (PST)
MIME-Version: 1.0
References: <CAOuPNLi-_R4+wpc834Ku2PkHcHgSydA2HT_s1aYsMeNRqpDg=w@mail.gmail.com>
 <CAFyWVaakcVQC5ioOi6nopram8AY4Ph36dYbuohs-j=nuVLFCOQ@mail.gmail.com>
In-Reply-To: <CAFyWVaakcVQC5ioOi6nopram8AY4Ph36dYbuohs-j=nuVLFCOQ@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Mon, 17 Dec 2018 18:11:52 +0530
Message-ID: <CAOuPNLiH71LA+3B8RuPZN7enqs2o1t50if6__63qmTjGcnzM9g@mail.gmail.com>
Subject: Re: [sw-dev] riscv-tests-benchmarks tools not working on qemu linux
To: jimw@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181217_044218_891278_99815367 
X-CRM114-Status: GOOD (  12.60  )
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
Cc: Gurucharan Kaur Saluja <gurucharankaurs@gmail.com>,
 linux-riscv@lists.infradead.org, sw-dev@groups.riscv.org,
 isa-dev@groups.riscv.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Dec 14, 2018 at 10:57 PM Jim Wilson <jimw@sifive.com> wrote:
>
> Anyways, you can run the programs in the benchmarking dir on a linux
> system if you compile them as linux programs.  That is, don't use the
> makefile, and just compile them directly with a linux gcc.  But they
> are so small, you may not get useful performance results on real
> hardware.
>
Thank you so much for your information.
Yes, we already did that. But all tests finally depends on "common" .c and .h
So, it did not work standalone.
Also we cannot remove those function, otherwise how can we measure the data..
If you know of any tests that can work on x86/arm/risc-v please let me know.

> > Or, is it possible to create a simple and common benchmarking tool
> > like: {Sorting, Multiply, Matrix Multiply, Tower of Hanoi, Factorial,
> > etc.} using normal C programming and system calls (if required)?
> > But, question is, how should I measure it?
>
> The world already has so many different benchmarking suites.  Do we
> really need another one?  I would suggest SPEC as a good linux
> benchmarking suite, and EEMBC (i.e. coremark) if you want something
> smaller.
>
Thank you so much for these references.
Sorry, I did not knew that there are so many already available.
I checked this one: stress-ng:
https://www.cyberciti.biz/faq/stress-test-linux-unix-server-with-stress-ng/

I think this will be helpful for us.
I am trying to see if I can build this for riscv64-unknown-linux-gnu
and run on QEMU.



> Jim

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
