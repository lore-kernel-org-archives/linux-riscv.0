Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E20C77B73
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 09:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=T2epb3i4407BRcOaPWH54IiDiYNJQjMIz6to3cU3RY0=; b=DqV
	Ej6B1YQS8UVTpEkNiIVod4pKIlEk7kLl6mWODI1CGzR/ayir+0dxwy6c5uMVPOAoTUTgF2WiBUUCI
	VYNW5x1kr+JLJm2viFDWqoKCoLkdiVEVPdCJtOkb6Nca8BZYZJ4YoRnm7V2//m04CChOThUB4PPje
	+xbiVMCTJXiMBIUSwl0lycZ6RmNxOQRPk3HmkstWWk23vk08WzN8U9XGT5NTPtN3qVnJUcolbWPFD
	hjwST5g191QEXGsavZe2AqGdVuTbDKq+2x0zeoiNiDaMQt6V0xbmEcbSup0n3mUl0EBkfUrMI2eJh
	eao7sd9zZyQZ7/715eRo3711Tqbu5iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvDxO-00Cxe2-2I;
	Sat, 06 May 2023 09:11:58 +0000
Received: from mxhk.zte.com.cn ([63.216.63.40])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvDxL-00CxdG-2f
	for linux-riscv@lists.infradead.org;
	Sat, 06 May 2023 09:11:57 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4QD1yf11sMz8RTWg;
	Sat,  6 May 2023 17:11:54 +0800 (CST)
Received: from xaxapp03.zte.com.cn ([10.88.97.17])
	by mse-fl1.zte.com.cn with SMTP id 3469BcJB042686;
	Sat, 6 May 2023 17:11:39 +0800 (+08)
	(envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid31;
	Sat, 6 May 2023 17:11:41 +0800 (CST)
Date: Sat, 6 May 2023 17:11:41 +0800 (CST)
X-Zmail-TransId: 2afa645619cdfffffffff19-ec7f7
X-Mailer: Zmail v1.0
Message-ID: <202305061711417142802@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <paul.walmsley@sifive.com>
Cc: <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <guoren@kernel.org>,
        <sergey.matyukevich@syntacore.com>, <dylan@andestech.com>,
        <ajones@ventanamicro.com>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSByaXNjdjogbW06IHVzZSBiaXRtYXBfemVybygpIEFQSQ==?=
X-MAIL: mse-fl1.zte.com.cn 3469BcJB042686
X-Fangmail-Gw-Spam-Type: 0
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 645619DA.000/4QD1yf11sMz8RTWg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_021156_017356_7205543C 
X-CRM114-Status: UNSURE (   9.26  )
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

From: Ye Xingchen <ye.xingchen@zte.com.cn>

bitmap_zero() is faster than bitmap_clear(), so use bitmap_zero()
instead of bitmap_clear().

Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
---
 arch/riscv/mm/context.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 12e22e7330e7..217fd4de6134 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -67,7 +67,7 @@ static void __flush_context(void)
 	lockdep_assert_held(&context_lock);

 	/* Update the list of reserved ASIDs and the ASID bitmap. */
-	bitmap_clear(context_asid_map, 0, num_asids);
+	bitmap_zero(context_asid_map, num_asids);

 	/* Mark already active ASIDs as used */
 	for_each_possible_cpu(i) {
-- 
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
