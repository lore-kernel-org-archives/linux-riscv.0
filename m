Return-Path: <SRS0=1yfy=AP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46FE8C433DF
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Jul 2020 18:31:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14E6020724
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Jul 2020 18:31:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vg1J1AiQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JtMO7CWw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14E6020724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=omaY2ayDrYpUs6vNUGkKOiC1/JzjP3G2WaThQZB2Ea4=; b=Vg1J1AiQGl5UP8YUIAR5hkjNS
	6RzrjhdYovbZlAWUpwcB8hj4DydraTuwUdHf/Hzzj76vbszgyoOUZRNpdYlchpPuT6mqDHc4Br7+W
	fPi9WRe1uBv9NHBROn1y6azajn4CVCORCfCxwE0TV0TCz+L5dCpjrtPkiwoUJwwUbGDMa8y79Pg7H
	CpMyHZ7kc5ev5dYTX5kFPExsUNsAQjAmDUl/ZlxGejppxjrJewDk9i0sS1ZgiYaXTOYftjOKsqQAr
	6C185AnUF5dIVl269CisLR2qrNlNx8hN6ZK7UfT5v9Cb8ikWXMC0ishM+YsJwinXRwV9oytqrxE3Q
	ArVSIt12A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrmwR-0006w6-Jf; Sat, 04 Jul 2020 18:31:11 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrmwP-0006vl-HN
 for linux-riscv@lists.infradead.org; Sat, 04 Jul 2020 18:31:10 +0000
Received: by mail-qt1-x843.google.com with SMTP id 6so853502qtt.0
 for <linux-riscv@lists.infradead.org>; Sat, 04 Jul 2020 11:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UFLUHOIJlWWk7hAI07Y9tp1o5QM5QJCYXSXyL0loMUc=;
 b=JtMO7CWw51DLAx12Q1J7wDQrbMLhCpTUxO44RqG7IexDvBT3q/Ppj/UrQyV4iupDhg
 /55dybi9z2Ip1geGBwWutbj91Ou1gqVieINEmiTZ/bH6CNGiPnZkVompFBiTVtuq11Hq
 V3j3XbYzDoCXX0a1Z45umxZsJ9vTklMXVTauHc7pl28MCAE3L8ZT5oqpWlyl8kH4AqRg
 sY9MO+xVu58iyOk1zqeUZvlJzJ6TWWPwoON8Tj0a+W1xmxpkHPpNjUrMWRiHqWzHkocH
 Al1Zi/WqxVY6u6iAJbzeukTCQR8CoNp8vQHenRjmpMW/lwnowiYeOsefSlWsrpOpiiZH
 ovKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UFLUHOIJlWWk7hAI07Y9tp1o5QM5QJCYXSXyL0loMUc=;
 b=laUvwBB63BodUtEwbkAGt78tb7qjQLoj1ZdBgkO1s8B2DA+7Oo+0jLtLg2QRGfN5RM
 9Xc+Ezh1kUf9Apr4i7ZBYIuzurGCGdm/4XlFgqLpL4ZFkD0TQFGRp4GnfNwN9wHzt9CQ
 cVWVjtc01Xug6zo1ARBI+zgsgQORziF5U0zs4OZRGr3h1E2Nr8s1wxC44PU84XazzDA0
 MfBu35pB7OYPfu7yKPxSnhOxOXh1x1iUOs/tU0vySgJMYOgEYoDcZjPCvh7Ti/k/Kwx9
 I/XGQ6g4fxL9eirJvf5Kg2CwE7CUndv1DM+s0OIjrS4ez8d+iQT0YRewpJOhQNkJs1D/
 pcyA==
X-Gm-Message-State: AOAM531WlU7odR6S2wMLGAJA/SVjio7Um6arArQ5QQAQpGRm+qrpNp2R
 2FDxTwKCg8XNNPzDTZvbD4ubAHRvaLZchHWi5/A=
X-Google-Smtp-Source: ABdhPJwSRtILfOImuh8qk8haIBu/Hxgg+XL6PXWIgOMU1jKJ7Qi5EhbGfS4iXfEMEQwvOgsLA+uDBZjvovcMQpvgIRk=
X-Received: by 2002:ac8:4b5b:: with SMTP id e27mr39335257qts.96.1593887467803; 
 Sat, 04 Jul 2020 11:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <1593833659-26224-1-git-send-email-guoren@kernel.org>
 <CAOJsxLFF4o8AFWzPFJgwaeuA=Lb9VsjMXXfVmbhZBwLPcG=Asg@mail.gmail.com>
 <CAJF2gTSYyj5rTUJW-yDDrrV7T3hUssAhGc0gnCntcQpuixNJzw@mail.gmail.com>
In-Reply-To: <CAJF2gTSYyj5rTUJW-yDDrrV7T3hUssAhGc0gnCntcQpuixNJzw@mail.gmail.com>
From: Pekka Enberg <penberg@gmail.com>
Date: Sat, 4 Jul 2020 21:30:50 +0300
Message-ID: <CAOJsxLFSH2_e03xo_HMqKAzVE+2Y9=hriv-Zu=GdVUHgDMgYtw@mail.gmail.com>
Subject: Re: [PATCH V1 0/5] riscv: Add k/uprobe supported
To: Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200704_143109_635290_0E22033A 
X-CRM114-Status: GOOD (  10.90  )
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
Cc: =?UTF-8?Q?Patrick_St=C3=A4hlin?= <me@packi.ch>,
 Guo Ren <guoren@linux.alibaba.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, bjorn.topel@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Guo,

On Sat, Jul 4, 2020 at 6:34 AM <guoren@kernel.org> wrote:
> > > There is no single step exception in riscv ISA, so utilize ebreak to
> > > simulate. Some pc related instructions couldn't be executed out of line
> > > and some system/fence instructions couldn't be a trace site at all.
> > > So we give out a reject list and simulate list in decode-insn.c.

On Sat, Jul 4, 2020 at 2:40 PM Pekka Enberg <penberg@gmail.com> wrote:
> > Can you elaborate on what you mean by this? Why would you need a
> > single-step facility for kprobes? Is it for executing the instruction
> > that was replaced with a probe breakpoint?

On Sat, Jul 4, 2020 at 5:55 PM Guo Ren <guoren@kernel.org> wrote:
> It's the single-step exception, not single-step facility!

Aah, right, I didn't read the specification carefully enough. Thanks
for taking the time to clarify this!

FWIW, for the whole series:

Reviewed-by: Pekka Enberg <penberg@kernel.org>

- Pekka

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
