Return-Path: <SRS0=ggg1=6Q=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E7BC3A5A9
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  2 May 2020 06:00:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59FD62137B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  2 May 2020 06:00:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GrAYDBT4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="VCV6t+Im"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59FD62137B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FDF1hXWC/s7Oyy2jCdyRcsT8e8W6WSRCRNbuadBXFl8=; b=GrAYDBT4TkNXHKDwMIcZ31pRy
	zVygrhaBoS1x3nbYYy3e6r/suOV8qUyV3H00jRsf9ddtxk4YMJpvIpVibuYfC9XdcM2hk7hmTMvIm
	69w/Khg63ZRNlSFpPqx54lBm1oJ8LNy5QWKKBnLhj5G971dLtsKVwU8AV/2pf4hPsGaVaBQuBQ+RJ
	yZoAl/l0fTJAWouCBaYeDlT4WqqvQJ1HRZC0V+rL+1PLjCPMWlmNv1rzgyEPV3/bM4miBmrDeTZmz
	QLWsZjqo7IkqcRpPlcfeCS212WAhdXpAJyOzHkV4MAGYGyLsgHfz+ig5bngye2xJiV4bTsmGRGw+X
	K9ixFcyaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUlCe-0000AC-RD; Sat, 02 May 2020 06:00:44 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUlCb-00008V-Pl
 for linux-riscv@lists.infradead.org; Sat, 02 May 2020 06:00:43 +0000
Received: by mail-ot1-x341.google.com with SMTP id c3so4316431otp.8
 for <linux-riscv@lists.infradead.org>; Fri, 01 May 2020 23:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FDF1hXWC/s7Oyy2jCdyRcsT8e8W6WSRCRNbuadBXFl8=;
 b=VCV6t+ImMO4jEWjNslBlWz6cqKNFoWc1JEfu0tDDfCA+eT7hh2yuSCB54TtP6xxjSy
 iA97AiXBxF+nbZJvS1AgfB9CH5pNpqtWcJrDLd0g90OsTa1PMGzV2nQTaOP0hL7Mslua
 NoKFwMCB6ImBjqf82Ewqrdw8Xk2ZM8V+uzpDevZPEcgXEWolO0k2lPMmckoRjtyg28+j
 vxDQG5ZJSnaKapXWPaqHpwArQlqcnzD/ZjyUyf9r5QrbPknlKYmQjV4iGmhm+4rz1w9b
 taVGGvk7nT30weXhFMZWP8YQ4svB1Cs0ZZijIB680tai7aNcKj5Z08OBq0rFT7VZc6TB
 6VyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FDF1hXWC/s7Oyy2jCdyRcsT8e8W6WSRCRNbuadBXFl8=;
 b=ETKh3OSbVyirfjuDoib2k9dVp4QjqISZsNmyI1O6bbjcmWEDAlWIxm/qNpymIqNpRG
 L4zrmif2HiYowohqnVLwZzVleeqmeORAeGcERFGaixRgFzhNuA18E4yAsgyn6Ux3mwcv
 Xarakg/bkaRTHqY4pGlPbmQ3pSeePkqCLoHaw2ni5evBu7TBM5yyo8nB/4mbZnK4F5ku
 jXOSL+lA3PIgezdShBzzTSYrCWLXSdtg9MV5T+u4JGSY2Zek3oPhgAG9TnxW8NAliXp6
 ZOFHvFr7vlGe9oxKvD/ms5qHXYvLAChGH4W8/AtY5u8Cln52ZeNjAY1aS4+8yyqqAPUw
 pbEA==
X-Gm-Message-State: AGi0Puaok6ABZ4JaGChkGe11avt82pF8JUATg+pe8iIfmjWm27vJA00s
 aDt91d1yi261S9HxQm+1L6aOSx+NB/cvHltD0wbQJw==
X-Google-Smtp-Source: APiQypIM3uXqqJd6aGFJt1RXbZG6aN0mXG2pfDnjyGbJ12cznOlGaf/9vtpuw7ftZRfJpM5fXyH4JyMTw5qWCIwhWJI=
X-Received: by 2002:a9d:7dd8:: with SMTP id k24mr6410161otn.33.1588399240219; 
 Fri, 01 May 2020 23:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200430095325.111441-1-zong.li@sifive.com>
 <CAOnJCUJBJ3wrY-KY3YgD-qJfr7dsWzdA83fxFYmOTmjsrYgOfA@mail.gmail.com>
In-Reply-To: <CAOnJCUJBJ3wrY-KY3YgD-qJfr7dsWzdA83fxFYmOTmjsrYgOfA@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Sat, 2 May 2020 14:00:30 +0800
Message-ID: <CANXhq0qk_GQubgWB9=2uMVDSLSCWaiLtPkBcHQCPLCHyVrtdnA@mail.gmail.com>
Subject: Re: [PATCH] riscv: force __cpu_up_ variables to put in data section
To: Atish Patra <atishp@atishpatra.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_230041_921138_6E985484 
X-CRM114-Status: GOOD (  18.32  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, May 1, 2020 at 2:23 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Thu, Apr 30, 2020 at 2:53 AM Zong Li <zong.li@sifive.com> wrote:
> >
> > Put __cpu_up_stack_pointer and __cpu_up_task_pointer in data section.
> > Currently, these two variables are put in bss section, there is a
> > potential risk that secondary harts get the uninitialized value before
> > main hart finishing the bss clearing. In this case, all secondary
> > harts would go through the waiting loop and enable the MMU before
> > main hart set up the page table.
> >
>
> That would be only true if you are using random booting protocol with
> SBI v0.1 implementation.
> With HSM extension in place, all the secondary cores are waiting in
> firmware. The booting core
> will bring them up one by one from cpu_up method.
>
> The HSM extension is already available in OpenSBI v0.7 and Linux
> kernel 5.7-rc1 onwards.

If I understand correctly, the newest kernel still works with earlier
OpenSBI than v0.7 or BBL. It seems to me that we need to consider the
use cases if we don't limit it to up to OpenSBI v0.7.

>
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
> >  arch/riscv/kernel/cpu_ops.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/cpu_ops.c b/arch/riscv/kernel/cpu_ops.c
> > index c4c33bf02369..0ec22354018c 100644
> > --- a/arch/riscv/kernel/cpu_ops.c
> > +++ b/arch/riscv/kernel/cpu_ops.c
> > @@ -15,8 +15,8 @@
> >
> >  const struct cpu_operations *cpu_ops[NR_CPUS] __ro_after_init;
> >
> > -void *__cpu_up_stack_pointer[NR_CPUS];
> > -void *__cpu_up_task_pointer[NR_CPUS];
> > +void *__cpu_up_stack_pointer[NR_CPUS] __section(.data);
> > +void *__cpu_up_task_pointer[NR_CPUS] __section(.data);
> >
> >  extern const struct cpu_operations cpu_ops_sbi;
> >  extern const struct cpu_operations cpu_ops_spinwait;
> > --
> > 2.26.1
> >
> >
>
>
> --
> Regards,
> Atish

