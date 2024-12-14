Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8444AE7716A
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Dec 2024 14:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qQM5ayrGrU0E945pfaKpjK6v7EylOMZVIj/IxW73gdY=; b=b9q3nIMglu/KVw
	0ZOKMsBU1LodD4QHIxNtbPSCsPhiD0RRgPkiWUIMeloYhANxckA/lMOfucFCwXI0EH51Fz9hWnNdE
	6SKLAXR6M7dbYAFypETGX9BqpuTSarItIS3AuwllSFVAK439dJvJ9TgZKHseXE8/gEg2vdlJR7WMn
	/J2/1YLzJvk9RY1W6JyMFkUGltHoyDDEqiazC5wmFYL8VSjW0ij/2aBc8AHKJ/g5d/VVMPos7pT+o
	Tmrgl+NLf5ONtVc7jUSDfgLrxaJmiczpxFPcA0/MHoUaHPfENZYUgPQBrPgWbpoPJgddDa1OLb8Vo
	Z0+o4yDtq86TalK2KC3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMTAi-00000006TZb-29sw;
	Sat, 14 Dec 2024 14:31:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMTAf-00000006TZA-46zS
	for linux-riscv@lists.infradead.org;
	Sat, 14 Dec 2024 14:31:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 214D6A4046B;
	Sat, 14 Dec 2024 14:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45E75C4CED1;
	Sat, 14 Dec 2024 14:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734186664;
	bh=CzrZn5L9YhOeV72hzspAP9gbjArVBFbBjsIn4pkcg1I=;
	h=From:To:Cc:Subject:Date:From;
	b=bPVZbAN0NOxgjlPbF6Ixw4QRuh2sv7aJXCB667zU383IGBXj7o+1WI96jJJl+ZlUV
	 Ogpj1IXmspyPXmiCSm40rSSxvj3dyxBJF22l1st+knus7tItb7lDtopxoGCd3/1JA4
	 OdQTZUS9Gr1XoU3F0r9zkL1InHDKSSmVAPiOP/nFXH/DLhbauibRjq8Ax7g3kKulNa
	 Jc/isyTX7jesOIgtqVJTg8xcQr1FD3JRwWZV9e4syIUIETIR4RzX6+0akRoiVPiGAc
	 OLr/xU+eWc8SmKjMaAhhP6e8hIA+hU+Y9ZVzQoXHTQe+SDYnDWHTimaBADpKSE6iwn
	 2ipULs1Cb1StA==
From: guoren@kernel.org
To: guoren@kernel.org,
	conor@kernel.org,
	alexghiti@rivosinc.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	bjorn@rivosinc.com,
	leobras@redhat.com,
	corbet@lwn.net,
	peterlin@andestech.com,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 0/2] riscv: qspinlock: errata: Add ERRATA_THEAD_WRITE_ONCE fixup
Date: Sat, 14 Dec 2024 09:30:37 -0500
Message-Id: <20241214143039.4139398-1-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_063106_135390_8A534209 
X-CRM114-Status: UNSURE (   6.40  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The early version of T-Head C9xx cores has a store merge buffer
delay problem. The store merge buffer could improve the store queue
performance by merging multi-store requests, but when there are not
continued store requests, the prior single store request would be
waiting in the store queue for a long time. That would cause
significant problems for communication between multi-cores. This
problem was found on sg2042 & th1520 platforms with the qspinlock
lock torture test.

The orignal patch is from:
https://lore.kernel.org/linux-riscv/20231225125847.2778638-5-guoren@kernel.org/

Guo Ren (2):
  riscv: Move vendor errata definitions into vendorid_list.h
  riscv: qspinlock: errata: Add ERRATA_THEAD_WRITE_ONCE fixup

 arch/riscv/Kconfig.errata              | 19 +++++++++++++++
 arch/riscv/errata/thead/errata.c       | 20 ++++++++++++++++
 arch/riscv/include/asm/errata_list.h   | 17 -------------
 arch/riscv/include/asm/rwonce.h        | 33 ++++++++++++++++++++++++++
 arch/riscv/include/asm/vendorid_list.h | 18 ++++++++++++++
 include/asm-generic/rwonce.h           |  2 ++
 6 files changed, 92 insertions(+), 17 deletions(-)
 create mode 100644 arch/riscv/include/asm/rwonce.h

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
