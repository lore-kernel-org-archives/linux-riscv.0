Return-Path: <SRS0=Jr9t=KL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D63C433B4
	for <linux-riscv@archiver.kernel.org>; Sun, 16 May 2021 09:06:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79E456101E
	for <linux-riscv@archiver.kernel.org>; Sun, 16 May 2021 09:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79E456101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6IA8CA3Cw3GajPF/VJqER5uEIckrDXYtEWP/q5hWUe0=; b=LEIbDASK4HapG46Lo1Cqz+A6Av
	MdSTdLC8259OFgIFEzGEbPz0MuchLqQlZx7clYRfeTQh7trYPcMnf293SU3er/ojoFvtRSODXx/YO
	J62SUrARTMH4HV4dtU9JCI5mVjaFr5F3C0X1f1RBTQWO7ER0tRHQBBxfMUwOamCumwX7+GFrwxocq
	07Y3J4EyqrJXVy5yrSNZFV4pjv6Ub7X3N4GjAC66aXTbFgYAMgXzB3WbiwU5bv2uz89Qk0Q1AXqg1
	ESjNEb9bVeber43b1rcHvaWMw7P/CfXd8uD3DRCSSh6OL+EYhCJIZT8sn5AyvZ+0+8KTBOtsd/QJm
	2T4P/Mgg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liCjK-00BvqZ-SG; Sun, 16 May 2021 09:06:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liCjG-00BvqA-QA
 for linux-riscv@desiato.infradead.org; Sun, 16 May 2021 09:06:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=82ev4WrHlCM6m2oDloWonyDePdJ1Dqn97nE4BLyxn4E=; b=3stavh6jA08Puf5gPkwfJ9Mqis
 AEzKNNGqlcdmWgpit0p2DLjYPAThsYjgp9O/BT91KLuEfZlgH/lvvtLGMqeEl4XIhhIreJxliIX2e
 EVKgkDlAmI39ikZrOY/rhsKm6Rw1AVQLoayvtuVI3yWZc/YN9JuuOjLrCWR7IknMsnXcQKPjsBlXR
 VS2wT4HJOM8sHE0VLThy1qiRgfZCKR9k0pvIcIaqQQtDGCihj7bnfRrNXkjwVkgAw5hx8g0T3qdXV
 FY73w10QZQURAtUKCoHEMVWBktwjPWOTV4p/lQ2NGIis5082ObOpSlVGUiX5Dy6anxqSBWMXTTPKT
 NoOPuM9g==;
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1liCj9-00Cpc8-MW
 for linux-riscv@lists.infradead.org; Sun, 16 May 2021 09:06:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=82ev4WrHlCM6m2oDloWonyDePdJ1Dqn97nE4BLyxn4E=; b=gUHLKGlcxq03y
 uVaMyZ0VcY4X9YFGAYDgM/tVLcFLT0avnXMFrTG8eDE0eQlk/W5/U4QLBvpgvlYk
 DDiiU+cknZSDi//kSmGQ43vwJWUAnwByiZk6krD3QOTNZrwtVIXtAO2Nar6++iTd
 QuzCJS8xhBnx4R+1S0+vlncAjBEmmQ=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygDX3Jh74KBgfKLnAA--.16886S2; 
 Sun, 16 May 2021 17:06:03 +0800 (CST)
Date: Sun, 16 May 2021 17:00:38 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: mm: Fix W+X mappings at boot
Message-ID: <20210516170038.7de9c866@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygDX3Jh74KBgfKLnAA--.16886S2
X-Coremail-Antispam: 1UD129KBjvJXoWxury3Ww15KrW8GFWDZr43Wrg_yoWrAF18pr
 y3JrnrWr48tr1xWr9rCry5Zr1UJF1jy3W3tr17Ar15ZF1UGw1UXr18AF4IgFyqg3yDXFsx
 Ar9Fyw40gw4qyaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E
 4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
 WUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
 Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rV
 WrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_
 GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5PpnJUUUUU==
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210516_020624_429331_40479497 
X-CRM114-Status: GOOD (  10.24  )
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

When the kernel mapping was moved the last 2GB of the address space,
(__va(PFN_PHYS(max_low_pfn))) is much smaller than the .data section
start address, the last set_memory_nx() in protect_kernel_text_data()
will fail, thus the .data section is still mapped as W+X. This results
in below W+X mapping waring at boot. Fix it by passing the correct
.data section page num to the set_memory_nx().

