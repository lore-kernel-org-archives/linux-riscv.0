Return-Path: <SRS0=4W5w=CS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2571C433E2
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 20:35:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F69E20C09
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 20:35:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X9OxO6sU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="qnfK0z+G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F69E20C09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=TBS8P6McI7CN7VvgFEma1Fvd494GvdWTwxvqmkAPkOI=; b=X9OxO6sUlEvJunBgwgmbxp+Ag
	CzIgSkMZwl3aO5jVE8O95ey4/EjsRaLp/QiBhByTEDVmHO0alTjoxn88uIprAE/pBjqzvS836CZC1
	Xj6JlWT1YVDNTaJWuKIMkpWKnWjZMaqhx9oKRanOP+FuS+srKMzHZaZHr6wSJKnqVCJVQ0WU4Uoy+
	LWachq85s6nJNnOGUKEmh97pUkWdceR0QeR6Lyp9qkD5xWivv5zh1aAuOUqUx/U9trbc1owQ3HQKE
	ElECSthtk6qysoXDZwQWmK541E8HjEt9NpVtM3fdb/dWhfJB8cRM4EMnxKcGJ2u/qP/aRkST1Qe2G
	lhf7NDxjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kG6oI-0005d6-6F; Wed, 09 Sep 2020 20:35:18 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kG6oF-0005cB-GC
 for linux-riscv@lists.infradead.org; Wed, 09 Sep 2020 20:35:16 +0000
Received: by mail-pf1-x436.google.com with SMTP id v196so3324642pfc.1
 for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2020 13:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=/RXsnkWih2BpQqFypOG+usu++Ry9vgX3vnm3OMrwgoE=;
 b=qnfK0z+G8TatS3L0X4+9PegtDbvuhhwQCrndp53r3b6i7RFqHb6PgdhmgM1MiHdoFZ
 yW4Hb21nO2DCg573S4X0qWYjFHzqN2LBxTBP+k2SKC9YpAilq8nhzpKUxSmLsZfovcEx
 dwT9hDKk2T4j9rw/WYxDcit2MTDvkVpDdSYtTy9Oczc7y3iXWl2hDYkWo2hO0boQsueJ
 DJY1bEgejm4xywVCCLAJptGQsg2GJnGywoWFWnWeUHr1uwrUWuEtkg1L055Th3rlzA0o
 AjZZf2iCv7l3UupqiI6LIB6Smj7N3OaY10Psp/vFsH0sLpMMbBaXklE54NZxkHJ4B4P0
 MjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=/RXsnkWih2BpQqFypOG+usu++Ry9vgX3vnm3OMrwgoE=;
 b=NlJlhpIzDOAFolYImrNoOwZFEXwVWXo9ZQI+Rvvz+vnVqVsvbtLfjm22fh3k9sra2z
 IRt0yks8ByzI2MI5YbB7dThQ5jfJLdBORtF8PfqqmlU/CRbZ31xaUFEmw0ckg7PMa/ws
 dJpbtKA0TbQ28GgHvhnmlUZdn+JUDw/Ki/wESC11K/KUFtaP6Ouc67szLAcB+SLrOTOz
 iovdGXAjLh+WlGeYqT6q3nptjuNvK5nos2wW30N66NfvX2qletWCJFJJ3OaA4Rdich3m
 P7z7S+XxjFVC1vrFihdHsH3f+pcz4Lc1EkS2NlxWtWHK4pdmF7aYmtckzJtbmAktHe8G
 gu+w==
X-Gm-Message-State: AOAM5330NlGhf/5sB5Abj1Va38EZfknV/mEQZjtqS4wxB66vfVHIsGDr
 n1wk2UTEXGa1LfdEVLufOctYPA==
X-Google-Smtp-Source: ABdhPJyKq0Z82XPwGVpogzvvWPJpsuKRxhGvEV6hWi1I8xv2DG6XwOPMz1A0JbaE9mPGV/PNPEcY1w==
X-Received: by 2002:a63:4f26:: with SMTP id d38mr1832102pgb.72.1599683711946; 
 Wed, 09 Sep 2020 13:35:11 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id o15sm2814180pgi.74.2020.09.09.13.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 13:35:11 -0700 (PDT)
Date: Wed, 09 Sep 2020 13:35:11 -0700 (PDT)
X-Google-Original-Date: Wed, 09 Sep 2020 13:34:03 PDT (-0700)
Subject: Re: vmalloc faulting on RISC-V
In-Reply-To: <CAOJsxLFWbV6FoEgHPHVN3PksrP5mXWbbFUuzH8YEDd1VdvEp7g@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: penberg@kernel.org
Message-ID: <mhng-5b700d9d-3913-4058-ae6c-c9905582fb5a@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_163515_547758_F8C7D2B4 
X-CRM114-Status: GOOD (  21.42  )
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
Cc: linux-riscv@lists.infradead.org, jroedel@suse.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 08 Sep 2020 23:29:10 PDT (-0700), penberg@kernel.org wrote:
> Hello!
>
> Why does RISC-V need vmalloc faulting in do_page_fault()? If I
> understand correctly, some architectures implement it because process
> page tables can get out of sync with "init_mm.pgd". How does that
> happen on RISC-V?

RISC-V requires a sfence.vma when upgrading a mapping from invalid to valid, so
we need to do something.  Our two options are to eagerly sfence.vma (IIRC
there's a comment about how one might do so) or to handle the faults that arise 

On Rocket these faults are unlikely to manifest on the vmalloc region because
we don't speculatively fill the DTLB, memory is in order, and we don't
regularly reference invalid vmalloc pages.  The DTLB does cache invalid
mappings (IIRC it helps with critical path because it decouples the stall logic
from the address calculation logic, both of which are very tight in the M stage
of a canonical 5-stage pipeline) so they can and do show up, just not that
often.

Since the faults are rare and sfence.vma is expensive we decided that it would
be a net win to elide the fences and handle the resulting faults.  IIRC we
don't have any benchmarks to back that up, but intuitively it still smells like
a reasonable decision.

> I am asking because Joerg Roedel recently switched the x86
> architecture to a different approach because apparently vmalloc
> faulting is error-prone:
>
> commit 7f0a002b5a21302d9f4b29ba83c96cd433ff3769
> Author: Joerg Roedel <jroedel@suse.de>
> Date:   Mon Jun 1 21:52:40 2020 -0700
>
>     x86/mm: remove vmalloc faulting
>
>     Remove fault handling on vmalloc areas, as the vmalloc code now takes
>     care of synchronizing changes to all page-tables in the system.
>
> If RISC-V has the issue of page tables getting out of sync, I think we
> should switch to this approach too.

If it's actually error prone then we'll need to switch over, but I'd anticipate
we pay a performance hit on existing hardware so I'd prefer to fix the bugs if
possible.  My guess would be that the bugs are very ISA-specific and the
performance tradeoffs are very implementation-specific, so while the x86 folks
are usually quite solid on these things that may not apply to our use cases.

If there really is some reason shared between RISC-V and x86 that makes this
approach infeasible then we'll have to fix it.  Knowing why x86 changed their
approach would be the first step.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
