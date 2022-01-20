Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D294AC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 07:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WYjv+GjCHvy/btvq68qqzqfVmUy7I8rX8lmIoR2SgUc=; b=YdblONAPkmJJy2
	P6YV+qVGmROevpIO7rwD8M5b8jvSyLRDNykNSuLGpy92iLjfCqk6LHYXUrs5zjyEwlACD9GgwESQO
	c72/TfpG4sbfqpZCtu5+OzeagBKEMz20/3KvVJLmxsplv0L7KBQsTOsz4pkSyr4FUMUmWs5X3S2+d
	w0umncG/C36Xaf8Pj/+mbkEdz7b0nVij4xBjDzhzSVNLCD4Uv7Zc/Sia8M4a1OCLeKxLt5RXwfwCK
	bYH59yZvjNOyJnUaJjP2jetp55U18VQqElW0O6wWhzklIPy1dBtEqkhcmT3IP0SrgW0u5b9zQkrGU
	zoNwftjMFhHTc3HSofJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nASKd-009W4T-2w; Thu, 20 Jan 2022 07:58:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAS4h-009Opc-O6; Thu, 20 Jan 2022 07:41:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0633F616AA;
 Thu, 20 Jan 2022 07:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73AD3C36AE3;
 Thu, 20 Jan 2022 07:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642664498;
 bh=KczpaYYxoMGx41tEylY7vYP9V7d2/gwOtWp0+pQI1sQ=;
 h=From:To:Cc:Subject:Date:From;
 b=SoHKcLAbBRynCkDM25QymLddQPGokjxZWUXnz/C9Z/c9CM+6aBpTN2iW2HlHf8OcZ
 DvdM8kYes0KuSUihXi19oyVed9O24Fcyd3T1vlfejN0ZYrFb4SrYdvwkV5BXqengFt
 ptfJZ/LJQ+W4YCfoEbx8IQ1xgl8OjvN9joS2nfQPs6ajAG/EEwwXNGWEezEclwkyjg
 0Fjxfc0orzJMqb0vXLUw4X5LseWg+aWm18Rtx/Slt4NNvcGtQwXpD3gV0KOE2ePcTb
 GROcMJT9VT4/SBaQYee9ajIjuxe4cUqhulfkx3ziJhLfmtSOEm08Bnt9CZJ1Vcya5i
 76J8FDUpiSyjA==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@lst.de,
 hch@infradead.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 inux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V3 17/17] KVM: compat: riscv: Prevent KVM_COMPAT from being
 selected
Date: Thu, 20 Jan 2022 15:39:10 +0800
Message-Id: <20220120073911.99857-18-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_234139_928633_F2D66805 
X-CRM114-Status: UNSURE (   9.94  )
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

Current riscv doesn't support the 32bit KVM/arm API. Let's make it
clear by not selecting KVM_COMPAT.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 virt/kvm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index f4834c20e4a6..a8c5c9f06b3c 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -53,7 +53,7 @@ config KVM_GENERIC_DIRTYLOG_READ_PROTECT
 
 config KVM_COMPAT
        def_bool y
-       depends on KVM && COMPAT && !(S390 || ARM64)
+       depends on KVM && COMPAT && !(S390 || ARM64 || RISCV)
 
 config HAVE_KVM_IRQ_BYPASS
        bool
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
