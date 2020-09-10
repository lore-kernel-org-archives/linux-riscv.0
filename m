Return-Path: <SRS0=oUx1=CT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B62C43461
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:13:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C586120731
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:13:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ivTeGpX+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="bLqH9LN7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C586120731
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4INThDTt198hVOvGmfWc02vlCUduFx7anfYupbpZZ8I=; b=ivTeGpX+ARG9noq19/nFwXI01
	Jwq8ciMHE6TDJT6Y3ZWjkrahpCeO7kIjxP4weZh62c2dKkxW2rvCO4gpgGeEAoF6mss+7xnZE8DXY
	THh0RYgjim5DNWcG1Io4VSSSw8hKQAdEoUZ2fXVyLxrrtrbye1zXPPYwN+CVNdU4XQpknogg5HVUL
	tukOYrWL5s8rucS+iFi+O6bu4dFmA7ioYQ1iSD6BRk6DoR3aPguf2u7dV8zh8VR6GLHLheh3sBxBD
	5/F8BcR6tJn+0i8jzJGwt5OyerNsVpmy6SM6vzaSqRzy1JnjPgHVp667l0CRmttXl88VBHIw6g9xx
	fPOQ9HGtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGHhw-0000EL-JY; Thu, 10 Sep 2020 08:13:28 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGHhi-0008Ue-ST
 for linux-riscv@lists.infradead.org; Thu, 10 Sep 2020 08:13:16 +0000
Received: by mail-pg1-x544.google.com with SMTP id 34so3808433pgo.13
 for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2020 01:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tyToT9usN2RGs0QtGnv24oUTJVHH9I6JpNfhpfVomac=;
 b=bLqH9LN7vYQCfiYsDw9XFJW6EBbgy+BKpL1nE2vQzqHNEWbndeR/jFMs2CF5Yu314Z
 1SkbT0vxBNj8q9eMT1h3QfYhVkyYQwQXsHxTwqge8uDF3xfiSUR25qKxwkuDZ8s5fila
 SjsqxGh89bR38ziXfw30s9GngwHLJaOiIymXYD/hJnB+nUnLxaHphFwgxJcpCS99TGtV
 zoD4gHm8Jx+7D/OhUXxZpUsLm/jsKXKqwUwC+ZXADXsTi4ZOYegUOgNFm5UNbTwbe6HT
 MZ2gJD/pt26iUvZgUE/4qRlSMpRHoWARs7pUmDWXf5CTNXFYihNwWq/KSq9jaLJ5kopR
 r53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tyToT9usN2RGs0QtGnv24oUTJVHH9I6JpNfhpfVomac=;
 b=F1kb/Lxhs8GWzYVaW6PatUT87pHWN4pb5QxpyKyIm2cHyBLf21+jMEbtvHPIm6ZKbG
 WaAkyHxW8iuLm0UAUCbxoHy8kcc7aftLjoIUPCrJWmIUPy6en+2BA0/C0ZczXURuvNxV
 mftf5gvKiG6paVUDFs0ZPswrNqOVfR4ET9Hx1rM3qnEkXvGL57RLfcGkBxO7xcwPq3Je
 qwJNTB2hEu8yPu9FZaohfR0cllG3GWK6P0kCyK42yXtVeaKYZYw/3lJqbADJEmV5rgjD
 FYNYnvA9dP/w5zkSOu+zX2cRvhkT7pmlxu3M85Pl3sfufWsGW0BNuOgRortDPZxYx2if
 HBug==
X-Gm-Message-State: AOAM5302/F+xGHcEvNtvlQBG5JIBppxVFGdvNYYpFi90yjarlh3QOTX5
 M6iFuq+0+U8ctleofAby868xBw==
X-Google-Smtp-Source: ABdhPJynWLjsGJ8rMru7Ua4JcJxOP6VlQ0E5ZU7VHtZQmYKi72QBIcatIakNoD22UeJCg3U0lANssQ==
X-Received: by 2002:a62:f841:0:b029:13c:1611:652a with SMTP id
 c1-20020a62f8410000b029013c1611652amr4542048pfm.10.1599725593043; 
 Thu, 10 Sep 2020 01:13:13 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id e1sm2196056pfl.162.2020.09.10.01.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 01:13:12 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Subject: [RFC PATCH v7 17/21] riscv: Initialize vector registers with proper
 vsetvli then it can work normally
Date: Thu, 10 Sep 2020 16:12:12 +0800
Message-Id: <3e0097c59860fbaa90aadc69d302fcc2e4ab351e.1599719352.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1599719352.git.greentime.hu@sifive.com>
References: <cover.1599719352.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_041315_100137_668CED4F 
X-CRM114-Status: UNSURE (   9.87  )
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
Cc: Han-Kuan Chen <hankuan.chen@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

It may cause an illegal instruction exception if it doesn't use vsetvli
before vmv.v.i v0, 0.

Signed-off-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/kernel/head.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index e97c7915ae27..74f2fd8430e0 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -375,6 +375,7 @@ ENTRY(reset_regs)
 
 	li	t1, SR_VS
 	csrs	CSR_STATUS, t1
+	vsetvli t1, x0, e8, m1
 	vmv.v.i v0, 0
 	vmv.v.i v1, 0
 	vmv.v.i v2, 0
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
