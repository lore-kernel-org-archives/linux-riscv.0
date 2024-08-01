Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDE5C3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 13:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XYwL2cPviY8OFkZFj/zzYdODmAMxwyrJTS4PuWPGimY=; b=PQ0pm7QMBN5hOp
	R+aE9Y43/02Q0Vezt8156UMNJpIqQdoarzrWvG0rE37s3ahpGD50PhauuOwD5IHz/s11o0voLCTVe
	zYXpDP3WyrsbGITXBAYhDc/9TTrJoj6geX46JCbACU94gN4rJickhXYKjEqWi8DODAAkriC4urDHw
	I54bd6qlsY6vg8tAOApO3ptwn8B1BOHJa2a4qgFYj4BdjgJlLYA3/C2pLlmDrftxYmMW1LC19rOjp
	OD4qsL3yDTsAksk4+gwiHM7K4iIbLioNOsxUZXd5vnBzw591Bp6Wzh89uNyO1TJ7urgiSjWWJhcw5
	P+7rBjoB8/W/RWyiPImw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVeI-00000005RqP-3P7h;
	Thu, 01 Aug 2024 13:15:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVQQ-00000005Jyi-0epZ;
	Thu, 01 Aug 2024 13:01:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7346E62850;
	Thu,  1 Aug 2024 13:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C837AC4AF0A;
	Thu,  1 Aug 2024 13:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722517257;
	bh=sPSz542BQgC8GDr8WCulUI2iE6roG4Js5HwD3OcoqCo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZAUnG7gymw3ama46N4/FSDxSkR6dolweB/eurjLYlAnm9DLowUGKqcj7YqINGC+uj
	 8HTwVpyNStWp08+y3E2ISQEhbnaEsEDOOsMyJDIMovAiFVpgrUVzjTc6Fzff1xAo6P
	 NsmhUz3gsA3y+FnV4UnLlGhUyOzmRgpnZtLqrP78J8DCfwokXMbOzvXajVyn/14NjF
	 ExlFSy68rqNsm05R8bNTJfpJwPwchXZNvHkOxwVGR3TaweNxzlMfILcTC5tAnFHizm
	 F2vIDbFxuDuPBfG0wHbwGaUjWnz6X/l+Se/Es9JGGP0GW3nCRoB7wv14Fm8VG2uM7B
	 cSyLTYYRcdj4g==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 01 Aug 2024 13:06:58 +0100
Subject: [PATCH v10 31/40] kselftest/arm64: Add framework support for GCS
 to signal handling tests
MIME-Version: 1.0
Message-Id: <20240801-arm64-gcs-v10-31-699e2bd2190b@kernel.org>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
In-Reply-To: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
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
X-Mailer: b4 0.15-dev-37811
X-Developer-Signature: v=1; a=openpgp-sha256; l=1664; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sPSz542BQgC8GDr8WCulUI2iE6roG4Js5HwD3OcoqCo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmq4YehzAb9JAu3bcFU1tOhATrFl7Jobwqpz0k6Kx0
 4Nt/ApiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZquGHgAKCRAk1otyXVSH0HeQB/
 4r2nNmyla5byu5l9a+dzkSs2P7VDc57ojHjMgUHaxYSGDO5UZe7asC3ePZ0AjtK1zU/AepiUi5IEvT
 ZG3t5pco4RLuWa6DfFqJyzCiXyhzRq3ydh+yaptLtFfdBWMp0mMp+uXLHNRFjsu55OHXS6bt2eP3am
 ajrJDyiATeO/DeDHObUcHTJX+aFIk+V7urQv6jeJaZdyB0mL0wEFHuwQ0RA2No44U72IFcrjY5U+Wt
 bhYy+0SykeTjQc+Q7ob9QIwQqnnd9KxRv2qi482zdXbC1wc3F6P7b3PHZHGywBZdDNS2ptnfL22Ed+
 wtDYRLVKGjK9pDzEgdKczzr6s1FElI
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_060058_406335_3B54B943 
X-CRM114-Status: GOOD (  10.64  )
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
