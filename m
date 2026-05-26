Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01652CD5BCF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 May 2026 07:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0uiSCCx9Up2Py4fhxggfHgBk2WqK9zzaUXMTcI2Dv78=; b=AxxJ09upXcR4OB
	ySD7OMf9GKotNvXtNhkxtNg3mg5cWotdvN0ooB11n5/TFJB3pqjpBdJ89RBWv1tCS2h+pzZaWFYcb
	luFy97B1PBEADDDqLLS+0w8YGkcR+mYhE4VtlfH17OW22W9FbR7BrTReljMsJvtZRPxt6hyN727du
	COA+2fkJWcHZoL/1OYEQaH6QkROUXCzCyrdsylnxdmJb3SWWlGh7YH5qwh53LhGr8ZvR+VbXdfpac
	nXRWBcu+unpNXPoFEJ+Dnr4Mr4ukhXyEtovGxAqb3NU+cXw+0VfBMZkAG+N4z11QToko+pIFyRORp
	oB26p89dzPR0AMsFTPgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRm8Z-00000001Fvc-3CLO;
	Tue, 26 May 2026 07:23:39 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRm8W-00000001Fv7-3NjR
	for linux-riscv@lists.infradead.org;
	Tue, 26 May 2026 07:23:38 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2b9ea536877so67053315ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 26 May 2026 00:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1779780216; x=1780385016; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kaTzZIrRiwO1RCeM2bN6zyMtDl6KOzXc9TYKEU25JF4=;
        b=fe/TBYgSKEzTPQSIjxk0asVry2Km5uLhMcrgIt3djuHW5z8/+BDjsL7rC7leRp1lba
         n2zgvCbnnWR+bRKE6qQnlH44d8oNhBPMzd5e2cQbrhFBM8BkCf+YYyO1hLZPudImVjjk
         ozSrUXeYfrAyJKRiN/St08o4oOK43wTIusOkBGyFahln6/yK65E0h1dMNZuS2BSwGdg5
         PIHi7CgxzlZW4E/hxjDRZJlUd97y8ktBjgejfitkckSvAddjgnajlHKVzFyOJKbd4N8j
         1jIA+Ljbp3/Csdof8aMLIfMZ+1WnHoArXPxfCAGTlKZIeJG1u0WQbbekQ22xXpoFpMGF
         UqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779780216; x=1780385016;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kaTzZIrRiwO1RCeM2bN6zyMtDl6KOzXc9TYKEU25JF4=;
        b=njSU8wOg+PPBEKmzVoxDsvEZMTbCsB+tagygIYGIpXcraNF1ATlGAalN57xmQN9yQL
         ugg1pmEONMMP2P4ePpyB9q4OTFAUH7XvbBA7DNOWVMuuaxvolkaapYT4Wv1NaVqD+k8f
         fXzC07MJUTqX+fJnT2XjwT1MFUSkHuBA2yh/s01L/HECPsWiOw2BTAFZmq9S555uLkfE
         fjDmZEMQvVmQFdZhbr+1ilK5OQ4IpLzz7dGyhhw0+I2iDm6vMHZPgSMRKmXAuoqFSv21
         /ekuENbeu9zZd/PdDlgjB5ojWwPH6C1BgOxaQRtQXyNzD5Lt+d8kkux+ZS+/J4ErssMu
         vC2Q==
X-Forwarded-Encrypted: i=1; AFNElJ+fCK3/ex7HCbQbzrYn7ughPmxwa2Dkgzsg83OyPbFwOQMdzv2Z6VK86bVhKNONK8Peerpyf+LetWrfCw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOGcMS1IE/sMJcX/ti7nzmUmDvWEVA1oPu5u4k9GP3ZmMLz3l3
	B+rn7gb3NcxCNJ0Ap6OPX4krElLSViaG6nVMEXEr6DfZBK/YRy7LrEkWRqOv6HSSy6Y=
