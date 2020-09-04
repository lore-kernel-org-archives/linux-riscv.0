Return-Path: <SRS0=91Bs=CN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 736C3C433E2
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 16:43:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2438820795
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 16:43:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MqJ7frAM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="pMgwV8Aw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2438820795
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BbPU7/r69EwTFzEOpQTWP8diyBq7J73U7C+rWk30W8g=; b=MqJ7frAM8BqsJbr0h+n0hL7w4
	lpxv66dEY1p/bLx37MPznQpYx7Ik9qX6p7WP25hYv+a7u1+Y80cYjeX2rUP/GcIo8leGMZI8k9wor
	uPF1YlHxt2KsPXls5hqCaZROtsMk0E5Vph9lpWKrimedE2ac+PkK6OzJ0oHHU/Qp2axzSOlDQk9Ta
	qdxsiIpBJy3go1iJRLjrgDH91dU7n8UFK2FxXFO9pGcNAsO8WO1JnQLOaKHklDve8Tpv8eeAWDzG9
	qrY95R7E0MC0nJ8ufN+lNcOYHAAeRQtO6PzubnBqcdqdk3dpUpapKQJIab6e1hNPkVcY6SMuKjcl6
	SIdpnubRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEEoJ-0003D3-3b; Fri, 04 Sep 2020 16:43:35 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEEoG-0003Ca-Th
 for linux-riscv@lists.infradead.org; Fri, 04 Sep 2020 16:43:33 +0000
Received: by mail-pl1-x642.google.com with SMTP id a8so1426834plm.2
 for <linux-riscv@lists.infradead.org>; Fri, 04 Sep 2020 09:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nAm7MkjzNXisCy7+ch7x2r9mkDHgpbPGhxOYS7CWrr8=;
 b=pMgwV8AwEVjWFwQEo3b9bjaCVQOzRhRYlj67mzvuxz41dYkiFtbEa7de9YWFJBt4oo
 C+yXh9XQ+jGgCfDBdLREUZlqAbm+cGapY3Icls5ablcKOZx/kSMafbPFxakLEtKhNhjz
 sYjup3WZCwImNdUhySG86Xxpu9chVsn3Q833DtxkIBYkRWH9bvMQk1LelqvcaaeJCbRm
 C22tw26aDLzp+dp0ZgmT7oQbrAeVg0uiUCPmTUSuEtre2JXyXXpTxk8JAngl06yauasd
 PkYAqJjnVl5iEp1ju9BWgHrS9ZGl905m1H+404bcSDjZVgTv7aCdfLPI/h+z31GEggHm
 gE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nAm7MkjzNXisCy7+ch7x2r9mkDHgpbPGhxOYS7CWrr8=;
 b=aTmV0RZ+QWoDJnuHU6R6mqdJil62e4dTLUMebtvuQTRs0/qIpu0WwSaTjVi7IJ2dcY
 H2lg6/mJzQkoacDizz7qJTV22vb3kYevyaVnrb+ZuURh2SUaA76xdA+F6Zq2DAgOfn0m
 HEmBjChZJFdY2DJlWPpws+ZGgKpahLArYynBfgMu0xu0YprOK7bxtwgLeJ2w8fpAUTnV
 5hNQb45ExIZLhxnnUircOoYlStoa84X7ggGxq8FmLQu0iKj8hiClgyLGTF6FNgzY0V8S
 p7Zm8ptEW15rtxrn2iA4K1nbQTR2YXGe2W9XiJLdtNCYDkERVHin7ttseObs+PvkiVcY
 KOUQ==
X-Gm-Message-State: AOAM530hmARPIAq6s/smmpfSP453Q/SKOFWL/9qSa1BPgLI9grPwDj3v
 CkOXyzDUD974w4516LcGTeeyCHG18rGNjEezWHUpOA==
X-Google-Smtp-Source: ABdhPJzvtfKsPfB8wh9Y9fOxdFUYrY1cJ00wnwe/aHTdlspsZb2WXoGDwFjNhzzwMYfD4B6Wijlv9/qEBKeMX2COua4=
X-Received: by 2002:a17:90b:360a:: with SMTP id
 ml10mr8567244pjb.198.1599237810537; 
 Fri, 04 Sep 2020 09:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200904162121.279578-1-anup.patel@wdc.com>
 <20200904162530.GA32095@lst.de>
In-Reply-To: <20200904162530.GA32095@lst.de>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 4 Sep 2020 22:13:18 +0530
Message-ID: <CAAhSdy2ru2xuOC76UvCBhUoDNEv=f_w0Q4N+9UmQaVnNyMaE-Q@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Allow drivers to provide custom read_cycles64 for
 M-mode kernel
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_124332_994319_FAE2BBCA 
X-CRM114-Status: GOOD (  15.45  )
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
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 4, 2020 at 9:55 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Fri, Sep 04, 2020 at 09:51:21PM +0530, Anup Patel wrote:
> > The TIME CSR is usually not present on most RISC-V systems so the
> > M-mode firmware will emulate the TIME CSR for the S-mode (MMU) kernel
> > whereas the M-mode (NoMMU) kernel will have to use MMIO clocksource.
> >
> > Currently, the get_cycles() implementation in asm/timex.h does not
> > consider the above fact so we provide alternate implementation of
> > the get_cycles() for the M-mode (NoMMU) kernel which expects drivers
> > to provide custom MMIO based read_cycles64() method.
>
> Please just go back to the previous working version without all the
> crazy indirections.
>
> The whole timer and irq code has been turned into a giant maze of
> indirections lately.

I respectfully disagree. IMHO, the previous code made the RISC-V
timer driver convoluted (both SBI call and CLINT in one place) and
mandated CLINT for NoMMU kernel. In fact, RISC-V spec does not
mandate CLINT or PLIC. The RISC-V SOC vendors are free to
implement their own timer device, IPI device and interrupt controller.

We already have RISC-V systems (e.g. Andes AE350) where we
have a different timer and IPI device instead of CLINT.

The current code is more flexible and allows SOC vendors to write
their own timer driver under drivers/clocksource.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
