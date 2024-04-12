Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717CAC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 08:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mBlO7XvQY8QvxEt9QmvWrWo2/PLtL9Enfg5h0PU5xiA=; b=CqM7owankPP50g
	4O3OvTYtavofgJAVyIHAeefo4j/uWkxcu77t+sRa8gK2o/NN1qXZdqC9BQ9SIH1iTEnHgeJ/T6H3g
	nGpcithnGmOVguJpY9xslNeztKbIZzOWyg0b1mmFdX3oD/EkVj0hHyiL2CNTyV6Af5CC8VKefapEO
	RFw3jQ7u3mkunnytu7lfZJ2lU6XxZY+NJEW4yeqp3BvsS4MGhAmim+RZUeqCTnekH55UKbSo4U1mW
	nU0iI5zPcWnH+mt/R6ie3gVyei25aKXYAfx9O2yzHkPFBCFHhnDMVWd3SWjeYdn5zP3wCqV2E2rnP
	8zdaYSGAm2RqFZsA9Bsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBsL-0000000FxyF-3Jom;
	Fri, 12 Apr 2024 08:03:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBsF-0000000Fxsx-2wAH
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 08:03:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712908982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lECrQISwTyfiQuZfzhaacIj2l/HO/4HjKmgRSsbNnU4=;
	b=UqfDom9fAc8B2/JYVguXY9VM3UPPtUK2TDA9CDby7QsJSTa+nc4tNXRyQeqRFmjLvv5nKy
	OIqJtXDKRrtT7BqQB42vVvSQkHKRnWgUonD2F4mI+u7ajSprUnADv6OwcS9Ub8W9NCClI5
	lHELdDHOdhjxb9RlsM/9JGITczhx24A=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-lAZXeHmKMQGRU0Vm2BZv_Q-1; Fri, 12 Apr 2024 04:03:01 -0400
X-MC-Unique: lAZXeHmKMQGRU0Vm2BZv_Q-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2a5457a8543so583189a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 01:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712908979; x=1713513779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lECrQISwTyfiQuZfzhaacIj2l/HO/4HjKmgRSsbNnU4=;
        b=QHNj/FcII9TU5UfQ7d/6Kbcb7QuUcDkUJdGjjpjTGYto4sQT7Uj9G71WPvm78l4wAF
         8lN9UOfynS1M9qYeEk0ObHieQUFYM+tbw2ULkn4Zn4PDT8GZcBTTiZu+ns5AifGOjlin
         YObO+C+L3GbALeq3/6Zoiz1UDku22zTNw6QHVqLquoeOPTrnSJ9gIH8tKFnfjiNlyj5H
         sMKSUgi5E0Z91wup6McIJEoWKnFkmqEqVKV9j4CryjY12gGP1j136pqvunQmZlMNaIz9
         IprJuq0akx1+3uWp3/5LoD5tjTWZqlSsimhuuCl22rBwvyVoKECulRUrH/X6eJ5w0oRd
         nJCQ==
X-Gm-Message-State: AOJu0YwhNNVZ17rzSoj1hL5c158YBCxD9ai46ZdPkcBNhHxAA9Fdrp7S
	7AHxByjXAf09A1Ni4zUu2knLTJQ+KawcxVtK5fHdKxdJOGbSMv9g3viJoz1lOxXSnTcMuKg1IxK
	Ai6o1mRqpLUWDocOLldZrhXieZpyEbmmkqxP3tfbOHy8Bq3DyZBYAZTqB8x3qwYWXAg==
X-Received: by 2002:a17:90b:1001:b0:2a2:775:9830 with SMTP id gm1-20020a17090b100100b002a207759830mr1909389pjb.11.1712908978904;
        Fri, 12 Apr 2024 01:02:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF24h9XG4blfy/RFGcd4FjC17Unma1YbnMvxv8GsHe0ou75G0czKI/fwNaCpVH6a/ltnSojBg==
X-Received: by 2002:a17:90b:1001:b0:2a2:775:9830 with SMTP id gm1-20020a17090b100100b002a207759830mr1909371pjb.11.1712908978644;
        Fri, 12 Apr 2024 01:02:58 -0700 (PDT)
Received: from Samantha.redhat.com ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id c9-20020a17090abf0900b002a610ef880bsm2601514pjs.6.2024.04.12.01.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 01:02:58 -0700 (PDT)
From: wefu@redhat.com
To: jszhang@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	guoren@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	Wei Fu <wefu@redhat.com>
Subject: [PATCH 3/5] drivers/rtc/rtc-xgene: Add "snps,dw-apb-rtc" into the "compatible"
Date: Fri, 12 Apr 2024 16:01:45 +0800
Message-ID: <20240412080238.134191-4-wefu@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412080238.134191-1-wefu@redhat.com>
References: <20240412080238.134191-1-wefu@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_010304_155552_EBE29DB7 
X-CRM114-Status: UNSURE (   8.69  )
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

From: Wei Fu <wefu@redhat.com>

This patch add "snps,dw-apb-rtc" into the "compatible".

Signed-off-by: Wei Fu <wefu@redhat.com>
---
 drivers/rtc/rtc-xgene.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-xgene.c b/drivers/rtc/rtc-xgene.c
index 4d6f1629b973..5163682f9816 100644
--- a/drivers/rtc/rtc-xgene.c
+++ b/drivers/rtc/rtc-xgene.c
@@ -287,6 +287,7 @@ static SIMPLE_DEV_PM_OPS(xgene_rtc_pm_ops, xgene_rtc_suspend, xgene_rtc_resume);
 #ifdef CONFIG_OF
 static const struct of_device_id xgene_rtc_of_match[] = {
 	{.compatible = "apm,xgene-rtc" },
+	{.compatible = "snps,dw-apb-rtc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, xgene_rtc_of_match);
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
