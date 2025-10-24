Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AA4CCD1AB
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 08:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hrZTX8O/mF9ssTUZbrQq2vmv/5oZpMzzd0jt+OrrlE0=; b=R65zvT3AWZcGwt
	ssg9Is53Eqn75Yk1IYXEcBNz5X4GGhW2CJIHUVryYEtTT0VYlQskhMOQN8u2j8njAEUSLe/ypWMm6
	aeAmjnU+35ooAm7CRCDQ2LBhCvfmfErhooeSyFa1T4kOETD8EfEgzm+lqc55F7ClOpno9nErki0Cm
	wxrWJxxQTa/oPhxlo+y2IBYGaOq0MFA5A107xMCbsBhB4XiIYVqiJHAULbeAsW5DtcCRp8J+dUYgr
	Zetus4cbqGYFyv4VBGiKlDA7GaeRv6cuOa00Tida6+KHM3X32qfXPrQG4+sAS9qaX9vFnwsS3rJx7
	WMTXBV8BF4CJ7t2u4UgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDIM-00000008jl6-26me;
	Fri, 24 Oct 2025 08:37:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDIJ-00000008jjq-327z
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 08:37:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761295026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iSXzVZNzjEJV0QCm7fFsQIpGaaXg5MfSXavQS0cQlLY=;
	b=F/ADGuuId/LPJz6hnmoY8jG+ZM2iDMdb+h7YbELrhtJ6J1uCRF2lej/gxSfVVBFxhl8RUS
	AwgzEZXPqcomrIuqJdeC45S8VVqiXKLA0LbpYKzODnvP+YeGg7yzdhn4TynWZMdffe/Fxu
	5w3ZbGlTFpXWaNYkMVSYGLE/ZhTKems=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-puFzSEMyNR-eG-99DGtuAA-1; Fri, 24 Oct 2025 04:37:05 -0400
X-MC-Unique: puFzSEMyNR-eG-99DGtuAA-1
X-Mimecast-MFC-AGG-ID: puFzSEMyNR-eG-99DGtuAA_1761295024
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-426ce339084so1758110f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 01:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761295024; x=1761899824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iSXzVZNzjEJV0QCm7fFsQIpGaaXg5MfSXavQS0cQlLY=;
        b=ii3sP4kpJKq4ZMVXXYdyDPLERtllCNm37dIFp2cKUSwycEMgxO5wwvn7IgesUfWczR
         C+5a44Dp6Knj78KlFyZLIBiuDGgJc8lbvatdU7FDBK3sexVWla+Ubr3Vn9W2s6uZys6m
         bGxEedWtgBoClLw8jS6OlcfhL4Rd075oAH+HoE2tX88kpUHre2XUceQfMXazz+TJOLDN
         prK19GxEYdh4Sf3Kd3kVHaDUCTb+XQ3AcUd/N56VvZ4qiVqK14sZ3iZw0+UTNXZcuQ5Z
         hu+y9QgOps0m5lCcEEvLBjLpc0fWWrH4fB98QR6tZllKoMQ8hDW1mXQo3a/pa1cmAjt1
         wLHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmQgLs4b8yI31kfc9CMwfJWMOp3DMOTbZd2wZceaI1MYvpLIsB6SrLGdKg+WIDGNSnOsC59qS2FrbeaQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz7tlF3WMjFF8Fg2pF9CwsRpl5MBOTg0idZGNS+6T52Q1QYOBp
	QRzFuhkgogukX0fAnrbeN7MS+7p94+iPKfXmKtkEVZxHnqxQY7UwI9mzYn35jJQjFb5IKvJdFQ0
	MlLRX6Q22l6KNxSbNxt7rT30S95vJtSlHZ6BBnZNrZTfOIvqPRQyjd78LUsHROIZsifFZww==
X-Gm-Gg: ASbGncuTYdgAXk0ae4nBhnifmP7SL6MiKYIGKdCQeoWy7I/5ZQtPD5A5t2XAsfj25u1
	ZWezHZyosXUJewuzm1RCdM7Sznz74ROyIfVFPNE2f/tzRTXLVbq8zNwY4cRmk9hhXMFFHDOTKq/
	m7zz9i6gNXnqidkT9gRlWlyvSoiKuOMtMCaWNewxx6/Mcp2taF8PNDkKMA0DstEfxxebE2DphqU
	QlTTIXzTn+xzsNuzb/llxZtFpQNcbe3+tcW95DbcpolV9pMjqsS9hA3b6oxTu2ekG+eyw0r+vae
	CFJPVtGFJfUYVV+A/RF7CGeq+SBOkSL05vaGDlvJ6q1c/k+eJ8gO8reIpAbmT1NldqRQiFOZjh/
	QcqXiSjnM
X-Received: by 2002:a05:6000:2303:b0:427:6c4:f165 with SMTP id ffacd0b85a97d-42706c4f1b6mr19064120f8f.35.1761295024133;
        Fri, 24 Oct 2025 01:37:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY0EKEnZ5GAWosdAx/QCF15elBSoXEsoSC6Xm4LJMLlOxu9Uh/8Q5/RbZxyR8bBwU0Ijlrsg==
X-Received: by 2002:a05:6000:2303:b0:427:6c4:f165 with SMTP id ffacd0b85a97d-42706c4f1b6mr19064075f8f.35.1761295023651;
        Fri, 24 Oct 2025 01:37:03 -0700 (PDT)
Received: from holism.lzampier.com ([148.252.9.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897e77dasm8111636f8f.2.2025.10.24.01.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 01:37:03 -0700 (PDT)
From: Lucas Zampieri <lzampier@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Charles Mirabile <cmirabil@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Vivian Wang <dramforever@live.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Lucas Zampieri <lzampier@redhat.com>
Subject: [PATCH v6 2/4] dt-bindings: interrupt-controller: add UltraRISC DP1000 PLIC
Date: Fri, 24 Oct 2025 09:36:41 +0100
Message-ID: <20251024083647.475239-3-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024083647.475239-1-lzampier@redhat.com>
References: <20251024083647.475239-1-lzampier@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: plCEou545MbljXM9DJxL9-YkRf5nzMMZSRyd3X51EcE_1761295024
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_013708_494600_FF46F0CF 
X-CRM114-Status: UNSURE (   8.90  )
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

From: Charles Mirabile <cmirabil@redhat.com>

Add compatible strings for the PLIC found in UltraRISC DP1000 SoC.

The PLIC is part of the UR-CP100 core and has a hardware bug requiring
a workaround.

Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Lucas Zampieri <lzampier@redhat.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 5b827bc24301..34591d64cca3 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -74,6 +74,9 @@ properties:
               - sophgo,sg2044-plic
               - thead,th1520-plic
           - const: thead,c900-plic
+      - items:
+          - const: ultrarisc,dp1000-plic
+          - const: ultrarisc,cp100-plic
       - items:
           - const: sifive,plic-1.0.0
           - const: riscv,plic0
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
