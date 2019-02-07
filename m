Return-Path: <SRS0=gGBx=QO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60450C282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Feb 2019 08:25:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27C572175B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Feb 2019 08:25:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UL4ElPq2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="CeQbYfBk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27C572175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w1fvyHy/30cHrXtbuHlp0UOWMkZXFpV/RehU3BNzCtc=; b=UL4ElPq2DhJlBG
	iKbp4pmseMhNYnSIlK0vrlFLGMY0oUMEIr1puWvTPoD1MnP3TikwfuoO0gxXO3QYJhSZWIq+B9OFv
	5aqEVgS2wAYfor/0xXRJviIv1pZoB225YKK+VHA5yeRYt9frsv+/0bG5ouGHQCcBDKp5GHDujQ9KS
	wN1/HhQt4s/c/jF/hpxYAhmpVN0k6qWGM+DRpqcY4OAYqI9x6GNVEdIQwNpVkdAINwTwY8CmKJJr1
	cjKcKdeuatybUEaXJcmhaXgxREPFoyjcE9YjumSxqmIGhb7v/D/p53zYXjSYSFi46ONPRsMkwwYdS
	7d8zNvhs87+FZ4QvGV4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grezo-0001AK-IF; Thu, 07 Feb 2019 08:25:20 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grezl-0001A0-S9
 for linux-riscv@lists.infradead.org; Thu, 07 Feb 2019 08:25:19 +0000
Received: by mail-lj1-x241.google.com with SMTP id k19-v6so8474540lji.11
 for <linux-riscv@lists.infradead.org>; Thu, 07 Feb 2019 00:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e6/lKpV3+v9G3+Mh9w0wiZ4j0lKH+/UyTxJvhAJZxco=;
 b=CeQbYfBkEdTpeHwvLnu/o/B+0iu39vicAT+3YrDdjbbM0jxDQtfS91yZaYfCR2eeek
 qsWcOLRanfeH0NyUxRnj8WkXP9H89fDDKuolKagQf4q0PoSDpvo6LgoErQAMI3YnB9Lx
 dWtBtzSeDls8PWbF5OtvVm0WpABvGByb334VjRPffJly7xkmi1XXImB85uNJoj6mPCBW
 36ZeljiOf84Nea2Vus7D0vSfKY2+1f/lYv4/5WnIUHEMee213TK3tr83qqWijihO36zn
 1OyDc7v9y7HASRHySD62YPbldK6W3w7469O8QcrloETVUTONzrkB6kUErA8ikNU9Ak8H
 0CdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e6/lKpV3+v9G3+Mh9w0wiZ4j0lKH+/UyTxJvhAJZxco=;
 b=Ia558D5kXkm8tJ32NdyWWx8Rmx1zE8Xp6blg+p8ixIXQ0sMhVYlqvf0lPb9wD/JJiT
 z7DJB/nUKkf/l6xTFNu29465EE20dUKlvczGozOmPIJm/gXe5cn8uU5y2IRIGRQsm1gf
 iLNMIQpJgvol1QVdRUT7nkkC7yKhK1T9+BCo14hl2/pV3WwlHhO2RsvgUZrMw7djPc7h
 om2hAn9ALLmRSuxYka42US2eM/wM8ryHVYBxIDYV0qtoBnnKXcik9okLx9Ujdfw3w2Jl
 5H3WzzD1jFOkOiWJMQkk77Md0feBqLbapMEJBFvfRoSerhKVmu1dkXnp6PviPbrIFn9G
 9ORw==
X-Gm-Message-State: AHQUAuZACPUyPyjwfmWe0+2RFGsA7YXvWMhS9oc7bBUcd56U/ZZUT7Vk
 QnyJuGMWAdIyk54WyGgTiUDcE/JIkGj2hkffii7W3w==
X-Google-Smtp-Source: AHgI3IYNIugm2w6XQs5O6e+b5Dm0yGoHgbOdBoGr3YuszTCQKBeElQMDWPOP/s+MIvq2R5cZSWeHHQo4cMk1LD1t6d0=
X-Received: by 2002:a2e:9d17:: with SMTP id
 t23-v6mr9069175lji.57.1549527914653; 
 Thu, 07 Feb 2019 00:25:14 -0800 (PST)
MIME-Version: 1.0
References: <1548762199-7065-1-git-send-email-yash.shah@sifive.com>
 <1548762199-7065-3-git-send-email-yash.shah@sifive.com>
 <20190206124442.GG21676@ulmo>
In-Reply-To: <20190206124442.GG21676@ulmo>
From: Yash Shah <yash.shah@sifive.com>
Date: Thu, 7 Feb 2019 13:54:37 +0530
Message-ID: <CAJ2_jOFsyRR8tLpS6C_h1mkWh6WJjN6qFgDoSqKJGjhBieM3NQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] pwm: sifive: Add a driver for SiFive SoC PWM
To: Thierry Reding <thierry.reding@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_002517_978181_C79EA150 
X-CRM114-Status: UNSURE (   9.81  )
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
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Sachin Ghadi <sachin.ghadi@sifive.com>, robh+dt@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 6, 2019 at 6:14 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Tue, Jan 29, 2019 at 05:13:19PM +0530, Yash Shah wrote:
> [...]
> > diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
> [...]
> > +static void pwm_sifive_update_clock(struct pwm_sifive_ddata *pwm,
> > +                                 unsigned long rate)
> > +{
> > +     /* (1 << (16+scale)) * 10^9/rate = real_period */
> > +     unsigned long scale_pow =
> > +                     (pwm->approx_period * (u64)rate) / NSEC_PER_SEC;
>
> I think you need another div64_ul() for this one to fix the linker error
> that the 0-day builder was pointing out.

Yes, will fix this. Thanks for pointing it out.

>
> Thierry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
