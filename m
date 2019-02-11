Return-Path: <SRS0=4uv/=QS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27059C169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 04:39:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E73D720855
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 04:39:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="THGqZNyn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mac.com header.i=@mac.com header.b="DE49Slbi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E73D720855
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mac.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=REnCVM56QsesmO/cVHMZfWcJ+qZC1w9MqXGRcLuhhTg=; b=THGqZNyn3vPau+9UQ9wbZkLolT
	SI7XJW4tr+eDaneyx1M2rf7apiAgTzcE4Mm7QUDpe9XyZvu6I3hla24lV1lqRNnRKpFnFbkDNBQF7
	XOTMZEx5XJPxiJB7C0BUKJ6uwlBa9cRV/rNzyu0ws/AvFdyaStclQaAAEuT0Eczk5/h93+i2PefEj
	/5J5CuXRJmHjlf2mWjHyGbi8HMck9ZEbPB4q2/B1t3nz1oMfNkV+gBBjnWvn12+NL/a+brAbcAKCD
	JuPzpogRNs2S5wqOuEkjBr9DF6uJfXjxRnRV8ogKNyH20YfqaPJv5jJK9TLkW9UF2UH2zyDVPJ7l/
	bWiZs2xQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gt3Mw-00017u-U5; Mon, 11 Feb 2019 04:38:58 +0000
Received: from mr85p00im-hyfv06011401.me.com ([17.58.23.191])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gt3Mr-000158-1K
 for linux-riscv@lists.infradead.org; Mon, 11 Feb 2019 04:38:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mac.com; s=04042017;
 t=1549859932; bh=+GfG/2ZTaqb3i3G5mGu9hk9AfkhWQhWk+RwfIqjCtJY=;
 h=From:To:Subject:Date:Message-Id;
 b=DE49SlbipQkiuPseHqsRxEbeP260FPRdI+Yh5Ty0x0VQNfAJPJUrHeWjaiJ77i8uj
 uELYYT/IN35KN7ICC5J472BDzKQSfZVOoer9s2SJnZWM8QvBWad1pkl/M3AGXAhaCp
 N8mBQ3t+feG+5sR4ub8/3bluI+UqEsRspsk+5bsPgmS3HKd3KNXIwdZjH5XDaUdS/W
 A88bo0rrYOopxrpO67pluwIAHCp6HJFlPPeLCeobDTO7+S1/g9k9ukCG7EsfRRbIOq
 Lpe5ntK01eWORWe38w9SKpfYwUQf+2P9Sy937VoK6S8NJBzmzpcTkOventQIPtkmfP
 qAohLTrj+6Ygg==
Received: from localhost.localdomain (125-237-34-254-fibre.sparkbb.co.nz
 [125.237.34.254])
 by mr85p00im-hyfv06011401.me.com (Postfix) with ESMTPSA id 7C6BAD20110;
 Mon, 11 Feb 2019 04:38:51 +0000 (UTC)
From: Michael Clark <michaeljclark@mac.com>
To: Linux RISC-V <linux-riscv@lists.infradead.org>
Subject: [PATCH 3/3] MIPS: fix truncation in __cmpxchg_small for short values
Date: Mon, 11 Feb 2019 17:38:29 +1300
Message-Id: <20190211043829.30096-4-michaeljclark@mac.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190211043829.30096-1-michaeljclark@mac.com>
References: <20190211043829.30096-1-michaeljclark@mac.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-11_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1812120000 definitions=main-1902110035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190210_203853_080609_FA0C836D 
X-CRM114-Status: GOOD (  11.68  )
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
Cc: RISC-V Patches <patches@groups.riscv.org>,
 Linux MIPS <linux-mips@linux-mips.org>, Michael Clark <michaeljclark@mac.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

__cmpxchg_small erroneously uses u8 for load comparison which can
be either char or short. This patch changes the local varialble to
u32 which is sufficiently sized, as the loaded value is already
masked and shifted appropriately. Using an integer size avoids
any unnecessary canonicalization from use of non native widths.

This patch is part of a series that adapts the MIPS small word
atomics code for xchg and cmpxchg on short and char to RISC-V.

Cc: RISC-V Patches <patches@groups.riscv.org>
Cc: Linux RISC-V <linux-riscv@lists.infradead.org>
Cc: Linux MIPS <linux-mips@linux-mips.org>
Signed-off-by: Michael Clark <michaeljclark@mac.com>
---
 arch/mips/kernel/cmpxchg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/cmpxchg.c b/arch/mips/kernel/cmpxchg.c
index 0b9535bc2c53..1169958fd748 100644
--- a/arch/mips/kernel/cmpxchg.c
+++ b/arch/mips/kernel/cmpxchg.c
@@ -57,7 +57,7 @@ unsigned long __cmpxchg_small(volatile void *ptr, unsigned long old,
 	u32 mask, old32, new32, load32;
 	volatile u32 *ptr32;
 	unsigned int shift;
-	u8 load;
+	u32 load;
 
 	/* Check that ptr is naturally aligned */
 	WARN_ON((unsigned long)ptr & (size - 1));
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
