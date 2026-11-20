Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37566606A337
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 07:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ILCCqHrL;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=eswincomputing.com header.i=@eswincomputing.com header.a=rsa-sha256 header.s=dkim header.b=NH4yi1OH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=SZS5iIz/+2PWuk7JpgXMaONdR/pPdeo3/HUMfewt130=; b=ILCCqHrLzKU65yEGnLh7440OJF
	+A9nDtaE38EJdNL+VJ+zXejPeHPzrFT+Bvb72SkCwmIpHvbs7sUQI3CjDn6l7l5gB820SQqdi1/kW
	sobymlJ1d3lmOpLvOhSCuApyK6AnJSAzo9mdjGB+WBnaEF4IKAodmopPGUzKfuiLWLuA88DMe0vDi
	HnWaeYnMic7xXNo6Ns2F77zgMkFKgDK8lZEGleB14qXt/+4gZUIbja0bzLMYkW9yB4vunPp9XZDj7
	YqE98lU/MVD6Xorgangqm6xCupATM7W1Soz9GCI/hptFNDolc1fHtpnQjpH+cN8Wgc0hvbT6x9AI9
	AFO14mog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIkH-0000000ECij-0mEI;
	Fri, 20 Nov 2026 07:09:17 +0000
Received: from azure-sdnproxy.icoremail.net ([207.46.229.174])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIk9-0000000ECi1-3K7L
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 07:09:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=eswincomputing.com; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:MIME-Version:Content-Transfer-Encoding; bh=1g00Z6gc0j
	KWEBH3y928a6aryx0kBD5/KzHExqvR7e8=; b=NH4yi1OHYvolZYXR9tvk8yyp1b
	fh6TxNUWWBjeuZJiYLr2snd3whPmec+THRo7kr6LiZvKlRWA06zh6WWV2mZQbfyG
	FdhyVZmmymOD+d9+lKnaA8x5cBRyD8MYy99ik07UZa4xcntz6U8Wc1Hw+C48BSl/
	NO9EUD3L4L2LYIltI=
Received: from E0002472LT.eswin.cn (unknown [10.64.96.163])
	by app1 (Coremail) with SMTP id TAJkCgCXhuUB8v9q1FQAAA--.2533S2;
	Fri, 20 Nov 2026 15:08:51 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3] riscv: kprobes: free insn slot in arch_remove_kprobe() to avoid memory leak
Date: Fri, 20 Nov 2026 15:08:49 +0800
Message-Id: <20261120070849.1239-1-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: TAJkCgCXhuUB8v9q1FQAAA--.2533S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw4UXr4DXry3AF1rCFWruFg_yoW8WF4fpF
	s8uwn8G3yrXa1fG347Aw4kW34FyayrW3y2grW8A343Xw15Jr15Xw4Ig3yUXrn8Kr98Kr1a
	vF90vFWFqrW7Aa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r1q6r43
	MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
	02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_
	GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5
	6yI5UUUUU==
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAgERE2r-JS8i1gAAsq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_230910_208841_23C2551A 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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

When a kprobe is removed, arch_remove_kprobe() does not free the
instruction slot allocated by arch_prepare_kprobe(). This causes
a memory leak every time a kprobe is unregistered.

Other architectures such as arm64, x86, and powerpc all free the
slot in their arch_remove_kprobe() implementations. Add the
missing free_insn_slot() call for RISC-V.

Registered and unregistered a kprobe on kernel_clone in a loop
inside a QEMU (RISC-V virt) guest: before the fix the number of
kprobe_insn_page entries in /proc/kallsyms grew by one every 512
iterations (each insn-slot page holds 512 eight-byte slots), and
after the fix it stays at 1.

Fixes: c22b0bcb1dd0 ("riscv: Add kprobes supported")
Cc: stable@vger.kernel.org
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
---
Changes in v3:
 - Add Fixes tag and Cc stable (Masami Hiramatsu).
 - Add Reviewed-by from Masami Hiramatsu. No code change.

 arch/riscv/kernel/probes/kprobes.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index 9e2afabf9..a76eab297 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -128,6 +128,10 @@ void __kprobes arch_disarm_kprobe(struct kprobe *p)
 
 void __kprobes arch_remove_kprobe(struct kprobe *p)
 {
+	if (p->ainsn.api.insn) {
+		free_insn_slot(p->ainsn.api.insn, 0);
+		p->ainsn.api.insn = NULL;
+	}
 }
 
 static void __kprobes save_previous_kprobe(struct kprobe_ctlblk *kcb)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
