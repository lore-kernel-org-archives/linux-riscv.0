Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD3ED68BD2
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Nov 2024 10:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ERvq1Huxm9+gFEMQYjv+isdwUO8WEIOuKkVposLfnFo=; b=0POYQURlhr070C
	iYrWPyQNZy8ms3zSBfX+o2d7zcwNSqMUuNprRnsR7Keer/L/8kgb3recBdLMC9ktlzlVVG78+TAoa
	w3tVyXgXU4ALQ7ap7o4rCoLjqEgvZnaaFmXQ2ensEFmJAGx3XqrMUYo6qiA51jIrXOPBK81/wxBBh
	Tbi6iRhEA4WoFB6qG/dSdlxpZBBLxT/mt3pa/ElJa4u+AxWpETD4PItgkJSzG2SwE8kgX4Iyv2PMa
	er3uujHD9Io3xh9qiYB6nojnUkWwjlSfpXmGJhps8gtVCXMT5qDNRUHcowr9iXCFFAqgsBoUTzfvV
	xWA15eJ6pivlFw/q4XhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCGGp-00000005Qjj-1zWS;
	Sat, 16 Nov 2024 10:43:15 +0000
Received: from smtp86.cstnet.cn ([159.226.251.86] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCGGl-00000005Qix-1bpr
	for linux-riscv@lists.infradead.org;
	Sat, 16 Nov 2024 10:43:13 +0000
Received: from zhangkai$iscas.ac.cn ( [175.164.144.183] ) by
 ajax-webmail-APP-16 (Coremail) ; Sat, 16 Nov 2024 18:42:58 +0800
 (GMT+08:00)
X-Originating-IP: [175.164.144.183]
Date: Sat, 16 Nov 2024 18:42:58 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: zhangkai@iscas.ac.cn
To: Walmsley <paul.walmsley@sifive.com>, Dabbelt <palmer@dabbelt.com>, 
	Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: fix memory leakage in
 process_accumulated_relocations
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.1-cmXT5 build
 20240627(e6c6db66) Copyright (c) 2002-2024 www.mailtech.cn cnic.cn
MIME-Version: 1.0
Message-ID: <35cab46a.6d145.19334919ed0.Coremail.zhangkai@iscas.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: sQCowAC3vwczdzhn83MCAA--.31286W
X-CM-SenderInfo: x2kd0wxndlqxpvfd2hldfou0/1tbiBgsDBmc36Uv1MQABs-
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241116_024311_786059_DADF77C2 
X-CRM114-Status: UNSURE (   2.41  )
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

When module relocation is done, process_accumulated_relocations()
frees all dynamic allocated memory. rel_head_iter-&gt;rel_entry is
missed to free that kmemleak might report:

unreferenced object 0xffffffd880c5fc40 (size 16):
  comm "insmod", pid 1101, jiffies 4295045138
  hex dump (first 16 bytes):
    e0 c0 f5 87 d8 ff ff ff 60 c5 f5 87 d8 ff ff ff  ........`.......
  backtrace (crc d2ecb20c):
    [&lt;00000000b01655f6&gt;] kmalloc_trace_noprof+0x268/0x2f6
    [&lt;000000006dc0067a&gt;] add_relocation_to_accumulate.constprop.0+0xf2/0x1aa
    [&lt;00000000e1b29a36&gt;] apply_relocate_add+0x13c/0x36e
    [&lt;000000007543f1fb&gt;] load_module+0x5c6/0x83e
    [&lt;00000000abce12e8&gt;] init_module_from_file+0x74/0xaa
    [&lt;0000000049413e3d&gt;] idempotent_init_module+0x116/0x22e
    [&lt;00000000f9b98b85&gt;] __riscv_sys_finit_module+0x62/0xae

Signed-off-by: Kai Zhang <zhangkai@iscas.ac.cn>
---
 arch/riscv/kernel/module.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 1cd461f3d87..f8c3c4b47dc 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -643,6 +643,7 @@ process_accumulated_relocations(struct module *me,
                        }
                        reloc_handlers[curr_type].accumulate_handler(
                                me, location, buffer);
+                       kfree(rel_head_iter-&gt;rel_entry);
                        kfree(rel_head_iter);
                }
                kfree(bucket_iter);
-- 
2.39.5

</zhangkai@iscas.ac.cn>
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
