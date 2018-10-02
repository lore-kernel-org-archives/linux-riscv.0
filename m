Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F47C004D2
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 09:00:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2518208AE
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 09:00:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tdHHqSHF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJCSu1Zs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2518208AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0Fwo3lVeQ+0jnfI55DN0tgATz7pbf+8itW6eL3Mxk4s=; b=tdHHqSHFEzgo3gPKYQpRiJ27tR
	yIhW0rmvCrRwDzMQpSZz9SLkG98uzmsT+7CAXlG0SVxl3HUUQ0ZbZJAVeMwcQZV2lx4uxahGmYYxc
	QdFvONRmevHEKwG6JGNZ05kr4Zp8DET/9MHHrjfFqQeL/mnYSQXO2jRuejjLvWyKq946DVlD5hV2v
	gWHG8SPvtuxKqjgNVvGMUHsSBYYAOIEmikPbTU+Op6tbkbhbG+fXXCyH85mTyfoPiAKLrXTz7y3e2
	gk2jaQ6QFOahKFIOSaSyOPNttJLSQdPu6WJ97v1OnpLT1TNx3ScmqMdPHYN2mVqOuKi/GCVamEMmY
	eq7xnbBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7GXN-0004Um-At; Tue, 02 Oct 2018 09:00:13 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7GWq-0003oH-4e
 for linux-riscv@lists.infradead.org; Tue, 02 Oct 2018 08:59:51 +0000
Received: by mail-pl1-x643.google.com with SMTP id q17-v6so654815plr.8
 for <linux-riscv@lists.infradead.org>; Tue, 02 Oct 2018 01:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KwSJ/ddsrLXBKVax3TPyV5fU4fUUHvzkXBSHRSHeQgk=;
 b=EJCSu1Zsm8bh3U8fH8akMthzApptr4z1KJm/EKR9LjzMRZnCi1BtebyWDVwcJZQQ5b
 vybpQsdhav/eZUsMtT9z0pmFUq2yqy57dsQDsRScts7ri9GsKMAp0BwaqSlOi+ZjZg5O
 rZBbe3SDgDlSYOZ5mKHA0B24TSlriTuOogMq6anq4lFKOOiQEcXQ8slRScv3AL0YZQpg
 1We17vaqDTx9XfM5ugeO5goWF8k/aG0vL5lLW/4OBWaMNdOaTkNNYuTjXbJ+5VujZTp7
 BO5H5/JDkC0JcqNOj22MVZYAbMkfXxoFUQIuOmEpz9Jd5ecZC+FfeFeEhVepcDH7oi13
 IowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KwSJ/ddsrLXBKVax3TPyV5fU4fUUHvzkXBSHRSHeQgk=;
 b=SilLGypDfZYHTqMYRW1iNaNzrUA2932aU5cupd8rsdsSyy2AUgHfrwKtVZG2U+qx5R
 xZ0DVTh9HaoKNrmz73ui3bq6rEdk/54I/TJHIQAsgBn/aNtZ56gaY4LFC4V4s+XX0igK
 ijhBjkcU0mcZzPCg5qXsLfLoAmJ7/+5H/bpMCtQ3JiSy8RIDAiUq8JQW+F1idDkkITSK
 tIqfWqNE2KQlqBnknUI0ZxLkw5xxn9ZzAWQeUITXpCaCmEtSFl9H2mm+OZQtxAuMKCK8
 yBsIFpvqxT5rR6RSlmPYCYy6vgLjrVolRKsaD2rQ+ZxSFQniGnKaaJErwWyBkrCQ66Ur
 KSwg==
X-Gm-Message-State: ABuFfoiHhTYvU28ZZbf/qxYKQ0myom8dfZ9zlWAN26S4aZWD+kfBo8mV
 O4zrouf8L+TtfSn6qOIMvyY=
X-Google-Smtp-Source: ACcGV62lO2XTJHH/+g7hZ+yDQKSgiVh0LlTkou/y/zod9fMSE5eHUeAEj1hnRCNskmErG9Stpww1uQ==
X-Received: by 2002:a63:6a86:: with SMTP id
 f128-v6mr13916830pgc.165.1538470769302; 
 Tue, 02 Oct 2018 01:59:29 -0700 (PDT)
Received: from app09.andestech.com (59-120-53-16.HINET-IP.hinet.net.
 [59.120.53.16])
 by smtp.gmail.com with ESMTPSA id 62-v6sm5057927pgc.58.2018.10.02.01.59.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Oct 2018 01:59:28 -0700 (PDT)
From: Zong Li <zongbox@gmail.com>
To: palmer@sifive.com,
	aou@eecs.berkeley.edu
Subject: [PATCH v3 4/5] RISC-V: Select GENERIC_LIB_UMODDI3 on RV32
Date: Tue,  2 Oct 2018 16:52:30 +0800
Message-Id:
 <3f1967e8be0c25910bf04181e84b46a788a156d7.1538470103.git.zongbox@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1538470103.git.zongbox@gmail.com>
References: <cover.1538470103.git.zongbox@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_015940_272340_07EA8F65 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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
Cc: hch@infradead.org, zong@andestech.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zong Li <zongbox@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181002085230.BLZOePyNooCsjsFFHmn5qcqdTqyGX7HN5acxM28crno@z>

On 32-bit, it need to use __umoddi3 by some drivers.

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a344980..dc262fa 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -108,6 +108,7 @@ config ARCH_RV32I
 	select GENERIC_LIB_ASHRDI3
 	select GENERIC_LIB_LSHRDI3
 	select GENERIC_LIB_UCMPDI2
+	select GENERIC_LIB_UMODDI3
 
 config ARCH_RV64I
 	bool "RV64I"
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
