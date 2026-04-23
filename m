Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABFEF589B2
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Apr 2026 12:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pss7jpy6R6bzo0An+wACrTZ/6T9OELW3WpGzoHWWYRc=; b=fVfF9PMon1mRm5
	s7QEApGanmzDsUSFJyrzGgWsOO8NuDWowB1loigxQ/I3C0SVYmNC7gZtjxl8goO5Qdm4OBZA2Cl0E
	YEa2bfUy2vufhdTv47CytOTBpNsGUGuVH2tE6CQ8lixRnTDqZT5UxfUDQQnDIlH5ciCBX0eTo0gAs
	h5P4D6h08qPc0z1GFUN1+1tqQTUh/YUyFd4sIlmxcF0RuDHi+fqbYteR/4S81QTKsqbEY3VH/l4OP
	wG1i3O5OeVYs6rnrx32CNssJlWNZcxGsGLvFsFd7rHKRXhb7OgiodwLDqh1Fkl3m9Yb7Ib5FRWBmO
	N9q3HdPPsqN9ZEERSt3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtOf-0000000BdvU-1XvN;
	Thu, 23 Apr 2026 12:43:09 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtOY-0000000Bdp9-3YLw;
	Thu, 23 Apr 2026 12:43:07 +0000
Received: from CPC-namja-026ON.redmond.corp.microsoft.com (unknown [4.213.232.18])
	by linux.microsoft.com (Postfix) with ESMTPSA id 527D720B7167;
	Thu, 23 Apr 2026 05:42:55 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 527D720B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1776948182;
	bh=Q76kHi3aTcSg7O4rk2jstLQj95vNaQvrKNEZQjnBiXc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kdfK+cNKF7P5mLQrePhjWhMrUP6eSRlh5W0NUH46xhS7kvsAEkw46O2Mmpt2oiuMV
	 n1LTlHyLATBHcLD8VCm0Uj+Zz7RtO6UoWzJE2KKhGGK9Glv8QnC79mPIAFsRfq+uui
	 9Myf/BY8wGV9TnMow/+qSmn15wPrRIPwpGhE10oA=
From: Naman Jain <namjain@linux.microsoft.com>
To: "K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michael Kelley <mhklinux@outlook.com>
Cc: Marc Zyngier <maz@kernel.org>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Naman Jain <namjain@linux.microsoft.com>,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	vdso@mailbox.org,
	ssengar@linux.microsoft.com
Subject: [PATCH v2 05/15] Drivers: hv: Export vmbus_interrupt for mshv_vtl module
Date: Thu, 23 Apr 2026 12:41:55 +0000
Message-ID: <20260423124206.2410879-6-namjain@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423124206.2410879-1-namjain@linux.microsoft.com>
References: <20260423124206.2410879-1-namjain@linux.microsoft.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_054302_907843_B31734B3 
X-CRM114-Status: UNSURE (   9.75  )
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

vmbus_interrupt is used in mshv_vtl_main.c to set the SINT vector.
When CONFIG_MSHV_VTL=m and CONFIG_HYPERV_VMBUS=y (built-in), the module
cannot access vmbus_interrupt at load time since it is not exported.

Export it using EXPORT_SYMBOL_FOR_MODULES consistent with the existing
pattern used for vmbus_isr.

Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Reviewed-by: Roman Kisel <vdso@mailbox.org>
Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
---
 drivers/hv/vmbus_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 052ca8b11cee..047ad2848782 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -57,6 +57,7 @@ static DEFINE_PER_CPU(long, vmbus_evt);
 /* Values parsed from ACPI DSDT */
 int vmbus_irq;
 int vmbus_interrupt;
+EXPORT_SYMBOL_FOR_MODULES(vmbus_interrupt, "mshv_vtl");
 
 /*
  * If the Confidential VMBus is used, the data on the "wire" is not
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
