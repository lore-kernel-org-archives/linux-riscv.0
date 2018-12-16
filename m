Return-Path: <SRS0=9k1K=OZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB3EC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 16 Dec 2018 14:12:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D5F420672
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 16 Dec 2018 14:12:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UHpCPNyk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="V+OtoKQC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D5F420672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=x8XXolounJRjNC6wMmg6aBprGLCvpnrlJD+zvnVOwmw=; b=UHp
	CPNykaXjI50jJozwFCggiRtAQHbEwmtH7xZQlR+ZhsUQgkQ/hpbavHqssaf3zRdsj5F4PjeXjrgOX
	NXBJizGvJV2hiZGMJFs6HtFzPr9qRG5AZgq+uyUwvqvIqcgMqup3hw9z+tuGmN6kIqXMvoJjSPSEt
	jItmU8jIxcrLbwc0klKamu04EeB15SGKfhPJkd6qMSIgwZ1Os5kHFijJkcN6X7QlTp7igT1ybJ+U9
	3haAsNn5Xp8Z7bvJSHhMEUkz62XNMKqXje6uvvqyCMS1fZqYKplMAZ+j7ZVk2Bnpf/qR1uFCQlIUw
	9cQrTynPqc+cgEBZrzBuO+iitbuBfYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gYX9n-0005Us-CX; Sun, 16 Dec 2018 14:12:35 +0000
Received: from conuserg-12.nifty.com ([210.131.2.79])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYX9k-0005SN-81
 for linux-riscv@lists.infradead.org; Sun, 16 Dec 2018 14:12:34 +0000
Received: from grover.tkatk1.zaq.ne.jp (zaqdadce369.zaq.ne.jp
 [218.220.227.105]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id wBGEBWXm008783;
 Sun, 16 Dec 2018 23:11:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com wBGEBWXm008783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1544969493;
 bh=CsWUrOVta15OpOCDxQjjIyd45yImcRDWQZeusK8eq8U=;
 h=From:To:Cc:Subject:Date:From;
 b=V+OtoKQCFsYn0zgRl9GsKGTvfqPi5Xo5eH2i9MuVhq4lvvwNvs8DpF+/45cbOsh9V
 g2hXjb41PLaTtMvhlFOrHhR6h8/mICDqkLCDYqYdypHd84tNBor2Vr0psI2/AQ2saP
 seMiwgDrgxafJBcB+kI87H+bG3PpuLwZQMT8xQecMMXBef8E+a0oE1tzqXTxynj5OA
 ZXuukwiHsiQav8VDCTybQrdTmRr47lLgzgCycOWJV3nIhnCDylXxV2wA9tnmo3AY1b
 5S/kazqA9lfOjMIlX0WxxvTlTfFvr2IkNbpCH7ZOKhKDKjvnzpJMgthqgjxXWRSYeg
 6zHP1WFQ2q0tg==
X-Nifty-SrcIP: [218.220.227.105]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: remove redundant kernel-space generic-y
Date: Sun, 16 Dec 2018 23:11:11 +0900
Message-Id: <1544969471-14224-1-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181216_061232_606444_2E94ADFF 
X-CRM114-Status: UNSURE (   3.76  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Alan Kao <alankao@andestech.com>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Deepa Dinamani <deepa.kernel@gmail.com>, Jim Wilson <jimw@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This commit removes redundant generic-y defines in
arch/riscv/include/asm/Kbuild.

[1] It is redundant to define the same generic-y in both
    arch/$(ARCH)/include/asm/Kbuild and
    arch/$(ARCH)/include/uapi/asm/Kbuild.

    Remove the following generic-y:

      errno.h
      fcntl.h
      ioctl.h
      ioctls.h
      ipcbuf.h
      mman.h
      msgbuf.h
      param.h
      poll.h
      posix_types.h
      resource.h
      sembuf.h
      setup.h
      shmbuf.h
      signal.h
      socket.h
      sockios.h
      stat.h
      statfs.h
      swab.h
      termbits.h
      termios.h
      types.h

[2] It is redundant to define generic-y when arch-specific
    implementation exists in arch/$(ARCH)/include/asm/*.h

    Remove the following generic-y:

      cacheflush.h
      dma-mapping.h
      module.h

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/riscv/include/asm/Kbuild | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
index 6a646d9..f7068f3 100644
--- a/arch/riscv/include/asm/Kbuild
+++ b/arch/riscv/include/asm/Kbuild
@@ -1,5 +1,4 @@
 generic-y += bugs.h
-generic-y += cacheflush.h
 generic-y += checksum.h
 generic-y += compat.h
 generic-y += cputime.h
@@ -7,18 +6,12 @@ generic-y += device.h
 generic-y += div64.h
 generic-y += dma.h
 generic-y += dma-contiguous.h
-generic-y += dma-mapping.h
 generic-y += emergency-restart.h
-generic-y += errno.h
 generic-y += exec.h
 generic-y += fb.h
-generic-y += fcntl.h
 generic-y += hardirq.h
 generic-y += hash.h
 generic-y += hw_irq.h
-generic-y += ioctl.h
-generic-y += ioctls.h
-generic-y += ipcbuf.h
 generic-y += irq_regs.h
 generic-y += irq_work.h
 generic-y += kdebug.h
@@ -27,34 +20,15 @@ generic-y += kvm_para.h
 generic-y += local.h
 generic-y += local64.h
 generic-y += mm-arch-hooks.h
-generic-y += mman.h
-generic-y += module.h
-generic-y += msgbuf.h
 generic-y += mutex.h
-generic-y += param.h
 generic-y += percpu.h
-generic-y += poll.h
-generic-y += posix_types.h
 generic-y += preempt.h
-generic-y += resource.h
 generic-y += scatterlist.h
 generic-y += sections.h
-generic-y += sembuf.h
 generic-y += serial.h
-generic-y += setup.h
-generic-y += shmbuf.h
 generic-y += shmparam.h
-generic-y += signal.h
-generic-y += socket.h
-generic-y += sockios.h
-generic-y += stat.h
-generic-y += statfs.h
-generic-y += swab.h
-generic-y += termbits.h
-generic-y += termios.h
 generic-y += topology.h
 generic-y += trace_clock.h
-generic-y += types.h
 generic-y += unaligned.h
 generic-y += user.h
 generic-y += vga.h
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
