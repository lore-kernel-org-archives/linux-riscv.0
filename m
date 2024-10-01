Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFFFCF318A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 23:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9O5hhFCOzimBc7y6R/w3+wp0/vhlEg/ENP8D1nl6V8Y=; b=Srt5YMUlnsM1nS
	roYjLeesObr8/5t21WTVBYSAj+OJIIw/oJ5EVf7eQyvtsPA+j/CtnqRCalUjazehE4rYj3E0tfhCh
	QlcSVvrupBpZpqHv96HkIP1/8/UNvP4DoQZBY1PS6NflCbmeeG/0wMD1hjsPFP2gTLuWR5cVqcIIQ
	QqOGuPSx2OJmTb1yxExG4TEaMCARK6Wf8fkYGvLwlhSi8BDR5wjTGjNxTAKw2GidskQxXmNb0zlXP
	zNp1GLWjZDAaxNTXIGXKjdHm+ZZJ2AMDDTR6iLPpdASp6JcRuVRdd7hFU6RUFuUiUAOk1t4pC+6DM
	Im87h4PwnpIkpgwlpvzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svmUP-00000004OCF-2TRK;
	Tue, 01 Oct 2024 23:41:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svlwO-00000004ISX-197G;
	Tue, 01 Oct 2024 23:06:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=NGfpJipuxUwuswqsylvjSBnVKR0RQiXc2ynBOEzzq/w=; b=DAY409bvcpZbIoPfmsshApKcNS
	NQbe7/aPYj1t6TmCPn71toHOr137UtLNk/k/rffcsni/17lohlL/2PjJYB1iN58cLGlF9tn/VZrBc
	4eCsJMtLd9v5N5X50SubfnDgOrsMWdJTQQYB6MrqMex/2gA2aXzCP1t0QnqwngqxYEF2HU7MH42lX
	UZ+XEpMvbrbJ0STR+IuNc/yjgmVJIS/EuiZKGhUc/FET6pxGDTXvmlP1DnN1bg3FnKzSXAPBx9cHp
	iRJZkDUPtmWblAU9Syt3hHafnN0zfYnps3MFEDNkR+G6KqkCrfIdWVehPSM1uEWPVHh+xrmtABKBG
	3uR3KcDg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svlwK-00000003Ks1-0OVX;
	Tue, 01 Oct 2024 23:05:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8CA025C0068;
	Tue,  1 Oct 2024 23:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5472C4CEC6;
	Tue,  1 Oct 2024 23:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727823954;
	bh=HmmAMUZllaI31DzUS2UptX/TOKKFhFSrPJJKYwJO4R8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oWWWef7qAoDsa3O284WmbA0+4gtsVF9fQGw5bErbwRfW/G/3F2SnO82AUhRfOPPKp
	 8iSUpwDGzBViwQtHsL3bQEW8BkhBnpj9tsYQ9f2AEG1HMszClmQxtjptGjzvfdp9TR
	 2tnBMAP2zHB7RwsCEnx1Q9Jw/Er87rPJHsfadtyl3WUB9Qp8Z5LArX/rxGdsCM4okJ
	 AwQM6Sb3okhzC6Iz/NkZ7AYbUJHbyTX09NUjSYuyaWLQV++JhEiAu5b3rjgLU71fgb
	 Qm6GFQeB2KZVXCXH7y0lGxAjEK9TD15YOJxqXZCZHRmKZNCIA0RDT7Xp5ibX4kyD39
	 l4XZfCeHsT78w==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Oct 2024 23:59:11 +0100
Subject: [PATCH v13 32/40] kselftest/arm64: Allow signals tests to specify
 an expected si_code
MIME-Version: 1.0
Message-Id: <20241001-arm64-gcs-v13-32-222b78d87eee@kernel.org>
References: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
In-Reply-To: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
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
 Ross Burton <ross.burton@arm.com>, David Spickett <david.spickett@arm.com>, 
 Yury Khrustalev <yury.khrustalev@arm.com>, 
 Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=2693; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HmmAMUZllaI31DzUS2UptX/TOKKFhFSrPJJKYwJO4R8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm/H7d5yGKXzr5saRN3DNRkwpkNhqMTqqjdMk4lgiz
 LOIonX6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZvx+3QAKCRAk1otyXVSH0JaKB/
 91iK7iv9R+ueyloiMWoxyPRjComH147TYmfbIX9Ykm8qRaL4igLeAchB/ATQueCmLNC6Pxpeowl4QZ
 NYwqAhZdyqAlYXQZc7c4+Rg4CRUKUKUsWKWX7sfqAgnoXhUYaitLkAb34xofi2MRlJ6FLRrENO1XVf
 DSLs8fbdKAurGonLAbqeHFbVzI5LfwqHtakqeDAH8dvk2F9Tmt7xxdlnRP3qt8APEzJfneZp5Vf5io
 QROYJbPR8axNhug6Vn8nmgIjd6adwj+/ZoxkkVwwNWTu6IcwnjuV7KdVL6Z0H1siVkldER5/d0RtbK
 j4xQwxJqxUFu2TYrOofQwMa8i38WEN
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_000556_938304_5AE95BD1 
X-CRM114-Status: GOOD (  18.72  )
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
index dcc49e3ce1eb..5d3621921cfe 100644
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
