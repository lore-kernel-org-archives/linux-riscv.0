Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE57C54EAA
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 13:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ezFiLw1b4b3KdFCwOgrdqyjI1PYkw6CztfQN+1QNrA=; b=Wf/6h35roIZUv9
	SDBW4b8TzPMFWjoqWI8oYaNwZGGYk0V6M9VtPFqQ2AlQ7XybjC0kTiC+84LJG/gK7GCFf6fkVXXNn
	9H9W7n89xTks9Gb5nHH4XH85Hyt5DjRyJ28Aq2pKH6nxVwEHVhCb8A9OwI+Bqn3BKEis0xNn2aaNO
	BZLgBtWcl9gjzakr0NHVxWkwJJuBRpJdALwHjdDFS80jv2yTum0npGIeH9cMzo8s/ZrNaIRC0ESHD
	GdSAl3SwQ9+8guKiCpCA4ohiPVzU8qIt//yp8DknZDumBGY3vxI3iKXWzGupPC/A73yOCBexvh6ER
	UFwlPDeqbZ77lEz69nsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLP15-00F5ok-9h; Fri, 27 Jan 2023 13:43:43 +0000
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOYo-00EubM-2V
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 13:14:34 +0000
Received: from cgk-Precision-3650-Tower.. (unknown [219.141.235.82])
	by APP-01 (Coremail) with SMTP id qwCowADX3Eg9zNNjDyF3Ag--.52827S17;
	Fri, 27 Jan 2023 21:06:11 +0800 (CST)
From: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org,
	mingo@redhat.com,
	sfr@canb.auug.org.au
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liaochang1@huawei.com
Subject: [PATCH v6 13/13] selftest/kprobes: Add testcase for kprobe SYM[+offs]
Date: Fri, 27 Jan 2023 21:05:41 +0800
Message-Id: <20230127130541.1250865-14-chenguokai17@mails.ucas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127130541.1250865-1-chenguokai17@mails.ucas.ac.cn>
References: <20230127130541.1250865-1-chenguokai17@mails.ucas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowADX3Eg9zNNjDyF3Ag--.52827S17
X-Coremail-Antispam: 1UD129KBjvJXoW7CF15GFW3Xw15CF47GryfWFg_yoW8urW3pa
	s8Cw15Kw4SqFW3K3s3Gw48Cr1Fy3W8Ar43Jw1DJr4a9a4Uur1jqan2grWUAas7ur4q9r13
	Aw1YvFy7KFy7ZFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPKb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUAVCq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28C
	jxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI
	8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vE
	x4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52
	x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWU
	GwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxkIecxEwVAFwVW5GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC2
	0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
	0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv2
	0xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
	80aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU
	0xZFpf9x07jF_M3UUUUU=
X-Originating-IP: [219.141.235.82]
X-CM-SenderInfo: xfkh0w5xrntxyrx6ztxlovh3xfdvhtffof0/1tbiCgcEE2PTtMIZyQAAsM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_051430_597351_B96891ED 
X-CRM114-Status: GOOD (  10.41  )
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

From: Liao Chang <liaochang1@huawei.com>

This testcase set multiple kprobes to the function that contains a
series of complex opcode pattern, it helps discover some subtle bugs in
the instruction decoder and kprobe jump optimization.

Signed-off-by: Liao Chang <liaochang1@huawei.com>
---
 .../ftrace/test.d/kprobe/kprobe_sym_offs.tc   | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/kprobe_sym_offs.tc

diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_sym_offs.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_sym_offs.tc
new file mode 100644
index 000000000000..0007bec48308
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_sym_offs.tc
@@ -0,0 +1,49 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Kprobe dynamic event with offset
+# requires: kprobe_events
+TARGET_FUNC=vfs_write
+
+dec_addr() { # hexaddr
+  printf "%d" "0x"`echo $1 | tail -c 8`
+}
+
+set_offs() { # target next
+  SYMADDR=$1
+  ENDADDR=$2
+  A1=`dec_addr $SYMADDR`
+  A2=`dec_addr $ENDADDR`
+  NEXT=`expr $A2 - $A1` # offset to previous symbol
+}
+
+# Get the instruction number between two contiguous symbols
+set_offs `grep -A1 -w ${TARGET_FUNC} /proc/kallsyms | cut -f 1 -d " " | xargs`
+
+# Instruction length depends on the machine architecute.
+case `uname -m` in
+  arm64) LEN=4;;
+  riscv32|riscv64) LEN=2;;
+  *) LEN=2;;
+esac
+
+N=0
+OFFS=0
+echo "Setup up kprobes on each instruction in function $TARGET_FUNC"
+while true; do
+  N=$(($N+1))
+  ! echo p ${TARGET_FUNC}+${OFFS} >> kprobe_events
+  OFFS=$(($OFFS+$LEN))
+  test $OFFS -eq $NEXT && break
+done
+
+L=`cat kprobe_events | wc -l`
+echo "The number of kprobes events ($L) not $N in function $TARGET_FUNC"
+
+echo 1 > events/kprobes/enable
+# Trigger vfs_write to test kprobes
+cat kprobe_events >> $testlog
+echo 0 > events/kprobes/enable
+echo > kprobe_events
+echo "Waiting for unoptimizing & freeing"
+sleep 5
+echo "Done"
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
