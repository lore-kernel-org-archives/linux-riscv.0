Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2A0C77B71
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Apr 2023 12:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gKPBHurVFCeuq+lct8BIZwjEux0UgQGonCy0SnhSQb0=; b=awJwvTYfDoUF9P
	CTi0nclIHo2TTLTGlctnuvnHr0Pf7LszRcvltg3oNyt6w4fBO5WRkBDtDNC9h4WBsCX3O5EANodPD
	ao8BWpFoLOil/BEElO4tsWJDNYsj3Mg5Hk/Gz/iRRrA4vjFG89FsuTNiA9FEbcFNWhTLiEmx+1Af+
	KufcSmEGU1Julvga3a191BpZ2Dub/zTtPSARZVB/UmeVBLT09SutSP3E+oCH1X4lDsxWxjUM79VDN
	WT6nsIaKtiJbDfVMY5zzp2ZnipH2+JFqz4O26j8O1YITBkYhnZ4dOrbQsS15/nbN7KW5HfZpHvUAL
	EEG/YDnl4a0q6EnxDvfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prHM6-0011P4-1N;
	Tue, 25 Apr 2023 12:01:10 +0000
Received: from out203-205-221-192.mail.qq.com ([203.205.221.192])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prHM2-0011NG-0V
	for linux-riscv@lists.infradead.org;
	Tue, 25 Apr 2023 12:01:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1682424051; bh=p43EnmmsQia7Y1cgEBWwoa6zY7RRnA2ygt6iTspjyd4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RbiI2YQhuPzg3FjMM1f18FwvLyD2V3QrnHwP4Ik3EsxRFX0xPJBR0IBzWzwLtVTnE
	 Emn0GeFDb5OFFl4T/RnqQYgJuqxTAWjrXZ4c6Afj3EaY0S7vkMGnH5q41775aRicUe
	 blQy7akRluxpfXam4x4EJTYeYbz/Ib4/B7w+P6qk=
Received: from cyy-pc.lan ([2001:da8:c800:d084:c65a:644a:13d7:e72c])
	by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
	id 1235043; Tue, 25 Apr 2023 20:00:18 +0800
X-QQ-mid: xmsmtpt1682424049tf65iqzzs
Message-ID: <tencent_63090269FF399AE30AC774848C344EF2F10A@qq.com>
X-QQ-XMAILINFO: NvKyM24IHTKSOqe+sr6OEQ57/ThXcPLq5VD3q+dGSn5yIkMkB7VppuyNJMiU8O
	 pWHzDZ9DJw99Bc9SEQVzt5pBGqmXWnJfsZIgyS6xuHd7ZmgL+/E7F/yIRN7CT9ApSdNa8UqF02Yn
	 DDY0V1GBBR3Exbgtx+ZOt1Qpzvqhg9oIcznPdTdRQI/uQa97jytKU1qL/MHDkvypY7DOiGDaJfGi
	 /4dsNB6R1z6gAt012/3LMDQpzTcWYRuO6kkHOO0eqg2hcddONQGB/8jsJ7UQx+elTXacngTCVkcj
	 LckuheeHpNgpK8PtuesIzurLkSb18uAKbrzKylAPdJACO+ppeiJtuNmqLghjEWcJ3DgPcgLkHiZd
	 X0slA9GkbrZe2wxOuzFOc6u9s4QzF/TWwYfEcSqiXeuSY33PNFZQSNHGyVheDxqOzmM82A3tE7E2
	 eRhujD88xJ75COduzRRoxGMqrdQiKbZomj7tuwJx56jQSgGMNDDBmYSeDg9H2DmmpbhhvXrWcSja
	 8Auwh4gX3G/uvtZn6Yj+qgobxCNDpZYjho+spTwH6hGCJICULtnJfR43Hhjt5S0bw2l4FZA/09jo
	 DIQwKoCriskY7/nXT7Lyd4Q2YWhPYAj99Z11LxmoJ6ZG7DUebvx0PTpZErP+5PJ/tJye28KgNxMq
	 MPacw+IjQoEEUd/rG3u75nl3PqwLUWaZ+Ja291IQkXNgVpH/d1Evl6518TqfE5e7rYBR1JATz+UV
	 4A5CVeKRSq+A+AjmNSE8t+A+B3AdQT9OG1enDQ+bo/9L+AlwfNkH3bBmATgNBNmclt0BiBBiiP3S
	 YgFG6Q9uufIN5fGjvuSo8FcnILsMSPeX8jB6EiUrzMoOucNR02jI61zCSTBwY9umsRu/Kb7FVUTL
	 I9EMRtbdBHVffZsJiJswSu0XXqudrjlpbGqP3YaY3plpgVbFyIS3toCt4txfxXhwpa3gAAy/t3xQ
	 Euvfjr+BMQH5KSXIT74WaTldFWnSrA6fpEVXaz+F9rwUVbIhOtarZCcBabSUDMj0pVLzThilW55G
	 kW49Rbibw55h+MB8Gfg+iLMB985QI6mvyQtpwZwQ==
From: Yangyu Chen <cyy@cyyself.name>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wende Tan <twd2.me@gmail.com>,
	Soha Jin <soha@lohu.info>,
	Hongren Zheng <i@zenithal.me>,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH 1/2] riscv: allow case-insensitive ISA string parsing
Date: Tue, 25 Apr 2023 20:00:15 +0800
X-OQ-MSGID: <20230425120016.187010-2-cyy@cyyself.name>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425120016.187010-1-cyy@cyyself.name>
References: <20230425120016.187010-1-cyy@cyyself.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_050106_559006_97833CFB 
X-CRM114-Status: GOOD (  18.45  )
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

