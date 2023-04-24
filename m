Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB0FC77B76
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Apr 2023 19:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t6qlZvh7+JRGoVujOJ7iS4Nz/yBqCgiuUljg7OkBH7c=; b=fxMcQFzhIIOBe9
	+g6emKTo5Nv0chJNoe+2azBmywRTeBdeuldsMAFT/ujZ3uA7LRzXd1mrtzMA6zWl5Kkyn51D0E9E7
	wCtfq1hLl+mOd62hMX9e33AYiBoPbmsC9XKkZGy2yrmV4BrC/41nBzcwq+FqR5G2qQgiN7q1KiQ2+
	/luwwSQSeaizzvKfaMeuYekQyOZWPPkWcNXOa2FyQJ9KT1GVZT66pHfl6tktLMjyX86/1zUzqTX99
	qmFwIDVxj565zxYHCkw8Et4jTnNxo4u8e3RgQmymcWH0I0gmvu/RlcUyokLHG+GmfYN2Hjh1OMiH4
	aTK9m8a2QHPt9EIuSCbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pr2Br-00H4jB-2P;
	Mon, 24 Apr 2023 19:49:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pr2Bn-00H4gq-2i
	for linux-riscv@lists.infradead.org;
	Mon, 24 Apr 2023 19:49:33 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pr2Bj-0006Mz-8z; Mon, 24 Apr 2023 21:49:27 +0200
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
Subject: [PATCH 3/4] RISC-V: export the ISA string of the running machine in the aux vector
Date: Mon, 24 Apr 2023 21:49:10 +0200
Message-Id: <20230424194911.264850-4-heiko.stuebner@vrull.eu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230424194911.264850-1-heiko.stuebner@vrull.eu>
References: <20230424194911.264850-1-heiko.stuebner@vrull.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_124931_876250_C38E082D 
X-CRM114-Status: GOOD (  15.61  )
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

Already defined aux-vectors regarding the machine type are AT_PLATFORM
and AT_BASE_PLATFORM. PPC already uses AT_BASE_PLATFORM to identify the
real platform the system is running on, so do a similar thing on RISC-V
and export the ISA string of the running machine via this aux-vector
element.

This way userspace can possibly adapt to extensions that allow it to
run certain loads more performantly.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/elf.h | 10 ++++++++++
 arch/riscv/kernel/cpu.c      | 12 ++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index 30e7d2455960..820ef627e83d 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -78,6 +78,16 @@ extern unsigned long elf_hwcap;
 
 #define COMPAT_ELF_PLATFORM	(NULL)
 
+/*
+ * ELF_PLATFORM indicates the ISA supported by the platform, but has
+ * special meaning to ld.so .
+ * Expose the ISA string including all usable extensions via
+ * ELF_BASE_PLATFORM instead and allow userspace to adapt to them
+ * if needed.
+ */
+#define ELF_BASE_PLATFORM (riscv_base_platform)
+extern const char *riscv_base_platform;
+
 #ifdef CONFIG_MMU
 #define ARCH_DLINFO						\
 do {								\
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 06c2f587a176..71770563199f 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -118,8 +118,12 @@ static int riscv_cpuinfo_starting(unsigned int cpu)
 	return 0;
 }
 
+const char *riscv_base_platform = NULL;
+static char *riscv_create_isa_string(void);
+
 static int __init riscv_cpuinfo_init(void)
 {
+	char *isa_str;
 	int ret;
 
 	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/cpuinfo:starting",
@@ -129,6 +133,14 @@ static int __init riscv_cpuinfo_init(void)
 		return ret;
 	}
 
+	/*
+	 * Create the isa-string with the common set of extensions over
+	 * all harts, to expose as AT_BASE_PLATFORM in the aux vector.
+	 */
+	isa_str = riscv_create_isa_string();
+	if (!IS_ERR(isa_str))
+		riscv_base_platform = isa_str;
+
 	return 0;
 }
 arch_initcall(riscv_cpuinfo_init);
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
