Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B6ACF318A
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 01:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U7xCN0jaxu4dDl4GKDedXAYU03thSEXtoRAPPJbGOQw=; b=zCPR/wXk8PPbaT
	IYm4gc9hAeU3wayZonFNrJsqgN8/NM3VtFuLxW0LqAYEKTz7bc0gNR+ckCnUwDAiMkit7W1xRbI7t
	IUHtLJuZtHizsMjRInwdZKLEf4Qvmmatv7u5VTOL8zsVJP2cxkviMVkmlXEEtoaWNF8CEg9D5Phel
	iMLEiG6YwsHKQ8nWb2PLBQeamSkAwKwKNSPB6miQJ+LI4PRwWEuLRzQswqPTtkV+QO9ywRxMwdlfO
	GYvQXBk1gUd+FbouIrs39LEnTbUVBPjk8pE1CUOlhRaliYq3pPNzg/LkBsJdCdN/IuRdKYAFnveXy
	F5E61GxDO4rkuiFu/oiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svoDN-00000004YEd-1P73;
	Wed, 02 Oct 2024 01:31:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svlsz-00000004Gwc-3P2g;
	Tue, 01 Oct 2024 23:02:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D51175C05AF;
	Tue,  1 Oct 2024 23:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C518C4CED8;
	Tue,  1 Oct 2024 23:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727823748;
	bh=DSXKD8gW4ItG/UhRbAzYa8PqcmIvUc0qAR0WYsCLZoQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Qxl1dc4f4chve9ceCv7x7HrnMjbe3+bj0kBlmSGkywXHx/YFH1F4fWYSGOTzq2Jj1
	 7YPuEbpy1zVUPFmIpGZVuVMCQDSIrz1lvAGH9OG9LpP+52gsCmSSb6WZZ+VDR13xib
	 meOJhANTA6AH6Jib9RiKmujGbrD+wB2KbCrqYM95jtiXFIqIZ7ajdoJMOBhvDeWmi8
	 6QvuJHcC8UWZ0WuDlbzm3tIcDOqtW9xPLfx0u6xUNewhfaaQxsY2wOhvkFUBm3M09u
	 jxOnI/RjxxiuXetU23l6bX0Oznw9TEWB+Vi5pT5Gs1Fuf1TmkmHTrJK+n/7Xg6wA01
	 SFND3170B8plQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Oct 2024 23:58:53 +0100
Subject: [PATCH v13 14/40] mm: Define VM_SHADOW_STACK for arm64 when we
 support GCS
MIME-Version: 1.0
Message-Id: <20241001-arm64-gcs-v13-14-222b78d87eee@kernel.org>
References: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
In-Reply-To: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
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
 Ross Burton <ross.burton@arm.com>, David Spickett <david.spickett@arm.com>, 
 Yury Khrustalev <yury.khrustalev@arm.com>, 
 Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=1576; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DSXKD8gW4ItG/UhRbAzYa8PqcmIvUc0qAR0WYsCLZoQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm/H7PxDti5AFEq17Xq2PV0KS2RA+1FHmja+AU6Q78
 PJq1JeSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZvx+zwAKCRAk1otyXVSH0Lg5B/
 0dbOlRzFreX+wW/DcvXTnsPqnbTvc6TKCMr3ypMT24HSTNXmTk1oXZvj6SkxqEIPW7OLRjM6JqCX2d
 Gxv0JxWUhgRiQNJtNR/8GozrVMllWWEiUMqPEdfQHU5QQojC4rvm9bEOwnUEFmaNkz4KJ3mYntbgoR
 SENEnmTh4wgFW1GXN6zmAkZYEiQE0qKXj6csZpSQxvgcyk5TMKyWJOSZaEBZpUP8DXYb5ITQk93O02
 ChdK2ZeGYiCCMA/bHxEC47tZJ9gU9cEP/+1Ia7sC2btjq5wuYcvMaGTexhSA+HW+Du+5Eat7SUuVNi
 rzCuOvArXgCjMKyOF/1L92CtCNX6J2
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_160230_017111_9C64D046 
X-CRM114-Status: GOOD (  10.13  )
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
index 56654306a832..8852c39c7695 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -367,7 +367,17 @@ extern unsigned int kobjsize(const void *objp);
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
+# define VM_SHADOW_STACK	VM_HIGH_ARCH_6
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
