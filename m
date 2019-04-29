Return-Path: <SRS0=9XXM=S7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20FC9C43219
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2019 21:28:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAE8F21655
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2019 21:28:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O7sIFwDM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="HWim/fpw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAE8F21655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IdIvlFzP+0IyvriZ0etoOJo7l2zL9apqb0hD4uGSj8U=; b=O7sIFwDMncmnpQ
	x0UrwH0fgJ5N1CMMaPMNPJyxSWi/W9pf0kcDFxs4n0Tqu1lZvs8DMUJnvObEAgpUIjGCm8UALJm9o
	+OSa8zubWUmb3mISsbTrtXDrBD3qwkWJWWUpPxA7QOvvcheVW4s+3mmY+No68nmnBD8LcAF1z/MfT
	ykssk5AuvXoaTxult7/2VEXmflnP+m/CZBnh8pIUXfwIyGFfYG6rtgW5picIhSmJ6cv5Q2Hd8vMzu
	W3xhVVp7rl6eXd8zdNtjQElxm0AsU3SMJf1dLFZTnxBB2oZpanIyaYjRCLBP8vRcjx39Op8M+/ghQ
	czkD2IIpjH/Jb2QuDQug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLDoi-0000zp-J3; Mon, 29 Apr 2019 21:28:04 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLDoe-0000vl-7T
 for linux-riscv@lists.infradead.org; Mon, 29 Apr 2019 21:28:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1556573281; x=1588109281;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=674EX0iIftC/tP47ciQ2WAq8p0Blf4MJzfJ6YEpD/54=;
 b=HWim/fpwPOGc+1ST17YEFh1tVmIL7DzyAQSgahlE93TUq8vq9kaSVQUR
 QVNlrnYn5Rm67YuXQ6+4D2yN1e9N33cH7Slr72kw+0cIK4ccLjo9qIatf
 HUAZtqCeaibfaNbWNVT44Zz+fcsxNKMr7NHWw68f9RXDSqZojoB0wU+3O
 oYj9OJjbDH1Cii6IqXtDNqyQUv0RrJuvdasRhS3B4JMt8UOCGZRG4jW4v
 fUBOMyEecOvOPyo/IKsuazbHa2q7eZBNjVPcnH3zBJt/JvA6HhMjGJOb8
 N+LrSC+Qly3tylOrVP4+IICBQJztPRz8NbMKvVqq+9AugM+0tJM2eqAVQ g==;
X-IronPort-AV: E=Sophos;i="5.60,411,1549900800"; d="scan'208";a="107107928"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Apr 2019 05:27:57 +0800
IronPort-SDR: fnQimbEdZc7VQSOrt/4tlHC9AxRapd49DqsjL4YEryFGop5Va/kkBf26SQNFsjCkI/ZuwaPzEr
 fe6NW8aB8hb9ieXG105gL4bNZTOhDDGfF5xkS9COdcofXuBccPb6GPQ+HIf6HeE2elggIu9SAm
 fTmbWTV2wC8y7VQV7zYfY/+DUH3x/Bj+d6w0PpvjxS2sb/T9MVRTiuZOiFaeBcD/2V05PT51P8
 AozPkUIFGCEEHGBb0Wud/Mc19Khej/Az1WRF+dZoTHRow5fexXkYYPbnDETmtcCQN75C1BGxNe
 2n8k1ilMM/DyPHorMDMHGKeT
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 29 Apr 2019 14:06:27 -0700
IronPort-SDR: YKuQOaUGXWtvH6yMxnbX+5T8aKt+xMu1UOys2MqMN9CNGPcNGH4YnoS70RHEai/+/Dum58K/mC
 XFPRVsEpiOt3g5p92g5To6ydWIgV9ypo/MTkjzd06pojtdh+/P/oQUeywSO6jT8onKm5pitIXw
 aaM1FvzE3F8rjP1lzuGf9XKPsK0Q6nceqmHgrOGZaUT7EtHOCWqLPwyq+uZipCVjFTbwv1zRtJ
 cQeDkzSR2TxSz7tEs88qTe1xk1rgl6YPggLJ9AGDzG5yhhpSIJRqxGR/ImMmzo3mU1rODfO2sq
 RXU=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 29 Apr 2019 14:27:56 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] RISC-V: Enable TLBFLUSH counters for debug kernel.
Date: Mon, 29 Apr 2019 14:27:49 -0700
Message-Id: <20190429212750.26165-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190429212750.26165-1-atish.patra@wdc.com>
References: <20190429212750.26165-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_142800_318074_788AFEFC 
X-CRM114-Status: GOOD (  10.73  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Christoph Hellwig <hch@infradead.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Kees Cook <keescook@chromium.org>,
 Changbin Du <changbin.du@intel.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 linux-mm@kvack.org, Atish Patra <atish.patra@wdc.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Vlastimil Babka <vbabka@suse.cz>, Gary Guo <gary@garyguo.net>,
 "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-riscv@lists.infradead.org,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The TLB flush counters under vmstat seems to be very helpful while
debugging TLB flush performance in RISC-V.

Add the Kconfig option only for debug kernels.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index eb56c82d8aa1..c1ee876d1e7f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -49,6 +49,7 @@ config RISCV
 	select GENERIC_IRQ_MULTI_HANDLER
 	select ARCH_HAS_PTE_SPECIAL
 	select HAVE_EBPF_JIT if 64BIT
+	select HAVE_ARCH_DEBUG_TLBFLUSH if DEBUG_KERNEL
 
 config MMU
 	def_bool y
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
