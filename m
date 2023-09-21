Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A889BCD4941
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 02:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MW786tbB5F8pvuHexkTIRmCnx1i/fUUZWsifgEANAdA=; b=Q71ayH0MAx/ygi
	DxbBch4E/gMlPMdLR7uXP2LglyutGDMGAduOj4R42oxBghv2beLk/LmyCc4tqj9f1igL6TynyYoCh
	W065pS9KosdiC+6uce2hVj7jk0udF+TRCXDEFPpZdOQQraa4BM/gtd993ctlj+VKA2/JyvpMIy3l/
	LZ4lJeTPumUw2bj8IZOvVO6HyzLDMWB/TQrJa2AJRFcA9Esd6b01VU24U30GFFzbJFCjFLZCD+GZg
	DCgTg533dBrYdLg7/y82ye13pBFoRzQ+0ephzSYdxYH2qWOLxgEzr+9AnAxA1mRWPdHOqwNhdFscQ
	xTzC+nLV0jSrsLYBzihw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qj9mH-004pC5-2s;
	Thu, 21 Sep 2023 02:50:53 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qj9mD-004p9e-35
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 02:50:52 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 38L2oThK059250;
	Thu, 21 Sep 2023 10:50:29 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 21 Sep 2023
 10:50:27 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <david@redhat.com>, <akpm@linux-foundation.org>,
        <alexghiti@rivosinc.com>, <bjorn@rivosinc.com>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <conor.dooley@microchip.com>, Yu Chien Peter Lin <peterlin@andestech.com>
Subject: [PATCH v4 0/3] Improve PTDUMP and introduce new fields
Date: Thu, 21 Sep 2023 10:50:19 +0800
Message-ID: <20230921025022.3989723-1-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.173]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 38L2oThK059250
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_195050_431982_3B9B24BB 
X-CRM114-Status: UNSURE (   4.86  )
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

This patchset enhances PTDUMP by providing additional information
from pagetable entries.

The first patch fixes the RSW field, while the second and third
patches introduce the PBMT and NAPOT fields, respectively, for
RV64 systems.

Yu Chien Peter Lin (3):
  riscv: Improve PTDUMP to show RSW with non-zero value
  riscv: Introduce PBMT field to PTDUMP
  riscv: Introduce NAPOT field to PTDUMP

 arch/riscv/include/asm/pgtable-bits.h |  4 +-
 arch/riscv/mm/ptdump.c                | 53 +++++++++++++++++----------
 2 files changed, 36 insertions(+), 21 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
