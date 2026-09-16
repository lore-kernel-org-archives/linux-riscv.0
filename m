Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410C2C88E7D
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 19:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PwzoAEycvvD/V4adH5jcWjNx1lLHRuC4o+R8QlhcMXg=; b=mTuZ5KHkjZAFTc
	XtIRN+5bzOzV3s248zjjYyxU0GReTDI1HdRMXuAqI4M99uLhKJlU1eNLtWWbD6/DouaxUKKIgsXPZ
	LjN3leg1iKvt1abGm/7kGJktjWnaesRJE+cThu1fIzldCp1rcZXmCu/wcbZdtG+WHalQ5kfcm8FO5
	XaMTYdllLh0p8TMT8VlBvWzy/ewERYgB6Q9NHA/UGURz28u/fXMZpEQz026T0Yd/tL61TuGIbr2tD
	KyNtYx784xrljyW37GX7ErR+7jl4NRVawAM6IE0Abj38cbjJlYvYhCksaBXXufMfXiyQN9G8WXhqd
	uoLuOkqvMo0Zs+TZnCDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YoZ-00000007qzJ-0JnX;
	Tue, 15 Sep 2026 19:27:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YoV-00000007qws-1Lya
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 19:27:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83D6F1E2F;
	Tue, 15 Sep 2026 12:27:26 -0700 (PDT)
Received: from fedora (LJ9QCPV96V.austin.arm.com [10.118.150.127])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 822263F7B4;
	Tue, 15 Sep 2026 12:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789500450; bh=tfLtN7emaScceSendHcvj4vevvhH9YU4i43q4QRnbSg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oAV9jrzpv61i9XqlwyK8Tr35madnlcmJOkQwiz3LOIJO+KTlXB6DejNIpBKw2IAiJ
	 AcDYpZeJkmkLcuWJOZzsladM9o00MM52VNSplnGP8KDcxDS38wlxaB2Ir0/SWW3ZT3
	 n6WzHH7veUMQlahO3iyuNMb7e3ARx13bjGMEdhwQ=
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
Subject: [PATCH v4 5/6] selftests/x86: support header files in extra-files
Date: Wed, 16 Sep 2026 04:52:23 -0500
Message-ID: <20260916095224.1533971-6-bill.roberts@arm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916095224.1533971-1-bill.roberts@arm.com>
References: <20260916095224.1533971-1-bill.roberts@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_122731_455245_01647B06 
X-CRM114-Status: GOOD (  11.38  )
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

The Makefile dependencies do not include header files, and adding header
files to extra-files calls will cause the header to be passed to the
compiler to compile, which is not what we want. So filter out .h files
from EXTRA_FILES but keep them for the target's prerequisites.

Signed-off-by: Bill Roberts <bill.roberts@arm.com>
---
 tools/testing/selftests/x86/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
index 75315f1190d6..ac181b065f37 100644
--- a/tools/testing/selftests/x86/Makefile
+++ b/tools/testing/selftests/x86/Makefile
@@ -114,7 +114,7 @@ endif
 # the dependencies ("header3.h"), because clang, unlike gcc, will not accept
 # header files as an input to the compiler invocation.
 define extra-files
-$(OUTPUT)/$(1): EXTRA_FILES := $(2)
+$(OUTPUT)/$(1): EXTRA_FILES := $(filter-out %.h,$(2))
 $(OUTPUT)/$(1): $(2)
 endef
 
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
