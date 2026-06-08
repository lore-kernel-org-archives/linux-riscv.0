Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4ACCDE010
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 21:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=puiwgRMc3sMzCU5krlv3wtjaz6at/GHRIn4tvypS+10=; b=1489W1HFhV33ov
	LvhwyuzpNUysL0iOqL1UdxdXP8Q3l0+fp4Qv8EfGoLy9+lnP/4RrkFfULHR1hAxCBIzbRPoJ58p/G
	dQnQaNWln6RGde/OTiFsgok1lrj5F2Ofs/If16SdZZxLSywA/D81cw94+Tis3J8xco/tb1Ezckio6
	us5vW1aLAxKXoLAxX8rxmlXVFQMMmmreAo9aUhpuTKXiejwICEKRXBHPqIJmYRSku9tpoAyzFMP8C
	gLTDh+FO2lKpuPzVfHoVnDSZwgAZOL2d52dML2/p5dTrOjqgCVEZxa34NWoJjGmgjJRbFlJtKBSXD
	POqVuKpzDwmpbXfUVtvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcrGw-00000009q3s-1zfH;
	Thu, 25 Jun 2026 21:06:06 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTNK-00000002tOb-2UIW
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 06:22:21 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4gYhll4jZSz7Qxs2;
	Mon, 08 Jun 2026 14:22:11 +0800 (CST)
Received: from szxl2zmapp06.zte.com.cn ([10.1.32.108])
	by mse-fl1.zte.com.cn with SMTP id 6586M46N071766;
	Mon, 8 Jun 2026 14:22:04 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxlzmapp01[null])
	by mapi (Zmail) with MAPI id mid12;
	Mon, 8 Jun 2026 14:22:06 +0800 (CST)
X-Zmail-TransId: 2b036a265f8e79d-24602
X-Mailer: Zmail v1.0
Message-ID: <20260608142206426CGB5DlYd1xVlR8wrOawWH@zte.com.cn>
In-Reply-To: <CAB19ukEzQZktJcBAXi8X2Pwz+hO_FcR+iiaK9nsCAumP9BrHnw@mail.gmail.com>
References: 20260604145510898G2kTwM2Pr25QE5H8T4Wh6@zte.com.cn,CAB19ukEzQZktJcBAXi8X2Pwz+hO_FcR+iiaK9nsCAumP9BrHnw@mail.gmail.com
Date: Mon, 8 Jun 2026 14:22:06 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <sunilvl@oss.qualcomm.com>
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gaW9tbXUvcmlzY3Y6IEFkZCBkZXBlbmRlbmN5IGJldHdlZW4gaW9tbXUgYW5kIGRldmljZXM=?=
X-MAIL: mse-fl1.zte.com.cn 6586M46N071766
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Mon, 08 Jun 2026 14:22:11 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A265F93.001/4gYhll4jZSz7Qxs2
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_232218_807832_B83A81B7 
X-CRM114-Status: UNSURE (   7.54  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 25 Jun 2026 14:06:04 -0700
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
Cc: aou@eecs.berkeley.edu, tomasz.jeznach@linux.dev, alex@ghiti.fr, rafael@kernel.org, anup.patel@oss.qualcomm.com, linux-kernel@vger.kernel.org, andrew.jones@oss.qualcomm.com, linux-acpi@vger.kernel.org, iommu@lists.linux.dev, palmer@dabbelt.com, linux-riscv@lists.infradead.org, pjw@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> >
> > From: Wang Yechao <wang.yechao255@zte.com.cn>
> >
> > Commit 9156585280f1 ("ACPI: RIMT: Add dependency between iommu and
> > devices") adds the dependency between iommu and devices on ACPI
> > systems. On devicetree systems, the incorrect removal order also
> > occurs.
> >
> Interesting. Why is it not handled by the fw_devlink infrastructure in DT?
>
> Thanks,
> Sunil

Thank you. I have noticed that commit e149573b2f84 ("of: property: Add device
link support for "iommu-map"") adds support for "iommu-map" to the device link
supplier bindings, so that probing of PCI devices can be deferred until after
the IOMMU is available.

The QEMU RISC-V virt machine currently lacks the "iommu-map" property for the
PCIe bus when the iommu-pci device is used, which leads to this issue. Therefore,
I believe the correct fix is to add the "iommu-map" property for PCIe in QEMU.

Best regards,
Yechao

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
