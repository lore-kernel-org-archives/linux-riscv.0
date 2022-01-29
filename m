Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC27C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Jan 2022 12:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1SLW1GyhYCW7OtmvdirVFxrdoAE+TfSy8r6QiH+TUz8=; b=ksmewd6QAPH0UQ
	Wluo8CD8+S/twDa6/H9koBmwCycgSe/I8LtFqnaQxNXIxRNqRkihIs8OozMSUsvnVw6Fxz8SFLG0p
	hoZfucc6dK6aqL0sy2pTUPX8/Kfcembg0ymkbSNHZ3GYt1qEsz3RuiV5dd5UG+p7KS4DGgj7Px8cg
	XseqeKbON++iSwbK/x0vxNUVXkWZhH+CS80WzEclcBxVJ4eNMJIaowBiV/NQb0r6ETAe397SVAaZG
	qB7+cP0iZnHAEcwrvE9bdl0+ZK9xI/F4vE7HCuMUhWUExgqHUgtGc7C8YbET/jOrIxLZlZCMd+qJ/
	IRt+fJ62miaktKw+z9eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDmuh-004jEa-4y; Sat, 29 Jan 2022 12:33:07 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDmhe-004clx-Cq; Sat, 29 Jan 2022 12:19:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 06839B827B7;
 Sat, 29 Jan 2022 12:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA85DC36AE3;
 Sat, 29 Jan 2022 12:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643458775;
 bh=J65VF607Au+lXQP+8mKXArK6fDS/9hBK5qV8mWwi4fM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hNexS/zfRcpJQb9tKy9uq83XaLRwvXw8cgOzwvW9WGM8zvfpjFXUMmOHV7wpYFjBp
 R4zZeyMkYScimS69R0rmPSDQiLeoyC4tNXnoZopSCmrKnJ8CXAdNqsBzb1ez7gi6HN
 0Tyxrhtp5Mi9AKTv9oQEZpKazjfoFIi00SyeBHUBliq5cJENB09Lf+Pi7mLjn7YNBT
 aPsDFmioeyhcJlUMm3AZSlSK9ucd2doig8+iZU2Wyg6rU0gRs5rtmxtw+5HhoIUawl
 66/hvRTiAyCZ/rB8cQbfhby7/PO6/fXx4w8NqSqdB00+lX+6mDb6AecdxvXlTOakZB
 Pa6OVe+KOUrow==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@lst.de,
 hch@infradead.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V4 17/17] KVM: compat: riscv: Prevent KVM_COMPAT from being
 selected
Date: Sat, 29 Jan 2022 20:17:28 +0800
Message-Id: <20220129121728.1079364-18-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220129121728.1079364-1-guoren@kernel.org>
References: <20220129121728.1079364-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220129_041938_606556_7E5D2775 
X-CRM114-Status: GOOD (  10.55  )
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

Current riscv doesn't support the 32bit KVM API. Let's make it
clear by not selecting KVM_COMPAT.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
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
