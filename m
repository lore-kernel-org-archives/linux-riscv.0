Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA508C77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 14:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LgguRM50uQ9sm+8gkU3ncVXYWuuo8eXB0C5ehRqanEI=; b=1D3buCB6heLFuw
	QzfchVIBmUAo6VZVAcO0l7tk8YVM7Ieo2kspsE7nk5HGRVmU4OP9HsTyQz2GBFIV2qvkHBGLyD82G
	hoaQKwzi7lMxdM7+Tf90S81DU/BebtiNdoEVoOiR2pPSxvpartesOYirgjSsgzAIQYWdUwm6q1rkC
	ONI4JqJqT4wLsNhP9gY2rZmc3ORk2IWTb48EmssKDkfq2JMpXed1KDrnF09vc0RS7+x0pd0Kj4NUm
	fGPWrUSDwc3zC+4QtmiBvCl9Pp0B7oPOwz0i7g+DgIwjbqf2LB2nQncEeMElAZGHsaP3bijlinQ9R
	HUtJeSk7qEjEElsHxv3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6BIq-00FoHH-0j;
	Mon, 05 Jun 2023 14:35:24 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6BIm-00FoFJ-1G
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 14:35:21 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-53fdae76f3aso4444005a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 07:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685975719; x=1688567719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3khYtgeUULt7e5l5ueg0RsqVZIRlFDE+jq/4yBZsmo=;
        b=LIn8WJ/3LEHfU+pG64HvMCl4aGlrGhQZ2zXku7l5yzg/yQ5oY+T1DLfY2hMr3nBgR9
         R+tEN6blSMtmMkNW7F6b7MnIXCUiBn00INjPXZ7/45jmfgu4JJq0avOTUARyJD7bPae5
         9qHTq5bBIk95KCvgn+7lr/rg8LW5Lo1lBpZUkjgcLIBpBg7730ZUlQGfYck1rnxMZ5YL
         hvrTxUEUMcqkVqf5A/TrlckGdVwH7AqEPf6h3ZY45ecwpoDCeRBS2c2QdJGBv4VRz0gJ
         sMmVLwZK6v04jShn7c9wfDPeTiyjQzl20IuXWPiLPfgYf4n3KHk4I+5TLsQpJo/tuizr
         GYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685975719; x=1688567719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q3khYtgeUULt7e5l5ueg0RsqVZIRlFDE+jq/4yBZsmo=;
        b=EV82rMYnjDAEAKlaWqaCoq096k0PvZ2zm5dTFOpD/hGOUPzgWIApr2oyAjF4JOsbLi
         XOJjutNdUXlJT30BE+1xGKLkeisPmn+7Rr6fvqDHhcOJkxiVmbh6B8ikSeeAlndsqTqx
         r9j6bF5STSwG5KPOHicxnMFrAMHNGR+A99TuivpBlEt8XLb5ISV0d7LzaYoczfKWpI1d
         IBFX89+WpMQS7OIW0WyJUbwRZ7MZhn/1CRKobhqOOPLfgUDZ2fy4nu224efd5NQnROOo
         aW3OfTMAYs3iYDWiGdINX9OdIy8gv4rGfBBedR8dIwh68FCzMnG+LxdeYz7B93ewpVIx
         Y+6Q==
X-Gm-Message-State: AC+VfDxiLwA+7qlF6Qz89QqXVD/tp03uCykMjNoglOi/mHrCu51M536d
	pEeF9jx9PKM3ql5mYZGLDDZz+IEcP2gp8RqT91A=
X-Google-Smtp-Source: ACHHUZ5gp/nF86uqF74WMpv1cRmJIDO1sxPZeQJD6hGyHcVxGqwUGJgPklbYGDpA+Xzi3nA6Eihslg==
X-Received: by 2002:a17:90b:1204:b0:258:8609:f1e4 with SMTP id gl4-20020a17090b120400b002588609f1e4mr6540632pjb.24.1685975718828;
        Mon, 05 Jun 2023 07:35:18 -0700 (PDT)
Received: from kerodi.Dlink ([106.51.186.3])
        by smtp.gmail.com with ESMTPSA id z14-20020a17090a1fce00b00250334d97dasm8297069pjz.31.2023.06.05.07.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 07:35:18 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 -next 0/2] RISC-V ACPI: Assorted fixes
Date: Mon,  5 Jun 2023 20:05:10 +0530
Message-Id: <20230605143512.707533-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_073520_426799_62C6B3A1 
X-CRM114-Status: UNSURE (   9.99  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series fixes couple of issues required to complete the previously
merged basic ACPI support series.

1) Kernel test bot has found a new warning using the sparse tool. Though
I believe this warning exists for other architectures also,
I don't see an issue fixing this for RISC-V.

2) When sscofpmf extension is enabled, the perf driver tries to
find out the root INTC domain to register the over flow interrupt
handler. However, this function is DT based and needs to be enhanced
to work on ACPI based systems.

Sunil V L (2):
  RISC-V: ACPI : Fix for usage of pointers in different address space
  RISC-V/perf: Use standard interface to get INTC domain

 arch/riscv/kernel/acpi.c     |  4 ++--
 drivers/perf/riscv_pmu_sbi.c | 17 ++---------------
 2 files changed, 4 insertions(+), 17 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
