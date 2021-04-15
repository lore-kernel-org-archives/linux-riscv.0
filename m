Return-Path: <SRS0=wvp3=JM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C91AC433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 09:34:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5F086113B
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 09:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5F086113B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o1cpBBERl5+ZDMM6LcvQcQvYTlUGHErBUMfdcGZ3oLs=; b=pQ3Wo9Pd3QUA+1DaFjn+zgQx2
	OhggqyXJQ43y/aPgM7Jj7TmncHK6f47EmVd4uckcg/2WpIX22gZzgxMZ4R5Cq3QF/0WUlYR1AQFlE
	T+B4d6aDE1EsrYuR9HcHrEXzCLD3OiNpGpOWjNO8ishDOH+x15UE5VOJCaw7a05nVktwaVSXvF799
	nj/Lqv8WhGGHVMWJ5bVcqsllVx6n1C6VHFPrsR0FD1JszBesLPGY0g1Dsmy/uoU5NC52QC6i6VA6t
	KY3EvOACIrbtta0QCoSWnfXPxGzulzJNv8v1ONA7oYz86bT+EMRj5rNZDbFEWwhSZciT4HxHXDNQR
	BXCb45Qzg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWyNi-00FXLB-0c; Thu, 15 Apr 2021 09:33:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyNd-00FXKK-HA; Thu, 15 Apr 2021 09:33:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=/MjJF1x8OFQCL4izVHpn1s18hZrSw9Huql9x2KHCuWY=; b=XxBFc0kLOlRiuV6EqknJnFS/4b
 7uUn3uR3uvANusKgS4sl2cE0bNhAGxkL/tgWDyd5HCSg/1Dvx3lSj+DbJPhYuevuHuw9DCSY7tuUI
 Kvb7xZTCzoQ6ten+1yhEq7LwDMwlHNaS8CbkBsICOseTyviZwB2bNdJ/H/oPhSb0XIoIZ9Yicnm5+
 woMQpguSBgIWu25HBceBbwFpmjsob/0vQ1Ixawe2I6WsmutOTeZq38oKo2Hig71vatVgEHRbczK+l
 xTLAnMyeNb9e8+dIaP4nQBeD7TaoOIVNIN1N96JAdSSxomGub50YRz4rU4GA8GOtJT4JPpFS244aO
 gjbURTgA==;
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyNa-008Qab-RJ; Thu, 15 Apr 2021 09:33:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5849A1396;
 Thu, 15 Apr 2021 02:33:40 -0700 (PDT)
Received: from net-arm-thunderx2-02.shanghai.arm.com
 (net-arm-thunderx2-02.shanghai.arm.com [10.169.208.215])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 225E33F694;
 Thu, 15 Apr 2021 02:33:22 -0700 (PDT)
From: Jianlin Lv <Jianlin.Lv@arm.com>
To: bpf@vger.kernel.org
Cc: corbet@lwn.net, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 kafai@fb.com, songliubraving@fb.com, yhs@fb.com, john.fastabend@gmail.com,
 kpsingh@kernel.org, davem@davemloft.net, kuba@kernel.org,
 illusionist.neo@gmail.com, linux@armlinux.org.uk, zlim.lnx@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, paulburton@kernel.org,
 tsbogend@alpha.franken.de, naveen.n.rao@linux.ibm.com,
 sandipan@linux.ibm.com, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, luke.r.nels@gmail.com, xi.wang@gmail.com,
 bjorn@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, iii@linux.ibm.com, hca@linux.ibm.com,
 gor@linux.ibm.com, borntraeger@de.ibm.com, yoshfuji@linux-ipv6.org,
 dsahern@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 x86@kernel.org, hpa@zytor.com, udknight@gmail.com,
 mchehab+huawei@kernel.org, dvyukov@google.com, maheshb@google.com,
 horms@verge.net.au, nicolas.dichtel@6wind.com, viro@zeniv.linux.org.uk,
 masahiroy@kernel.org, keescook@chromium.org, quentin@isovalent.com,
 tklauser@distanz.ch, grantseltzer@gmail.com, irogers@google.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, Jianlin.Lv@arm.com, iecedge@gmail.com
