Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D1DC52D7C
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 21:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TlmLOgFNDvdddeMZ2T80cMJ26CCwWseRoM3ii64CBA0=; b=44kWPJp1BKzqQD
	xphneBdCRrLNUqbXWzp8rOC6uClZYCxVDrjJg92pbg1D74H4/MQfjRSliPmQyBWZO0Ip04NIJJCrQ
	5+lr3Ux8valfaoEg60MjoVHC5mc2duBkyW0Min5dEgWJNJLdNlp/v++qF/f6+mhNe3NNjP79oJH8h
	71/wxUi+HP64Wjoluz7M7rnrJMxntbIUrg3V/5+/LDZzNqhSItvXyyI2KRlmcGEIRZ4BJ4tdKz0sH
	sj4D4Mf/VdDQsgRIqY7cKrrMHkNIlFxQkzPt/PIn+s063rCly5Ed7nCGwBPBloZoUryWYTUE5/qPa
	P5+7mCRXoRxoQ4VVZ8oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg9tg-00000002yyk-2410;
	Mon, 19 Aug 2024 21:26:40 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg9td-00000002ywU-31wN
	for linux-riscv@lists.infradead.org;
	Mon, 19 Aug 2024 21:26:39 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-712603f7ba5so3828506b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 19 Aug 2024 14:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724102797; x=1724707597; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s43X7evCjKi9zInSsUCIPGJsRlY2xGUJ2ODl/cGyTuw=;
        b=V1zT1XgluIzRGvaRCVbdnaq2dqCgUXcU8MMpaB9IzZCENZp66gjuM8BrNDiKiTpDc0
         A7U8sQLlmH+WprwV65blc9ktt4eK/AfGzkN9sWo0bz5N49yxKZQ56l/mdLL1qm9Up0ul
         YH5OBAwqjhuQIaNtfc0aCc6sw9ZXnzdFggq4Oc02RKLRnTiZQuNykS+d3vBhyaPtdxRw
         rGIn3lxPe7AT+x9N4hSKugCGm/efgzOyK0We4syU9BvvM87Qf2ywggmqnh8QfHcGZ6nG
         sIpwyawbywZKR5KKK8OK18CYbQMMxpzF9ljCEnoNXZmQrsYyZvcflQA23WA7W5fqipDY
         ZnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724102797; x=1724707597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s43X7evCjKi9zInSsUCIPGJsRlY2xGUJ2ODl/cGyTuw=;
        b=CJcyRpvsYfbg4HNfvlbO5ibuBhRrSedRADyxQUIh68fS5vlgZyaBTk9+7lse21WXcZ
         Tk1dR91+X5+6edzyTd37PNH6wdtvgFpDY24OlAD5orDFU29XP+CPdWXS5+FXI5dZuQhL
         nsQKfsvWhVb/Z8ikMdWp0V7Axkd0MQCYnyxSu49aWKS1xIbV/Pl7UnyM23pgrXT7uVGR
         H0Yfdsw37/gSXLLMEfTe4Jh1xWTbDw3z23o1YGFDA7ASbOzdzl5rXGayWBDW+ZehQpgd
         ofQdbrA2uSE74euffGFsavYG+f+ZpCdNpT5wniD48zil0+jKlQuGABFczlCc8E59fLW3
         6WBg==
X-Gm-Message-State: AOJu0Yz7IBt4te6lLsVeMkdDU4dLfbERyT4p9DvUY/DRdyLGz/qhd8ZL
	Du9ZHyQIlqYmXdQlbWMdMBxXM8re4iSOU3+BEf2nopDEzeogDcVyKKhubxlhdg/M9wJNroAKP3q
	N
X-Google-Smtp-Source: AGHT+IESrilsqeNFnuhHuDg2m5x2ld10lJLnQAZcYJQoTxOQaJmA8uC159f9B38i0ENzTWeHkfim5Q==
X-Received: by 2002:a05:6a21:2d84:b0:1c4:e0d3:9637 with SMTP id adf61e73a8af0-1cac8fbcd34mr520343637.52.1724102796643;
        Mon, 19 Aug 2024 14:26:36 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b61e7bd1sm7004694a12.53.2024.08.19.14.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 14:26:36 -0700 (PDT)
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
Subject: [PATCH v8 6/6] RISC-V: hwprobe: Document unaligned vector perf key
Date: Mon, 19 Aug 2024 17:26:05 -0400
Message-ID: <20240819212605.1837175-7-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240819212605.1837175-1-jesse@rivosinc.com>
References: <20240819212605.1837175-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_142637_857851_5662C7FF 
X-CRM114-Status: GOOD (  11.43  )
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
V7 -> V8:
 - Rebase onto fixes
 - s/RISCV_HWPROBE_VECTOR_MISALIGNED/RISCV_HWPROBE_MISALIGNED_VECTOR/g
---
 Documentation/arch/riscv/hwprobe.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 85b709257918..ea4e0b9c73e7 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -274,3 +274,19 @@ The following keys are defined:
   represent the highest userspace virtual address usable.
 
 * :c:macro:`RISCV_HWPROBE_KEY_TIME_CSR_FREQ`: Frequency (in Hz) of `time CSR`.
+
+* :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF`: An enum value describing the
+     performance of misaligned vector accesses on the selected set of processors.
+
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN`: The performance of misaligned
+    vector accesses is unknown.
+
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_VECTOR_SLOW`: 32-bit misaligned accesses using vector
+    registers are slower than the equivalent quantity of byte accesses via vector registers.
+    Misaligned accesses may be supported directly in hardware, or trapped and emulated by software.
+
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_VECTOR_FAST`: 32-bit misaligned accesses using vector
+    registers are faster than the equivalent quantity of byte accesses via vector registers.
+
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED`: Misaligned vector accesses are
+    not supported at all and will generate a misaligned address fault.
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
