Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58E0606A31E
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 08:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mIPLq5yi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=XxKi/Wue
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Message-Id:Subject:From:Cc
	:To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ulOw5d0x2ZM0pMQ5r3A202YtaalbRlhkzquGXiLboI8=; b=mIPLq5yiB6rJ6qewRvReCtoABD
	OxFVIe1Rfb5BkkOcOoDdo/STlJXM4gQkuGg16p1+HB0PJYWLCV2UM6aD6aZbBcLUs/OY3CtsQgGgN
	Qyo8qUDOsSq4jLTP0cFcagLJ0D+mZOtqTciMsxy+yq+ytNSwsik2RfcRCj4LD5SdKDSAgP7VXcGnO
	sNuENZPL1UXsw3CmnKbQlXpoFUUIF2lfOVFumHxtOEYymR35lp9YYYOpT3WgSGJLkjqr2CS7KO/Vk
	VSh83BAZi+TTz+EvJ8ikh6BrCNBw0j2dCGuWIkPH/vfgQBnNWt9NG3VpNk8yTo/hyp31dKKrlRTWx
	DkSuT7vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqvb-0000000FDq2-0rG7;
	Fri, 27 Nov 2026 08:03:31 +0000
Received: from va-1-113.ptr.blmpb.com ([209.127.230.113])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqvY-0000000FDpc-1iIB
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 08:03:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1795766602; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=0RZ5dxG2grK3rjtg5lF0GuhnIYQk1vrvlMy+fP93lpY=;
 b=XxKi/WuenmIxe5Es4ockSd2Xg7kVg6FhIwTXskEAc2vMRmpGlP19rIzunbqrx4tzayrkm/
 wm/JLebQZT1+AsIb3eQxlhnRnutevjbAZ6djx7vIqZ/YvFkF594haRDPeYgHpznnORJTDP
 Tw6pSLeZJOuTS1SGfKHt99iCo1Ll+b0O2L3paYv/wloUU3NJIGNsQmq0a7CP9jCb+EMx1r
 7TFR8R93jb1nI5CbRUeYbZXEuJ946YtZhv8B9OxtPivQ8wphUaH0Q4Qlxf7x95byc367z1
 Ox/tHLagxi2KcjhzmKpZ4ec4SlEaEvVADD+2Gk9Vrmebqdxzc2J8xSIbXfWx1w==
Date: Fri, 27 Nov 2026 16:03:00 +0800
To: "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>, 
	"zhaogongyi" <zhaogongyi@bytedance.com>
From: "zhaogongyi" <zhaogongyi@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Subject: [PATCH] riscv: smp: Report an unusable boot CPU node
Message-Id: <20261127080300.93478-1-zhaogongyi@bytedance.com>
X-Lms-Return-Path: <lba+26b093945+bc549d+lists.infradead.org+zhaogongyi@bytedance.com>
X-Original-From: zhaogongyi <zhaogongyi@bytedance.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_000328_521764_1BDBF42B 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If CPU enumeration finds no usable device tree node for the boot hart,
setup_smp() triggers a breakpoint during early boot.

Use panic() to report the device tree failure and include the boot
hart ID so the corresponding CPU node can be checked.

Signed-off-by: zhaogongyi <zhaogongyi@bytedance.com>
---
QEMU/TCG serial excerpts from the BSK test kernel with a DTB that
had no usable CPU node for the boot hart.

Unpatched kernel
  kernel BUG at arch/riscv/kernel/smpboot.c:151!
Patched kernel
  Kernel panic - not syncing: No usable CPU node for boot hart 1

 arch/riscv/kernel/smpboot.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index a9de2dae8..6436cf1fa 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -150,7 +150,9 @@ static void __init of_parse_and_init_cpus(void)
 		cpuid++;
 	}
 
-	BUG_ON(!found_boot_cpu);
+	if (!found_boot_cpu)
+		panic("No usable CPU node for boot hart %lu",
+		      cpuid_to_hartid_map(0));
 
 	if (cpuid > nr_cpu_ids)
 		pr_warn("Total number of cpus [%d] is greater than nr_cpus option value [%d]\n",

base-commit: 2359fc3f3501b9de725c1f5699344c3ad11ac607

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
