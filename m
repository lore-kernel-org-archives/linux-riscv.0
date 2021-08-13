Return-Path: <SRS0=kDER=NE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 124B1C4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Aug 2021 15:35:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C421260F57
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Aug 2021 15:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C421260F57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZmOqObHVbZNVjOsimYuPpmc+upfEfupDSgSb/Yl5gOc=; b=z8D4gjn7WWIGcv
	oawyzViY3UhSmvKemiLnPwJNylnQd3to5GoNeveUzmjSimUdn9knrHzGJcPqgBI+dPIye/PcACXoE
	cNAw06Kc+bD3SCT4L75AfKDJSfO1AJ5o1NnFh5QKOq6VQfS4ZxCXVT9d90E6N7rckqGVjBzFYttIq
	fHswONs4w9KU1TBL4V1n4hZgjC3IgV0IEhM0ozaYNGxdPpMG1sXUCsd+wxEJnR/+LvidD1au2pm2K
	Il+Gu0WAkZly6Vc0RXM1cRdSgZQj4g5VfyAhQtOT/zTCBuTzeb7fERK/QTPakEomx6j2cU5HrjO3H
	4xrboC4SClMzJBk/dnKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEZDB-00Cz22-KQ; Fri, 13 Aug 2021 15:35:09 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEZD9-00Cz1K-DY
 for linux-riscv@lists.infradead.org; Fri, 13 Aug 2021 15:35:08 +0000
Received: from fraeml710-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4GmSK93Ttlz6GC48
 for <linux-riscv@lists.infradead.org>; Fri, 13 Aug 2021 23:34:21 +0800 (CST)
Received: from fraeml709-chm.china.huawei.com (10.206.15.37) by
 fraeml710-chm.china.huawei.com (10.206.15.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 13 Aug 2021 17:35:03 +0200
Received: from fraeml709-chm.china.huawei.com ([10.206.15.37]) by
 fraeml709-chm.china.huawei.com ([10.206.15.37]) with mapi id 15.01.2308.008;
 Fri, 13 Aug 2021 17:35:03 +0200
From: Nicolas Peslerbe <nicolas.peslerbe@huawei.com>
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: [PATCH] This patch propose to solve a driver incompatibility issue
 due to the current starting IO address for PCI addressing on RISCV arch.
Thread-Topic: [PATCH] This patch propose to solve a driver incompatibility
 issue due to the current starting IO address for PCI addressing on RISCV
 arch.
Thread-Index: AdeQWIcr5V7wuNf1TsyNI5N9F+Zi8Q==
Date: Fri, 13 Aug 2021 15:35:03 +0000
Message-ID: <076a8fe4056e4137865eb440564dd598@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.86.61]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_083507_670939_B2BF6C7D 
X-CRM114-Status: GOOD (  12.67  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The issue was observed when virtio drivers failed to load for a Virtio netw=
ork PCI device (1af4:1000).

The current implementation of virtio does not permit to have a PCI resource=
 block starting at the address 0.

This can be observed in function pci_iomap_range, at line 28 of file ./lib/=
pci_iomap.c:
37 if (len <=3D offset || !start)
38=A0=A0=A0 return NULL;

Because start variable value corresponds to the PCI resource start address:
33 resource_size_t start =3D pci_resource_start(dev, bar);

In function virtio_pci_legacy_probe (line 212), in file ./drivers/virtio/vi=
rtio_pci_legacy.c,
the returned NULL value results in returning the ENOMEM error:
246 rc =3D -ENOMEM;
247 vp_dev->ioaddr =3D pci_iomap(pci_dev, 0, 0);
248 if (!vp_dev->ioaddr)
249=A0=A0 goto err_iomap;

As it is already the case for other architectures (like ARM64), I suggest t=
o add an offset the PCIBIOS_MIN_IO constant, it forces IO resource address =
to be non zero.

Not enough knowledge on PCI to evaluate possible issues resulting from PCIB=
IOS_MIN_IO value change.

Signed-off-by: Nicolas Peslerbe <nicolas.peslerbe@huawei.com>
---
arch/riscv/include/asm/pci.h | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pci.h b/arch/riscv/include/asm/pci.h in=
dex 7fd52a30e605..15da9129aace 100644
--- a/arch/riscv/include/asm/pci.h
+++ b/arch/riscv/include/asm/pci.h
@@ -12,7 +12,7 @@

#include <asm/io.h>

-#define PCIBIOS_MIN_IO=A0=A0=A0=A0 0
+#define PCIBIOS_MIN_IO=A0=A0=A0=A0 0x1000
#define PCIBIOS_MIN_MEM=A0=A0=A0 0

/* RISC-V shim does not initialize PCI bus */
--
2.32.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
