Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFA5C369CB
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 02:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xNf6pMZrMt8ms4MAMfhG/zlX8kSuAWgrDqtC6hos2fQ=; b=VQ5Thed2WQK7dL
	8V2ewLyZXNGTZE5tt8iuj9LGWZnQ2IY+9+Y8X82pBkd/iHo2Z6/h4AUKNxhgwO7diIO7a0f4WQooS
	cMPYF5TrAS/Zl5ofHan0nD+u9lra/fgDtzOzY4DtpQa8BbEEXm+AorXI4SlqhT1IFNJx3pYABIm+h
	S4S3ZE2ZJpnU2gIlrOHswRLDsuzAQUsMf6uncZ43Zp6bAgUyVhYKFul0aGiBKGIvNwZD4sKSbT9U3
	EXVI1htjaylBNS2wFodzDWgXUA3KR1+n/CRFJkD7TGzZDqaVz80fANwwYPm0aenRQMk9wlbOW9Llk
	w8KghoZ4CAaIRDtJv1Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5bUl-0000000Es9X-1Ogx;
	Fri, 18 Apr 2025 02:30:23 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5bUj-0000000Es8d-0iSl
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 02:30:22 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb3so1435785a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 19:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744943420; x=1745548220; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Di4XiSgh+BQAH0MOm1AlDsADVyTkQM6H/o91uhBRMnI=;
        b=VMiMG13ByOYXS+8iqYepcfZMTqvEFUszJ6UJ74W2mA8idN0NILnr1vNEjgB64XKCv0
         JrKIVp2J7SB6dSjE6v8HcJUtxjQiDZ3Vu87Bg4ynhg4N9fQ5haVZv08i5xyn/6JDU/6I
         Nv/JlLSv+1w9UP3+KesCVwt/9EJi8as++7+Ju1cB//W3rKq/tfnVAUmn4IjJhNvQFhTj
         HY9mjUPiuYQo//5UEw2uy0ifnyIKaPvsfRsKyQhJ2BORuLIruautJjJQ6IoPypkILqy3
         7NBHUdkAMxRrmQkjmjfUTnUy7Wq/MFQaKUssrWqkGUtPWwiPMYtcwOW3GNAQDk5cflRc
         0XaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744943420; x=1745548220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Di4XiSgh+BQAH0MOm1AlDsADVyTkQM6H/o91uhBRMnI=;
        b=HfYNXbrTOEvLCbgHaAELILosuKwaZWDduqg+AbiDBqc25luwPvpV19jjpp50WcOUV1
         vSsKeHiLaryjJDulLVqBBbxT7JwKQQJNrwPdXwYkl/DL1FQO9c4liimsFZIdlygB4cTG
         v0TmUr1NmRnGORMSeNs+UG8Mo8AJXG9wGkyX21jEjKICmDqpOftR6TFjefdpxj9EVwPn
         VPA8P33ZUvKFay/kHgtPW07pqVZzW8kL8pRNHyCFOmAvJKmIR+XvK0nnEUdVa/BlsAT3
         9ep/xhBqdqrpZ0EDDGid0wfaSA59obrWsYEvEO4Me+U832wIym3AjV6yYdxrYnFjoEtY
         i7pw==
X-Forwarded-Encrypted: i=1; AJvYcCUMxg1vcWP0+aKoNE06PU+V7mahRJQ4b9wvJBi3PZ5AB6rIi/nsjvppY4lfgkLTQtTYBx8P2MhxwWdFTg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrEIJMyKG1FnAzcrqD2yo71NuP5V8yl8aR+P3af02h+B1VrUWd
	jG5qv0zEDZFG/XfTuZXMo0hrHFh5fObXG3MC3zOvjkWT4QGcr/g2
X-Gm-Gg: ASbGncthrL3+Lex5H85OcfrUCCehkgkSnpc8LQqpSTWMr0yOeq000jUTGn5G67J8I2K
	gtAdzslON85WahN3TEhWEVkH/K/6+Igsd5GjDJd/Yef68dDOqoaMEvKBOCONsX3YKRTmYdjxC/Y
	r8zY07qpkmJqkTy1R1GAOUX6t0fv2nl0+mId5WAYh1t94OWW9Vh6cJebJSRf4DRBBXhN9G0DXwo
	GCMVYtrRY56YP8Wv0I5PqlMMACm2iNMnRt9+QJIljp/FhoKgHmSWKjKZ4LqRHr3o4MlIDJLiQAa
	XfXa/skbVsnUOWGowBFRXmqdcb5eWjbnn8k=
X-Google-Smtp-Source: AGHT+IHfuBCji2IgYL4qWKeIl+Mf4ci+4eN0PNXn0HQ2ZC/Ai+XLtuBn5UkQyieYdRDC8QxP4CcQ/Q==
X-Received: by 2002:a17:90b:51c7:b0:301:1c11:aa83 with SMTP id 98e67ed59e1d1-3087bbad714mr1651155a91.28.1744943420171;
        Thu, 17 Apr 2025 19:30:20 -0700 (PDT)
Received: from cu.. ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df0c14esm182185a91.19.2025.04.17.19.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 19:30:19 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Longbin Li <looong.bin@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/3] dt-bindings: pwm: sophgo: add pwm controller for SG2044
Date: Fri, 18 Apr 2025 10:29:44 +0800
Message-ID: <20250418022948.22853-2-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418022948.22853-1-looong.bin@gmail.com>
References: <20250418022948.22853-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_193021_210225_8378E655 
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

Add compatible string for PWM controller on SG2044.

Signed-off-by: Longbin Li <looong.bin@gmail.com>
---
 Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
index bbb6326d47d7..e0e91aa237ec 100644
--- a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
@@ -17,7 +17,9 @@ allOf:

 properties:
   compatible:
-    const: sophgo,sg2042-pwm
+    enum:
+      - sophgo,sg2042-pwm
+      - sophgo,sg2044-pwm

   reg:
     maxItems: 1
--
2.49.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
