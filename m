Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00C3E95A8E
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 12:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z1djbn8PwUmDrXJBGstRK/9Sf17iCvrT112q8h38lZg=; b=PE6MjEf5cRmJDA
	FSSdsn3vsHgnIOyXjU0wK/yfvy5A4X2cEAoe2geGVXeQCeAH/pq/6y1tHMrGxUbfCV2dDWjBk0c9l
	sOwsVzolLMJOT4fEskaAA3aTUqnI22ypRHP8TxMBISxz3nJSvM6bDYpWWVCXCelnXVf8BBRz6GRgC
	DTwe0bmiKXDjGV6PrcliHU08xeNgqYdZtWieoTSNOefEMfSNqNW7ho3T57lUPuIhn0F4sP1HpbHoY
	b6wqpnI94xutdUf6Vs/dD1GEbukcLmPpR70vrrv5esQs5IfkUqikYwefuZ5khIr8nWa4/az2m88wW
	bEMGUUp4n5w8jt0uBcIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpp9o-00Ad51-1H;
	Mon, 09 Oct 2023 12:14:44 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpp9G-00AcUN-1S;
	Mon, 09 Oct 2023 12:14:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1CF01B81158;
	Mon,  9 Oct 2023 12:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D5FC4339A;
	Mon,  9 Oct 2023 12:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696853646;
	bh=DtrqsekNxnVEUxJ8rAESK/JTguJ8OvysbbylOwjoIT0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QDoT3Rs0dy70eTof0MpL8Clmp5D5N4G+bALCxg28WbX45WAE5V6sk/vUBxZzkCB/w
	 +FzuuGTRC+vbQZTP/LJpXLFQoJoa/dFN8A2DtrbsMC44VXAJojUm/L6KjiZYupFDCz
	 OMIxqgNnfIkH9qe9SiQAivSWq/uD540hHtpMeukDnCv+Vc3dGA9ZE1l8BLDAHcW1Dy
	 8gni6ij4/iID3PCNkQjgI1ZeN1tRleWQo/QbuHLXszaDuCR53Gq8KF+8bPUzhuXaC9
	 +/wUvXP2RYyXaJVthDj1tU9T5Ul+HV6UcQvMFV2HaaFGAZXQV0aJ5NpUZoW+zq7wOT
	 94CHAAamp91hg==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 09 Oct 2023 13:09:04 +0100
Subject: [PATCH v6 30/38] kselftest/arm64: Add framework support for GCS to
 signal handling tests
MIME-Version: 1.0
Message-Id: <20231009-arm64-gcs-v6-30-78e55deaa4dd@kernel.org>
References: <20231009-arm64-gcs-v6-0-78e55deaa4dd@kernel.org>
In-Reply-To: <20231009-arm64-gcs-v6-0-78e55deaa4dd@kernel.org>
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
 Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1590; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DtrqsekNxnVEUxJ8rAESK/JTguJ8OvysbbylOwjoIT0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlI+2pq7Qa4GULwtgg75uflK1VZRll9L2EqVA5sWym
 iRyIswiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZSPtqQAKCRAk1otyXVSH0ANuB/
 9EYHlc6mJYvvbF83tv2urYj/dsRi3MZGM9bL42WvASqT9Fe6RxhqSl8+yBkjK9zlnt99TI4RlGWH2H
 7TfVXMoQwlEhSvycSBbhwJp3KYFlja1mU/BKWyUAB524VVNqk0FaXeYcYsePJoMup3ysfKgET+5Ow7
 BudxsoJJPf8SPjz7bcGQshCK0bskVX6ZG6P5z72NmpAo78PQjf/fdgwdqG7MgXhLVpnJcrp6LUXsKI
 py/v2S1R5Fz2sZW8EPhj+QlJjC+XxuA+xBNiUeTNFfblGGaQHnVhVpXKDfA9t69zSl3KsWhTZ14286
 LPcR/NM0Ve/MSPwybGmUQHozt93Wpz
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_051410_862491_53A014F3 
X-CRM114-Status: GOOD (  10.39  )
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

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/signal/testcases/testcases.c | 7 +++++++
 tools/testing/selftests/arm64/signal/testcases/testcases.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/tools/testing/selftests/arm64/signal/testcases/testcases.c b/tools/testing/selftests/arm64/signal/testcases/testcases.c
index 9f580b55b388..1cd124732be4 100644
--- a/tools/testing/selftests/arm64/signal/testcases/testcases.c
+++ b/tools/testing/selftests/arm64/signal/testcases/testcases.c
@@ -209,6 +209,13 @@ bool validate_reserved(ucontext_t *uc, size_t resv_sz, char **err)
 			zt = (struct zt_context *)head;
 			new_flags |= ZT_CTX;
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
index a08ab0d6207a..9b2599745c29 100644
--- a/tools/testing/selftests/arm64/signal/testcases/testcases.h
+++ b/tools/testing/selftests/arm64/signal/testcases/testcases.h
@@ -19,6 +19,7 @@
 #define ZA_CTX		(1 << 2)
 #define EXTRA_CTX	(1 << 3)
 #define ZT_CTX		(1 << 4)
+#define GCS_CTX		(1 << 5)
 
 #define KSFT_BAD_MAGIC	0xdeadbeef
 

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
