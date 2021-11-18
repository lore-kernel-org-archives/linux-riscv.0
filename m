Return-Path: <SRS0=Kh2H=QF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3370CC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 11:35:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBA1761BAA
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 11:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EBA1761BAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PfXknwyXfJqOJgAr0VG4ONi2/L1496uWCBb/kwVqKWM=; b=4QofQeVOW/efY0
	ZkJlL8xhvuWJZQbVp6OP8hM2pEea909Ko+RxOokbBv+lC5+gY7R+Qm9M/hoiyc//vIPlErSZuqvxh
	6Hqd7kelF50vgQCENOkGYyKuNuaSphHNmHSs1Cy0rDBa0tDVKgy1SmU8t3StAWmOHcDmvws3GJvbD
	/WP1F5FTHp5PFw0NOpzMxvt0k3gJ7RDSLxJzQBbvzCiMVxXpvvQhSYrmmsZlPj2K7jrmQ/YAZIlui
	N0DQl1Os+36LiQ4I4xzv6ngcBPfVGhUFr1efmZ5L6zT1K/N2MJXqPSEop+MJuRmvn/quFlSGWQg4d
	zlgiujN8pNxiO84Az8+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnfh6-007bTC-5N; Thu, 18 Nov 2021 11:35:08 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnfh2-007bRW-2x
 for linux-riscv@lists.infradead.org; Thu, 18 Nov 2021 11:35:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=3i4Rp/q45W+TZIYLx/C3ZWYjrNyJFZoaEf
 azRHAUX/o=; b=R7L6Vq068WV7uimSlqXh2xRnhfbz3P3uUPJ43k2X8EZXRHEj4b
 Yq1efcLblCThAwNAEmRWo0kzIxW3/bi3pA763T/YIIQGCguwUso/Ck8LY1LG2dX2
 1d+8Z8aLkb4Fw2StcKU7ylLXYT/3w9uzvCGFtcGkONca+cg8WoWW+DGAA=
Received: from xhacker (unknown [101.86.18.22])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygAHD99XOpZhwZ1cAQ--.27562S7; 
 Thu, 18 Nov 2021 19:34:56 +0800 (CST)
Date: Thu, 18 Nov 2021 19:25:14 +0800
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
Subject: [PATCH 07/12] riscv: lib: uaccess: fold fixups into body
Message-ID: <20211118192514.13d3e873@xhacker>
In-Reply-To: <20211118192130.48b8f04c@xhacker>
References: <20211118192130.48b8f04c@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygAHD99XOpZhwZ1cAQ--.27562S7
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy3ur13GF4DZFW3AFy7ZFb_yoW8Ww13pw
 1xur9rKw45Wrn7uFZ2yry5XF1rWa1fXF1UArW7Kw15ZrnFvr1vyFnYq39rWryDJFWrAF4x
 WF9ayr4rGryYk37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBCb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
 8067AKxVWUAVCq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28C
 jxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI
 8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E
 87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64
 kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm
 72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42
 xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
 GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI4
 8JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWx
 Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0x
 vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU775rUUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_033504_848797_EE5AF654 
X-CRM114-Status: GOOD (  10.56  )
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

uaccess functions such __asm_copy_to_user(),  __arch_copy_from_user()
and __clear_user() place their exception fixups in the `.fixup` section
without any clear association with themselves. If we backtrace the
fixup code, it will be symbolized as an offset from the nearest prior
symbol.

Similar as arm64 does, we must move fixups into the body of the
functions themselves, after the usual fast-path returns.

Inline assembly will be dealt with in subsequent patches.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/lib/uaccess.S | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 55f80f84e23f..047f517ac780 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -173,6 +173,13 @@ ENTRY(__asm_copy_from_user)
 	csrc CSR_STATUS, t6
 	li	a0, 0
 	ret
+
+	/* Exception fixup code */
+10:
+	/* Disable access to user memory */
+	csrs CSR_STATUS, t6
+	mv a0, t5
+	ret
 ENDPROC(__asm_copy_to_user)
 ENDPROC(__asm_copy_from_user)
 EXPORT_SYMBOL(__asm_copy_to_user)
@@ -218,19 +225,12 @@ ENTRY(__clear_user)
 	addi a0, a0, 1
 	bltu a0, a3, 5b
 	j 3b
-ENDPROC(__clear_user)
-EXPORT_SYMBOL(__clear_user)
 
-	.section .fixup,"ax"
-	.balign 4
-	/* Fixup code for __copy_user(10) and __clear_user(11) */
-10:
-	/* Disable access to user memory */
-	csrs CSR_STATUS, t6
-	mv a0, t5
-	ret
+	/* Exception fixup code */
 11:
+	/* Disable access to user memory */
 	csrs CSR_STATUS, t6
 	mv a0, a1
 	ret
-	.previous
+ENDPROC(__clear_user)
+EXPORT_SYMBOL(__clear_user)
-- 
2.33.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
