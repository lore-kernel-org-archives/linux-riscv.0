Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C59C87FD3
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Aug 2025 02:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=hk7U+41D+2QHO30MB5EMBWVjWGd/UGpz2uJrQXcCpig=; b=BnB
	246H/f84XJVTvmkg4Gr0xdL8qNnrlLyqJlQ4NpKiXKpwMcnZJ2Zsgk/9GaUDLUFnpAtsWOFdntat0
	I36V4+mCGp8w2DEqRiNcpFA2jN6g1DGGK1gm5Mqlt/giVOrXzObVsmsQB1/CzwPlkEZM9oa6dCdqf
	4QakrntufYw5xVSdwrX6eiMV0rj25yPNK1s9EWJ1Bdo+1TBDXNeTsv+Wx2dzvop2z0U3vCnNbUVSK
	+dGR0S2kGrqwsyNcrpoXjofoGeyGvXNAoAKmrMavngP16GnqE3RvfFs71N/fakDVRoN3WQd0dKIJr
	ghssEf44I83JnfkQBF6T4a7cZa3roMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhfqU-00000004qmi-3zZ0;
	Fri, 01 Aug 2025 02:50:10 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhfqS-00000004qlu-0Wf8
	for linux-riscv@lists.infradead.org;
	Fri, 01 Aug 2025 02:50:09 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4btVmR0ZDYz5B15M;
	Fri, 01 Aug 2025 10:49:59 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 5712nlsR073301;
	Fri, 1 Aug 2025 10:49:47 +0800 (+08)
	(envelope-from liu.xuemei1@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 1 Aug 2025 10:49:48 +0800 (CST)
Date: Fri, 1 Aug 2025 10:49:48 +0800 (CST)
X-Zmail-TransId: 2afb688c2b4cffffffffbab-fbbcd
X-Mailer: Zmail v1.0
Message-ID: <20250801104948133AaMr5S6E382PbNNhoJgHA@zte.com.cn>
Mime-Version: 1.0
From: <liu.xuemei1@zte.com.cn>
To: <paul.walmsley@sifive.com>
Cc: <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <liu.xuemei1@zte.com.cn>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIFJFU0VORF0gcmlzY3Y6IG1tYXAoKTogdXNlIHVuc2lnbmVkIG9mZnNldCB0eXBlIGluIHJpc2N2X3N5c19tbWFw?=
X-MAIL: mse-fl2.zte.com.cn 5712nlsR073301
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: liu.xuemei1@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Fri, 01 Aug 2025 10:49:59 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 688C2B57.000/4btVmR0ZDYz5B15M
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_195008_332916_C71ADCF6 
X-CRM114-Status: UNSURE (   8.88  )
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