According to RISC-V ISA specification, the ISA naming strings are case
insensitive. The kernel docs require the riscv,isa string must be all
lowercase to simplify parsing currently. However, this limitation is not
consistent with RISC-V ISA Spec.

This patch modifies the ISA string parser in the kernel to support
case-insensitive ISA string parsing. It replaces `strncmp` with
`strncasecmp`, replaces `islower` with `isalpha`, and wraps the
dereferenced char in the parser with `tolower`.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 arch/riscv/kernel/cpu.c        |  6 ++++--
 arch/riscv/kernel/cpufeature.c | 20 ++++++++++----------
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 8400f0cc9704..531c76079b73 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/cpu.h>
+#include <linux/ctype.h>
 #include <linux/init.h>
 #include <linux/seq_file.h>
 #include <linux/of.h>
@@ -41,7 +42,7 @@ int riscv_of_processor_hartid(struct device_node *node, unsigned long *hart)
 		pr_warn("CPU with hartid=%lu has no \"riscv,isa\" property\n", *hart);
 		return -ENODEV;
 	}
-	if (isa[0] != 'r' || isa[1] != 'v') {
+	if (tolower(isa[0]) != 'r' || tolower(isa[1]) != 'v') {
 		pr_warn("CPU with hartid=%lu has an invalid ISA of \"%s\"\n", *hart, isa);
 		return -ENODEV;
 	}
@@ -228,7 +229,8 @@ static void print_isa(struct seq_file *f, const char *isa)
 
 	seq_puts(f, "isa\t\t: ");
 	/* Print the rv[64/32] part */
-	seq_write(f, isa, 4);
+	for (i = 0; i < 4; i++)
+		seq_putc(f, tolower(isa[i]));
 	for (i = 0; i < sizeof(base_riscv_exts); i++) {
 		if (__riscv_isa_extension_available(NULL, base_riscv_exts[i] - 'a'))
 			/* Print only enabled the base ISA extensions */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 59d58ee0f68d..c01dd144addc 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -120,10 +120,10 @@ void __init riscv_fill_hwcap(void)
 
 		temp = isa;
 #if IS_ENABLED(CONFIG_32BIT)
-		if (!strncmp(isa, "rv32", 4))
+		if (!strncasecmp(isa, "rv32", 4))
 			isa += 4;
 #elif IS_ENABLED(CONFIG_64BIT)
-		if (!strncmp(isa, "rv64", 4))
+		if (!strncasecmp(isa, "rv64", 4))
 			isa += 4;
 #endif
 		/* The riscv,isa DT property must start with rv64 or rv32 */
@@ -135,7 +135,7 @@ void __init riscv_fill_hwcap(void)
 			const char *ext_end = isa;
 			bool ext_long = false, ext_err = false;
 
-			switch (*ext) {
+			switch (tolower(*ext)) {
 			case 's':
 				/**
 				 * Workaround for invalid single-letter 's' & 'u'(QEMU).
@@ -143,7 +143,7 @@ void __init riscv_fill_hwcap(void)
 				 * not valid ISA extensions. It works until multi-letter
 				 * extension starting with "Su" appears.
 				 */
-				if (ext[-1] != '_' && ext[1] == 'u') {
+				if (ext[-1] != '_' && tolower(ext[1]) == 'u') {
 					++isa;
 					ext_err = true;
 					break;
@@ -154,7 +154,7 @@ void __init riscv_fill_hwcap(void)
 				ext_long = true;
 				/* Multi-letter extension must be delimited */
 				for (; *isa && *isa != '_'; ++isa)
-					if (unlikely(!islower(*isa)
+					if (unlikely(!isalpha(*isa)
 						     && !isdigit(*isa)))
 						ext_err = true;
 				/* Parse backwards */
@@ -166,7 +166,7 @@ void __init riscv_fill_hwcap(void)
 				/* Skip the minor version */
 				while (isdigit(*--ext_end))
 					;
-				if (ext_end[0] != 'p'
+				if (tolower(ext_end[0]) != 'p'
 				    || !isdigit(ext_end[-1])) {
 					/* Advance it to offset the pre-decrement */
 					++ext_end;
@@ -178,7 +178,7 @@ void __init riscv_fill_hwcap(void)
 				++ext_end;
 				break;
 			default:
-				if (unlikely(!islower(*ext))) {
+				if (unlikely(!isalpha(*ext))) {
 					ext_err = true;
 					break;
 				}
@@ -188,7 +188,7 @@ void __init riscv_fill_hwcap(void)
 				/* Skip the minor version */
 				while (isdigit(*++isa))
 					;
-				if (*isa != 'p')
+				if (tolower(*isa) != 'p')
 					break;
 				if (!isdigit(*++isa)) {
 					--isa;
@@ -205,7 +205,7 @@ void __init riscv_fill_hwcap(void)
 #define SET_ISA_EXT_MAP(name, bit)						\
 			do {							\
 				if ((ext_end - ext == sizeof(name) - 1) &&	\
-				     !memcmp(ext, name, sizeof(name) - 1) &&	\
+				     !strncasecmp(ext, name, sizeof(name) - 1) &&	\
 				     riscv_isa_extension_check(bit))		\
 					set_bit(bit, this_isa);			\
 			} while (false)						\
@@ -213,7 +213,7 @@ void __init riscv_fill_hwcap(void)
 			if (unlikely(ext_err))
 				continue;
 			if (!ext_long) {
-				int nr = *ext - 'a';
+				int nr = tolower(*ext) - 'a';
 
 				if (riscv_isa_extension_check(nr)) {
 					this_hwcap |= isa2hwcap[nr];
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
