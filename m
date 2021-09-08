Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47DDBC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:49:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A74D6115B
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A74D6115B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k5G2RASo1mSYkQ65wQsMbKjTT/Rs8XeyO6Kpch4EcW0=; b=1mlx8rr3RKW9wi
	chu3/BHJ3+9GUeASTNvN/cWHlycnMJZDYuqXBKcwunobeI4LQx0gufBh0cI4jFnVKpaQcO0hWRbqZ
	9Wq9cMDZcqdJGTxophvmflLldCo7Hh3hZ6tvcxnFREOaV3vvFJGufZnEOPVE0iMAOL7WCi8ILCZH0
	rxT7LyvAAVpauH+eI7tRFU+0axXtodpzihsNIIfxPndb8m3eScvtTZqXYpdxlP3xfW7mbRgcqz1CR
	PtQHhzchpiYBLyyexRhOLRjfFWOz/FzY1C9DiAMV4ZauS4OiDZCRQL/+eLR+qifjOFicdffqJGv8V
	gJkC78vYLujMT3aOKl7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO1f7-007JTQ-83; Wed, 08 Sep 2021 17:47:05 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO1eB-007Iha-Sl
 for linux-riscv@lists.infradead.org; Wed, 08 Sep 2021 17:46:09 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so1862751pjc.3
 for <linux-riscv@lists.infradead.org>; Wed, 08 Sep 2021 10:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lvYFnpE+vcL+5OVNgIPvCGE7jHqR7WMR9PRIiy6pwGg=;
 b=dfZBRHf2wrBry4B+KYNGRzOMYSdhwtCugDbMgPPWb+TUptqwNpbB9cDoPmb3Bj/rfz
 reRAK7l9gceD5ghZEnr/xwHqGN+iD7PxQHiGdvkTP/HG2TkMChvO89QCo3eBxaYG3p09
 lLM4KtdDUVIXSvLV1IAyZclec0IG5enKGS3U0RLCT2TzCAaPbSztpqSzrA8l3Xj8BAS0
 gDOcNuHjACo8RfFHoRi8Kvp8Nb/VZqpyG+hDAkCFNHhfdXOgSuD8FfcyPiKN0twBfA/1
 q00wQyzYAeYsGE3mUOBcLvNBVVGXJFR1iBXBG/O1cjkOWVYLSkOXnmTO0yk5r7sGWfKn
 LukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lvYFnpE+vcL+5OVNgIPvCGE7jHqR7WMR9PRIiy6pwGg=;
 b=QqaE6SY+JvtAJf3/17s+FnLL2VHlc1F5dqmfv0K+M+lpNDIjMZGsWWirrtGLat2yve
 Udak3HZaWsSHtgukCyhQnzRLcjy7pe43KZpXRpIO6/n4vFJkjBU60cOplf80slvXsENk
 j2rZfkked1sX2rJx0tgNOOtjBU1mC1hv62cgEIGNUybgM0hYIQOeZTt5MKfVMYF4KFS+
 mFeC3M2tB8SjDH3cjyCz2Lz5Wxr+gWueGkqLYM+O7LeUlqxJaurv1skaMgua2RFDWtss
 a0BX8/JGvRkfxGsPic0C3bpYrlLwjZCeNfsC3rD8Iwvwf7djJZAfoCMmixH9l4sDXvmR
 4Vrw==
X-Gm-Message-State: AOAM5302GuOLQqywg4wLQ+tmponjXok6PuEe9DAnB03cOOHvEb6wqHDI
 IdRBHwgMtyskzz9Vwkd1TfmkzW1FETt9Ow==
X-Google-Smtp-Source: ABdhPJz7hteQN4ueoz3qvrw7mKi05UEduUmNHaIaV59kjVT3OB9jzRiMBIRJAcu2dSi3Mr41QhgeEg==
X-Received: by 2002:a17:902:bf43:b0:13a:ae0:9dee with SMTP id
 u3-20020a170902bf4300b0013a0ae09deemr4063860pls.62.1631123167173; 
 Wed, 08 Sep 2021 10:46:07 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id b5sm3108466pfr.26.2021.09.08.10.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 10:46:06 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
 vincent.chen@sifive.com
Subject: [RFC PATCH v8 20/21] riscv: Optimize task switch codes of vector
Date: Thu,  9 Sep 2021 01:45:32 +0800
Message-Id: <3b2d4ff556d310ed73a6910b89566a195fc28861.1631121222.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631121222.git.greentime.hu@sifive.com>
References: <cover.1631121222.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_104607_986492_6722BDEE 
X-CRM114-Status: UNSURE (   8.11  )
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

This patch replacees 2 instructions with 1 instruction to do the same thing
. rs1=x0 with rd != x0 is a special form of the instruction that sets vl to
MAXVL.

Suggested-by: Andrew Waterman <andrew@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/kernel/vector.S | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/vector.S b/arch/riscv/kernel/vector.S
index 4f0c5a166e4e..f7223c81b11a 100644
--- a/arch/riscv/kernel/vector.S
+++ b/arch/riscv/kernel/vector.S
@@ -27,8 +27,7 @@
 #define x_vl     t2
 #define x_vcsr   t3
 #define incr     t4
-#define m_one    t5
-#define status   t6
+#define status   t5
 
 ENTRY(__vstate_save)
 	li      status, SR_VS
@@ -38,8 +37,7 @@ ENTRY(__vstate_save)
 	csrr    x_vtype, CSR_VTYPE
 	csrr    x_vl, CSR_VL
 	csrr    x_vcsr, CSR_VCSR
-	li      m_one, -1
-	vsetvli incr, m_one, e8, m8
+	vsetvli incr, x0, e8, m8
 	vse8.v   v0, (datap)
 	add     datap, datap, incr
 	vse8.v   v8, (datap)
@@ -61,8 +59,7 @@ ENTRY(__vstate_restore)
 	li      status, SR_VS
 	csrs    CSR_STATUS, status
 
-	li      m_one, -1
-	vsetvli incr, m_one, e8, m8
+	vsetvli incr, x0, e8, m8
 	vle8.v   v0, (datap)
 	add     datap, datap, incr
 	vle8.v   v8, (datap)
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
