Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD446C52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 17:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=v5D5+emx1OAC3/4asSOpIFrS0Jd6FPeuWJ8xmpfLd5c=; b=hHyp2/Nr6L7DkS5p7HZ0YH+r6O
	A+mjB2UFAKucQYvDWXoJ1JDbqFhNig45kZQbGppqdEj3fOdGtG5uLVZzCOco4khd2CeRka9BUGCpd
	nG3g5r96q1eKt1LAWBHFtDBlRtFqezsRfBjHTS05noXllhnEjdBsyNDLmWG7Aw3J5a/PKztSXyinK
	WCEN1TqnSlc3PN7V9XYAoSCsH37+WWu0fLjsFXVCAcpgi0jEzcUXgVGZqLODWkhoqV9mudTgUSx21
	QNND3Hgmo6noDTYC63PQYQY2rmk7r+dA8IljFx7M2VUYRwkRvs84E/coThLD+lFy3A2stZjUPEe56
	Hu0hBuzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seedp-0000000Ahe9-2BOO;
	Thu, 15 Aug 2024 17:52:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seedn-0000000AhdV-44nb
	for linux-riscv@bombadil.infradead.org;
	Thu, 15 Aug 2024 17:52:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:Sender:Reply-To:
	Content-ID:Content-Description:References;
	bh=aF5y7VdAv86rlsatFywgw34wd256R54jcN1htpL2/Ng=; b=nYn6rYYvlwf5q57bZvB8o1TtG+
	/NMX7CQbtO2I5sY5Ja4keihdCtkfBo0k8sHiBFNLD7RKfDEQLMRk82UNqLUOE3Rcj7hZovqGcaCky
	JpYTZ31eGpwTKOXqw4vjhB8vWP+AMZkv8Z+eBYK/Nq094+zIyaFAOmtXeARhwHWRAhhDcjWLjhF41
	ilyCj19+NIRVhkw0WNx1iJQcc5tVJtFmNCzcR+etQ49UfoZSSulFloMfDYSHYFpJEDtFmgFFydyq+
	oc0/wGNHdsf2Y5V+wmEOCv8hL96HeNGJtNsgAEnFU/AxNHaWSeezxH/6Wpg3jYVdjsUyeZ3OrC7Yf
	0qfFBb4A==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seedj-00000008TMd-1cOV
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 17:52:02 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-710ec581999so1037333b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Aug 2024 10:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1723744316; x=1724349116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aF5y7VdAv86rlsatFywgw34wd256R54jcN1htpL2/Ng=;
        b=KV/LZGGBNQkYxn4sQfCVYNXoTjVrHn7NQmfPG4gjawHIoXtC0vwKAISqkrHdO3SjBY
         WKazMlMJQ/dfpHxSaYy6pni9u51LBKYkivngZdov3EqTO1iKDJ8wpZQu4EKaWmbbOUNQ
         6OPU7MCd6Bw8yrA5ZL0KQoz7jBniuf4XYcu1TtHP2vyMu4sYk2nG+9LP7pXZ5tuzEhp7
         Nfpb2po5EKQS9ANsXO2xZ8Wy3/xRIBWou4rmcDUcWMgLUqlfRqZQeQ/BW9w60C9AxBJd
         lkMQJy08M51jN4KLmLAJ80cKEgXqbyZU+Q2r3lpCfWsJxGt7fi5h2lGj+6EhhaV2kb4N
         tzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723744316; x=1724349116;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aF5y7VdAv86rlsatFywgw34wd256R54jcN1htpL2/Ng=;
        b=tFFKKJ41bjQhJ1MGussZ2QpCQY/5/GMJyyj5IqBb3Xma4Mdb/AtWwUrD/ydJADOUo1
         KDa6JDrSgm1SlqsntOwRlJDK50OAT6F9EXJcgsJV0m4eopmSji7Mg4tHBb9uSC264JmX
         ZCLDb6Mui3YHpwR1Z2sGRMoksrt7vPCIh/S3U0Uqd6QrGif253i25K+wnYtRESdR2AAc
         zjHdRa8SZ5G37RGey9s7GrO9iVHaGMJvQ9csPTK+OXT01/Rxzffqd46bIN0OMlexhoNX
         FdFKl13OE2wu7k5cyP1CBGhOzfF9H8gVKy125MnkvMimBwpodLNdEjawumLaB67b0S4A
         6qdw==
X-Forwarded-Encrypted: i=1; AJvYcCUdBIBM/cFiugsfKvcd7yWDgatTfEcuad0JYQNykNvyxNXlf5pAJld/UvIXksxDT0ChPVi5gQlw+BDkwozLhqRG+N/NZ5BCXkocz+UcNQ1l
X-Gm-Message-State: AOJu0YxUvZkzDuqEALhkGKVHACM49s+Gj7vuKqV6mEycFi2cECZLMYCZ
	Dgwh9zmpQEVUDkOjY8S52rVx6SNbKNVr/GgxbuvfiW/BqxfhlXgP79ZN0WfIh5Q=
