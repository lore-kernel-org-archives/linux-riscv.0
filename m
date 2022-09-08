Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEB7C6FA82
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 23:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=PPyyKKYFEBOJESji1SBLCoTsl6aYGBbscag81g+YYco=; b=CYpRj6NplaTSymWYNT2SdJ7Qoe
	t1dbIs5+0uB5fqQD4WKeo8GWRXEuNbmWqJMc0MB7qEYuAawfVMecwTZncueQ6BcIB088G2Oppr4R2
	B1BbrpM64CAmdpNcEXKhbRL2qm44pRtfv9S4TCzzFolhp1Ch23iYnMQjTw8TxNDdN+YOr0Gyk/e5Q
	Br8dWqh7LxLjsCpsjKDWUXQAlKmvY9kNc3+GP3qo8zmfK0eSEKB3E6qvUFjym/fEbuS7FmMwVm9P8
	BYSLmyq+3LlpQl+MC4EP6CmLkedNz+ZxxcTaO2ZV3oXVN5NHaeUQPkuIbCSTHAi+YRhswI6K7GFLR
	/puxG0xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWQjG-009jnl-AU; Thu, 08 Sep 2022 23:14:38 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWQjD-009jlq-1C
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 23:14:36 +0000
Received: by mail-pf1-x42a.google.com with SMTP id u132so1112725pfc.6
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 16:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date;
        bh=W6E730uLvMMxwHghgZwVvXZOZAJ+2Pm4wwHQ4Z6FV6Y=;
        b=7wle1z58oIaGNIaGiLgRWkhQJ6vx5KSn4pbhNGl1FteMVXg7RIyhYXHkidCr1Zj8MT
         C19FJy1CJ+DZac6BL/wmQ1CHWy1lu6e+NpEn0aPVrSSqdJcQD2jaNsdvXYRsdj+WcQkP
         aPrN3cqjTPo88URqfJ34fzfvD27jAIYrSsbCPrxuhwuKseC8NUTNAfaTz2r4lPYEitdU
         tE8FIbd4gssm2jnardYJhJl8aAoDG0IZXSdVb6fbBKx9XlO6KQbmdTdR5s9foz9oRA7D
         yLyaGxbsb49BfUWOhA4/hmXcKocE77nb1h0M+jIcHfEVLFcWPW0eCZx6noKbvElq+xTf
         7NSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
        bh=W6E730uLvMMxwHghgZwVvXZOZAJ+2Pm4wwHQ4Z6FV6Y=;
        b=k914Xd02hOMP0knnIsT6HDFJbGUeApaMM2n49nQVS/7EMD4G6tCS09r9lnM10nCWze
         N0Oe3rcVpAz13AXYM0PsCKneysMMqGlCmYDwN6uKIZ0M//aCmCyY8ECjYu5Dv3StfzkI
         HE1MPVNV4LYpxVkQZS/LcHRg7Rcpm3gOndfhg2uyOVuY5IQLlux1FBAdeu7unSwvqYS8
         C1dqJnJYx75tGpTq1wF34QPqSWx+gI3j2nvSFhLXQmOp7tFkhavIVCYzARR/aSb/O4Xc
         QG8cqn1O8hiwTTraH2D05mVnUuAoc0RYoKmyDGabvkCsM40RFX9qaWOQ58osxuyR8nnq
         es8Q==
X-Gm-Message-State: ACgBeo3Jscgo51SLBQvcKX9WYWANjAzCP6K64eIFFY0Bd3HU4EQ8UvvF
	KrJJ9Yk9BJz849Ob2MNZdf6FjOonso5WAUypdkI=
X-Google-Smtp-Source: AA6agR5U+r0bUqFgg9l5q4RBWaKsGTqXuoRgqIDmtLwOtcnz/XmIYfNqHo0XOEuYD+bdtS5iqg1I/w==
X-Received: by 2002:a63:cd55:0:b0:42a:7649:77c7 with SMTP id a21-20020a63cd55000000b0042a764977c7mr9750161pgj.149.1662678872475;
        Thu, 08 Sep 2022 16:14:32 -0700 (PDT)
Received: from localhost (154.30-253-62.static.virginmediabusiness.co.uk. [62.253.30.154])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c21500b001769ee307d8sm70740pll.59.2022.09.08.16.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 16:14:31 -0700 (PDT)
Date: Thu, 08 Sep 2022 16:14:31 -0700 (PDT)
X-Google-Original-Date: Thu, 08 Sep 2022 16:14:27 PDT (-0700)
Subject: Re: [PATCH v3 0/2] Zicbom block size fixes and cleanups
In-Reply-To: <20220906074509.928865-1-ajones@ventanamicro.com>
CC: linux-riscv@lists.infradead.org, conor.dooley@microchip.com, heiko@sntech.de,
  anup@brainfault.org, mchitale@ventanamicro.com, atishp@atishpatra.org, nathan@kernel.org,
  jrtc27@jrtc27.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: ajones@ventanamicro.com
Message-ID: <mhng-0b9b374f-4bc3-4626-9ddd-be4fdd25484c@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_161435_313868_59489A74 
X-CRM114-Status: GOOD (  18.61  )
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

On Tue, 06 Sep 2022 00:45:07 PDT (-0700), ajones@ventanamicro.com wrote:
> I collected a couple patches that were necessary for another series.
> Since some changes were required to the second patch I'm posting in
> case it simplifies things.
>
> v3:
>  - Applied Anup's move change first to ensure the second patch can
>    compile with Heiko's change.
>
> v2:
>  - First attempt at sending a fixed-up version of the second patch,
>    which mistakenly included Heiko's change without Anup's change.
>
> v1:
>  - The original patches on the list
>    1. [PATCH v2 2/4] RISC-V: Move riscv_init_cbom_blocksize() to cacheflush.c
>       20220829125226.511564-5-apatel@ventanamicro.com
>    2. [PATCH v2] RISC-V: Clean up the Zicbom block size probing
>       20220812154010.18280-1-palmer@rivosinc.com
>
> Anup Patel (1):
>   RISC-V: Move riscv_init_cbom_blocksize() to cacheflush.c
>
> Palmer Dabbelt (1):
>   RISC-V: Clean up the Zicbom block size probing

Sorry I dropped the ball on this one, but having the fix depend on a 
refactoring isn't the right way to go as those refactorings aren't 
supposed to end up on fixes.  I merged it without the move into 
palmer/riscv-zicbom_fix, but the jet lag is starting to kick in so I'm 
going to not merge it onto fixes for this week.

>
>  arch/riscv/errata/thead/errata.c    |  1 +
>  arch/riscv/include/asm/cacheflush.h |  2 ++
>  arch/riscv/kernel/setup.c           |  2 +-
>  arch/riscv/mm/cacheflush.c          | 40 +++++++++++++++++++++++++++++
>  arch/riscv/mm/dma-noncoherent.c     | 40 ++---------------------------
>  5 files changed, 46 insertions(+), 39 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
