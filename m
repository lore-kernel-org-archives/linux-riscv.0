Return-Path: <SRS0=oaCf=JC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F806C43462
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Apr 2021 08:58:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 013C861245
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Apr 2021 08:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 013C861245
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tj+F4Bjs3RLC2QLayAWUnvWI3BaNQBVCiv76Q8K27hU=; b=Fks7+uH36Rv0HdYRgoL3W8N/m
	HVcQQ6jXqoQn4zMSzMtaWGJCibqs1p/Ai5EWHRCDHnldqJl/xz242c8gdAqHa6o36p4PElgvI2ejK
	8gxY6kUv2Vv+QMgRz4A6LFxTaKKlaH0IEOcyciFsezoNcBZRmXoq745VAEO17so9E3RcyTqflupxD
	wnPwNLrlYZ4kNZbk6XwFX7OiSl/W4rR0y31+vreMsgHh76K+jxdF4u2pB6r3hgIQetdaNiSqmSsA2
	iJeTcga7xlhSSYnHuVZrg9EUPKh19FMPozg679eV9K2QPS2qQbS+NnTaPPNfWwDeOom7ygDqIAyXn
	mSDd9GSSA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTL3R-00H0Jw-4t; Mon, 05 Apr 2021 08:57:53 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTL3B-00H0EG-6f
 for linux-riscv@lists.infradead.org; Mon, 05 Apr 2021 08:57:42 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 1358vWSG079894
 for <linux-riscv@lists.infradead.org>; Mon, 5 Apr 2021 11:57:32 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1617613047; x=1620205047;
 h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mIPpwtuqwCFbpjCfBOR3TLBkCrvCUYLFEkh8taAhOfc=;
 b=pwwaSblYBhSSJSM7pAEj6oqeUc+/LE/kltnkrlydWZUSTmzm0l992cgtYjeUWPEX
 Lw04Vpaj5gumdjg/r4CJBK9iapw+bIOsJxulMn+xPRrC9E6Rzzw3+WBIAtlBxiEN
 ATEQH0lYhrn0KzuBJxsgmuoFBu6Vx5PNHlmoeLY+CHh0Tl4We40901L7vkPOeHVB
 G7HRFSQm6qBYOa7g4qCkY2hnIIoVlkzg907ZTXE4DpPUXsuMtD3POHYnyEL/K0aT
 atqCL3aa6/fb/SBPGluvRDhRkX6B4yoBEpkZkxWmcG+VsJkK2hM/KPJDX03LbO0+
 qJ+BZYBLZY1/1V73ZvnxWg==;
X-AuditID: 8b5b014d-a4c337000000209f-d8-606ad0f7e44b
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 87.77.08351.7F0DA606; Mon,  5 Apr 2021 11:57:27 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user: mick@ics.forth.gr at ics.forth.gr
From: Nick Kossifidis <mick@ics.forth.gr>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com
Cc: paul.walmsley@sifive.com, linux-kernel@vger.kernel.org,
 Nick Kossifidis <mick@ics.forth.gr>
Subject: [PATCH v3 1/5] RISC-V: Add EM_RISCV to kexec UAPI header
Date: Mon,  5 Apr 2021 11:57:08 +0300
Message-Id: <20210405085712.1953848-2-mick@ics.forth.gr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210405085712.1953848-1-mick@ics.forth.gr>
References: <20210405085712.1953848-1-mick@ics.forth.gr>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJLMWRmVeSWpSXmKPExsXSHT1dWff7hawEg1l3pCwu75rDZrHtcwub
 RfO7c+wWLy/3MFu0zeJ3YPV48/Ili8fDTZeYPDYvqfe41Hyd3ePzJrkA1igum5TUnMyy1CJ9
 uwSujJnt5xgLHrJVLPrTztbAeJ61i5GTQ0LARGJJ4yT2LkYuDiGBo4wSf7eAOCAJN4nb93eC
 FbEJaErMv3SQBcQWETCXaJ75mhHEZhbIkDi67xdYvbCAo0R3wzwmEJtFQFXiRetxsHpeAQuJ
 358XQS2Tl2hfvp0NxOYUsJTYdn4RWL0QUM31Yz2MEPWCEidnPmGBmC8v0bx1NvMERr5ZSFKz
 kKQWMDKtYhRILDPWy0wu1kvLLyrJ0Esv2sQIDj1G3x2Mtze/1TvEyMTBeIhRgoNZSYT3YUNW
 ghBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFeXr0J8UIC6YklqdmpqQWpRTBZJg5OqQam7VeuK5dt
 vSrOeO7NxCVM3H6HnAIrF0ioG17u6n9x+5v20xl/22Z6vLdhbJHe5Phx6dqVh9Qj8wp/OTgk
 5lldMYzj+CUpvda10PXFERunXF4ld89Pqh/ZYg/USIXsFFTxONz4IviLgdx+Hf32jZvs6g3N
 vk7JD3s6aW3IwiXHZ8j/v/kw1ZtF7DHjvbvucxLC1Crk79maRUrNeK+0eIOo0aUIJb3Eyhv6
 n5jYjif4pq7bz6d+Kn+LJ8+NzrM9iWIiD4JKf7E28q+LvdH6/g+n5SLrpKK51y9/Lyk6zDkr
 vmqicXJC8/c3B3dMfjzF9bfe9ls3newbU189rzmaqPbe113367NtkZVSu+t8/99RYinOSDTU
 Yi4qTgQAgxNljqwCAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_095737_630374_3EE17AA1 
X-CRM114-Status: UNSURE (   8.00  )
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

Add RISC-V to the list of supported kexec architecturs, we need to
add the definition early-on so that later patches can use it.

EM_RISCV is 243 as per ELF psABI specification here:
https://github.com/riscv/riscv-elf-psabi-doc/blob/master/riscv-elf.md

Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
---
 include/uapi/linux/kexec.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/kexec.h b/include/uapi/linux/kexec.h
index 05669c87a..778dc191c 100644
--- a/include/uapi/linux/kexec.h
+++ b/include/uapi/linux/kexec.h
@@ -42,6 +42,7 @@
 #define KEXEC_ARCH_MIPS_LE (10 << 16)
 #define KEXEC_ARCH_MIPS    ( 8 << 16)
 #define KEXEC_ARCH_AARCH64 (183 << 16)
+#define KEXEC_ARCH_RISCV   (243 << 16)
 
 /* The artificial cap on the number of segments passed to kexec_load. */
 #define KEXEC_SEGMENT_MAX 16
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
