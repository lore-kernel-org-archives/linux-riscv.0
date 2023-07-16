Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC41C001B0
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jul 2023 21:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3rdexO6dYLu3XbDk4htVjSiQHD+7fnHwLaEGdVGhLzY=; b=Ks38UimQKKhcHG
	y5HpFozk6g/iLkLJwWugyjUJJz3g/Ygt6s+sPy6CRaT3sIWClxvSNwsyBXQ/pXOXiICwe27Qrloo2
	KxK/v7coKPh1b1xOXkDdsFdQHxuhtlkhcsYLShVrRvLKlisIMY3lteCHqiVV+0ntnsJSROL0n3Px+
	fn7YMCo6VSoTcdN28AuptCf2t2MBtWGDsqVu0BFZcaGliYlt09mqz79PWD3HRxvMd9UocE0iMcoz4
	hW7yLe3toZfKnUIz1IQf7Lqc6NedfQe8L41ui489tSP1SR10ExGFgu/5ELGdbz0Jz9ikIM0TI2HMg
	jObYtBkGxNOHMFI4N7Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL9gh-00FrwA-01;
	Sun, 16 Jul 2023 21:53:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL9fx-00FrS7-2l;
	Sun, 16 Jul 2023 21:53:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 10A5160EC9;
	Sun, 16 Jul 2023 21:53:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4103C433C9;
	Sun, 16 Jul 2023 21:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689544388;
	bh=Z3injfV8td0LqFLeGew+/6AX1Y4kpAJIpTs5MPlZTRs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N+Py4rEKJjLcKslfUQhgfO1OLzM2rGuwjpOszMNXo+y2NlpsFHeY3dbTRq/heqKTb
	 wCotmXx42Mh4PFe5yqcrpQXV5HgTXSOOBEZ0RghiFHyfOaEpsg06fHhTe/tHw/6OcC
	 BTi00ukC4eUl1XRMgUsAcmJBP7sjQxXyLeTfrrXdgYTCff4OLLtV6gVZjP8iCXVcKB
	 P6nPf6DSHHfQz0nOcp8DDAG7JTMQcPwLVb6A5VLrHSwjq+I6/Q3R2TD5f/rPdDi8zy
	 3R8S3ECtvSSDliWtVW2gcieOb6yEb9YfvQqE8rjxrvgADtdRuLMv9zHcIhdhHgr48K
	 TLshLQx2OIL8w==
From: Mark Brown <broonie@kernel.org>
Date: Sun, 16 Jul 2023 22:50:59 +0100
Subject: [PATCH 03/35] arm64: Document boot requirements for Guarded
 Control Stacks
MIME-Version: 1.0
Message-Id: <20230716-arm64-gcs-v1-3-bf567f93bba6@kernel.org>
References: <20230716-arm64-gcs-v1-0-bf567f93bba6@kernel.org>
In-Reply-To: <20230716-arm64-gcs-v1-0-bf567f93bba6@kernel.org>
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
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1640; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Z3injfV8td0LqFLeGew+/6AX1Y4kpAJIpTs5MPlZTRs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBktGaRKKWoYO6shp83J7bdF2HDjv/deCuL6Bh7YBpr
 XGGHoyKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZLRmkQAKCRAk1otyXVSH0DHnB/
 4m4xAjhCNKrOG833NrlQvIqQ8SUd4K5W5qh5Ps/ZgIVd+0dZkeIAFcRu2fAfuuHQl4Sg+SRkRdWPge
 eeiRzTVTFyv2RXMEQOPvtv1m5NUn4oCojVB4hywZSC/rE9XrRGNDjGZyEOO2ylprq2nf3mDYWjstJh
 9jCBGUEEhqXr1LT17uFMA1zEsO7JJeQ33aTE6kDdjYlBrhTZq43pRfEROGeW7Dhgjx3sd6KCVltGCU
 WGPGxd+7M83m+GVw87chK92IZYO0+Fe1tKdfMfbfNslHg415niWo8ao4Tm76iYPut036lAZhbttboW
 zekDSpXoOfhPseiRPDqOQA1eWCZErE
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_145317_218636_91BFA8A3 
X-CRM114-Status: GOOD (  11.42  )
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
