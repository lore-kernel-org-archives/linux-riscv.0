Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECE6C001B0
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 22:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mcQCwayZmc1SwvhWz/H3tMRbaGXe50tqKS+IZ22UrFg=; b=3sAjNW47I0sgtV
	YdgstKsceWYrDySqBYXAQ3NmIC6bFve1M9ccbrTmxPNTuqNy0PJGvHJnBtCVZB6cORL7gb0fJi8LZ
	0Szym9iGXugFzVPT+MBTCoyu7uRpHW8ea5+DujB6OoqmOTyiFRQaYsePKTYLEnc1TQphMzIzq1XXl
	UjjH+E+jLjWZIrWWWTwz8+9wH+pJnKKbFU3czZRdBMU3duS+GcqiB4XHBDvbeYiDUV1uOITte0kWC
	vqlFROZLF+FGxsRIhX1a39m2vyP9lp//QHu2GxQDHugkGD4ZBoIoNEqV34DbukXe237zVD7LX43qI
	yjwxlZypBLjR3ScxruzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT8Ig-000q1U-1p;
	Mon, 07 Aug 2023 22:02:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT8Id-000py7-1T;
	Mon, 07 Aug 2023 22:02:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 01D22622A4;
	Mon,  7 Aug 2023 22:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A811EC433AD;
	Mon,  7 Aug 2023 22:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691445722;
	bh=k6DV13RSkbr/e436II0jx5LmEFZf9bksk2EmOe6Nllo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nApuP+06jysg/y7J6ZFHo8EwbwZrQg52kz06YA448HtW5ZD8Dn5Ua5XDCrv9J1r6m
	 0Bb3tJ48ice6SQZuY0QlNWt6f7+03WGysSnNbAaGqp3il2b7cpS2ltxRRmZyXnPkzF
	 iyvItt72vm12Bf7UiyJYlD62lhu9dRzyz2/Ea0zjAglmyMhySLg/rFnTo8Fhu+uEi0
	 mbFBlmvNa9mgcVc49WfP7aTtg+NylzhTaK0paAd6dVD+ioh809ACVSla4uD8qmVcbQ
	 V4XGbTV+8S0ZjvPt38JTcg7VDbkO7+cvEo2hk68rqBx+VUQmOcEjfcKyuxY7cHnakI
	 uruau8eum35QA==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 07 Aug 2023 23:00:10 +0100
Subject: [PATCH v4 05/36] arm64/sysreg: Add definitions for architected GCS
 caps
MIME-Version: 1.0
Message-Id: <20230807-arm64-gcs-v4-5-68cfa37f9069@kernel.org>
References: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
In-Reply-To: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
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
X-Mailer: b4 0.13-dev-034f2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1361; i=broonie@kernel.org;
 h=from:subject:message-id; bh=k6DV13RSkbr/e436II0jx5LmEFZf9bksk2EmOe6Nllo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBk0Wmbk5SKHIgUZPBuhpE8jhIRmhoIosfJTCDsmh4Y
 Kt7ozLGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZNFpmwAKCRAk1otyXVSH0CAtB/
 sE7EhZAiONJOLz/iCK0MbpxBTxndfXombnr0bVNTrn1eSCo4nyeEnjU/0StkedCRh+3f1vC8QH7bws
 Gt2d65gecQRs4M6mTiQilYcYyZYql6pTENRWJhcL6WqmfZrzHFy7zmOJC64Na/jjZaP/ep4CNo1kiD
 PUCDLqXPDg/Tg2JfSe9NDcpPY9q6LOt1xEVBFKA1bstLwgyoQvkbEh0fkwTB1+WMK+felFhu9v6cEG
 hoyWctwsqa7x/ChiK0Ch2q6N5un4sii9T9Lu37O4rN0st8zsFh/EESrrey7Tjox0AP+I21SgKi7ZgF
 w4FvbboJ0reNZzcEXE5lZxVgq9NELw
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_150203_582308_63C825E0 
X-CRM114-Status: GOOD (  10.81  )
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

The architecture defines a format for guarded control stack caps, used
to mark the top of an unused GCS in order to limit the potential for
exploitation via stack switching. Add definitions associated with these.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/sysreg.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index b481935e9314..3d7f9b25b8fb 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -730,6 +730,26 @@
 
 #define PIRx_ELx_PERM(idx, perm)	((perm) << ((idx) * 4))
 
+/*
+ * Definitions for Guarded Control Stack
+ */
+
+#define GCS_CAP_ADDR_MASK		GENMASK(63, 12)
+#define GCS_CAP_ADDR_SHIFT		12
+#define GCS_CAP_ADDR_WIDTH		52
+#define GCS_CAP_ADDR(x)			FIELD_GET(GCS_CAP_ADDR_MASK, x)
+
+#define GCS_CAP_TOKEN_MASK		GENMASK(11, 0)
+#define GCS_CAP_TOKEN_SHIFT		0
+#define GCS_CAP_TOKEN_WIDTH		12
+#define GCS_CAP_TOKEN(x)		FIELD_GET(GCS_CAP_TOKEN_MASK, x)
+
+#define GCS_CAP_VALID_TOKEN		0x1
+#define GCS_CAP_IN_PROGRESS_TOKEN	0x5
+
+#define GCS_CAP(x)	((((unsigned long)x) & GCS_CAP_ADDR_MASK) | \
+					       GCS_CAP_VALID_TOKEN)
+
 #define ARM64_FEATURE_FIELD_BITS	4
 
 /* Defined for compatibility only, do not add new users. */

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
