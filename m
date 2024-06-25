Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31683C2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 15:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iLdzbE4Q5YwWkJnqiHAX2DyAEOtNrl5BuZ1jyS51aTY=; b=CatEkzI6xpdF1i
	BSwhJiMrk067TppxjRfoIxJBpvz79VBQ95cAmhPkxIdx4w5XPF7v7KDo3TBikqLB71PB5V3ce400J
	MKy67z08308415r0CEWCktKRVqH+RiHjY6Bfe8AA+NWbS8mtJdV2lZ3pPZpJ/ybXh+CPwKQxCzqKQ
	cwhwE+lwU6YHQ/c0P7DfX5a8Yo/cc+lw6W/3SZwXSiUZAHAqAYHcCqshncbBeTJhE3satsNs1QFxi
	566r6YY0oezqcTCY36/+n9DaDK7gCbgBdBKFOpZxo4Kuxk4s0NGm7zPLxfNS8mi26z8OGnn0kEbPG
	5tibOKKid5mxAKMNyTZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7fr-00000003JkT-0KFy;
	Tue, 25 Jun 2024 15:01:35 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7fV-00000003JRM-2ax3;
	Tue, 25 Jun 2024 15:01:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8B1E0CE1B7B;
	Tue, 25 Jun 2024 15:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B79FC4AF10;
	Tue, 25 Jun 2024 15:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719327669;
	bh=TLqYNWudouYZxLvdqWlChA6sggy7uu0Dwx9vwrb4VlA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UlQ6TOIX5U/4oKhEYjjToTqMk9dhcx8quYDFp8K0sioj/tbOYeCCXfVrd96oczp8z
	 Q0pQ1AEPE7/HiIy4iLFB5K7j5ibW0DWVokTzX4lE65DjnZTxPuLIEonL3nXQHZo4wb
	 I1UJpZGPwwry2LnPeMsiR4GEMN+zugwHkF83hfkYU8H4IXeLNzBw13xm9v08eRsvXH
	 o2UnnQAkyjFtDHERdOf7OtR/mv89YzeejZ1SfVXzTUUNH+mqa6o4P92D1jIP5EgTu/
	 wa1xvOncxWbLm85Mi336N62dGPkN48DTMsPDIWS/7EieOqRHewAkc+v7shYz7cTJ2Y
	 S49TMB6XfDAVg==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 25 Jun 2024 15:57:32 +0100
Subject: [PATCH v9 04/39] arm64: Document boot requirements for Guarded
 Control Stacks
MIME-Version: 1.0
Message-Id: <20240625-arm64-gcs-v9-4-0f634469b8f0@kernel.org>
References: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
In-Reply-To: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
 Shuah Khan <shuah@kernel.org>, 
 "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 Ross Burton <ross.burton@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.14-dev-d4707
X-Developer-Signature: v=1; a=openpgp-sha256; l=1706; i=broonie@kernel.org;
 h=from:subject:message-id; bh=TLqYNWudouYZxLvdqWlChA6sggy7uu0Dwx9vwrb4VlA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmett1Wk4bVcZOcqjYz+jP+BA1iZz4W5DlLa3jsX37
 CNbJR56JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZnrbdQAKCRAk1otyXVSH0PzkB/
 4mz1VzfKV2IStH+P2yx6moJG/TRBVMdnGiYeYEGpCKpfcS9fvAUUa+UcXCtCzkp6kwSyxHpNEH1t5W
 YF4qIhKfZK6ckvcyKEOjNRfTC201wS27OPawQmtGg9vUVLxpqvVXuUbk3ogailOroPHmLUqVJuyCsl
 3IUNWQ8gBTfYiBHY1hM43UNn0TlRByOSPmRBK+1TYhSXjtiTb/Z3qOdvSQezoQaOaN7eRBUIKtkhgn
 Rxd9FaiCF5v2yyEsMNB5/Dzu7pQQZulY0aNKv0PmF4ir7jQ12xzbj/eBym76YS0TSBWH1pLhCjjN0d
 qgro1ApVVUoCz8Ybcj1G+v6E3ZNxhP
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_080114_344322_B6498971 
X-CRM114-Status: GOOD (  10.23  )
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

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
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
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
