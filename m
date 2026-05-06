Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F6DFF8855
	for <linux-riscv@archiver.kernel.org>; Wed,  6 May 2026 13:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hwdZQTcxkskTTB5jNqInuZAbSs6iNRk0WQd5Bk5VBtY=; b=tz4kNYO3CIngxs
	UVYN63EOkDFuq+h2TsI7trbdb1pZprSTMH9nqeb8mH37uI840RX0kpaazJTFUNqSfL+etwCv6Hre4
	xZWWAkrcVHh7zOwbPauDY2QsGuvqUEhM6swR430EM/1q5qCxjzjZWboI2ViOfB4cPyZXZaGam+pNq
	8hvDrQ7IKW1CKEsR9SuNmhI+lvzTE8qKYc4gg4GvQ6SPXRiw3vqfBmYdQeIVBkZ8tGSZhJHBuaELm
	0JanVdyyZ0suaD3L5FcilK8qRS3vFbzgb35Erk5jnXeBCOeOiuq/5Jgez9TubPP3MtDmE+6BXUQFZ
	XWEZXKsSN43+Lgp9thmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcCd-00000000si7-0XfY;
	Wed, 06 May 2026 13:22:15 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcCb-00000000sgg-1BAv
	for linux-riscv@lists.infradead.org;
	Wed, 06 May 2026 13:22:13 +0000
Received: from hwang4-g16.DHCP (unknown [120.238.220.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 88F8D3F68E;
	Wed,  6 May 2026 13:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1778073727;
	bh=RgqPO58n5rIyhlTprUL9feLOIzOcCSi/hFjIypfDGZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=JXyfgGOVDaSzm2uhg6aLYbgrsszXItI+LudeFpsGnxbvCE97MS3/hWJ9oZ7XNYwIh
	 grla55xSQx1rUmPe9zgsJuyBu2ihiN3kIYZ8msdUXhHHIXmifdqAjyqnPypyJ5rPBm
	 gaMx6xsvurr9K15Ayu3FjGUHaAl+aAMlGny6Eqp0rRlUNu7iGPU7CIW5Oz/p/kuueg
	 3qNRhegVr6n5RQ4w6dz2NE6Y20jJjKhucCfRidhARe26rCNGd58tfiBWmvbKusG+6S
	 OV5+RTX7QzsX80shcn15a7MgN4rXAWo0dbI4rvz2BrDjDqrw1Tl1zEHj2rjngpA+sn
	 UVlyyeX/yV38lBz19oWSkg5uIBDNqUY4+QiO1CWRgWcE9KIujtSN+V1TSmTb7bUnBd
	 4N3XijF/v1ZHawGh7j/PRM31mN2EO7SARMKrha0X7laB/PmjJisMAgcMCeQz/eND+q
	 fV3QRpjJGtN80aRwUBlo8SowVjcddaYrCya+JPWbbw1uaoWM6ryDft92jladL5GXdr
	 eKnmx9oFNC1qlmSg77z492+znoOmF00kmtlZzBMb8mgZzCFeRYhDvuz98rgMmI71Yb
	 l/4VdP6UzCbfMyDMXOMYcR5leRuy3wWpppgRJGVAqnMqmpRHPSDC6blrn01cQcH/P5
	 euCej4aqwNrhqXhTdTwwqGeE=
From: Hui Wang <hui.wang@canonical.com>
To: linux-riscv@lists.infradead.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: hui.wang@canonical.com
Subject: [PATCH] riscv: cpufeature: Use pre-defined ISA ext macros to index isa2hwcap
Date: Wed,  6 May 2026 21:21:52 +0800
Message-ID: <20260506132152.53239-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_062213_722397_4365E6A5 
X-CRM114-Status: UNSURE (   9.12  )
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

We have pre-defined ISA extension macros, here use those macros to
replace a magic number for isa2hwcap definition and some array
indexing for isa2hwcap access.

This doesn't change the original functionality, just improve the code
maintainability and readability.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 arch/riscv/kernel/cpufeature.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3dc4c0d31550..f46aa5602d74 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -1102,16 +1102,16 @@ early_param("riscv_isa_fallback", riscv_isa_fallback_setup);
 void __init riscv_fill_hwcap(void)
 {
 	char print_str[NUM_ALPHA_EXTS + 1];
-	unsigned long isa2hwcap[26] = {0};
+	unsigned long isa2hwcap[RISCV_ISA_EXT_BASE] = {0};
 	int i, j;
 
-	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
-	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
-	isa2hwcap['a' - 'a'] = COMPAT_HWCAP_ISA_A;
-	isa2hwcap['f' - 'a'] = COMPAT_HWCAP_ISA_F;
-	isa2hwcap['d' - 'a'] = COMPAT_HWCAP_ISA_D;
-	isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
-	isa2hwcap['v' - 'a'] = COMPAT_HWCAP_ISA_V;
+	isa2hwcap[RISCV_ISA_EXT_i] = COMPAT_HWCAP_ISA_I;
+	isa2hwcap[RISCV_ISA_EXT_m] = COMPAT_HWCAP_ISA_M;
+	isa2hwcap[RISCV_ISA_EXT_a] = COMPAT_HWCAP_ISA_A;
+	isa2hwcap[RISCV_ISA_EXT_f] = COMPAT_HWCAP_ISA_F;
+	isa2hwcap[RISCV_ISA_EXT_d] = COMPAT_HWCAP_ISA_D;
+	isa2hwcap[RISCV_ISA_EXT_c] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap[RISCV_ISA_EXT_v] = COMPAT_HWCAP_ISA_V;
 
 	if (!acpi_disabled) {
 		riscv_fill_hwcap_from_isa_string(isa2hwcap);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
