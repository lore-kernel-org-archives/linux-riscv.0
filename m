Return-Path: <SRS0=cAep=XA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE66C41514
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2019 12:46:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1902822472
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2019 12:46:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lrUbS7ir";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oZv7yvLo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1902822472
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=MqSLd7pI3h6uQkZYAdEGUC8vEUj6e8HnpToBXCYt8yE=; b=lrU
	bS7irFunT+X16lC7qmDQ9bx66dBg/ZFscQy0tAQCK2yN11mKCvE01F67BQmfn5WteBfmx3zvf6aUJ
	cyuzPgyYwFCYU5g/CWnjsU1IlXlWL4zQc55wZyRaNe9Ed/FKDSakP2BGyBRrnmE3ToJKF4GeGdJBK
	A2KB5CqL0EQDaptdCk1ps8ctNOKMCh19NhXyEYUbvwP0gPyoqZNdatTnVhMRMZh3gFa6/scxexaqh
	R+sbIYeZuOsqHRHBDG9HhCR9Rp80JalEeQP2T7wbwmYrmZWn/3gDN+Zm/EPYHxq4ic/JuBOz1ZTof
	2Y8AL3SHyifuM9B6C+2Js5RQEGEqH7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5r9K-0001Tg-DY; Thu, 05 Sep 2019 12:46:06 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5r9I-0001St-6m
 for linux-riscv@lists.infradead.org; Thu, 05 Sep 2019 12:46:05 +0000
Received: by mail-pl1-x642.google.com with SMTP id 4so1244940pld.10
 for <linux-riscv@lists.infradead.org>; Thu, 05 Sep 2019 05:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=WM6rR/Cv0t68SHx1bqGl5X9yzZvLLjOLxbj6KRGyY+4=;
 b=oZv7yvLoJTDRZLo4oJSgW5Vbu9DBHBlz5VFNa2fGOc9gpMnxnJvAG935dHVoC5a+zN
 wTZq/ijBq9l5KtlmXf8ZeuJXUSgPp4WSDeJlO/1PbZw/uq1tfe7UmIfkTx2kY+dBJCFZ
 YcXtFXj0jhREzVkOWXBtLPNxGCfTEzNwdq9GrvE378KwHnTh2j6j70Iv1Hqqqd8dSmEg
 qNB34Q1xU+IcalAz4dBUjy0HgTvcx2urOPoxaxqccjCwTpcERUPcKVWsIkGi4Zj2G0un
 vFucV/QwJID6dSnkaC6xpswL0D92EbXGeq0GRlc5jlNDpSEt2MrEgRFJBW4DO3FlM+D4
 AvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=WM6rR/Cv0t68SHx1bqGl5X9yzZvLLjOLxbj6KRGyY+4=;
 b=G8zEkfLFbavJmt9YcxPOk4pmJMMt5Fav90urdP6729lXIrBO71Hr93+clHLuGK2Gn/
 smXgtHT/Kqi7qtcMZpMmUFeXCm8f8ETjE6vTh1wfZ9LjGLieraLyD4P1P5uNT7O0flWV
 3SdiajA/jYm/cXJMDRSp3M7elpN4EfnjCa7BsBKaDcJ5HNYyXxLBS/u9p+CR/ZOKCjDw
 b7/6ETKnm7Z/49wgnlao9UtkOf2TGabnU7FTxeSf5d4G/Excp8wxuBDso4cU4+S9WVna
 7vdXdP2bCPwE9UVE0hFJLP9g2nvA9PXzq+cMQg34KFRg3SRdodQANz/rW5OSCOy6emDI
 jhgw==
X-Gm-Message-State: APjAAAW71p97KEJTKwKspgwR6UkDr6/W0eBRdWwFQNVSaJ16JrZzF7s+
 6JCU01W3q6JOO1ut0sCP8It6azsE
X-Google-Smtp-Source: APXvYqwvTeYV5QQ51gK9PVjIDtCbPQnpHl/4CKedsvgU0dSTpgTqXJIt44Kdo8iVLocqVuZPfMevsw==
X-Received: by 2002:a17:902:426:: with SMTP id
 35mr3251485ple.192.1567687560305; 
 Thu, 05 Sep 2019 05:46:00 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id 74sm3412635pfy.78.2019.09.05.05.45.59
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 05 Sep 2019 05:45:59 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v2] riscv: dts: sifive: Drop "clock-frequency" property of cpu
 nodes
Date: Thu,  5 Sep 2019 05:45:53 -0700
Message-Id: <1567687553-22334-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_054604_251043_B3499ADD 
X-CRM114-Status: UNSURE (   7.14  )
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
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The "clock-frequency" property of cpu nodes isn't required. Drop it.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v2:
- drop "clock-frequency" property of cpu nodes

 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 42b5ec2..a9d48ff 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -60,7 +60,6 @@
 			};
 		};
 		cpu2: cpu@2 {
-			clock-frequency = <0>;
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
@@ -84,7 +83,6 @@
 			};
 		};
 		cpu3: cpu@3 {
-			clock-frequency = <0>;
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
@@ -108,7 +106,6 @@
 			};
 		};
 		cpu4: cpu@4 {
-			clock-frequency = <0>;
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
