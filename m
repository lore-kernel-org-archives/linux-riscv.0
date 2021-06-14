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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2799AC4743C
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 13:35:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E17EC61153
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 13:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E17EC61153
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V2dlGvshF4CzLEakLH126tmUydwQzJ1+ka/ClZ6n+Pk=; b=nWvpzTaZPpvXhe
	akzbTAcPOS6kgjhVs48O5Jx7wlKurV7SNfR6gyut91X6i5zZEAgvfkvG2IHMZ7dFvEXGpcrpkBBuM
	PexgBc6lLe7G5rvgymEN2nZPPRctJrfZfIjMwh29YN1rxefFJU2DisSgmAFt3h+tdunzC1gp/h3BP
	KkeDbeWF/zxDlf0h3pvAWj2OhD8wJTqoD2xOsI6k4Xw6Glu21WOu08VJRDM4gaVctwO7w7QHjHRux
	eSo7ms8unO/HSX+YexrpximIlnSrS4f7141ZoUAJJVBYzwE9ugsLqDIYfgl19KfWySgcCFalzvNWu
	fFsxQ3I+VgK8GQze/BhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsmkF-00EIQb-K5; Mon, 14 Jun 2021 13:35:15 +0000
Received: from mail-yb1-f173.google.com ([209.85.219.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsmkA-00EIOO-SU
 for linux-riscv@lists.infradead.org; Mon, 14 Jun 2021 13:35:12 +0000
Received: by mail-yb1-f173.google.com with SMTP id m9so15475257ybo.5
 for <linux-riscv@lists.infradead.org>; Mon, 14 Jun 2021 06:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U+SdEsE9+NsUTLittnWGiiMKDOH2BJaHKTxZALGDAWI=;
 b=odDKde/DM6oE49cy3R0RkXQ2Tts09TwaXlTAmv7uXRYwG5gYpH/g9yJ5rRkAsvqA8T
 xX6ciaKwcMQrgy2tZfpjoKSf2tVn+qaFLus4OQzg+hy5GhChOJ+Yq6qPjg3lgm2woGrL
 z9akMmOKCGPSTTM93SBkVMT/EG1jfScimZWgshFW+V580ZYtrG9zaOKy/5V/8qGn++sp
 4umb3xpP+Mq7sdnGVNXEATUAQsL2dyBIN30KN2pdZLkQ1o924eeIYYc+kD6UL3Yuh0Js
 Zcg1Q51H6hSqfOPqXyqfBy3gigJvPWJE/tP4C1SPCwyUACQVzjjx75Ura+bvWmu6wRXY
 VQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U+SdEsE9+NsUTLittnWGiiMKDOH2BJaHKTxZALGDAWI=;
 b=TCBPrYoI5dfnnZfigquqCFj/mSh/0WW+s8Y+8B+BX1MLg4NOEN3RFfMDnkLTlCEZsY
 QkmtMHpuD3b8Pn5Gzx4woSKHXiSuDAox2gs0I0RvC7smcmXBp1ghwiRsKjNeWTlVZyad
 XtrHZ1Jqc5/3cDT2cGd53yZGrqbL+Ae8aplq51EraA+T9EvpLJAeMD/aUNjbY4P0WDmS
 /4tcPk3vjPQN89Ep470jSPw79mHuCSzf67p1nlskZsbxcwk2BCYfBdH+VzMrXBr3eazv
 VS9ZxaGS0ZUzC7IvVM0xy/5GTIRlEyv4IGYPrly2vp3E9iCWGjQ+tG5DQy+vrVbaNvDO
 Nvcg==
X-Gm-Message-State: AOAM531c9CJeV9x8bGDVmuLW4u5rL4f5ncfI83B3cXCa9BgsfVqN6ffW
 wCVnQUMulpFBb9it3bDlrBP2QuaE8Vv+PwASk5k=
X-Google-Smtp-Source: ABdhPJxOuvrD1lbWJO5WRvUKJRABbIIp7EzJ3EsdDZZFObuYxZUwyekjwK6Kgbos33FF8PzqvrZgeDv6CuYhmYlJFzs=
X-Received: by 2002:a25:c016:: with SMTP id c22mr26522386ybf.387.1623677649546; 
 Mon, 14 Jun 2021 06:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210612160422.330705-1-anup.patel@wdc.com>
 <20210612160422.330705-3-anup.patel@wdc.com>
In-Reply-To: <20210612160422.330705-3-anup.patel@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 14 Jun 2021 21:33:57 +0800
Message-ID: <CAEUhbmWPUcjXtXveOrYWzfSBq34SO34eM6Fb8HDeT0hfHA2SwA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 02/10] RISC-V: Use common print prefix in smp.c
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
X-CRM114-CacheID: sfid-20210614_063510_949808_9FF6A610 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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

On Sun, Jun 13, 2021 at 12:06 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> We add "#define pr_fmt()" in smp.c to use "riscv:" as common
> print prefix for all pr_xyz() statements in this file.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/kernel/smp.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
