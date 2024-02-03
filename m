Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B207EC4828D
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Feb 2024 12:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3rdexO6dYLu3XbDk4htVjSiQHD+7fnHwLaEGdVGhLzY=; b=plznIF8Zq6qRy2
	0Iq9XVPof2fDjExhbb/HG+70GQHUwgWwdZUPi1+5cEr0vJyPiyUxIFB96JxwHpeaCabAltidlmF5V
	NO8hH7DS5k/aePL/A5drVLbHAHqZ6XEtYKtbZ3pzsce+C47DEaC13EMcDnq3jHNao0mtpysoc968w
	hw1KoyhBnpP0YVB1MhMTu1+KmVRYkfQKDzXxuRP9IuBiKu46NMkOiM2tyB3v8O9Ji8YCbgGK8Vwnd
	u3B5I2ahU+XG6Lxw3TotSiTz+fujoMFGIYFW6/IBu5/njKg9iQH2VSmcF0yUsnvEhYzHPTq6/2p5k
	hvRDJSTH5kvRMB7LXkvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWF8O-0000000GHw5-17WT;
	Sat, 03 Feb 2024 12:28:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWF8K-0000000GHuJ-0Uzi;
	Sat, 03 Feb 2024 12:28:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 57F65CE1F0C;
	Sat,  3 Feb 2024 12:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D8ABC43390;
	Sat,  3 Feb 2024 12:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706963306;
	bh=Z3injfV8td0LqFLeGew+/6AX1Y4kpAJIpTs5MPlZTRs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mqlIJ5g3tl5q0vYK7ykUXUM8Tc+tv8rON+LlVXaOXLZkci6RbJ9fIy9D+0L3q7RZE
	 LNE4wWCXSxPrW+6yc449KPyyth2xlowITE1wQPdj9VVu14q4p28fH6+Mr/dcOpooOb
	 BbEVSpIijcUScCJRz0nwuXKIusgNuQtMB02ImSKBl+XJwLtQ3oHiZv0JTqosJnP+BW
	 vVz3wocrNiQnKimT9yoE4DaY5NZfLqfpeiSu3Mb9VHmwvHRJOGxxextL0Vny9D7SQt
	 gGZECkE2b9Lri6+3C5cMXoGpJNtp9oXBohTewFa3e/ub1biMSTSfmS2n0YRloz6YyT
	 PQqWESBoDqKPA==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 03 Feb 2024 12:25:30 +0000
Subject: [PATCH v8 04/38] arm64: Document boot requirements for Guarded
 Control Stacks
MIME-Version: 1.0
Message-Id: <20240203-arm64-gcs-v8-4-c9fec77673ef@kernel.org>
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
In-Reply-To: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
 Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, 
 "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-a684c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1640; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Z3injfV8td0LqFLeGew+/6AX1Y4kpAJIpTs5MPlZTRs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlvjDUsly811JO8MY9VKwAyipGXg/WYYy7DrZJ9PfF
 WUTZtWCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZb4w1AAKCRAk1otyXVSH0Cp2B/
 9ZbiDjwSsFZbMG4QBc+H/K8vKVC04W/sEbxEueoW6RvocX423DsgVKt7TW3y4gTB9CNsk3bfhBpSJy
 6Ade2Y1WKbQ8UudQ6Q46T26n3UDyrCs+lO5Ity3TveBReAWASeqybFoYtghSJjhoomY3nitWgA805k
 L7UsEzNP/UsrMpJz13RSBlmn74EryWZcdDt0milhnxX9Vqz/uyKUjQnYUghRBg+gp4joxeRK9ZJH5A
 V7SJkdsQX6g3OWnLAUYwC5zljMqXzEGptSSf89vn4Fg8NoQPePUIgsU6RQ6Ebg2hlmb8qTSvHBEJ6p
 pwKlr8cYsYxj5L+KGlC1UFZ6mVJsri
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_042832_517638_10770423 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

FEAT_GCS introduces a number of new system registers, we require that
access to these registers is not trapped when we identify that the feature
is detected.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/arch/arm64/booting.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index b57776a68f15..de3679770c64 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -411,6 +411,28 @@ Before jumping into the kernel, the following conditions must be met:
 
     - HFGRWR_EL2.nPIRE0_EL1 (bit 57) must be initialised to 0b1.
 
+ - For features with Guarded Control Stacks (FEAT_GCS):
+
+  - If EL3 is present:
+
+    - SCR_EL3.GCSEn (bit 39) must be initialised to 0b1.
+
+ - If the kernel is entered at EL1 and EL2 is present:
+
+    - HFGITR_EL2.nGCSEPP (bit 59) must be initialised to 0b1.
+
+    - HFGITR_EL2.nGCSSTR_EL1 (bit 58) must be initialised to 0b1.
+
+    - HFGITR_EL2.nGCSPUSHM_EL1 (bit 57) must be initialised to 0b1.
+
+    - HFGRTR_EL2.nGCS_EL1 (bit 53) must be initialised to 0b1.
+
+    - HFGRTR_EL2.nGCS_EL0 (bit 52) must be initialised to 0b1.
+
+    - HFGWTR_EL2.nGCS_EL1 (bit 53) must be initialised to 0b1.
+
+    - HFGWTR_EL2.nGCS_EL0 (bit 52) must be initialised to 0b1.
+
 The requirements described above for CPU mode, caches, MMUs, architected
 timers, coherency and system registers apply to all CPUs.  All CPUs must
 enter the kernel in the same exception level.  Where the values documented

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
