Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC861C71150
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 23:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kUHyc7PYt8uH00IPyXS1OaT8GijmCr7j77p48y2xJ8U=; b=ll0egQL8QViqVz
	fjz5V5NUlGktgIQOA7ZCx/qBo7M5sEw5YjXMylpLEGS8YdSGL/pfwwJkrShnpTUMOeRcSWfx/aq8W
	fCnfCNS91COpqE1F4UKG5jC7xDYuYgoc2B3QSxQ7uorBfsNpmeEvMUNUKk2l7M6dcbqT93o0rWSay
	J+gJa85kJNsuTtIJs8CzWMBFUda7/5SZYY4e5JLawD8Zlmi5Sfu3b+t3Robt0Xy0B+A9hWFI/bsWH
	qeXm7GWd2yxqRXvikbhX5BZO9Fy99hPFqWjIep9nFR4t3nvVd6IJMChgOzf+GOa5Pcu3EK45hSmYj
	aPIcJZ50R6xwlGE7bcbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjSFY-0000000HQTg-0W4l;
	Wed, 28 Aug 2024 23:38:52 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjS77-0000000HMKC-0zc9;
	Wed, 28 Aug 2024 23:30:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2F368CE1708;
	Wed, 28 Aug 2024 23:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F6FC4CEC8;
	Wed, 28 Aug 2024 23:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724887806;
	bh=DQ+/lIqnw5gAspETmMxguFP3SMk6gUYbh+baBR7FnZg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=h6shQglCaEjIfYuTEJECgLX7lmS4cLVxZ5/7WqVoFrdb5D7Ce/hcrxVEtQrj4rVR4
	 CjkXTzUFDxo3k+MP3kYXPiF7Zf6LlOF5zOTZRxyUc6CiD4BGk9Gqkj2tLEQNuY/CWj
	 tVZgYMNHmu1h3WH8kPaRHrEbMwcjJJSHNuOc/HcThupy0uWzseDVB8df6mki4sEV6A
	 dKs8K77IC57vsS7LZTM88azbG+E3gESpYvAIZwASo9QVP+Q5NW/DinIeBkMl1sx7zK
	 o7h6mnPdVrzJBvvAj1oKUMiMLJYm5WiXjkPTu47uIBshlBzAA9biECrUn/MX1JEOok
	 vU57fRaLMiLjg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 29 Aug 2024 00:27:29 +0100
Subject: [PATCH v12 13/39] mm: Define VM_SHADOW_STACK for arm64 when we
 support GCS
MIME-Version: 1.0
Message-Id: <20240829-arm64-gcs-v12-13-42fec947436a@kernel.org>
References: <20240829-arm64-gcs-v12-0-42fec947436a@kernel.org>
In-Reply-To: <20240829-arm64-gcs-v12-0-42fec947436a@kernel.org>
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
 Ross Burton <ross.burton@arm.com>, 
 Yury Khrustalev <yury.khrustalev@arm.com>, 
 Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-37811
X-Developer-Signature: v=1; a=openpgp-sha256; l=1576; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DQ+/lIqnw5gAspETmMxguFP3SMk6gUYbh+baBR7FnZg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmz7KC/Rhk/py2u3sq1Sq6IyAa28H/JCkWwuYqk/+i
 WZjmPvmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZs+yggAKCRAk1otyXVSH0JK4B/
 0c7CeQWbofgjSYjTY0ueVTYCsxmNGC9m3r7+5bju4v637iOCojsNlg3DLCUWyOw3YXzrrbNW9zZ0dH
 0kmVCJ+uifdZ3TJcp7w/fXoNJAyQjJV0aBj0a9Qv9B3oIpvQU9NZMkfeVwQ5+zkVI/u13qRDDpeYUP
 gIDHJXKhQ/cj1Rnz45LHx/uGssDgemHZkNA7x47Ku8ce4ltskMLY955Df6RLOnG98MGgE59Jc0uHbN
 Ox8V5SLtKLryDkZiQfOsUX/zOoZkqlqhox/0UBfebCkjWZJ9NRh7d8nl7j/BGcIZnav+h1LVscipli
 t53+wNbtpeU5VBt7BRlrgDb2TyZMRM
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_163009_750988_596359AD 
X-CRM114-Status: GOOD (  10.20  )
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

Use VM_HIGH_ARCH_5 for guarded control stack pages.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/filesystems/proc.rst |  2 +-
 include/linux/mm.h                 | 12 +++++++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index e834779d9611..6a882c57a7e7 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -579,7 +579,7 @@ encoded manner. The codes are the following:
     mt    arm64 MTE allocation tags are enabled
     um    userfaultfd missing tracking
     uw    userfaultfd wr-protect tracking
-    ss    shadow stack page
+    ss    shadow/guarded control stack page
     sl    sealed
     ==    =======================================
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 96faf26b6083..c6c7454ce4e0 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -353,7 +353,17 @@ extern unsigned int kobjsize(const void *objp);
  * for more details on the guard size.
  */
 # define VM_SHADOW_STACK	VM_HIGH_ARCH_5
-#else
+#endif
+
+#if defined(CONFIG_ARM64_GCS)
+/*
+ * arm64's Guarded Control Stack implements similar functionality and
+ * has similar constraints to shadow stacks.
+ */
+# define VM_SHADOW_STACK	VM_HIGH_ARCH_5
+#endif
+
+#ifndef VM_SHADOW_STACK
 # define VM_SHADOW_STACK	VM_NONE
 #endif
 

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
