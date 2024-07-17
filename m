Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C20C3DA60
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 18:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mlp2OI4yJWKCFBP8fF5z+bXyTP6TbFS5MZH+HfewFEk=; b=dWNVFzCrEvwAAo
	rBVMEqW+WqaxJxPFGWrevE5rJQOAVLmYsTRG2LOcbZbVFzGrJ/zPik5VX+G6P+l4fp6D7R2270czU
	QdlVjQlxS5wsASq3TQFcu+kEdXVC7m/NonutWYepaicZdOcBEqaNe+GrPnt7XWvHB7oXpsMW50NXE
	+1AEegIO7/ZuOMXu7kEziZz7PprjF9gonu0FxmmZ3UokN24LcpqhlfCIt3l991pIz8GxvNmOqPycT
	9RLJjiIcAR0l+bZxH8Ugkqs2Ptoy14NLCbIC+e1r3TC8xg2Qd/n0zLy0oFFbHuH+x9XAmQd52TxlZ
	PpIHeSoF8KJZ2SVoudOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU94V-0000000EZDJ-0Rdt;
	Wed, 17 Jul 2024 18:08:11 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU94Q-0000000EZ8T-0ask
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 18:08:08 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-70aec66c936so5205904b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jul 2024 11:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721239684; x=1721844484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUFp3GnkpqVp/y6KcOE20AdjWwwd1sTEzLAAE9pe+/o=;
        b=kn1p9Td3qfe9bT46teBED1KwgZxw/K2vWJsSESEdRzD0ELhuOV67dqq7c1oIur9Aai
         yy+d+FAEB/4DyYWDgeffqItNaHIxFF13u7y8BGRECUw3x/O6wDP3CDwtQQB3ujZ3pM6a
         7u1FDugb3lX2+PoDwVAGW/Y6yu9ySi86p7bLKF8PNT11TCQQs8oquc7oGMV65bKImzZi
         wQmPEKOI8IzJMd6klj/aicdL2mxLCodN9X1zJl+9gYGZc9ktirfwjwb2uqx0fsMMAQoO
         NN+l1j7NAWcOSnIxqKLm/FNo46hqY+0H/hXIF6tZ5GC6plp4PJ4qOyxuoIYagfnIYEBe
         IOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721239684; x=1721844484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUFp3GnkpqVp/y6KcOE20AdjWwwd1sTEzLAAE9pe+/o=;
        b=UyNYFgLVDkNbG1cAejZBfzRhAU0+YCd6Cd1giqogsRRfrjnkGpzh1haikqgnzjYJFl
         ct0TV9Jf/WoY1c468QGJwBD36NVBHxJVzigRqyMrXpJTci0eGGcnPLLSLniUSHLOTdgG
         Korxqpi2lIygbIbC3KsDZfFohJSiH65Lfl/WWrcV8s1CgtnovIcYrCbIwj4PCEFErXZ1
         e04mHhpI8llJr4lwe4VcvD5O2SU7Uc8vwmaNw7flSGtf/3YLctjUeW3X62ELKrKB8Nne
         xNRnx8lhu9GkBTMABg4JsrQeOOSZ/aK3N7vTY3TpujDB3G90UZylyMRpbn5T3Se1Bdlg
         tSWw==
X-Gm-Message-State: AOJu0YzajY50bUgWYS4TY4Z4CAWAOGUPuj52jK38Jzos3o+LhX0bOLXJ
	HSOXVgTEJETR7Vw9C8f3PYNMo8ecbpbxDyTixKkbYDgZ3d0wIpBlCzjFhrWqQiBADfiBWVIH/PD
	r
X-Google-Smtp-Source: AGHT+IGCzRN+87H7T+nEsW8BP2x3vf5mkxVhWhX6d+Y7pZAT7Zv1gHYjbeC67sduc1psIthsVRakkQ==
X-Received: by 2002:a05:6a00:4fc3:b0:70b:14b4:b5de with SMTP id d2e1a72fcca58-70ce4f1ffa9mr2888731b3a.23.1721239684195;
        Wed, 17 Jul 2024 11:08:04 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7eb9c969sm8432332b3a.35.2024.07.17.11.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 11:08:03 -0700 (PDT)
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
Subject: [PATCH v5 7/7] RISC-V: hwprobe: Document unaligned vector perf key
Date: Wed, 17 Jul 2024 14:07:27 -0400
Message-ID: <20240717180727.4180475-8-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240717180727.4180475-1-jesse@rivosinc.com>
References: <20240717180727.4180475-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_110806_404939_B3A0B805 
X-CRM114-Status: GOOD (  11.10  )
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
