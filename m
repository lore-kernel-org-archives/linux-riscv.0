Return-Path: <SRS0=QRI7=AL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1651AC433DF
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 13:24:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0E7A206B6
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 13:24:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JnFuXJp7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="ch+NSfIf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0E7A206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nf3+xQdHP02SDLrcQ7FSz8i1YenOGKClQMacD0aedFw=; b=JnFuXJp71cz+89NwBHFa8WTaR
	hxDGU1rB4jOrnqBOTt9677MBUnnZZcYuQkMmRhYytvTpPV0FzTzI0XIyq0bd4LjFyb5KZ6aAodjnT
	Dh5/8SdTB6O/sapzcYNNr8TikS+dIS/Zfnvrbjw2YbXtBg2CWS9KjC0ZiLrVZwkujPBOv+cReRMy/
	mFTySPztUqSFAeuf2f+VuQnumbM8jvMj5PGNKwYepUGApJzsg8F5sLPqmI2dqZEQ2h0LcQIYLPAqO
	vrqHlxsvYzLZzRjAezPuLzMg7dlINmmH5GPxY5ITkITbkAyVc3Bj7SCo6daG1fdJX391MPrjbHu+i
	t9iU/vNnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqGFD-0002iL-4w; Tue, 30 Jun 2020 13:24:15 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqGFB-0002hj-ID
 for linux-riscv@lists.infradead.org; Tue, 30 Jun 2020 13:24:14 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id h18so9233536qvl.3
 for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2020 06:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fKgLJW+clITuvznD3XXjWLCV9VGnr8mJqU6OzwTVmiA=;
 b=ch+NSfIfRyOWC40d+fjbkHj+iUZDwxEvaamSp8n4+amSg6v397kQXOQI10XFU2m7Ne
 /uNAc16z9DSrRAmMz8O0yAgNWcsaWGBXLPXlQ4/hUMp6FWDrVWt/tiaHQLcHBQaX1IYe
 OJ+34rEJULoGWc8d+oHVQzTVuSbNkMlYEIzSHDb0jQ+24sWtmMhq4YiDXq0M5liA+9wk
 4WDzkKtSt/dj0IRDZV59Wo4V+o2PASF+vnQj3bUwLVsPtzpZkxmzsM7PGbsdl2n2ReEB
 6FbJKyzZxCWhcD5t5eNSkQjiXo4IePBjMzUBFZ4iy4SF2beD3rQ7aGwMRKzw3JiGebHz
 ZRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fKgLJW+clITuvznD3XXjWLCV9VGnr8mJqU6OzwTVmiA=;
 b=FG2DS/O7GR0JnwCe4w3HzD20619a9x7+2rYhKs1SR4pfuh3Ckk/MARRpb8l2gQPgqH
 vD9nukTdaxNMvOn0KBTDLHwiYSx7M4JkLnAxB+2Wr2A1ED8H1OA2rSspLwSD5/IUnh6u
 mm16W3d2kTo+jQsPl/T0yBYVcApka7ps9DTHQcpz7joSBvbQtAYILMZR1kaPmfX5V2Pq
 vTneymXHRw1Tk0H6apj83QWhEUeQ8Qh9iRPkZTCoLycHgUw8Lb9BOQpwzITG2yu02sAH
 FkpOsgNcXblDEPGYoIY6ZKRuqn46hMuHsY7Z/J4iJ7G/rcxSPByaWAR8QhUDZuUIKnd4
 DxPA==
X-Gm-Message-State: AOAM5312SH3ec8aSlmFkOKzcLSmyjTL9j0Vnz6EtQZpgsbZO8THcfYEb
 zSCDM/vdXNhPaJrEB3yA2ccS6TACFSvNz9zUoBu2kA==
X-Google-Smtp-Source: ABdhPJyBtN8aNhdAijWXeDhdTiTuAqDmZzVZ/YrfIaWKrxGWFUlvdsRnjKFrwH9ImyQJPIJJ6AlMLfRkIcM08syfyfM=
X-Received: by 2002:a0c:dc07:: with SMTP id s7mr20262065qvk.122.1593523450526; 
 Tue, 30 Jun 2020 06:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <CACT4Y+a3A6DEvUjCsk_jKz9nZ=5iAzXTyG4WDPkug6u7BVrceQ@mail.gmail.com>
 <mvmlfk4n1mj.fsf@suse.de>
 <CAEn-LTqVR4CXk-q=7zwFKvgmHEZpP+AO0XiycKf9mDAHS60_yg@mail.gmail.com>
In-Reply-To: <CAEn-LTqVR4CXk-q=7zwFKvgmHEZpP+AO0XiycKf9mDAHS60_yg@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 30 Jun 2020 15:23:58 +0200
Message-ID: <CACT4Y+aZ59njQqfJPKL+y9DnYu=1z8rT7Q5e0n2iWJ9w3_ojeA@mail.gmail.com>
Subject: Re: syzkaller on risc-v
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@suse.de>,
 syzkaller <syzkaller@googlegroups.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Tobias Klauser <tklauser@distanz.ch>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jun 30, 2020 at 3:21 PM David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:
>
> On Tue, Jun 30, 2020 at 4:07 PM Andreas Schwab <schwab@suse.de> wrote:
> >
> > On Jun 30 2020, Dmitry Vyukov wrote:
> >
> > > Maybe it's a known issue? Should we use tip instead of 1.14? Is it more stable?
> >
> > Go is still broken, it doesn't even bootstrap.
>
> Could you elaborate? I have Golang available in Fedora/RISCV and the
> bootstrap process was fine (after the TLB bug fix was applied in
> OpenSBI). The current stable release is missing cgo and buildmode pie
> support, but otherwise seems to work fine. I was told that cgo and
> buildmode pie is supported now, but not sure if that will land in the
> next release.

FWIW I took stock Go 1.14 and the whole large system mostly worked
without any problems (except for these episodic crashes).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
