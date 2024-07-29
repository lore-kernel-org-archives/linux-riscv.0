Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3510FC3DA70
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 21:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V+py0Cb62FeoA+T5UdI+Twj3vybNItm3neTPgd63OU0=; b=zvvJJMgmckxpko
	Pic/tZSvH8Apw3jkSxRWAkLG9WTHCBvhJSLtTBzAJu8+1xHBQqonJbVTmzGS+5qxgAmks5O+BqA4j
	QhUtXsfWcer2DuoRMyadspBbHhX5gmyBf/Tps8f1+KLbTlCoMAc8AUyoLut7XUDMnOWC+cUNo1H43
	bRx8BcxDrooAac8KLRmNX4+muVx0WQpRqcpwfIdYNUITMTuF2npzGh6F7fuwdd6QScATLN9aEHmy1
	xSlZpKK/KOZMgraXSiH1ijROuBEbwv3PNZ+9bg2l1MDMFSwrcr5EmX1J9zFCVWfF8blmYV8Lze9yt
	tMFOfQvHIojHk22sPvZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYXTd-0000000Ciyr-3KeL;
	Mon, 29 Jul 2024 21:00:17 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYXTZ-0000000Cixa-13Az
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 21:00:14 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1fc5296e214so26457225ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jul 2024 14:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722286812; x=1722891612; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dql6H2E8eMkdEWJsMLB0+FYOVGD+y9KXL3h/jt/IJY=;
        b=Ywnme3VNlJinjvj9s5DoUn6XzuRGzTrA5EA6vzwSGtFaenBwQECHgFhbqUCSl45Rup
         lk8WbJBaFHHZ72fyUsiOiK/QjKzqENHPRss5J841xtYaRFbZs9gu+FBPcD2F0TO8YPJU
         auT0Ip1DIvRSDzJ3l6dH0cnMSag7mT1bitwE8eP9R3qn88EURTNrlwfHaVeqG2Bcld0m
         2F7mVsXBkCzZgvFw2gjH5bAPkHCIapdpABPc/d3nQEDHgMokpbc9iURHZvdwVw7bLMG+
         WeUt4GabeHGPaBILTxRm3kpixFSUV+IMqXF0TCkEe3O3CEleJNEIIZnp5OtcG6gtTwyP
         1yIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722286812; x=1722891612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dql6H2E8eMkdEWJsMLB0+FYOVGD+y9KXL3h/jt/IJY=;
        b=KaTd3lDFxKQpGjx2kI8q074TNh+VTxYe9VgRF6l9rVyifLibBETwXUeRGI86uVERyD
         bJxgbGx6v1kDl9aPVdNho+OrO7BxbT7l0k/u//Ne8ADOeVbcFSzoSOk/sKRHjWTPlJir
         yRNLv3UNkzWWgSdE9YsptO48hgqVrMLi19AuufYX9IM5BYSTBmTSlPf2z4YF/rlDT6AK
         s1yhIbujM4gCgnaFg8p3QEY5x/CCF4IsuhluZaWqYKVWTvIISgUoFBs1vBU//5W80bM3
         FZIsUlNLeamR6u13LOD6IhfwfDRpglAlGXGC6skuxC6/tm6e+whbE+v3A3FTK0ChvtT0
         SDpg==
X-Gm-Message-State: AOJu0YwJuUkTy2yrPv4pSmkzg5pZL3508U3cz8ZcQp/S+3LCcjm9feNo
	xYdd/PAfoQJwRgKVGJQL3Sy1z/uXmjzrCcO7xFBRUSboVZElz10h1gMiXaP9lOY=
X-Google-Smtp-Source: AGHT+IGBnR27VGfQMEe9XbukzuO+Niz0LgdSm2RCyK9hj8HK0I/R77m76o+RSPftIZuTUblDzhO5pg==
X-Received: by 2002:a17:903:22c8:b0:1fb:9627:b348 with SMTP id d9443c01a7336-1ff048e192fmr131200085ad.58.1722286811944;
        Mon, 29 Jul 2024 14:00:11 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f71d61sm87341745ad.225.2024.07.29.14.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 14:00:10 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 29 Jul 2024 14:00:03 -0700
Subject: [PATCH 2/2] riscv: Add license to vmalloc.h
MIME-Version: 1.0
Message-Id: <20240729-riscv_fence_license-v1-2-7d5648069640@rivosinc.com>
References: <20240729-riscv_fence_license-v1-0-7d5648069640@rivosinc.com>
In-Reply-To: <20240729-riscv_fence_license-v1-0-7d5648069640@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722286807; l=521;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=/0pgqxhRJIH6MqaFTEW7nQC633eH2ip8Lz6S15hbvsE=;
 b=Z4Yo9qonTo0Z9Y86xe5MtcX7IBUuz8vdmBXyvTtc0DhQBdG2eFlfeqxLpW6Kfk5ptNTvEMRCs
 xHZGWKx+7pQBX1+wFwPH5F1jALi6lm+kdm1XcH7WtpLDJTUkf3p1L12
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_140013_322437_5F12C971 
X-CRM114-Status: UNSURE (   7.99  )
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

Add a missing license to vmalloc.h.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/vmalloc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/vmalloc.h b/arch/riscv/include/asm/vmalloc.h
index 51f6dfe19745..fefe94dc98e2 100644
--- a/arch/riscv/include/asm/vmalloc.h
+++ b/arch/riscv/include/asm/vmalloc.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 #ifndef _ASM_RISCV_VMALLOC_H
 #define _ASM_RISCV_VMALLOC_H
 

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
