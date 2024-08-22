Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01B7C52D6F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 02:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qlcD/gzQtfzqtxsIbN9k6lxYekrcpTedn4jYErG6eOs=; b=xVohW9q8hYcw63
	pEDauKsKTth+1/AvafRmTq3h1FT1TQ8LgC32d5Fqbj5br3FLMSeavjdnetO9TreTvC21gNJS5xZdp
	tUafdrazQ0hUlsO5TLzjNrqgA9K58/UNA1taTIxWAduhzeJWgxFVTXHPT744rtdNoY1XYtr1bfBlQ
	QxUEJbCE9yQ1bYSMF/SEVrTcrYSmBqEEGEm4up1K7gef7raI4MHoSRXJow70s6qAH9pePAyuOjd8M
	KJ8nHERQehKyRuqWepammtfazj4U6+8AgplLlsT3Cf+s7J8T/x/UIQrUWrOGcyrOoDctO8zspqCBo
	X5cX25Mcm3JA+ZRf6MlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgxbA-0000000B4GK-1lJc;
	Thu, 22 Aug 2024 02:30:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgwTN-0000000Arvx-3a6o;
	Thu, 22 Aug 2024 01:18:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6071EA420FB;
	Thu, 22 Aug 2024 01:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38943C4AF1B;
	Thu, 22 Aug 2024 01:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724289524;
	bh=yrclwp0293yC9GB/YqBAfQERM0nqbhUl6FyE+eoviK4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iIhkv1vXoKilgfdT7HIpB4HOZs+tLh/vFixxXmDjlkcZOklxf/MPAb1ew2Z8s+pEO
	 K9riiigrezQbjBZf8OrNt0pyEivoy7GtrdMSX6y0Us6jX8mcNcwIK9j5WlwlWY9lzv
	 9S6HtvWiw521yHF7WXQqdK3ML6TOBXmemGFmJz5w0fw2XxoBIa1ATqkCrGr2BOtarC
	 /7OLDWVT2kesr8q9MRXPrTLBgRBmVqM0sEgSvmnaDJX8zD5MuSNC/SJ8rH0m7HfBsN
	 GkDTr0PYd/Ak4qlnOiyZ0YVy9OaKQ4GOS0r6+3mFU1Se+kyYOQLFzkJe89yh+6kg7Z
	 pRi2X/R6uve+w==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 22 Aug 2024 02:15:16 +0100
Subject: [PATCH v11 13/39] mm: Define VM_SHADOW_STACK for arm64 when we
 support GCS
MIME-Version: 1.0
Message-Id: <20240822-arm64-gcs-v11-13-41b81947ecb5@kernel.org>
References: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
In-Reply-To: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1520; i=broonie@kernel.org;
 h=from:subject:message-id; bh=yrclwp0293yC9GB/YqBAfQERM0nqbhUl6FyE+eoviK4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmxpEtEhQ9d687I7aOExxok/8WQuFAhrCVZiopb6w+
 BmeozzOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZsaRLQAKCRAk1otyXVSH0E5XB/
 9eKoZTlYi2BVbXjZrWbLqWquzXlD2d+PNTXFZrH5hsQjONsDoi9Pjc6vBP2Rq+zvYcDgloXucC4+kG
 to2qv8LkOUjq+GOgrh0Z5mqVIKef7bjvQXqo06la6oQGX6nNVJGdWI/IstMcgIyCMntSbj7B7hd2GL
 nDPorXdYdtt5GeQ6TGgSk5QjUZV8zvx36gLNa8TYUF9F8FTiHnnoyQYVmf7AfQHui5ooHkDM4EaNxO
 hkuiI4xMnP6MP3nZ1YsCWflEesxR3FoEI0PgPPyTfHrYqlNbXh72h5IMT0a9Ntqj0StxJx4wOiGdJ/
 vKhAPFViGCFXtK5c9StuFJx2HxH+I7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_181846_053981_7AB9A1DC 
X-CRM114-Status: GOOD (  10.14  )
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
