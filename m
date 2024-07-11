Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FB0C3DA45
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 22:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lTu7XT39MgvpBA0J6Gk4IOXvJ8xCwfOU8PgXEe/aBYU=; b=hR2A7U6OXkWuk9
	t1NymvnWUFErP7X+rXUIbE+Aht2lJGZpKR8Xows1UtcVz9Oy2QGrfRYS6/GOcEqUlVEknF9AOeNnr
	d4rKKU4bMies8vm1apuZ9fLJcSK4aK0YIQHAO45YCFUuQIA+ePnvJRwjzxCnzP4cfPmeVwcCTW6Ja
	DrMsV/y96sR6PhZKS1nDjvKmHNNEtt3q3a32Dmp5Rn0v28A+sXek35CzDeyhHr/cbp8wT0E39huSc
	TUYLM/TRw8N4npAPZQvDZadOKyFTizlxZroZffMoZTxUkBTivNjja0wxkx17Mlg1ztymJDF+UlmgZ
	Zk5h9v+X9tTdd1E65+mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS1qO-0000000FaKF-3qY0;
	Thu, 11 Jul 2024 22:00:53 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS1qM-0000000FaIb-0vIj
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 22:00:51 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-25e0663de76so618391fac.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jul 2024 15:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720735249; x=1721340049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/pkJ+CYoKZVnlzYRMEGQL51DBzuBqhU5kxPKcWTdXk=;
        b=WQ8fVXvjCFhMeNw/DQ9scSYDn9meTDv/6sQnwVh2q2jpPpe/Vmog97luFuj328yrdG
         Zq+304BN46zdtwflgQ6pLPm2Mux9SxFYoUrq9L5EDS2h+5YfyQBr8Jn/EO0B4gFQ+YNW
         +d+6jMjl7h4PvATvLS2BrJ+zn3Ej70N9inUSXDM7K1HLnrzr156rvxyH6K4Ez3Z9zPKA
         qDTyWnYV/DxQkEZfJGMylALQHaWArVy1wtDpGz1OHIo4NsLBJOcTrLXw+v2Ku/oS6xHg
         eQpiYqeBWSNgcH8I5PbduacjDI4mqE9nDu656bNEA17DpwGakPp+JhdwuAAcr2KbYavl
         +VcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720735249; x=1721340049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/pkJ+CYoKZVnlzYRMEGQL51DBzuBqhU5kxPKcWTdXk=;
        b=GpHiZlmkyES1kcnfwYN8f9Hs+hhtWt01f9v7djwxLGrY189kChyq81Azc2hyeMg9jQ
         7PBQnej7UnTr1P/mF4oUjTybpRSWUGoPSs6Lp/K1WXGuz+DieiIsY5d47K/tNlrVc5a3
         fLCIz4Zw0BuSetksONU1CwIkEDMYnu0RwU87rzTVytOVaGyzlP41X1q28yBU30zESozP
         voEnRShsVhxDh3uzwOfgh09HTT/Kd9Gxw4osIeBFSqbgrW+378DN3UIK5R9JGpFukdBI
         DFmN0JanfUdvCjBvsm24/M6jhQACBaV20Qe932KvoRL1iGGJUttk1P47/3sb1AM/Z30Z
         zfgg==
X-Gm-Message-State: AOJu0Yxg//QJCpWito1KplwBu9sPZYQl1t8hoNID9qVTR3wrhk0BFB2r
	wKUdruPfMhZi0BKyNkQBhJLlJDE6hmCqUr7JdDUJbS+AVYr2YHOklqSSdVwFiblBuBVyQwMNslN
	0
X-Google-Smtp-Source: AGHT+IHeT6FLUowuVFqR9T9fPR4cUTBZzugpJS7X9OZIU/p57BGSiUAt3X+LIR8D5UvHFasnlUUxXw==
X-Received: by 2002:a05:6870:9a0c:b0:254:a009:4c2f with SMTP id 586e51a60fabf-25eaebdf9e8mr8862381fac.37.1720735248677;
        Thu, 11 Jul 2024 15:00:48 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b43898b10sm6169431b3a.7.2024.07.11.15.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 15:00:48 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 7/7] RISC-V: hwprobe: Document unaligned vector perf key
Date: Thu, 11 Jul 2024 17:58:46 -0400
Message-ID: <20240711215846.834365-8-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711215846.834365-1-jesse@rivosinc.com>
References: <20240711215846.834365-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_150050_289812_92E441C9 
X-CRM114-Status: GOOD (  11.67  )
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

Document key for reporting the speed of unaligned vector accesses.
The descriptions are the same as the scalar equivalent values.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
V1 -> V2:
  - New patch
V2 -> V3:
 - Specify access width
V3 -> V4:
 - Clarify we're talking about byte accesses using vector registers
 - Spell out _VECTOR_ in macros
---
 Documentation/arch/riscv/hwprobe.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 78acd37b6477..f83a13dc4cbc 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -238,3 +238,19 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
+
+* :c:macro:`RISCV_HWPROBE_KEY_VECTOR_MISALIGNED_PERF`: An enum value describing the
+     performance of misaligned vector accesses on the selected set of processors.
+
+  * :c:macro:`RISCV_HWPROBE_VECTOR_MISALIGNED_UNKNOWN`: The performance of misaligned
+    vector accesses is unknown.
+
+  * :c:macro:`RISCV_HWPROBE_VECTOR_MISALIGNED_SLOW`: 32-bit misaligned accesses using vector
+    registers are slower than the equivalent quantity of byte accesses via vector registers.
+    Misaligned accesses may be supported directly in hardware, or trapped and emulated by software.
+
+  * :c:macro:`RISCV_HWPROBE_VECTOR_MISALIGNED_FAST`: 32-bit misaligned accesses using vector
+    registers are faster than the equivalent quantity of byte accesses via vector registers.
+
+  * :c:macro:`RISCV_HWPROBE_VECTOR_MISALIGNED_UNSUPPORTED`: Misaligned vector accesses are
+    not supported at all and will generate a misaligned address fault.
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
