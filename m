Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5ACC25B48
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 15:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vDkC4lxK0DKITW51Lx86T9A6liMQCsZcoEsLCjQa2b0=; b=Ku9Q+m+1Byn4x6
	97y2W5UyWYjxjNK1E8z2v9fpd0POWD1GmFuGmtsIWI5zAlXJjJ8e6VJE5ShmVslBtUaiKGDdg1C4M
	ZAZbb0+s6P/XcvqD8NBqbWjExaBdY1fWB7E/M3b/e8lTjfOMXU2wHK/Cs2ntaW/5M70QpjB7m1paO
	+h3k24XrefgKaRcYIx2RZ3IUYR1koTOYvklwiNZ/9Q9gDrn1bE69fBrnIAB61W8UuIumpDaELk1lx
	APUHoHB87bEDxAConnIkmZ6qUR1KURcglvYZjpjZIuDMr97kngeiIGDzjqwn06dUqgefyfJYSScXB
	693X8jrL7w/Z3PbMpwHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJDg-00AIrE-0k;
	Tue, 24 Oct 2023 15:21:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJBO-00AGoj-30;
	Tue, 24 Oct 2023 15:19:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=7mUed4j6JYeBkSblH2nqcvZsQbChg0c7FCSaYvctrZY=; b=EsPbdG8qEesGjrQSboHYwIgB9L
	fkKTvmNZrKb6VmrR7lQ5Hr2TetXYkstB29c3TTH1SP0/GWJkbCyqqVvmNq2OcXZSi85XMtikkINpb
	YRs41Gl/90Zsg0U+fIbWXg7ujtdr9wvb8AM09Zic44//of61N3zHCKuwPvyWyZ79kWg6fa9dqm01w
	+YQtyDfa4WJHO3MDBr3ZsfbEZjtGRqoxiCwTNgeATjc9vjfT6W2r7Yodr8qmu8KIqHRl3SK9rsYZv
	mY5yztyuR76vxVv1mQbjxU+aY/VGoIfnC/YYlo2ZhdyVs37c4TUZeR24wTJV4htK2uufLsmCT7+9L
	6fr6QEcQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJBL-00FbJv-1A;
	Tue, 24 Oct 2023 15:19:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7mUed4j6JYeBkSblH2nqcvZsQbChg0c7FCSaYvctrZY=; b=RXKzMk8nxqLsHr4DrG64vwCDNl
	L1dBvNRAboxbtvs9cSI1KCnV0hnPEd7IW2lznQwfui6jPeu3MJ5AAq2UCyu6FgD+8x2iGNf4iDs5W
	Hw2gX7LecqKIJFAwAF1BKt8bxa1WBrvQMwLcjVSAzi89+ncVyvzw0koZvYsmjNUkGg+jRIE5r3U5x
	orHxHls/n75Zzq/kBkYtZ0EOZfE8GldZzqesp2T03cpK4YGxXTcZiQmUuT5AYQwhg5tvCo9L0tXt9
	NbmL3Te3xKJ1+ljcRqR+ihf1KD34wlPyBSMmb4jpyIB5r1SctfT0r+pSXWkYCf0HEW9QvzvWn9Ogc
	wAFyW+YA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44454 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1qvJB9-0004VJ-12;
	Tue, 24 Oct 2023 16:18:47 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1qvJBA-00AqRq-QW; Tue, 24 Oct 2023 16:18:48 +0100
In-Reply-To: <ZTffkAdOqL2pI2la@shell.armlinux.org.uk>
References: <ZTffkAdOqL2pI2la@shell.armlinux.org.uk>
From: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
To: linux-pm@vger.kernel.org,
	 loongarch@lists.linux.dev,
	 linux-acpi@vger.kernel.org,
	 linux-arch@vger.kernel.org,
	 linux-kernel@vger.kernel.org,
	 linux-arm-kernel@lists.infradead.org,
	 linux-riscv@lists.infradead.org,
	 kvmarm@lists.linux.dev,
	 x86@kernel.org,
	 linux-csky@vger.kernel.org,
	 linux-doc@vger.kernel.org,
	 linux-ia64@vger.kernel.org,
	 linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
	 Jean-Philippe Brucker <jean-philippe@linaro.org>,
	 jianyong.wu@arm.com,
	 justin.he@arm.com,
	 James Morse <james.morse@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Robert Moore <robert.moore@intel.com>,
	acpica-devel@lists.linuxfoundation.org
Subject: [PATCH 31/39] ACPICA: Add new MADT GICC flags fields
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1qvJBA-00AqRq-QW@rmk-PC.armlinux.org.uk>
Date: Tue, 24 Oct 2023 16:18:48 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_161859_846618_2FCAE4C7 
X-CRM114-Status: GOOD (  11.23  )
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

From: James Morse <james.morse@arm.com>

Add the new flag field to the MADT's GICC structure.

'Online Capable' indicates a disabled CPU can be enabled later. See
ACPI specification 6.5 Tabel 5.37: GICC CPU Interface Flags.

Signed-off-by: James Morse <james.morse@arm.com>
---
This patch probably needs to go via the upstream acpica project,
but is included here so the feature can be tested.

If the ACPICA header files are updated before merging this patch set,
this patch will need to be dropped.

Changes since RFC v2:
 * Add ACPI specification reference.
---
 include/acpi/actbl2.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
index 3751ae69432f..c433a079d8e1 100644
--- a/include/acpi/actbl2.h
+++ b/include/acpi/actbl2.h
@@ -1046,6 +1046,7 @@ struct acpi_madt_generic_interrupt {
 /* ACPI_MADT_ENABLED                    (1)      Processor is usable if set */
 #define ACPI_MADT_PERFORMANCE_IRQ_MODE  (1<<1)	/* 01: Performance Interrupt Mode */
 #define ACPI_MADT_VGIC_IRQ_MODE         (1<<2)	/* 02: VGIC Maintenance Interrupt mode */
+#define ACPI_MADT_GICC_CPU_CAPABLE      (1<<3)	/* 03: CPU is online capable */
 
 /* 12: Generic Distributor (ACPI 5.0 + ACPI 6.0 changes) */
 
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
