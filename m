Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59CBC47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 15:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k9wfbnQebM2DnuLFT7Rr8T/BXZ9Xh58o0E9Td72gk/g=; b=42yh4fHJMvAWjf
	Sn0eSVBF1MMhf0FyBH7fK3h9ydjtuKlPjW9vGLEF0PJ1QCviJxsC2GDh/kqmqS4Q3ESDfAs2/74M+
	coIhEofX3jrsX1xlQjsiSwdZUkjbCmz2YBfYygsTh6eaSHjOUc4ui+yF9zrXMkzn9CyqXMAxVl8ke
	mXoB/T7Zvy1ANr40I+8zveVcrsLMB1EBZA/T85edZLvnPZrhTnl1yn2FpwftW+T3+jwyFT0qwOLr7
	aFL5ZFWQon5ZJMf4e83n52I4SNXma5gc9KU/WIw4XrawXnRsNynmamsnnyNix1jqpW5az4VG1+UaA
	HuO83mOyqQ5ywTlaRE7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVCzy-00000004MXY-1AAq;
	Wed, 31 Jan 2024 15:59:38 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVCzv-00000004MW2-0CoB
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 15:59:36 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40e913e3f03so55905685e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 07:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706716773; x=1707321573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SJEZ1qPaiDldAW8C05rM2rqR0hTzPI1igVobAmalZsY=;
        b=y2FgB/1rB4ngEDO9LGjD/HAUWjmQ6btwMNdMXLznG+DKm5tbJCu8dwxiv7mTaacUOF
         4AWA+uofoB1pk4mBSDTIEoXXyA4D7h6KLA9Hc8UMUv6UYyhR+zA8yIUaZG5AAmLo7Uas
         eUarp2Lvn4r2CkK6wvBnTpeVc+I0+j6C2w9hJbWTL+eA84IS9mchz71Sen368kSNNBMI
         iR7gZJhpKZ79qHbem7tUDZoadOyUQtrttPnoUYHxsz62DLBJwW+HonhFGfS5kMQE9GyR
         1K2PqX0qW9NHdEj2YQ6hZM6EmaJ4rozoYSxnh7VLlnWQVuDk1X2L7ayPB+BEjtTN0rVo
         QKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706716773; x=1707321573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJEZ1qPaiDldAW8C05rM2rqR0hTzPI1igVobAmalZsY=;
        b=Y8l/40O0ryjkp7OO9nu9EkOglXFq45Q+NLYDf/azc5DXGWBdBPElY8S2HGygqRYwd4
         gQ1h6SIzBXDCojv6mof6FKWSZdH4oE0qHLBzZerBDJULcrjXL5UnlA49mTQ67pste+UH
         gdwarJagR2LOwkM8VO9ZfMBApPCZfYRuQLyNnHbBmqvg2O5d0c80PHuhXaH08RRgALls
         5TS3rNE42U8LwKs6R80zhrHRI4toyYMF/Mbgu+tJ1jaboF1oYzO3txa/UEHoKZRusfaH
         MBnBQE6cPB9J0uS0yTAkSz30/uvBIDDG7SczYzD4Ajl8El1q0/3Zt4AtbLGqnu8S0Ur1
         inXQ==
X-Gm-Message-State: AOJu0Yw68HwTR4ZCM57wUo5IERSxHCrDPV5OqYKuXjsDKv+Ug2nhv35K
	9ShZOxyNE3wRZNkdclFN9v2EiDiL+Q6tlCo8tHXVPxBOZd+W/LAOH3PQXbFH2N4=
