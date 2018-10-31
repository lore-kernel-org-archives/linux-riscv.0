Return-Path: <SRS0=Wf4V=NL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 879D3C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 17:53:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CFA62080A
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 17:53:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cDFyRfKA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="ilDIcmkR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CFA62080A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4wtGkUK1MEXM8aiMZDvPMb/xeptTBaDE3iCThzbOuFo=; b=cDFyRfKAIt1gFz
	b7zyMRlMJMDzV1xaycQ8lCQEYcuRj1mfupEhTT0SzHF6f7824wcDwyJi5gdOciW26z9xj38tK9upp
	MMnK2qCZ0QUubBo2EI12OZB/ftA7Zm4fdOibBnuUg4KfLBKfIIJpX031W3W61lmf5n5yWARK0bdys
	Flb8nknIzQ1+KgQM1WRCVm3D5Hiq2ahhFEf5EekRj9nVXiulSRYme5uBXdpeelJQkz2Wd6n8YPe2h
	s4SBI0o6Lpr8Ty+OyhJwxZ1f/ai2o+jubNis9rzYRkZ6rGrJ0zJZA+tlwG9YORFqLUbIM6w89uPV3
	dYGvnVTMZTuyrVZWKEtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHugD-0002wi-Fj; Wed, 31 Oct 2018 17:53:21 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHugA-0002vE-FH
 for linux-riscv@lists.infradead.org; Wed, 31 Oct 2018 17:53:20 +0000
Received: by mail-lf1-x141.google.com with SMTP id q6-v6so12318946lfh.9
 for <linux-riscv@lists.infradead.org>; Wed, 31 Oct 2018 10:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g0IrHxduBcZHFMvoPRPZebBFVY7/ASRAbySjIVIKC2A=;
 b=ilDIcmkRI2jh7+drVrTBaREQk0chT/L0w5Awlan9QPVa6R4kZ3VMdvreLxSlSunKFW
 +SpiU13ANsBHAnrr0yN/KPuhG8XkndbEFP2YAr6qLTXtn7enXHf+yBNhTRvTHzXEPYo4
 aAXzPYdzFunV3Eo2sMUtdfokA8umAPrgXRsg3NOHNHVBNn/CSPAZ+WxZPYygfa2E5w4s
 1XaRHm1pZ75wpNv77eU7lj9YfpQJIaFcqnwypL6QSI3y13rGPMYytJ6MKJ6SYwFtd/YE
 ohU2EM2hNXFzbEncHId0XSdFfznF1D3lN67VZ/fKQZIvfFr0L/niQZRUi2FlL/WLeNoN
 0wmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g0IrHxduBcZHFMvoPRPZebBFVY7/ASRAbySjIVIKC2A=;
 b=Te7+6DeHTD496kjb61ChSV24t1ael+WH6BVjqBGk8GE7axy0D4Jmoxs536b6TsKMLm
 WH3PrvxLD46AO+nZiDtxonkSAXnnDYxARYuBt7UREFThpO1PAsxoG6X9DT1wHaN2GNTL
 WCpUr1iHgjZY1ZlzbMEapHsbJ9J3HnSwFqVU9mIZccIvtlnrKm7agckxKcdukX5KgcAh
 vuoMBKAJrSQiHjNhtpBawIWPvBcUE+IVpOPM8jT1IUvQ+y9zkxWA7PUT8PFcW+gTfd6d
 egdk/HzidcHXwSQQNKzrnkFG85HJ8GMyzUdq4ZrQQdr7ysspYJMAmsNklrJgFX6S1SyJ
 g85Q==
X-Gm-Message-State: AGRZ1gJbv5/EE0tAGOjykGm+My8Hj4Q9r7Zswg4sUn8UE9d/C+OhDn3D
 z3Kt0oYdOKOmQXHCFekLYNkJAJgI54BE4MTCWY4N6g==
X-Google-Smtp-Source: AJdET5eO6mD6lP2Itc47/yOLIyL8e6knEwHpm5DofhD+vkwPtPQfUJZvJ3gC1WgdsL86wKOnxbnMw4EH/qZiGNCbs1A=
X-Received: by 2002:a19:df41:: with SMTP id q1mr2582969lfj.25.1541008384704;
 Wed, 31 Oct 2018 10:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <20181031064709.30981-1-olof@lixom.net>
 <mhng-74b51433-1762-4741-935d-56ca1b3548a0@palmer-si-x1c4>
In-Reply-To: <mhng-74b51433-1762-4741-935d-56ca1b3548a0@palmer-si-x1c4>
From: Olof Johansson <olof@lixom.net>
Date: Wed, 31 Oct 2018 10:52:51 -0700
Message-ID:
 <CAOesGMgWDM+Etng3bNU-Yem6+WRJEu+TfddzKoN-htno1Az3=w@mail.gmail.com>
Subject: Re: [PATCH 0/3] RISC-V: A few build/warning fixes and cleanup
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181031_105318_515213_4C643555 
X-CRM114-Status: GOOD (  13.68  )
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
Cc: linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zongbox@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181031175251.kET1qi93EAgj7sOyJAPNXyg7yemAc_OeBQhlYv-b6u8@z>

Hi,

On Wed, Oct 31, 2018 at 10:09 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Tue, 30 Oct 2018 23:47:06 PDT (-0700), Olof Johansson wrote:
> > A couple of fixes for build breakage or warnings, and a small whitespace/asm
> > cleanup. The non-cleanups would be good to see in 4.20 to keep builds green.
>
> I'm happy to just keep them all together, since the cleanups are non-functional
> changes.  Patch 1/3 appears to have disappeared from my inbox and I can't get
> to the infradead archives, do you mind re-sending it?

Sure, check inbox in a few minutes.

> This also brings up a bigger issue: I need to stop breaking the build,
> particularly as we now support a bunch of configurations.  Is your CI stuff
> still running?  It'd be great to have it run against some of our integration
> branches so I can catch these before they make it upstream.  I haven't been
> getting any emails.

I've migrated machines to a new system and that CI is up and running.
Right now the emails don't go anywhere but me, but let me know where
you want them sent and I'll be happy to do so (probably not
linux-riscv due to volume/noise). They're also uploaded to
http://arm-soc.lixom.net/buildlogs/riscv/.

Since you keep single-patch branches in your tree, and I compile
everything for every branch, I've restricted what branches I poll and
build. Right now it's "for*" and "riscv*".


-Olof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
