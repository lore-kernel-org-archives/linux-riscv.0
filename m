Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81907FB519B
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 06:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j7/nCkYgdvVkC5BSQV5OCETbbM0bek3efPy/GxdL9ws=; b=Ei655pP+hsYIRm
	BVs/EjahpiQGN2A1F+2FWioXJUI4tiBG2YdZ+GHx6woGV4hevNr5Z+fTvJ4WeJ//sZWKA1TzAanLe
	V/xH36zTFnG+nEc5BUWNcoXUEOnPbLTtthc46+bPXA7RNkg5P0ARpN2jGTxfTWt5HiCD+qa0+7o3I
	nROqHMtzeWgXPrn+V3Cx4fP+UfW2IU7cLxLHS5D1b6igtqlfmQB/PZr5vDjsVhmciYjYpzsbCON8f
	okIt/Alfesx1LB39cAopuC55njZr3aYIGWBYH/o9/vcKtRafEkIvn5fMG5DAr6+4wtJ5i2BhiKe8x
	6XCrC3tkDxZXM9YmhTXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9zx9-00000005zOb-3RUX;
	Tue, 07 Apr 2026 06:30:23 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9zx6-00000005zMe-2iiR
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 06:30:22 +0000
Received: from localhost.localdomain (unknown [116.25.94.42])
	by smtp.qiye.163.com (Hmail) with ESMTP id 39c24cceb;
	Tue, 7 Apr 2026 14:30:07 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: dlan@kernel.org
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gaohan@iscas.ac.cn,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	rabenda.cn@gmail.com,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v5 3/3] riscv: dts: spacemit: Enable USB3.0/PCIe on OrangePi RV2
Date: Tue,  7 Apr 2026 14:30:02 +0800
Message-Id: <20260407063002.638012-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260403141637-GKA1042809@kernel.org>
References: <20260403141637-GKA1042809@kernel.org>
MIME-Version: 1.0
X-HM-Tid: 0a9d66a2552e03a2kunmd64b485566944b
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTEJJVk1IQ0lDGRhPTENIT1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VT0lZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0tVSktLVUtZBg
	++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_233020_878997_46EDEA96 
X-CRM114-Status: GOOD (  10.09  )
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

> I think Krzysztof will have objection on this, which isn't used by any
> device, so not really useful, see similar comment for "reg_dc_in" here

Currently, at least it's used for USB hub vdd-supply. Since there's
only this one, indicating a power source, I think it's acceptable.

> I'm not sure if there is any enforced rules on this? I can understand
> you are trying to sort them in alphabet order.. but I would personally
> prefer old way - in slightly logical order.. but I do have no strong
> preference..

There are no strict rules, but I think it would be better to keep
the same order as the regulators below within the same DT.

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
