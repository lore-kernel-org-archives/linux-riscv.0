Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F4BCD6E4A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 07:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F6GJqiLBuJCebayYlO1fuJgbcbJrLWz9w2t1zCXPSYg=; b=rryUcbRObJ31NQ
	zT7v6t12vDowi7MR3erjyOLk+sYiZsZU/cWBvFMEVb5DSgYysZQGY/DKg8kmH+2TlbQJqb4iO0U5J
	FQCCDONaRGLVu6jQRdJe+0Xn3RI9RJxyWg3BiaEeDB+G7w6yFuw+Cv0tEJAAHJb559ZYdqQOHvVOS
	xvFCZ/0ss5+v8B2X1mH3MRWVtNhKseOTCpFmgBDzpxZpxlEr2op35efbTLsoC0qazCqy1dXyhP/Cs
	RQ6/PfClAGq8HtdzWiLHCSmJO1Tr4w6w6s5yABlW6zrGauwMPFUTLBv34FN5IuVLaPA5/Wlad3xU5
	A/cqP50ubxrTTfvBTcwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgG0-0000000EVCx-3vBr;
	Wed, 03 Jun 2026 07:43:20 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgFy-0000000EVBQ-1v0h
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 07:43:19 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8423f1e2f8eso2591943b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jun 2026 00:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780472597; x=1781077397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjWZny3fo/wBnNwX/9+lDVbtn9cYqFM4uHEPeKu4K6A=;
        b=Jf6Gy1bsyFcsUgNdjnfNgDoRuIFLjX10WBM32oFCgTGj7Bmy/U7gkbvHKgNwfMxQJo
         1Rkx9xLkTq1irgMvxS9B9VKTCrOXT9azR9+lwiSZ+PARJQSibmjW6rwTIMULk+RFUlMZ
         wzmHIjT7oYpNl9xtoRIyYLLwN7H2I1U6oEemIOGxaOiGuxMD1Yf6gqshBtQhuO/Nr8B6
         gtg9tCYPrCr4Zr8tN8mV+w53YL0ggO85y8oub7xIRKd2AVlRZKCXloAK80pj3rQbdzSl
         7jfeMPIVM24DvGJAEcyIF5TW7QP30vaV6EyvMy88hbmknoPSu+/bmi8kyPTSsUvELwa+
         90QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780472597; x=1781077397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JjWZny3fo/wBnNwX/9+lDVbtn9cYqFM4uHEPeKu4K6A=;
        b=XUpy/dzizKu8y9p/KEuB1SXn8HPWuuVWN+vGHxoZMVvKGYaTFlLjdEjuWdfpJBQzjV
         Eo2pPsOkzUIrPImlYNtFfifn765oWKIUGxXDiXIH1kkjgykGT/S4DdaiCWxiqAGyt2lc
         bCY4a9OprMryEEC7kmWG+8Dd8GwRSP5sJrkHx9Z10ilwurQdpMsC5KI81WD/jkgZlEwd
         u0dywD1cZ3hmxtRjJTMDQG0FojDYRDAOnMLOTelmkUbSMLcrF+Gmyq0kJDNL7hr2gMnk
         eKP0IeSeXvYX3IIn7xnVXsLvwfEdCaxl55woTNe+oAYqPD69mefnMOocWfedM2IeEPgp
         3NvQ==
X-Forwarded-Encrypted: i=1; AFNElJ8YusKjp3XYZg5tMpL8FZpDuawhbHRmkJ+2OVooLaQpp23Ke80AS2MtfdVJY+lhX9Q+T3NyqWfsm+en/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxI+psHjiZAzlK+S3ifFto/D3QMphCxbDwl/doBpPW0O9E+0sJ5
	OteJC+ddMUAEJYXJ2XN0GUHhiZGk7l+vNANN26IIEjYdtK5+wttl4JNy
X-Gm-Gg: Acq92OFs80A7xHJrDOhBZTy7i6UAqy/aXVod4Mx72BGTrETepQSlwdCIfk12ibZxiJb
	YEmHcsFBBd9VxUu3nGE0SGGVPg6nutWCGnwkPnyhMs5mv2+RRlYvFy4SZ368A0T4Bnl0bj9rXrQ
	yzFfl9OOKdUngjEjZnWqJwlHFAGZIouD4Zc+sL8cFgLXBnI63/0fb7R93EwYxdHoZWZl0mdR5M3
	YBKimswwud9JNbhsD57qEen3c19CC3NGjNtLSPi+ni4UuKz90wV8Yo7vzb2ssPm5Ev+Z7AXR1/j
	htmb0UH8SQtI42jD9RVMHjl0CkPFq0ac8eFZrtmgIYIQcxYozD4ylQL0GR1s9CGTqeCibU4g0Dj
	YxUhjbmgGF0+Z+NlGls+FyFyeqrAUmwGJWip2ALI1xAxUWcy4sTbEZQZI7arF0nnQuUBYoRaw+x
	YRYeCKv2J4tJ2t2Aan8mRsbP8fR4veUbsAC6KO01EbQ4n3qKRnYNQPH5N/bCGPVDTw0zemKanFq
	v+0A+TOw/uHsRTGPY4yylFjRRdqCUL7/Vf7X1BLQrWyD+spkN7zZBJMsGHl00sg
X-Received: by 2002:a05:6a00:288c:b0:842:6e9f:9cd with SMTP id d2e1a72fcca58-84284fafa22mr2316123b3a.49.1780472597647;
        Wed, 03 Jun 2026 00:43:17 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828daf76sm2161223b3a.42.2026.06.03.00.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 00:43:17 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Drew Fustini <fustini@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 5/7] dt-bindings: riscv: add Smrnmi extension description
Date: Wed,  3 Jun 2026 17:12:17 +0930
Message-ID: <20260603074222.593243-6-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260603074222.593243-1-joel@jms.id.au>
References: <20260603074222.593243-1-joel@jms.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_004318_505825_301276FE 
X-CRM114-Status: UNSURE (   8.81  )
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

From: Drew Fustini <fustini@kernel.org>

Add description for the Smrnmi extension (Resumable Non-Maskable
Interrupts) as ratified in 35eb3948bf0b ("Merge pull request #1492 from
riscv/smrnmi-ratified") of the riscv-isa-manual.

Signed-off-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 2b0a8a93bb21..3e3b4481724f 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -193,6 +193,12 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: smrnmi
+          description: |
+            The standard Smrnmi extension for Resumable Non-Maskable Interrupts
+            as ratified in commit 35eb3948bf0b ("Merge pull request #1492 from
+            riscv/smrnmi-ratified") of the riscv-isa-manual.
+
         - const: smstateen
           description: |
             The standard Smstateen extension for controlling access to CSRs
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
