Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311BCEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 07:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UXbb+bNBdl73ydFueHwmyM7EJdvjCaHRVkRq4TeG0Ew=; b=pMXrpUedElI3hB2LcUYQdSA3N6
	iNgj/5BwY72FH7m/zV4TRBpp/TSefcuU8jaWVFqiFuOBbXat+uNxf6/lJzDPa+i2hUGavyoM2vvAY
	o+tNec7RQty/ulmguhl7JQEea54RP6NaSEHf5Hexo6uTdn9ifrGyUUA21XO4sBWHPf3e9oSt2VmjB
	+lGaNp/pKpDFQu4GdYOI6VnwLzRjQZ0zemo6zjpxKORJh+MKdgbbpOle9vXHeD29wi+F8NYNH2ZEq
	LO4IsoDjCtZj5Ar0JbZybt1TKW8BagZ3vkxN1JCKElaHuxugKxAH9Kn+qFW/zOj81r1EPVU9f/9j+
	kW63mlkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLIyN-003M8z-1b;
	Mon, 17 Jul 2023 07:48:47 +0000
Received: from [183.242.55.162] (helo=mail.208.org)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLIyI-003M86-2K
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 07:48:45 +0000
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4R4DjK5PzCzBQt25
	for <linux-riscv@lists.infradead.org>; Mon, 17 Jul 2023 15:48:37 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1689580117; x=1692172118; bh=/kxYrL0++3dEyJqHWx6QwRYWm7Q
	FG+zYX+w+fV5AqNk=; b=Tj9LlB/xJxLVJGjDSPttfrSTE+gv7TXZZPCgImVqKOa
	WK2uyONDm/l7Adj3Vb7//rtmmE+u9c0uzxJo1qoZDyZboL5iTEb1fh2Cf/hLk7I4
	Txko/glcLry+TdKAQKtPlMMjKB9zrD3m0XmJgNppI3BtGBifdbUsXobgKcOX8XkW
	J43D/Oz1DqjMAiyq7Woa8tyLGV8csFKDELgzdvBsEM+V5mWLdxNs1nAAL09D1tZW
	bNgSERqZMdXHPbuHt8QtfEFgbzrupZ646e+i8oIEyfYc04QXUrryy33LnTewBvzF
	nrLHqdiZXB99qMw+ofZfP5Iti50m4fl+Rt/4liA1JqQ==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id y3xzpzejkJMh for <linux-riscv@lists.infradead.org>;
	Mon, 17 Jul 2023 15:48:37 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4R4DjK312czBHXgm;
	Mon, 17 Jul 2023 15:48:37 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 17 Jul 2023 15:48:37 +0800
From: hanyu001@208suo.com
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 liaochang1@huawei.com, heiko.stuebner@vrull.eu, conor.dooley@microchip.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: kernel: remove space before ')'
In-Reply-To: <tencent_6B88A6697F6AB7CEBD04EEABA52ACDC66909@qq.com>
References: <tencent_6B88A6697F6AB7CEBD04EEABA52ACDC66909@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <8ef63e3296f5628896f373d696a078f8@208suo.com>
X-Sender: hanyu001@208suo.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_004843_940110_980E2266 
X-CRM114-Status: UNSURE (   7.12  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Fixes checkpatch errors:

riscv/kernel/probes:ERROR:space prohibited before that close parenthesis 
')'
riscv/kernel/probes:ERROR:space prohibited before that close parenthesis 
')'
riscv/kernel/probes:ERROR:space prohibited before that close parenthesis 
')'

Signed-off-by: ztt <1549089851@qq.com>
---
  arch/riscv/kernel/probes/simulate-insn.c | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c 
b/arch/riscv/kernel/probes/simulate-insn.c
index 7441ac8a6843..60792c79b42e 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -128,10 +128,10 @@ bool __kprobes simulate_auipc(u32 opcode, unsigned 
long addr, struct pt_regs *re
      (((opcode) >> 12) & 0x7)

  #define branch_imm(opcode) \
-    (((((opcode) >>  8) & 0xf ) <<  1) | \
+    (((((opcode) >>  8) & 0xf) <<  1) | \
       ((((opcode) >> 25) & 0x3f) <<  5) | \
-     ((((opcode) >>  7) & 0x1 ) << 11) | \
-     ((((opcode) >> 31) & 0x1 ) << 12))
+     ((((opcode) >>  7) & 0x1) << 11) | \
+     ((((opcode) >> 31) & 0x1) << 12))

  #define branch_offset(opcode) \
      sign_extend32((branch_imm(opcode)), 12)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
