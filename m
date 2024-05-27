Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C3AC25B7C
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 09:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1bTFxWxJNDWABIMnC7kMfmPo6eOkLIKNKhcW7p7gK40=; b=4NKoFD3A5rjCIP
	uSKprGMD259oYqwYVWiKedn5Qgub8EvUfbXHy9KTT8S05aoE05NTxpRhiUNuzd6wfoqrMa2WENb+k
	1iCYeUi8C7Rp7NecrU9X6cTYC6biuV5r5t6TMwZ8tS9hhz4uNOoeAMCXR15aUgsuiNLc2rw2KMuI4
	uSpUlc4Os09egPgCDMTElB+1VMb5y4pBKydDhMc+V8oYbwGegLHozPypgRYOLysp8axdFTFtgOOe1
	1CE2WnScKrM8pBVS78/DIoH9FGZhW/wP2+YLaKmg/CqNvF88QTMeKIvRfiNq2Gmr3a5mbo9WwjVQr
	HX9VoFGF7RXpJ4MQMnWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBWae-0000000EOFP-1V4j;
	Mon, 27 May 2024 09:24:24 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBWaa-0000000EODJ-3BXW
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 09:24:22 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2bf5baa2773so2561595a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 May 2024 02:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716801859; x=1717406659; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c+i4h0MN+pB0f65UZyFLyAqmTtwAUNXrnLqCFrIoIwE=;
        b=QQtnW03B+TlmO9rP1aU0H/pnSPNGLCzQjh3tZdINdYe6ARxOSzTiHPn5iVPttxV8vZ
         IKuU2TOaU32ISaaSuOxXtU8zsChZohz24aSH7oWw0otVF7S8w9Op2UbAQ5GCUT49jnkb
         Yoy/oxELtwE0oO2bRbCx8b4PLJAY5j6x2p14e44PG+0L985pMLtuJdhYZUDFg6Vh0VBw
         3Fo5LE26VCDqlEZ0B80PCNrlc9WoMjHVnH6W+mLJG3//x96ho+9+EmhGL1JVbSSe0hem
         eT7OniMiIrOzPhxkjiQLaZ259PAUr+S8s9SdIVTZZRTdseHqcmPEwyJ1E0PJzn+ZGLh2
         zbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716801859; x=1717406659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c+i4h0MN+pB0f65UZyFLyAqmTtwAUNXrnLqCFrIoIwE=;
        b=hajlhO+TRE9X262Emel+2eX2o4u6j/z6KMaSv6FEIS4dWchr06eVIAIvgbYt9nwNkk
         1JaFS+a3tTDUaEOd+1E1klFVRotLNT0jc3qpWQTUZBV8WhIgD+pOMbDN93VBo19x7Ujr
         lUK1H96XMu76eLtkLLRxskaRAyoK/YCD+mQbn0pe41/fqAQuPp8wso8CEPItpFQrsjhS
         OAzNLhWJLomEAtgWa8DNpYwdoVFvrHLC+3CuXxH646D/xbYA/Jsr8+nrCbSXsLsyIfGR
         2jvrPJDPthsozD/K4xGq73hD9AEpZuq/0s8uhNIeTGCM0MshLz3QNFI6x2NOsoos4j0y
         0C4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXr/qewtVp7LC8jH/+Ht6hMxBVudYuvNcjEtpjZFvljGIcuc4c8FLJo8yNrU9yJh/0si98YOnjBnU707zXItagj8hpwt3wg4OmnkEHnWzqg
X-Gm-Message-State: AOJu0Yz/xGGkHO/QwPDvQoUZAy/fxyGPDiRB7JaNYIxG6fvJcZXViB95
	L4lbFirVqPrO/cP9mP/OPsj77AJSEhpi49RAC+tmLxONs7NzGMVy
X-Google-Smtp-Source: AGHT+IGaW8y/BKut1imkBHJDLYE2ZbsYu38F3pmTipGIQ70gSyDKYHEKT1c3gOPKMlk+e79kTGbVtA==
X-Received: by 2002:a17:90b:374c:b0:2b1:82f5:278c with SMTP id 98e67ed59e1d1-2bf5e84ac4bmr8228004a91.8.1716801858556;
        Mon, 27 May 2024 02:24:18 -0700 (PDT)
Received: from gmail.com ([2a09:bac5:6249:183c::26a:4f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bde008a188sm7059830a91.53.2024.05.27.02.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 02:24:18 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Xiao Wang <xiao.w.wang@intel.com>,
	Qingfang Deng <qingfang.deng@siflower.com.cn>
Subject: [PATCH v2] riscv: lib: relax assembly constraints in hweight
Date: Mon, 27 May 2024 17:24:04 +0800
Message-Id: <20240527092405.134967-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_022421_174718_DC1C0150 
X-CRM114-Status: UNSURE (   8.82  )
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

From: Qingfang Deng <qingfang.deng@siflower.com.cn>

rd and rs don't have to be the same. In some cases where rs needs to be
saved for later usage, this will save us some mv instructions.

Signed-off-by: Qingfang Deng <qingfang.deng@siflower.com.cn>
---
v2: updated title as suggested by Xiao.

 arch/riscv/include/asm/arch_hweight.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/arch_hweight.h b/arch/riscv/include/asm/arch_hweight.h
index 85b2c443823e..613769b9cdc9 100644
--- a/arch/riscv/include/asm/arch_hweight.h
+++ b/arch/riscv/include/asm/arch_hweight.h
@@ -26,9 +26,9 @@ static __always_inline unsigned int __arch_hweight32(unsigned int w)
 
 	asm (".option push\n"
 	     ".option arch,+zbb\n"
-	     CPOPW "%0, %0\n"
+	     CPOPW "%0, %1\n"
 	     ".option pop\n"
-	     : "+r" (w) : :);
+	     : "=r" (w) : "r" (w) :);
 
 	return w;
 
@@ -57,9 +57,9 @@ static __always_inline unsigned long __arch_hweight64(__u64 w)
 
 	asm (".option push\n"
 	     ".option arch,+zbb\n"
-	     "cpop %0, %0\n"
+	     "cpop %0, %1\n"
 	     ".option pop\n"
-	     : "+r" (w) : :);
+	     : "=r" (w) : "r" (w) :);
 
 	return w;
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
