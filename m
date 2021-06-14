Return-Path: <SRS0=CnAn=LI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6225CC4743C
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 13:34:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 279EC6128C
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 13:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 279EC6128C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bh1bPGDXP8oYpm2UDIzDLUEBFCCW6JC6Jll3IngFjHE=; b=LN3CCCc4BA/BYN
	YLIqBHWZw71uefZhzi3aYhXdJqbDHNLIL/iJYDfl+W+GdVS09yWdaUbHRvnya7S5goaPhO2cDzAOg
	Q7TjkLEZkntsqXsK1UJweIxMFCl0v4HOYgvnvnkqxta3orrITYQiek+yb7/+NHjoiCDQqsu468yl7
	LNWSGxczelmaB0a3kw9+80TRYEo2v+5KEMGM6hlAiLt8OnKiEKTWRyKz78G+2O+gZd7CHKt82xJjK
	g2R7Ud4ppQZtah6DfBEETNafpac7KyY6hfzmPs1QYvtVBEjiFVGisCdwT7fxguYG0iGqnOQm50bDv
	EqetDVYTRTn0cjnczzyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsmjB-00EHwY-Kh; Mon, 14 Jun 2021 13:34:09 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsmj9-00EHvA-62
 for linux-riscv@lists.infradead.org; Mon, 14 Jun 2021 13:34:08 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id q21so15434672ybg.8
 for <linux-riscv@lists.infradead.org>; Mon, 14 Jun 2021 06:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fITfy3FoCscSzBKzsabed+L5goCIl2g/5fdsym0oiY4=;
 b=MhW8P6lVLC6p+sZK1oYqz6bb8+6FLaELyTFUYsF4bjZU3eQnYpCiMlhCpAcG8NRRcy
 CZcIifOsGderqM9MYJO1yxZJTQcfy43sC79EhFugkaZPxm8pUKeb3/mraNpqR7CirnbI
 GiOB0sP6df12h8M3WAxu+z4SanqoLAEQktHeaTXLuYkMwYO85pgchisFIO8Hbtz1SbGc
 fIg4jL7F7D6FwQiqYMPVvflIY7GnDapBpUQiWp8Pj1b6/2JGAtk2LcqvYXsSkxhsi+m8
 coz0jPd83rTTwims4dlptk1iUHWQwFeM7L+Xo3iwxw9WDFzsLmeKyw/mL6DjDxpEc6f1
 tF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fITfy3FoCscSzBKzsabed+L5goCIl2g/5fdsym0oiY4=;
 b=HOvcyl+t1dcb1gTNUv64OhxU1la1UpVub6mr2gOPeExxeSILfLVWmSCdvW4zC5YHOF
 lQsGJDUteE+Ck3FE9jVOLK/drj2xKSj4WleGwgpn0Z5JFnVYpCrmhja7ltRCifbkb10z
 feuHOwcCviVc1JqpJyrLBZ9Oe8hoDU4Bp2TqFB5+PffHMKa/jcL2vf0i4D7/6Gn90G65
 MAEomY+7C+6lm+m8bzXF0IX01JdVnCkwiETX67BTrzADj1kClRkl+fXnSPamxxez7kZt
 SpHo7BmakOQP9ZsiFN/s0l+DP1B1RIekp6HwD7HbLDXOW7d5xfWO6c4gep2PeZueuFrh
 uq6Q==
X-Gm-Message-State: AOAM533qdsmMLrVe0PLI37jwyeg1Z3dj+7/+IFakauwMSwcFvrLAl6p6
 XfmDcsgPmtJ9Nxw9TWNhH4UZhiXqa+NUe0o2QKU=
X-Google-Smtp-Source: ABdhPJzylP/+U5d/VxskGMW//vGfCikjF9dkGLIxiDlPbjg6s6SPPEZY32Gk5rbGsiS4HIDDCDXM9d+uuBvguiVMSX0=
X-Received: by 2002:a25:be09:: with SMTP id h9mr25605058ybk.239.1623677646410; 
 Mon, 14 Jun 2021 06:34:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210612160422.330705-1-anup.patel@wdc.com>
 <20210612160422.330705-2-anup.patel@wdc.com>
In-Reply-To: <20210612160422.330705-2-anup.patel@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 14 Jun 2021 21:33:53 +0800
Message-ID: <CAEUhbmXhDZExHpZwVUEW-xz2nq_j5SXev4pZBhG4qAtPr2riCA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 01/10] RISC-V: Clear SIP bit only when using SBI
 IPI operations
To: Anup Patel <anup.patel@wdc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Atish Patra <atish.patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_063407_280469_4B089B7B 
X-CRM114-Status: GOOD (  10.77  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Jun 13, 2021 at 12:07 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> The software interrupt pending (i.e. [M|S]SIP) bit is writeable for
> S-mode but readonly for M-mode so we clear this bit only when using

nits: read-only

> SBI IPI operations.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/kernel/sbi.c | 8 +++++++-
>  arch/riscv/kernel/smp.c | 2 --
>  2 files changed, 7 insertions(+), 3 deletions(-)
>

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