[    0.396516] ------------[ cut here ]------------
[    0.396889] riscv/mm: Found insecure W+X mapping at address (____ptrval____)/0xffffffff80c00000
[    0.398347] WARNING: CPU: 0 PID: 1 at arch/riscv/mm/ptdump.c:258 note_page+0x244/0x24a
[    0.398964] Modules linked in:
[    0.399459] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.13.0-rc1+ #14
[    0.400003] Hardware name: riscv-virtio,qemu (DT)
[    0.400591] epc : note_page+0x244/0x24a
[    0.401368]  ra : note_page+0x244/0x24a
[    0.401772] epc : ffffffff80007c86 ra : ffffffff80007c86 sp : ffffffe000e7bc30
[    0.402304]  gp : ffffffff80caae88 tp : ffffffe000e70000 t0 : ffffffff80cb80cf
[    0.402800]  t1 : ffffffff80cb80c0 t2 : 0000000000000000 s0 : ffffffe000e7bc80
[    0.403310]  s1 : ffffffe000e7bde8 a0 : 0000000000000053 a1 : ffffffff80c83ff0
[    0.403805]  a2 : 0000000000000010 a3 : 0000000000000000 a4 : 6c7e7a5137233100
[    0.404298]  a5 : 6c7e7a5137233100 a6 : 0000000000000030 a7 : ffffffffffffffff
[    0.404849]  s2 : ffffffff80e00000 s3 : 0000000040000000 s4 : 0000000000000000
[    0.405393]  s5 : 0000000000000000 s6 : 0000000000000003 s7 : ffffffe000e7bd48
[    0.405935]  s8 : ffffffff81000000 s9 : ffffffffc0000000 s10: ffffffe000e7bd48
[    0.406476]  s11: 0000000000001000 t3 : 0000000000000072 t4 : ffffffffffffffff
[    0.407016]  t5 : 0000000000000002 t6 : ffffffe000e7b978
[    0.407435] status: 0000000000000120 badaddr: 0000000000000000 cause: 0000000000000003
[    0.408052] Call Trace:
[    0.408343] [<ffffffff80007c86>] note_page+0x244/0x24a
[    0.408855] [<ffffffff8010c5a6>] ptdump_hole+0x14/0x1e
[    0.409263] [<ffffffff800f65c6>] walk_pgd_range+0x2a0/0x376
[    0.409690] [<ffffffff800f6828>] walk_page_range_novma+0x4e/0x6e
[    0.410146] [<ffffffff8010c5f8>] ptdump_walk_pgd+0x48/0x78
[    0.410570] [<ffffffff80007d66>] ptdump_check_wx+0xb4/0xf8
[    0.410990] [<ffffffff80006738>] mark_rodata_ro+0x26/0x2e
[    0.411407] [<ffffffff8031961e>] kernel_init+0x44/0x108
[    0.411814] [<ffffffff80002312>] ret_from_exception+0x0/0xc
[    0.412309] ---[ end trace 7ec3459f2547ea83 ]---
[    0.413141] Checked W+X mappings: failed, 512 W+X pages found

Fixes: 2bfc6cd81bd17e43 ("riscv: Move kernel mapping outside of linear mapping")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/mm/init.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 4faf8bd157ea..4c4c92ce0bb8 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -746,14 +746,18 @@ void __init protect_kernel_text_data(void)
 	unsigned long init_data_start = (unsigned long)__init_data_begin;
 	unsigned long rodata_start = (unsigned long)__start_rodata;
 	unsigned long data_start = (unsigned long)_data;
-	unsigned long max_low = (unsigned long)(__va(PFN_PHYS(max_low_pfn)));
+#if defined(CONFIG_64BIT) && defined(CONFIG_MMU)
+	unsigned long end_va = kernel_virt_addr + load_sz;
+#else
+	unsigned long end_va = (unsigned long)(__va(PFN_PHYS(max_low_pfn)));
+#endif
 
 	set_memory_ro(text_start, (init_text_start - text_start) >> PAGE_SHIFT);
 	set_memory_ro(init_text_start, (init_data_start - init_text_start) >> PAGE_SHIFT);
 	set_memory_nx(init_data_start, (rodata_start - init_data_start) >> PAGE_SHIFT);
 	/* rodata section is marked readonly in mark_rodata_ro */
 	set_memory_nx(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
-	set_memory_nx(data_start, (max_low - data_start) >> PAGE_SHIFT);
+	set_memory_nx(data_start, (end_va - data_start) >> PAGE_SHIFT);
 }
 
 void mark_rodata_ro(void)
-- 
2.31.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
