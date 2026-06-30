Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62369C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 07:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6GM7twoz2kY3Y8F/VzoBIFBU4PR6cnMNHB0Vee7bSQE=; b=soITCHG2NUlq0Y
	EusAgp0BGTKa9Kp4IFYNQ7ldyGOA3QuxbUTX4ahneffZe8hpUxJvIGZC6oVS6lETCRSA1GqSlCB35
	Qh1QjF6G2kRUw8SE1w62EO7sxsSGf/qJ75NJd/XaVaZiUp0WJJeG+y60e0IA2TW2y2AeRPa5evPOt
	XXqKjIx8nISZm4dTQPKUrSvRK6K2MCG+4WOfFyXK0WzCTTWFL/75xmNWmdpikUlQpaC0H00km96zF
	rk5AZZKSqXnadTin+wyapR/4kUQZ9oBGzfe1qkb4CTTrtYBcq+pL2hKdRGSNlTB1UCdRl1YEmc06a
	dFAthG6xTGhAIVK4J97w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTDk-0000000GBLO-099n;
	Tue, 30 Jun 2026 07:49:28 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTDK-0000000GAb1-3IOL
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 07:49:06 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-2c99672293cso22039385ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 00:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805742; x=1783410542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miEM+ZI1eBAN6H+hUm7y5SHAIdsM2tNi01WsyWumT6E=;
        b=ixQLsS+A63rePmdkpfuTziJ9qMnyOYNgdJ8e1gnTM+Ur1phooF0RHmJaeOt6ihnOOn
         2rJ8Wmbu4nwxv8grCgjQhwhf7NBsYkOiWYd59AFRbwoKk+aS9CnDz2glNOVKMBT6pxSe
         lTCdGF7kufKHQMD1lyOY6j5cOPgoUTdbZy2bQIfosrnqoXp/HWXh9buC4Toy92HUTfMA
         hdy7kYnRYvixFQbGxf4GLLixV7lISyq6Y0DEe8XoiBP7Rs/GAkoRl0pmSUBveUskjUmN
         Y21vJkjmTieCHzeGf8hPQ4tn5dyAVrRF9IYCqYItisS9plHQ7/hSUZRlU4flvbChsdJG
         x0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805742; x=1783410542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=miEM+ZI1eBAN6H+hUm7y5SHAIdsM2tNi01WsyWumT6E=;
        b=S6FOVXNaQMjSOWrV7Az13yxwBeUnwaflyV96AgFCs4PWgoCpjaLk1f7rMo2eADi2ef
         vB5GVrHn4GEn5HvGwffc4PXMZ+1rp68cVnIcsl4T7gEkT0Bsuzsvk2E6iRMTOReBcrsV
         +0oI0E86TUIjT5LqPdvjyNwQfnlRzjD0dXWknlE3IG8Nl7pwRRjIs53NcDrtyMUqcVSK
         EhyUSSlb3ySBJLdYMvYfRDdVvC9q12/6eZ8H/f9qxfFI8zkvFlvnv1VE62jr7nf3VTii
         ieQT2T/05ObsL6NgvwISiuGXwB/hYMdB8lTwDfxJpyH8nil1ket9YiwoKEQdG554XouE
         VpJw==
X-Forwarded-Encrypted: i=1; AHgh+RrA7eDnGHlTyRt2S2R8OfftYJnSGL2NpneVGzZgY9nT1yheJ2Gptq+A0xA/S+raRfjbfdr8XvRwSM0+0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzheC61RjiRadlwFLAfCm4CyM/9N/RUYHPFKhvgabULhR9zUNFX
	946F14gbMkm6ToFr0mLs4ZB/1wKWJh5xMna45+10ss4zsWAYGwuANUbw
X-Gm-Gg: AfdE7ck1NjQuVs2aL1xqeQsaMVJJsWdJi81Urb7TJ+iBLoenUN2rqQ/ja/2dsGL5mpY
	SFuBVzdPJFC1WtxvzE/v4M6V/IQ1InVrLVJW2gb/4H1hQlI1iK0+jz5tCN1V3lDUg9N1j7YV9sq
	bgEzT22gFzgC2dXekpsZBnTlkot8TlToQnT42eUgGUgTox6pT/+blGgoi4VQ5Qa2CTV/+7bu3qZ
	VsNqXqihPOLYQCWk0eNL4m5voy2E/MexBJ1qP8e7a1Kg//0LQwXtxoEh9i847gPpv+yNGCOQT3O
	a6WTU3WjoA9fdlKgPwUYCW5d6x1gUMz7b+NtmH7tXzsYghdk3sKj+B7jdVZO/38KXa+6LUBs/JJ
	ZDq68uqWVGuqY1kqYVdlc/2/dJgZxJi5UX96EezrZJIq/mLS4yiSW5HP0a5ChMJ1X3CpNE4/dyv
	/qhDh0hLeWJeo0cAa+GYT3yng+dg==
X-Received: by 2002:a17:903:186:b0:2c0:a746:7b16 with SMTP id d9443c01a7336-2ca2d8a616amr19688075ad.22.1782805741701;
        Tue, 30 Jun 2026 00:49:01 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:49:01 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	bhe@redhat.com,
	rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com
Subject: [PATCH v4 09/10] riscv: kdump: exclude non-dumpable reserved memory regions from vmcore
Date: Tue, 30 Jun 2026 15:47:13 +0800
Message-ID: <20260630074715.4126796-10-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630074715.4126796-1-chenwandun1@gmail.com>
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_004902_928625_2A0275F2 
X-CRM114-Status: GOOD (  10.47  )
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

From: Wandun Chen <chenwandun@lixiang.com>

Apply the same non-dumpable reserved memory filtering to RISC-V kdump
as was done for arm64. Use of_reserved_mem_kdump_exclude() to drop
flagged regions from the elfcorehdr PT_LOAD segments, and
of_reserved_mem_kdump_nr_ranges() to pre-size the crash_mem array.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 arch/riscv/kernel/machine_kexec_file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 59d4bbc848a8..25359d583bc3 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -10,6 +10,7 @@
 #include <linux/elf.h>
 #include <linux/slab.h>
 #include <linux/of.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/libfdt.h>
 #include <linux/types.h>
 #include <linux/memblock.h>
@@ -64,6 +65,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 
 	nr_ranges = 1; /* For exclusion of crashkernel region */
 	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
+	nr_ranges += of_reserved_mem_kdump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -77,6 +79,8 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 
 	/* Exclude crashkernel region */
 	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
+	if (!ret)
+		ret = of_reserved_mem_kdump_exclude(cmem);
 	if (!ret)
 		ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
