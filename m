Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924F6C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Dec 2021 04:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LsVOsnCNE/jj8hMuyGH8J+4FU0Kvip0ncXwtJF6aJJM=; b=RGlvAboKz5uOwx
	lPD7LsZ5aG9eTz1PefYTdN3jiw5bAPvJU4t2TJ8RWi7diNkQNUuSDDkiZUenu/L13GiS8fmF0h3Sl
	mFKyPTzF9/TzDaMI40Ovd3eE163FqglYQytB+Ps5LVw+o1pfVCfIJ3TnNdx/yl3STKXjm4J4X7TFv
	yNs1tBOUhDwxZzOCLEUx7tJsLSUmfNyg7a6lpOqiJsMVmfgRyBvzmy7ACMOmBdPzJYKDuI4lHNJAO
	QX36QPOley0z7l6PBvm7oNXWxLvduhQbX/msBOruCdh4Dp/mthhLSkPJh5/A+RKofyUnC2cx9i3jB
	ZNkkgGhZ9hUTns40vg8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0z5G-00Ed4N-Bw; Sat, 25 Dec 2021 04:55:06 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0z54-00Ed19-C5; Sat, 25 Dec 2021 04:54:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AC734B80939;
 Sat, 25 Dec 2021 04:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F98C36AE9;
 Sat, 25 Dec 2021 04:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640408091;
 bh=G9+BUfbfli+fFvrXVVfvrmWFJpu5MjiXo507Oal3Bt8=;
 h=From:To:Cc:Subject:Date:From;
 b=YkAkjARgZSI77tGg5SS/eW84LcQsMnmxJXKtRnBn3C+HhYHzBTtnAN55uGhwb1Aiy
 RfUTJxyb8ffODA0hvpJy3jM+Gi2/GO2cTqjm9z1BWjanVrRikV7S9BF7IhuwAJN21U
 qlV0g9cYW+hxQzZxqex4poh25/7gNpmWvcriZoy5ELI9Qy7ny7+vfqvODLzUgRr0+K
 3Na/XcnfQ05N5Ug86oHkbjJvlo0vPNGyO1SqEsuHjrAH8AvSt3f+qr51geHq00JpuW
 Dscy/FyBKDXPFmaqHpf4oAF5FjiQxZW0cTnsX3zgThhQ4a5qTIcRJX3lpXN7c3ERoW
 ecDiiSTt//6Zg==
From: guoren@kernel.org
To: guoren@kernel.org, will@kernel.org, tglx@linutronix.de,
 benh@kernel.crashing.org, arnd@arndb.de, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, christophe.leroy@csgroup.eu
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.or,
 linuxppc-dev@lists.ozlabs.org, inux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 0/8] sched: Remove unused TASK_SIZE_OF
Date: Sat, 25 Dec 2021 12:54:22 +0800
Message-Id: <20211225045430.2868608-1-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_205454_600848_B3B5D6B8 
X-CRM114-Status: UNSURE (   7.98  )
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

From: Guo Ren <guoren@linux.alibaba.com>

This macro isn't used in Linux, now. Delete in include/linux/sched.h
and arch's include/asm. This would confuse people who are
implementing the COMPAT feature for architecture.

Changes in v2:
 - Add Arnd's comment in main patch
 - Optimize coding convention with Christophe's advise

Guo Ren (8):
  sched: Remove unused TASK_SIZE_OF
  sched: x86: Remove unused TASK_SIZE_OF
  sched: sparc: Remove unused TASK_SIZE_OF
  sched: powerpc: Remove unused TASK_SIZE_OF
  sched: s390: Remove unused TASK_SIZE_OF
  sched: parisc: Remove unused TASK_SIZE_OF
  sched: arm64: Remove unused TASK_SIZE_OF
  sched: mips: Remove unused TASK_SIZE_OF

 arch/arm64/include/asm/processor.h      | 2 --
 arch/mips/include/asm/processor.h       | 3 ---
 arch/parisc/include/asm/processor.h     | 3 +--
 arch/powerpc/include/asm/task_size_64.h | 6 +-----
 arch/s390/include/asm/processor.h       | 3 +--
 arch/sparc/include/asm/processor_64.h   | 3 ---
 arch/x86/include/asm/page_64_types.h    | 2 --
 include/linux/sched.h                   | 4 ----
 8 files changed, 3 insertions(+), 23 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
