Return-Path: <SRS0=2RK3=K4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394CCC47083
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jun 2021 15:08:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA99961182
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jun 2021 15:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA99961182
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3rf0/k6wcw2ABrv07MTX1yJ617+er0z+J4aXgMmuMqM=; b=ItFAVoPgCb1yBU
	ORcF1OlOWzhCa7F4FBY+Vh/ZbhsQ7syplZUNNF+ggYfD7S6Ax9YCGafN+xL7yYh/vBw0djnQZzToP
	uoOoSVs7az9kVu5zXCAEpeIh4tsz+nTteZo79Cq1RAhHn/zSCGGaejiwVKXFS0vf5H0CAhDssQ10r
	ixGzw+q+jgCL1WrBKE73NcuI0zfRFGM0HfsyI5KZSfAJ7W+LE84MikHa6ztJIzvRewHyshgRrGfUm
	/z2jPBh+g+5i5J9gDG4/UAhPVFsLaJkpRXszQqjFNqQ/1TUOyvidKNV/7HZ3D270N0CDjCu+THkEA
	K5f6M59tVBH2wcoXGCTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loSTg-004lgS-BJ; Wed, 02 Jun 2021 15:08:16 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loSTd-004lfO-7W
 for linux-riscv@lists.infradead.org; Wed, 02 Jun 2021 15:08:14 +0000
Received: by mail-wr1-f48.google.com with SMTP id q5so2682164wrm.1
 for <linux-riscv@lists.infradead.org>; Wed, 02 Jun 2021 08:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vs3Wh4eIvni5P/DPP9QB7KFgHPP2DPvUYXX2oG5ziD8=;
 b=Jv8riBA6hdAzuqqKPOkSJ02ahdlNA9yVktgdWbigMUOdm6bpxDApG6IxbmI1fsDrV0
 od+qctz8WdJpLMlg/dh65H26zKlKq18C9r5Id/gmGsm86frMckOC7EoWbt0ijn0eL0JF
 V2eoz1XbjOwarwofM8JZQSrsAfYcO3xSQaU0PbsEdI7qs5udvqBh0EPPIt9kv0811yzh
 Y1ACLtstrLSq5QF+c1a7+IJpO2MbffII4oH2s6027S/4EDlqAHuOV2aC7HPIfRM+H8i3
 rqVEckU/2Srs13LwwfmSQVfXeu/H9S/Z6a100JTKutK+gu0RXflckQNcpZ0l/fPiK0Hv
 oNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vs3Wh4eIvni5P/DPP9QB7KFgHPP2DPvUYXX2oG5ziD8=;
 b=n9GnCHAqPnWv9L6CSpxAstcbOJQXMCICMgLwJJRGaaZEqD0UVNPbkT/dydUaYRuHQT
 YLk4zcybQXSa1ARQEamieLIEq3RVPjcNsJp/WFRIFK16c/QirzeCiBt3YbBixs5AvIro
 0ghe6/PRPkVNJ0mrp2vqF0ceG4mcTTnT9NG5ocOA28yppMFDZAuf3hTPRKsOspmiXEG/
 xxTpVAhwLEnjXk0rU+nqr6gDkWiFLF7hUwSPDGRfzbIjEprAD/bUuxE7qG/fKtQIYH7I
 VtgR63lTMs111peHXUsZW68Y60Xi8kFl2wyW+Rq1XPX4kyzJETBtCz+WaBm1LV5sRvCh
 pgTg==
X-Gm-Message-State: AOAM530+6LqGG7RPLLaOgKFu+acgsg38zGOp84An85NI9b1fKXFHdyEI
 mQixIQrHhyRuxg9dWQ4A2AsSgWktmXLA1Wyj59Nzaw==
X-Google-Smtp-Source: ABdhPJwg13/gEhL01WTUQpFs1K3FGrC8NR1Evds3qUYUCeEJOMNXDkC3cHVMY2cPzMBS6YuglZja7OitSEjs3ENc/Bs=
X-Received: by 2002:a5d:58f6:: with SMTP id f22mr21961347wrd.128.1622646431784; 
 Wed, 02 Jun 2021 08:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210602112321.2241566-1-anup.patel@wdc.com>
 <20210602112321.2241566-6-anup.patel@wdc.com>
 <CAPDyKFq2tvvAD=2RiePZzce=+OsDaxLWqz+90pTKjTTzqVqcHQ@mail.gmail.com>
In-Reply-To: <CAPDyKFq2tvvAD=2RiePZzce=+OsDaxLWqz+90pTKjTTzqVqcHQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 2 Jun 2021 20:36:59 +0530
Message-ID: <CAAhSdy0jN1urNFu_mqqg2jbqzsfztQUJN62oB9dhDTH=RgLR-g@mail.gmail.com>
Subject: Re: [PATCH v5 5/8] cpuidle: Factor-out power domain related code from
 PSCI domain driver
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>, 
 Sandeep Tripathy <milun.tripathy@gmail.com>, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Liush <liush@allwinnertech.com>, 
 DTML <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_080813_284875_6363D85F 
X-CRM114-Status: GOOD (  17.92  )
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

On Wed, Jun 2, 2021 at 6:47 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Wed, 2 Jun 2021 at 13:24, Anup Patel <anup.patel@wdc.com> wrote:
> >
> > The generic power domain related code in PSCI domain driver is largely
> > independent of PSCI and can be shared with RISC-V SBI domain driver
> > hence we factor-out this code into dt_idle_genpd.c and dt_idle_genpd.h.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
>
> A small nitpick below.
>
> [...]
>
> > +EXPORT_SYMBOL_GPL(dt_idle_pd_free);
>
> Do we really need to export this symbol? Looks like there are only
> built-in cpuidle drivers that are going to use it. At least for now.
>
> As a matter of fact, the same comment applies to all cases of
> EXPORT_SYMBOL_GPL from $subject patch. Can we drop all of them?

I had kept the EXPORT_SYMBOL_GPL() to be in-sync with the
dt_idle_states.c but in this case I agree we don't need to export.

I will drop all EXPORT_SYMBOL_GPL() in the next patch revision.

Regards,
Anup

>
> [...]
>
> Kind regards
> Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
