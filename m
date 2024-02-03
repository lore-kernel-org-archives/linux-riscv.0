Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDD6C48295
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Feb 2024 13:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zzYNGeIxLtgG35scwRKrRV8uZrCjprvCY/LrdvBDKAs=; b=r+YR/1l5YVw8Vc
	2C7AqKQnYjskruWiFr1yu+Wvu3JIPiL8Bk3BA0zBK6KcwSvvqODnTrkn7XbddkSC2rHRJlfZmUKBE
	zUJTkufZTuKKzU92Cq601VVRKGDUVu4jvcqDwdhRFPNz19VQ+ncMRO0A6fNdHB/ZTkXz+msJhvSX5
	jnSjnO/3TX63tg782YMNwctPEF0JL+X47DLuZpI+WqiOhfLM3cu9exmY4Qe3Bi+5ArPxTruSnOmJt
	Sup3Y8rS7Oy4pKK5BPrFcXcAleP4lt9EHhwjJSQhJjpiQTt67rC+CbsgoYJD/hPdH0ey8dPxGAgrn
	uGHA/VCYLwZsDES7vXeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWG9R-0000000GXfW-2JOJ;
	Sat, 03 Feb 2024 13:33:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWFCj-0000000GKjn-0gTm;
	Sat, 03 Feb 2024 12:33:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=npDy0Wmy9sZ4pKZgJh/SDPTi250q9KNBnEHGR8MQcNY=; b=XYMoIJ8T8c9s4fr01DzqT8ow0Q
	rBGDiUJd1GTxD4CBfl35kV7XH5pNmvaSSkhAJT6l2k/LlHQknqHRNGew88GaGLDEAu5/ibDH+RQNj
	g50N/YH9NPnnhNX0ETM9lSi6+Lgon28meFr/uRdhboIweFkZu9RaSP3vnqCzh3u5WIm2fQLQPp9lv
	wnUEFO5PrTIRPSSanXpQpRDfq0FSo7ODpBSyDoKaJgUlLFmfF1LwvejKE91FKVG5Fq/f5upY7SVlr
	v1V1V1RmhcKtK+O0tR0LNZ4kZSQuBGH1SRrONypeV5Kic+gS9lxmfnujkyRVDVEld3mjMdn68yq+8
	LymHBGpg==;
Received: from sin.source.kernel.org ([145.40.73.55])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWFCU-0000000AlbA-3RFV;
	Sat, 03 Feb 2024 12:32:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 04A02CE1F0F;
	Sat,  3 Feb 2024 12:32:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32B8AC43394;
	Sat,  3 Feb 2024 12:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706963563;
	bh=12GEB0Pk7RCg7IDCHng3d3qOxpvs8kdDfOLg/QCQKjw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rq54rGZnx24MR+LUh3nV3e8oP26hH94Ibu9LOex/80fqVy+e02EBu6dqOsyofq/dn
	 9S3U4uPifeLeILbteJBG/QpWUnZBy2WOLOp+KlMEeRcHL0qaYHcKVtv9q0S3QhIcwI
	 9E7PODu5zTqrPfUy5t4C+wZy0qNXoit/OCYzm0NAdwWQydU1XQwNFUeDX0MRP167T0
	 Y7Iu3LtDUIXNO0qtNGG0Y7WCih15IbGNQYHJdK+QTL7cGBX7U9Fzf95CLwlV6+DWis
	 KDpX4Lz0jfsNLClK5EnD1j4F6fJ0rXsFQXAp3XGWDvODVXmAyfNf+vI79g1HZOXsYV
	 THWaW5vGRn1IA==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 03 Feb 2024 12:25:53 +0000
Subject: [PATCH v8 27/38] kselftest/arm64: Verify the GCS hwcap
MIME-Version: 1.0
Message-Id: <20240203-arm64-gcs-v8-27-c9fec77673ef@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1190; i=broonie@kernel.org;
 h=from:subject:message-id; bh=12GEB0Pk7RCg7IDCHng3d3qOxpvs8kdDfOLg/QCQKjw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlvjDmTw5/9VutAafQEgaHl/AQF1z3bFN2KzUpHqGY
 L4zrDKaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZb4w5gAKCRAk1otyXVSH0H76B/
 0ZxrYYCMIsi8MRn7I+3H6jNZKAVNmw8SJNvqoTY/zYbJNmq4MKh3rt6x1O2gevx9hobz/cn88DE1f9
 pdIhoGTFgFsgL5+npQ6sINjikcDLWkpQZ9IKvFtQ8i0A7p1Ts6+F8ouQ/YWF5fiwDCcaglMB5SDDS0
 UKDKMWST/vMh8R/NHIjFIZ/yqpAFZrbPxntxjgSGwoIONgk0N959zfmcfkPghY9+a5troDlRxfBQyg
 M1y/zi2IbuTvIkrM9tWMmAh0rM4cC3npQ8FUa7WcMl9u2iNHczDLo6UvLO8idOYZStNtaGst5U6Izi
 tbHk2hUyigCouolu0//aNQ/XwlU1i1
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_123251_929812_0EAB3E5A 
X-CRM114-Status: GOOD (  10.29  )
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

Add coverage of the GCS hwcap to the hwcap selftest, using a read of
GCSPR_EL0 to generate SIGILL without having to worry about enabling GCS.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/abi/hwcap.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index 1189e77c8152..bc9e3250a9df 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -63,6 +63,17 @@ static void fp_sigill(void)
 	asm volatile("fmov s0, #1");
 }
 
+static void gcs_sigill(void)
+{
+	unsigned long *gcspr;
+
+	asm volatile(
+		"mrs	%0, S3_3_C2_C5_1"
+	: "=r" (gcspr)
+	:
+	: "cc");
+}
+
 static void ilrcpc_sigill(void)
 {
 	/* LDAPUR W0, [SP, #8] */
@@ -360,6 +371,14 @@ static const struct hwcap_data {
 		.cpuinfo = "fp",
 		.sigill_fn = fp_sigill,
 	},
+	{
+		.name = "GCS",
+		.at_hwcap = AT_HWCAP2,
+		.hwcap_bit = HWCAP2_GCS,
+		.cpuinfo = "gcs",
+		.sigill_fn = gcs_sigill,
+		.sigill_reliable = true,
+	},
 	{
 		.name = "JSCVT",
 		.at_hwcap = AT_HWCAP,

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
