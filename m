Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A97C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Mar 2022 03:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=C0Q0xb0rAC3Otqc/devkdakeHratj8n6xafQZDjJS60=; b=pUJpaWC3UqiSAcXXKZB0Pu3Li6
	bjq9uksTgJup2kONtn+uJp8vwH/0gqgfF4jb83bEjKgdHoXh3MTXCw+U5pem4puWidV4QrwLngArI
	XKTcYMwVrJ6nvsNbKe4UaqQCUrnrTcVJLNN1TBsZCNelEjBMG/1SwtSv+6Wq3qRQ85giZrpMGCL9b
	0OQYgOPXGn8CWtjMx9oYWNJpLz28CU/orwKGtSSuGuakHBEJLRclaBGPlXzXUAdWFpk6uMX2AZ3EG
	MzQOm++a/6u1JwCXY2e/zHInFxZcfOCJ/FC858n6oXu5dP3X1gJ5/dNkxXF6OVkkv1h1jB2Pb0s3A
	2Lv+7kIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV30F-000FTz-G0; Fri, 18 Mar 2022 03:10:11 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV30C-000FTA-4y
 for linux-riscv@lists.infradead.org; Fri, 18 Mar 2022 03:10:09 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 mj15-20020a17090b368f00b001c637aa358eso9404546pjb.0
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 20:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=0gHHt1JqAwoF17n7ibUdigU8aOOB90AJhCP1mUVeFZ0=;
 b=FDuPFlnro/v7DXousZSsjlciLEaFw16Qy6oNf8MBtRjYOOpDeua9725z8H1lpk3eSe
 ZnbC0/XzxQLo0uxR4r23aZhletg3h0JOs8lmCtbgCbZtKxqqQhthNERb1n0eU8ZkK/lW
 l51Lu9hzIHva346QmSvSHI6i/wDKFlvLk5fvjD3mxkcZH7LKeJbkPdDWSclNsa1dEYjh
 iiR5qtSD4c9RqfKUbprJUclvtg/rycXbrPG3uclSvZNqjgOzinWsyfvDuby/W6peo6Ny
 yhaLTEHNN1yjAtSPZI/xL5lFHB+ycsarYpFwFGc0pHjl699pWuV1GKTMh/lKKVsGHEGm
 m0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=0gHHt1JqAwoF17n7ibUdigU8aOOB90AJhCP1mUVeFZ0=;
 b=RInLqyOfV/IfpQTWxwWU4hz8l0s2ceQ+Ec3yOz0j3cdUDL+EUi5RBYXjrhTmrvAkFb
 IN1FPiV7BAfh//oEj4o/R9tdNkt30hqHg3Mo2uQC1g/aHzyOprnDnt1vCdNyTuwEXo/0
 iUnxcjNttXRcN9ksGr8NBM3j9lA0EiwRzhKOvYW8e02L8J0M6TXoJMYCkAspKnWlDblW
 4s7rNAM9EWJDtaYGuWsmUNQyB227nF6z0/XyrUk+bYHKO9cyGvGo6ZEivHfPh3q+xCfG
 FHGeD69JDiXSRlJgfbbJBupx7zNs5ZCMjAQ4Do4Q8NLwUJ7FVasAOSR1OppoGwHuu2z1
 Nc7A==
X-Gm-Message-State: AOAM531VfWVnBgPtFYHdnZ2gP7m0fygZuk0kMBHwKtRQ6FO5bgw+srQX
 9Qwt+8Ov822fYiFwwFzUs4+Se2DgW2/f/w==
X-Google-Smtp-Source: ABdhPJyVOUAUDfkDhGgRehhK3QSKTVmspbipFfnEk7FylPiNOrWPrYGssWn5GpLCRkFMjS29CjXERA==
X-Received: by 2002:a17:90b:3807:b0:1bf:6c8e:f9b7 with SMTP id
 mq7-20020a17090b380700b001bf6c8ef9b7mr8995968pjb.16.1647573006636; 
 Thu, 17 Mar 2022 20:10:06 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 g28-20020a63111c000000b00374646abc42sm6271571pgl.36.2022.03.17.20.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 20:10:05 -0700 (PDT)
