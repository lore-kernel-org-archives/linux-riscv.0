Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919F5C3DA63
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jul 2024 18:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dfo2gfofd8qHlGxNIASM3eQQk0NbfCWoWQ7dLJiTM54=; b=aw46tcV9CY3Oop
	aWEmZArvSyPdauSu9pgYi90XEbSJ4E7dzzXwuplX8ZusPLqR1YrCgwV2Pr9S8b2dnvlpnouXVIi6K
	HRHhRwSf/WcqNd+k+q9CsiRGZzobLMWjBLhq1R/2fsMmi9SVsKbFxkO8EqO2nd1y9xfffvwsQ6xgx
	RoEOuILPhXvU7IraRdeYE7DwdivKFpECQ1x9O9AgcBPCOz5x7oSLWSxGc24F3HHMqXAA0LB37CYx9
	s0PkPcm//mUqC29gDWY9L5llMndV43ngE0YG9O2X21W3qGCQyDn5UiPcn6y0C1THi0lRGYTNWM0uR
	wgUCKJAwVKyEjaAh5UZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWgrC-0000000GDpE-3ylC;
	Wed, 24 Jul 2024 18:36:58 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWgr8-0000000GDke-18AT
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jul 2024 18:36:55 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2cb53da06a9so106962a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jul 2024 11:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721846213; x=1722451013; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EB5PDESy6Qo0Jcu13SGskHFDRhed/H4Oxxes6IQLnyg=;
        b=jYXK2tnAG6IgkA3+4SvDtl0eErkTj3esdQh3sxfCRLeAJKpWrzvXK/kab5nBQ5UXG0
         6PbiNkynfP+6C0uyBn/CIBjtuVsUQt5xMbxP3AlZlnwnVj90pFaeaXO1Dc7u6ECHNu0I
         J+XdlHZ7gGMaR57YMJn5bQQioSMuBdtYIfVevJxzxfm4yRYedyrD8Rq6NY/GeHnNSzYn
         NWES/y2yFnQiKb+rVrf8rbHMlZR8OMPbeg0h26wqbBvDBcIvcBGYhUoyYQkF/HQN1s4M
         yh2Ci4M7QhkFCsnGi0ZObM8w98hswLJx9Pqe/84RNc+0G51skX+RQlbiC7fhIjDKkloe
         UZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721846213; x=1722451013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EB5PDESy6Qo0Jcu13SGskHFDRhed/H4Oxxes6IQLnyg=;
        b=ujmnjeDg191ewqKoG/IunT1q16e+eiHRBXvgwpceq+WiLY/ZKbu3T+KjAm+yCHgZr9
         SCcNTzc8X+QQWhfvoCKegNM+Pb0vWpCcJb1JE/WNBYtE8cG6sxyfC9d/i9a+qssc3IYT
         RrnS2U/n8DPwBFE9CEdtAPPGk3ZrYyzm4T2varIU1da/xdxNN2bcitDetOZszEdnrrvZ
         +Ah/zKCm16OMorKth2go8xcvfEoRigElSh6qJNAiOAfWrgVnojNkQ44aYs53L2yEtVcF
         FApLT++Kala2WMbm4fDxRgMH0e0fzl1mUxiXnUwae4rWen2PRsNnLOGEfXwje/ptpX8m
         uNag==
X-Gm-Message-State: AOJu0YxjK7RBS/yFEXRKr2VGFCbyPAE37PzAexNmiuPi9fQfSMYb1XnK
	D/mQtCfJSGqqBOMw4cCzVUIDNW18IcSS+KqK9/HTuEN6wwep3at9bic7+ggCRPlUqx5/vz/6J7V
	7
X-Google-Smtp-Source: AGHT+IFVaKgpzXil+XU1Q9k4O5zrYBjVM25TgY3w5TlHHmjl9+GYW2Lt07senY0UmNriHZYrgPG/Gw==
X-Received: by 2002:a17:90b:1b06:b0:2c2:d6ca:3960 with SMTP id 98e67ed59e1d1-2cf21f48eaamr801050a91.17.1721846212621;
        Wed, 24 Jul 2024 11:36:52 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73a189esm1997830a91.2.2024.07.24.11.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 11:36:51 -0700 (PDT)
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
Subject: [PATCH v6 8/8] RISC-V: hwprobe: Document unaligned vector perf key
Date: Wed, 24 Jul 2024 14:36:05 -0400
Message-ID: <20240724183605.4038597-9-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240724183605.4038597-1-jesse@rivosinc.com>
References: <20240724183605.4038597-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_113654_363114_27CA216C 
X-CRM114-Status: GOOD (  11.74  )
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
