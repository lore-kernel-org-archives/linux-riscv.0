Return-Path: <SRS0=uKmQ=JE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D660EC433ED
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 11:57:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70D3E61353
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 11:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70D3E61353
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ourSoyFblUAVVE0JzyfiX5LRLTxDKIYEnSJuUJdDtRQ=; b=TAFA0Q4MAOf0IROehrEPErPUMt
	yvcScSb0rcW6UkHRIFLJMg6aicSZjw5DF2grFiPwtPucnPXt4uy7P600Nxj88x0GpRLfoy9ZmOzOw
	ANe3Tx8W1QJ7g1shZPVHcoRkf35PCQCU8qiBuHVCFyoKe+3flQOazgXoDjTjXOmsM0N24u6rgoxPl
	iyucqYH5NX8v1vRfcKU2UsZB/LUpT2qI1924IOLOuq+sxMbfScQZu4rS0OJ77KdEbuQe9cXTSr46J
	ri8mHdrs3iI5RMIFShyU4RuRuZob+6D539u2C6xW+0A3ajmK7XzFHxI6mlhpAiU4cIM0XslwaPbtM
	mKvTv73A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU6o7-004vXg-Ul; Wed, 07 Apr 2021 11:57:16 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU6nw-004vVn-2E
 for linux-riscv@lists.infradead.org; Wed, 07 Apr 2021 11:57:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617796624; x=1649332624;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dCTK3fR91t7mZQuO1o3kMUaNqRvYQqW87j36v/abmuk=;
 b=jRTQHeefGkauStxfcYXSvjFIhnw1oHX3mWdB39fygXTH4wl3wyDQQOuK
 QyNi50CAJ5egRlztRJFoppFsOieVjldBkNW98l+Jqxotj7tt9uvc+HmHs
 P73j2s4LjaODdzl/tsw50MQ/srIRR263o32Rl5KzJqvczZjNYbRMybr06
 GjrVeLCdLQoTjJ+8uK96ExSC8nHLKTCefpNYKtM3PEaKPaHnRN0A1rx76
 m5Esqmfi8tOqmyuy0IBGe86YIP8//vdIZCF+6Bnjvjb6OxA8mb5xBfn24
 CVRcSvZCXO6lqVrKK+OFiEqOheWihQibdr7jCUajHnPhI4jRI1iqdbdnf g==;
IronPort-SDR: AN5lp9PM4EP0JkGiqi3H0F/S2/7mk0nXyvwRFCePgnm3p51H+HoeeJD4NMstaXZmPm4VYEb271
 hLZvWU3gmmpNqA6trKjhBVN6yxUMyyFhRSYPWq4put9s3tUgpxed+mYXOhNEyLVc4xBdXYZFqQ
 /LVHKRK6tSeKC+nB6mj0Gmx+atIaqN7EqqXiMc4n6y+WQijG5c9o9vKaM33xNiBc7olwolB8xV
 ttibr/oPLKKaTfGvTsd7skI61ejPvKv47X5A+qdWJPVBO1z6WDq+iehysnAvGKIPFJcneYMaK9
 ulg=
X-IronPort-AV: E=Sophos;i="5.82,203,1613404800"; d="scan'208";a="164061566"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Apr 2021 19:56:44 +0800
IronPort-SDR: NSHZ4gVATsNwW+gsQnboSbbta8wtdBILw921UdjKCWDv4+BRzRlFL+IJPJTJhayUHuWXTGUKQh
 EEsiJhuhwyr+7xogo+PVj1xbkxS4WvX1eT8DvGyhm2Tu30TYHatqy4XowLxMJyKlE+Yj+yKXAf
 T8UAWs9MDEftyJOtSZxbUu22EGalK8eHN3LwcdezHmvgz3+KGApZCfc/7UyoUpZDQau7kcOdJ0
 sANz2kuf6oixT3monKZQe90rTNqzfNnlan6SI0NnxuP6R4IVNfwVaalQoVzj3V6C4EamBpL+uK
 o3AtUD/9JxzvLWzhLx2yUq6u
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 04:38:04 -0700
IronPort-SDR: i4B1dXMGzh/3H8+rlLNqKe77kYfE4Zz4GCAE2pznh4ujxO7GE4dOPtJq19zwjoxe8+SGnHJOUu
 PmYud0lCziiWOfawOLgkaYPj/1FCVMMzI/JbVHg9PxM1tMa9FrdZtEpgeBXHmT3gejMEy/80Xc
 SzqxyhKT5cuzHEDFl3Ni7cvo72RVNHmHfnWCxl3IQr3iZ1PI/rrxOyS14xiEc+cZCLDU7GeRLL
 rxSCkFVRIXjHacYRk1P4OjzCwmjLRLdfQgDkIlBNSt3w8ONXAH1utGErDw83/QVg8OEDqLoYwH
 KCQ=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.90])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Apr 2021 04:56:43 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org
Cc: Max Filippov <jcmvbkbc@gmail.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Anup Patel <anup.patel@wdc.com>, Christoph Hellwig <hch@lst.de>
Subject: [PATCH 0/2] Fix binfmt_flat loader for RISC-V
Date: Wed,  7 Apr 2021 20:56:36 +0900
Message-Id: <20210407115638.1055824-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_125709_120556_86BFD797 
X-CRM114-Status: GOOD (  11.37  )
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

RISC-V NOMMU flat binaries cannot tolerate a gap between the text and
data section as the toolchain fully resolve at compile time the PC
relative global pointer (__global_pointer$ value loaded in gp register).
Without a relocation entry provided, the flat bin loader cannot fix the
value if a gap is introduced and executables fail to run.

This series fixes this problem by allowing an architecture to request
the flat loader to suppress the gap between the text and data sections.
The first patch fixes binfmt_flat flat_load_file(). The second patch
adds the asm/flat.h file to riscv arch to request the gap suppression
using the newly introduced macro FLAT_TEXT_DATA_NO_GAP.

These patches do not change the binfmt_flat loader behavior for other
architectures.

Damien Le Moal (2):
  binfmt_flat: allow not offsetting data start
  riscv: introduce asm/flat.h

 arch/riscv/include/asm/Kbuild |  1 -
 arch/riscv/include/asm/flat.h | 29 +++++++++++++++++++++++++++++
 fs/binfmt_flat.c              | 25 +++++++++++++++++++------
 3 files changed, 48 insertions(+), 7 deletions(-)
 create mode 100644 arch/riscv/include/asm/flat.h

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
