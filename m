Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359B8C8303C
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 11:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=aw+ezhlfdhZnJYJ8l+pKcT1JUOEZYw/HV1UuR0aA6w8=; b=p+w
	YJKhWU3wjhIUquz2db+eM5elbSnKBJ7VjmVqh/YUtDcoXusw07odpt5/yLa2hwX/69+NnYrxVVi/t
	FSTvKswnHm+EnV0BoEiPpswhQQxBquzbqPKwf9YKNoa7JB/UUhCtVrsjk03PfPMLP3gJ9pAgY0BNH
	IWUewzZ79dVK1LQnVlvhk7P9S1XGdhK5ej+m62hAXmLyaWSXZ4ZoCGl6c48LX7Y1z5JI4cS0AROOk
	Z45TyTNOW5fCIamr5SzUbWBlbe7RyBmLJBc7JQSLYWXaBMcFm2mApPKvtKGcJWzEKSGPN8fazRU/+
	ECIsHKyEZFoJXfMiJPctKkULqITvYDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYkVT-00000002Mb1-0YeD;
	Mon, 07 Jul 2025 11:59:35 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYk78-00000002Hy0-3eRG
	for linux-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 11:34:28 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bbMZz5wxqz5F2lj;
	Mon,  7 Jul 2025 19:34:19 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 567BY9ui054882;
	Mon, 7 Jul 2025 19:34:09 +0800 (+08)
	(envelope-from liu.xuemei1@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 7 Jul 2025 19:34:11 +0800 (CST)
Date: Mon, 7 Jul 2025 19:34:11 +0800 (CST)
X-Zmail-TransId: 2afc686bb0b3ffffffffd8c-e36cd
X-Mailer: Zmail v1.0
Message-ID: <20250707193411886Kc-TWknP0PER2_sEg-byb@zte.com.cn>
Mime-Version: 1.0
From: <liu.xuemei1@zte.com.cn>
To: <paul.walmsley@sifive.com>
Cc: <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <liu.xuemei1@zte.com.cn>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSByaXNjdjogbW1hcCgpOiB1c2UgdW5zaWduZWQgb2Zmc2V0IHR5cGUgaW4gcmlzY3Zfc3lzX21tYXA=?=
X-MAIL: mse-fl2.zte.com.cn 567BY9ui054882
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 686BB0BB.003/4bbMZz5wxqz5F2lj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_043427_057088_94E85B20 
X-CRM114-Status: UNSURE (   9.76  )
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

From: Jessica Liu <liu.xuemei1@zte.com.cn>

The variable type of offset should be consistent with the relevant
interfaces of mmap which described in commit 295f10061af0 ("syscalls:
mmap(): use unsigned offset type consistently). Otherwise, a user input
with the top bit set would result in a negative page offset rather than a
large one.

Signed-off-by: Jessica Liu <liu.xuemei1@zte.com.cn>
---
 arch/riscv/kernel/sys_riscv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index d77afe05578f..795b2e815ac9 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -10,7 +10,7 @@

 static long riscv_sys_mmap(unsigned long addr, unsigned long len,
 			   unsigned long prot, unsigned long flags,
-			   unsigned long fd, off_t offset,
+			   unsigned long fd, unsigned long offset,
 			   unsigned long page_shift_offset)
 {
 	if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))
-- 
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
