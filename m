Return-Path: <SRS0=gmBF=KD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D54E3C433ED
	for <linux-riscv@archiver.kernel.org>; Sat,  8 May 2021 18:26:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CB2A611BE
	for <linux-riscv@archiver.kernel.org>; Sat,  8 May 2021 18:26:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CB2A611BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MKjcJxtFFZra1j1cgCFz/KvilB7IgYQfJvwi/NIoRZk=; b=IX43pjv5YZWpQlHHH1fL8wxIER
	ChlpgyTS/R2QmsXxC4SRAY01B52ydrftfXKNtU5w95drxrFPIZFGA5ShM7fr2BATFO7DPqRlMxjy+
	z+IxnPHi1Szz/dja1SxyqpAKpssjaCbb+Bgz+44FDLuHmXsMByK1YzlyMB1eJAaeTDPds2GphrXGV
	erx7cbnFX1nJphQBMEX5uBnewnflqLBsRQob7WLbJK5vvnC9XBGeWM4xfpDkYaoyriBoIYxOQuE99
	AnR9T/SdJBrwHDUYd3goqAFgOHj+ystDAOd4KlYJiD8cNZ3FfKCChDTPcH2awbLFGL7mPqtiCJNV1
	3pf3Ta+w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lfReO-00A5pb-FY; Sat, 08 May 2021 18:26:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfReM-00A5p8-Mq
 for linux-riscv@desiato.infradead.org; Sat, 08 May 2021 18:26:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:To:From:CC:Subject:Date:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=shpt2GxHpkIOa8FMzNcihpagpGywSo+7Qiz4Q2suvAI=; b=YwoS6rM6cN/CosAetfmzv2UMjA
 rlL3//HNBBotVE3eK97z8RcdYI6rLtBIfVkQVt220UR/N36TPzFQfpSufK6OgBoXCPAPw36QPb94A
 VTdP3eEMcsu81/0IHFfYH2BwgbzuWOWVWP9Y0uGNUMUnCvRg5Sf07l4Of8WhG2/4fhd0pBOrm9v0u
 ihvODn2Z23VI3o/jaOEYQtENsi2LAjxmB/CUGYotu3n45ngj85xtpsgdCx44yI+8tRdqRaMkUc172
 HgdGodKw8cq34bmOt+VRFMd1VIc145T67NtqZqZCHjWUdaykVB2O3Jn5b9JJGZOk16Rc33F5KHAFj
 A8v6cJyQ==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfReJ-007fRO-Pp
 for linux-riscv@lists.infradead.org; Sat, 08 May 2021 18:26:01 +0000
Received: by mail-pj1-x1031.google.com with SMTP id g24so7088780pji.4
 for <linux-riscv@lists.infradead.org>; Sat, 08 May 2021 11:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=shpt2GxHpkIOa8FMzNcihpagpGywSo+7Qiz4Q2suvAI=;
 b=YbSLrsKvWGXxgZOdaeVGPk2hu9f/9U6tqHnKd8hGyM3WtYKqMoC0lHAa5xhSfMEQ4o
 wltrmdtqPBvYN8vINKImd2CdosfRg15QXrt+/jxAPuXInmfTsVN0IahVPVyRIL8xZQnO
 h3eSKBzcUCCSHGDFGlaQ+tRF/5o2q+EnZgj8wtA/PwE2OiZC+e1EHr4xdufvbnjjFHs1
 ECWtxfZDibtIJb5O9rI4O3FEEMeZS4IXevLfens4AA3l0W7X5Qh8NBZfLmhGDR9gHRjn
 aCvR01aHk3pOqjfeKiwlaVfFaalGWaCFg6UJnD7G2cgzPENiRo/JlUUpFEIYduWkiIwj
 L7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=shpt2GxHpkIOa8FMzNcihpagpGywSo+7Qiz4Q2suvAI=;
 b=P1/we1oxalJsQZRLGofM/c2ooIcwteN3wuj6QcN6SMqf7Xq3D99cupx3NYk7RSfEWy
 omVX5C8WasqgXTxcZH3FYqYsrcrpcLRwMyreyCeGcJpUzZr66s3t3bTJSpXoxV2KUwxZ
 SUlA3GxgRsNuAU6Bwn3NqhySZh/YHuiRlG7MfpjjcL1PfEzjk020E4QR/WnloKYLlbJv
 ldsmR6rv2LDIR4may2bleC2I5cZ4wdJJiMsrqFM0/E/idBBJn+Twct5DXj6oD1AKs5/q
 RAjS1thNEUlQjoGU5Gi8pPQWJUnNc+xNM4aT+SJE5EkyfFO88+tYHvm/16QDvW6p27Ex
 dyog==
X-Gm-Message-State: AOAM5316DZAsryORbYbgKtt9y6o+PKhYG5btHi74U1HAAsRAz22s10tK
 n4h2LL4B4coKWwjHKKc7u5TFhF+56lnIUg==
X-Google-Smtp-Source: ABdhPJyhtPPO3t6Ufe08/C/YxWRg/G4+Thpoy0pKKdO4FfP8qLBotuenF+sbOpMQAKxIaaOENH4l1A==
X-Received: by 2002:a17:90a:3f08:: with SMTP id
 l8mr30283213pjc.136.1620498357401; 
 Sat, 08 May 2021 11:25:57 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id g84sm7489467pfb.198.2021.05.08.11.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 May 2021 11:25:56 -0700 (PDT)
Date: Sat, 08 May 2021 11:25:56 -0700 (PDT)
X-Google-Original-Date: Sat, 08 May 2021 11:25:54 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for the Merge Window, Part 2
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-00f4b683-5870-489d-b713-aa5f18aaa6c5@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210508_112559_928196_F151BF52 
X-CRM114-Status: UNSURE (   8.88  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

merged tag 'riscv-for-linus-5.13-mw0'
The following changes since commit 939b7cbc00906b02c6eae6a380ad6c24c7a1e043:

  Merge tag 'riscv-for-linus-5.13-mw0' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2021-05-06 09:24:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.13-mw1

for you to fetch changes up to beaf5ae15a13d835a01e30c282c8325ce0f1eb7e:

  riscv: remove unused handle_exception symbol (2021-05-06 09:40:16 -0700)

----------------------------------------------------------------
RISC-V Fixes for the Merge Window, Part 2

* A fix to avoid over-allocating the kernel's mapping on !MMU systems,
  which could lead to up to 2MiB of lost memory.
* The SiFive address extension errata only manifest on rv64, they are
  now disabled on rv32 where they are unnecessary.

There are also a pair of late-landing cleanups.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      riscv: Only extend kernel reservation if mapped read-only
      riscv: Consistify protect_kernel_linear_mapping_text_rodata() use

Rouven Czerwinski (1):
      riscv: remove unused handle_exception symbol

Vincent Chen (1):
      riscv: enable SiFive errata CIP-453 and CIP-1200 Kconfig only if CONFIG_64BIT=y

 arch/riscv/Kconfig.erratas          |  4 ++--
 arch/riscv/include/asm/set_memory.h |  7 ++++++-
 arch/riscv/kernel/setup.c           |  2 --
 arch/riscv/kernel/traps.c           |  2 --
 arch/riscv/mm/init.c                | 11 ++++++++---
 5 files changed, 16 insertions(+), 10 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
