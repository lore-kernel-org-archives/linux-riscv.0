Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2A5C636D3
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Feb 2023 06:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7pPVRxiwpfkhauWq19LUal6tiYoDUOHrxrOOBEsTW5M=; b=cgrsazqtkLPWLz
	IvHG3Xl8hPja2n4xECy6fVGaOjFHY778eBgo3+tkYADm9EpXhXm/FJjHX9AVq3HLJqTUwWjq7rbEA
	kSqodHJPp9aPSAEhd3ie3NexlMGtFhUROt5tl1Lb2muY5VBOAFtWDxqSnTsg35qdo7K3G+iCAXEVx
	nH198JgGBNmLEbCKzBzfetZBkBak+VWR+UJ1zbBs0s+sHlcDuf6qzxUa6y9DByGrMZdpTM+CmqdXZ
	78hmXri+F0PrSpufxvVhBfbCgFHME8AcuStzitAMRx7Xl5sBoT0RcrEEgs33O5wI8ZRWJC+QkihE5
	1AFoRwk3QnrojKNu023Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOC9O-004Zdt-FS; Sat, 04 Feb 2023 06:35:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOC9L-004ZdK-HF
	for linux-riscv@lists.infradead.org; Sat, 04 Feb 2023 06:35:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F0F0F60AF2;
	Sat,  4 Feb 2023 06:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 907ADC433D2;
	Sat,  4 Feb 2023 06:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675492543;
	bh=u/0MMX/IZLs1pjerWY5ETcVWivvex5xaBMMULMjK8+E=;
	h=From:To:Cc:Subject:Date:From;
	b=sd8EfC78IdaDn6c5domvcB8NDIJXxVniylK8Y11+3En5RRyoiSP4wKnCaJy8bZ/Ld
	 OAgcbJUEiKq5a1Kz+zVXgyJf//qS/DSD4JJt6USNiteahyA5u63+UpvHkYdqo39oYH
	 Xn0HYWK5+OBQ74TbrPTT/Q0TwWR+kJGR0IwjrRN8ObGChSW7v1oeytKhYc0wFYhEIg
	 18jisQbXphAFWSSQDQRxKx7NJM6HTwB9nuWx92j80hYcQcnP+tsz6PaxXG3BMeQvQ8
	 h5ActU4U/14qHc++M9NKCz8YRRCXfvGajvXdirvn0utSbiQfCHnbhwvf5RUMt9Y7ob
	 OLekOkFY4YGkg==
From: guoren@kernel.org
To: guoren@kernel.org,
	palmer@rivosinc.com,
	conor.dooley@microchip.com,
	liaochang1@huawei.com,
	bjorn@kernel.org,
	jrtc27@jrtc27.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Bjorn Topel <bjorn.topel@gmail.com>
Subject: [PATCH V2] riscv: kprobe: Fixup misaligned load text
Date: Sat,  4 Feb 2023 01:35:31 -0500
Message-Id: <20230204063531.740220-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_223547_649061_D8CB4DB3 
X-CRM114-Status: GOOD (  10.17  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The current kprobe would cause a misaligned load for the probe point.
This patch fixup it with two half-word loads instead.

Fixes: c22b0bcb1dd0 ("riscv: Add kprobes supported")
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Link: https://lore.kernel.org/linux-riscv/878rhig9zj.fsf@all.your.base.are.belong.to.us/
Reported-by: Bjorn Topel <bjorn.topel@gmail.com>
Cc: Jessica Clarke <jrtc27@jrtc27.com>
---
Changelog
V2:
 - Optimize coding convention (Thx Bjorn & Jessica)
---
 arch/riscv/kernel/probes/kprobes.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index c41bd8509032..d3b18e868f30 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -71,16 +71,18 @@ static bool __kprobes arch_check_kprobe(struct kprobe *p)
 
 int __kprobes arch_prepare_kprobe(struct kprobe *p)
 {
-	unsigned long probe_addr = (unsigned long)p->addr;
+	u16 *insn = (u16 *)p->addr;
 
-	if (probe_addr & 0x1)
+	if ((unsigned long)insn & 0x1)
 		return -EILSEQ;
 
 	if (!arch_check_kprobe(p))
 		return -EILSEQ;
 
 	/* copy instruction */
-	p->opcode = *p->addr;
+	p->opcode = (kprobe_opcode_t)(*insn++);
+	if (GET_INSN_LENGTH(p->opcode) == 4)
+		p->opcode |= (kprobe_opcode_t)(*insn) << 16;
 
 	/* decode instruction */
 	switch (riscv_probe_decode_insn(p->addr, &p->ainsn.api)) {
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
