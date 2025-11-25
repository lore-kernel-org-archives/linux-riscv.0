Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCE6CFD36C
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 00:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0DNeirlz12tFhwvRggFaGbu6A0iPLC5OInhqIuH0mio=; b=H+CbYfS21Ig29o
	SW50sX7Ckkm7ZyEJApdANjrVYWcq40ihckhQjTC4h6CevOG0crupP79MxWbWEefEQZb4xm4UZGY8/
	1rA6oB9ItZKHDG/Gd+zj46EfE80TfDlpHeTx002z0yv2jzZdFQfdhTS/HOBa2pGgW+GXY/Bc1l9qg
	ItTp0CMKhUn6PaoFiSWPXllNzUAZWCUpGzJAPzsy+sfssNP9ZY0S0MoK/pWqfPkPnFiwZeCXIHnQQ
	Jg/T0tJCRszxf7AQ7eP+/Ej7Hg/kSb7IJPJa5rALGajZJz2j12BQ7QwdcBvMliVag3bn5VIpeYrY2
	9Ojzi64larEdTZvoyjfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNgbS-0000000CVIJ-1spA;
	Tue, 25 Nov 2025 00:08:18 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNgbP-0000000CVHt-3tMN
	for linux-riscv@lists.infradead.org;
	Tue, 25 Nov 2025 00:08:17 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-343514c7854so2546832a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Nov 2025 16:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764029295; x=1764634095; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kGSPyPEdMe2hYRbC7y0H3Sp5w2be+quD79Oey7f3TrU=;
        b=lYrF84+TO8A3Yq445Z4RCFcQzop7nNpbB5Wr1LKlAN4zSl9OAWnBTaDpboLHJb0nPA
         t2+OkuMcmu7WB6LBOVy8QSB9BvX/ECruRttroSjeQO6WKyRfhL2Hc3DRWYe77KgCsNio
         yB9C11StfCJ3pe5nIu56TD6L01xpuu2PdI+u4B73n8O0f52HVa+HlBw5vLdkIedqWkyq
         zyms/CEtkeUAqWXAOZzf4NkNA34nCJ51xsNNz4i5x18hoKgJYS/OxHOXp1NYWgih9ktg
         uy3Q0IfWSUPkoCPI2v9QCislC5bWHl18orZ/mFWtF7TkpUzIjzxayKXEo/HaanEeJpAS
         Dgbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764029295; x=1764634095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGSPyPEdMe2hYRbC7y0H3Sp5w2be+quD79Oey7f3TrU=;
        b=oEb18rXFHg2fqgQSfy6lK7SD9s+kE2Fy9f5AWTgKL/ME5AZDGiqOC67fjQV2/MmQ+X
         T9nPq4da0P6JEIbV98Lw9JfbkwCSST2arA4ijngGJJ4fW+EIdJSdIGMa6PeY7P4kQuUh
         vyHF57kGW/p6RzoAgCUPJX3pxvVQgwb6uMpPWNeFxUJJGNSACArurJHmqlYGRl/Fwevr
         V4NC1aJC2NZT5O/Keodcw8gATVQ8GpRsVMI3TcZ7911TwCAERWrB/bua9V+XRJIY+8Sw
         y9gEWqkQEhj3P/4D/6vM5lcif1lFRI76WvFQY+/z6NN4OUryW9miuYcNmV6YTtYgA444
         9w5w==
X-Forwarded-Encrypted: i=1; AJvYcCU/yjSREJtF1uQudDi4qfBe42dVd5mEFwcNAeAh9jtFHvhyeYFmokIoZnHpuO+ASwFxHUFABuOnbwMxeA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6Ud+HheFKYOgl8FeZLw3f4GX05fHHpmAQSE7DMljqxxox5ARR
	mYEXY68PEdwr8K5AcdorQLSCwozD8rF68pURkajPUQxV5rKcE5V5o4Oa
X-Gm-Gg: ASbGncuFkpyUks6tIV2hMtUCa6n5wZO/Ie0OE19ZKnU1f/rHZMIEv4n/r3qAr6IpAD+
	B47Av2DLP8n1Ir0g9KOJkLWPqagL0W5X1r4kXUvZmTjchn+/76F2z84EPpTBoH/7l6b/CXTeYdt
	me3LlX1puBCSQbodbYdsSTIwGu5UMFncnS6tLcnSSkWWCmiUow6EfGD5mf93cAX6vgI9H9pANqW
	P7BNb2j4b8gKkAjkphQM2+rcaHhIL0va0hj1ZxZm/16KbNtdZl1/Suw0tr8+41YblDHc1cZ6jqE
	DkoUXIHbutMCdbdz1f9DhfLXE0nc1ZOBwzQFzwBOnTB6BoaQKNEokG4T4vzB3AbbKF8booSHD3z
	zfDIe4TR6Q95tiUkoBvTYkyMYj2Vt0SW/OujtfCgS9kufzr/MbGpTu5OPYeNsvrcWr0DWp/CQl6
	sFZMZHRP9ES3g=
X-Google-Smtp-Source: AGHT+IH8dlq/iNsvrQVx45A0CKp5RNJSkYMe27VvQplnidAKg8jt6QQmBPDbOfZBMP0NxWJSEmtnLg==
X-Received: by 2002:a17:90b:53c6:b0:343:60ab:ca95 with SMTP id 98e67ed59e1d1-3472984ed29mr17267272a91.5.1764029294925;
        Mon, 24 Nov 2025 16:08:14 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727bcaf5asm14497403a91.4.2025.11.24.16.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 16:08:14 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id F2BF1420A78D; Tue, 25 Nov 2025 07:08:09 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux RISC-V <linux-riscv@lists.infradead.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH] MAINTAINERS: Drop Albert Ou from RISC-V heading
Date: Tue, 25 Nov 2025 07:07:58 +0700
Message-ID: <20251125000758.9020-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=997; i=bagasdotme@gmail.com; h=from:subject; bh=RoTRsQR8QOZcjS/5Ou7ehzURIYajHBN4Ad7WA4RYcTs=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJkqn2OmG39uOMBaxKPUxOShERKwqCh0veSXkD1utonnW HxTZqzqKGVhEONikBVTZJmUyNd0epeRyIX2tY4wc1iZQIYwcHEKwER2Hmb4py250Uzao6joS6Bk tymr4d/+zBr3WUo3TyXzFpnKXN9bzPDP8GpG58l1n8SWOSswtr/4l8zy2nrh02Kd7S0Wpx43f7Z jBQA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_160815_972277_50ED82D5 
X-CRM114-Status: GOOD (  10.05  )
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

Albert is listed as RISC-V maintainer, yet he barely posts to LKML
(only three times in 2019 [1]). Furthermore, there's no response
from him when I try to reach him off-list.

Drop him for good.

Link: https://lore.kernel.org/lkml/?q=f%3A%22Albert+Ou+%3Caou%40eecs.berkeley.edu%3E%22 [1]
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
riscv maintainers: please route this patch through fixes branch.

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f568b59b9bc1cb..f3c2ba82d150e4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22088,7 +22088,6 @@ F:	arch/riscv/boot/dts/andes/
 RISC-V ARCHITECTURE
 M:	Paul Walmsley <pjw@kernel.org>
 M:	Palmer Dabbelt <palmer@dabbelt.com>
-M:	Albert Ou <aou@eecs.berkeley.edu>
 R:	Alexandre Ghiti <alex@ghiti.fr>
 L:	linux-riscv@lists.infradead.org
 S:	Supported

base-commit: e2285bd4a46744768f2c8b0ee158495e038ed075
-- 
An old man doll... just what I always wanted! - Clara


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
