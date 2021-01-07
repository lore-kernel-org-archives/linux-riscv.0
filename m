Return-Path: <SRS0=n1sQ=GK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B82C433E6
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jan 2021 09:27:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 160AA2312E
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jan 2021 09:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 160AA2312E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C5ilXtoGegxUKE8Q1QD4EEhLMa+XcVQSz/HUbNmggMI=; b=RFBPNZ1Bf04Xh09B++yQTdHjh
	2Khp1C0pquqTaJf+yNXrUDyP2IijbBi/FmbhMrGhr50TT/7DCX0g6rgUb3O7XkQkXoHMH9RxIJXTV
	4+nOyZxcK4T2hyoSdfQmvg+uaXIMQeqhQU5Vo5GXYCIicjIQ1S7Mf24dFmw9yAlnIc4am4Pvr/j0Q
	dF0k7YYXv42FVq4BZFleEd4N0kn5MfXVCjbCipYxOlZwqntmb5QdBOxZyeEjKrBgnUOoctmgIBbW/
	kOpxaN0ljeHHsTg2pIWKbfMsh7bfLI+2SO6Kp4cYEodW2PsUt2rlFcTqPOP4HAw/adneXEF7PTqC+
	/F5P0d9CA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxRZy-0001BH-Ic; Thu, 07 Jan 2021 09:27:38 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxRZv-00018a-8g
 for linux-riscv@lists.infradead.org; Thu, 07 Jan 2021 09:27:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610011655; x=1641547655;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TSpch2pQwg7r6biat5mhz4gut7FJvx8Gohu4p1aa5sE=;
 b=c0+srD/T3n9HPO1AS/Wk6oh0Tu7C2dh6UYflItbKEo8YFywhOO4gdclu
 KiyqVkXpzDnut6/CnxI0v2F3tWzo+VR4CeSJp6RTfPq4EI1/O98xKGn4R
 tVHJbsCF3Pv+1/2M317LNLzd6v+mIJkEPlVzsIGCRFizDpkK3IDW1mPJP
 K873FJiTD/Ifsb0Zg/b5SgT3Iqf6qTIEKmjFGxedEhLp9p0Uf9yJFUnmz
 My3KHCJmMa34JgbAbZGRZeC8D1VBc6+Lzpf6LZi5Ekl8VdG3qmJbNoH1v
 BazgAS5e/3LQWxWtMlog6en0k5zTucp7ISdvCJNkPr69W82Shsgz//aI3 w==;
IronPort-SDR: x0u8gzMZxEU0+N5tYlpDMp8k1+jaaWlSDoXJUxHc2j502zxd77YXjQTmFq/Jog8bCqbp0Hdy5/
 g5C3fxNDnQptYncgfAOUDO4JDfoFpADDUwC4czbgPDILQvZ4K23U+MO2mBD6+/mz9to/0gOjUo
 TRdW/Mwjx4f6euNxIVy/ZExhXpPqO/NhYcc8aiCb0p5PnBhh0KbRU5PtfCOddNyI/HYIpWRjuy
 kzR2cCComjGLLf8/pEm5QJtMECFma5qDbdg5OYTT9+EgRA0S7IpFWE58brC/RimGD+m5In41Ea
 qsw=
X-IronPort-AV: E=Sophos;i="5.79,329,1602518400"; d="scan'208";a="156751193"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Jan 2021 17:27:30 +0800
IronPort-SDR: 2zB4v7ExUBhEO8BJtqamHePgctfOtR0fJrTcqB59xUDZwwyl0pd3P7QSvamo/K6/hKH+qLK3Fu
 KU0hOf09ilRXlwODdfsxRia1EJSwIqNgIKQAMU7dqzjMnq6ldgvO70aym7Y8MCF+c1ful4iFt4
 p6J1gcrSPYWKH/DBy2fOFBb6ejk6Zd+fzYRk13GuwZLOU+jWZV76E5xW8Wj1PQypgJLmBNDV34
 Rm8QpNHPFch2aNAypxBPViC5VWL4M5Qt0f+R7mNcsXJxlLNBu8vCGcsPDKyOhCRJuiZ/BCAlj/
 OLBdlO+Uj9p8IqIKO//4GPRi
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2021 01:12:21 -0800
IronPort-SDR: D/Knafnf+hm5DcoIAHYkKbWfhimscqE4QSGo3S2M2O+n3VUcQpS+4ojoLeHyP8B9OyAF/F4kbQ
 NqBGYWOhSBtmY5WGTSmIozXmNdRdpuGmp2fjHgGC/zxeHCs4eqjjcoRjj5fkgLmihhAvgSkixm
 70hyFaAOj7wxpn1V6vqucV4/KOiocJdfHFEftb5IPo8hyi5epUu5EtdHR1Hm01SklVW9pkC1VR
 IiNTlhmvWDfv0w/GxMhZ+edhT4S/ULvwrHdxmpcgnqWekAauPDEhOr92rxlovhEUM01bOhWSPF
 M4s=
WDCIronportException: Internal
Received: from usa002483.ad.shared (HELO jedi-01.hgst.com) ([10.86.62.136])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jan 2021 01:27:30 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] RISC-V: Fix L1_CACHE_BYTES for RV32
Date: Thu,  7 Jan 2021 01:26:51 -0800
Message-Id: <20210107092652.3438696-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107092652.3438696-1-atish.patra@wdc.com>
References: <20210107092652.3438696-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_042735_457329_9EEA39DA 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 linux-riscv@lists.infradead.org, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Andrew Morton <akpm@linux-foundation.org>,
 Ard Biesheuvel <ardb@kernel.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SMP_CACHE_BYTES/L1_CACHE_BYTES should be defined as 32 instead of
64 for RV32. Otherwise, there will be hole of 32 bytes with each memblock
allocation if it is requested to be aligned with SMP_CACHE_BYTES.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/cache.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/cache.h b/arch/riscv/include/asm/cache.h
index 9b58b104559e..c9c669ea2fe6 100644
--- a/arch/riscv/include/asm/cache.h
+++ b/arch/riscv/include/asm/cache.h
@@ -7,7 +7,11 @@
 #ifndef _ASM_RISCV_CACHE_H
 #define _ASM_RISCV_CACHE_H
 
+#ifdef CONFIG_64BIT
 #define L1_CACHE_SHIFT		6
+#else
+#define L1_CACHE_SHIFT		5
+#endif
 
 #define L1_CACHE_BYTES		(1 << L1_CACHE_SHIFT)
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
