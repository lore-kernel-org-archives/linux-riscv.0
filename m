Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA83E95A91
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 12:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oIV0vn7oPf1mxoTINSSnVCs8sGa5jp9Uyd6DmXVP/Sw=; b=I6g5v0WFg0UQHl
	tMa7L4AjcOz03e9YoOFdh67imNe6+ww+sm8pW+ptweyRbSLxDOg/vjmO8431nSAN77G60kK4hOfP9
	FAEK+ZT1nQ1Xdw2zwmOwAkBl30dtTT7s2JnR2mkDZdOLwNXjLf2xr6/kYvwACW1RHZDEtuso+r5uq
	5BeHOfo/+4W3aCyldQ0OQ1tCIjzrdCrMiJVaUt/LrcbdP30DMelx+sLb/HhzHkt9a60GNyxl3bFkn
	UFoCJAgFaDnRKjsdj+jfGFFShgiY+I6pQmSbaI29N//i7zYnOGKTY8L2Q4g0Q6oGVTng4WIMpiEuv
	IkLzFeMuKOMyp1yjd5dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpp6k-00AZmW-0L;
	Mon, 09 Oct 2023 12:11:34 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpp6f-00AZhF-2n;
	Mon, 09 Oct 2023 12:11:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E19A5CE1391;
	Mon,  9 Oct 2023 12:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC675C433CB;
	Mon,  9 Oct 2023 12:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696853485;
	bh=dnQiLWCQEIWy/Xq7xUVmoEvPZ7/L9XTfsPiddNnhH8A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uW2YvwkTEs3ksNnBeyCkmHvcg7Hg45MTQOrvX344Mz095Y2nBmnaK61KvKyW5feOb
	 f+HQRctmZfEFAzdsuUP4ETQaCQOOmd0zQw8Z4ksCz6K9hEhCwCPfvutNq6j2WD6vmj
	 4pZr9m/47nVQFEVwotHX0Esp6jxSPTzu8BCaa0T9mYgV7uNgC2U8xiw1lhPXIW7knn
	 ELoN/tObaoGVa+rdJP5Z5qYUZYF3VtUWJEpFVOSJFOS6A9HGzHFORbRPu9ErGrSjQC
	 8zpmiTl07f7AolAPvTFvKuOG/xJLeHqxbUiM5buTP5J+4fA3i09lEyQKTacVUD5oPS
	 grZRCB+QM3npg==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 09 Oct 2023 13:08:41 +0100
Subject: [PATCH v6 07/38] arm64/sysreg: Add definitions for architected GCS
 caps
MIME-Version: 1.0
Message-Id: <20231009-arm64-gcs-v6-7-78e55deaa4dd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1361; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dnQiLWCQEIWy/Xq7xUVmoEvPZ7/L9XTfsPiddNnhH8A=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlI+2WHMOtW7oALvhLQJzuMUteJm/EdFfby1ez8IFL
 vZyYW8OJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZSPtlgAKCRAk1otyXVSH0CRDB/
 44i2mEo1C6AV0kBavJlNrHUoe01OCdzz/4EZVGIvfLNMche/CoZDy2oB/+y3rrHCMkeSEwFG4KcFyC
 VnY88Rj9OOm0uZVKN9lUzQ9Aboh+Bi3RgzyK8XcLr9nza0lytLsRy9LRhol8LKzq3qVAiv/79KB5mQ
 6qpMbIMPk0FLn6qsC/iAjW/tbSgEmSfH00+X8llt831T8OpphOjxb8HdOOpRpV34JrA44UIyFWAtxX
 dkrGQX6Gpxd4DhjR16V1xYXaJiITXqvrJ1xhJf43u7igOOFiEW7N5vuix/L6mtmFwahxXcJFwM7/XT
 FmiKMyTaKx8MiwzpDMZjLMwG5iuqwL
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_051130_255533_7CAE8986 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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
index 38296579a4fd..6a550781d71e 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -994,6 +994,26 @@
 
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