X-Google-Smtp-Source: AGHT+IF21HYGAE3KPrPW3reiICNnsIeKgkTr+GBGGbmpqUgn16gPDMt9igP4MuSSMGRTKpzkEHV2Jw==
X-Received: by 2002:a05:6a21:3a81:b0:1be:d1bf:a371 with SMTP id adf61e73a8af0-1c9050477c9mr585813637.33.1723744315617;
        Thu, 15 Aug 2024 10:51:55 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127aef57fbsm1290185b3a.97.2024.08.15.10.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 10:51:55 -0700 (PDT)
Date: Thu, 15 Aug 2024 10:51:55 -0700 (PDT)
X-Google-Original-Date: Thu, 15 Aug 2024 10:51:49 PDT (-0700)
Subject: Re: [PATCH v1 0/9] Fix Allwinner D1 boot regression
In-Reply-To: <87jzgjnh9z.ffs@tglx>
CC: Renner Berthing <emil.renner.berthing@canonical.com>,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, apatel@ventanamicro.com,
  Paul Walmsley <paul.walmsley@sifive.com>, samuel.holland@sifive.com, aou@eecs.berkeley.edu, daniel.lezcano@linaro.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tglx@linutronix.de
Message-ID: <mhng-5403a4a9-4cdf-447f-9c7e-ea655a2f86fc@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_185159_741894_D3CEACB3 
X-CRM114-Status: GOOD (  35.92  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 14 Aug 2024 10:30:48 PDT (-0700), tglx@linutronix.de wrote:
> On Wed, Aug 14 2024 at 16:56, Emil Renner Berthing wrote:
>> As described in the thread below[1] I haven't been able to boot my
>> boards based on the Allwinner D1 SoC since 6.9 where you converted the
>> SiFive PLIC driver to a platform driver.
>>
>> This is clearly a regression and there haven't really been much progress
>> on fixing the issue since then, so here is the revert that fixes it.
>>
>> If no other fix is found before 6.11 I suggest we apply this.
>
> So this mess has been ignored for two month now?
>
>>From the pastebin in the initial report:
>
> [    0.000000] irq: no irq domain found for interrupt-controller@10000000 !
> [    0.000000] Failed to map interrupt for /soc/timer@2050000
> [    0.000000] Failed to initialize '/soc/timer@2050000': -22
>
> This comes back with -EINVAL. So the timer cannot find an interrupt,
> which makes it pretty obvious why the system stops to boot, unless there
> is some other timer available.
>
> This is obviously related to the SUN4I_TIMER because that message went
> away when it was disabled according to the next pastebin.
>
> Obviously that can't work because the SUN4I timer driver is using
> timer_of_init() which cannot handle deferred probing.
>
> Daniel: There was a partial fix for the sun4i driver, which you said you
> applied:
>
>   https://lore.kernel.org/all/20240312192519.1602493-1-samuel.holland@sifive.com
>
> But that thing never materialized in a pull request.
>
> And of course everyone involved ignored the problem since March 13th
> 2024, i.e. almost half a year.
>
> Seriously?
>
> Can you RISCV folks get your act together and ensure to fix things you
> broke on the way? Especially when Emil reported this nobody pointed him
> to this patch and nobody noticed that it's still not merged?
>
> It took me less than 15 minutes to find that patch and the correlation,
> but this is absolutely not my job.

Sorry, I guess I'd just sort of been ignoring the platform-specific side 
of things because it's so frustrating to deal with, but that's led to a 
bunch of breakages so it's obviously the wrong thing to do.

> I'm seriously grumpy about that. This is not how it works. If you break
> stuff, then you take care to fix it before you shove more changes into
> the tree and waste my time.
>
> I'm very much inclined to take the reverts right now, send them to Linus
> for -rc5 tagged with cc: stable and ignore/nak any irqchip related riscv
> patches until the next merge window is over.

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

if you want to take the revert.

IIUC the patch above doesn't actually fix it, that's what led to just 
sending the reverts -- at least reverts are better than breaking users.  
I'll post over there too...

And it's no big deal if we're in the doghouse for a bit.  Regressions 
should get fixed faster than this, so we deserve it.

Probably also another sign we're way too focused on getting new features 
merged, as that's coming at the expense of making existing platforms 
work.  IMO we've been way too focused on getting support for specs that 
don't even have implementations, and not enough on building real working 
systems.

> Emil, can you give that sun4i fix a test ride please?
>
> Thanks,
>
>         tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
