Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C70CCA479
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 05:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=j/1cln2Tvk8MR1byxtmFVDrcURnxeWOOyoE31E2oSmI=; b=sEooU7auhtu+sLOWgR5QEi1sLd
	QZqfhkFxB4MaZeGoB/VmHHsNG7HX+l7FQj0GaeMyyyzA9hFf9shrdfdnpQp3WQzf8Ra/PUEwxZ7SN
	IEJWx6fn7zfCQt1vI0QP0lls68xcQnyM6tT/smCxGgcjp8Q+oLUVPO8JGx2iJ9UltB3EXs6YBcOW7
	P/f/sfWinLEy0cNvAUomveQD26aTsmdAqX4BcuHYd4nvA/1y3VXvFYPldpq9ad8Tyo6EKp5C77MvA
	Tn/kIJd0NkrqmvyTLQ0xVa7HOeA7FOun8zrI/EVs7vFeJp0oG15lCut1e+KYrMlp2aKn6p3rFSmke
	p+GHqY0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwdqY-001aBu-MD; Thu, 02 Jun 2022 05:58:14 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwdqV-001a9e-Kd
	for linux-riscv@lists.infradead.org; Thu, 02 Jun 2022 05:58:12 +0000
Received: by mail-pl1-x62f.google.com with SMTP id c2so3685700plh.2
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jun 2022 22:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=wPBDv8Xucc9F0KVOT9xu9iIByq/KGBHHhKQJwLqoVzg=;
        b=7QtUdqwtlxbxKjdEeEOqac39coDUMufeS3DRibw4LOSr5kIRLNnFCJEloUjDmkQEGf
         gQKGkV+trBHjvPm594tJbQM/K1aT2M+Ay1xigvc4ialetNXUgNauPjoxBpJyVu9zSrD/
         akF9IyP8z1fLNWfc5onE9XZLGF8/jRLd92kqvP8uBpsnTf8dtyXxQMiP8os9dcKgDeDg
         F3DKSsd4r+Jx5okQUnsR2D8wxpYnbap+W473Dr5YU1F7e9IZafHS5vNaxGe1gd3Boa6S
         AVhm87U4bBwma9fNSGMuTNJVgmsanr9LOSMcqoblhu+oHCWWjavQoqIQmK7nIqoufjHf
         d/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=wPBDv8Xucc9F0KVOT9xu9iIByq/KGBHHhKQJwLqoVzg=;
        b=MC9Z0D7Na/U14afhUEKYFUCKJfQasEQcav1opYH60ToFuFplx3CA4lyxZB9coWa5Mt
         b4FhcQDxWvLnDhwKGyjQsrofVXBE5InKV/voDJmLCSQqFWQy/5lCkNEsDHtMTazkIrnr
         VaR0qxQSQKzXBKPMaNmuowOnWD2QTYImIdVvWaHLMVHN1oqFO7y2fKnTcdFHWL/qYFBF
         5ZsXb/+awwxM502uahf63xnHSNwn00kVl079nkAeRloVuMAG2BzVyYw9LPvVjIIl2GVL
         sKbFr6GK9I724WME2wRY9C7eAm7g0WqKfijlYK4h5gQb5W7EqqMJ3TBDz1EoL7Q8yl5h
         v+5Q==
X-Gm-Message-State: AOAM533YOxl0W4WzQos03XcNdrF5X+kV+wFM3WvhepRZyiHNpsXhEnJ8
	wz+TmkTC6o4c/XhHdM2nL6yCdFvrAGq5XA==
X-Google-Smtp-Source: ABdhPJwZewGk6VykwRej+NNAIC7c5baAbdYBoLRnT9XM+o4+CPHY2Sk+7sPmGe8CcP047xSNHfmDvw==
X-Received: by 2002:a17:902:d5cb:b0:161:6a34:37ac with SMTP id g11-20020a170902d5cb00b001616a3437acmr3170973plh.83.1654149488679;
        Wed, 01 Jun 2022 22:58:08 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id h69-20020a628348000000b0050dc7628138sm2621272pfe.18.2022.06.01.22.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 22:58:08 -0700 (PDT)
Date: Wed, 01 Jun 2022 22:58:08 -0700 (PDT)
X-Google-Original-Date: Wed, 01 Jun 2022 22:58:06 PDT (-0700)
Subject: Re: [PATCH v2  0/3] Miscellaneous fixes for PMU driver
In-Reply-To: <20220513015522.910856-1-atishp@rivosinc.com>
CC: linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>,
  atishp@atishpatra.org, anup@brainfault.org, jszhang@kernel.org, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, robh+dt@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <atishp@rivosinc.com>, Will Deacon <will@kernel.org>,
  mark.rutland@arm.com
Message-ID: <mhng-ba83da39-dadf-4d6e-99be-a1b5fdf9b62c@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_225811_713058_FFB51AA1 
X-CRM114-Status: GOOD (  14.41  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 12 May 2022 18:55:19 PDT (-0700), Atish Patra wrote:
> This series fixes issues PMU driver code.
> PATCH 1 & 3 are fixes for rv32 while PATCH 2 fixes a redundant
> user page update issue during counter start.
>
> Changes from v1->v2:
> 1. Add proper compile time rv32 checks.
>
> Atish Patra (3):
> RISC-V: Fix counter restart during overflow for RV32
> RISC-V: Update user page mapping only once during start
> RISC-V: Fix SBI PMU calls for RV32
>
> drivers/perf/riscv_pmu.c     |  1 -
> drivers/perf/riscv_pmu_sbi.c | 16 ++++++++++++++++
> 2 files changed, 16 insertions(+), 1 deletion(-)

+Will and Mark.

Will recently took some stuff for drivers/perf/riscv_* into his 
for-next/perf tree (which I didn't even know about until then, oops), 
but the previous stuff I took through the RISC-V tree.  Always happy to 
get stuff out of my tree, just LMK what you want me to do here.

I did some minor cleanups to the commit text and put them over at 
palmer/riscv-pmu_fixes, it's all passing my tests.  These generally look 
fine to me and they're all stable backports, so no big rush on the merge 
window (which I still have stuff for).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
