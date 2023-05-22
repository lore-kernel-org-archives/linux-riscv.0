Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708F2C77B75
	for <linux-riscv@archiver.kernel.org>; Mon, 22 May 2023 10:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BhNciPNJQ5ccnxOn9klvoPaGapFMWQ7lcWy1qlO6kkQ=; b=ncfECU5j+sAQ3u
	qkZXU7NUTBGgTl2p0GIbt6mAeMGsOo7yN7HGwtgLRN6GYRuJ4ZH6HHy8ZE9gSG+0IEa4PN3IB+MzE
	EysbCdcZoK/MdriF8W0N3MA84eZV0l4kmK6OVPlUbwAwBG0njL6lVqsMRciR1EOCd3uEKB+vzo1Uw
	Sm9NZJXyPA61AT4BUOv773b8FtN8vdZlRKPbHEPFwW/k2hvuJVEuxvzfX/lDaqW92fN8o3cJbiNgO
	A+4LyVgHAP1olwBAjYyUIxSrZv+vmII3usQ1YBwG/zKEKyAi0jtTol+pyJqbKHbMZaifpX31xpG0g
	Istq8r4FsqzRTA1c3GKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q13Ed-006BZE-1m;
	Mon, 22 May 2023 10:57:51 +0000
Received: from esa2.hc3370-68.iphmx.com ([216.71.145.153])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q13Ea-006BXk-1c;
	Mon, 22 May 2023 10:57:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684753068;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FtaOawtEIZcYR8kQ1ZUJu5ElatA0FpUwqecHrTU8yhQ=;
  b=Ny53Bq7pdDs5UhCzH74q0khnmbaACwJ+X6y5owwh/oGTfnE5iZ0D+WyT
   VJxc9eP71bg9IT3+hLSuNfnRUGLZwHFzFC3u4W9XRjqRwM2pL3P4yI5Vi
   zDBWSrGLzKOI1HsNgKkg2PmVt0QP/ErvGacgX77IG+DNFNvBQ+YulTq86
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 109791905
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23: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
 zLJ
IronPort-HdrOrdr: A9a23:09+17q/QTihma8HpfNRuk+DJI+orL9Y04lQ7vn2ZKCY5TiX8ra
 vFoB11726WtN9vYgBDpTntAse9qBDnmaKdg7NwAV7KZmCPhILCFu5fBOXZogEIEheOk9Jg6Q
 ==
X-Talos-CUID: 9a23:2S2XfmxwRhoEaCNipankBgUFO984XnKB6k7AAFeEOVZZQuafEHyfrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3A0NkJAA8ep6I1nEDTNh1Sp+OQf+5K8YiPDmlUq8k?=
 =?us-ascii?q?DhpOGNBReIzmy0SviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,184,1681185600"; 
   d="scan'208";a="109791905"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: <tglx@linutronix.de>
CC: <James.Bottomley@HansenPartnership.com>, <andrew.cooper3@citrix.com>,
	<arjan@linux.intel.com>, <arnd@arndb.de>, <boris.ostrovsky@oracle.com>,
	<brgerst@gmail.com>, <catalin.marinas@arm.com>, <deller@gmx.de>,
	<dwmw2@infradead.org>, <gpiccoli@igalia.com>, <guoren@kernel.org>,
	<jgross@suse.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-csky@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mips@vger.kernel.org>, <linux-parisc@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux@armlinux.org.uk>,
	<lucjan.lucjanov@gmail.com>, <mark.rutland@arm.com>,
	<mikelley@microsoft.com>, <oleksandr@natalenko.name>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <paulmck@kernel.org>, <pbonzini@redhat.com>,
	<pmenzel@molgen.mpg.de>, <ross.philipson@oracle.com>, <sabrapan@amazon.com>,
	<seanjc@google.com>, <thomas.lendacky@amd.com>, <tsbogend@alpha.franken.de>,
	<usama.arif@bytedance.com>, <will@kernel.org>, <x86@kernel.org>,
	<xen-devel@lists.xenproject.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH] x86/apic: Fix use of X{,2}APIC_ENABLE in asm with older binutils
Date: Mon, 22 May 2023 11:57:38 +0100
Message-ID: <20230522105738.2378364-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230512203426.452963764@linutronix.de>
References: <20230512203426.452963764@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_035748_691034_458CA3B1 
X-CRM114-Status: UNSURE (   8.28  )
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

"x86/smpboot: Support parallel startup of secondary CPUs" adds the first use
of X2APIC_ENABLE in assembly, but older binutils don't tolerate the UL suffix.

Switch to using BIT() instead.

Fixes: 7e75178a0950 ("x86/smpboot: Support parallel startup of secondary CPUs")
Reported-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Tested-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 arch/x86/include/asm/apicdef.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/apicdef.h b/arch/x86/include/asm/apicdef.h
index bf546dfb6e58..4b125e5b3187 100644
--- a/arch/x86/include/asm/apicdef.h
+++ b/arch/x86/include/asm/apicdef.h
@@ -2,6 +2,8 @@
 #ifndef _ASM_X86_APICDEF_H
 #define _ASM_X86_APICDEF_H
 
+#include <linux/bits.h>
+
 /*
  * Constants for various Intel APICs. (local APIC, IOAPIC, etc.)
  *
@@ -140,8 +142,8 @@
 #define APIC_BASE (fix_to_virt(FIX_APIC_BASE))
 #define APIC_BASE_MSR		0x800
 #define APIC_X2APIC_ID_MSR	0x802
-#define XAPIC_ENABLE	(1UL << 11)
-#define X2APIC_ENABLE	(1UL << 10)
+#define XAPIC_ENABLE		BIT(11)
+#define X2APIC_ENABLE		BIT(10)
 
 #ifdef CONFIG_X86_32
 # define MAX_IO_APICS 64

base-commit: 0c7ffa32dbd6b09a87fea4ad1de8b27145dfd9a6
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
