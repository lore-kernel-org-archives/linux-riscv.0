Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC88C4828F
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Feb 2024 12:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z1djbn8PwUmDrXJBGstRK/9Sf17iCvrT112q8h38lZg=; b=0ba8SrYTLZRpZ4
	MObfBU9Eg+r56vOvYDpsftrML7sCguk5S6EErI+jZx/YkN74oJpqTgUT3QBwFyiZOiiP321tPmZiA
	nNytuNfSKxPcGQllExT3PhF8bvMcIEJ4qxQszwVWe8bbZIowj4tRA0tp3BKXNZuLJ429jMGVe/YHA
	OmereDGMXfJldFynt3whfq3OgHeuOJg8wYKZ7RqbETUbNIjtaHZUuvUsduapO3P5Vs77CaBgyGVBc
	Ggskr1ivc9xwQoqWSIECE0B0FNhajoSoG6Ob5MIZA7PdMccHzz/8/hKD2lURwJ8DD5tKMOL1Njef+
	zA3mJq7VQU5KDo3gxDvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWFDH-0000000GLEA-0NCy;
	Sat, 03 Feb 2024 12:33:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWFCl-0000000GKlt-1sor;
	Sat, 03 Feb 2024 12:33:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=dq+jcN5GMg5Lle2kiMLPNS24YEsjylZTVcQUjBnRNs0=; b=B2CjpMscYnGM0twdaVu1xOzRvJ
	WXKP+tjfFEPkMOvCGb7QsLoq17/2EP7mcptYOMu0fyRkAWDQZtGqOOw/t7sDjJRExPTAH/I7sYbaU
	iXmUYTGX8RCJ1qr8B4pJphA1SkcRRX+cfKYKnHrDjYrlqK6hC40GzKqIIEqrU/CvehyKbZ4P5Vell
	NFxPC057mqO1JPtcOlzPvnMSARKKV/V0PW5M78MZ7gHdfTlIFL3FZhpB4PDogLUDQQqExYTCIBc7f
	HRLgseLUXzrGZ6OiYDHnZJaIfjncwE6jhtMQkM9S24o7KGbWi4vAJ3GglLQJ+3meIt5Bpl3feKGlS
	x8r2r/vg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWFCd-0000000Alco-0NZW;
	Sat, 03 Feb 2024 12:33:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3067A60A0B;
	Sat,  3 Feb 2024 12:32:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 898ABC433F1;
	Sat,  3 Feb 2024 12:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706963576;
	bh=DtrqsekNxnVEUxJ8rAESK/JTguJ8OvysbbylOwjoIT0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HGYfE4kQfFJTkP+Wqk8QZtSm5RueAXKxjESpueLeH7HPY7j4/myKGkfJ/UO+kZLh7
	 VmEtxEktqR5oV7tLUjrqVK0h58wp6sqQVThoC95tFeif4sRU53w7Ohn0PxU45EF1rp
	 +aRmnGvth+vUGx1hOYgwjOnEb39QVh52CSZcozaGFHhiNcmycgW7u+/U6KxX4vqJti
	 ioyuktkoRfEolu6A2hd4MrU/LlzrhXmXnT1Jd4pNNHPm9NtjDWKpJ9I1n0MW5Cw1XY
	 C485bROd/xTJIrAV+3TsH1rv+AIz9rhWjehFzpLEgi5GutqJI/ZaSELkEuAzvECzPM
	 EbRR3wYBa1LpA==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 03 Feb 2024 12:25:55 +0000
Subject: [PATCH v8 29/38] kselftest/arm64: Add framework support for GCS to
 signal handling tests
MIME-Version: 1.0
Message-Id: <20240203-arm64-gcs-v8-29-c9fec77673ef@kernel.org>
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
In-Reply-To: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
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
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-a684c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1590; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DtrqsekNxnVEUxJ8rAESK/JTguJ8OvysbbylOwjoIT0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlvjDnOVaHEEY7+NXAHmCg/VtR09vNp/bX1TdG9fwL
 Tx65GRaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZb4w5wAKCRAk1otyXVSH0FlKB/
 98DOBU/u0IXok/Y7pavvt27Ga+5AFK+X7M4Gm1LULE6Yd0z4a1VMfHZnEMGqp8Pzn3n8zAItI7CBIP
 ewOFrR5SPZbvYqb8s0OQxWwzHGWkqrz+6XiZAtdY1z+ijSFOEm2fJ3Qrb3QMaqlI3yUst/QDAfSR8W
 4vPxCYl/hSoqqlWbEXPMcR9P80SnN/grc5/vx0SerNYmyYKrOvJ26hngl6HIpgBJ1LiC7s3vEzfRCj
 Yq/guQu9c0fDL3JCGOxha0pESNb+rwBL6mpBWC6gthrLRNSAOcdlT6PjxpgYvzWVjA/K+P5tT/mM1k
 VATLPwnO13OC+VbJeZiCnFuMPgU0Zy
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_123304_160347_24DED315 
X-CRM114-Status: UNSURE (   9.61  )
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
