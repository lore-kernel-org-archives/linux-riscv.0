Return-Path: <SRS0=gb7b=AR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A43EC433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 01:20:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E169620715
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 01:20:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bgl2C2/x";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G6q7Jud7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E169620715
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nBRD8VbVbJg48KY/42pApu2SoPDgtAh8upGuFj/xAIo=; b=Bgl2C2/xB79c3tafbhiDhhPgd
	au3+Vq/k3oMmHYrxZ/xpZq8ODqKIOIALx5fpJkHqXuk/0EYo3CcBWp5Vl4m3klkHOjA/kRhqDdUA9
	VB8Tj91aQ2NVLUkoDivmM02GegeShO2JP9hbggBQ0kwV0VaJ0Z2z+zbRdlZpVCWbXQRbLoMHvD/Xw
	v7HG4wK236cT+PyYClZtYjnmqHr+65nOPRU3uoJaBonBYcO9ZspIwUZdp9uwNiAMmom2glSrezqpW
	RqLKwuwenIrnuYFXQqhpJvZuF1OWgMLcDWhbB3cLdKeYHr+1/1TZKz+a3Kx7A47eEeLmrvLQbbRvC
	5pWSoxHXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsFng-0001Ty-O9; Mon, 06 Jul 2020 01:20:04 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsFnd-0001TB-RN
 for linux-riscv@lists.infradead.org; Mon, 06 Jul 2020 01:20:02 +0000
Received: by mail-pl1-x643.google.com with SMTP id x9so1024184plr.2
 for <linux-riscv@lists.infradead.org>; Sun, 05 Jul 2020 18:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hsValw4wLMzxskO9JAsxS8IlkvauPBZYj9ebYBYapKQ=;
 b=G6q7Jud7BYrDbF5YMMzI6atIeRmAy2r3a0Dk7TutymmDTzE5dI+ipZeZ+nNejcqFhr
 Gu0K42r8orIAVelK0CNQZTVlYc52Ivv0Rh3txYaPkTxO238GeJGlQLQjw65xP3zPLCnd
 d1u99CnvcHMKV/razA5QrnIucnkvaXQKMLB/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hsValw4wLMzxskO9JAsxS8IlkvauPBZYj9ebYBYapKQ=;
 b=DbP9ghngV2K9oNsHHNQb0CwomNRyDWgUY9odbpJVPGLd5xuojAY6TyF7sqhnu1wySC
 lwxE3dvi5pUCpdcYxHpuLEtmHdso1SHD4H6JLjAq1Twmc3OnaX1I9AegOT1Ol6NqN+EC
 Qj6mfdXtNOg7TpezOF8NfnajFdX7GpHpOWiPFEAER4Ja4iGKWVWv2PPxss/0GjFUywyh
 cWhxIo91Udzq5SkpajiOgPu/Xe1yem0QJubanKI8He4D7SxN2CCWH7kisrUKxWWyBRN6
 sTm7Btsbu5mzQYaBEjAfFB52n2MtFkP8Cusdm5IXcgMYSpcThwDEdhmH9ym9OvxGYGtN
 pgig==
X-Gm-Message-State: AOAM531pLQeoWITmC6a/yIjqTelsGM497pJR97qq4WYZpW/YclNGYiHE
 hI5rdWALygzahS5mJtuK6qOlsg==
X-Google-Smtp-Source: ABdhPJyRQMl8X2jOh3kV2RfeE5+zaKw6r/y3dmR0L3SXZayvtA4SqleWN0dDJU/g4lAJNhGdolwYwQ==
X-Received: by 2002:a17:902:9346:: with SMTP id
 g6mr35985832plp.77.1593998397876; 
 Sun, 05 Jul 2020 18:19:57 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id t137sm17967077pgc.32.2020.07.05.18.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 18:19:57 -0700 (PDT)
Date: Sun, 5 Jul 2020 18:19:56 -0700
From: Kees Cook <keescook@chromium.org>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH] riscv: Add STACKPROTECTOR supported
Message-ID: <202007051819.0ECAD4E6@keescook>
References: <1593930255-12378-1-git-send-email-guoren@kernel.org>
 <202007042350.4C153C4F8@keescook>
 <CAJF2gTQFqH7GMvRgmtb=hBwvUy6NZyM8xLqOsUTvnYhO48tQbg@mail.gmail.com>
 <202007051328.FE9EF99@keescook>
 <CAJF2gTTCEEoP3a9i_REXPwkJZ4Si_hYfjk_hwqHxkyfgw_xBLw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTTCEEoP3a9i_REXPwkJZ4Si_hYfjk_hwqHxkyfgw_xBLw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_212001_927693_231C0582 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
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
Cc: Guo Ren <guoren@linux.alibaba.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Masami Hiramatsu <mhiramat@kernel.org>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Greentime Hu <green.hu@gmail.com>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jul 06, 2020 at 08:55:35AM +0800, Guo Ren wrote:
> On Mon, Jul 6, 2020 at 4:31 AM Kees Cook <keescook@chromium.org> wrote:
> > Sure -- I assume get_cycles64() is architecturally "simple"? (i.e. it
> > doesn't require that the entire time-keeping subsystem has started?)
> Yes, it's just a csr read. But it's necessary? get_random_bytes should enough.

Well, that depends on how early _all_ riscv platforms are able to
initialize their random pool correctly. I'd include a csr mix.

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
