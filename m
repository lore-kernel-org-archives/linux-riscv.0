Return-Path: <SRS0=TuAZ=JO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D24C433B4
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Apr 2021 02:36:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FAB061107
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Apr 2021 02:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FAB061107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6mZxDC/yV4Pf232wXGIze5vsT6A/fd0tTR8kcvc3kO4=; b=LShShX8p9UYjyclQhasOOZpyM6
	p7gVwR9ROyH757KXA1iGuQskFZogq5CrFaDL7IGnODKIaeJ/1tVkL/DpZfiRQAYbvPn85e1eCRXTo
	9wKQphYmT/j+0PqnVZU/rR1ErQhrOA/SqkRmweXo/w32WVFDG/sjo4tEtd73ZiTStHucU+jHbw4n0
	EUfDzsDer78vrxmFBDhcN0WIrIqJpd5/mdUGgkJFrz9rbaPrcaaJcHtYtzQrrHAw4xl0YCN4m2ioM
	mY3oKFOLS111OFPGuOSIfcu18zCdFZukan7/iTtpxpYcdA2UO0i78E3ldI7MXdgJU3NmLUbEPebD9
	dL1NrXqw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXaoP-00466z-Nt; Sat, 17 Apr 2021 02:35:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXaoL-00466h-Mw
 for linux-riscv@desiato.infradead.org; Sat, 17 Apr 2021 02:35:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=WBtF7ShZgOdDfRdkPjIMUaShKz3kOJxiC9/QGP7brzE=; b=F4LbADLLP0PHLMjcsl2nVOJQuC
 T9cTtwUNleHvARTkKchZmXJp3AL8ZC//0YiKyvXWYWDTYlkT84LZlnMTQgdakNoPe+8vVyy9rjGa2
 a5wHquXnmih3YrxYRaycFFMcI61e1N/vZPGj5Yj0HA+mls8tVL9fetj2BJyMOvLcsv7uFRYam2uPv
 Drp2H2/4yxJ8OLdS7C/Kr8pUNPe4EpmhiJzKqAUwMBSRAwCaFUOCefLb4jT5OwwXMfCJucs4SHWmu
 6PzQUFwJZrqJ2NNTX20OgKVbH+esOOKjAtyxUDUn7kDn4sHRf6ylg9NuuwKqOMGwe8wMP1P1wicU/
 i2KVAyvQ==;
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXaoI-009pnr-DF
 for linux-riscv@lists.infradead.org; Sat, 17 Apr 2021 02:35:52 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 em21-20020a17090b0155b029014e204a81e6so7195024pjb.1
 for <linux-riscv@lists.infradead.org>; Fri, 16 Apr 2021 19:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WBtF7ShZgOdDfRdkPjIMUaShKz3kOJxiC9/QGP7brzE=;
 b=W0yoxzvP5XGbiyELAXVqcBl+TKvA92hXvOeD+2U4Kv8XBM4ELg70LpCy4QaeAjHU4S
 QJ1JZDVw1G1sybiYw5VwvlgLJ70+YaO9jie1hMG51MQfuJxA7WRrKrW6EVfJlNhrKaOv
 ksqqEQF4Ym5pcssHmP7G0SfblD8zFGyVNQbYhc3x03jyvkMytY6FqDTNaEk4TQMj/c8F
 /lMsnMr7IFiwtik1AaDzGljUe+itg2ftjCelgnnOU5f7mmcyTZXGYSUubI1NFR0cF+Re
 I/kPNzQCZLwxuxhVeCQsFnzd0ODYp9KJrfaMbJBIOFFnz4RKL/HA63n3ebF6p3BvzMUl
 +33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WBtF7ShZgOdDfRdkPjIMUaShKz3kOJxiC9/QGP7brzE=;
 b=gl3GbZB7mp16J0VbKzeAJm5JBzBdgLHftaW83G6MRlO4Hd6Q2w/AfK6dXwruIoux+I
 KumbD19z8Pp1l//wnRRgOyTp4TQjOJfh+gyIkeY9YOpqcNAGKCL8bh6MrkKzW60J0Q5c
 u7GyCCFL/2UgwM+A1+eClCJduFUjRiujxGcNafezEDNEWjBpTsGKw7A3Dbx9MIjt6cze
 BgfsTzY4tbbnX8wgbU2lM9Fm+FHL+R9fcgpCkoxG5wZ49Ru7dyG3aaHvwxd4UJRxAJnw
 G/2tz0CY50C9BVeByVapm4sPOeJ6WKiLsUEkgiPTVZS2P6Dr5X7KZWsZ50pqyUpMpZ61
 CuUA==
X-Gm-Message-State: AOAM531izPoJ7hAJ5N6CaT103RLVfmY/ilrdXoxzvkntkzqcKW2SdoC9
 SdponEP+5GkDKH2WB070eH8Rk3IJHHiGFJL3
X-Google-Smtp-Source: ABdhPJwcKV+tIspk6bhs64F3SfxnyLS+DJsCdMGPbkZ3MCsaeIaNruTQPwxKyHbURrLp1edDZ7uJqA==
X-Received: by 2002:a17:902:7b85:b029:e9:5e4e:e873 with SMTP id
 w5-20020a1709027b85b02900e95e4ee873mr12439496pll.7.1618626949199; 
 Fri, 16 Apr 2021 19:35:49 -0700 (PDT)
