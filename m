Return-Path: <SRS0=F/sc=EY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6794C3E8C5
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2020 17:44:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38612247E7
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2020 17:44:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G1tmEG1A";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1kcpLv7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38612247E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L3f6SaLMAITs2LjYH/fBgoCY9pJpDHiO9WfPB+Ocueo=; b=G1tmEG1Au3BxGKZzUlzyRhoHr
	+TtbYmIRT2H1FdNmDQkJ06/I9d8m1zWrJfskQh6/8V0xVA3cnMpqVabe3grQlexI1WDf4XtFQUIaN
	XQy/WHSp+pObjKi3yo7xXQNDGe5a5bRdZWUDAyRJOREcAeVMpvgLqUUPi/tmM3K5duIgKl68PC9lO
	hdigndCmX6wWk1uiq5vhlSHda7dwT4dYQDN95l0XZR362ishYEiJxCV4DBrK22lyLn17Xx60SHHB7
	J99VnhjcRq1VVcXAFga3lOy4WezF0GCYXJh85Gp4VJdkaRrcC/AZmfjCgZImfQxBzGAj1A1NT/mOY
	HC6T2l+DQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfRUo-0004zA-Kj; Wed, 18 Nov 2020 17:43:54 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfRUm-0004yP-CR
 for linux-riscv@lists.infradead.org; Wed, 18 Nov 2020 17:43:53 +0000
Received: by mail-wm1-x342.google.com with SMTP id a65so3517924wme.1
 for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2020 09:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mVeJqHG2em0yWD8MsCr0uHPVXUTlFKiETQWelNfSKrI=;
 b=J1kcpLv79McSIBrQFrtid7jFBA8H6I3dXaJbjBTK1pOEsvMgSTuyySUmui2kgYrA3K
 hrhGzuSy/MAUMZZyfnDRgbpUY9X2xdBcQOdm/EjRI8z2oVNY7t49Fl8wo9B0JpJZ9swt
 ZrD5XgUx61QXpfATypZ5g9Lej7X94agb2zdtHrw2m9a9bsGWyfUP7E6w+y7ktqIA88Xy
 QSoLwrsesrEDPa6ItXsdOo5s0LW0jL+5uh2CqOD4iD4qWK530J+OsHc/xdHkmZH8+MDB
 EDUok/35PMvIxZh6TXB34NJsC0DpD6hwCHwqwSxNDt9/EtqM46mtD/NmQFA0X2qzucTO
 ZgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mVeJqHG2em0yWD8MsCr0uHPVXUTlFKiETQWelNfSKrI=;
 b=fadS0Rzjx1be/eq89gtL5e054qgwaY5BwgeVAZFeOXhfQJnK3zKQODE5JOYWsWGlQE
 me2lCYHReqDnRPQqhBmlytPtfKCS7WKHaaVGAm0Z1zcfeGSUtqq1uzRzHW2cycDcYgOz
 EQ32f7bv8Y7FcF81yRLdriMLULDA2EmerkDI6NV6SoBEpjNPv4Z/GXfZtfBZbqSxzqg5
 5BBmI5AdnsN6r7lilKJ8RLZ+eqOzihljSJZm4bspMrX2baKnT5U6ZF55molM5FCd0Iww
 E/M0zdm2SAEbMNTjYVJhWgTfMUyb1zlcsSSuT/3b4cof0Zz44WgudE5RjI9yYlyEEqK3
 OAqg==
X-Gm-Message-State: AOAM530lg+5tBUQF3epQO3Dp3rdh89+UwSm6xYLwMNcFQSBwGKnMqd6i
 YtmMO6xn+Ck9Md/Fjizl2dXArFnxrh2nNQBiOWc=
X-Google-Smtp-Source: ABdhPJyMPVwnX2jPHnJtHnaYqJDj1A0VkhVOf1AhgZKW784eyuSL8j3XC8Nd3AdMABRqC4JZ78Xs3fNXOVrIl4M8I80=
X-Received: by 2002:a7b:c77a:: with SMTP id x26mr214035wmk.63.1605721430045;
 Wed, 18 Nov 2020 09:43:50 -0800 (PST)
MIME-Version: 1.0
References: <20201118071640.83773-1-bjorn.topel@gmail.com>
In-Reply-To: <20201118071640.83773-1-bjorn.topel@gmail.com>
From: Luke Nelson <luke.r.nels@gmail.com>
Date: Wed, 18 Nov 2020 09:43:38 -0800
Message-ID: <CAB-e3NTv1in=QTfaRsA-J8rtLNmoEso8XZ3q_mx9ZBhAUyXkxg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 0/3] RISC-V selftest/bpf fixes
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_124352_446730_FA6E1828 
X-CRM114-Status: UNSURE (   4.70  )
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
Cc: Daniel Borkmann <daniel@iogearbox.net>, Networking <netdev@vger.kernel.org>,
 Alexei Starovoitov <ast@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, andrii.nakryiko@gmail.com,
 bpf <bpf@vger.kernel.org>, Xi Wang <xi.wang@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Nice, thanks for the fixes!

(For the whole series:)
Acked-by: Luke Nelson <luke.r.nels@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
