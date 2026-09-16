Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3C7C88E75
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 19:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VhtExj0B4PHtmW3ZI/mn36VNNCP7JH829fKFDK3gUNc=; b=bL5OSSD0HUls9j
	BIYr479jQ8cnSBHFKU6QNkbnkOgXZL2Lv2nP50jjA4pGxIi68pKn5sm4BlcxqH2+qqG1V1P3pARZu
	HKEctWwtQEw36GJOLvBz8U/980XyDvmJrplOtjxuXQ5TK6iJ55DKIhrOvWkNQCzR4FbveCglW3fH1
	50WnHUH5KRE42G1AmqZvo+17R7QWuvMxeAjb5Fvl7lhE0X2TlRolbQq4+HnAW6veD8fsUd6g/p629
	R6p7UahEsKliIzt2q3HEcR3T8BZbzD5HInnBomU5oxz1OTI+2fUJCLGfV/o9SAPsipGSFbepL8iR8
	3xuUVyx1VwSFFCqKpT9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YoW-00000007qy5-3LFJ;
	Tue, 15 Sep 2026 19:27:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YoU-00000007qwH-0sB5
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 19:27:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 196C51D70;
	Tue, 15 Sep 2026 12:27:25 -0700 (PDT)
Received: from fedora (LJ9QCPV96V.austin.arm.com [10.118.150.127])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20E5B3F7B4;
	Tue, 15 Sep 2026 12:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789500448; bh=kQobSU13+1T4Eb+Wc+7tqzcmzwiCmaiuTxp/pmx+5T8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ja9jHWhTFSvF5HTXPHDwnGwEGch/zJSHzX3U0/eRHMLw2og1mpmSc16CKFsCztXqN
	 ZqEeCJu3wSZ14D36F0SLeeaa8eytkO8Aj6rBVPfz7pUtxFK5HpY5tRBjkLb5GxVzBS
	 wcQXSiJsTk3OIQLPTeDlbIF10uoqc8h61kQI4/Cc=
From: Bill Roberts <bill.roberts@arm.com>
To: "H. Peter Anvin" <hpa@zytor.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	rick.p.edgecombe@intel.com,
	Shuah Khan <shuah@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	x86@kernel.org
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Bill Roberts <bill.roberts@arm.com>
Subject: [PATCH v4 3/6] selftests/x86: add shadow stack lock test
Date: Wed, 16 Sep 2026 04:52:21 -0500
Message-ID: <20260916095224.1533971-4-bill.roberts@arm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916095224.1533971-1-bill.roberts@arm.com>
References: <20260916095224.1533971-1-bill.roberts@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_122730_296633_3B36AEBC 
X-CRM114-Status: GOOD (  12.82  )
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

Add a test that locks the shadow stack write bit and then attempts to
disable write. The disable should fail with EPERM since it's in a locked
state. This also preserves the write bit being set for the whole test
suite as well as preserving the ability to unlock at the end.

Signed-off-by: Bill Roberts <bill.roberts@arm.com>
---
 .../testing/selftests/x86/test_shadow_stack.c | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tools/testing/selftests/x86/test_shadow_stack.c b/tools/testing/selftests/x86/test_shadow_stack.c
index b52c5420c137..72e7329d89d7 100644
--- a/tools/testing/selftests/x86/test_shadow_stack.c
+++ b/tools/testing/selftests/x86/test_shadow_stack.c
@@ -1060,6 +1060,24 @@ int test_ptrace(void)
 	return 1;
 }
 
+static int test_locking(void)
+{
+
+	if (ARCH_PRCTL(ARCH_SHSTK_LOCK, ARCH_SHSTK_WRSS)) {
+		printf("[FAIL]\tCould not lock Shadow stack write\n");
+		return 1;
+	}
+
+	if (ARCH_PRCTL(ARCH_SHSTK_DISABLE, ARCH_SHSTK_WRSS) != -EPERM) {
+		printf("[FAIL]\tCould change Shadow stack write after lock\n");
+		return 1;
+	}
+
+	printf("[OK]\tShadow stack locking\n");
+
+	return 0;
+}
+
 int main(int argc, char *argv[])
 {
 	int ret = 0;
@@ -1079,12 +1097,33 @@ int main(int argc, char *argv[])
 		return 1;
 	}
 
+	/* Note: test_shadow_stack_lock() needs write enabled */
 	if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_WRSS)) {
 		printf("[SKIP]\tCould not enable WRSS\n");
 		ret = 1;
 		goto out;
 	}
 
+	unsigned long status = 0;
+
+	if (ARCH_PRCTL(ARCH_SHSTK_STATUS, &status)) {
+		printf("[FAIL]\tCould not get Shadow stack status\n");
+		ret = 1;
+		goto out;
+	}
+
+	if (status != (ARCH_SHSTK_WRSS|ARCH_SHSTK_SHSTK)) {
+		printf("[FAIL]\tStatus not as expected, got 0x%lx status, wanted: 0x%llx\n",
+			status, (ARCH_SHSTK_WRSS|ARCH_SHSTK_SHSTK));
+		ret = 1;
+		goto out;
+	}
+
+	if (test_locking()) {
+		ret = 1;
+		goto out;
+	}
+
 	/* Should have succeeded if here, but this is a test, so double check. */
 	if (!get_ssp()) {
 		printf("[FAIL]\tShadow stack disabled\n");
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
