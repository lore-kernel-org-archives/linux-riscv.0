Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E633606A323
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 11:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Yj4S2Ces;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k3kFIR10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=znFWAyDS5fmDJDael3xBQe+NvzIPA+OmsQLVhwt0V/0=; b=Yj4S2CesCz9ajpGsA+elcZZNUm
	xJ2cbRmO2Ddq6pZYNUZivHyEAx1kO9ppaj679wgDVQDRAvBMsqUZl1DOmr5Dqv938Tw6L4Z7LSyny
	WJMBkWSg6Zs1tukALUFD1rnPKno+7FIomL2DOXyHSiKCli+qcthM++Pn0lNp6ctgX2vrT8J+PevG7
	h2hMdq/7z3/IP9QpW1MIHr5WqWETwz3I/n6dwlimGdeS+LTLsV08crudjWTVlajggSvzUB0W6qNKW
	GUrYccSnSzg6GbDrNgg1BQwe1IH2snCIAxEEYh7hyZ1lYSVmlLmY1coxbkHnNqd+6iqY0q+QkgVmg
	zjJIvyTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXS5-0000000CqPn-0Txd;
	Thu, 26 Nov 2026 11:15:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXRi-0000000Cq38-2aVp;
	Thu, 26 Nov 2026 11:15:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D98643224;
	Thu, 26 Nov 2026 11:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FCDB1F00AE3;
	Thu, 26 Nov 2026 11:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795691722;
	bh=zImSfvTk7Ce9C0Ntm689zz11A7MeuyzdnAnXV7c96Hs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=k3kFIR107EfL7OCOXCU8Gw8+wFHgYeB6pwLpvAtrtxNruSbP+IxmvekCmPdAtQpU6
	 UY9gwt+R1jj/XLJxRSkgFV/NN1dqYd2vaEiNbba2VGjRRqrndAy3W3NDIYMGpwGJdL
	 5I5xoLA6NN9oPGIT+cll+4qCT2QAsDrYc+8BocCiyQFLGSboxGfTEYTroUEdlDxo+c
	 GWTUcL/DyD6jX5uwq92MnSCE+qN75XIupuUympUcKEE9nsukylR8tAJqmagsFaNpi4
	 wqNpEf6O3v9v4sAEU0M1bRVvAdcO5ESPqGmgBJIygD3v50tp7Tk1xNsDGMbHsOcixL
	 hxaqNlHeGhMdg==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 26 Nov 2026 13:14:18 +0200
Subject: [PATCH RFC v2 05/54] s390/boot: treat dashes and underscores alike
 in parameter names
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-generic-set-memory-v0-1-v2-5-723f1e33c3d8@kernel.org>
References: <20261126-generic-set-memory-v0-1-v2-0-723f1e33c3d8@kernel.org>
In-Reply-To: <20261126-generic-set-memory-v0-1-v2-0-723f1e33c3d8@kernel.org>
To: linux-mm@kvack.org
Cc: =?utf-8?q?Adrian_Barna=C5=9B?= <abarnas@google.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Borislav Petkov <bp@alien8.de>, Brendan Jackman <brendan.jackman@linux.dev>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 David Hildenbrand <david@kernel.org>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
 Ingo Molnar <mingo@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <pjw@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Vasily Gorbik <gor@linux.ibm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, x86@kernel.org
X-Mailer: b4 0.16.1-dev
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Dashes and underscores are equivalent in the names of kernel parameters,
and the kernel compares the names with parameq(). The decompressor uses
strcmp(), so it ignores "relocate-lowcore" or "prot-virt=1".

Compare the names like parameq() does.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/s390/boot/ipl_parm.c | 51 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/arch/s390/boot/ipl_parm.c b/arch/s390/boot/ipl_parm.c
index ed28ea2fc1d1..ac4cf1ced71d 100644
--- a/arch/s390/boot/ipl_parm.c
+++ b/arch/s390/boot/ipl_parm.c
@@ -255,6 +255,25 @@ static void modify_fac_list(char *str)
 	check_cleared_facilities();
 }
 
