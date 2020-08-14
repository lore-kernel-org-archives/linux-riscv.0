Return-Path: <SRS0=Z5mV=BY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7D4C433E1
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2020 21:49:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B679C20716
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2020 21:49:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sHW0/BMV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="P/xkM7Ke"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B679C20716
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZbN93T42XD1eKJighw7OQGeBjNgosESeTTx6b5IpE4g=; b=sHW0/BMV6vAUguy/n+ied2xqi
	Mzngotozxlgv25+8nGKWTMzDhJEGxktDUHi7QD6u5mbWbomdWMy1dtbO3qCRgIHqpoN5XYnSutsTZ
	2Vd+nHKupcaxYfPGZ0ou13XwftLahyENRg8d1ey9cadVqLS4jVbxM7HKLkX5rbkuEgZGU8HdabHBK
	TkXDEHtyN/wFMWtfbf5yR8idq6VnmmDS1yPAtW0/UPPEWy7BXGzzDW6BjsPcvfv5ZMhtwESLatYyW
	qVVkyQMqAWOH9qzgu8D3VsDulrM15xwWk6vhsAQNhrk3xSX4GWHr44rz9FRRmYtwFl2YXvER10HRi
	ZlvfTIVug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6hZH-0008Se-Lh; Fri, 14 Aug 2020 21:48:55 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6hYv-0008Im-Ps; Fri, 14 Aug 2020 21:48:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1597441713; x=1628977713;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UjeLYAGOcdXcIsgSttMVEHrk7RBdvzzoyHtETVrepjo=;
 b=P/xkM7Ken0tyPIpZTXb/JK0qLn1jvu5Al1qdimnzZTvjkNfxqIA24T9i
 nUkwS1DqFSVXfRdQpMrSVoMDsNI8VIhZzJM9HufVd2tzciUBtQNbMOW6Y
 4gNM2pcXLTpLkBhzGQ7yMDyCpErp05eGWHc3N+om0OmmDoUuZDtNrS8Sg
 YyL6Ln14EoDW92y74bkbVDsEAUhACk2T+MxERtsRqFy/wtCUu/C1au4Us
 8qaVpgvXm6zNs0khxjD/9xnZWJ0LzlJhEt2kveFtYUJEHtFFnLCMZKHII
 UeEE/LCYW8jQA4pPFyXdWVnYOuiadGpe3+UP9f4YbF1DPEyh2bKYdMo1f Q==;
IronPort-SDR: oSiX8mroqiFVLPAT4tGax4A8GhMvByuwksRwrn9elC1dM2Zlmxl/V4susEK1lNtWUJeRXD78C7
 SG25JdA4BaNYNanyoB0bVOJGaNCktdFcTn4RhLX2LwQY9dTFaOSEsZ0Mru3+Jiktg948b+91//
 xOLMlD7Hhd7pt5I3V/ys80Iv/ZbtDIaagh6Mxvf0sLCy+Tkt//7eSHlBRcJN4viY71wVqQfTb5
 7kcQCmKfMr0eYt4Hy04y3uFaKcFxObzqU/Yo737OC1n3daHn/283X+d7Q4duN41ZMNDpOyOBnH
 xSA=
X-IronPort-AV: E=Sophos;i="5.76,313,1592841600"; d="scan'208";a="254397136"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 15 Aug 2020 05:48:32 +0800
IronPort-SDR: G6AW+sG6kjEyt8YbzfbFrFyC9SxvoUzBHVmjdpIZCTdVOCpeHOUWKZd15s81kXgkxxPmqw4Efb
 SyQqeGSsQYfg==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2020 14:35:37 -0700
IronPort-SDR: OiHQPqy3m8DvMgsYc0QMagm9siS9tQWyreMlyzSSKgLyP9TYhEfZkQosudZErrRfYErDIjVTC5
 hyH3FpWbrN7Q==
WDCIronportException: Internal
Received: from cnf006060.ad.shared (HELO jedi-01.hgst.com) ([10.86.59.56])
 by uls-op-cesaip01.wdc.com with ESMTP; 14 Aug 2020 14:48:31 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC/RFT PATCH 5/6] riscv: Add support pte_protnone and pmd_protnone
 if CONFIG_NUMA_BALANCING
Date: Fri, 14 Aug 2020 14:47:24 -0700
Message-Id: <20200814214725.28818-6-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200814214725.28818-1-atish.patra@wdc.com>
References: <20200814214725.28818-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_174834_064938_9F9D7003 
X-CRM114-Status: GOOD (  13.90  )
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ganapatrao Kulkarni <gkulkarni@cavium.com>,
 Steven Price <steven.price@arm.com>, Greentime Hu <greentime.hu@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
 Nick Hu <nickhu@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Greentime Hu <greentime.hu@sifive.com>

These two functions are used to distinguish between PROT_NONENUMA
protections and hinting fault protections.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/asm/pgtable.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 515b42f98d34..2751110675e6 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -183,6 +183,11 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 	return (unsigned long)pfn_to_virt(pmd_val(pmd) >> _PAGE_PFN_SHIFT);
 }
 
+static inline pte_t pmd_pte(pmd_t pmd)
+{
+	return __pte(pmd_val(pmd));
+}
+
 /* Yields the page frame number (PFN) of a page table entry */
 static inline unsigned long pte_pfn(pte_t pte)
 {
@@ -286,6 +291,21 @@ static inline pte_t pte_mkhuge(pte_t pte)
 	return pte;
 }
 
+#ifdef CONFIG_NUMA_BALANCING
+/*
+ * See the comment in include/asm-generic/pgtable.h
+ */
+static inline int pte_protnone(pte_t pte)
+{
+	return (pte_val(pte) & (_PAGE_PRESENT | _PAGE_PROT_NONE)) == _PAGE_PROT_NONE;
+}
+
+static inline int pmd_protnone(pmd_t pmd)
+{
+	return pte_protnone(pmd_pte(pmd));
+}
+#endif
+
 /* Modify page protection bits */
 static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 {
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
