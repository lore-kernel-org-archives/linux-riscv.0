Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5574FB3D00
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 10:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kMS8+D6PevpsMYGHzMS7HcuouoWv/7B2JJanYHocxmY=; b=x7h95AXTANotBm
	jpdrmfpr1AKP95Zyrk0uJ6GfjqKBydU2jHvbxSmhtkLi+KAw0lJc2YwdG3VhWnyRYBDlZ2y/o1oc1
	GwXKf1niC9AxWvjMzgWa9eypZMvMO+ACxa7qqlCRzFgjDK4SWp7sthcs/4tLSA0O8oXpThlQdjyO0
	aWIyuoG1LH0YB9orAUDlJK361iC5uo+8KTLlO5aVneubKIqvqhsyXqin6jzuPG8cihaCMGYFGncVX
	hc7SwWtrJGZT9MY7sYxb8+/ayzozAXHJd/Fbx9yVWyElzK/GL8aYhQEg70Dz/YyIybXSLrEuTbL0O
	B3kPglkhLRQ1CaVjEEFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79rY-0000000B3VL-0GXT;
	Mon, 30 Mar 2026 10:28:52 +0000
Received: from exmail.andestech.com ([60.248.187.195] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79rU-0000000B3UU-1t4O
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 10:28:50 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTP id 62UARlIT038029;
	Mon, 30 Mar 2026 18:27:47 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Mar
 2026 18:27:47 +0800
From: Hui Min Mina Chou <minachou@andestech.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <geert+renesas@glider.be>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <magnus.damm@gmail.com>,
        <ben717@andestech.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jonathan.cameron@huawei.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
CC: <tim609@andestech.com>, <alex749@andestech.com>, <az70021@gmail.com>,
        "Hui
 Min Mina Chou" <minachou@andestech.com>
Subject: [PATCH 0/7] refactor Andes cache driver for generic platform support
Date: Mon, 30 Mar 2026 18:27:17 +0800
Message-ID: <20260330102724.1012470-1-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 62UARlIT038029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_032848_841154_2BB446A8 
X-CRM114-Status: GOOD (  11.61  )
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

This series refactors the Andes cache driver from an AX45MP-specific
implementation to a generic Last Level Cache (LLC) driver that supports
a broader range of Andes CPU cores.

The main motivation is to decouple the driver from AX45MP-specific
naming and assumptions, making it easier to support future Andes
platforms without duplicating code.

Changes in this series:

- Refactor the ax45mp_cache driver into a generic andes_llcache driver,
  introducing support for multiple Andes CPU cores and updating the
  compatible strings accordingly

- Improve initialization by centralizing cache operations

- Improve LLC operation performance by switching to relaxed I/O
  accessors and eliminating unnecessary fence instructions on I/O
  memory, leveraging the platform's point-to-point strongly ordered
  channel guarantee. Also fix hart ID mapping to use
  cpuid_to_hartid_map() for correct behavior in AMP setups

- Centralize cache operations and adopt native WBINVAL support,
  simplifying the cache flush/invalidate path

- Rename DT binding schema from andestech,ax45mp-cache to
  andestech,llcache and update all compatible strings in the RISC-V DTS
  files accordingly

- Add MAINTAINERS entry for the Andes cache driver


Hui Min Mina Chou (7):
  cache: ax45mp_cache: refactor cache driver for generic Andes platform
    support
  cache: andes_llcache: refactor initialization and cache operations
  cache: andes_llcache: improve performance of LLC operation
  cache: andes_llcache: centralize cache ops and use native WBINVAL
  dt-bindings: cache: ax45mp-cache: rename ax45mp-cache to llcache
  dts: riscv: update cache compatible strings to LLC
  MAINTAINERS: Add maintainers for Andes cache driver

 ...ache.yaml => andestech,andes-llcache.yaml} |  20 +-
 MAINTAINERS                                   |   8 +
 arch/riscv/Kconfig.errata                     |   2 +-
 arch/riscv/boot/dts/andes/qilai.dtsi          |   4 +-
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi   |   2 +-
 drivers/cache/Kconfig                         |   6 +-
 drivers/cache/Makefile                        |   2 +-
 drivers/cache/andes_llcache.c                 | 215 +++++++++++++++++
 drivers/cache/ax45mp_cache.c                  | 217 ------------------
 drivers/soc/renesas/Kconfig                   |   2 +-
 include/linux/soc/andes/csr.h                 |  12 +
 11 files changed, 254 insertions(+), 236 deletions(-)
 rename Documentation/devicetree/bindings/cache/{andestech,ax45mp-cache.yaml => andestech,andes-llcache.yaml} (76%)
 create mode 100644 drivers/cache/andes_llcache.c
 delete mode 100644 drivers/cache/ax45mp_cache.c
 create mode 100644 include/linux/soc/andes/csr.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
