Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA27D7309C
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 05:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Subject:Date:From:
	Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0UtueNOii6GJbkOk9K21x5BWwpy1S1wHuOcENN64F2Q=; b=3/+aA/7RIDwzuP
	vb4FxHlrmIapY9jEkTgHRCNNNaJKYa7qYErhmY5OWg6zfSjWEL7Ymtx9ioHwy/T0FdLtQXrfcgf35
	qJsKRwJ7DsCUw2A4U3lUlHF6ZFRJ36fb9pxEIG40torq1yfliI9iWmn0lFbJAq0XHRKkG01zOIS9G
	7i+0fEJ6JHjgTVbvWaR3/1DJV9vgtTsV/GQ3BaJLrk9fg2Q3E4iYrs47A6+OXUf5emAFuJ5to245j
	zYtHsc3f1pLB/GYeYjLoJmpxnCbB1OIXXQqdZMikFVJccZHxyWzJDDpzjZ1pwfVZB/2FQVpk/auPO
	VSWs259Um5thzKDsiCvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8XLP-00000001L0m-1vGV;
	Fri, 03 Apr 2026 05:45:23 +0000
Received: from [111.196.245.197] (helo=hppdeMacBook-Pro.local)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8XLL-00000001Kzf-3Q3h
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 05:45:21 +0000
Received: by hppdeMacBook-Pro.local (Postfix, from userid 501)
	id 8904D166EA5F; Fri,  3 Apr 2026 08:59:04 +0800 (CST)
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Nutty Liu <liujingqi@lanxincomputing.com>, Junhui Liu <junhui.liu@pigmoral.tech>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Fri, 3 Apr 2026 08:47:58 +0800
Subject: [PATCH] riscv: pi: validate early FDT string properties before string
 use
Message-Id: <20260403005904.8904D166EA5F@hppdeMacBook-Pro.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_224520_078230_19FDA6E4 
X-CRM114-Status: UNSURE (   6.89  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The early RISC-V FDT parser reads status, riscv,isa, and mmu-type
directly from the DTB and then passes them to strcmp() or
isa_string_contains(), which in turn uses strlen() and other C string
helpers. DT string properties come from external firmware input and are
not locally proven to be NUL-terminated within the property bounds.

Use fdt_stringlist_get() before treating these properties as C strings
so malformed unterminated properties are rejected instead of being read
past their declared length.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/riscv/kernel/pi/fdt_early.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/pi/fdt_early.c b/arch/riscv/kernel/pi/fdt_early.c
index a12ff8090f19..a44afd460d70 100644
--- a/arch/riscv/kernel/pi/fdt_early.c
+++ b/arch/riscv/kernel/pi/fdt_early.c
@@ -38,16 +38,13 @@ u64 get_kaslr_seed(uintptr_t dtb_pa)
 static bool fdt_device_is_available(const void *fdt, int node)
 {
 	const char *status;
-	int statlen;
 
-	status = fdt_getprop(fdt, node, "status", &statlen);
+	status = fdt_stringlist_get(fdt, node, "status", 0, NULL);
 	if (!status)
 		return true;
 
-	if (statlen > 0) {
-		if (!strcmp(status, "okay") || !strcmp(status, "ok"))
-			return true;
-	}
+	if (!strcmp(status, "okay") || !strcmp(status, "ok"))
+		return true;
 
 	return false;
 }
@@ -137,14 +134,14 @@ static bool isa_string_contains(const char *isa_str, const char *ext_name)
  */
 static bool early_cpu_isa_ext_available(const void *fdt, int node, const char *ext_name)
 {
-	const void *prop;
+	const char *prop;
 	int len;
 
 	prop = fdt_getprop(fdt, node, "riscv,isa-extensions", &len);
 	if (prop && fdt_stringlist_contains(prop, len, ext_name))
 		return true;
 
-	prop = fdt_getprop(fdt, node, "riscv,isa", &len);
+	prop = fdt_stringlist_get(fdt, node, "riscv,isa", 0, &len);
 	if (prop && isa_string_contains(prop, ext_name))
 		return true;
 
@@ -210,7 +207,7 @@ u64 set_satp_mode_from_fdt(uintptr_t dtb_pa)
 		if (!fdt_device_is_available(fdt, node))
 			continue;
 
-		mmu_type = fdt_getprop(fdt, node, "mmu-type", NULL);
+		mmu_type = fdt_stringlist_get(fdt, node, "mmu-type", 0, NULL);
 		if (!mmu_type)
 			break;
 
-- 
2.50.1 (Apple Git-155)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