X-Google-Smtp-Source: AGHT+IE0y4HMNlJGrQQF1/vBmusVf+vGvj5kGeOQLs8zgDMsoQ9mThbIK2SfMvCJNZS4ESF4P8sD+g==
X-Received: by 2002:a05:600c:468b:b0:40e:e834:3d86 with SMTP id p11-20020a05600c468b00b0040ee8343d86mr1590072wmo.37.1706716772821;
        Wed, 31 Jan 2024 07:59:32 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU5toVRodwweHTcQIyYJFP2Sf3z6pJe8uOj3kJL8Bf9n+o3G8oH7qCtVvtBB6ZzANPh3d2Znisr/JVcpjb5tj+mnQOtD0bGrsmT4CRsS6KdtKyxWKOCl38Giy/mwdkpg1+QQxv40odbMZlnkY5SYdo2XLk0XdYDTp7WRoTnVpNlAlYCWWsQHxNfcLCDVAWDcXk3GvVdHhPFZ62Gx3ql6nSu6/WKzbRDqzGUIYgkgqpdB1vq50EO2ieKr+XUNsum2CV+pMMxiPj9TkdU06yVd81ZbG9I+ff7kAkhj9IowwAQm+N5BwHjhUoaeye58UCta73W6pRJRoGC3DvGN4oHjbsgUSKWyszDmS4NdxPTBbwp2RdU2Ks6e9clrZ+UECY6zRr/NAd2cDDBxGCLVOmgvb+jVeV5smy1Xly69fTl7+hY8866CxoOjFO1I48MgVF0UdOI5C1yuLuymZyybFPw6nm1nAcMitNsxXW/PlXLReWUH5BFV6Jriyq2AKNFsNYuHKk6srdfiXlJ0B77YIP+V0E/i01m7OxC/pDhPX+9RSpIvCQkc7ZVpcu7PMqJqsCDBi7cS4PdMDvYQwktSWOvXekDuYCwO0eKbSeWmguapyXy15tDZbbtoRH2ScNNIwiU21PKEtXagxXWu+FGng==
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id t24-20020a1c7718000000b0040f0219c371sm1926678wmi.19.2024.01.31.07.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 07:59:32 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Matt Evans <mev@rivosinc.com>,
	Dylan Jhong <dylan@andestech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH RFC v2 0/4] Svvptc extension to remove preventive sfence.vma
Date: Wed, 31 Jan 2024 16:59:25 +0100
Message-Id: <20240131155929.169961-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_075935_331731_5C5342A5 
X-CRM114-Status: GOOD (  16.42  )
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

In RISC-V, after a new mapping is established, a sfence.vma needs to be
emitted for different reasons:

- if the uarch caches invalid entries, we need to invalidate it otherwise
  we would trap on this invalid entry,
- if the uarch does not cache invalid entries, a reordered access could fail
  to see the new mapping and then trap (sfence.vma acts as a fence).

We can actually avoid emitting those (mostly) useless and costly sfence.vma
by handling the traps instead:

- for new kernel mappings: only vmalloc mappings need to be taken care of,
  other new mapping are rare and already emit the required sfence.vma if
  needed.
  That must be achieved very early in the exception path as explained in
  patch 3, and this also fixes our fragile way of dealing with vmalloc faults.

- for new user mappings: Svvptc makes update_mmu_cache() a no-op and no
  traps can happen since xRET instructions now act as fences.

Patch 1 and 2 introduce Svvptc extension probing.

It's still an RFC because Svvptc is not ratified yet.

On our uarch that does not cache invalid entries and a 6.5 kernel, the
gains are measurable:

* Kernel boot:                  6%
* ltp - mmapstress01:           8%
* lmbench - lat_pagefault:      20%
* lmbench - lat_mmap:           5%

Thanks to Ved and Matt Evans for triggering the discussion that led to
this patchset!

Any feedback, test or relevant benchmark are welcome :)

Changes in v2:
- Rebase on top of 6.8-rc1
- Remove patch with runtime detection of tlb caching and debugfs patch
- Add patch that probes Svvptc
- Add patch that defines the new Svvptc dt-binding
- Leave the behaviour as-is for uarchs that cache invalid TLB entries since
  I don't have any good perf numbers
- Address comments from Christoph on v1
- Fix a race condition in new_vmalloc update:

       ld      a2, 0(a0) <= this could load something which is != -1
       not     a1, a1    <= here or in the instruction after, flush_cache_vmap()
                            could make the whole bitmap to 1
       and     a1, a2, a1
       sd      a1, 0(a0) <= here we would clear bits that should not be cleared!

   Instead, replace the whole sequence with:
       amoxor.w        a0, a1, (a0)

Alexandre Ghiti (4):
  riscv: Add ISA extension parsing for Svvptc
  dt-bindings: riscv: Add Svvptc ISA extension description
  riscv: Stop emitting preventive sfence.vma for new vmalloc mappings
  riscv: Stop emitting preventive sfence.vma for new userspace mappings
    with Svvptc

 .../devicetree/bindings/riscv/extensions.yaml |  7 ++
 arch/riscv/include/asm/cacheflush.h           | 18 +++-
 arch/riscv/include/asm/hwcap.h                |  1 +
 arch/riscv/include/asm/pgtable.h              | 16 +++-
 arch/riscv/include/asm/thread_info.h          |  5 ++
 arch/riscv/kernel/asm-offsets.c               |  5 ++
 arch/riscv/kernel/cpufeature.c                |  1 +
 arch/riscv/kernel/entry.S                     | 84 +++++++++++++++++++
 arch/riscv/mm/init.c                          |  2 +
 arch/riscv/mm/pgtable.c                       | 13 +++
 10 files changed, 150 insertions(+), 2 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
