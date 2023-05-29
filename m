Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2831DC77B7E
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 12:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UsnIp7idjabGXyPyL9hAJJA7dmkm3clg4Zq4xeDWC3A=; b=xW8rAlBAQNS9jL
	tA8iTwmJWVXG5SgvepAwL/aSN4cjYT6D792MhxN7Kbus7IqdWpxeWDjOSkIf4AXUcY98Nhebapq+k
	LXq9b98l+8nIk3dKVSCLBYwQzLC3lloCho46DL63w947XqcB9BUD0bbnecDpOYn3WGQByga8HiPFj
	KCne7UC7kzZHlTnbfycD12VTNKARuZrTNw9IyM9WU1fn1GCpdHiFnntcjHYg5AS9nTBU7xYE3dvo8
	w+bkpiSzNaCnTKNIq9zDBEl4f+VdDE79oiXPg0zE2x2KTR/h61ubxAP/oP4xNHDg7OO3jdY4YRk9v
	CqYQf7lctwPGfb0mRQzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3cQU-00AVaq-0Y;
	Mon, 29 May 2023 12:56:42 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3cQQ-00AVYs-0h
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 12:56:41 +0000
X-QQ-mid: bizesmtp70t1685364975tgu8b8nk
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 May 2023 20:56:14 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: FVl8EHhfVR783a8W9cyjlbwbl8mKgDbq7E9fTAhEP/OvspzBBX5yVruB4eMmw
	ghv1uWTKdn3WWnfuPirBiJXTDIoLu4+zRicOyy51cEaBDTfX/44GdqG2l5NZILUSeeU6y/V
	4nd0bq9QznBIvumYMoPS1IJhTI+h4UZjFJzTkhfnat3GT8dXP6j4ZHLsH7N5xuCxnlR5i+N
	tViOrP/UytFGRtN5fuWrvTNRAFCFO9vcJkY0hSLR7kWLQqHQlgwIb2njMNj3g9mx/Q3VaKx
	Wne2knqx3TEbzRHOxPzAikzLPgS8dOE0aAI7qSy+aUfJaB6ijw98ePU52ffTHXNfn+5d2J7
	imguZhQn65iyk9XF7fsKZRTLg+vA5KqQtHQty4xBuie5vmK5jd7+JzpqmkwnnSYkYZa6DZl
	HTaaZ9JP8dI=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 561798749906670459
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de,
	conor@kernel.org
Subject: [PATCH v2 2/7] selftests/nolibc: allow specify extra arguments for qemu
Date: Mon, 29 May 2023 20:56:08 +0800
Message-Id: <209c75f2c15992e95bca4f6c2f96ef7f23ab3fcc.1685362482.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685362482.git.falcon@tinylab.org>
References: <cover.1685362482.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_055638_559385_6F826A13 
X-CRM114-Status: GOOD (  10.45  )
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

The opensbi package from Ubuntu 20.04 only provides rv64 firmwares:

    $ dpkg -S opensbi | grep -E "fw_.*bin|fw_.*elf" | uniq
    opensbi: /usr/lib/riscv64-linux-gnu/opensbi/generic/fw_dynamic.bin
    opensbi: /usr/lib/riscv64-linux-gnu/opensbi/generic/fw_jump.bin
    opensbi: /usr/lib/riscv64-linux-gnu/opensbi/generic/fw_dynamic.elf
    opensbi: /usr/lib/riscv64-linux-gnu/opensbi/generic/fw_jump.elf

To run this nolibc test for rv32, users must build opensbi or download a
prebuilt one from qemu repository:

    https://gitlab.com/qemu-project/qemu/-/blob/master/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin

And then use -bios to tell qemu use it to avoid such failure:

    $ qemu-system-riscv32 -display none -no-reboot -kernel /path/to/arch/riscv/boot/Image -serial stdio -M virt -append "console=ttyS0 panic=-1"
    qemu-system-riscv32: Unable to load the RISC-V firmware "opensbi-riscv32-generic-fw_dynamic.bin"

To run from makefile, QEMU_ARGS_EXTRA is added to allow pass extra
arguments like -bios:

    $ make run QEMU_ARGS_EXTRA="-bios /path/to/opensbi-riscv32-generic-fw_dynamic.bin" ...

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
index 47c3c89092e4..44088535682e 100644
--- a/tools/testing/selftests/nolibc/Makefile
+++ b/tools/testing/selftests/nolibc/Makefile
@@ -64,7 +64,7 @@ QEMU_ARGS_mips       = -M malta -append "panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS_riscv      = -M virt -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS_s390       = -M s390-ccw-virtio -m 1G -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS_loongarch  = -M virt -append "console=ttyS0,115200 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
-QEMU_ARGS            = $(QEMU_ARGS_$(ARCH))
+QEMU_ARGS            = $(QEMU_ARGS_$(ARCH)) $(QEMU_ARGS_EXTRA)
 
 # OUTPUT is only set when run from the main makefile, otherwise
 # it defaults to this nolibc directory.
-- 
2.25.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
