Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED908C53210
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 19:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Js8SicrhbJphl2UQ+M1k+Ivp4hK4dYoYtRsXhHRTp9E=; b=WMHSezi8wqeu4X
	Qr8QRMGM5fz1pfY7nYyk2l5uL1WuIc7iTYs+pZC9e2Z2MBMBKnS12NL4DlzZ+99YQXKBLqlUMlZgv
	hPJJl6xnrmXGV/vCKyjpZaaWX0BNWw4i5LlAz9J6UN+KDUgcq4KsgaSSQRStVohNzcV7y8AGdiuRE
	U7QpCLxjHq8BsvN9m0C1526zN+PPp5HZXtz1XYo6jRONr5KBbsTVfLTukBA/TAALWQIeoMXY+Mhs6
	EJlyHQKna0ZYFSKUfrFtfqVtP/XN6eWS+Zf8p937NhMljO6i5yYYbj1DMm7NEm75KGkcszDNqL6Zq
	h6yyd9A7enAcF3oe0oqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCmXZ-004AQQ-2p; Tue, 03 Jan 2023 19:01:37 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCakq-00H5J2-MP
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 06:26:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1672727181; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HLc6usdQFw1V4J4xOQTFnTvQwisCic+IOi0OJbaFfuNKEKccGnWX1IZgT5bO2TfSjnsTcrJFfdoKrm2yp0QdbBnIJLQUOBlJYWDLnklf3VSIMWLpO7UmqN7XCNpWXytv4OEjOOaJS7NZKw8TJd81Wj22whGpw/VnXtBES+QFVBw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1672727181; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=uJ3t6JD+AXMozpVr5tnYHignzgh6Ade+tUcB/eFjs9c=; 
	b=lX1tTW3IJwH5Q/Mnn5e55Wo0JCL3t4bNUo8qBPYjTH504aUX7tnLwbIDgJQjiC9AZJYmVmyW0Um44YOdd842nzT6vuGrldQ8/xnJ8TLAvSxWfuJs1jrN5ccHha9ExL8aYEGxk0uqUYJttSQti7qcX24phXTVdMooChSkDTo46uY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1672727181;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=uJ3t6JD+AXMozpVr5tnYHignzgh6Ade+tUcB/eFjs9c=;
	b=QU02/qMdtbflCRTbQJidVaAjCIYVFh9mRFDTHNfsTuV5jCdSYWr5dRmx+/3pZIaG
	oMH6M81NCfoJT4Iz3vWhunIQCBNU1ed3k9kRVYYbewOuvHsi/lBfGWABCvDH8MG6Yx5
	93cuTuexK8d0sMuBy28jMOfV4rNJ8ay+37JKzgjE=
Received: from edelgard.fodlan.icenowy.me (120.85.96.143 [120.85.96.143]) by mx.zohomail.com
	with SMTPS id 1672727180195400.7884683338301; Mon, 2 Jan 2023 22:26:20 -0800 (PST)
From: Icenowy Zheng <uwu@icenowy.me>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Subject: [PATCH RESEND 1/2] riscv: errata: fix T-Head dcache.cva encoding
Date: Tue,  3 Jan 2023 14:26:09 +0800
Message-Id: <20230103062610.69704-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_222632_879430_1A1BFC50 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 03 Jan 2023 10:21:58 -0800
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

The dcache.cva encoding shown in the comments are wrong, it's for
dcache.cval1 (which is restricted to L1) instead.

Fix this in the comment and in the hardcoded instruction.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Tested-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
---
Included when resending:
- Sergey's Tested-by tag.

 arch/riscv/include/asm/errata_list.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 4180312d2a70..605800bd390e 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -102,7 +102,7 @@ asm volatile(ALTERNATIVE(						\
  * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
  *   0000001    01001      rs1       000      00000  0001011
  * dcache.cva rs1 (clean, virtual address)
- *   0000001    00100      rs1       000      00000  0001011
+ *   0000001    00101      rs1       000      00000  0001011
  *
  * dcache.cipa rs1 (clean then invalidate, physical address)
  * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
@@ -115,7 +115,7 @@ asm volatile(ALTERNATIVE(						\
  *   0000000    11001     00000      000      00000  0001011
  */
 #define THEAD_inval_A0	".long 0x0265000b"
-#define THEAD_clean_A0	".long 0x0245000b"
+#define THEAD_clean_A0	".long 0x0255000b"
 #define THEAD_flush_A0	".long 0x0275000b"
 #define THEAD_SYNC_S	".long 0x0190000b"
 
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
