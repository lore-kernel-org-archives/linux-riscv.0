Return-Path: <SRS0=Kh2H=QF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED00C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 11:35:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AEB561BE3
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 11:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9AEB561BE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JnR1vbBkwqegUfUWpWUeKceWEhjVOtoEtmFsyPFSvO4=; b=YCcnjGSKJ6m0u8
	nB6MlRsOJr7g/ur8RCIfhH62uNMyJpvx281uAtNxDc+/hG5W1dCyJRErLj4IZGAWizsv1+HySDHBr
	KBD48mgG5rie98wSAI5r2eAaL8Vhn/BgaQP2GtZrHgPm3Ztmj2r5y6iD8Z3zSxuCmEO/dybWGMVOp
	b9WKo8DhrQjDXwrt+M2hChv8Qe22rlxvRjHxUZk0+N9j69lbJdGm3K2T6W2FvxzS59E56tjgBqsn/
	to7SA7jtNdSWrzXlQR5gB8uyaIWypg39PQmfFQsOCdwhqPINKVqnr21Dez4pmZl4cVvYrpqSn8HFj
	m55LinD0QJ0K/FwkkSUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnfhH-007bX6-3w; Thu, 18 Nov 2021 11:35:19 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnfhA-007bTz-Cg
 for linux-riscv@lists.infradead.org; Thu, 18 Nov 2021 11:35:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=2FKmJS6pPsuFItuqwY5/BZNuOqJxZWzsh/
 DAz8KS9ck=; b=Ki5YfVoOfVm5ifuMWBYH8GFbkiM/fkkj9SyV3yNcGZ2gA2de1H
 maQk39tTqQ+V2MFQ1PUUxy2hR8t3Pl57rjNL0RLfAR0TltLmUOdJgSnp0sBr+2E9
 8cWGJFhBxydmHw/hW65F0isu5GH1BsI7P4hKjOIV0996V5ErqabxA5ubg=
Received: from xhacker (unknown [101.86.18.22])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygBnLsxMOpZhi51cAQ--.6032S3; 
 Thu, 18 Nov 2021 19:34:38 +0800 (CST)
Date: Thu, 18 Nov 2021 19:24:42 +0800
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
Subject: [PATCH 06/12] riscv: extable: use `ex` for `exception_table_entry`
Message-ID: <20211118192442.3ef1c1cc@xhacker>
In-Reply-To: <20211118192130.48b8f04c@xhacker>
References: <20211118192130.48b8f04c@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygBnLsxMOpZhi51cAQ--.6032S3
X-Coremail-Antispam: 1UD129KBjvdXoW7GFy3GFyxJF1UurW3Cw4rKrg_yoWkKFX_Ga
 4I9a4kWrW5JF4fGF1DKrs5Ary8KrZaqr4kGw4Iy34qyF17WrWjkr4qv3ZxJrn2gr1rZr47
 AFZ7XrW3GryaqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbSAYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7
 IE14v26r18M28IrcIa0xkI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CE
 w4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6x
 kF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
 c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
 8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
 s4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCF04k20x
 vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
 3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIx
 AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
 cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
 IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j1T5LUUUUU=
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_033512_906294_CD82B18D 
X-CRM114-Status: GOOD (  10.13  )
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

The var name "fixup" is a bit confusing, since this is a
exception_table_entry. Use "ex" instead  to refer to an entire entry.
In subsequent patches we'll use `fixup` to refer to the fixup
field specifically.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/mm/extable.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/mm/extable.c b/arch/riscv/mm/extable.c
index d41bf38e37e9..3c561f1d0115 100644
--- a/arch/riscv/mm/extable.c
+++ b/arch/riscv/mm/extable.c
@@ -13,15 +13,15 @@
 
 bool fixup_exception(struct pt_regs *regs)
 {
-	const struct exception_table_entry *fixup;
+	const struct exception_table_entry *ex;
 
-	fixup = search_exception_tables(regs->epc);
-	if (!fixup)
+	ex = search_exception_tables(regs->epc);
+	if (!ex)
 		return false;
 
 	if (regs->epc >= BPF_JIT_REGION_START && regs->epc < BPF_JIT_REGION_END)
-		return rv_bpf_fixup_exception(fixup, regs);
+		return rv_bpf_fixup_exception(ex, regs);
 
-	regs->epc = (unsigned long)&fixup->fixup + fixup->fixup;
+	regs->epc = (unsigned long)&ex->fixup + ex->fixup;
 	return true;
 }
-- 
2.33.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