Received: from vultr.guest ([141.164.41.4])
 by smtp.gmail.com with ESMTPSA id o9sm6562049pfh.217.2021.04.16.19.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 19:35:48 -0700 (PDT)
From: Changbin Du <changbin.du@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Changbin Du <changbin.du@gmail.com>
Subject: [PATCH] riscv: patch: remove lockdep assertion on lock text_mutex
Date: Sat, 17 Apr 2021 10:35:32 +0800
Message-Id: <20210417023532.354714-1-changbin.du@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_193550_484571_4461321C 
X-CRM114-Status: GOOD (  12.75  )
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

The function patch_insn_write() expects that the text_mutex is already
held. There's a case that text_mutex is acquired by ftrace_run_update_code()
under syscall context but then patch_insn_write() will be executed under the
migration kthread context as we involves stop machine. So we should remove
the assertion, or it can cause warning storm in kernel message.

[  104.641978] ------------[ cut here ]------------
[  104.642327] WARNING: CPU: 0 PID: 13 at arch/riscv/kernel/patch.c:63 patch_insn_write+0x166/0x17c
[  104.643587] Modules linked in:
[  104.644691] CPU: 0 PID: 13 Comm: migration/0 Not tainted 5.12.0-rc7-00067-g9cdbf6467424 #102
[  104.644907] Hardware name: riscv-virtio,qemu (DT)
[  104.645068] Stopper: multi_cpu_stop+0x0/0x17e <- 0x0
[  104.645349] epc : patch_insn_write+0x166/0x17c
[  104.645467]  ra : patch_insn_write+0x162/0x17c
[  104.645534] epc : ffffffe0000059c6 ra : ffffffe0000059c2 sp : ffffffe002a33c70
[  104.645580]  gp : ffffffe0019e5518 tp : ffffffe002a232c0 t0 : ffffffe01295e8a8
[  104.645622]  t1 : 0000000000000001 t2 : 0000000000000000 s0 : ffffffe002a33cc0
[  104.645675]  s1 : ffffffe000007f72 a0 : 0000000000000000 a1 : ffffffffffffffff
[  104.645716]  a2 : 0000000000000001 a3 : 0000000000000000 a4 : 0000000000000001
[  104.645757]  a5 : ffffffe0799e45c8 a6 : 00000000000ca097 a7 : 0000000000000000
[  104.645798]  s2 : 0000000000000008 s3 : 0000000000000f72 s4 : ffffffe002a33ce0
[  104.645839]  s5 : 0000000000000f7a s6 : 0000000000000003 s7 : 0000000000000003
[  104.645880]  s8 : 0000000000000004 s9 : 0000000000000002 s10: 0000000000000000
[  104.645920]  s11: 0000000000000002 t3 : 0000000000000001 t4 : ffffffe000c615c8
[  104.645958]  t5 : 0000000000007fff t6 : 0000000000000380
[  104.645998] status: 0000000000000100 badaddr: 0000000000000000 cause: 0000000000000003
[  104.646081] Call Trace:
[  104.646147] [<ffffffe0000059c6>] patch_insn_write+0x166/0x17c
[  104.646280] [<ffffffe0000059ec>] patch_text_nosync+0x10/0x32
[  104.646317] [<ffffffe000007d0c>] ftrace_update_ftrace_func+0x74/0xac
[  104.646352] [<ffffffe0000d338a>] ftrace_modify_all_code+0x9c/0x144
[  104.646387] [<ffffffe0000d3444>] __ftrace_modify_code+0x12/0x1c
[  104.646420] [<ffffffe0000c4c2c>] multi_cpu_stop+0xa8/0x17e
[  104.646451] [<ffffffe0000c4474>] cpu_stopper_thread+0xb2/0x156
[  104.646489] [<ffffffe00003645e>] smpboot_thread_fn+0x102/0x1ea
[  104.646524] [<ffffffe0000311b0>] kthread+0x132/0x148
[  104.646556] [<ffffffe000002e02>] ret_from_exception+0x0/0x14
[  104.646657] ---[ end trace ccf71babb9de4d5b ]---
[  104.647444] ------------[ cut here ]------------

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 arch/riscv/kernel/patch.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 0b552873a577..6d2ed9c15065 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -49,19 +49,18 @@ static void patch_unmap(int fixmap)
 }
 NOKPROBE_SYMBOL(patch_unmap);
 
+
+/*
+ * Before reaching here, it was expected to lock the text_mutex
+ * already, so we don't need to give another lock here and could
+ * ensure that it was safe between each cores.
+ */
 static int patch_insn_write(void *addr, const void *insn, size_t len)
 {
 	void *waddr = addr;
 	bool across_pages = (((uintptr_t) addr & ~PAGE_MASK) + len) > PAGE_SIZE;
 	int ret;
 
-	/*
-	 * Before reaching here, it was expected to lock the text_mutex
-	 * already, so we don't need to give another lock here and could
-	 * ensure that it was safe between each cores.
-	 */
-	lockdep_assert_held(&text_mutex);
-
 	if (across_pages)
 		patch_map(addr + len, FIX_TEXT_POKE1);
 
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
