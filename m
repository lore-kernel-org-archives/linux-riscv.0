Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7978CF4645C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 12:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tJusUu0qSocI1/8RBFFEhsmSY9G3W/11HYY+bN5MBXA=; b=kvByOCOLtXqjm8
	64aWZU/cRyYF4qZONZR/tBq7EqtrSeqOw+JI6R3HFqDFePMEw8PsGCEUCb4m5CI3YN4CJdkltJLHo
	UyMqAX7dM8UC7Eh8s0pZAWRsJBnT7l1/FAyuiaVO/z8lDPaE5C4PAuWwS1MQ7HXrNYIVzTsAwsy+F
	klXfEvd482W7vLXUJ8u/bY+Q2sjNbqhTbvkaSVE93vTwkvfZlW5e1Shsw4ZMaaVAMI8lTXhSA/Vko
	dki2aPDcqfd32fu7QVEkM5vjwKJLTzzc7H5cOXyYtiqE2SeIEGC7ZzS75SwZaqhf5iVD5LyOfiGaC
	Af5NDN9pcZQvcjT5Jduw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26pB-00000003uoQ-19Ff;
	Mon, 16 Mar 2026 12:13:33 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26p8-00000003uly-1eN9;
	Mon, 16 Mar 2026 12:13:31 +0000
Received: from CPC-namja-026ON.redmond.corp.microsoft.com (unknown [4.213.232.19])
	by linux.microsoft.com (Postfix) with ESMTPSA id 4E24E20B7017;
	Mon, 16 Mar 2026 05:13:23 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4E24E20B7017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1773663210;
	bh=46FOvu173yz/45+2tHFqqCdlI7TqogjbgR44sdGBrs4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RJON6Msr3CvOqx1hzDUbXbmZABaCXsa+3ownuDxRU5dOGsJXmHBboZyW6LhEMVD8C
	 3+WLu8gfADivo5Dzhgz41DqONk3JZej3vYsDY2zh+6LlrYw+zYD+Nqeo7MV72M3uMK
	 yAhikSYcK6VeSBPcdw0Awn+wjuhIDKlbjSdjQtww=
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
Subject: [PATCH 05/11] drivers: hv: Export vmbus_interrupt for mshv_vtl module
Date: Mon, 16 Mar 2026 12:12:35 +0000
Message-ID: <20260316121241.910764-6-namjain@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316121241.910764-1-namjain@linux.microsoft.com>
References: <20260316121241.910764-1-namjain@linux.microsoft.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_051330_465711_E4B5FDD0 
X-CRM114-Status: GOOD (  10.12  )
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

Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
---
 drivers/hv/vmbus_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index f99d4f2d3862..de191799a8f6 100644
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
