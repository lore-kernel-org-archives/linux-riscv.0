Return-Path: <SRS0=EtLq=FE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98CFC63777
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 09:14:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 340F72074A
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 09:14:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WnDq5tRh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 340F72074A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D4lhnp48Ml8zkpuEOkuLkSTCL6baBpvZtKBwkb5NxM0=; b=WnDq5tRhU2/rggXg+oGuVXestq
	XxBHXVRZA98jDC/1j4xFL/rkKJXjbrRItTOCPId4KmtOhVz//7SwzkaHBj5EAcB5LB5oo8kN9PPYl
	Hn9lXZJx5yX69OiYolZzVxGQA7xBB5/Ac6piBQHauCdkLA8del6wlMzRGnUVZlQpToEX5FAxe/UCg
	cg8LwFanpIjomUygderA5ZuU73onrRDu7m/yMYyE0ZdtXy/H2OtEeH9WmZ2hPMTOH8BVQQ99eM6f4
	rUn+CP/YJbOAF45j43I4vrAALwH7Tmaob4HAxIi/uJn2Oafodmk6ZQrrvzSKI72143hBHaV1bzc5Z
	Pz/khcAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjfGC-0006Md-3i; Mon, 30 Nov 2020 09:14:16 +0000
Received: from exmail.andestech.com ([60.248.187.195]
 helo=ATCSQR.andestech.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjfG8-0006LY-BP
 for linux-riscv@lists.infradead.org; Mon, 30 Nov 2020 09:14:14 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 0AU9DvK7078755;
 Mon, 30 Nov 2020 17:13:57 +0800 (GMT-8)
 (envelope-from nylon7@andestech.com)
Received: from atcsqa06.andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.487.0; Mon, 30 Nov 2020
 17:13:33 +0800
From: Nylon Chen <nylon7@andestech.com>
To: <aryabinin@virtuozzo.com>, <glider@google.com>, <dvyukov@google.com>,
 <kasan-dev@googlegroups.com>, <akpm@linux-foundation.org>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <nickhu@andestech.com>,
 <nylon7@andestech.com>, <luc.vanoostenryck@gmail.com>,
 <greentime.hu@sifive.com>, <linux-riscv@lists.infradead.org>
Subject: [PATCH 0/1] Fix Kasan test module run failed in RISCV architecture
Date: Mon, 30 Nov 2020 17:13:18 +0800
Message-ID: <1606727599-8598-1-git-send-email-nylon7@andestech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 0AU9DvK7078755
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_041412_821813_610C41C8 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: nylon7717@gmail.com, Nick Hu <nick650823@gmail.com>, alankao@andestech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

When you run Kasan test module in RISCV architecture,"kmalloc_memmove_invalid_size()"
will be executed and then kernel will be hang in infinite loop as below:

[   26.228433] Memory state around the buggy address:
[   26.229824]  ffffffe066e11d00: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
[   26.232098]  ffffffe066e11d80: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
[   26.234461] >ffffffe066e11e00: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
[   26.236650]                                            ^
[   26.238149]  ffffffe066e11e80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[   26.240400]  ffffffe066e11f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[   26.242646]
==================================================================
[   26.245312]
==================================================================
[   26.247607] BUG: KASAN: slab-out-of-bounds in memmove+0x2e/0x8a
[   26.249160] Read of size 1 at addr ffffffe066e11e49 by task
insmod/106
[   26.250855]
[   26.251755] CPU: 0 PID: 106 Comm: insmod Tainted: G    B
5.8.7 #2
[   26.253454] Call Trace:
[   26.254509] [<ffffffe000203256>] walk_stackframe+0x0/0x128
[   26.256027] [<ffffffe000203530>] show_stack+0x2e/0x3a
[   26.257467] [<ffffffe0005ab9e0>] dump_stack+0x84/0xa0
[   26.258936] [<ffffffe000367120>]
print_address_description.isra.0+0x34/0x404
[   26.260686] [<ffffffe000367676>] kasan_report+0xda/0x132
[   26.262141] [<ffffffe000367a68>] __asan_load1+0x42/0x4a
[   26.263610] [<ffffffe0005c1c4c>] memmove+0x2e/0x8a
[   26.265241] [<ffffffdf81cdec26>]
kmalloc_memmove_invalid_size+0x94/0xaa [test_kasan]
[   26.267829] [<ffffffdf81cdfa2a>] kmalloc_tests_init+0x94/0x14a
[test_kasan]
[   26.269563] [<ffffffe0002000d8>] do_one_initcall+0x40/0x134
[   26.271106] [<ffffffe0002a2e5c>] do_init_module+0xc6/0x25c
[   26.272610] [<ffffffe0002a5692>] load_module+0x257a/0x2bf2
[   26.274096] [<ffffffe0002a5e70>] __do_sys_finit_module+0x7e/0x94
[   26.275676] [<ffffffe0002a5eaa>] sys_finit_module+0x10/0x18
[   26.277207] [<ffffffe000201690>] ret_from_syscall+0x0/0x2
[   26.278677]

.....

[  579.407314]  0x0
[  579.408267]  0x0
[  579.409222]  0x0
[  579.410198]  0x0
[  579.411206]  0x0
[  579.412151]  0x0
[  579.413122]  0x0
[  579.414080]  0x0
[  579.415026]  0x0
[  579.415964]  0x0
[  579.416912]  0x0
[  579.417871]  0x0
[  579.418834]  0x0
[  579.419781]  0x0
[  579.420738]  0x0
[  579.421841]  0x0
[  579.422805]  0x0
[  579.423764]  0x0
[  579.424696]  0x0
[  579.425638]  0x0
[  579.426599]  0x0
[  579.427538]  0x0
[  579.428467]  0x0

.....


if we define __HAVE_ARCH_MEMMOVE and port memmove to RISCV can fix it.

Signed-off-by: Nick Hu <nickhu@andestech.com>
Signed-off-by: Nick Hu <nick650823@gmail.com>
Signed-off-by: Nylon Chen <nylon7@andestech.com>

Nylon Chen (1):
  riscv: provide memmove implementation

 arch/riscv/include/asm/string.h |  8 ++---
 arch/riscv/kernel/riscv_ksyms.c |  2 ++
 arch/riscv/lib/Makefile         |  1 +
 arch/riscv/lib/memmove.S        | 64 +++++++++++++++++++++++++++++++++
 4 files changed, 71 insertions(+), 4 deletions(-)
 create mode 100644 arch/riscv/lib/memmove.S

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
