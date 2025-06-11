Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7607CC61CE7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rAhEZ1nHKTz6yEmu5PaSoPWalCOWsAEv3pgfjNiTUsM=; b=PHSpgmDO3B//ak
	Y3JHfBM+Ahvb5zWF8ctmh9Oo3IfuIu/lWwoVq9WNkElk+vB1I6aKafbzI5paTpSdKi8XOgDGRRmo5
	AFqGHZ3Qfl9FV8F+QBRDQTDt86md5HqO/GIjTupqnqAIgFiCQYzbr2KOQlSpdJLgKldDqSr1RkET+
	F9TdIZiy5VG4c0KkQRSJdfmC0C1lbdqcsgAvFJisNhA6V8RKjP9Rt2HSrmnCAlCW9BQkkJdz3SPVV
	zat1l3cA8XtEcqbpQcR1RS9r+PAdyztE5REO58utcIV2bb0/xutft7Rajj2jucvYf9VJPjSEotktd
	7Y7RtFhNDvVtNyFur9QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGf3-00000009Ens-1j3R;
	Wed, 11 Jun 2025 08:18:17 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGIK-00000009AQR-0fNt
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 07:54:49 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-408d14c7ebeso3773538b6e.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 00:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749628487; x=1750233287; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnz/0tuwhYz4DMu7YFaY4+MBrOn4ASwg3VdpZXlOjs0=;
        b=l5ObzrHMK7l+ibQmCLjtF2lHkuP+CIKHvk7XJXprJwBJ+V/7TctQwGi2dk4+gefb5R
         4mhjOIJ2YcwiYrRWJ88EgZR/BOlHhRj3Wfc7W+CeLLFocRjI5N/lCw4Ul7Ij6spo1QcE
         4sngguUXb3Rp9VYQ/M7JKpI1SFKHqgvZ8km+bA1EMOdieN5IqdAK1/aqyIfAZXWOiAS1
         Q1jMhjb2tUennNPF+zaOLJ45zYMf60PO82KfmIxXZqhlRGCsxWwZZmgKk47VvlEqT+UU
         0mgwLqjkuUD4TWHXTLD4LPgQqiSDI4aAh2EmyaUiusNNDR3FPvnI8fbVcEABAdJHDpvR
         Ik6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749628487; x=1750233287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hnz/0tuwhYz4DMu7YFaY4+MBrOn4ASwg3VdpZXlOjs0=;
        b=RxT4FFB8+CTRLbE076ncFkMqlRdRV3t0ZtvHv5hlzUIP3qKFRoZdpomXtSH3FNjC3l
         kX6oKYtjuvASPgomwAatlU73eD80VCU1YufHJ0jkLOpcOpuwYL/3loOruJXkkKKxKWFD
         sXHM8rDXViqQW71zEywRtm9DaekKZYVal3lbk3m7occWTxYlqCeKwsbM0OlxDBAQOhQ9
         jeLq9HRK/nkhCzpSHnoGUJNuewkGi8MuOxmC/p8ggxmvoIaAXSX0N6ciG2Cf/aGNrav7
         ZWnHrfPgtJBJMuAKBYQn3FqyuH0oAX/tn0XzgO/R3lGz2rXPzg9ctrzy8MNo9zRGTZVq
         onlw==
X-Forwarded-Encrypted: i=1; AJvYcCVHl+Me7AbqxcC/2reZ4q4uxK+rOpMrjDtsI6JXq5+uxEHj1NblPOUlqXh96kHTrAuPGLdR6Wfr450grg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwT7qTt7vEaqpndRQ4BE/PwrhxL8BHqp53X7i+FMXvcqOO7p11J
	1yywmlQcNdH12X6JOFEUiw2uOlh+nAy4dEKTrz02UCKRmHO3BTDYI9Zi
X-Gm-Gg: ASbGnctE+fJnrNcoFlCCNLh65PCp9sdpSqeLDph6AOl7gRkHP62h+mDMQLLAyb5T/0L
	+DDxGm7p0bft3B13PbS3FjmyXZ6tKMQ44Vft1FFkqJntxZNK+hNRka5IYCkcYlcX219QmKh10co
	UnCkLwKdeQYzbQyisF/okiFq8/Xu5ArIhJJl5/BAzFkMkzQV6RUo3pRQJt+ZxtR6T+gwK610NY2
	Xt5szaMqz4lbPq7/mq4f29KEd4tO0kQg2vY7VuGNlbvgYvv8jwj+W/2KjQ0sNIqLifS0/JYsbnQ
	kRFh7DiDVuHk9O9uDomEMno6KVnXkGZTAzdN+w==
X-Google-Smtp-Source: AGHT+IHeItzokrKWw9l9oyv6bnHcsz0dOO4Q14MZQ9wo4Ra1X7rEUiC3C9xPLLzARwfKUZ6RpDZSIw==
X-Received: by 2002:a05:620a:288d:b0:7c5:af73:4f72 with SMTP id af79cd13be357-7d3a89330ebmr320142685a.42.1749628475059;
        Wed, 11 Jun 2025 00:54:35 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09b1d1d0sm79736646d6.77.2025.06.11.00.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 00:54:34 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dmaengine@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 1/4] dt-bindings: reset: sophgo: Add CV1800B support
Date: Wed, 11 Jun 2025 15:53:15 +0800
Message-ID: <20250611075321.1160973-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611075321.1160973-1-inochiama@gmail.com>
References: <20250611075321.1160973-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_005448_196452_099CD4A1 
X-CRM114-Status: UNSURE (   7.65  )
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

Add bindings for the reset generator on the SOPHGO CV1800B
RISC-V SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
index 1d1b84575960..bd8dfa998939 100644
--- a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
@@ -17,6 +17,7 @@ properties:
               - sophgo,sg2044-reset
           - const: sophgo,sg2042-reset
       - const: sophgo,sg2042-reset
+      - const: sophgo,cv1800b-reset
 
   reg:
     maxItems: 1
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
