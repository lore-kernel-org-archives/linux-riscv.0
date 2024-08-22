Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B86C52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 01:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yXqX/pk3yZvI+/c5LxkdWoEF/KdzxIw2sxvuPZTV440=; b=NoOUclM4LgRig5
	uFbrVt+WvF40tMaeT++9JOiFgDbfifP7dMmv/t5wSYhCt7uIJxagzVgdY8lfnXGtM27OubigxfJ6x
	X3StjzQeo81sFK0UNrFuA4UtKm/Ho1BTEajCPV/ovXWTcqhtJYRPUmjgnjrad05UAkA9Uck+Gp350
	1Fr24KsZJg2W9uduwAC6Gf5jUh16grj0FUK68YjCFV0Q9v6GCupWKtAknqhgJ5wUb8NXdgEgS2ziF
	SvkwEDj1OwSZRk8XVmTL38Kr+OyJdCWyQtMmAL4ykFxEFSpAXF98mdzkqXfniAavypgjVCQXWR/+i
	vPuxJzxYhcD2M1gyqy8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgwip-0000000AxjF-3AYr;
	Thu, 22 Aug 2024 01:34:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgwWi-0000000AtVS-0drY;
	Thu, 22 Aug 2024 01:22:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ni0Kxk3yWVfTWSbrVjjhIlms208eOmetcRX6FMFodsY=; b=n3NEuWINE1ZECje8mwbIjfRs0+
	kucshtrWHZPKoMsqqsAoqazw+uVbi3Rzxf6OlxnaMeN/0DTXe11ioMlswDD7G/4v6hKf7jApIYkQn
	6uDBVe3ehnz3Ui+0FvN1G3wCGeax50QZYg0axRXH4rm7jZq8JxFaQAy7MGNf4MrOlEfopFMjhJcd9
	5xsfVb3qd5BEii1o+55rIbdX3e2CnJegtVtDQ0l00fGVTy6E5mGCBR2S08rJtp6416DoBwFhVoNsP
	fRKc0mOhQeeBFW3kpKaLe4OzPtOrmXXRnQuUn7z8t2eZdDa6dXEO5YIpjVof0V6ueUM+t67joGcSZ
	JE0u1pGA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgwWc-00000009jdr-2Kyn;
	Thu, 22 Aug 2024 01:22:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D9DC3611C2;
	Thu, 22 Aug 2024 01:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C13CC4AF0E;
	Thu, 22 Aug 2024 01:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724289718;
	bh=daws7+gY8b6XFlV57O+J5ZaQ5dAS4S0GI4Vh7sgzmHk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N2SzzZlWrpt8Jm3M9Lk0RsbKbQsbQOKF56oki6goMGe+JUZiRuo86HjvdiymYMFgi
	 aJGqqpt2rFwDOoJQeRUAQVaZucCfYDLOxUJPi5owOYTQiwlNbrEq40xmYHjGSI2n9t
	 tqNXhiOB945uEVnrvJLv7aEOyXWskAmrbT9APLO0I5FFhsOBU+6TsVn9pfHQ3+DjnW
	 Hqbx3gVbORp9mxO2OTY1Racr8K60gIqCK3hfR3XWO2mYpIFWKbNY+jkf/2MWbfgdfF
	 eEgU80bFrgRrSTRlX0IEXVyzom1m5wg1/6qNlhmLQlThbBMv4jrTZ3c2JKj0MxIrQy
	 a/9VX4dZlq6ng==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 22 Aug 2024 02:15:32 +0100
Subject: [PATCH v11 29/39] kselftest/arm64: Add GCS as a detected feature
 in the signal tests
MIME-Version: 1.0
Message-Id: <20240822-arm64-gcs-v11-29-41b81947ecb5@kernel.org>
References: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
In-Reply-To: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1894; i=broonie@kernel.org;
 h=from:subject:message-id; bh=daws7+gY8b6XFlV57O+J5ZaQ5dAS4S0GI4Vh7sgzmHk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmxpE6+uDGXOrHu7dWlfoHceJS64ORE2ytQeM2CSbG
 WOSbh+qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZsaROgAKCRAk1otyXVSH0FJ8B/
 950p7I6dTc2xdrp9nDT25KJnOmX295fGMFlkIfUWIW2tE0A5Ek+ot64DwjGY2JUq/YwvDTiUQDvIfU
 JSdzn16tYWbpgeAZoWxSoZ9gWQ9JKvG7hN4EvL07eAnO/JTWgTafP0RFKe0CMi18aYtZlaTXKYN1Ef
 i7YqaDOz0tr2hqdWRxMH91NN9GXHWaSzbJqiCmzYu1M9tilqxYl6OUtnqgRijV3W+9bE42WVJmVdVe
 eWgHCgaCg79Rf/S3zmhKi5n++WuNGiDG+iaR2nPkDHfivx6gOizpcWK5krV9WkRpXqqgFxvnhUbdCQ
 ao4AZ6l38aB1w6FTfVNB/3v+VPO9WS
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_022207_875088_D0008CEE 
X-CRM114-Status: GOOD (  10.91  )
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

In preparation for testing GCS related signal handling add it as a feature
we check for in the signal handling support code.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/signal/test_signals.h       | 2 ++
 tools/testing/selftests/arm64/signal/test_signals_utils.c | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/tools/testing/selftests/arm64/signal/test_signals.h b/tools/testing/selftests/arm64/signal/test_signals.h
index 1e6273d81575..7ada43688c02 100644
--- a/tools/testing/selftests/arm64/signal/test_signals.h
+++ b/tools/testing/selftests/arm64/signal/test_signals.h
@@ -35,6 +35,7 @@ enum {
 	FSME_BIT,
 	FSME_FA64_BIT,
 	FSME2_BIT,
+	FGCS_BIT,
 	FMAX_END
 };
 
@@ -43,6 +44,7 @@ enum {
 #define FEAT_SME		(1UL << FSME_BIT)
 #define FEAT_SME_FA64		(1UL << FSME_FA64_BIT)
 #define FEAT_SME2		(1UL << FSME2_BIT)
+#define FEAT_GCS		(1UL << FGCS_BIT)
 
 /*
  * A descriptor used to describe and configure a test case.
diff --git a/tools/testing/selftests/arm64/signal/test_signals_utils.c b/tools/testing/selftests/arm64/signal/test_signals_utils.c
index 0dc948db3a4a..89ef95c1af0e 100644
--- a/tools/testing/selftests/arm64/signal/test_signals_utils.c
+++ b/tools/testing/selftests/arm64/signal/test_signals_utils.c
@@ -30,6 +30,7 @@ static char const *const feats_names[FMAX_END] = {
 	" SME ",
 	" FA64 ",
 	" SME2 ",
+	" GCS ",
 };
 
 #define MAX_FEATS_SZ	128
@@ -329,6 +330,8 @@ int test_init(struct tdescr *td)
 			td->feats_supported |= FEAT_SME_FA64;
 		if (getauxval(AT_HWCAP2) & HWCAP2_SME2)
 			td->feats_supported |= FEAT_SME2;
+		if (getauxval(AT_HWCAP2) & HWCAP2_GCS)
+			td->feats_supported |= FEAT_GCS;
 		if (feats_ok(td)) {
 			if (td->feats_required & td->feats_supported)
 				fprintf(stderr,

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
