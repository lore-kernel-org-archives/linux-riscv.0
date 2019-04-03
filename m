Return-Path: <SRS0=Yzoz=SF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A03C10F0B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 08:42:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F6C820830
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 08:42:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L4UjBRMP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTlaWO4A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F6C820830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fuPtwLyHASjO/ePYXAOQGiY7AXTomtiqu5lEqWASbU0=; b=L4UjBRMPJLZJKO
	vpMrBMuFdosKv+KBawCgdcgYJVET8pvTngnASiQPpmU65hP8fD1dLFyHm/GRxo41WivfAm+TL0gFb
	OVmWSAalMWNwkAKvh2lKgElPfwpWDR27I8nnFVouB/ChsmjPNXbpw1RpJrEavzgyyT2NxBx4Dsan9
	3CYLLiL3k9QMOUxqg1VP2aX3eOAVuDQzL1tI7nTHWC+uPJHzEV2YrEKDHMH7V7NnFFbPzMixQr+MB
	iBODCeS7LmGnaWgJfmW8HR0Z4KX/ep4xfaikXpmFQL/yH+fObKC1QX9JdIoP0D1xKcdAAfSovsveV
	YAR8PgWvtV1gfYf6GOlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBbTo-0002IM-CO; Wed, 03 Apr 2019 08:42:44 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBbTm-0002Hl-Bb
 for linux-riscv@lists.infradead.org; Wed, 03 Apr 2019 08:42:43 +0000
Received: by mail-ed1-x541.google.com with SMTP id h22so14121374edw.7
 for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2019 01:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pth6qptnAtFOPebmz8ODuSRzZqriahS5jo5kFD2VjBc=;
 b=UTlaWO4AnRyZ61tglPEf0x4eU9QSZFjKaPwrlqu38jjSNiowmPWQZT36gqaYNlooE6
 agc4N6q79bUevo2oXHnWj1XooG4skOJt7IvA15PGGeNHpvQDMJWnm8oDvml4sr8hza52
 cDPjE8HNU2PNwhQvD7gh7uZxZJrrG3qtk/Wr1nXtRDjC7ZcLI6yiU1a7dsyDOZCrNI/B
 XVmdSv3xB8L0ChFhUY170qzlfTmD5aYq9PfwYAFUsvRqWVDxnqXRmlZAJnXyPoXtbBgZ
 GQnwxkPrJ6GLTMT4M6LYBIuwR8Wlb1PJZujWRDqlwdSqYuhZrLj7MR5zV6ZZ39JCD+L5
 Eh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pth6qptnAtFOPebmz8ODuSRzZqriahS5jo5kFD2VjBc=;
 b=M/R6lWIQHeRs1WOOfE/WKIysXUhlT5RSN3nekZUTVvjmLw0vtv4OWUDZlWsZNAKNly
 R0WBGqHbrhtUW6ojo2tY6t0pKu45MmBmdYVdyNf83Q48wolvwZysb14kvuEnI8uk6Mlt
 4QEOeYqQE8Hnq1E18Wt9KZEGJnmXF0JjLRjujD972XNrxNfcSQtIsqSC1quDSPOApetE
 X8dVC8C4ds1sMM2WTcK8KEcF6HyhL2HjVZ9CdZtNGJ2xV3IW28fv2ZL6Q4GMe/GMC6O3
 zv0o4TfCD74WvTwzXUoQ7AXFrD06H+tQZ96gdNL2cEJ67gNDyldkIdw0usjYliKFgjc1
 XH8A==
X-Gm-Message-State: APjAAAW+pUadIU/CqviOev0D2SXR/hp/anDu+wmWdLTJVymDQ0fEUeV8
 O02mdThfMDks3wp0R9b38E8=
X-Google-Smtp-Source: APXvYqytCii3JINU/JUxMWPXOKAiBYAoy6QpCKmpM82dq0S1KLPDaO34F86BsPiQ0Ps4MyKPxh+ebA==
X-Received: by 2002:a50:d591:: with SMTP id v17mr42821623edi.180.1554280960373; 
 Wed, 03 Apr 2019 01:42:40 -0700 (PDT)
