Return-Path: <SRS0=N0YM=NJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5CC0C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Oct 2018 20:07:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C03220824
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Oct 2018 20:07:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WcfGDSnh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqTISGuZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C03220824
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lDGzbiaj71mVdWNnwlYOU3Jrkn+i8m7N4Y/wxO0oBWU=; b=WcfGDSnhAYjH3K
	hnVusEds4dNhfMawZb7NSs4M1r3Kuk/+5cVnm8oaC2NP/cYuiXe/NmxPqhzs/FVnEwjhTD0+LcpnR
	UVe5JzjazEKhIgobVdAfhhNFyw6QyOs0oy943ycSYAd0bN7/xCfpOD/KZ3e47i+LEl6nTv/CWinL6
	TAREjfjllQpt5lCZH0fQzuCrh+OxftOfK/gCJLQL4SMaWFwHjifUVrxu9Pnyde59Dfzhsy8gAIXP6
	M/zlgB3GRtP99VUQTvLz0WDurnbzHRLv9NCb7n448/hBE+ML8s5OF2AhvQJdoNaz5tzUojn/PtT4O
	Tkdxip92lb698UwWx1Yw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHDoi-00029b-9g; Mon, 29 Oct 2018 20:07:16 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHDog-0001mO-19
 for linux-riscv@lists.infradead.org; Mon, 29 Oct 2018 20:07:15 +0000
Received: by mail-ot1-x343.google.com with SMTP id p23so8847866otf.11
 for <linux-riscv@lists.infradead.org>; Mon, 29 Oct 2018 13:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fRvTSNRT7gktT6horIQurARrS1uyy0qtxl4wc5WIwQM=;
 b=iqTISGuZvp/Ev1MI5bRvy9ZfR/jV3cJvz1tlGZvZ78eqP32/TZhq2CN+q/jo8JbQFD
 bu0/fmB2FyhjGTuHLLg4x62UnolGN4QIjoJvdRTey5JteWhSNG9bA20on8YezhI7IlmF
 2cN0ruQ274eNzT4qPzCXkUjs2qHZeKZxtMDpi4nstxFYkECmuHUNnHKtD6V1Nk+tS/9z
 jCjgdAgDfgE2rhHW6QM76R16RUEBp+pJawh3pTI8g1V/bJk/X3bLGQB3YQ642dUgKizT
 6/2MbBJS5UHuZ4ZS4EFLGwQ/J3sWjzv4Ugmgc/AHc/nVMbaySoK1O6fqxDaQkP78z3sv
 ye4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fRvTSNRT7gktT6horIQurARrS1uyy0qtxl4wc5WIwQM=;
 b=HZ4gT6POUO9Npu1qatGWaUyrSDWjkN7BRgk6EiYCwSJy4mY6IMTqF+4F0eLohPzJQ+
 g4KDG1YLf/IOTCcAz1gWNvLkDVpeJGSk5rGjDuVN6boYTBeg2FdbzUgvnWGLYb1hnq4U
 3y3JiPeZpzfemHdusJIupEKsocYcHXheyNg4FdtIwGarnxPL2fA2kBds3Q1Yvmtbt88e
 YuJHVvteS4dxlJAv8iQ1U8JCvbnsOpPmx99WEgvV8uBMDulUb11PTsp353qB28PCqiIj
 loJh4dCsSokSCwR89tFWf6CM14oyuTdJtKY7R8qAiu3kCe2Q2JRYeeixJAZFQgN16OYS
 BBsA==
X-Gm-Message-State: AGRZ1gKNwf63BjJR05EPAmUvqezI8bVcaaCXquXXYpe8LSB9G+5EJ4K1
 oQvVGRV8tm9Qca/05GLiZ0RajsGmgfpUEOU2/TqITbWy
X-Google-Smtp-Source: AJdET5eOW3A7s51jmVmGQTu0pNmHSUdhkxdrbkPEm5hsuWy3Ydxhj1RIDjAKcIVlSmS8MTQLkyuzKfTHN0NCOfGyMI0=
X-Received: by 2002:a9d:7285:: with SMTP id t5mr9500219otj.345.1540843622319; 
 Mon, 29 Oct 2018 13:07:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAGw6cBsWHB4aRf=kPoT+v-FbtL0ymeBtZNEwKYobFizc0cLeaQ@mail.gmail.com>
In-Reply-To: <CAGw6cBsWHB4aRf=kPoT+v-FbtL0ymeBtZNEwKYobFizc0cLeaQ@mail.gmail.com>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Mon, 29 Oct 2018 21:06:51 +0100
Message-ID:
 <CAEn-LTopspBXzoLZEFWQGxxC7uNJ9RZHiHyYmJPpWR4zKnj5zw@mail.gmail.com>
Subject: Re: virtio-gpu without ARCH_HAS_SG_CHAIN
To: mforney@mforney.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181029_130714_112978_D701724C 
X-CRM114-Status: UNSURE (   6.65  )
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
Cc: linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181029200651.qJfyNUzOT-D4qOYIgPPq2-0Cf2fiqEMObikCPHIX8l0@z>

On Mon, Oct 29, 2018 at 8:47 PM Michael Forney <mforney@mforney.org> wrote:
>
> - Should riscv support ARCH_HAS_SG_CHAIN?

Non-expert here, but it looks like ARCH_HAS_SG_CHAIN
support is generic, and a number of well known architectures
support it.

So it's basically two line patch someone needs to send and
at least make a test by building the kernel. I can do that if you want.

david

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
