Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC307C71150
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 23:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XYwL2cPviY8OFkZFj/zzYdODmAMxwyrJTS4PuWPGimY=; b=q7sHMrElAQolUn
	9XkXrDCRwxbtSaP4DEnnIBrWzU2qaSqYRbnj+6bTBnjuKgs0AkAXUYkssbAPUX2w2v0kymxfj4beD
	WEd4CLaiHcBmDeYAR2atLj/FN4ZVcNVlH02TC9veH9biZDCzZK6SKkCc6JrC7LEzWMl9o4lQPq3kR
	xuG8KfRMTQbSPvwt0fPMZmL9Z+mJcUTKHfEv3JtOT0HeJfPh2UP5oKIJoHwpp/BwC9Id3uUqm3H9N
	1FgEsd7mXjPFMZ9PrCFj3ReFvf/1AQRLDifwxMz0dE+1dC84XYwzCZjs8EC9HB7Xu5GGSHcZm6klP
	5GCSKaAIqG56eZHHtfnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjSTv-0000000HVCy-1sSw;
	Wed, 28 Aug 2024 23:53:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjS98-0000000HNPl-1IG1;
	Wed, 28 Aug 2024 23:32:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7A9FDA43764;
	Wed, 28 Aug 2024 23:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62000C4CEC4;
	Wed, 28 Aug 2024 23:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724887933;
	bh=sPSz542BQgC8GDr8WCulUI2iE6roG4Js5HwD3OcoqCo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KySzo6fEyGp6BdY8PWhoAsZQF6vqUh7VSLnZwGJ1fwxLBxYSUE6Tisu/B7E3xs7+M
	 ZFbDZ7V9wkzu7u5edVGxo7UjM8KMNdINV1mdfgmzwdJGXm5Z2m8QQDX5sZjvuH0HLk
	 mNu+vjgjcZ9akS7fRBq+XNJAfx/0CT3udWjGSxizDFivqgELQ3HB6IXUdO2RWtA0Y4
	 QKxn6wQvzIpyJcOOOlBqnekMqXNj7YR+UPNHq4Ojrq6zVczenjxVSV01XK1KCmvr4c
	 DHR0YMZyJkKx9AAw6bJoY+nG1YSyNBRfHPHv7N6zg7HwBB9KytgyBIfLeDxtlQmTCy
	 CTOmxZ5qDjG1g==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 29 Aug 2024 00:27:46 +0100
Subject: [PATCH v12 30/39] kselftest/arm64: Add framework support for GCS
 to signal handling tests
MIME-Version: 1.0
Message-Id: <20240829-arm64-gcs-v12-30-42fec947436a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1664; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sPSz542BQgC8GDr8WCulUI2iE6roG4Js5HwD3OcoqCo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmz7KPFYLLdbvYJ36/sPVXE+bszL/qVS5cGfNf4rAP
 mM7MTASJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZs+yjwAKCRAk1otyXVSH0EbnB/
 4y0ip7sjbKvII3BGHj7WUTHeK1dYYsWhBq1j/1glr+DDWAso8t4RQzQrL1a/FPa8+grtUzHdfutX0e
 Fcui/LFoq17mWEoKRQgiCFYct9B3GRsBGnfQcN0UL8wTGsVEMnrufFzFh1HxFILItClusMV++GFZ7N
 QK7+IcAuriLa4+yVD+9+Aq0G00uUw1wA8KJPhNQfyIwi3S2EOfJIWZeniJwrmodcD83Q1ejYay9W/V
 OS+5GTWgUQnDIwxOQ5K6ABQwG0I8gmH8WLsS24uJ2Nk8jTz5/A3hDpUFhROo46g2hvNgunHICPFmum
 JFGtZAUdyJTkDlppOJpTHrjbRNWXUC
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_163214_514627_12B3CF0B 
X-CRM114-Status: GOOD (  10.35  )
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
