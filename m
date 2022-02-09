Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F72AC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 12:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2TaV/ZsqBOuJI6Tt52DPgVES5V6duaVpgculmDmzCog=; b=YLAbaHr38FDGcL
	KBH4hB2F68H4QalIqzo6UQudva04jb7U7BeD+Z3kagGV2TXDvEguHAezTJumgiX+9h703lpbfJR/F
	/jves3vIH+isZHeYqUj4fjUcvzGOgOl/YthFyU9Nk1U/FqfHSwb9oIzcxybPn2tyxIxB0H8NvsCMd
	776nVURjdK8UhLNp47tIb8CItgUvmPolcP+HU4IIEJwJy8F0j+DVkDIfJ/RNl78AsrIJofSMS0luN
	4YzzFUj2CCsOzyuDb5HIXbemtpNICrwsq50Tyv0VMA73+HDRP8L3z1Vo43/xbcGiwMIncDYVldm7V
	O8xewhta47Ef5O79yl9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHmF7-0002G8-R6; Wed, 09 Feb 2022 12:38:41 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHmEu-00029I-8b
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 12:38:32 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nHmEj-0001Mv-BQ; Wed, 09 Feb 2022 13:38:17 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, wefu@redhat.com,
 liush@allwinnertech.com, guoren@kernel.org, atishp@atishpatra.org,
 anup@brainfault.org, drew@beagleboard.org, hch@lst.de, arnd@arndb.de,
 wens@csie.org, maxime@cerno.tech, gfavor@ventanamicro.com,
 andrea.mondelli@huawei.com, behrensj@mit.edu, xinhaoqu@huawei.com,
 huffman@cadence.com, mick@ics.forth.gr, allen.baum@esperantotech.com,
 jscheid@ventanamicro.com, rtrauben@gmail.com, samuel@sholland.org,
 cmuellner@linux.com, philipp.tomsich@vrull.eu,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v6 01/14] riscv: prevent null-pointer dereference with
 sbi_remote_fence_i
Date: Wed,  9 Feb 2022 13:37:47 +0100
Message-Id: <20220209123800.269774-2-heiko@sntech.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209123800.269774-1-heiko@sntech.de>
References: <20220209123800.269774-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_043828_321523_C4EF2B37 
X-CRM114-Status: GOOD (  13.59  )
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

The callback used inside sbi_remote_fence_i is set at sbi probe time
to the needed variant. Before that it is a NULL pointer.

Some users like the flush_icache_*() functions suggest a generic
functionality, that doesn't depend on a specific boot-stage but
uses sbi_remote_fence_i as one option to flush other cpu cores.

So they definitly shouldn't run into null-pointer dereference
issues when called "too early" during boot.

So introduce an empty function to be the standard for the __sbi_rfence
function pointer until sbi_init has run.

Users of sbi_remote_fence_i will have separate code for the local
cpu and sbi_init() is called before other cpus are brought up.
So there are no other cpus present at the time when the issue
might happen.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/kernel/sbi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index f72527fcb347..c839acd668d3 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -15,11 +15,19 @@
 unsigned long sbi_spec_version __ro_after_init = SBI_SPEC_VERSION_DEFAULT;
 EXPORT_SYMBOL(sbi_spec_version);
 
+static int __sbi_rfence_none(int fid, const struct cpumask *cpu_mask,
+			     unsigned long start, unsigned long size,
+			     unsigned long arg4, unsigned long arg5)
+{
+	return -EOPNOTSUPP;
+}
+
 static void (*__sbi_set_timer)(uint64_t stime) __ro_after_init;
 static int (*__sbi_send_ipi)(const struct cpumask *cpu_mask) __ro_after_init;
 static int (*__sbi_rfence)(int fid, const struct cpumask *cpu_mask,
 			   unsigned long start, unsigned long size,
-			   unsigned long arg4, unsigned long arg5) __ro_after_init;
+			   unsigned long arg4, unsigned long arg5)
+			   __ro_after_init = __sbi_rfence_none;
 
 struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 			unsigned long arg1, unsigned long arg2,
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
