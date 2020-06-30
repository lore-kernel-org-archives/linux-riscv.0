Return-Path: <SRS0=QRI7=AL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07999C433DF
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 13:36:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8BDC206B6
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 13:36:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IbmeWWcI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dy/dbFST"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8BDC206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4Fh6li0IBMeCJ+mL9HAjFaTAFhoqnyjouRUoZciomPs=; b=IbmeWWcIREWU+FAE4oFzaeFKk
	4HAf9B3Ygcf9wtP6B5QfSh7rcQzgpVPEJZ4CfJjnYES6N2ATYffVD6m/PHlO0OCP2VUZKMiOxHovT
	z7pj17kgu+pJDo2umLYnehMWoWHL0h0MRmrjsfp9ZIpIJPEiG5a14JZtyhASvF93JMOvIRKmF2yAO
	43TyzC5Y9Qp8jiNJylNa0iv122ZGBnabwMLRPfs/3UG7KXGQPbkQKfvtMXs5SrRhCiaa3iCZn0gf0
	dDpx1mJ4v3lkB/yHEBSE9M5ALU8/+LAhwIRU9SwWNDnkfhBs50NGNCKg8HwivbdxWTtDR4GxtjLFq
	G8UVQD1FQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqGQi-0005Nw-Uf; Tue, 30 Jun 2020 13:36:09 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqGQa-0005JO-QP
 for linux-riscv@lists.infradead.org; Tue, 30 Jun 2020 13:36:01 +0000
Received: by mail-lj1-x242.google.com with SMTP id q7so9324861ljm.1
 for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2020 06:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uYJXKCg03h+HifNu+mTpCf7uVaSmbFrexvHnmxgFCT4=;
 b=Dy/dbFSTlsOoabzaoUSmIgbOtpLJPNlGVSnv6EhPQDSBdck8qIMOeBQTnl5VbG+PSF
 WgHNb/j/3GaBQ256y/JXtWLJYMOTQsprnSXKC6UTRmQd9RVzWUOvdZ01QIaOZFVOSVut
 EN5Dhu6O03z8K4KT7rXNoKG4vgFpUyZoRhDacaE9YMChBZCJD60d0W52C4vI4dunAflZ
 dn9+0IJc/bhKrb4digV7psfzgVAS/+WAJ/yFb0pZBAB63ii4Cw0TVxonMurKMOBeq9nI
 EU4KJktcp/+rCqbyEbOxVE/GKGHz1cK/ZuWKPQ8hBLAl66aVW5WimFuZWeUG3CzIgCJl
 v+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uYJXKCg03h+HifNu+mTpCf7uVaSmbFrexvHnmxgFCT4=;
 b=XCWugK3b17KULn34KGpHBQ/E4lK26pgX4M4Fl3Se3eva7Ms2bo2Zp88eC5IUm2gvfn
 IJ9g/NBZjA1mLZAnHmr2CYzT/xe/y1RfKaevEZCRBPdboggTwDSB9Vq02U3+OjcknlQ0
 N38le0cPJlaGc2lfay2DnShG/kotqL+aISi2xiJwNVfmYW2VAG3upKYwxtXA7qrFh2S8
 xmfRbb8UdMN2dWJs6X+AxwAZtjs8fhw/oqK+qNCegJtLExaWmbF1bnhyqUVEb1R4ig3I
 6sVpHftPsKgrK4VQMYRasmTt8Kmpj1foZz2vzeL3+dJ/T9ls0tvaOXkXHx6imwO7XLte
 l8nQ==
X-Gm-Message-State: AOAM5321RYoMnAsuAs9Q44GBXNr/0mTt4gqX/70g4MchdYlrFHtvel67
 jI9HjUktyXCX9YK0BgVTqN7pgYeCc+u7Eqa8CJ0=
X-Google-Smtp-Source: ABdhPJyw28nn44BtJxO9OZ1uOAXbWVhBfVrfTa4Njw9GGaRH6SprXyC4p+RdxzAzyi0lQ4thwbPaVHUNtoFbbTJnF1Y=
X-Received: by 2002:a2e:9c51:: with SMTP id t17mr1688793ljj.333.1593524159063; 
 Tue, 30 Jun 2020 06:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <CACT4Y+a3A6DEvUjCsk_jKz9nZ=5iAzXTyG4WDPkug6u7BVrceQ@mail.gmail.com>
 <mvmlfk4n1mj.fsf@suse.de>
 <CAEn-LTqVR4CXk-q=7zwFKvgmHEZpP+AO0XiycKf9mDAHS60_yg@mail.gmail.com>
 <mvm8sg4n0ja.fsf@suse.de>
In-Reply-To: <mvm8sg4n0ja.fsf@suse.de>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Tue, 30 Jun 2020 16:35:23 +0300
Message-ID: <CAEn-LTq8cxT73p29hCx5_B9-b_J0khTFgEJAPwFE8zesktNE1A@mail.gmail.com>
Subject: Re: syzkaller on risc-v
To: Andreas Schwab <schwab@suse.de>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 syzkaller <syzkaller@googlegroups.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Tobias Klauser <tklauser@distanz.ch>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jun 30, 2020 at 4:30 PM Andreas Schwab <schwab@suse.de> wrote:
>
> On Jun 30 2020, David Abdurachmanov wrote:
>
> > On Tue, Jun 30, 2020 at 4:07 PM Andreas Schwab <schwab@suse.de> wrote:
> >>
> >> On Jun 30 2020, Dmitry Vyukov wrote:
> >>
> >> > Maybe it's a known issue? Should we use tip instead of 1.14? Is it more stable?
> >>
> >> Go is still broken, it doesn't even bootstrap.
> >
> > Could you elaborate?
>
> https://build.opensuse.org/package/live_build_log/home:Andreas_Schwab:riscv:go/go1.14/r/riscv64

You seem to bootstrap with gccgo, which will not work (tried it). You
need to cross-compile golang and use that to bootstrap.

david
>
> Andreas.
>
> --
> Andreas Schwab, SUSE Labs, schwab@suse.de
> GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
> "And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
