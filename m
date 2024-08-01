Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423E5C3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 13:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tMGBQfJxuFS3BtnQ+ohWBPAsPVsfgtCv1Ma4YR9DKEU=; b=sEj7A3s0NL9hEq
	2AXcoH3Zl02HKYAOAZw/JLTfjLJf3qpH4/PxtqLw80KKcn8ORtvfbdrML3a/c4Ifrs+K+1aBmoQXP
	oXpUHp6yWE8TbfiVdt42lxqk2RMZ8PLjrjRLFcgeME/RqxBnMut1pw/7MHo+jaa1E5i5/vYrqscYQ
	dbUbddNSn2JaBr41UnRAqg0QAMJRdZnhiJmVQDwvnK0I0TziFALzdJHBx/Bqv9Fl/DpjBUB41t7+x
	e2Bw+0ZRAKaoLtRzJt2L/gmm+jUT0E7RmQ89m4kY+RZNqwt5UWt+P281E01gE6KuVqNGDZ+f8pV7f
	BSjk7EOc2lMPmmMwgR2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVfI-00000005SMh-1ugm;
	Thu, 01 Aug 2024 13:16:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVQj-00000005KBP-2cjR;
	Thu, 01 Aug 2024 13:01:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=WWCcnUoJjrrALxAjBZhPpvknZTOgZ9IOR5Q3O7LGZXc=; b=Ungp98qKy1FoQzBcrd5XlAZCLE
	JrMZcWEEQFx+cC6qnR0zIJFPRu8/OQI5WbXRnTn+rvE9Xf665RecKAxXuiLjNcVT5KksFjkUBb6OB
	pcFlp8duD1Tkd4lROm6PuG68LE2MDfzYaFxQ8u2XdvZIIT8jzaS4/eBmaZFIdQOQZhPajxWhsXPHS
	nyGHIF8VjRbvkr5w9JYms3TJdx1ir7zALvNYv6pWBZF8peZbLWLjdj2zlfp/Zk8hAx4VKKHe88eSe
	OcX8XTlQWPKC3YYJy3TH6W/ytuBpZ4Kb3gXwNoggXScWLe3iVxXND3tQ/TFJ159SfKBXBM2JK+aP5
	qK4yUGKA==;
Received: from sin.source.kernel.org ([145.40.73.55])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVQf-00000005T63-2dSH;
	Thu, 01 Aug 2024 13:01:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AE878CE19AF;
	Thu,  1 Aug 2024 13:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91CD2C4AF0A;
	Thu,  1 Aug 2024 13:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722517264;
	bh=+guAOBhRmIfgEVfzNIbxa5iAcbQBA9Aonxf7B+eDgYE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=chYxdKgKEN/P6WhtjSlCRHRkRW2Bij5hb+Y7VAQJKyCvKoPomyYMt8eArd/MVWIK8
	 61GY9dsmfiCU5Jys/qtBCj6COundf1HHTWMcw143MpEsvQEW5kNgUxBEhy7QxfbBp1
	 l5nVQ1KwuENodPcsuuvbuCUzld7ZZ0nlWbrzovrigtEAjwpSaB1Le0b6wP1F7Bl2aw
	 hSuxIPdajC4F0ApEoZI98nrjUc94Q5ofvfoAg+78wxlkVvsJ4DU/7ibQoPGPURV7sn
	 yAzCuvwyZFbXTbWSoScHdaLvR4B1W51AYxojkTbz41SdPUFXkfsDk+kMlXfOIRnphm
	 hpY62eQpLtzuA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 01 Aug 2024 13:06:59 +0100
Subject: [PATCH v10 32/40] kselftest/arm64: Allow signals tests to specify
 an expected si_code
