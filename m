Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D762DC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 13:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KRZiA5cjcJOxcbZDeTkuYIJmG8Vg3CDWRp9KBYb4yfk=; b=G7SiQhnmeDs23O
	diEHQaD+ENc6Mo0EKD6Ks3ADkndrTdvvO1WcPSwP0A/nrLaP4Qp9/bLLprG+eZfY8TscWdy6VvvHd
	MKofG0O268OWLMBKZVvs+Y9X1hpA/AjgefV/FX4p8uoqFVknEKxJzkbCW8+BZlsnFk34yjNUPKy2u
	/GRF5j5nXFilkqNBVENgGn4Ew0r1Vn212zykDy0/ig4W6vhozLZwF/o96F9uiqqmCWR3U/iBfmiEZ
	/jiL4UBOuB0EkKmq0a1TTMssmiThh0VmaOrwvz56bhahUPg1DOVL+e1PaMSzIVZM2ZpYd+/ptNra/
	hpCk9OdWaWYLk3HsTwiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyYtR-00Gjre-8L; Fri, 25 Nov 2022 13:37:25 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyYtN-00GjpL-P6
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 13:37:23 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8EF663F1B0
	for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 13:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1669383435;
	bh=8DnTlIACDbzEtLRf6uyG90k2lVADApi5Q0dzsALoGgs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=gybrPLUqAFnpSc7NoZM0A616yXIXzfLYLPUSk79gfOb8kTPlXiJoc2QUyn3Hx9oCn
	 ewDrTwgKkWn3Djf+r2kojXpef6fP7xMZhosMbekVPS4aHwH8x3QsWEefLod+0IfbL6
	 LjuVTqvn3ys64wMuYIaDmrrzm7IK91Xuz4oUW2iUBoXQIRbmLAno+/sQu+jQSUqBWw
	 b9BEqxY0zJrLnPDfGGJC+b52/1KwdhL5OXog14EdFzd/1N27oQavwXNysdUie3jWsa
	 vcEZf6mPIsQd3Wmsg9/cI6fwnaVWXdqIs8df35yGo8BgAKUWgn9k5zP9IZmuhvZqKs
	 rmGp423BPDX5g==
Received: by mail-ej1-f71.google.com with SMTP id nc4-20020a1709071c0400b0078a5ceb571bso2285988ejc.4
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 05:37:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8DnTlIACDbzEtLRf6uyG90k2lVADApi5Q0dzsALoGgs=;
        b=FWb42M5PmQwUSI++Xs/VXqQL9y4J5o1l1+SS+3dOwM4rFpgsbe4cRyFlA+XWD2IX9+
         lxVHqYH8fZSlzUaCG3oMmDt/agjVDHReQEi4r/H91xMTjZsSkqcyOe7yV/DTBtGHxqJj
         lqyrTaqpbl2SmThP7JlGDenbLIBCUDF/ksgOkYHGn85ysMOYiy2nIt7I3VZyE7IKnJUC
         wCln9tGJL/VTdh+/F3l/B43UXR9007U9YjRDYyVOXGtKMe6DW/jIkzuWCaveYYfa9gzI
         hiYyhx4JVJVcGIW9LnxqJYc83//XQJeSNe8NYeCbGL3VexjRI+G/KIyGhKhJGnZz2C6v
         /FzA==
X-Gm-Message-State: ANoB5pkTELTdksR4c/pQG3SeZaf+PDjljsN+WKc/8sNqpyvsvP0P+MG4
	ZdhUopU3pHGDXgT0zB6gm9GWmU/Ehwj+zdIdv71Qw5+8r7mADdzbHh9sPuY44Wx4CZb59+jHjLs
	aMJ9jlcOmK2zIJRYV70lEz8nhtS/VnITSE+ME+ho8T9ZdKg==
