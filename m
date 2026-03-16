Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269DFF4645C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 12:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dIujDWm1mxddn7X+Xoukc7vhLOqlrAUwQ3mmvql1Q/Y=; b=Ns6Jw89CwFPGog
	BohVSo+p/iu25C2x1jBDUaORLGYa75KaMhdqN3wtxNK265ucr6Ss4P77IuHZxLpPZfaOfhaO0jHUZ
	nHv06505W9bBkgnKk2jw9ZRAPvRwsrrlOTt371raWUbJK+qbqIjI426JWG3Jmf6IHhXDJboliX4YI
	xv8nFBhCPlJ8cB4XXcPhaejoCSTssVCb55eiptO2hJT7MnkkO9s7xuXHHARBpgb7AM7uXB3q3nWGA
	JKuhIUH6+ZQYK3jBsCLSirmGojHfl8sviVSTKaO+pSl7CvPepXHxk4xXwNc0TjmBajmjAvRdsAXxX
	+4dW5JdYrNfxFaZQqFPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26px-00000003vas-0K0w;
	Mon, 16 Mar 2026 12:14:21 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26ps-00000003vVm-3IPQ;
	Mon, 16 Mar 2026 12:14:18 +0000
Received: from CPC-namja-026ON.redmond.corp.microsoft.com (unknown [4.213.232.19])
	by linux.microsoft.com (Postfix) with ESMTPSA id EDB4720B6F1B;
	Mon, 16 Mar 2026 05:14:08 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EDB4720B6F1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1773663255;
	bh=RkE3+qElIZaIEZKSD/Ld3HbKTw73INK8ayuUxF+uJxQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s9CD2tDnG6tFpkuyB5dr6TborVEmEhSrR6Y8mXyzKLjUKHktvqTTPJaIKQrjL/zc6
	 oOb2+6CxUKPPPUNQgjiq9fmMtREq1URhAKprDqXBrnsic6rUfo53g99NrAGB5rPrRg
	 mP6kAUCgdZEQxBnaQJvRb7+6G0m2SBMscKd9jixc=
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
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Marc Zyngier <maz@kernel.org>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Naman Jain <namjain@linux.microsoft.com>,
	ssengar@linux.microsoft.com,
	Michael Kelley <mhklinux@outlook.com>,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 11/11] Drivers: hv: Kconfig: Add ARM64 support for MSHV_VTL
Date: Mon, 16 Mar 2026 12:12:41 +0000
Message-ID: <20260316121241.910764-12-namjain@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316121241.910764-1-namjain@linux.microsoft.com>
References: <20260316121241.910764-1-namjain@linux.microsoft.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_051416_867499_501ACD7D 
X-CRM114-Status: GOOD (  10.35  )
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

Enable ARM64 support in MSHV_VTL Kconfig now that all the necessary
support is present.

Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
---
 drivers/hv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hv/Kconfig b/drivers/hv/Kconfig
index 7937ac0cbd0f..393cef272590 100644
--- a/drivers/hv/Kconfig
+++ b/drivers/hv/Kconfig
@@ -87,7 +87,7 @@ config MSHV_ROOT
 
 config MSHV_VTL
 	tristate "Microsoft Hyper-V VTL driver"
-	depends on X86_64 && HYPERV_VTL_MODE
+	depends on (X86_64 || ARM64) && HYPERV_VTL_MODE
 	depends on HYPERV_VMBUS
 	# Mapping VTL0 memory to a userspace process in VTL2 is supported in OpenHCL.
 	# VTL2 for OpenHCL makes use of Huge Pages to improve performance on VMs,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
