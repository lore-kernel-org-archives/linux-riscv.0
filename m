Return-Path: <SRS0=oUx1=CT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E3BAC43461
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:13:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6F8820731
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:13:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IAPvZdjy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="gFxw0O2i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6F8820731
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SnxS642V3SfmhcXCEHZxjgpNYADZLX3pFUILYAVNjb8=; b=IAPvZdjy+ZsevE+uou1qnciT/
	M+PyUrIjoelgqM1oidiVTKLTjiLaHM5mMWUY1hyLajSVs8BdUr188gaSORX0XAoLVx1LGVQdZ4wqo
	XvGTw+GSncwOVAXJKJiGhKyBdF4ehuOban8A1KtR+Pe90hkn+MDQgfd+YY8Mmca0TJq9VqVVwItbb
	RCO6KufaqYiZZvBqY88ljSEp9p/8eahb9/W6GcWyVz9ZBd7DQuPjboP/2aKBtI0HEGLTegyjl1zaN
	mO+l5iN/ZyC1x/BaA89RZuX5ejMqSDkfEYE1TIk5EuEBZaVlIWbK1HFLLcJTtNw/VSYAb1XkhfZon
	SWKC6cTdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGHi3-0000Kn-Ex; Thu, 10 Sep 2020 08:13:35 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGHhq-00008X-CJ
 for linux-riscv@lists.infradead.org; Thu, 10 Sep 2020 08:13:23 +0000
Received: by mail-pj1-x1044.google.com with SMTP id n3so962267pjq.1
 for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2020 01:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WcdZYdMEIHKAJf7V6BNJ8N7QqP1cj59N2jvisfvLOK4=;
 b=gFxw0O2iyGtEjTc+9vvle+GWK8/rBNO9iGBU3yKPmjiPdrqufT2gnaJRq4oZm/lkEm
 +6apTQDPsbANW06VDwmJhuHosOE+pvEIwBCAE/JP7aseIrCBlV/nYsxBaMjvKjrY6o0D
 Kx1sqytMU01sbHmiNizSeDM0UVbAPNpm+8hegfub/N48P8g4aUTZNW7Xya1fWsexfhui
 CDoGZYyepKxkKIuRc89Zh5dL/ZEj4KaO6RfYdLm6ZC4LgTUdME6v9Oh5YhChKWEN+uUQ
 YPVRzuedyo4meFqusFzwrf0VwAlebw1osL9j5OAKnddoZZfqGLKpVBQk7Kq+7IGALsv4
 Oa2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WcdZYdMEIHKAJf7V6BNJ8N7QqP1cj59N2jvisfvLOK4=;
 b=qJVfzZEzC6CSYjLyfgkhOof9Hd/dl0EbVT2yck0Ud4J/dRBjcVmFEx1CtOHc0vAfP8
 YPJtNqw574Yb61MqwWhqdWSvJombDy/QywmkLUEPzMc9nUcX38PTUGg+pnbqzC/oOtKh
 ZxAcygs2gUxwPo3/vPkKIuArhkdM7+AoGkHrWP20fiXiC8T4dd/OERP6pYrxNJpjsDgq
 2TLXmqwhHa+/1/5cjIwWhwewzskw5UMk/SIaM4v9bWm/opxSDZPaz3qJOIc9f0QtWBvr
 r6Y9baiV3fTXNxnY64L3vl0/Qffa35P0AxQ0jXvPw+OYKi9SXH5ti0OBcGi97ykFoHAt
 gP0w==
X-Gm-Message-State: AOAM530Sy4dC/k2aja0OeOS3MwuVPbXKxY5FOaLLb6njatt8+Y5mcUMZ
 g1BYoyb1mHjRTEhg0Qba9eVOrQ==
X-Google-Smtp-Source: ABdhPJyl9mhInSAGTEcKRk8ImSnnn8MjUxLE01XUnaBOgRsFK19fKG9dgkD37JtwLKBEt0MAbI48Jg==
X-Received: by 2002:a17:902:aa85:b029:d0:cbe1:e70d with SMTP id
 d5-20020a170902aa85b02900d0cbe1e70dmr4616487plr.27.1599725600536; 
 Thu, 10 Sep 2020 01:13:20 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id e1sm2196056pfl.162.2020.09.10.01.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 01:13:20 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Subject: [RFC PATCH v7 21/21] riscv: Optimize task switch codes of vector
Date: Thu, 10 Sep 2020 16:12:16 +0800
Message-Id: <50eb3d9d0a92d6faa39e9fedb941863426daca76.1599719352.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1599719352.git.greentime.hu@sifive.com>
References: <cover.1599719352.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_041322_454231_62E807CA 
X-CRM114-Status: UNSURE (   9.65  )
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
Cc: Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch replacees 2 instructions with 1 instruction to do the same thing
. rs1=x0 with rd != x0 is a special form of the instruction that sets vl to
MAXVL.

Suggested-by: Andrew Waterman <andrew@sifive.com>
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
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
