Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4636FF494D
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 06:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iWInujDMQ3fJjTbuaUqEWfhoLz7SM+gOsaNg11wmtFE=; b=CSxKPHYlb0h5lJ
	2c7pg8wZSOvIZQykqtmMfWIav3TcTyVulOQyK3NfI8FKPxowA+w41IAiVjynzv+NaYdNnWJOJ2vBE
	HUXlXCvz7tXfV07o33lvp/p6HHgH6AcEU83gGnYxgfduKrQEeb7mxp/ZooZ0FdrbxbCSj0TfFrDRz
	ISMOYi+RQlcukciX49Gja1qa289ZA0R+YLdVy8zrIqrQX8n0DlNJ6XAzFeedJhPU+vErQH5CTfkBy
	v8+RgCR15tfnZWh3qpYo5XCYpFzLuA3uwRkoyN5rtoo1PhmX7PRDzA7aTs1UJLRnGWHtqyTSD3JK5
	2IiAud2PjoKZOshlHkbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w76SO-0000000Aied-3jgo;
	Mon, 30 Mar 2026 06:50:40 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w76SM-0000000Aie0-0HCr
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 06:50:39 +0000
Received: from localhost.localdomain (unknown [116.25.94.183])
	by smtp.qiye.163.com (Hmail) with ESMTP id 38c8426bf;
	Mon, 30 Mar 2026 14:50:22 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: gaohan@iscas.ac.cn
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	rabenda.cn@gmail.com,
	robh@kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH v3 2/3] riscv: dts: spacemit: Define the P1 PMIC regulators for OrangePi RV2
Date: Mon, 30 Mar 2026 14:50:19 +0800
Message-Id: <20260330065019.1918917-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <492e0bea0fb84f49f4bead3dc3d563b13d98df11.1774803532.git.gaohan@iscas.ac.cn>
References: <492e0bea0fb84f49f4bead3dc3d563b13d98df11.1774803532.git.gaohan@iscas.ac.cn>
MIME-Version: 1.0
X-HM-Tid: 0a9d3d81fe4403a2kunm8cfff3c446d9cc
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSk0aVh5OSkxPSEIaQkxMQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSkNIWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_235038_294920_2D24B03E 
X-CRM114-Status: UNSURE (   4.53  )
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

Hi,

> The power management hardware design on the OrangePi RV2 is identical to
> the Banana Pi BPI-F3, so the DT Nodes were taken from k1-bananapi-f3.dts.

Why? If you've looked at the schematics, you'll find there are differences.
e.g. The regulator name and the PMIC have several pins left floating:
aldo2, aldo3, aldo4, dldo2, dldo3, dldo7.

> +	reg_dc_in: regulator-vcc-in-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "dc_in_5v";

vcc_5v0

> +	reg_vcc_4v: regulator-vcc-4v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_4v";

vcc4v0

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
