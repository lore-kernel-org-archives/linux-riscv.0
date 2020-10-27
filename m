Return-Path: <SRS0=hxxf=EC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 370EBC4363A
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 04:12:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFBCC2168B
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 04:12:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uck0Bytz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="iB2Y5mMZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFBCC2168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kjNlJS8ZEHIvJM6EY34zz1EJ2+u7mpB8U3BsjzrBOIA=; b=Uck0Bytzif56RLyOw3LCu950c
	tQTaCLcSsEAJMwXFpI0PsZP8Tp4tXg+RQHVmxBHIk/KtKfgPPJF1XRQPYEyNWCh2ZhDPbZGVk4VJU
	IsaPWO7Bl3JN5gCJZtMY7jdKjCR7m93ldsowMYTXsKMnfe51GzMiFzhBvW7CZEi6/Or5mJk9U9OHF
	LQYrMQkeJeeb/wmBL+BI3yrVEQxPeTg2hBfmrPCyUKbmBFYgQKPE3J+LK13fBec7g9iSRxZlWRoPA
	eynuzgseONrk0UzINEWS/9qif8f1GhKHnnamn9QRcllt1BKPfmewQHF0T7chXjlRS9oZwVC9+hNDC
	tCCoyrJ+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXGLi-0002qH-2T; Tue, 27 Oct 2020 04:12:42 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXGLf-0002pa-78
 for linux-riscv@lists.infradead.org; Tue, 27 Oct 2020 04:12:40 +0000
Received: by mail-il1-x144.google.com with SMTP id c11so270543iln.9
 for <linux-riscv@lists.infradead.org>; Mon, 26 Oct 2020 21:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LZNBHRVeWWwPVY6cSGKE4JXLijKWBSv8kFcc484GoFM=;
 b=iB2Y5mMZkU3553hxkx3juIFFTNfXtRoeaTTqbTb2AYq9e/fAwpnli5wAdtGyFVMXvs
 /17J/9wacE+cnXzL9L3ZeZQOtkp5GKQjVuTKkWb0940GiR9fHEAtjtHFWSDkVydOSxos
 +w1brgdtHWiWQ/JoYA2nbPJmLE70RKByUUdCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LZNBHRVeWWwPVY6cSGKE4JXLijKWBSv8kFcc484GoFM=;
 b=jGqZKWv7U3OYTW8zlaEOuFpgM1lZrHxp7Kinxrofw9b0LZWwLEpU5xqTkMERgALcoF
 3Z5wHuMn9DuY01l/UWNAMUsV14Kb8K1OF941StwIqfPp1jDD2pkMSotSIvZfgaSmS48i
 dg27mKFFmn1DUy9fM2NI9vjSk+2D1bf5gchcr8sN2OQyT6gzOSFctDU/2WetFmAjdfF5
 uJLCI0d+8gBixhmpNBO9hUEXU7w+jW1DZGJ8dvlu6FUSwrD+3Qi4ibnagZEq8b9cPJl0
 Td9bYfO8SPsyyAMQSHyyIdN/21Nx8ejz9RwdPmg+oPLXfud0CtrEEZsLcHOzcsUXQb2M
 Hh0A==
X-Gm-Message-State: AOAM531Aw1l0q9QXGtAxRaeLlm8SgHSfgnBy27vMhI6g8TKCjciWwbRd
 6+UORM2oKJOeqUWaqOnLfjO0HYuhXHwKVlpJmuNa
X-Google-Smtp-Source: ABdhPJxkvUrfNDLJbQqvLgdyWIsSGG5zNMprhuSTVbTq8S5oHk9ArbBqOPSBtf9jm1KUjacUV25+5R2xG1ZlXCJuck0=
X-Received: by 2002:a92:6410:: with SMTP id y16mr126456ilb.126.1603771956698; 
 Mon, 26 Oct 2020 21:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200914165628.445087-1-palmerdabbelt@google.com>
 <20200915054649.GA16371@infradead.org>
 <CY4PR04MB37512693510EE0C8E8B29F4CE7200@CY4PR04MB3751.namprd04.prod.outlook.com>
 <20200915065138.GA31702@infradead.org>
 <CY4PR04MB37514B8FF89DEFDF2A7622C0E7200@CY4PR04MB3751.namprd04.prod.outlook.com>
In-Reply-To: <CY4PR04MB37514B8FF89DEFDF2A7622C0E7200@CY4PR04MB3751.namprd04.prod.outlook.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 26 Oct 2020 21:12:25 -0700
Message-ID: <CAOnJCUK5C9gGUu0UEtu5Q7dzus1kwr1bCMFxQPF67kcyCk3tnw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
 M-mode systems
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_001239_380912_A3711297 
X-CRM114-Status: GOOD (  22.60  )
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
Cc: "hch@infradead.org" <hch@infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>,
 "kernel-team@android.com" <kernel-team@android.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Sep 15, 2020 at 12:02 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>
> On 2020/09/15 15:51, hch@infradead.org wrote:
> > On Tue, Sep 15, 2020 at 06:50:24AM +0000, Damien Le Moal wrote:
> >> On 2020/09/15 14:47, Christoph Hellwig wrote:
> >>> I won't have time to set up the K210, but this fixes the timer issues
> >>> on older Qemu versions that don't implement the time CSR.  Although I
> >>> also need to revert the binfmt_flat patch to actually get to userspace.
> >>
> >> So revert is needed ? Digging in the flatbin format, I do not see why the offset
> >> you removed would be needed, and it does not seem to affect other arch anyway.
> >> So I am really suspecting a problem with riscv uclibcb or elf2flt, but can't
> >> quite yet figure out what may be wrong there.
> >
> > I did not have time to find out if what we did in RISC-V nommu was
> > correct or wrong.  But to get my existing userspace to work I had to
> > revert the revert.  I'll try to find some time to dig into the binfmt
> > flat issue and elf2flt soon.
>
> OK. Thanks. I will keep digging too when I have time.
>

Is there a solution to this ? As Christoph pointed out, we need to
revert the revert to get into user space for nommu kernel (v5.9 or
v5.10-rc1).
This commit was introduced between 5.9-rc2 & 5.9-rc3.

The concerned commit here is:
2217b982624680d19a80ebb4600d05c8586c4f96: binfmt_flat: revert
"binfmt_flat: don't offset the data start"

>
>
> --
> Damien Le Moal
> Western Digital Research
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