Date: Thu, 17 Mar 2022 20:10:05 -0700 (PDT)
X-Google-Original-Date: Thu, 17 Mar 2022 20:10:03 PDT (-0700)
Subject: Re: [PATCH v6 0/6] Provide a fraemework for RISC-V ISA extensions 
In-Reply-To: <20220314203845.832648-1-atishp@rivosinc.com>
CC: linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>,
 aou@eecs.berkeley.edu, atishp@atishpatra.org, anup@brainfault.org,
 damien.lemoal@wdc.com, devicetree@vger.kernel.org, jszhang@kernel.org,
 krzysztof.kozlowski@canonical.com, 
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 robh+dt@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <atishp@rivosinc.com>
Message-ID: <mhng-596cc82d-51af-448c-bd04-51b517fe79c7@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_201008_274313_A6EB4BAE 
X-CRM114-Status: GOOD (  22.15  )
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

On Mon, 14 Mar 2022 13:38:39 PDT (-0700), Atish Patra wrote:
> This series implements a generic framework to parse multi-letter ISA
> extensions. This series is based on Tsukasa's v3 isa extension improvement
> series[1]. I have fixed few bugs and improved comments from that series
> (PATCH1-3). I have not used PATCH 4 from that series as we are not using
> ISA extension versioning as of now. We can add that later if required.
>
> PATCH 4 allows the probing of multi-letter extensions via a macro.
> It continues to use the common isa extensions between all the harts.
> Thus hetergenous hart systems will only see the common ISA extensions.
>
> PATCH 6 improves the /proc/cpuinfo interface for the available ISA extensions
> via /proc/cpuinfo.
>
> Here is the example output of /proc/cpuinfo:
> (with debug patches in Qemu and Linux kernel)
>
> / # cat /proc/cpuinfo
> processor	: 0
> hart		: 0
> isa		: rv64imafdch_svpbmt_svnapot_svinval
> mmu		: sv48
>
> processor	: 1
> hart		: 1
> isa		: rv64imafdch_svpbmt_svnapot_svinval
> mmu		: sv48
>
> processor	: 2
> hart		: 2
> isa		: rv64imafdch_svpbmt_svnapot_svinval
> mmu		: sv48
>
> processor	: 3
> hart		: 3
> isa		: rv64imafdch_svpbmt_svnapot_svinval
> mmu		: sv48
>
> Anybody adding support for any new multi-letter extensions should add an
> entry to the riscv_isa_ext_id and the isa extension array.
> E.g. The patch[2] adds the support for various ISA extensions.
>
> [1] https://lore.kernel.org/all/0f568515-a05e-8204-aae3-035975af3ee8@irq.a4lg.com/T/
> [2] https://github.com/atishp04/linux/commit/e9e240c9a854dceb434ceb53bdbe82a657bee5f2
>
> Changes from v5->v6:
> 1. Changed the isa extension format from separate row to single row that follows
>    RISC-V spec naming standards.
>
> 2. Removed the redundant extension detection log.
>
> Changes from v4->v5:
> 1. Improved the /proc/cpuinfo to include only valid & enabled extensions
> 2. Improved the multi-letter parsing by skipping the 'su' modes generated in
>    Qemu as suggested by Tsukasa.
>
> Changes from v3->v4:
> 1. Changed temporary variable for current hart isa to a bitmap
> 2. Added reviewed-by tags.
> 3. Improved comments
>
> Changes from v2->v3:
> 1. Updated comments to mark clearly a fix required for Qemu only.
> 2. Fixed a bug where the 1st multi-letter extension can be present without _
> 3. Added Tested by tags.
>
> Changes from v1->v2:
> 1. Instead of adding a separate DT property use the riscv,isa property.
> 2. Based on Tsukasa's v3 isa extension improvement series.
>
> Atish Patra (3):
> RISC-V: Implement multi-letter ISA extension probing framework
> RISC-V: Do no continue isa string parsing without correct XLEN
> RISC-V: Improve /proc/cpuinfo output for ISA extensions
>
> Tsukasa OI (3):
> RISC-V: Correctly print supported extensions
> RISC-V: Minimal parser for "riscv, isa" strings
> RISC-V: Extract multi-letter extension names from "riscv, isa"
>
> arch/riscv/include/asm/hwcap.h |  25 +++++++
> arch/riscv/kernel/cpu.c        |  65 ++++++++++++++++-
> arch/riscv/kernel/cpufeature.c | 128 +++++++++++++++++++++++++++------
> 3 files changed, 195 insertions(+), 23 deletions(-)

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
