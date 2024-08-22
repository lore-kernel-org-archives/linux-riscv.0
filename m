Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E49C52D6F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 01:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XYwL2cPviY8OFkZFj/zzYdODmAMxwyrJTS4PuWPGimY=; b=QtAlIM39BbrRcO
	ssonPwLdCameKLGcm84oqshMlaszT4NSlqHFZt2P+Xpr2OSWb7tlOwwV88DhnxLhkS/wJvfNp+lFZ
	eyC13Zt8Na9mli24QzTBJkA8wM72riAv9ugw7dmVl32SjLO87h7BBjRzrBYgJwXlVNJPBt52R5wvR
	ojOxUHMeFSg9Y7UdoLKsb/XgapuCTJYwTaHA0/j4j6l+vyIdmxfAH6yQ61a7LzuDuWH0yggTj32at
	8sLU5qGaJAwk5qxmicVYarl3UzfODV6PCvH0YiV2yuu0vHXWw5AKVNPHAPhyth1nQi+StuRS4P6mm
	vtl5IJ+kJ9m2n4PE2KFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgwiq-0000000AxjZ-2HFG;
	Thu, 22 Aug 2024 01:34:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgwWg-0000000AtV5-3OLS;
	Thu, 22 Aug 2024 01:22:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 42FC6A42105;
	Thu, 22 Aug 2024 01:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A24C32781;
	Thu, 22 Aug 2024 01:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724289729;
	bh=sPSz542BQgC8GDr8WCulUI2iE6roG4Js5HwD3OcoqCo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uAC6VEWhqTL+cBNI2eAUFI40yJ6zaIbicFzZHIA9aVQhz9+Nmj1EPHgtejkleUwU2
	 9eoLbSp2FoFQTA9mHeTOqm6a/cmAGA0AFvzkvpmrMcOK0GOF4qWO+Sg5XE5dDs7fdY
	 DjtdvHZaCyv1G/PS0AfMPwUsDQCeuOC58d/2Qe1JQN/XW4WpNaD3f9ZrtCM2FB3Tgf
	 u6GwLRRCSsqUp/M1on4cDxitAMb4pBdeTW2QVEyeDMzaaLfINMhdkjGI5CIBxaIi9M
	 4abWcFCb9kARtAD6hw6hMCqfdRGtMxnPISIgSGFhJn1v1uNlGlpwE5OA9wUTgn4u+2
	 dQ8Lz1RMoBGvA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 22 Aug 2024 02:15:33 +0100
Subject: [PATCH v11 30/39] kselftest/arm64: Add framework support for GCS
 to signal handling tests
MIME-Version: 1.0
Message-Id: <20240822-arm64-gcs-v11-30-41b81947ecb5@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1664; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sPSz542BQgC8GDr8WCulUI2iE6roG4Js5HwD3OcoqCo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmxpE7VRZgG2Z7/DOjWxHR2ISARiB0523hr1ytG8M7
 JL8y1+CJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZsaROwAKCRAk1otyXVSH0EQUB/
 4keLewH0EzA9rHUse6NUxquX1JhR5vNrTj+fWGR0Iuq3Jd7vUcyPg1KOgUkrJbapQqOa7/MvsfkH2P
 snPa1PsqGlRCYJMszDiUb4y9NmpGrG5vtHoctMSNxgEm/2WdgD9KAN5LP/WVJLijPAQ1QfXhodpTx7
 FvXCsBAOmHxJ0BypQiv2yDwUhqLqUzlbsaGWGtuye5kO5OT8o/pRmysdBh/1U2FW92ZtKNo+iB3qNZ
 jEFOn4MtGN+pUdl1PvzyJGXfiPOA0Ry9FrSkLzpgvro1tLNymg+WYe3FBnZDoDsaOVGmDDz/+05kZY
 yqMAf+H3DK8lyrZ396WQp3EudgGO+V
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_182211_007416_0F7644EA 
X-CRM114-Status: GOOD (  10.18  )
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

Teach the framework about the GCS signal context, avoiding warnings on
the unknown context.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/signal/testcases/testcases.c | 7 +++++++
 tools/testing/selftests/arm64/signal/testcases/testcases.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/tools/testing/selftests/arm64/signal/testcases/testcases.c b/tools/testing/selftests/arm64/signal/testcases/testcases.c
index 674b88cc8c39..49d036e97996 100644
--- a/tools/testing/selftests/arm64/signal/testcases/testcases.c
+++ b/tools/testing/selftests/arm64/signal/testcases/testcases.c
@@ -217,6 +217,13 @@ bool validate_reserved(ucontext_t *uc, size_t resv_sz, char **err)
 				*err = "Bad size for fpmr_context";
 			new_flags |= FPMR_CTX;
 			break;
+		case GCS_MAGIC:
+			if (flags & GCS_CTX)
+				*err = "Multiple GCS_MAGIC";
+			if (head->size != sizeof(struct gcs_context))
+				*err = "Bad size for gcs_context";
+			new_flags |= GCS_CTX;
+			break;
 		case EXTRA_MAGIC:
 			if (flags & EXTRA_CTX)
 				*err = "Multiple EXTRA_MAGIC";
diff --git a/tools/testing/selftests/arm64/signal/testcases/testcases.h b/tools/testing/selftests/arm64/signal/testcases/testcases.h
index 7727126347e0..dc3cf777dafe 100644
--- a/tools/testing/selftests/arm64/signal/testcases/testcases.h
+++ b/tools/testing/selftests/arm64/signal/testcases/testcases.h
@@ -20,6 +20,7 @@
 #define EXTRA_CTX	(1 << 3)
 #define ZT_CTX		(1 << 4)
 #define FPMR_CTX	(1 << 5)
+#define GCS_CTX		(1 << 6)
 
 #define KSFT_BAD_MAGIC	0xdeadbeef
 

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
