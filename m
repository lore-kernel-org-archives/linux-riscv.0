Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BB0C36010
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 07:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cP2N7hDXZBCahcL4WOAOQDO/2Lnr696LJQTKsTIavFg=; b=Sr7pt8UKAO9uRx
	HBtgx73HYyu742aKCifE0VWdgU29DPfDIM6R5aUCUqMv/FEQ215FloecJO/3sJij013Qw4/sAnmIV
	p5YcdHHp5BPJaaN66fhQ9r7nAeZWwjc7OeFbVyzZu9ymmmju9pjiAdvRT2QRUq+2iArZoco4ilXU6
	hHZykIdv59MW+2ZbLw//8rOmBcULeIv9xbreJfhkmaoaWQXIQ9IZLWJsx6kftTcpiivk/m44Dg5yu
	AEUHoKyWasKs8gEx7UyiksfI+DZzcL4KevuyQNrWa8829nt6SeM8ZC2ZAf7rUbslrl9cT8UkRLud1
	77cLRG2z+BNg48amzkCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hCW-0000000GqPS-1KCB;
	Mon, 07 Apr 2025 07:47:24 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gny-0000000GjmC-1e9m
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 07:22:03 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7394945d37eso3204972b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 07 Apr 2025 00:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744010521; x=1744615321; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CI7qKUSOHtPbHCZyNOWzBNGKwtih9GNqbp0jjFV0joA=;
        b=Ozw3u0KJAiXV4rF49NlnnuySmi63jnlfTPSoDtAPN3YY4wFsDLZc30we5YWkzBS8jm
         86Bx0mDhVqBdd/US1oHbYJstHjxVi2z+DOTxs6xw+rBSCVcZBypS8ORzKKfqUB0sh1xm
         LXmAZQBpvyI5LOgrpKYek+9JpVXfVeDggjZGpEA65pS5eZpOE8jb69iwrGXoqN9fhYYC
         idDDafmYb/2RqHyXEJ1zYpWh5lZI/u/I/yjq7GAsLjVW2ZLI9VUs21nq6sCJWuIUqTh7
         8j/Wq9b2jXnQzTpvn6rVjbeJzvXPokkSMNZDrTlcWMjx/gEUTOwucBcN9KqVMrEypQtz
         EQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010521; x=1744615321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CI7qKUSOHtPbHCZyNOWzBNGKwtih9GNqbp0jjFV0joA=;
        b=jXrw9eMcq0MRg1WMJqEjesTCRGZESqTusaO3LZdSvkRTtfBt+tkGj63uTfCxQ0No0F
         oAYVZH6YlpqJhLu4C7jZuSc5CVALk3CpYHpWtSlw/yT6pYvXkneUEN6rr9K4eUoSuJoT
         5kbrbHtRoY1DpCxCVWgbEYH68GMZxZM/DBnJQ8Ngy1zDA3YCzZy4ChfHpygjU69cDS6x
         aIo3zRkZYm86qlt67aqFOgJjZiCoNTjTiJyoCpPZoJPfHGSE01BrA57r1bOiohTW5urg
         Kb+lP7zoIRWJrKFxdBmtFhk9fyt7SDw6qZiK8UQNEkijhXr5TZxTaNSzEZOotsgyTMVr
         7UuA==
X-Forwarded-Encrypted: i=1; AJvYcCXzzSUcLgJ2157EIaA4pffperuZLx3PA6e6ae5dl6zFJM5vLyjrdrS9OTnYyYqPBFTk3S4p7V8/crqeNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyD8mJLSFqqaXaavh2NKkEKnrOKcpGCBufghu6PWntSZs6lsLGv
	bPI2NNoUHMQjMttE4iuDt2rieRgKvxaKAEUQ5ZlJGTWcnr/g5LCJ
X-Gm-Gg: ASbGncsuaOCKhWhEf646RzDQSIgwQ20rW+rvHsKlXWbYpFhIgEDnw9AWoq3wdzHj3zr
	O7MDzv0IAC+Ug/bXUAlJevq6tJD7rW2zK4uLiyX8Hw4SBrgWgoFRpP6htBNdSIWCM/0UhcVdcwg
	pd0WsNHwalVA3UMxpL/C1MGNwrFHCXsYV+ANpHmL0xMOC9b+v2x47ZHWMnnyfX2LPItU7E5cTpi
	IqS8O4Si5uQN33nAQuVaEamIln6WptxZ+jVGSQyb69sc6FS026KOiRCke57QTPfB8hPrwXOkQni
	zAHeYgtZryb+lpp3la0oD1y/VXxShw==
X-Google-Smtp-Source: AGHT+IHLMd65M2VZ4ZmW5RpiMvZX6zeOTv2NQAJx+Mj6d7lV/vM3+ZpmsTrMsyJbYOIWBOCs5g33dQ==
X-Received: by 2002:a05:6a00:2442:b0:736:6ac4:d204 with SMTP id d2e1a72fcca58-739e4855dd7mr13523289b3a.11.1744010521317;
        Mon, 07 Apr 2025 00:22:01 -0700 (PDT)
Received: from cu.. ([199.182.234.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ee60dsm7787598b3a.40.2025.04.07.00.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:22:00 -0700 (PDT)
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
Cc: ghost <2990955050@qq.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/2] dt-bindings: pwm: sophgo: add pwm controller for SG2044
Date: Mon,  7 Apr 2025 15:20:38 +0800
Message-ID: <20250407072056.8629-2-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407072056.8629-1-looong.bin@gmail.com>
References: <20250407072056.8629-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_002202_438601_19251338 
X-CRM114-Status: UNSURE (   8.98  )
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

From: ghost <2990955050@qq.com>

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
2.48.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
