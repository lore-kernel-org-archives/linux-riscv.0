Return-Path: <SRS0=ShlG=SM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B08C282DA
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 22:45:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD63C218AE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 22:45:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r4o8PN/d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="K1u04Vh6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD63C218AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FtTaPrWqCm65xKwdtIN28d6Lf0gPMsye0qfXT868l7I=; b=r4o8PN/deyj4aS
	/1mHZCWMhmVMwfdnXJA3bBrDzNoF7hOuwA7QQMszypxZv29maMxP1EJB6kjjRUVQF7LUS672cOg5L
	MyR/DmWFJA2RrFRkAQQa3tKSq0XhWyrFWDKwDgNIOgTzk7PVubQlE+I6lOL1/6rKRaaAcqHi6lMPV
	xqWWqQH7aYdM50aHhJzNBao3dEoMUUFJDfn/pMN4JfSdE9Oohj2ISEX952EdQMMSLrviBsgOT4a6G
	A/VAw/HtaBJP7NeNdGWxZ/N0lw6m5T6m0h8AALBNmGQQ/pI/xovR9f/yKuC3Y19F50eAbOrGO+iHU
	M2UvIouwlZBhiPGspZ7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hELy0-0003qC-VZ; Wed, 10 Apr 2019 22:45:16 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hELxx-0003nm-QQ
 for linux-riscv@lists.infradead.org; Wed, 10 Apr 2019 22:45:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1554936313; x=1586472313;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8a9nFQNbKFd3//6jhM9wfTOXLMw/hQ4czkeb+c+UtjE=;
 b=K1u04Vh6qR6oqD8CYrFlvV+FstrYBRWGqA3qahSfGwAZWDrZidqm9Y/R
 vWjDSj7JMA4fX4M7d/dJTn9uRrm/9hl23Ilm40MEee0Nv93qT01LLzIhk
 0gDn/3P/U5+TVLLsIBGUbOEtzJZD+p64KGKKwcHfYQzhp+T7q6nUg4gyY
 0OGkLzYiZmHowSi11P+i13Nc37aM9D3OsuAKbU4zFU4BY7r1dp3U63S4X
 PdQc7fu4OUI0QcTTM3ztegHRJhwH0lcFnsq5Wa5Zc2A+GPiAv+CVzR+n+
 sDIEu+SU0umdnKnJiimJaTBKVYLDBNVebtYL+88fmKaKUdeW9Wn2c36GX A==;
X-IronPort-AV: E=Sophos;i="5.60,335,1549900800"; d="scan'208";a="105470409"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Apr 2019 06:45:11 +0800
IronPort-SDR: n5/oWx2S71aj9kI1hE+PSK3/vvH1Jx6/JTRzH/xa19DYpYx7Ld6MJmy+4S3ZODXMCSFOMSOBPp
 wI/nAnwcnfHFJc06a7HYcEzntFWTLNV9UVDHmPZUuBUSLrDAqEr9b/s4qTdHJ49Elof0XIFqdM
 aJBkqTn+Mu8uQM4d2umdCZE7p3ySf43A+tvEXbMkCTuMa3Wyf7ms1Tf/9uG04LfYNdvyrFBYwn
 MAxzVBAArsIPIojac7LDw6wipvGA/0qJiqAQs4PhUoHTX49vRyIi6MNAqZqdOHLI7wS/umWhpZ
 suTWdwkpGUpxweGuC1ccqV9d
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 10 Apr 2019 15:24:13 -0700
IronPort-SDR: m/18FSUIFv2lEJf2eefSFGl4WdeRvmz0Q9jV/kflxUyi6lCOts3bODYymr211SYu9PuY7EnEkG
 gCRt+KpD4F/6+c1QJkLWDJPBGvbJvInvvERne/fbhORuResiADleeMy1dzR9KwhmIPCkoOxu5u
 L4NOkQOFioR4wF6INiDb2Pnp3rmwh0iLnAPuXUGXAMTX+Xk2+vYaxBx0C/aOPBtftQ4u0/m68j
 GVbxa7tSFTVgC5z+xh8gZ3b4MMPOPjqXoYhFoxYoayrqZAFpb3usg3vIJ6z36Y7/AFACbqV+a7
 xlw=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 10 Apr 2019 15:45:11 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [1/3] x86: Update DEBUG_TLBFLUSH options description.
Date: Wed, 10 Apr 2019 15:44:47 -0700
Message-Id: <20190410224449.10877-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190410224449.10877-1-atish.patra@wdc.com>
References: <20190410224449.10877-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_154513_902817_C982C515 
X-CRM114-Status: GOOD (  11.45  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Gary Guo <gary@garyguo.net>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

CONFIG_DEBUG_TLBFLUSH was added in 'commit 3df3212f9722 ("x86/tlb: add
tlb_flushall_shift knob into debugfs")' to support tlb_flushall_shift
knob. The knob was removed in 'commit e9f4e0a9fe27 ("x86/mm: Rip out
complicated, out-of-date, buggy TLB flushing")'.  However, the debug
option was never removed from Kconfig. It was reused in commit
'9824cf9753ec ("mm: vmstats: tlb flush counters")' but the commit text was
never updated accordingly.

Update the Kconfig option description as per its current usage.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/x86/Kconfig.debug | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/arch/x86/Kconfig.debug b/arch/x86/Kconfig.debug
index 15d0fbe27872..c1a48d4ffebb 100644
--- a/arch/x86/Kconfig.debug
+++ b/arch/x86/Kconfig.debug
@@ -125,21 +125,12 @@ config DOUBLEFAULT
 	  hair.
 
 config DEBUG_TLBFLUSH
-	bool "Set upper limit of TLB entries to flush one-by-one"
+	bool "Save tlb flush statstics to vmstat"
 	depends on DEBUG_KERNEL
 	---help---
 
-	X86-only for now.
-
-	This option allows the user to tune the amount of TLB entries the
-	kernel flushes one-by-one instead of doing a full TLB flush. In
-	certain situations, the former is cheaper. This is controlled by the
-	tlb_flushall_shift knob under /sys/kernel/debug/x86. If you set it
-	to -1, the code flushes the whole TLB unconditionally. Otherwise,
-	for positive values of it, the kernel will use single TLB entry
-	invalidating instructions according to the following formula:
-
-	flush_entries <= active_tlb_entries / 2^tlb_flushall_shift
+	Add tlbflush statstics to vmstat. It is really helpful understand tlbflush
+	performance and behavior. It should be enabled only for debugging purpose.
 
 	If in doubt, say "N".
 
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