X-Received: by 2002:a17:906:68a:b0:78d:3188:9116 with SMTP id u10-20020a170906068a00b0078d31889116mr32469854ejb.176.1669383435065;
        Fri, 25 Nov 2022 05:37:15 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4wOtfkriCx9cw+Ix96Y2Ld90o3KlP7uuL0BqKMXT3ekDjiRZ+U2dVi0QMpXeaZVgJGkYfb0g==
X-Received: by 2002:a17:906:68a:b0:78d:3188:9116 with SMTP id u10-20020a170906068a00b0078d31889116mr32469823ejb.176.1669383434765;
        Fri, 25 Nov 2022 05:37:14 -0800 (PST)
Received: from righiandr-XPS-13-7390.homenet.telecomitalia.it ([95.236.177.174])
        by smtp.gmail.com with ESMTPSA id va5-20020a170907d00500b0078d0981516esm1585372ejc.38.2022.11.25.05.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 05:37:14 -0800 (PST)
From: Andrea Righi <andrea.righi@canonical.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: increase boot command line size to 1K
Date: Fri, 25 Nov 2022 14:37:13 +0100
Message-Id: <20221125133713.314796-1-andrea.righi@canonical.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_053722_197448_C159DEF2 
X-CRM114-Status: GOOD (  14.94  )
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

Kernel parameters string is limited to 512 characters on riscv (using
the default from include/uapi/asm-generic/setup.h).

In some testing environments (e.g., qemu with long kernel parameters
string) we may exceed this limit, triggering errors like the following:

[    3.331893] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000
[    3.332625] CPU: 2 PID: 1 Comm: sh Not tainted 6.1.0-rc6-kc #1
[    3.333233] Hardware name: riscv-virtio,qemu (DT)
[    3.333550] Call Trace:
[    3.333736] [<ffffffff800062b6>] dump_backtrace+0x1c/0x24
[    3.334053] [<ffffffff806e8f54>] show_stack+0x2c/0x38
[    3.334260] [<ffffffff806f2d06>] dump_stack_lvl+0x5a/0x7c
[    3.334483] [<ffffffff806f2d3c>] dump_stack+0x14/0x1c
[    3.334687] [<ffffffff806e92fa>] panic+0x116/0x2d0
[    3.334878] [<ffffffff8001b0aa>] do_exit+0x80a/0x810
[    3.335079] [<ffffffff8001b1d0>] do_group_exit+0x24/0x70
[    3.335287] [<ffffffff8001b234>] __wake_up_parent+0x0/0x20
[    3.335502] [<ffffffff80003cee>] ret_from_syscall+0x0/0x2
[    3.335857] SMP: stopping secondary CPUs
[    3.337561] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000 ]---

It seems reasonable enough to increase the default command line size to
1024, like arm, to prevent issues like the one reported above.

Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
---
 arch/riscv/include/asm/setup.h      | 7 +++++++
 arch/riscv/include/uapi/asm/setup.h | 7 +++++++
 2 files changed, 14 insertions(+)
 create mode 100644 arch/riscv/include/asm/setup.h
 create mode 100644 arch/riscv/include/uapi/asm/setup.h

diff --git a/arch/riscv/include/asm/setup.h b/arch/riscv/include/asm/setup.h
new file mode 100644
index 000000000000..f4fe549aab40
--- /dev/null
+++ b/arch/riscv/include/asm/setup.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASMRISCV_SETUP_H
+#define __ASMRISCV_SETUP_H
+
+#include <uapi/asm/setup.h>
+
+#endif /* __ASMRISCV_SETUP_H */
diff --git a/arch/riscv/include/uapi/asm/setup.h b/arch/riscv/include/uapi/asm/setup.h
new file mode 100644
index 000000000000..5738f93ae437
--- /dev/null
+++ b/arch/riscv/include/uapi/asm/setup.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _UAPI__ASMRISCV_SETUP_H
+#define _UAPI__ASMRISCV_SETUP_H
+
+#define COMMAND_LINE_SIZE 1024
+
+#endif /* _UAPI__ASMRISCV_SETUP_H */
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
