Return-Path: <SRS0=SHZ6=F3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D3EC433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Dec 2020 16:33:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96C962229C
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Dec 2020 16:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96C962229C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ajzMBzHu5bt2jc5OlgWPg7m+uLV87ADd+wdhybpBRyY=; b=fLWuL6qcYbqfwl4p1RUzeJxfUV
	t52fFc14AXKD1KAHoy5wWmhbCoyPR7X/KeOW2cElv5h1MFvYEayjJzbgQEdY2aVTdJCPzprh0xhzW
	SL76YeabZw8X1pq9DMDdOw+qFanRRqB18zAsNwQPGYZgGkY+Pj9Xq6DMyc+GTPD1juLF6bkZxyh2L
	vq+bk1X0ZHB1UhcMoApWAUC5qoGNku7mFUuWhwGWkxAo7cv7HdWqN+9Q79bIyfKZztYZPgx6y8w9J
	AcSm4AjEbXeEB+NnIeqy0RmfNA+IMML5uNdu54Rvim56mqFi/NoH6+VbhmMIVhQtG2rIMcOVwVADy
	0Kg3yyxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ks74K-0007GO-7x; Wed, 23 Dec 2020 16:32:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ks74H-0007Fz-O5
 for linux-riscv@lists.infradead.org; Wed, 23 Dec 2020 16:32:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1608741173; x=1640277173;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=zCSMGNUtLeEJ3RtG5a1G/RkIaYNcnXaPAoDqDMa6dVI=;
 b=UIw9BsY+F0WoLDhyBF4rjWyFw05FSdR5swn1RQ2PJPKpy5DTnpKk0AjR
 lxwONP4+t2akH6codUmAjCTHc03dMomMNFgwvrycCs9QrC3GzT7RQfoOn
 Z9QdtXFSxcTZ9aQ9P2C77l9chUU34Oy1Y/or6XJYfRRsrg9EaDiImgV3l
 RZayDPLzl9SbgUPdQ8vqIG44o7aAuFmr0sGLbdVwaSiXnyMAXS5wEg2KE
 OC3GXqXg8OjH1TeZ+Rqfh7BOLMiZaW2cmRD0IyVlt4gegx8fk5MAS2ofy
 Bm5rMU2OHQvaz0cKvHz/SJE/bjHVN509LqubpUHw2OMHvqfCbPR98oQ5b A==;
IronPort-SDR: +InkrecSK9jQEIGL+a7SoLdAnrTbmL0535eQHToG5ZjzDgXXoVLa2TNhOeKXzAv+wUoWykgIm7
 kiqoFl5TE2tamAiaags6FxnRcjsd3udS5JeSht+wEiTe12oidfPbk5Vk7VR1pr7ucDpgTfU+st
 X23VieoofvlechNIoJJj1VcCzv4xsEoP7m79PFC5Q/1/YRDYMBEfM1fwZrRkM4X9yWL8GPiFDH
 MhORZDMEkuz4MZyOd37qfaD1fh94qzZtfsazLF7uxizSvetjX5L4Uqn+S4WULS1KTSVQy5B1Z8
 MYQ=
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; d="scan'208";a="38426616"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Dec 2020 09:32:50 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 23 Dec 2020 09:32:50 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Wed, 23 Dec 2020 09:32:47 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v3 0/5]  Add support for the PolarFire SoC system controller
Date: Wed, 23 Dec 2020 16:32:47 +0000
Message-ID: <20201223163247.28923-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_113254_085814_8212DCA8 
X-CRM114-Status: GOOD (  13.25  )
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
Cc: cyril.jean@microchip.com, david.abdurachmanov@gmail.com,
 daire.mcnamara@microchip.com, anup.patel@wdc.com, j.neuschaefer@gmx.net,
 atish.patra@wdc.com, Conor Dooley <conor.dooley@microchip.com>,
 lewis.hanly@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

This patch series adds support for the system controller on
the PolarFire SoC, using the mailbox framework. A Microchip directory
in the SoC subsystem has been created to hold the mailbox client
driver and will be used for future service drivers.

This directory is included by the kconfig option:
CONFIG_SOC_MICROCHIP_POLARFIRE, so this patch series depends on Atish
Patra's PolarFire SoC support patches which introduce that option.

It further depends on the MAINTAINERS entry created in the same series.

Changes from v2:
* Further reworked dt bindings to satisfy errors and feedback
  (hopefully phandle array is the correct type for the mboxes)
* Full maintainers entry moved to Atish's PFSoC support series, this series now only adds mailbox driver
* Converted config options from MPFS to POLARFIRE_SOC so they are more recognisable
* Further simplified driver code from feedback

Changes from v1:
* Squashed header into first patch
* Fixed DT binding warnings & small fixes
* Cleaned up drivers from feedback

Conor Dooley (5):
  mbox: add polarfire soc system controller mailbox
  dt-bindings: add bindings for polarfire soc mailbox
  soc: add polarfire soc system controller
  dt-bindings: add bindings for polarfire soc system controller
  MAINTAINERS: add maintainers for polarfire soc mailbox driver

 .../mailbox/microchip,mailbox-mpfs.yaml       |  47 +++
 .../microchip,mpfs_sys_controller.yaml        |  34 +++
 MAINTAINERS                                   |   1 +
 drivers/mailbox/Kconfig                       |  12 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/mailbox-mpfs.c                | 285 ++++++++++++++++++
 drivers/soc/Kconfig                           |   1 +
 drivers/soc/Makefile                          |   1 +
 drivers/soc/microchip/Kconfig                 |  10 +
 drivers/soc/microchip/Makefile                |   1 +
 drivers/soc/microchip/mpfs-sys-controller.c   | 127 ++++++++
 include/soc/microchip/mpfs.h                  |  51 ++++
 12 files changed, 572 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,mailbox-mpfs.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.yaml
 create mode 100644 drivers/mailbox/mailbox-mpfs.c
 create mode 100644 drivers/soc/microchip/Kconfig
 create mode 100644 drivers/soc/microchip/Makefile
 create mode 100644 drivers/soc/microchip/mpfs-sys-controller.c
 create mode 100644 include/soc/microchip/mpfs.h

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