Received: from aurora.visucore.com (92-110-144-95.cable.dynamic.v4.ziggo.nl.
 [92.110.144.95])
 by smtp.gmail.com with ESMTPSA id p18sm2877402ejm.4.2019.04.03.01.42.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 03 Apr 2019 01:42:39 -0700 (PDT)
Date: Wed, 3 Apr 2019 10:42:37 +0200
From: "Wladimir J. van der Laan" <laanwj@gmail.com>
To: Alan Kao <alankao@andestech.com>
Subject: Re: Perf counters on SiFive FU540-C000
Message-ID: <20190403084237.qygtfnefppdr3vtj@aurora.visucore.com>
References: <20190331143732.7n4b5llrkxs5nbvm@aurora.visucore.com>
 <mhng-0cd5a4db-2499-4830-a4bf-656275714836@palmer-si-x1c4>
 <20190403010426.GA4033@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190403010426.GA4033@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190403_014242_392829_A67A4172 
X-CRM114-Status: GOOD (  21.62  )
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 nickhu@andestech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hello,

Thanks Alan and Palmer for the input!

On Wed, Apr 03, 2019 at 09:04:26AM +0800, Alan Kao wrote:

> > >These are very basic: CSRs mhpmevent3 and mhpmevent4 can be used to choose a category
> > >(Instruction Commit Events, Microarchitectural Events, Memory System Events), then
> > >from these categories a bitmask of events can be set that will increase the associated
> > >counter when they happen. I don't understand the rationale for counting multiple
> > >kinds of events in one register, so from what I understand, two counters can be
> > >supported at once in the perf interface.
> > 
> > The idea here is to allow users to have different performance counter
> > granularities.  For example, users might want to count all pipeline flushes
> > (maybe their framework defines that as a possible counter type) or may want
> > to specifically indicate which sort of pipeline flush should be counted.

I didn't realize some of them were conceptually hierarchical, seen in that light
it makes a lot of sense and it's a good way of being able to count at various levels.

> > >I found some documentation about platform specfic counters in Documentation/riscv/pmu.txt,
> > >hopefully this is enough to get me started.
> > >(If someone started work on this, please let me know)
> > 
> > Someone from Andes had patches out to add support for their performance
> > counters a while ago.  The issue there was that the performance counter
> > implementation was chosen at compile time, but it should really be detected
> > at run time via some platform-specific mechanism (ie, device tree).
> 
> PMU detection was one of the problems, and should have been solved in previous
> patches.  For the rest of the problems, Documentation/riscv/pmu.txt should
> serve as a good guide.

Looking at the device tree (for 'sifive,fu540g' compatibility?) seems, to me,
to be the right answer here.

It'd be possible to really-detect by configuring a specific event type then
running that instruction and looking at the counters, but that seems
unnecessary.

> > Aside from that I think the only issue was how to expose these to userspace
> > in a sane fashion, which is something I thought would be quite tricky.  IIRC
> > someone managed to convince me that there was a really simple scheme for
> > doing this, but I don't remember what it was.
> 
> The corresponding userspace tool is in tools/perf.  Once one finishes the kernel
> part, the work left for userspace perf will be the symbolization of PMU raw
> events.  The preliminary patch supports common counters only, so I believe this
> will be the first platform-specific PMU in RISC-V.

Right-the user-space interface would be 'perf', the idea would be to make that
work for all the counters so that 'perf top' and profiling work for them.

So it seems to me that on the kernel side, apart from the setup and allocation
logic, that these platform-specific counters can be handled in the same way as
`mcycle` and `minstret` are, they're also simple counters without overrun
notification logic or other fancy features.

Also with the same limitation that they cannot be written to from the kernel
in S-mode, so need to keep track of deltas.

Speaking of which, can the kernel write to the selectors? Oh crap I guess not.

Wladimir

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
