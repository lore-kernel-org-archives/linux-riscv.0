Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE99C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:46:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C17D61131
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C17D61131
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3IRp3BsABrPoglLtLktkeGy+DsWP6xvgWUUqeYoM+9Q=; b=tV3S9AFr2z1vyd
	Z0KeT3MM9OxOgiLW9/ycLWJruB13ofP7wsz38qB33ZpBInltz0pDfoUaMm8pZ18OhlWier6yJoSvY
	TklYKndKyVPNDnCHgu/gtX93srb/ZrNgLRT9/rMVtdGZQO5lXNt6W23XB3YtaQynxMzc6DSQLcE1I
	SpVHlsyntw6B8MZiDCg67OmNBkflSNbMaQoBoKNvkCncoKAhZy+l0eEZe7wr8I3Q3XhBk/ONLF6Yp
	ja7cuTvj703ZNuFJHtzR0C7Ls7XAjW1/78ELuzSDgAKMluV1dj9JYDtFWNxB9ePE8sNCq5id6746O
	HrNBhXEO46agATeOu3pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO1eh-007J8s-9R; Wed, 08 Sep 2021 17:46:39 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO1e5-007IbI-LI
 for linux-riscv@lists.infradead.org; Wed, 08 Sep 2021 17:46:03 +0000
Received: by mail-pj1-x102b.google.com with SMTP id c6so2236994pjv.1
 for <linux-riscv@lists.infradead.org>; Wed, 08 Sep 2021 10:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Baz922XdUGTh23cMvISXGBnGRTu0s4UeMCwdvdLeytg=;
 b=bPFlZkprfGTtM5GKmqvWBCCS8Ea8K6CDkrwOgDrIhEGLjYXU33pJyZ+YgKmoXk4V+u
 6CuTDmW4NQbKL6QNZUd3ZhdZ/oZVJ5Tb+G7pIrFi8OGlkWNT1iC2CrIRcu8WfxEm2d3r
 +8qJXpcY9B2iSDb+cRcW0CxCAwGNltsOb0rdz0S1xPxpf8rBHqhF/zD0YNJJfi2BpZI8
 vHW1kBAB5lfubTzhupAmmdVmveWZWEpArXo7gd67n6CJTdgVZ9zcwRaC1dkz85g1qb2I
 JUAVOGBIqdgxiOla342bOzgmv7N7+gSH8uxYZB1JXPByeG/KETRbWWX+YYFNai8Q4vVg
 zpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Baz922XdUGTh23cMvISXGBnGRTu0s4UeMCwdvdLeytg=;
 b=LQMYXTir6RmQDmHPsiU6pgl8M3C2GOf9hu5gRKVLy+8pbtbwq6IN/AIejPh8les8ti
 1i3PXkeGoCL+/FOAz7qZkId95cEQ2EUjbhyBKOU+4YDJXdItGbopl+VvEE++UWKyo92d
 94pvyDeEWW1GHVT9tQcQSWiGPQ+bV56qEbYiheVWDCeZ2QZpULTbW/gbCEryjoWyzCve
 eLt4KiCVZAMRtOB1t6jUYMT4bSC74jfdCVsafRlyHT58ScwG+H2kALBBNkjpouUwoLMX
 wozfD1qOHNiqO1oHudz5nQLrtC+eohsasLJrSdZ7czAgA9Nbl8L6c9gZQnPkYkFiKRV8
 1AeQ==
X-Gm-Message-State: AOAM532/yJu9HLQPh1xDp5Aauq3Pob5HQIPWmzHdIJq9IoPDiWOlJPaO
 dWH9GcLo9xUvrt5sQD+3ZZrmk8hOW1WOLQ==
X-Google-Smtp-Source: ABdhPJwVBkkg8Gt0T+XxJWkdO7tCZ5buazt5UIWlW7wDw/gIQ/CynRw1Vj/5W3LGyLCOiEGw4si9pQ==
X-Received: by 2002:a17:903:22d0:b0:137:630b:5d7e with SMTP id
 y16-20020a17090322d000b00137630b5d7emr4082390plg.51.1631123160924; 
 Wed, 08 Sep 2021 10:46:00 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id b5sm3108466pfr.26.2021.09.08.10.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 10:46:00 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
 vincent.chen@sifive.com
Subject: [RFC PATCH v8 16/21] riscv: Initialize vector registers with proper
 vsetvli then it can work normally
Date: Thu,  9 Sep 2021 01:45:28 +0800
Message-Id: <5589514eb2d20504725821807800b5bbccf36fe6.1631121222.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631121222.git.greentime.hu@sifive.com>
References: <cover.1631121222.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_104601_732522_F9FF4469 
X-CRM114-Status: UNSURE (   7.51  )
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

It may cause an illegal instruction exception if it doesn't use vsetvli
before vmv.v.i v0, 0.

Co-developed-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Signed-off-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/kernel/head.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index cf331f138142..42eb3203fa77 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -442,6 +442,7 @@ ENTRY(reset_regs)
 
 	li	t1, SR_VS
 	csrs	CSR_STATUS, t1
+	vsetvli t1, x0, e8, m1
 	vmv.v.i v0, 0
 	vmv.v.i v1, 0
 	vmv.v.i v2, 0
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
