Return-Path: <SRS0=qdQm=OM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1884DC04EBF
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Dec 2018 14:51:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DED452082F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Dec 2018 14:51:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Am0wkdSe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="q7rIC9fW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DED452082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G/ui+IT0GmvKtNJ1hn/rTypYq9nUl7UDyFOfb1pdRHQ=; b=Am0wkdSeOuNYzV
	XcZ50TL+Gyyvf0d/S8FgjHMozSJmtxbm48Ei0k54i0mihEGDk3u10CpgN1TdQMdQcpPenVIqHSjDy
	M/PE0j9TuBPaoP2MRNYrLbyjtCEDuqCBpFsY1VQobCtw9SvePXw0KJWOXMX7QCcVBYR4JKpJwpBbL
	67+Sjs2hzBdfXVUg0gVGrKmT1hcMKD0QP3Xp6nuNnCxdLW5uZhurVmyqzJ2FrSh7ppiDxv7el4eOr
	Ibzldc6hq1eIMJYqGNMLr65M1sht87WnFfx+1kxKT5ArhIUjTAO2JM4phJE0714LNms3wvXZyd1Kl
	pzoESmymOs+uh240wbUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTpZ3-00030j-Em; Mon, 03 Dec 2018 14:51:13 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTpZ0-0002yI-O3
 for linux-riscv@lists.infradead.org; Mon, 03 Dec 2018 14:51:12 +0000
Received: by mail-wm1-x344.google.com with SMTP id r11-v6so6123478wmb.2
 for <linux-riscv@lists.infradead.org>; Mon, 03 Dec 2018 06:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M5guKpBWbU/3wU/cwZnd4lZpwA159/KCkTvnwEqfCpw=;
 b=q7rIC9fWyPq4UGXoAC8kim4IcMfIe7MjD2oFnYjdZLYAW6/7JcYN+rKIUxO0Pst2Sp
 xUr+ORGLQQFuuCPHlJ2OSWG0r/hgeThjsBKakNx/WJFRMvp8l36yZdcnRdbFBsL9cJiI
 c5SNMgxY4xBUV9rMhwB7R5OBor7kX6WavTv0bfZD2qjFyoqwi82y3tarpNjHnHQgs48e
 qf9Hhow6aciaY2knTUA9xTfKAl8GQt1+0jzON2EiJZvSBesInp4RLYNmInb3Nlqj8xoV
 xTXtbjHuhGB93ktbyZKGBk6Sug9fEoXsSrZ1+ZkoiuVGHNV5kIW/UC3F6W9htSYqOWQV
 xOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M5guKpBWbU/3wU/cwZnd4lZpwA159/KCkTvnwEqfCpw=;
 b=fepYtt4LIigifQHAdOtbO58brOFfMgCM7b7gx/1W9sgBgk/61cOHRrCX/JI4X6Fyw/
 sWokZMrWjJeymxx2fBQHjihDZqJ6EI0Rp1xHpJB0AEF+rGo7WA6OMwNKUW+4CJJkNzFi
 FhIcZbiDUgHa6GkRLW0f2ka7vRZmrQoPXYcgYJX+zaLCEmRlJgOn2rny1fBbEAZAp4no
 NL1fZEJfTDcMgWq5il5ixKaPsRN3D1ofop0puhOH8D7HCy1SrIrNn2i3xhOs6l9mN2GN
 1rMNI1gKHHEVSkaHmVghMJTx8iaKRjGg/e/uSCExG/pp+C76wfDuoAtQgsP2xdFaQTRQ
 SMnQ==
X-Gm-Message-State: AA+aEWYBib4ODfw2byBX23bM22A3VSqwlbAZEyXfTfwU7F512b32bHns
 TYfH7RTqUN9LROClhixkl9cb1pag5HF/sUiPA+qsdA==
X-Google-Smtp-Source: AFSGD/VTN+6jjIdHaRf9CUm4wcPI2bUAePlk5q4ubpPOmmMe+XY2FVNu4+FqMJ8pGqpegO3tbMFimyhiEcRcaJinqRY=
X-Received: by 2002:a1c:ca15:: with SMTP id a21mr14667wmg.132.1543848658991;
 Mon, 03 Dec 2018 06:50:58 -0800 (PST)
MIME-Version: 1.0
References: <20181203123524.11778-1-anup@brainfault.org>
 <c970d873-9dbc-9f21-3380-89635d6f574a@linaro.org>
In-Reply-To: <c970d873-9dbc-9f21-3380-89635d6f574a@linaro.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 3 Dec 2018 20:20:47 +0530
Message-ID: <CAAhSdy2rw=4Uw8=MZtfHi_ML9ZBqeiJ2iv+tRmDnjQDh7yuUHg@mail.gmail.com>
Subject: Re: [PATCH] clocksource: riscv_timer: Provide sched_clock
To: Daniel Lezcano <daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_065110_780315_24A83A6F 
X-CRM114-Status: UNSURE (   8.95  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Dec 3, 2018 at 6:29 PM Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>
> On 03/12/2018 13:35, Anup Patel wrote:
> > Currently, we don't have a sched_clock registered for RISC-V systems.
> > This means Linux time keeping will use jiffies (running at HZ) as the
> > default sched_clock.
> >
> > To avoid this, we explicity provide sched_clock using RISC-V rdtime
> > instruction (similar to riscv_timer clocksource).
> >
> > Signed-off-by: Anup Patel <anup@brainfault.org>
>
> Hi Anup,
>
> the GENERIC_SCHED_CLOCK dependency in the Kconfig is missing.

Sure, will do.

I also have another patch to select GENERIC_SCHED_CLOCK
for CONFIG_RISCV. Should I squash that patch with this patch??

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