Subject: [PATCH bpf-next 2/2] docs: bpf: bpf_jit_enable mode changed
Date: Thu, 15 Apr 2021 17:32:50 +0800
Message-Id: <20210415093250.3391257-2-Jianlin.Lv@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415093250.3391257-1-Jianlin.Lv@arm.com>
References: <20210415093250.3391257-1-Jianlin.Lv@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_023342_995990_E01E1739 
X-CRM114-Status: GOOD (  11.31  )
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

Remove information about bpf_jit_enable=2 mode and added description for
how to use the bpf_jit_disasm tool after get rid of =2 mode.

Signed-off-by: Jianlin Lv <Jianlin.Lv@arm.com>
---
 Documentation/admin-guide/sysctl/net.rst |  1 -
 Documentation/networking/filter.rst      | 25 ++++++------------------
 2 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
index c941b214e0b7..a39f99deac38 100644
--- a/Documentation/admin-guide/sysctl/net.rst
+++ b/Documentation/admin-guide/sysctl/net.rst
@@ -86,7 +86,6 @@ Values:
 
 	- 0 - disable the JIT (default value)
 	- 1 - enable the JIT
-	- 2 - enable the JIT and ask the compiler to emit traces on kernel log.
 
 bpf_jit_harden
 --------------
diff --git a/Documentation/networking/filter.rst b/Documentation/networking/filter.rst
index 251c6bd73d15..86954f922168 100644
--- a/Documentation/networking/filter.rst
+++ b/Documentation/networking/filter.rst
@@ -504,25 +504,12 @@ been previously enabled by root::
 
   echo 1 > /proc/sys/net/core/bpf_jit_enable
 
-For JIT developers, doing audits etc, each compile run can output the generated
-opcode image into the kernel log via::
-
-  echo 2 > /proc/sys/net/core/bpf_jit_enable
-
-Example output from dmesg::
-
-    [ 3389.935842] flen=6 proglen=70 pass=3 image=ffffffffa0069c8f
-    [ 3389.935847] JIT code: 00000000: 55 48 89 e5 48 83 ec 60 48 89 5d f8 44 8b 4f 68
-    [ 3389.935849] JIT code: 00000010: 44 2b 4f 6c 4c 8b 87 d8 00 00 00 be 0c 00 00 00
-    [ 3389.935850] JIT code: 00000020: e8 1d 94 ff e0 3d 00 08 00 00 75 16 be 17 00 00
-    [ 3389.935851] JIT code: 00000030: 00 e8 28 94 ff e0 83 f8 01 75 07 b8 ff ff 00 00
-    [ 3389.935852] JIT code: 00000040: eb 02 31 c0 c9 c3
-
-When CONFIG_BPF_JIT_ALWAYS_ON is enabled, bpf_jit_enable is permanently set to 1 and
-setting any other value than that will return in failure. This is even the case for
-setting bpf_jit_enable to 2, since dumping the final JIT image into the kernel log
-is discouraged and introspection through bpftool (under tools/bpf/bpftool/) is the
-generally recommended approach instead.
+When CONFIG_BPF_JIT_ALWAYS_ON is enabled, bpf_jit_enable is permanently set
+to 1 and setting any other value than that will return in failure.
+For debugging JITs, the introspection through bpftool (tools/bpf/bpftool/)
+is the generally recommended approach instead. For JIT developers, doing
+audits etc, you can insert bpf_jit_dump() and recompile the kernel to
+output the generated opcode image into the kernel log.
 
 In the kernel source tree under tools/bpf/, there's bpf_jit_disasm for
 generating disassembly out of the kernel log's hexdump::
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
