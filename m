Return-Path: <SRS0=1V8E=AI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3AFC433DF
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 13:58:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CA9021841
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 13:58:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="riHH3G3W";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="yAESvf8G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CA9021841
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8EaaRMpMPN1dJo3oA/y0LhKiwTIpPZQDavKs2vk1DxI=; b=riHH3G3WVt+jaMzpRkgCAgKRpt
	tB8HbbMCAjnxIqKlcvNk1kse8gz0C3wxcekroexv96XKaA63J0Ov4CaBtD8coQdwVh7Wlu46oOqjv
	KFHa7YEEB0SCyiyA1fHnSPA1PEg0aCSFI6fztTscvoBB4BGedwDJzlBqe2o7NbtcqAt1YQWlSwXYJ
	rNBeNpeoiYBDnZbNXFicBRrdJurq4AX/fXXo2sV4m6Ahtr+o0OluJG2pcHQfxOE9lyu8kInoFjFq/
	IxEkw5J86qybUDjl9IrAxLgp5+beIA+JQMUszp96t89YWwWcS/2/BfsNrHOZa5cv+LzL1J3exQ9Se
	W1GQk4Jw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpBLW-0002MT-Di; Sat, 27 Jun 2020 13:58:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpBLU-0002MI-VX
 for linux-riscv@lists.infradead.org; Sat, 27 Jun 2020 13:58:17 +0000
Received: from localhost.localdomain (unknown [89.208.247.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A6A9D2158C;
 Sat, 27 Jun 2020 13:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593266295;
 bh=zFFmAxQIJ282vX1U5MTEGpJFoSCC8e6dQDRcPHERdds=;
 h=From:To:Cc:Subject:Date:From;
 b=yAESvf8Gfcairgg2gf6m4SeyFniwS9u435AovnO6RhjbHX242Bg6ekMEv02L/JvTq
 92lemG1EhMpXQZFM6LRiRg4tk+BihGTb+JVWiAHrLwNY0xdjo3MHF7bE4Oszig/ANe
 +dIZzzaGJbpCu2PBeWX7wUqKuYMbfdSTJFeYjGfs=
From: guoren@kernel.org
To: palmerdabbelt@google.com, paul.walmsley@sifive.com, anup@brainfault.org,
 greentime.hu@sifive.com, zong.li@sifive.com, aou@eecs.berkeley.edu,
 tglx@linutronix.de, tycho@tycho.ws, nickhu@andestech.com
Subject: [PATCH V2 0/3] riscv: Enable LOCKDEP
Date: Sat, 27 Jun 2020 13:57:05 +0000
Message-Id: <1593266228-61125-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
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
Cc: linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Lockdep is needed by proving the spinlocks and rwlocks. To support it,
we need to add TRACE_IRQFLAGS codes in kernel/entry.S. These patches
follow Documentation/irqflags-tracing.txt.

Fixup 2 bugs that block the lockdep implementation.

---
Changes in v2
 - Remove sX regs recovery codes which are unnecessary, because
   callee will handle them. Thx Greentime :)

 - Move "restore a0 - a7" to handle_syscall, but if _TIF_SYSCALL_WORK
   is set, "restore a1 - a7" is still duplicated. I prefer a C wrapper
   for syscall.

Guo Ren (2):
  riscv: Fixup static_obj() fail
  riscv: Enable LOCKDEP_SUPPORT & fixup TRACE_IRQFLAGS_SUPPORT

Zong Li (1):
  riscv: Fixup lockdep_assert_held with wrong param cpu_running

 arch/riscv/Kconfig              |  3 +++
 arch/riscv/kernel/entry.S       | 33 ++++++++++++++++++++++++++++++++-
 arch/riscv/kernel/smpboot.c     |  1 -
 arch/riscv/kernel/vmlinux.lds.S |  2 +-
 4 files changed, 36 insertions(+), 3 deletions(-)

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
