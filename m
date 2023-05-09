Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44065C7EE22
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 03:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SsQwpMbGZrl0gsAzFyyWZjdZJwll0fx3ZnNbLCVTPFM=; b=xAZK5yDD8p1Arp
	xSZ0be5IOMhy3mCYGhgxPyzHa2DU3E54TNwSoh0Biv01WZvrqxAJydl67kkLGoFv3LGX853mfj9mk
	nP/s0nAL1qksPHBgT04DmOeUI526I8mLFnDNuGj4UOKSC5FLHJHw8cKMh1I94FKPwWzQwYuy7z+A3
	zz4XXkGWokokQGI8HsYwcorcghjmXgRPPXYAi+dt9T8UmwM+0Bddv+JGBrgfm3Ey8alaKO747mzAa
	2QO5Fmm3NfIMeUEFCOck5ypGPGKlyCDX1a/Uu7XoKXe7BMnp+R1S4GMaj2l/++5yI/bs6aZJXRtGB
	jwVzbtWKVBYsCoenvptA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwERf-002D3V-0C;
	Tue, 09 May 2023 03:55:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwERc-002D26-2S
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 03:55:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 417786314B;
	Tue,  9 May 2023 03:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9292C43443;
	Tue,  9 May 2023 03:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683604519;
	bh=FeEPuL62SD/ceTdy1AZqZeZrGvNE+W6iSSHqrcpuhdM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OhJSQT2MVsMODcgKmZm3eXaO3m06LFE72mdzX/Zb9R28CHWG7mHNsLan02Z03oFND
	 p4i+PAwh3q0Re1S+KQGPNottImrfarMe3RdGQxtH3yQXm1CUJsU3oqAHRpgm+aTCBB
	 hCJ8SufK0gtviNc/Pcf85a+gMOueoRzhUuUlO+FZEURK5CL/R2VSxx1w6gJTZLYGY6
	 nep3geF4Gaz1Y1USNBhXweO26vYZKW6H0zH3U1wdpyVDMHrMBc/UldlR9iHtzhe6t8
	 8ikJhD7wqOHw0OX/vdi2p6fhCxc+4BkCwvU+Ngb0socWp1hSlNRhi0UViYsQhZvmhf
	 PUhkvD+Y6CQQA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.2 3/6] riscv: Fix EFI stub usage of KASAN instrumented strcmp function
Date: Mon,  8 May 2023 23:55:09 -0400
Message-Id: <20230509035515.59855-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230509035515.59855-1-sashal@kernel.org>
References: <20230509035515.59855-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_205520_832130_C96AD619 
X-CRM114-Status: GOOD (  10.53  )
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

From: Alexandre Ghiti <alexghiti@rivosinc.com>

[ Upstream commit 617955ca6e275c4dd0dcf5316fca7fc04a8f2fe6 ]

The EFI stub must not use any KASAN instrumented code as the kernel
proper did not initialize the thread pointer and the mapping for the
KASAN shadow region.

Avoid using the generic strcmp function, instead use the one in
drivers/firmware/efi/libstub/string.c.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Acked-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Link: https://lore.kernel.org/r/20230203075232.274282-5-alexghiti@rivosinc.com
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/kernel/image-vars.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
index 7e2962ef73f92..15616155008cc 100644
--- a/arch/riscv/kernel/image-vars.h
+++ b/arch/riscv/kernel/image-vars.h
@@ -23,8 +23,6 @@
  * linked at. The routines below are all implemented in assembler in a
  * position independent manner
  */
-__efistub_strcmp		= strcmp;
-
 __efistub__start		= _start;
 __efistub__start_kernel		= _start_kernel;
 __efistub__end			= _end;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
