Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6976CD6E6B
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 13:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SDS7ZZHvMCkrHHtrUaK1vTpOrsqEpDSJFNWFfq62yqA=; b=cU8H4H63R7+ZvT
	WwGD3JVx0RxU6fqLBi/4LhM0wNHJ76dzHGLwp1Y7XMpC7ntXvC0nxwhV+BWVUEZvAve+0KbaiLvL7
	NEgPgtnuI5flL7zVpVw6Abx3AtRtCVs3DzKIUr6dyyQMRvwixF3K5+kV4K/fGYh7G3Iq0/ltvcTR4
	LPzAKHJEX56O5GKbED24LP1lmFIulLUm2JTAOZLYXdPX1g8SDh2pxKtWnjuIZwPLGjEHnpKVU6zmL
	xCqY2Q3Lo3AbI+9csEVY8Xy2ND7Q+iwkbi+pdPcuYfUWgvsbhGsLP3TFYE5Dvup2Rx3b78o4MRUOJ
	st6+fuVfNhhFbj/89w7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV83w-0000000GmIj-30s4;
	Thu, 04 Jun 2026 13:24:44 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV83q-0000000GmBD-3FNx;
	Thu, 04 Jun 2026 13:24:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780579474; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=wGJTJ/FaZhfGglBz44gxrkrG5R80OdCp7c0qc5/blwo=;
	b=BJ0CaUFNsbnPI/84BUZ99dTZx32FpNtT5AlrdeY416kn0xUnujFouGQkGPEqs/HDAs/G1tGeDWKmA7n2tjr1rtbQkM7a/hrCA5KThxUtBJuJpDKVkDt8t3fdd1Rm30Itp6+9vUgLgvI2XIBVBksE8Wh2uNIaR/hdwTXlTV9sZRE=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R721e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=24;SR=0;TI=SMTPD_---0X4AKnXk_1780579466;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X4AKnXk_1780579466 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 04 Jun 2026 21:24:27 +0800
From: fangyu.yu@linux.alibaba.com
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Nick Kossifidis <mick@ics.forth.gr>
Cc: Song Shuai <songshuaishuai@tinylab.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Richard Lyu <richard.lyu@suse.com>,
	Nam Cao <namcao@linutronix.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	guoren@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH v3 3/9] riscv: Add kexec trampoline text section to vmlinux.lds.S
Date: Thu,  4 Jun 2026 21:24:12 +0800
Message-Id: <20260604132418.15725-4-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260604132418.15725-1-fangyu.yu@linux.alibaba.com>
References: <20260604132418.15725-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_062439_005185_D6DBADC4 
X-CRM114-Status: UNSURE (   7.63  )
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

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

When CONFIG_KEXEC_CORE is enabled, add a dedicated .kexec.tramp.text
area to the RISC-V kernel linker script.

Extend vmlinux.lds.S to:
  - align both the start and the end to PAGE_SIZE
  - define __kexec_tramp_text_start/__kexec_tramp_text_end
  - KEEP all .kexec.tramp.text* input sections
  - ASSERT the trampoline text fits within one page

The end-of-section page alignment guarantees that the trampoline page,
which is later identity-mapped as PAGE_KERNEL_EXEC, contains nothing but
the trampoline code and padding (no shared neighbour data).

When kexec is disabled, the whole block is excluded via #ifdef
CONFIG_KEXEC_CORE.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 arch/riscv/kernel/vmlinux.lds.S | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 1f4f8496941a..bc615f7b702f 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -41,6 +41,16 @@ SECTIONS
 		ENTRY_TEXT
 		IRQENTRY_TEXT
 		SOFTIRQENTRY_TEXT
+#ifdef CONFIG_KEXEC_CORE
+		. = ALIGN(PAGE_SIZE);
+		__kexec_tramp_text_start = .;
+		KEEP(*(.kexec.tramp.text))
+		KEEP(*(.kexec.tramp.text.*))
+		__kexec_tramp_text_end = .;
+		ASSERT((__kexec_tramp_text_end - __kexec_tramp_text_start) <= PAGE_SIZE,
+		       ".kexec.tramp.text exceeds PAGE_SIZE");
+		. = ALIGN(PAGE_SIZE);
+#endif
 		_etext = .;
 	}
 
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
