Return-Path: <SRS0=hJrJ=GY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 745C4C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jan 2021 01:56:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07D2F23787
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jan 2021 01:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07D2F23787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=163.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Af8Ap3ZxFB/VoY6HKJc21mYMz6OCYJ6nRDeAj+W30bU=; b=DOX2x8eMVEVItG5NnKsApRWklZ
	vzZzt6fY2BCrsQjPe3FkVAF1FTxHhNofcoePJZsv+F9qkc7BPeVpXikd9RhP2MF5dSbd4f93w73yw
	v7tjUkS4i8n7QiYCBo7QFiJnpPKk4dAX7vbnkF47MaoRnlsUNdneWFFdzxKBpSgTsZVwYMSyLpNHx
	hJvKJ6mwnJonHL84TiOvK6Ad4T0r+MuM761Ns/v7TWatylZhnOHoMpFzsav7SvEeL6zcq5t3ocERv
	aoqJYixTW5YFN7VfOeUI9+t4DxA4kPQjZ2WAORpXm0+JNMNkNV7vBFfyKLvu1H3C3w7EtyYa9nN0/
	1kIVc3XQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2PCM-0006PN-4h; Thu, 21 Jan 2021 01:55:46 +0000
Received: from mail-m972.mail.163.com ([123.126.97.2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2PCH-0006O7-Av
 for linux-riscv@lists.infradead.org; Thu, 21 Jan 2021 01:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=0SG1m
 BGTBN7J7iDBsfJomUMUwZVAJjt/AMZicpcW+DM=; b=JqTv2ln6m/oRKelN3O85k
 lqbKCaFuLGJNO1pwYP8mpwDracg3tcMqfk1a5R/OIBPfKy7GWiz9UzSp1vMA77Xl
 UNBP8BrR4thL2UGZzAYQuo3CdcaAtVT2JnHeHwt6wCESds62403NhTBDzbMmyVzx
 IKRqGRsuuSpgTBf3bwfXbM=
Received: from COOL-20200911ZP.ccdomain.com (unknown [218.94.48.178])
 by smtp2 (Coremail) with SMTP id GtxpCgCH29D53ghgtFIlJw--.8411S2;
 Thu, 21 Jan 2021 09:55:12 +0800 (CST)
From: ChunyouTang <tangchunyou@163.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 ardb@kernel.org, anup@brainfault.org, atish.patra@wdc.com
Subject: [PATCH] arch/riscv:fix typo in a comment in
 arch/riscv/kernel/image-vars.h
Date: Thu, 21 Jan 2021 09:55:13 +0800
Message-Id: <20210121015513.2258-1-tangchunyou@163.com>
X-Mailer: git-send-email 2.30.0.windows.1
MIME-Version: 1.0
X-CM-TRANSID: GtxpCgCH29D53ghgtFIlJw--.8411S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw4DKw45Jr4rZry5CFyDKFg_yoW3tFcEgw
 n7G3s7WrWfArZ2vryUJ3yS9rnYy348GFyF9r1UZrW8CrykWw4Dt39IqF15Crn8GrnYqFZ3
 Ar9xGrs8ArW7KjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8Wq2tUUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5wdqwu5kxq50rx6rljoofrz/1tbipQAhUVUMb9PClAAAsm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_205543_284439_B585C1A2 
X-CRM114-Status: UNSURE (   8.79  )
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
Cc: tangchunyou@yulong.com, linux-riscv@lists.infradead.org,
 zhangwen@yulong.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: tangchunyou <tangchunyou@yulong.com>

"kerne" -> "kernel"

Signed-off-by: WenZhang <zhangwen@yulong.com>
---
 arch/riscv/kernel/image-vars.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
index 8c212ef..71a76a6 100644
--- a/arch/riscv/kernel/image-vars.h
+++ b/arch/riscv/kernel/image-vars.h
@@ -3,7 +3,7 @@
  * Copyright (C) 2020 Western Digital Corporation or its affiliates.
  * Linker script variables to be set after section resolution, as
  * ld.lld does not like variables assigned before SECTIONS is processed.
- * Based on arch/arm64/kerne/image-vars.h
+ * Based on arch/arm64/kernel/image-vars.h
  */
 #ifndef __RISCV_KERNEL_IMAGE_VARS_H
 #define __RISCV_KERNEL_IMAGE_VARS_H
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
