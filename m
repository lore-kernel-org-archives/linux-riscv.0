Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FB5C44521
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 07:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fu51ccGKwF3LXbkHS5RvkCx6KPvdrwkK0FI/lhrZ3O4=; b=cgN9aFreRs12Vr
	ju07ySF300HgtytEtd6OyT3pBBVXn++6bs9Pe9Y0UHuHybaq64eU5ce8Qn2kwD0OTXSn6KFfHMaWH
	cXtYkNyoePlNem/+qRkPUlvTtXVjfwodchoDs9IsMUGndmLkRsq36CbMJ3R4u8elT2Dw+n0DchOOE
	xaplxWdAWFkqvgYp40LkJtty0HRzTXHTGhJZYE/qDS2URqd+9anX1l8TEju6pL1nbVo57qVFSyBHm
	g+0OsCyq39ftpy2b4O6LEemY9euWSv8qG4b0KrCX5LQ9K1puapvALcezLNAN1P1M+vRNwuViCr7hx
	xhEWPs5DHrDEU/4hbTIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliYN-000000066bU-424p;
	Mon, 20 Jul 2026 07:36:43 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliYL-000000066b9-2Ben
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 07:36:42 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-c9fcd903839so4859985a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2026 00:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784533000; x=1785137800; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P9ly6ZTzLYLZx8yS4TUkxxmSHINnr8BKtUdkBSO+x1w=;
        b=CpTYMbSsRd6ysnSo7qp9Dj17buuMsd3UPoNnfWBvh0CQthpE4ycMQ5ya1FCYr9s7F6
         OeFypzDtb2jNy5B3bV3sufiyuLpeq3IWq7zX+369Q5BnTc7dK6U45Aje9CW6uKjMjgHH
         ysjH22+QlNGLogg3hYCV3r6C4IwAdocpQedHqog2rFmpZSXMiN7J+QGsVYAO/JdQvRLW
         wD4JpLlPa3IegqI0SQECzRvsrYa8YYD4mUCg8wKWWLR9ylawRqg+hcCMJHaTxrmRfDuT
         osxd++c0ekXxZD/EEjUGTavIju0wT2TycCSwMIyIXqfEUlmqLWPyzzfhwSlyCYlC4JoA
         qSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784533000; x=1785137800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P9ly6ZTzLYLZx8yS4TUkxxmSHINnr8BKtUdkBSO+x1w=;
        b=T7xS3rP/L45COiJDeAVFL/fx/AM9oV4IUqdUy7AXy3F2JkaCnJ731cOsFOfCH8PbJs
         RIPQP0NRdnCPH4YeD9bW+1zEjmojkm7boL9ZXaVTA/bkyHyfGAG89NJXtjNUoECc+aaH
         4QDX7emdolfasAoXolK1EkwHdywfM88OTjKZusbAQclTLASkujZk9v/X0bqWJCiexZ7W
         88Bg8EAz9eltpAs7aw/vh2aSwNe/27iTOyBjGql2zxn6BPDSCqAjzd2Z0luZy2mOxzuY
         r47hsKMABSjcxeYn8AYUwsdvkUqxbMrv9VF93jJ/YWcEJdEt0olbc+sgdzJHmi33maSc
         H7iA==
X-Forwarded-Encrypted: i=1; AHgh+Ro9ZvuPs1g6/PtdtFxV0ty0U7LQuSCXp3kzNnU/gvc2sFbuNd1/3NFEocE/Si/sjC1X6DJ80m4MBaIgIg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqPSmbdjQG/ZLaUrMT//vs1qELb01l5vLZ+KNEIO82eAdae4DA
	w11KQOlBuQVrHbL443R5L+HkLLIs38cGkOgg++TCBdzLFANSBKqdMRIs
X-Gm-Gg: AfdE7cnxiUCUQ1UNccSZ6hd3EE5n5p+HCpedchQpTX7aUFO0aP+N+F3YPvAcMM6rM5p
	1KnxemQnal2xFPIRSNmXgUgwz3MfKSPJhOiyj40G17eLBHd8kt9VIx/n3Okht4eKGhRxgxIey64
	tW5FO60lP8Dia4DFAA0rXqRjYsn4TXDi7aTW/7ZbLw/+O8ViOtliRYrlUPGSCiC+Gl413JALzzL
	lq/iuJnmpz0TGIMMQLUXZPkkw6E61AqzSQqqZfIx3m9uGxYXCLjXTpiU0PO9gGTZyuieY6EogDu
	YvF6O6JxZ4RciT49odjfdH1B+95Ts3fflhYNPaXVchPSyEMewPzxF+ClEkoj9/dJ8qUwc4S+asi
	nN5Hst2qBMWEYsL4Vm13YgTbRPOe8lFglS7ka+lXnO3qxHMG5x9pFASN8eWvLZttGoT7wMMlUNC
	86Tcs=
X-Received: by 2002:a05:6a00:278a:b0:848:2f84:f42e with SMTP id d2e1a72fcca58-84c294d4dd5mr11703273b3a.71.1784533000555;
        Mon, 20 Jul 2026 00:36:40 -0700 (PDT)
Received: from ubuntu24.. ([216.23.123.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcaa0bsm5210536b3a.20.2026.07.20.00.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:36:40 -0700 (PDT)
From: Xing Loong <xing.xl.loong@gmail.com>
To: Jens Wiklander <jenswi@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xing Loong <xing.xl.loong@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: add mbedtee
Date: Mon, 20 Jul 2026 15:35:55 +0800
Message-ID: <20260720073558.799755-2-xing.xl.loong@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720073558.799755-1-xing.xl.loong@gmail.com>
References: <20260720073558.799755-1-xing.xl.loong@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_003641_567840_96257049 
X-CRM114-Status: UNSURE (   7.64  )
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

Register the "mbedtee" vendor prefix for the MbedTEE Trusted
Execution Environment project (https://github.com/mbedtee).

Signed-off-by: Xing Loong <xing.xl.loong@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d6..fd032a3 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1011,6 +1011,8 @@ patternProperties:
     description: Maxtor Corporation
   "^mayqueen,.*":
     description: Mayqueen Technologies Ltd.
+  "^mbedtee,.*":
+    description: MbedTEE Trusted Execution Environment project
   "^mbvl,.*":
     description: Mobiveil Inc.
   "^mcube,.*":
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
