Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4C1C6FD19
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Mar 2023 09:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pyz6eSgQTqZki2qlLqEuMuoUqOcOMAn/tuOr8WKsCMc=; b=paLCxuFeO7FDoO
	ddXvqJkeQyylgOb4VnNG3JFBG3yUNO/cBrQb7iNLBoRmDjZXHgXCzQAxrVvGeNMM9jHDnUFFeGLpv
	UmG8obZDdoq4p4PChzal7pNz6WCRFmLobZ+p0L8A8C0aBIZXYuEp4w4OqgWJO9N0Kq63JcOZJH18O
	7qfRYzcPn36q91sdfhxLX6psgWTT3cIA5tDnUSbbPmYYzIoxi0/09N01LSYpvfNbAkQeG2+pJM8fa
	SSng8D6b4RA4KFuCaAKkMBw3tXP3NpR5gXHQRwTj6N9y77hcTa2MWdV0IMm2s6u0j5lNMwWAjyPl6
	2vm1lI4utU2t+O0vhiHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paZK4-00E0t6-HR; Fri, 10 Mar 2023 09:46:00 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paZJt-00E0oi-12
	for linux-riscv@lists.infradead.org; Fri, 10 Mar 2023 09:45:51 +0000
Received: by mail-wr1-x433.google.com with SMTP id l25so4467052wrb.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 Mar 2023 01:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678441544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UftmAx9eMUlUVZ1zG+blrWbVPdUhF6IePoR+esHHRyE=;
        b=mw/JcuakIGznshhAisrjTRMD8Po1tDitbLm42cReJ+D5WwLSfKHow3B63jzrH5HNzg
         im0RBmwfWgltbaAWUJfikpey3379n7iZgcZV1xayELAh3GVtZKo9jw2i4oYXXL0/h3FX
         vnKMl9pnCxls1xtoHkwRsxR73kAA1NnZ0Uvi9JFZokS5Oul8vNx2CdfxWCg25vVTzULy
         /bL073+f9A0eCN03cbNr92x9ZQW1JVyhrVWHsaHy3G8YR4nIjwpNNqi8F/5MyxOjpXv8
         IaWEpDsI+7aC3l8hLqSbbjhgSsESc6VIiplKe/ZqliiM6bRlTKclTHaj6U36MU59E2zp
         tHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678441544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UftmAx9eMUlUVZ1zG+blrWbVPdUhF6IePoR+esHHRyE=;
        b=17She4qMX41yAKyijweaULGEt02IAxEkamWa/DlaDqED3uocKdApWxll7lRYh5cliH
         KZL+2qcGtvsRbT2kPE8Ly0adChPPJ5kaud032pSecQyfWKIteLmFYKak+GqtyvRt3Tjf
         DTi4yEbUG9GBr3eedQQB806TJCW1jE7R2/3VH9gQznMSjZTbWKchVXasst87+8mJ/Hsm
         13H4d1uELRp3qw1odVApJra8ttWm6miAcsrAMoYHnh4XxVpdHzc3bMVrh/PyxEZuFS+S
         uNm6YMeYntbAR2PMTk4eapPkzCYrMNncYfJCeMWBjG6WGBqZ+MAlDGkhE2X2y/y4MWTT
         ja0Q==
X-Gm-Message-State: AO0yUKVM7xfLZ7R+c6+WvsT+GY0OoU9vGfck6uRFtz9Ya0X9dmrido++
	8sfoDGX1pLGsJnL9ii9r5o4/CQ==
X-Google-Smtp-Source: AK7set+348Cnhg9OopXRYq6mmFzZ+O41Mzkm9zWAs2amuAeiaWL8WS531F/GY1Nq+XByYlhgrJNy4g==
X-Received: by 2002:adf:fbcc:0:b0:2c7:bb13:e23f with SMTP id d12-20020adffbcc000000b002c7bb13e23fmr16291966wrs.24.1678441544476;
        Fri, 10 Mar 2023 01:45:44 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id r7-20020a0560001b8700b002c7163660a9sm1646775wru.105.2023.03.10.01.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 01:45:44 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v7 0/4] riscv: Use PUD/P4D/PGD pages for the linear mapping
Date: Fri, 10 Mar 2023 10:45:35 +0100
Message-Id: <20230310094539.764357-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_014549_320049_3F7FA748 
X-CRM114-Status: GOOD (  15.56  )
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

This patchset intends to improve tlb utilization by using hugepages for
the linear mapping.

As reported by Anup in v6, when STRICT_KERNEL_RWX is enabled, we must
take care of isolating the kernel text and rodata so that they are not
mapped with a PUD mapping which would then assign wrong permissions to
the whole region: it is achieved by introducing a new memblock API.

Another patch makes use of this new API in arm64 which used some sort of
hack to solve this issue: it was built/boot tested successfully.

base-commit-tag: v6.3-rc1

v7:
- Fix Anup bug report by introducing memblock_isolate_memory which
  allows us to split the memblock mappings and then avoid to map the
  the PUD which contains the kernel as read only
- Add a patch to arm64 to use this newly introduced API

v6:
- quiet LLVM warning by casting phys_ram_base into an unsigned long

v5:
- Fix nommu builds by getting rid of riscv_pfn_base in patch 1, thanks
  Conor
- Add RB from Andrew

v4:
- Rebase on top of v6.2-rc3, as noted by Conor
- Add Acked-by Rob

v3:
- Change the comment about initrd_start VA conversion so that it fits
  ARM64 and RISCV64 (and others in the future if needed), as suggested
  by Rob

v2:
- Add a comment on why RISCV64 does not need to set initrd_start/end that
  early in the boot process, as asked by Rob

Alexandre Ghiti (4):
  riscv: Get rid of riscv_pfn_base variable
  mm: Introduce memblock_isolate_memory
  arm64: Make use of memblock_isolate_memory for the linear mapping
  riscv: Use PUD/P4D/PGD pages for the linear mapping

 arch/arm64/mm/mmu.c           |  4 ++--
 arch/riscv/include/asm/page.h | 19 +++++++++++++++--
 arch/riscv/mm/init.c          | 39 ++++++++++++++++++++++++++---------
 arch/riscv/mm/physaddr.c      | 16 ++++++++++++++
 drivers/of/fdt.c              | 11 +++++-----
 include/linux/memblock.h      |  1 +
 mm/memblock.c                 | 22 +++++++++++++++++++-
 7 files changed, 92 insertions(+), 20 deletions(-)

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
