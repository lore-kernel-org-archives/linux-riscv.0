Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28F0C433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 19:38:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 806F923877
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 19:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 806F923877
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4Y7ol2Ctz4pDCll3rEZ+qa/X7ff4FbHat4bip9clGgo=; b=M8E50LD5vbOdjaYFmwDNLSPAC
	sK0WSgxizC2SELea+Z1G+KTgn19tcBEZY1c+KusRJ3e0Ocl2aC34fcUmbIyXWpowIBPd30KBCpNXm
	klyAno3+LuZ5XAbWAtU5lNE5p+nmZ6A0xY7SfPvf6bXlpipqIM5O2fqdRXA3q+oBjHWha0Hq8ByHa
	DRq0EXCvpoiCOiSqYAGamA7DuUH2441lkJAQK/5IXSZkr0hCTvFT6MCgeQC+SOGXpu3Hc+Y9xQP+y
	EZn8KPYBgC6Bqb+SPCYTIoNnJ7RYwia3CDY/feD7Ctxwcs2VkC194khetrMrzNpAgHisRNnENJq2B
	CQbzW0AdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0UvS-0001LN-0q; Fri, 15 Jan 2021 19:38:26 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0UvM-0001KO-H8
 for linux-riscv@lists.infradead.org; Fri, 15 Jan 2021 19:38:23 +0000
Received: by mail-io1-xd33.google.com with SMTP id u17so20386620iow.1
 for <linux-riscv@lists.infradead.org>; Fri, 15 Jan 2021 11:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MRK9S6IyjgpiC2nfddXdvjiBK+bu0o1oO46ZMTxvjHw=;
 b=No9lsQUKMtpN/LvjEYmn0WtI7oYbgXARixmRRVnNbwU3BG0lYYkUhkXZEPSJQAdVfO
 UDGfXifgRoLXAzztPpzQ/OV2npqGrI4ENU3oK3FIXlPjLMloy4sEUIEN6L+cJnXEOw0B
 xknRwfLmcA+FjjujAvnzcL2gw5bfNJEdaBIhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MRK9S6IyjgpiC2nfddXdvjiBK+bu0o1oO46ZMTxvjHw=;
 b=Y6t7+EcG7i7Y7VNnN5VO7hdK3Ye8fL7YNnginE1NICYrfxPZ1Es7g4oVHY8UVwtyb/
 ayi3RoFoOKwS8cQhmOULp1Abn1VZPPSa5mxDPMfY3r9JjrNBq3srO+ak+KzaCM6/bg8v
 GqKKRqQ/CQ3oWtrsn9VneQnoiBax2445LeTg1RVDmXut4psdroULBEBa8IYKU3HvvQdl
 WO6lzwhFthgSRxSqsSTzeoXFf7qudjXGXTwiM9Lo3Dg8TfG08M4S76p+XOEYu1iAq/MA
 WplyNpa8nobIcM6Kvq+E5/T3OjJDVmQwvNdENIIhcf9TS4/hPZDKNH0n/PmZmDGss+Yi
 llYA==
X-Gm-Message-State: AOAM532DSC/lszwaqfN/uxhvRZQAuugIT95kcYhrkzQKCY/u5+UIBNV2
 NmQzJzQfZaUZeajPX14hV8DUULhs0AqKpDa76udsgzbDhhJl0wY=
X-Google-Smtp-Source: ABdhPJy69cyum4uMdJW6HNxAKUmxpFvMoVZnGxHotgJFRADTFe9acsNPwCHF6tMUXstXeAoKDiCdZHj2x9Ah6GIqkBY=
X-Received: by 2002:a05:6638:2243:: with SMTP id
 m3mr11645850jas.115.1610739498483; 
 Fri, 15 Jan 2021 11:38:18 -0800 (PST)
MIME-Version: 1.0
References: <mvmk0ssu8yi.fsf@suse.de>
 <CAOnJCU+JmDaU1f3hAbyjR4__TVHJbjnZZ8th25i5Q-et_UxXeg@mail.gmail.com>
 <87im8154r2.fsf@igel.home>
 <CAOnJCUJg+-4RTz=6JQDU_c90W1KpNkvNN=riLfHmtwtpHAh0yw@mail.gmail.com>
 <87czy726w9.fsf@igel.home>
 <CAOnJCUJKn=TcbiVQyjGt_k+O=RG0q-poxxYxUOEWeqbNBzWBLA@mail.gmail.com>
In-Reply-To: <CAOnJCUJKn=TcbiVQyjGt_k+O=RG0q-poxxYxUOEWeqbNBzWBLA@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 15 Jan 2021 11:38:07 -0800
Message-ID: <CAOnJCUKBk4Eg_rZXzMXtLTWDsob=C1EFpnv3CENLz4-=gSk-Yw@mail.gmail.com>
Subject: Re: EFI booting crashes
To: Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_143820_600699_7AF38B38 
X-CRM114-Status: GOOD (  11.18  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 14, 2021 at 1:29 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Thu, Jan 14, 2021 at 1:40 AM Andreas Schwab <schwab@suse.de> wrote:
> >
> > On Jan 13 2021, Atish Patra wrote:
> >
> > > efi_var_buf is at 0x200b2338
> >
> > That's its GOT entry, not the variable itself.
> >
>
> Yes. efi_var_buf is a global pointer so it's location is in GOT.
>

Illias has fixed it in U-boot. It works for me.
Here is the patch
https://patchwork.ozlabs.org/project/uboot/patch/20210115160016.181511-1-ilias.apalodimas@linaro.org/


> > Andreas.
> >
> > --
> > Andreas Schwab, SUSE Labs, schwab@suse.de
> > GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
> > "And now for something completely different."
>
>
>
> --
> Regards,
> Atish



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
