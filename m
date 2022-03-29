Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24428C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Mar 2022 08:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bGDoerwV6mZa/WOuSt4EIkVCSyRLuVfLuEb9YdzTA0c=; b=Y6P5u6Ba/lTzEQ
	46Dwwk5BOAnFGa48XO14dn39n94WeY34qPxsnz7imsjN/ZIejQtGIXAZCbw2PWOFZER6QLDH/rhGf
	ILd+V7oA6gt8qnTxCQdRlDPdP+f2kY+c5S1PfyBJfWcKo5z43oa6KzW9opxr8lPbPSlzC38hCQ5nG
	dGyyvV96DQysr3DFEGG6KmpBCfRGkdfxxT3XjxWsqE8A8WUXd8k7qtV7FyrwFXqFDj7pHwTprh+en
	wgFS7Xr0IL58r0FJo74Krtf/SetclvBlVaE1AOIBqEOatqGDfyYpC0sgHRKRzuvP46PThTF0am6D2
	a8IFl4/L9o0QPcrdYiLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ7T3-00BUkz-Ih; Tue, 29 Mar 2022 08:44:45 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ7T0-00BUkM-PK
 for linux-riscv@lists.infradead.org; Tue, 29 Mar 2022 08:44:44 +0000
Received: by mail-pf1-x42c.google.com with SMTP id p8so15291215pfh.8
 for <linux-riscv@lists.infradead.org>; Tue, 29 Mar 2022 01:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bl9cvCOl2JsstIJeBTKBLK/6QRxHIhdaBkcmq7o09pQ=;
 b=iYpODQl0mjzOo7uUwTlz/c0sB/UJyUUKf0ObUBob9thwUmNV8OhzmJtBk15vBcG2nJ
 crtxxKWXrMYHXEdeJUxJaqbFDd7aTawyF4jSWc+Kpf3tX2SmZ+zXtOj4vpT9XznKRsU/
 y4MndpIGP4FJat1V2YR2Qu1MQgEo530Ppfd7X/aw09aQG0O+pBpI9nYr/wzQ98M2gd46
 Pw5U6CEAT9+v36zc6SxkS0aB92U/+1nS2WOjsUBiSVzZAgXsvFbmD2XEOqORHGrKq516
 00b5btUDJE4X7P3te+l+MUkGiXtEt52CqlR+skuvAPPH0Up62qsxXuK8SPITPXygXvxj
 deBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bl9cvCOl2JsstIJeBTKBLK/6QRxHIhdaBkcmq7o09pQ=;
 b=CaBQk4fbTlDJnIQLHiaEHPoeuY20A1jkSH9KdgsXMbrjtRfvVpdeiReHJaTo3Y4XkN
 Pl6TbDrW7NDt48i4IiXo1a4eK0BuDoIV6sUAnhXsP7JXu20yPDjbrDR5h18iwzt2hv4l
 1TGV+8d7RaRXC8Y91f7UPHssMzDSsSGSDq+u/LvGcUSxjsXzr7LId0UXnZE8kp1Lhscg
 m8q2ImOdJq/MA/Pu5A36XV9kZzfNxjRXVAir81/Yc5gSbvp/Wku3QxqUsgbVNdOkPW1i
 2Ij8B5cR6Tij8GyTL6Sx4bzWBYYJbzX0uDflaD0XP/jyYgz+TUUqJ1GvZ3TKoCFrjGd9
 E0+A==
X-Gm-Message-State: AOAM531pB0YN4TdDNt4SHWAQj0gIwPRfRCewI5/EpWL4VpM/xITPMHEJ
 O/KV/a1oNZzV6gmpyCG49OQ5p6Ble64IrUcK
X-Google-Smtp-Source: ABdhPJy4YxKPspAhcyCCA4hkOFGK0e0KzBesKL2CsRvCVyLxQB+WAQCCxCBEvJ4sul5l4GY6/KX7ZA==
X-Received: by 2002:a63:18f:0:b0:37c:4671:a2ce with SMTP id
 137-20020a63018f000000b0037c4671a2cemr1271439pgb.429.1648543480977; 
 Tue, 29 Mar 2022 01:44:40 -0700 (PDT)
Received: from ubuntu.mate (subs03-180-214-233-75.three.co.id.
 [180.214.233.75]) by smtp.gmail.com with ESMTPSA id
 q10-20020a056a00088a00b004f7ceff389esm20320601pfj.152.2022.03.29.01.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 01:44:39 -0700 (PDT)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul@pwsan.com>, Atish Patra <atish.patra@wdc.com>,
 Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] Documentation: riscv: remove non-existent document from table
 of contents
Date: Tue, 29 Mar 2022 15:44:28 +0700
Message-Id: <20220329084428.376003-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_014442_844459_18C2DC95 
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

Remove reference to non-existent pmu.rst from table of contents tree
in Documentation/riscv/index.rst.

Fixes: 23b1f18326ec ("Documentation: riscv: Remove the old
documentation")
Link: https://lore.kernel.org/linux-next/20220329133412.591d6882@canb.auug.org.au/
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul@pwsan.com>
Cc: Atish Patra <atish.patra@wdc.com>
Cc: Atish Patra <atishp@atishpatra.org>
Cc: Atish Patra <atishp@rivosinc.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: linux-riscv@lists.infradead.org
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/riscv/index.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/riscv/index.rst b/Documentation/riscv/index.rst
index ea915c1960488a..e23b876ad6ebb6 100644
--- a/Documentation/riscv/index.rst
+++ b/Documentation/riscv/index.rst
@@ -7,7 +7,6 @@ RISC-V architecture
 
     boot-image-header
     vm-layout
-    pmu
     patch-acceptance
 
     features

base-commit: 1930a6e739c4b4a654a69164dbe39e554d228915
-- 
An old man doll... just what I always wanted! - Clara


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
