Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18860C4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 15:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MpRNc9Qk31B/of84YeFjDQ/UT0tCPq0K2IG8WgH0z7I=; b=PIKIGKrQHlSbCp
	KMcXGlBgIRzlmCU43NyC4aNVqhHrNgRNK2FX3byzMwp1IYIGm/CQ3EyIRi/Hn7Xh5mDM2kmEtKpFF
	9bhkEebK24rgF4ClwjU9ewGgrHsPcA/RZd6rWn0brG+183IgoEm79wKyyoLZ2I06kSk4vlmD842FM
	1SuaU+ut4i5uRnJBEFaSChFOVj1NAXU1+kUyrusunbOGIoSTJ1/RQZHED0YehAZvfAmTWmYZD3vjj
	KQD5WdzY/SSajJEX3YNDmZrrEhj/M8YMxM4khdVlXHHJ4jp+ivpXiIXCRbyEQ0Cy7UHDw8AvOu9Ug
	oslpkheZTIZhz2KzBhNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBFux-00D6n6-2Q;
	Thu, 07 Dec 2023 15:03:59 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBFuu-00D6kY-1o
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 15:03:57 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40c09d0b045so12651455e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 07:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701961431; x=1702566231; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nzUGYpwYAIocf74DCpTux4YFllX1H7F6zPZyiGHWp1Y=;
        b=n5PnaTbYcOjxlJtXr0Wzui4D5XPX6Ex9vG3FHND3+KtCIiR4MyNYpZui/Pfce2uGaH
         3nplRcEi3UQkGNQHTl9L59UCIrQjXybOQzpDOFQRo1ajpCo1FAx3YzrHi09tddRzzbGf
         CoE/BCt8YotR7N2o206kneFISUWy8CkcWAfIUdnNXFR9H0VPETRd3f2reMpXZGw0zqIQ
         OpQJLOJcmwrvk5/0LXUhgoUSMNCx7y+t57Nnri+9SB1gZKcbyZHoErVmvVvjgJzRR8O2
         qMo1kL1AiAWuZW9YzcNkqkzQRDjbPTPhVDikefJ9HQVN4m/IrEvOpKlEgIMTyUKFundA
         +1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701961431; x=1702566231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nzUGYpwYAIocf74DCpTux4YFllX1H7F6zPZyiGHWp1Y=;
        b=a0nJHFFWb1BITFuLwY5gQMM9a1+ZGNpEDNG6r3tJ4ITGHXXMzAE98qCKBXiNN0rop7
         gtVYKPQpy2uzEtIc15EZD/brH8bdqmAx7iyDgjD8D7zWJnoS2xZvuqhio5CgsCkpVxnK
         qOM5sz4L7NfvJA1Vfhops58iEX5IKj1DYNbTi7ZG/QXIka0dRbBjJ+RK+dJ3EjJVK8nC
         jAhBU9TSJT2oHCbj3n0wog/aqgRB23u/zzCSsTOshQsxyyRcp7cONTyQfSq8hflOf+Me
         VAAQy0hCuduMF4boPEtcg1KKHbYHfekOKPdmfKg11gzw8lmaRb1+vVnMOrTwACAd+ZxE
         SDEg==
X-Gm-Message-State: AOJu0Yzb+bXnX/6st8ymfhQGqyvdNq4tMI9/hNTqZSj89r7IujNyX5eH
	AzWDd4jyP1EvfAwDPsm3Rkmwqw==
X-Google-Smtp-Source: AGHT+IEfU8bcWPltllq4UxddBOusN19bKPp7FZtm1tNb3JVSGuXfSF/1fbnNg3hbcLptFO8P4+JaSw==
X-Received: by 2002:a05:600c:198b:b0:40c:5ee:2dda with SMTP id t11-20020a05600c198b00b0040c05ee2ddamr1118146wmq.177.1701961430948;
        Thu, 07 Dec 2023 07:03:50 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id u13-20020a05600c19cd00b0040b42df75fcsm2187533wmq.39.2023.12.07.07.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 07:03:50 -0800 (PST)
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
Subject: [PATCH RFC/RFT 0/4] Remove preventive sfence.vma
Date: Thu,  7 Dec 2023 16:03:44 +0100
Message-Id: <20231207150348.82096-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_070356_598800_97C1F46D 
X-CRM114-Status: GOOD (  16.65  )
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
  patch 1, and this also fixes our fragile way of dealing with vmalloc faults.

- for new user mappings: that can be handled in the page fault path as done
  in patch 3.

Patch 2 is certainly a TEMP patch which allows to detect at runtime if a
uarch caches invalid TLB entries.

Patch 4 is a TEMP patch which allows to expose through debugfs the different
sfence.vma that are emitted, which can be used for benchmarking.

On our uarch that does not cache invalid entries and a 6.5 kernel, the
gains are measurable:

* Kernel boot:                  6%
* ltp - mmapstress01:           8%
* lmbench - lat_pagefault:      20%
* lmbench - lat_mmap:           5%

On uarchs that cache invalid entries, the results are more mitigated and
need to be explored more thoroughly (if anyone is interested!): that can
be explained by the extra page faults, which depending on "how much" the
uarch caches invalid entries, could kill the benefits of removing the
preventive sfence.vma.

Ved Shanbhogue has prepared a new extension to be used by uarchs that do
not cache invalid entries, which will certainly be used instead of patch 2.

Thanks to Ved and Matt Evans for triggering the discussion that led to
this patchset!

That's an RFC, so please don't mind the checkpatch warnings and dirty
comments. It applies on 6.6.

Any feedback, test or relevant benchmark are welcome :)

Alexandre Ghiti (4):
  riscv: Stop emitting preventive sfence.vma for new vmalloc mappings
  riscv: Add a runtime detection of invalid TLB entries caching
  riscv: Stop emitting preventive sfence.vma for new userspace mappings
  TEMP: riscv: Add debugfs interface to retrieve #sfence.vma

 arch/arm64/include/asm/pgtable.h              |   2 +-
 arch/mips/include/asm/pgtable.h               |   6 +-
 arch/powerpc/include/asm/book3s/64/tlbflush.h |   8 +-
 arch/riscv/include/asm/cacheflush.h           |  19 ++-
 arch/riscv/include/asm/pgtable.h              |  45 ++++---
 arch/riscv/include/asm/thread_info.h          |   5 +
 arch/riscv/include/asm/tlbflush.h             |   4 +
 arch/riscv/kernel/asm-offsets.c               |   5 +
 arch/riscv/kernel/entry.S                     |  94 +++++++++++++
 arch/riscv/kernel/sbi.c                       |  12 ++
 arch/riscv/mm/init.c                          | 126 ++++++++++++++++++
 arch/riscv/mm/tlbflush.c                      |  17 +++
 include/linux/pgtable.h                       |   8 +-
 mm/memory.c                                   |  12 +-
 14 files changed, 331 insertions(+), 32 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
