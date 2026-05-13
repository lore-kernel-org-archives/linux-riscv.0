Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2C3CD4851
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 15:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bv9uhYVYsbKfFDCkxZsIvxQRBwqgpsDpz3VwxUXrgGI=; b=j/YojKxxZ+v7kg
	xL2kftToSuAJLwIwjcoBZZ8Re0oM37TnycACGG2pbaQRyfGU7nkpuUtH9w6gPF/Nd1lJX4xPFxeSM
	12SMpBXCnjXFMGL6fR45wMtYHVLoF5O0W0RXi871u31KUC1QkMjlevRx6Zvp1yhpn+lRUN/mplpgj
	s4U4GULtlHT3awUA69MNsSQV/Av+8BJCRaTzSUMFhh6E0+NosX7jKYKILQNnFn1TCm2IJzaf6ZMQr
	PUpfJNZ13rKrzwL5OLcLPY/D/mj31ME0e69KTcotdIV44I517R4LCoxSQ0iJrspeT2ALdVonuCgTq
	pyjl59iUD9GOdsEh1Ccw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNBqn-000000037x9-1f4F;
	Wed, 13 May 2026 15:50:21 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNBqj-000000037uy-0g7k
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 15:50:18 +0000
Received: from Lee.localdomain (unknown [39.152.152.253])
	by APP-01 (Coremail) with SMTP id qwCowACHMm6MnQRqEXQgEA--.35827S5;
	Wed, 13 May 2026 23:50:11 +0800 (CST)
From: Li Guan <guanli.oerv@isrc.iscas.ac.cn>
To: acme@kernel.org,
	namhyung@kernel.org
Cc: irogers@google.com,
	adrian.hunter@intel.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Li Guan <guanli.oerv@isrc.iscas.ac.cn>
Subject: [PATCH 3/3] perf script: Provide weak stubs for instruction decoding
Date: Wed, 13 May 2026 23:48:51 +0800
Message-ID: <20260513154851.1085334-4-guanli.oerv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513154851.1085334-1-guanli.oerv@isrc.iscas.ac.cn>
References: <20260513154851.1085334-1-guanli.oerv@isrc.iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowACHMm6MnQRqEXQgEA--.35827S5
X-Coremail-Antispam: 1UD129KBjvJXoW7tr48JF4DZF13uFy5Wr47XFb_yoW8XF4kp3
	9ru3y5Zr1UXF4avw1fG3ZYqr1a9r9aqF1SgFyIk39rWr43Jw1xtry2kF9Ygr17Ar48JryU
	AF129FZ5WryrAFJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x0JUHWlkUUUUU=
X-Originating-IP: [39.152.152.253]
X-CM-SenderInfo: hjxd0znlorv2ny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_085017_573129_75E32F1F 
X-CRM114-Status: UNSURE (   6.91  )
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

When cross-compiling perf for architectures that do not yet implement
hardware-specific instruction decoding (such as RISC-V and ARM64),
the linker fails with undefined references to `dump_insn` and
`arch_is_uncond_branch` in builtin-script.c.

Provide global __weak stubs for these functions to ensure successful
linking across all architectures. Architectures that support these
features will automatically override these weak symbols.

Signed-off-by: Li Guan <guanli.oerv@isrc.iscas.ac.cn>
---
 tools/perf/builtin-script.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
index c8ac9f01a3..80a8f0e80b 100644
--- a/tools/perf/builtin-script.c
+++ b/tools/perf/builtin-script.c
@@ -4608,3 +4608,25 @@ int cmd_script(int argc, const char **argv)
 out:
 	return err;
 }
+
+/*
+ * Provide weak stubs for architectures that have not yet implemented
+ * instruction decoding. This prevents linker errors (undefined
+ * references) on non-x86 architectures (like ARM64, RISC-V) when
+ * building perf script.
+ */
+const char * __weak dump_insn(struct perf_insn *x __maybe_unused,
+			      u64 ip __maybe_unused,
+			      u8 *inbuf __maybe_unused,
+			      int inlen __maybe_unused,
+			      int *lenp __maybe_unused)
+{
+	return NULL;
+}
+
+int __weak arch_is_uncond_branch(const unsigned char *buf __maybe_unused,
+				 size_t len __maybe_unused,
+				 int x86_64 __maybe_unused)
+{
+	return 0;
+}
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