+static char dash2underscore(char c)
+{
+	if (c == '-')
+		return '_';
+	return c;
+}
+
+/* Dashes and underscores are equivalent in parameter names */
+static bool parameq(const char *a, const char *b)
+{
+	size_t i, n = strlen(a) + 1;
+
+	for (i = 0; i < n; i++) {
+		if (dash2underscore(a[i]) != dash2underscore(b[i]))
+			return false;
+	}
+	return true;
+}
+
 void parse_boot_command_line(void)
 {
 	char *param, *val;
@@ -272,15 +291,15 @@ void parse_boot_command_line(void)
 		if (!val && !strcmp(param, "--"))
 			break;
 
-		if (!strcmp(param, "mem") && val)
+		if (parameq(param, "mem") && val)
 			memory_limit = round_down(memparse(val, NULL), PAGE_SIZE);
 
-		if (!strcmp(param, "vmalloc") && val) {
+		if (parameq(param, "vmalloc") && val) {
 			vmalloc_size = round_up(memparse(val, NULL), _SEGMENT_SIZE);
 			vmalloc_size_set = 1;
 		}
 
-		if (!strcmp(param, "dfltcc") && val) {
+		if (parameq(param, "dfltcc") && val) {
 			if (!strcmp(val, "off"))
 				zlib_dfltcc_support = ZLIB_DFLTCC_DISABLED;
 			else if (!strcmp(val, "on"))
@@ -293,49 +312,49 @@ void parse_boot_command_line(void)
 				zlib_dfltcc_support = ZLIB_DFLTCC_FULL_DEBUG;
 		}
 
-		if (!strcmp(param, "facilities") && val)
+		if (parameq(param, "facilities") && val)
 			modify_fac_list(val);
 
-		if (!strcmp(param, "debug-alternative"))
+		if (parameq(param, "debug-alternative"))
 			alt_debug_setup(val);
 
-		if (!strcmp(param, "nokaslr"))
+		if (parameq(param, "nokaslr"))
 			__kaslr_enabled = 0;
 
-		if (!strcmp(param, "cmma")) {
+		if (parameq(param, "cmma")) {
 			rc = kstrtobool(val, &enabled);
 			if (!rc && !enabled)
 				cmma_flag = 0;
 		}
 
 #ifdef CONFIG_STACKPROTECTOR
-		if (!strcmp(param, "debug_stackprotector"))
+		if (parameq(param, "debug_stackprotector"))
 			stack_protector_debug = 1;
 #endif
 
 #if IS_ENABLED(CONFIG_KVM)
-		if (!strcmp(param, "prot_virt")) {
+		if (parameq(param, "prot_virt")) {
 			rc = kstrtobool(val, &enabled);
 			if (!rc && enabled)
 				prot_virt_host = 1;
 		}
 #endif
-		if (!strcmp(param, "relocate_lowcore") && test_facility(193))
+		if (parameq(param, "relocate_lowcore") && test_facility(193))
 			set_machine_feature(MFEATURE_LOWCORE);
-		if (!strcmp(param, "earlyprintk"))
+		if (parameq(param, "earlyprintk"))
 			boot_earlyprintk = true;
-		if (!strcmp(param, "debug"))
+		if (parameq(param, "debug"))
 			boot_console_loglevel = CONSOLE_LOGLEVEL_DEBUG;
-		if (!strcmp(param, "bootdebug")) {
+		if (parameq(param, "bootdebug")) {
 			bootdebug = true;
 			if (val)
 				strscpy(bootdebug_filter, val);
 		}
-		if (!strcmp(param, "quiet"))
+		if (parameq(param, "quiet"))
 			boot_console_loglevel = CONSOLE_LOGLEVEL_QUIET;
-		if (!strcmp(param, "ignore_loglevel"))
+		if (parameq(param, "ignore_loglevel"))
 			boot_ignore_loglevel = true;
-		if (!strcmp(param, "loglevel")) {
+		if (parameq(param, "loglevel")) {
 			boot_console_loglevel = simple_strtoull(val, NULL, 10);
 			if (boot_console_loglevel < CONSOLE_LOGLEVEL_MIN)
 				boot_console_loglevel = CONSOLE_LOGLEVEL_MIN;

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
