Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C09C52D7C
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Aug 2024 06:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qst7upxLzxoMskb8f4znUVZbJIRscStcS/k7BGpTetI=; b=fZGWP08fMcTqTS
	cLC+uzAXWHUU7d7OHr6w3oJBJd+cSvgraCqpzr0CPV59iqN7i56xqUYrWVCsAADy8G4k911M6mtqZ
	WEKq2YOILtGTDRqN6Iiv8qtW60P6z5V1jNK7fabSdRIYQmleDaFLdmz7k74yGxTbb6n1TXHi3TDkz
	n/FQYe2vr1qFm4snHvRG5Fr+mhpJUUK1+ODLuXzwEfmYM+y+NjVh3viY2A8CjchUMs+SQtyr0nsVY
	OJrgvXcPIcK7vSKy/BVqTin8mhmkhuKgErbEu1lABTP985f2i+9N4M7NzN1XtnZ4O1STmaMNfj10Z
	JJXTJwRKYjg8p7OgvbfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfZXx-0000000GDEh-2irG;
	Sun, 18 Aug 2024 06:37:49 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfZXu-0000000GDCa-0i5A
	for linux-riscv@lists.infradead.org;
	Sun, 18 Aug 2024 06:37:47 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-428178fc07eso23515655e9.3
        for <linux-riscv@lists.infradead.org>; Sat, 17 Aug 2024 23:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723963064; x=1724567864; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=baf+ls/kqppHRVa4XBeUzS5UcHJPfW6ACwqFNpH2vH8=;
        b=xZLq+UdtsDEW2WDCXq13UMja7Vl3nFdPBn9JDuOhQL4j9EUPYdDQkKCsyDnwnsMZaE
         eZs64MlSzrvZbMpB05ssdmxcrAWsnVYKmBGEBIQZTT2dX/aXPT185ZyC52+xJjzbuULw
         euVUpICIn2Wd8FUJFENCf9/sLuuKseclLBk9VJLn2TKn5SIN+kFYRaxpYTUBnUyaxWt/
         qxk0JZmwu2p7lBRyj//iOJ8ZwLzGIhxp00tVaQRl56hRb3CdhpP6o2CTun4288OfniMm
         CdVUGt+ogWnYQh5K5yKUsUZITnLkkzjjZR5sUfR1cbRPExfb4aYS0zP5rw7FgepNzyty
         60Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723963064; x=1724567864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=baf+ls/kqppHRVa4XBeUzS5UcHJPfW6ACwqFNpH2vH8=;
        b=v1wIzcYlP4l9YSXYZgrtvDgmzv7jWKPMFI+ktCtFVxyaWRp1wymC7bRVwu8ehQUOLu
         0NKYdUojFYMuuMptpyKc6ozW7rnjuRB5RwtVOqlq3pzY8ooqr0GGntm+aUkZgPvC41cm
         lscI2T2ilT0bIdZtPToVXE3Xclj7G54mN1vFcjQGP2yUF6W8ITDiFJZ1XQGX2eSf/X6S
         qLHUfA/2SSXok4zSp4mKDHtpYRca4tOq/Dq47JemAuiyTpDQPHnnVXIT3ABHpJk/9S6O
         my0PcuBd/8/3f4F6esuUcplfUyrrwlAoaqeCJPSw+A1g1rebhMCrlX73L3LqkO7XIfP3
         AiFw==
X-Forwarded-Encrypted: i=1; AJvYcCWCkqzqVZSkgof4t+BmDh23wZzoreG6iFzSl6XLoDUcWrJvam4nag+tkzmpop3fwISQoFiqQZI3uwz/kaQxqssRabqJ/7KcWCsWS/h4FZvT
X-Gm-Message-State: AOJu0Yy0mnbERwi0ume+HWBH0ZS0S3mSTiX3zdk6Qz0QXkpVvYFFV8zQ
	M7qOTI3deAbjpYsnjZ6ljOg34t3waZEkKVnFTSdraFv8sEc9eqQUWZosErzUk7I=
X-Google-Smtp-Source: AGHT+IGOB8iW+hQOXjQLAOh7AsPotaVJZqzzaXjL4GlISP37ETZjWU8j89260z8kTNAIQ1PuXHkP4A==
X-Received: by 2002:a05:600c:3b1f:b0:426:629f:1556 with SMTP id 5b1f17b1804b1-429ed7f9224mr53506085e9.31.1723963064325;
        Sat, 17 Aug 2024 23:37:44 -0700 (PDT)
Received: from alex-rivos.guest.squarehotel.net ([130.93.157.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded7c93esm119862495e9.41.2024.08.17.23.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2024 23:37:43 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 02/13] riscv: Do not fail to build on byte/halfword operations with Zawrs
Date: Sun, 18 Aug 2024 08:35:27 +0200
Message-Id: <20240818063538.6651-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240818063538.6651-1-alexghiti@rivosinc.com>
References: <20240818063538.6651-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240817_233746_229526_0A926B1C 
X-CRM114-Status: GOOD (  10.08  )
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

riscv does not have lr instructions on byte and halfword but the
qspinlock implementation actually uses such atomics provided by the
Zabha extension, so those sizes are legitimate.

Then instead of failing to build, just fallback to the !Zawrs path.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/cmpxchg.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index ebbce134917c..ac1d7df898ef 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -245,6 +245,11 @@ static __always_inline void __cmpwait(volatile void *ptr,
 		 : : : : no_zawrs);
 
 	switch (size) {
+	case 1:
+		fallthrough;
+	case 2:
+		/* RISC-V doesn't have lr instructions on byte and half-word. */
+		goto no_zawrs;
 	case 4:
 		asm volatile(
 		"	lr.w	%0, %1\n"
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
