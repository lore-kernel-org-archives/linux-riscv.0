Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8C1CD37B2
	for <linux-riscv@archiver.kernel.org>; Sun, 10 May 2026 16:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LqG6Rn8K527pkF1/PsNzzAACAISV1ayLBN9SZ4wD1XA=; b=tULM1IdqO11Bao
	a7DMcCMhpX70DG0xEJB/uiV9/3/UldBh7w733flK0y8VIDz7batNA0DOHmiVFRj6aQJ/4PBJG5VZh
	JXgKVsn+Qd5PhUhN2346TlcnvCZZ7MK1ZBVoaSvO4ytph+4xafGmeSU8RZxaZA7lgYvMujObnSXS/
	aSHs98uJZFPG5IRwQvYY8JbrMw7x0ZnCv7R/SjsIiXO4ar15RGjqguLkXYI1mh2gRh6e3K4QprnBt
	nfd+RHosYh6UPBFix3x0I/qGU+uNJPYVBg43HOnUhr3pIlY2Bp+z2TMJWXIgW2w1T94532J0o3a7O
	/iKJ4+y9cERdJMLKO9iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM7Qs-0000000BCXf-0O5c;
	Sun, 10 May 2026 16:55:10 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM7Qp-0000000BCWb-0SXV
	for linux-riscv@lists.infradead.org;
	Sun, 10 May 2026 16:55:08 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778432101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2OBzuW9P7eODNU5hYdcV6ou8oladCxtRgVfmGhmczYI=;
	b=L3MDoQxatDs7iYyHRS6BCcM7AruD9bUlD1xQR7dh1tsZLifM6GtBIEbJpFqGkOTUKdhz6D
	UpEMXEHs1E+exel/qljgBv0NrQUXo8ssvjMC//Gg6LaMe76KElCctwl3xFnTK4UJAX9j3h
	NDgSXIZI0te0Ar9OSu4BWIksqPQ8npk=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: use sysfs_emit in cpu_show_ghostwrite
Date: Sun, 10 May 2026 18:54:21 +0200
Message-ID: <20260510165420.109453-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1536; i=thorsten.blum@linux.dev; h=from:subject; bh=9QU6JQBnJSTvkHt4s2chb6UGQgx22xxDss11LLTomps=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkMO2w+LPi3/qlVxvvoR5rGqV+PKPu/N6naf4Z5pkJhs 9Z5VaPujlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE8gQBi5OAZjInDxGhiPCElESXoqyQXsf v7Q1e+u8Rc36vcTVX0mFL6/eVtU5N5vhJ2POlgehEssDJO/0rN0rZDeReYvYOqPIs987p/CcLuj NZgAA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_095507_320801_2DF5F9DC 
X-CRM114-Status: UNSURE (   7.13  )
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

Replace sprintf() with sysfs_emit() in cpu_show_ghostwrite(), which is
preferred for formatting sysfs output because it provides safer bounds
checking.

While the current code only emits fixed strings that fit easily within
PAGE_SIZE, use sysfs_emit() to follow secure coding best practices.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/riscv/kernel/bugs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/bugs.c b/arch/riscv/kernel/bugs.c
index 3655fe7d678c..e5758e3f1c7e 100644
--- a/arch/riscv/kernel/bugs.c
+++ b/arch/riscv/kernel/bugs.c
@@ -5,7 +5,7 @@
 
 #include <linux/cpu.h>
 #include <linux/device.h>
-#include <linux/sprintf.h>
+#include <linux/sysfs.h>
 
 #include <asm/bugs.h>
 #include <asm/vendor_extensions/thead.h>
@@ -46,15 +46,15 @@ ssize_t cpu_show_ghostwrite(struct device *dev, struct device_attribute *attr, c
 	if (IS_ENABLED(CONFIG_RISCV_ISA_XTHEADVECTOR)) {
 		switch (ghostwrite_state) {
 		case UNAFFECTED:
-			return sprintf(buf, "Not affected\n");
+			return sysfs_emit(buf, "Not affected\n");
 		case MITIGATED:
-			return sprintf(buf, "Mitigation: xtheadvector disabled\n");
+			return sysfs_emit(buf, "Mitigation: xtheadvector disabled\n");
 		case VULNERABLE:
 			fallthrough;
 		default:
-			return sprintf(buf, "Vulnerable\n");
+			return sysfs_emit(buf, "Vulnerable\n");
 		}
-	} else {
-		return sprintf(buf, "Not affected\n");
 	}
+
+	return sysfs_emit(buf, "Not affected\n");
 }

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
