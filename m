Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0959C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 16:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d4hWm0JuS0Rdf2csJgGRlf6nO4VEpIERF13GQxO7Vdo=; b=qy+753BozxxNuZ
	AoG+IHY7UpEdH1OF+1Tii4VAfc5GJa8+vqVBsCTegukAvUDSqkjJExt0dg1iiqZYMLgAw06Z13GQx
	GuSE0JM3GOPj8uBnKjADYqamBPxTzL6nTDosni9IybR+TbqcRLpcQi9to2RcWdbgO2v2hi7fWhkU6
	JiNwlTo8PaX3cLEfXpifVSmuX1fyEbbMb8cYvFHOeJlaE4KpcS9QnLzkdsnKkVBjiGVlp1075lOeR
	2svjn/LBMLL2QT1m7EJ5V3nKnhxGAlPru0RMKs9s57BWRCA/plfh+2A9q2ECSlfpujYnuIR6wOIb0
	PQXaDEkiViYTXlrtTXtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXNxF-00000004RAk-3lHB;
	Fri, 26 Jul 2024 16:38:05 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXNx9-00000004R5D-37Fg
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 16:38:02 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7a0e8b76813so777818a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 09:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722011878; x=1722616678; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCBQVSPRYPBIeQ5EoC+hl2LHpusqOR8yThszxhSpMg8=;
        b=3EUYnIHtuszzc+jeG3O3nal8sWExSt+zW0gZO1lvZXDb2/GuTPrqe0ejNfn0OwqRZH
         AO1PqDlMc073XftblvTQgI8tQm3GqJ67cFrY2m5GJIK14fuiimgNC9aV0GSrA6t2Lvxb
         JRzUgtqt8PvRT8Chb9FWkuuEBI2XNcJAcWjLIqjf1fSn3PISSqS8tA5yv1TKxsgwD8pP
         3ZvTpfCOppioKoV9/Q9gVnoMtoIeIlOGwJ/CKd9pZKSyFIUdC1dfNBssjr9YXD23wvZs
         BEppKwEOay05fpbUKjj6eko9ocZuvfpeoImDIoeYWHQIdzfQNuzcGQWy4zvOvvoRXWig
         huyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722011878; x=1722616678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCBQVSPRYPBIeQ5EoC+hl2LHpusqOR8yThszxhSpMg8=;
        b=vx5szjfhFGomPRALiXeu70x6G3eEy5jikHC/Ye2Fu/wCA/aMe6y/qXzxy2hD3rCysD
         UPHjF/4LBt+4MP/9Ru1p/FBNjxUzrMZODrPPHios4Drw7O8o3S9kAKVvEu7pI53J4UTX
         wSxHUmAu3N7sXLcvy8NrzdrFYqcRvWfEh7UKAcRS2gEI6UYobfBIE5auYJKahEMK5tDm
         BG9OkA2EXUrqupzuJvYltgaJVWYudYIu/kIlb3W8Ix8fIAAWhx7IsukQB+X1Kmc3CvjG
         Fh04PhFWAPTjyQXgNDMEqijyhPcamGvRbSb2BoQoWIffs2+mf5LX3jTM+ya9/qAWNGrA
         yhSg==
X-Gm-Message-State: AOJu0YxNvldMFiBemKHRwYT89LJgENcERvgVIxLM/COYv/AAcxScy4lF
	267yC8niEBxtpFB4Vhy+LEwVajWOmzpkv6I7RzVKjyI9EsWI2EPDQ77k/qXxY54oUvbsl8nwDfV
	e
X-Google-Smtp-Source: AGHT+IEXYMNp7r6J/EYXhRPF4svQfnFw/pxaQt/HnMEC+56U/jYOIE7D/L1AibRAOg2CvPdeVu0dyA==
X-Received: by 2002:a17:90a:d98b:b0:2bd:d42b:22dc with SMTP id 98e67ed59e1d1-2cf7e868df4mr14654a91.43.1722011877991;
        Fri, 26 Jul 2024 09:37:57 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cf28c55a2dsm3676619a91.7.2024.07.26.09.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 09:37:57 -0700 (PDT)
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
Subject: [PATCH v7 8/8] RISC-V: hwprobe: Document unaligned vector perf key
Date: Fri, 26 Jul 2024 12:37:19 -0400
Message-ID: <20240726163719.1667923-9-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726163719.1667923-1-jesse@rivosinc.com>
References: <20240726163719.1667923-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_093759_969054_6C85E7D0 
X-CRM114-Status: GOOD (  11.68  )
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
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
V1 -> V2:
  - New patch
V2 -> V3:
 - Specify access width
V3 -> V4:
 - Clarify we're talking about byte accesses using vector registers
 - Spell out _VECTOR_ in macros
V4 -> V5:
 - No changes
V5 -> V6:
 - No changes
V6 -> V7:
 - No changes
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
