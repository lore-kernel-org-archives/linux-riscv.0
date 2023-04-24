Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C492EC7618E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Apr 2023 19:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sib3GdkCqryPvD9yvdTp0S9UEFWIRzUHz9Kj1bQ/tsA=; b=qGAs+aEuZ1Jo8B
	fufmXxGlkQOc/VlVuI8q2+FIxJOr0NQSb+svveFFBJrvB99Y0dRhh27nb0x1jW0G+xcnpO97rWq54
	DDWBbf0H/IIpZf51Erm66e1949Z+fUq9JufnJ7NJ9kPs+R8QDOZ8Vp5Mt4uuXGtjvy5kfpMK/tHDD
	rhzfJMZsBiGC7tn2la5E0Yq9VX4fGNiUPmDR6qoz+ZA7P1REpqofu6u3Dowj3D1zqF7FlPQfQp8fD
	FgykwTcPeTpVAAQAK1xV2y2Rr8MW3/3jgtt8r3CkcBLPcwWZI9DX6RmxDgYYbjoeDI9+9g2AsZGNI
	hyZm9JoCOLpvguEnbkZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pr2Bv-00H4jV-14;
	Mon, 24 Apr 2023 19:49:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pr2Bn-00H4go-30
	for linux-riscv@lists.infradead.org;
	Mon, 24 Apr 2023 19:49:34 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pr2Bi-0006Mz-8I; Mon, 24 Apr 2023 21:49:26 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org,
	paul.walmsley@sifive.com
Cc: heiko@sntech.de,
	kito.cheng@sifive.com,
	jrtc27@jrtc27.com,
	conor.dooley@microchip.com,
	matthias.bgg@gmail.com,
	heinrich.schuchardt@canonical.com,
	greentime.hu@sifive.com,
	nick.knight@sifive.com,
	christoph.muellner@vrull.eu,
	philipp.tomsich@vrull.eu,
	richard.henderson@linaro.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH 1/4] RISC-V: create ISA string separately - not as part of cpuinfo
Date: Mon, 24 Apr 2023 21:49:08 +0200
Message-Id: <20230424194911.264850-2-heiko.stuebner@vrull.eu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230424194911.264850-1-heiko.stuebner@vrull.eu>
References: <20230424194911.264850-1-heiko.stuebner@vrull.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_124931_980156_79611990 
X-CRM114-Status: GOOD (  18.06  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

The isa string is a very central part of the RISC-V architecture, so will
be needed in other places as well.

So in a first step decouple the generation of the runtime isa-string from
/proc/cpuinfo - its current only user.

The resulting string should not differ from the previously generated one.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/kernel/cpu.c | 70 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3df38052dcbd..ebc478f0a16c 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -193,10 +193,33 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
 };
 
-static void print_isa_ext(struct seq_file *f)
+static int strlen_isa_ext(void)
 {
 	struct riscv_isa_ext_data *edata;
-	int i = 0, arr_sz;
+	int ext_len = 0, i, arr_sz;
+
+	arr_sz = ARRAY_SIZE(isa_ext_arr) - 1;
+
+	/* No extension support available */
+	if (arr_sz <= 0)
+		return 0;
+
+	for (i = 0; i <= arr_sz; i++) {
+		edata = &isa_ext_arr[i];
+		if (!__riscv_isa_extension_available(NULL, edata->isa_ext_id))
+			continue;
+
+		/* string length + underscore */
+		ext_len += strlen(edata->uprop) + 1;
+	}
+
+	return ext_len;
+}
+
+static void strcat_isa_ext(char *isa_str)
+{
+	struct riscv_isa_ext_data *edata;
+	int i, arr_sz;
 
 	arr_sz = ARRAY_SIZE(isa_ext_arr) - 1;
 
@@ -208,7 +231,8 @@ static void print_isa_ext(struct seq_file *f)
 		edata = &isa_ext_arr[i];
 		if (!__riscv_isa_extension_available(NULL, edata->isa_ext_id))
 			continue;
-		seq_printf(f, "_%s", edata->uprop);
+		strcat(isa_str, "_");
+		strcat(isa_str, edata->uprop);
 	}
 }
 
@@ -220,19 +244,49 @@ static void print_isa_ext(struct seq_file *f)
  */
 static const char base_riscv_exts[13] = "imafdqcbkjpvh";
 
-static void print_isa(struct seq_file *f, const char *isa)
+static char *riscv_create_isa_string(const char *isa)
 {
+	int maxlen = 4;
+	char *isa_str;
 	int i;
 
-	seq_puts(f, "isa\t\t: ");
+	/* calculate the needed string length */
+	for (i = 0; i < sizeof(base_riscv_exts); i++)
+		if (__riscv_isa_extension_available(NULL, base_riscv_exts[i] - 'a'))
+			maxlen++;
+	maxlen += strlen_isa_ext();
+
+	isa_str = kzalloc(maxlen, GFP_KERNEL);
+	if (!isa_str)
+		return ERR_PTR(-ENOMEM);
+
 	/* Print the rv[64/32] part */
-	seq_write(f, isa, 4);
+	strncat(isa_str, isa, 4);
+
 	for (i = 0; i < sizeof(base_riscv_exts); i++) {
 		if (__riscv_isa_extension_available(NULL, base_riscv_exts[i] - 'a'))
 			/* Print only enabled the base ISA extensions */
-			seq_write(f, &base_riscv_exts[i], 1);
+			strncat(isa_str, &base_riscv_exts[i], 1);
+	}
+
+	strcat_isa_ext(isa_str);
+
+	return isa_str;
+}
+
+static void print_isa(struct seq_file *f, const char *isa)
+{
+	char *isa_str;
+
+	seq_puts(f, "isa\t\t: ");
+
+	isa_str = riscv_create_isa_string(isa);
+	if (!IS_ERR(isa_str)) {
+		seq_write(f, isa_str, strlen(isa_str));
+		kfree(isa_str);
+	} else {
+		seq_puts(f, "unknown");
 	}
-	print_isa_ext(f);
 	seq_puts(f, "\n");
 }
 
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
