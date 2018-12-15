Return-Path: <SRS0=MTom=OY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EBF4C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 15 Dec 2018 05:22:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A71420645
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 15 Dec 2018 05:22:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DXKrV8O0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="SFB8pJer"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A71420645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nM0oznyTFLYUtGAXWzPoSp0UW7rZxjRb2FMe4cnBki4=; b=DXKrV8O0owOp0s
	Y0EDTopK3/v83KTxBWzlQ/snLTvdtAoxaHS2TBOSY9s28vwnWjWD7FplXMCSNOApcALpNp+1qjcOo
	Xpi+xpvPphc3ml+BqjSGh6mrhc00BxE9p4FYGGqH74OwnfYEb3Y31un/RfLyAP/Nv9RkuvJSeiKw7
	9uRr7wWPuSBiSbopHH73iFliOCcCPH6TyxTWKp0OC0D2NuDWZHTFYRVYbFRYAAwyG4ijKx3kJYkY1
	U3TD7N0ieXFAxZkEPHIPW4FwKDub38vn15emdDzJaul2G5k1A6RZnun2K88pfrMqETaSZzdJ8Lts5
	B8IkEYP4DdiDQWk+40zw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gY2PX-0004hC-EA; Sat, 15 Dec 2018 05:22:47 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gY2PQ-0004Z1-8e
 for linux-riscv@lists.infradead.org; Sat, 15 Dec 2018 05:22:42 +0000
Received: by mail-pf1-x444.google.com with SMTP id y126so3803858pfb.4
 for <linux-riscv@lists.infradead.org>; Fri, 14 Dec 2018 21:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lDoLfpjNAyWtuhe4HUukg8qR7sDpr9z0VGObQaPKKr8=;
 b=SFB8pJerFjTU6W1IOA/VbZktGqFt2HD6oDX90xn2OfFS7l+mURXkiQL1c6vlu+69zm
 Q02tdM68UJp6IrkQdkLv1O2fInzGt6RTm7eb8hNXNGacPZ/HUqDcPXhpjffAKYF+alIg
 5ehbu7We76pgZFE+e31+8vtjgS7qJV++J8YWLn+JmiXIps1+4TqpC0mxxw3gnicYsyZH
 A+ZLb2wCmwEY51764F3wVZ4OywCyCdXMdXSJhEoKAYxTEbmKn6apJbETKpiDuLAOMD2V
 Ci73R5gLKKdvjPlr4d3cm1yofJBP4WpJsjUnx0/FZL7NyInhXCbwKLCRYqGj57X4hF06
 dLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lDoLfpjNAyWtuhe4HUukg8qR7sDpr9z0VGObQaPKKr8=;
 b=krj4ha85ku24Yg3+tqIVcAPkkQ2aq54sucwhFpZXR0mbO73durhazqDkIKpkngLZgS
 7cmFse7WzzevAVykUCS99AGJlMHKuadOkLzRTo3TxqR/LRfIRWCZGHeZhZHljLhg/kmB
 XFVTj2NxjmdO+bqeELQhuORRAcC/UM9/nvhlUAedWO5sbjxboSUzxdYo//tEK/Og9vuT
 DQ/rxdlY4skkQ6HE1u6jOBRRLvOflBKEdfRozu2xI2uQ/VGtlJBHOtSOJ65ZIL60DdFr
 nsrlYvs9P56FxL19qPwMmptHKjR6EnI0fk6x5D3Q+qbV58z0EA1DIMRiVMMQgAOaTbtR
 E4cA==
X-Gm-Message-State: AA+aEWb/HHTui6gtQzKimiWpdgw+NQyOy7FOMv4rDLweBehEdq5R64dS
 2SzTVdOt/9PHhfw8+svuTrn6RjEKeTQ=
X-Google-Smtp-Source: AFSGD/WmSoDpeWsCDldCHmktUFbAD8An63NaaFWgBGSAUc0/+vPeUlXAUj5//UgEv7FfwORXRS/PRA==
X-Received: by 2002:a63:f74f:: with SMTP id f15mr5181688pgk.190.1544851354751; 
 Fri, 14 Dec 2018 21:22:34 -0800 (PST)
Received: from viisi.sifive.com ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id z127sm11351282pfb.80.2018.12.14.21.22.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Dec 2018 21:22:34 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 6/7] dt-binding: riscv: sifive: add documentation for
 FU540-based boards
Date: Fri, 14 Dec 2018 21:21:53 -0800
Message-Id: <20181215052154.24347-7-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20181215052154.24347-1-paul.walmsley@sifive.com>
References: <20181215052154.24347-1-paul.walmsley@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181214_212240_312193_7939BBAA 
X-CRM114-Status: GOOD (  11.11  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Add DT binding documentation for boards based on the SiFive FU540 SoC.
The first board, the HiFive Unleashed A00 (FU540), is described here:

https://static.dev.sifive.com/HiFive-Unleashed-Getting-Started-Guide-v1p1.pdf

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
---
 .../devicetree/bindings/riscv/sifive/fu540.txt         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/sifive/fu540.txt b/Documentation/devicetree/bindings/riscv/sifive/fu540.txt
index b5cf2b9f9a75..20119cc54964 100644
--- a/Documentation/devicetree/bindings/riscv/sifive/fu540.txt
+++ b/Documentation/devicetree/bindings/riscv/sifive/fu540.txt
@@ -12,3 +12,13 @@ compatible-string values:
 
 - Freedom Unleashed 540 rev. C000, or "FU540"
   compatible = "sifive,fu540-c000", "sifive,fu540"
+
+Boards
+------
+
+Boards based on the FU540 SoC should specify the following
+compatible-string values:
+
+- HiFive-Unleashed rev. A00 board
+  compatible = "sifive,hifive-unleashed-a00-fu540",
+	       "sifive,hifive-unleashed-fu540"
-- 
2.20.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
