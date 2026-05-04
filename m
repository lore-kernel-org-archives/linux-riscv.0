Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40149FF885A
	for <linux-riscv@archiver.kernel.org>; Mon,  4 May 2026 15:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ULO7XiotLD85GeMVWNoH2aNVrFVqQQcLEq4EXd2YRos=; b=QyeC4LOtumxP0Y
	DHD/gr9sA58r6xL/IiBIq4XqqMuNz2zK3B/wfcWqrFxM5nmkCJF+TE3ZdHv+XiCZEDkKelUCPxutS
	SsPfxJ92cohS94cDxLQcP7QnGuovuMxAAyNT9o8/7XH8xQWs2NYgtdccjQZPZU+kQATwS8gH4s3HT
	EtOTcKxuLqxnpAxVSfwDNEx2mg3TBuF6dzbqi7TbnLX6Wq0FIha23rIDqj6Z9nEz4dFa+i8qKWcNd
	0mvTlqSKwpIfT2DV0N8Rh+JMnI+M69l/sVLViCfIH4Sx9lTiYvm+x6bdOd8/JehwL/0gPLvewT1fC
	tpm4fsnWx2GBhFoqPozQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJvZn-0000000DdPx-3CW4;
	Mon, 04 May 2026 15:51:19 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJvZh-0000000DdLX-3mGC
	for linux-riscv@lists.infradead.org;
	Mon, 04 May 2026 15:51:18 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777909836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PEQK1PBGjMK7Q+JXhpgOTQpdtZyIwoE5SPoGL4zVShM=;
	b=R1zHfVnK+H6kidpuLSVpK23AB0ugTJct9+dLkd7p2LZmZqGMRnM5LO5UIZ+zK/iJ/9OWpZ
	x8pDpSmgkqpvKFWqUU7QJYv1esHPMKpy49qz6BKwUObPWXepUdmBh0GbCiLSrIwU/AgAmt
	AFPdeJl2xCFFm+kUAcKWwR1GyRajz/4=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Nutty Liu <liujingqi@lanxincomputing.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: pi: replace strlcat with strscpy in get_early_cmdline
Date: Mon,  4 May 2026 17:49:24 +0200
Message-ID: <20260504154924.141566-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1968; i=thorsten.blum@linux.dev; h=from:subject; bh=f8sQMBsW6cFjuwFwzTu5EJISY44wXfbIEU/0bkdpqiY=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJk/DrA0L1bb8NDOfuVBl7p9546sC1LZ2rn37LySaKfps oIXe1b87ihlYRDjYpAVU2R5MOvHDN/SmspNJhE7YeawMoEMYeDiFICJaPYw/K9LctI6np3B8InH kM3p+7PLK53ezMgsP51Z9Parx4HFItcZ/lfvf7Pp0Zb6yOmT207O3zWhaSKbw46KXez3U/nlP3a 1RLICAA==
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_085114_087918_D9BA961B 
X-CRM114-Status: GOOD (  10.22  )
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

Use the return value of strscpy() instead of calling strlen(fdt_cmdline)
again and return early on string truncation. Drop the explicit size
argument since early_cmdline has a fixed length, which strscpy()
determines using sizeof() when the argument is omitted.

Replace strlcat() with strscpy() to append CONFIG_CMDLINE.

Also remove the unnecessary fdt_cmdline NULL initialization.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/riscv/kernel/pi/cmdline_early.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/pi/cmdline_early.c b/arch/riscv/kernel/pi/cmdline_early.c
index 389d086a0718..0afbe4077cb8 100644
--- a/arch/riscv/kernel/pi/cmdline_early.c
+++ b/arch/riscv/kernel/pi/cmdline_early.c
@@ -12,8 +12,8 @@ static char early_cmdline[COMMAND_LINE_SIZE];
 
 static char *get_early_cmdline(uintptr_t dtb_pa)
 {
-	const char *fdt_cmdline = NULL;
-	unsigned int fdt_cmdline_size = 0;
+	const char *fdt_cmdline;
+	ssize_t fdt_cmdline_size = 0;
 	int chosen_node;
 
 	if (!IS_ENABLED(CONFIG_CMDLINE_FORCE)) {
@@ -22,18 +22,18 @@ static char *get_early_cmdline(uintptr_t dtb_pa)
 			fdt_cmdline = fdt_getprop((void *)dtb_pa, chosen_node,
 						  "bootargs", NULL);
 			if (fdt_cmdline) {
-				fdt_cmdline_size = strlen(fdt_cmdline);
-				strscpy(early_cmdline, fdt_cmdline,
-					COMMAND_LINE_SIZE);
+				fdt_cmdline_size = strscpy(early_cmdline, fdt_cmdline);
+				if (fdt_cmdline_size < 0)
+					return early_cmdline;
 			}
 		}
 	}
 
 	if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) ||
 	    IS_ENABLED(CONFIG_CMDLINE_FORCE) ||
-	    fdt_cmdline_size == 0 /* CONFIG_CMDLINE_FALLBACK */) {
-		strlcat(early_cmdline, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
-	}
+	    fdt_cmdline_size == 0 /* CONFIG_CMDLINE_FALLBACK */)
+		strscpy(early_cmdline + fdt_cmdline_size, CONFIG_CMDLINE,
+			COMMAND_LINE_SIZE - fdt_cmdline_size);
 
 	return early_cmdline;
 }

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
