Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0B2C77B61
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Apr 2023 19:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GG9fX5aIaXgq2OsNg5IhZqKeNcgrgPUWgMiM0rUi+i8=; b=HpJkPnjBLlAVfl
	pBgpEIzbg3MOUV3C5NnYStwoXSYzZk6wz9AZzlRd/VgyN9zybKF21pIuRHBZMYcD54LJcnnK2Ck/i
	+B3pcH4FdcMrU7d/Ztn/w9nhPxARMweJvwnEUBv4d46xilEH9tlHNyKTCKQGV9rJ+Yxv4FrmjFdZy
	7buM7g5ypLoFG3jsgaqhfz8ejrAVeVbGOFwOF8EG+6Pguad4M6ax289Y/7YQuwW+LkmFAAKjiNf3n
	Aq4FlCYcNt6Vp8lIn7Wru65+cXI4yaeHj1OEF0cK388o9HM2Stes5SjO6MDFisgFUfoeCElc2Ra/P
	4tiLrcscWoVlDaIoDGpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pr2Br-00H4ie-0q;
	Mon, 24 Apr 2023 19:49:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pr2Bn-00H4gm-2x
	for linux-riscv@lists.infradead.org;
	Mon, 24 Apr 2023 19:49:33 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pr2Bi-0006Mz-OX; Mon, 24 Apr 2023 21:49:26 +0200
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
Subject: [PATCH 2/4] RISC-V: don't parse dt isa string to get rv32/rv64
Date: Mon, 24 Apr 2023 21:49:09 +0200
Message-Id: <20230424194911.264850-3-heiko.stuebner@vrull.eu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230424194911.264850-1-heiko.stuebner@vrull.eu>
References: <20230424194911.264850-1-heiko.stuebner@vrull.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_124931_954175_872EFB2F 
X-CRM114-Status: GOOD (  13.45  )
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

When filling hwcap the kernel already expects the isa string to start with
rv32 if CONFIG_32BIT and rv64 if CONFIG_64BIT.

So when recreating the runtime isa-string we can also just go the other way
to get the correct starting point for it.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/kernel/cpu.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index ebc478f0a16c..06c2f587a176 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -244,7 +244,7 @@ static void strcat_isa_ext(char *isa_str)
  */
 static const char base_riscv_exts[13] = "imafdqcbkjpvh";
 
-static char *riscv_create_isa_string(const char *isa)
+static char *riscv_create_isa_string(void)
 {
 	int maxlen = 4;
 	char *isa_str;
@@ -261,7 +261,11 @@ static char *riscv_create_isa_string(const char *isa)
 		return ERR_PTR(-ENOMEM);
 
 	/* Print the rv[64/32] part */
-	strncat(isa_str, isa, 4);
+#if IS_ENABLED(CONFIG_32BIT)
+	strncat(isa_str, "rv32", 4);
+#elif IS_ENABLED(CONFIG_64BIT)
+	strncat(isa_str, "rv64", 4);
+#endif
 
 	for (i = 0; i < sizeof(base_riscv_exts); i++) {
 		if (__riscv_isa_extension_available(NULL, base_riscv_exts[i] - 'a'))
@@ -280,7 +284,7 @@ static void print_isa(struct seq_file *f, const char *isa)
 
 	seq_puts(f, "isa\t\t: ");
 
-	isa_str = riscv_create_isa_string(isa);
+	isa_str = riscv_create_isa_string();
 	if (!IS_ERR(isa_str)) {
 		seq_write(f, isa_str, strlen(isa_str));
 		kfree(isa_str);
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
