Return-Path: <SRS0=Kh2H=QF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3941AC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 11:35:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0390C61AFB
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 11:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0390C61AFB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z454Ho17tbHvg7uJFYXVRzv0ogfEwUzCsBzmtKf7Dlg=; b=hRn3XTd89Ixc7D
	jxD4xj07ZgylLTXKHRYiWoOiZqxNA9xIasrxucF4eeqdKRaCavEjJb9R3kGyB/DMU6NQ1PkxdIqz9
	/rp543B9NjyTTFewvvWJkvIUoKxLzOfKIMBhfZdkI0oPybnGG6ovo4ybRDELODX+Ug7E0i+eqieAo
	/vo6/b+9IYGx/Tqm/Uxe6LpM6lkoklSiJe1VckwS3bkzcZvnhtiBMohELK/urBNdXna+ylw+8Du1f
	I6xzc0nCjMYKWcz5gqFYiHxKcag6CfVkrklU8HnGFJvTrNZ3Jr5+Ndp41ho2wjVrpIScHGU/G5JU+
	zAZCLDj1qRX//xPZZC5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnfhV-007biF-3S; Thu, 18 Nov 2021 11:35:33 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnfhJ-007bYD-Gc
 for linux-riscv@lists.infradead.org; Thu, 18 Nov 2021 11:35:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=LZbD31jZkGrgx6ViTy/l2Vjvp0vliXuYxb
 Te8LX4ujw=; b=eBUeMH7vDQCB4UTcZcKRSntM3kEpjHWStnxhoW4CDMxOwbXM7v
 GdnjFi8y6HoaK9ejGWIKpUkfO3iPNj7S9N0P/0DyPPrRwLqngNL3Lzwgcn7oLIsr
 bUn7kGYOsFBjx719kaxD2cfS6y+VlXLzGeiZPUl8mY86BGOQJzOF3TGP4=
Received: from xhacker (unknown [101.86.18.22])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygBnLsxMOpZhi51cAQ--.6032S7; 
 Thu, 18 Nov 2021 19:34:45 +0800 (CST)
Date: Thu, 18 Nov 2021 19:23:21 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "=?UTF-8?B?Qmo=?=
 =?UTF-8?B?w7ZybiBUw7ZwZWw=?=" <bjorn@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu
 <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nick
 Desaulniers <ndesaulniers@google.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Tong Tiangen
 <tongtiangen@huawei.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-kbuild@vger.kernel.org
Subject: [PATCH 04/12] riscv: bpf: move rv_bpf_fixup_exception signature to
 extable.h
Message-ID: <20211118192321.16837434@xhacker>
In-Reply-To: <20211118192130.48b8f04c@xhacker>
References: <20211118192130.48b8f04c@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygBnLsxMOpZhi51cAQ--.6032S7
X-Coremail-Antispam: 1UD129KBjvJXoWxuryfXrWUJryxJF4DZr13Jwb_yoW5GrWxpF
 s8Cas3GrWFgwn3ur13tw10gF45Kr40g34Syry8C3W5t3WIkrWrJr1rta9Iyr98WrW7Wry8
 CFySgr1fCw4rZ37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBCb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
 8067AKxVWUAVCq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28C
 jxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI
 8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E
 87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64
 kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm
 72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42
 xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
 GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI4
 8JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWx
 Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0x
 vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU2bAwDUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_033522_041804_95001D4D 
X-CRM114-Status: UNSURE (   9.71  )
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

From: Jisheng Zhang <jszhang@kernel.org>

This is to group riscv related extable related functions signature
into one file.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/extable.h | 12 ++++++++++++
 arch/riscv/mm/extable.c          |  6 ------
 arch/riscv/net/bpf_jit_comp64.c  |  2 --
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/extable.h b/arch/riscv/include/asm/extable.h
index 84760392fc69..c48c020fcf4d 100644
--- a/arch/riscv/include/asm/extable.h
+++ b/arch/riscv/include/asm/extable.h
@@ -22,4 +22,16 @@ struct exception_table_entry {
 #define ARCH_HAS_RELATIVE_EXTABLE
 
 int fixup_exception(struct pt_regs *regs);
+
+#if defined(CONFIG_BPF_JIT) && defined(CONFIG_ARCH_RV64I)
+int rv_bpf_fixup_exception(const struct exception_table_entry *ex, struct pt_regs *regs);
+#else
+static inline int
+rv_bpf_fixup_exception(const struct exception_table_entry *ex,
+		       struct pt_regs *regs)
+{
+	return 0;
+}
+#endif
+
 #endif
diff --git a/arch/riscv/mm/extable.c b/arch/riscv/mm/extable.c
index d8d239c2c1bd..cbb0db11b28f 100644
--- a/arch/riscv/mm/extable.c
+++ b/arch/riscv/mm/extable.c
@@ -11,10 +11,6 @@
 #include <linux/module.h>
 #include <linux/uaccess.h>
 
-#if defined(CONFIG_BPF_JIT) && defined(CONFIG_ARCH_RV64I)
-int rv_bpf_fixup_exception(const struct exception_table_entry *ex, struct pt_regs *regs);
-#endif
-
 int fixup_exception(struct pt_regs *regs)
 {
 	const struct exception_table_entry *fixup;
@@ -23,10 +19,8 @@ int fixup_exception(struct pt_regs *regs)
 	if (!fixup)
 		return 0;
 
-#if defined(CONFIG_BPF_JIT) && defined(CONFIG_ARCH_RV64I)
 	if (regs->epc >= BPF_JIT_REGION_START && regs->epc < BPF_JIT_REGION_END)
 		return rv_bpf_fixup_exception(fixup, regs);
-#endif
 
 	regs->epc = (unsigned long)&fixup->fixup + fixup->fixup;
 	return 1;
diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index f2a779c7e225..2ca345c7b0bf 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -459,8 +459,6 @@ static int emit_call(bool fixed, u64 addr, struct rv_jit_context *ctx)
 #define BPF_FIXUP_OFFSET_MASK   GENMASK(26, 0)
 #define BPF_FIXUP_REG_MASK      GENMASK(31, 27)
 
-int rv_bpf_fixup_exception(const struct exception_table_entry *ex,
-				struct pt_regs *regs);
 int rv_bpf_fixup_exception(const struct exception_table_entry *ex,
 				struct pt_regs *regs)
 {
-- 
2.33.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