X-Gm-Gg: Acq92OHkn9IlIZMXtB6AHB+yRj5vwD3ixP/kUfTM2aa7bgZmahnMSx7kG7SuT0Jh+2o
	NNVu3GrFehyMpaZZ2lWiKCds00iiVLCa6bvE7X+nr+FZw+twEGS6g77Vmn0PnuvT3DeoKbzA2Pe
	H4rF5re6JuWOQ2zkag12ZSgsHWjvl29GVu+1brLn7dYC5dp9slzi2/9uvOqSWKq+XkbdSiGl9i9
	mHiUTKpuZQbLY60Uf96JWxRqyCF/ugNfPmb/LAS3dfX9uUUNt1dQaHU/eR5uDyToh4QIs+as0yv
	Uxy8tWpFpyVB8O4bqZOhtamNzR0RJrs/DYHfH7XFd80YEkwC+WcdzhrcrIrT/Th2iHrqBKpA9PP
	j3AARpc/ayUOy/GYnngZKozoa5x0eh5a16cwxlbtB8tKY5IC/Z580mD8eg5EyUWfS8WlzdyRfmx
	s8kzvUjZPydh26UR1ZgUsGeZz5HLmFrU8ZaEaZFK5ianE=
X-Received: by 2002:a17:903:1a0d:b0:2b0:91e6:bc18 with SMTP id d9443c01a7336-2beb0878549mr150966255ad.14.1779780215657;
        Tue, 26 May 2026 00:23:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb591f63dsm148893365ad.83.2026.05.26.00.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 00:23:35 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 26 May 2026 15:22:58 -0400
Subject: [PATCH] riscv: dts: spacemit: k3: Add Ziccrse extension for X100
 cores
MIME-Version: 1.0
Message-Id: <20260526-k3-ziccrse-v1-1-c759792ca3a3@riscstar.com>
X-B4-Tracking: v=1; b=H4sIABHzFWoC/yWMQQrCMBAAvxL27EK6KYr9ivSQJqsu0lQ3qRRL/
 25ojzMws0JmFc7QmRWUv5JlShWak4Hw9OnBKLEykKWzJXvBl8OfhKCZcXBMsY2t8xygBm/luyz
 77NYfrPyZ67McEgZfszCNo5TOJF4K7t+GrtBv2x/hkXa4jQAAAA==
X-Change-ID: 20260207-k3-ziccrse-b3e2d4d43aec
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Guodong Xu <docularxu@outlook.com>, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_002337_223852_6FA676CC 
X-CRM114-Status: UNSURE (   7.96  )
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

Add the Ziccrse ISA extension to all eight X100 cores. Ziccrse
provides a forward progress guarantee on LR/SC sequences in main
memory regions with cacheability and coherence PMAs.

The SpacemiT X100 core supports it per the SpacemiT K3 hardware
specification.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index d4be8de8fc6cc..ccb483b439c5f 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -36,7 +36,7 @@ cpu_0: cpu@0 {
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
 					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
 					       "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
@@ -77,7 +77,7 @@ cpu_1: cpu@1 {
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
 					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
 					       "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
@@ -118,7 +118,7 @@ cpu_2: cpu@2 {
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
 					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
 					       "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
@@ -159,7 +159,7 @@ cpu_3: cpu@3 {
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
 					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
 					       "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
@@ -200,7 +200,7 @@ cpu_4: cpu@4 {
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
 					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
 					       "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
@@ -241,7 +241,7 @@ cpu_5: cpu@5 {
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
 					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
 					       "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
@@ -282,7 +282,7 @@ cpu_6: cpu@6 {
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
 					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
 					       "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
@@ -323,7 +323,7 @@ cpu_7: cpu@7 {
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
 					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
 					       "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",

---
base-commit: 5d67b1f204472df70f7c7189c01fa405f3ccb503
change-id: 20260207-k3-ziccrse-b3e2d4d43aec

Best regards,
--  
Guodong Xu <guodong@riscstar.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
