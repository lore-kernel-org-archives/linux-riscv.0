Return-Path: <SRS0=6bm6=KC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F36CC433ED
	for <linux-riscv@archiver.kernel.org>; Fri,  7 May 2021 14:25:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97A8760724
	for <linux-riscv@archiver.kernel.org>; Fri,  7 May 2021 14:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97A8760724
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1H6s+qjoq+x+CbmWJSMmOXCkP+XoML6qTfaXvZgbnNY=; b=UPUGYmEqrBkHJO0ffAdxH0QMoE
	+F25SHtoBjjzucN4nTU8bHfVwVP/s1Yc0hpWNv5YWGAW15upgMEIkcDWeKJPElcOsV3RGpRbV6rjY
	xiZ15z1GJ6IsE8FsRctmKSAZXoDzuBQU6nvKaORpS1OTOrj9sQPziFwjVNf7W41fbsPM9HFAONdDe
	jsJep5KVbbdzft2jfztGUpwnauoCr+m1EGvO+PTn2C3jFutWbJZcqCeLDrFMYCyUbByLqUhsytHr5
	ncgNmGM/d4XNPCXsjVAwD6NloR2ABuPIu/biNZb/wB2eDwfWBloDVA+M2imigTQKtlMUAcLNEeTSY
	X+hA98mg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lf1QB-007Jff-IQ; Fri, 07 May 2021 14:25:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf1Q8-007Je4-61
 for linux-riscv@desiato.infradead.org; Fri, 07 May 2021 14:25:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=M9VvS8e9uZJKj3MO0SwqDdKf35V5JGIaFIP2nALz/jg=; b=nWpXyy64LTHy9j2B9G+As1I3/w
 d85SkFys7SSjJdGH68PsfCkMz6grkpOzVleOYgVbM4qhReSlwSPvwG7LITTHcH6/mWpNxLX72AfXV
 rd+B8V5rB2JPtq5p/QBmNHHUye2iJepTol/4y9tUbUGLX7mjwqbsI27RMuDWFkHNOjfJ4CLJXLqK8
 dIfTmYvHloZV1VlKD5fig/CbMKZD7VJNp1CrXZJnDA4L7es8qgIWq83sDEs39pGBHfm1s9bXGwQet
 Jg9/i3r2XRpmrHpXdAcm3c7HFE8917Pek22QAtJws+e17jj7CYBUpyMyt0+vktO1sOy9CXoJh/exK
 pyn/ECFA==;
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lf1Q1-006vjd-LA
 for linux-riscv@lists.infradead.org; Fri, 07 May 2021 14:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=M9VvS8e9uZJKj3MO0SwqDdKf35V5JGIaFIP2nALz/jg=; b=H38Gs9Zw3OgBa
 Li1eGnNy9a5Rsg+JMnP7ee052GW4mWrLV3JNxl9ojDTewrNw79RntahEIc5U+zi6
 UWLiEcdEZJWMYwHbiC4qy/Mhf2HEt6vlii14tItnKbReQ/w+X+H+cceFSPvGVuMV
 clIu5ZRjQasWBLRxLi8WUa6KMAQBbs=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygDHzprLTZVgPsubAA--.61735S2; 
 Fri, 07 May 2021 22:25:15 +0800 (CST)
Date: Fri, 7 May 2021 22:19:59 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: mm: Remove setup_zero_page()
Message-ID: <20210507221959.2db29936@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygDHzprLTZVgPsubAA--.61735S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar1rCr4Utr1kAr17JrW7CFg_yoW8GF1xpr
 WrGa48urW3Jrs7GFZ2yryqvr18JFn3K34SqryUCwn8Za17Zrn2qr95Kw1rZryqkr4ruayF
 ka4xJ34S93WUAa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CRM114-CacheID: sfid-20210507_072530_406799_9CF068F0 
X-CRM114-Status: UNSURE (   9.07  )
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

The empty_zero_page sits at .bss..page_aligned section, so will be
cleared to zero during clearing bss, we don't need to clear it again.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Anup Patel <anup@brainfault.org>
---

Hi Palmer,

This patch was one of v3 series of "riscv: improve self-protection"
and acked by Anup. I checked Linus tree this tonight, it seems the v2 or
v1 was merged, this patch is missing, so I rebased and sent out this patch.
If it's late for linux-5.13, then I can rebase again once linux-5.13-rc1
is released.

Thanks in advance

 arch/riscv/mm/init.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index dfb5e4f7a670..4a68b029e3d2 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -67,11 +67,6 @@ static void __init zone_sizes_init(void)
 	free_area_init(max_zone_pfns);
 }
 
-static void __init setup_zero_page(void)
-{
-	memset((void *)empty_zero_page, 0, PAGE_SIZE);
-}
-
 #if defined(CONFIG_MMU) && defined(CONFIG_DEBUG_VM)
 static inline void print_mlk(char *name, unsigned long b, unsigned long t)
 {
@@ -862,7 +857,6 @@ RESERVEDMEM_OF_DECLARE(elfcorehdr, "linux,elfcorehdr", elfcore_hdr_setup);
 void __init paging_init(void)
 {
 	setup_vm_final();
-	setup_zero_page();
 }
 
 void __init misc_mem_init(void)
-- 
2.31.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
