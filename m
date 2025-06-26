Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5E1C7EE31
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 13:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=LapIw4jKvaNOf4l1Vp7a3SDZZ4xq1DwSRXVtW5IDITY=; b=SbA
	o9EkQ27P/8qS7zsegTFGsN3sAA7D3Xrf7InlXoYwl5L1NdxyrKmE3Vqbv2z/5dTPGG+IH8qKmyCts
	W8dPkptwUctgsIzUWk5in/yqni/IQ5wHExQQGvTmfhVVPp/TmyUzsA8lZ0+spNSxX3PPakZTgclWT
	jYJz3ev4hQwaU21ora0dMmUPHn4PbiJ1C7FEYGJRKOZIwVUjZVpaSJmsp697vXkxwCHKsP3nSz8tB
	QrT0UThBqpUgaqGxHRPmtwQOkao+RKy+XT0rC/FJmsWZbfW1ZFBnlyr/LZ58ck030MAd5lEgLdu59
	BOp6Hb/v7+N3CuVAFyW/U2D+v+mW21w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUmpZ-0000000Bhf0-2SWH;
	Thu, 26 Jun 2025 13:39:57 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUmpX-0000000BhdH-20Bi
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 13:39:57 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bSftr73mzz5DXWB;
	Thu, 26 Jun 2025 21:39:48 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 55QDdeDM050911;
	Thu, 26 Jun 2025 21:39:40 +0800 (+08)
	(envelope-from liu.xuemei1@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Thu, 26 Jun 2025 21:39:44 +0800 (CST)
Date: Thu, 26 Jun 2025 21:39:44 +0800 (CST)
X-Zmail-TransId: 2afc685d4da0fffffffff94-54fe5
X-Mailer: Zmail v1.0
Message-ID: <20250626213944317IZBOF3xjZuAg2_MvpZZtY@zte.com.cn>
Mime-Version: 1.0
From: <liu.xuemei1@zte.com.cn>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBzeXNjYWxsczogbW1hcCgpOiBBbGlnbiBvZmZzZXQgdHlwZSB3aXRoIG90aGVywqByZWxhdGVkIGludGVyZmFjZXM=?=
X-MAIL: mse-fl1.zte.com.cn 55QDdeDM050911
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 685D4DA4.001/4bSftr73mzz5DXWB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_063955_668124_7078590A 
X-CRM114-Status: UNSURE (   8.62  )
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

The variable type of offset should be consistent with the
relevant interfaces of mmap.
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
2.27.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