MIME-Version: 1.0
Message-Id: <20240801-arm64-gcs-v10-32-699e2bd2190b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2693; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+guAOBhRmIfgEVfzNIbxa5iAcbQBA9Aonxf7B+eDgYE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmq4YeUXoUQw/9I7ybFQmVQ8h2lcPYkdDrKBsETSxM
 MBjWXMSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZquGHgAKCRAk1otyXVSH0KVCB/
 4gRjlP4/lp0JabZj5jZ4yViyk5smTqzwWsY4ENeCSjsgUO8f9bx1pGhzfjIQTxvGmkdsS5tQ7QhxIN
 fIPGi7IZXlzFmZa9T8S9M9tMgZrfDWs/9RohnqVFwJZ8HosQgIvEx041S4+1/z52tEYmC7GHKvM/Cx
 c9iY8K4DddJGJMT0l7dlRvXBwOLTXRf2E1rRcUa/yZsOFS1rCP05axTuU6MaC5yvT96WZL58hYdvn8
 RdBPuIl7oV8XA40gGkZAshXYW5ICmSFqcw+SwiPHGqGSScN5TFR8tt/1J+hpoTLzX5V/O8H2gCzK2p
 1qmfLZxLZVb6xcXZEc/UB9a4Qfow3n
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_140114_536784_0E3A45EC 
X-CRM114-Status: GOOD (  18.98  )
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

Currently we ignore si_code unless the expected signal is a SIGSEGV, in
which case we enforce it being SEGV_ACCERR. Allow test cases to specify
exactly which si_code should be generated so we can validate this, and
test for other segfault codes.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../testing/selftests/arm64/signal/test_signals.h  |  4 +++
 .../selftests/arm64/signal/test_signals_utils.c    | 29 ++++++++++++++--------
 2 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/arm64/signal/test_signals.h b/tools/testing/selftests/arm64/signal/test_signals.h
index 7ada43688c02..ee75a2c25ce7 100644
--- a/tools/testing/selftests/arm64/signal/test_signals.h
+++ b/tools/testing/selftests/arm64/signal/test_signals.h
@@ -71,6 +71,10 @@ struct tdescr {
 	 * Zero when no signal is expected on success
 	 */
 	int			sig_ok;
+	/*
+	 * expected si_code for sig_ok, or 0 to not check
+	 */
+	int			sig_ok_code;
 	/* signum expected on unsupported CPU features. */
 	int			sig_unsupp;
 	/* a timeout in second for test completion */
diff --git a/tools/testing/selftests/arm64/signal/test_signals_utils.c b/tools/testing/selftests/arm64/signal/test_signals_utils.c
index 89ef95c1af0e..63deca32b0df 100644
--- a/tools/testing/selftests/arm64/signal/test_signals_utils.c
+++ b/tools/testing/selftests/arm64/signal/test_signals_utils.c
@@ -143,16 +143,25 @@ static bool handle_signal_ok(struct tdescr *td,
 			"current->token ZEROED...test is probably broken!\n");
 		abort();
 	}
-	/*
-	 * Trying to narrow down the SEGV to the ones generated by Kernel itself
-	 * via arm64_notify_segfault(). This is a best-effort check anyway, and
-	 * the si_code check may need to change if this aspect of the kernel
-	 * ABI changes.
-	 */
-	if (td->sig_ok == SIGSEGV && si->si_code != SEGV_ACCERR) {
-		fprintf(stdout,
-			"si_code != SEGV_ACCERR...test is probably broken!\n");
-		abort();
+	if (td->sig_ok_code) {
+		if (si->si_code != td->sig_ok_code) {
+			fprintf(stdout, "si_code is %d not %d\n",
+				si->si_code, td->sig_ok_code);
+			abort();
+		}
+	} else {
+		/*
+		 * Trying to narrow down the SEGV to the ones
+		 * generated by Kernel itself via
+		 * arm64_notify_segfault(). This is a best-effort
+		 * check anyway, and the si_code check may need to
+		 * change if this aspect of the kernel ABI changes.
+		 */
+		if (td->sig_ok == SIGSEGV && si->si_code != SEGV_ACCERR) {
+			fprintf(stdout,
+				"si_code != SEGV_ACCERR...test is probably broken!\n");
+			abort();
+		}
 	}
 	td->pass = 1;
 	/*

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
