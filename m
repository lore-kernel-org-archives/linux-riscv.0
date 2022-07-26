Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA414C04A68
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jul 2022 17:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1g1N3FV553lce3d/7EEKa1ttF8FD2dDSKo/gqEvveWY=; b=siQqUt3qG0mRR4
	V5rpJI9ZXwhR74DRq+nSy4P9MrZl0Yp/Gs6H1THt77hAiiylVafo4mF4ELORVpkxi1K9dq2kDmeae
	AAPRYXrIbgA+mo3HCcHSXQh245xLbaDZrBXdGIdJ09nlb8u9P7d5Cdn8+dYiXWajlNfuguUTpF6S6
	N1K8+YrLzMTuJxQ5XkbqmeXPztRpbTNmXw80Kr27btptwHewSR48FqmBx3Hpc92gg2KH0czZiHjRz
	QQ09KyiPOlTEJNUPbI6io1VreXQx1tbxI24TUDlOOtY3TFc5smocIdnQ4+2pPNSYcq7bic5oL64Gg
	MqJGOtUbbZTQpNanFqgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGO2O-001GCO-Jk; Tue, 26 Jul 2022 17:08:04 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGO2L-001G9J-KG
	for linux-riscv@lists.infradead.org; Tue, 26 Jul 2022 17:08:02 +0000
Received: by mail-wr1-x433.google.com with SMTP id q18so10618956wrx.8
        for <linux-riscv@lists.infradead.org>; Tue, 26 Jul 2022 10:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bYJZAGYDWBMT6g6cijNnHNizMWzKxFhdHEezep+ZyM8=;
        b=JFg1dFPc3aCGDcZqQP/YmQ+ORnEAFxNTUqKD4xP2JSkkRiCAG7wPPGNJAY9a7T0Bi5
         lbT/nHrUl9oxPbeYHYpArtD2weheB51Uynj4CrewODHCh4i/2Fn9ytSZ23BEYUXqy6qn
         eg0vfOgO/RE5D7Usial/oeuuleip50PkC49Ec6N0l9dz2uDVhG/aVF4Qfz18lKfssm2v
         A2VLmR9zMqkYfvbi0YSM9GkRvjtywJXAMiKfL+GlhwZJ4qbs7Op8Vhk7m/gZNPpSoOaa
         F3XPF71x+fEpaw/A9zR/1beKiAGNW5WzymfAnnemm878U3duUOjbYW1EGVmaefthEAes
         diiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bYJZAGYDWBMT6g6cijNnHNizMWzKxFhdHEezep+ZyM8=;
        b=QaDmE85D2fJdOzv8hcVPHTmwafJoRTmPMoHsCZyy1zYZ7onVTR1ohNDnWmV8paLy34
         fZ4EHM7BNEK3L8XxWIMKwToo/1zMDyU5RLqBZLY0KVT6+Ls2Z0QXCR7C9I7IjGzAgTZK
         olLINTDhqIY3uE9JNwp1gwCg25p51Gu35iFDsbMoG5d/rhR5MlZ6rQ9S7g7UspVCjF+m
         76L3DG3YcLUWFgg8Meq4tv1BtuTcWfIfIApvgTAiHiorFpaAqJJkOkRF8tsValgD0UL6
         6NmCkJAMc+8Wdra+z+u9WYIbb4UkchGzBqFL6KkrSRQvwfiYrOtcgx+bYrhpUwVktOM2
         7z+w==
X-Gm-Message-State: AJIora+XLl7YTbW6t0l0OOMwXsN1fp+xUkkIfHA5XLRgvB2orHGKvzfb
	lIZRw5LhpFDnFZGBs14lC+xotg==
X-Google-Smtp-Source: AGRyM1s6BYK8WW9ORA/vI2Ql3Ij0kc9HdxUUm/7aljKXohKq8ulI7JwqqnPKXbr0u5sk9KEbkVlC7A==
X-Received: by 2002:a5d:5986:0:b0:21e:811c:f688 with SMTP id n6-20020a5d5986000000b0021e811cf688mr8824688wri.8.1658855278124;
        Tue, 26 Jul 2022 10:07:58 -0700 (PDT)
Received: from henark71.. ([109.76.124.168])
        by smtp.gmail.com with ESMTPSA id r17-20020a5d52d1000000b0021d68a504cbsm14859618wrv.94.2022.07.26.10.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 10:07:57 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atul Khare <atulkhare@rivosinc.com>,
	Sagar Kadam <sagar.kadam@sifive.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: sifive: add cache-set value of 2048
Date: Tue, 26 Jul 2022 18:07:25 +0100
Message-Id: <20220726170725.3245278-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220726170725.3245278-1-mail@conchuod.ie>
References: <20220726170725.3245278-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_100801_684588_E6E480BA 
X-CRM114-Status: GOOD (  12.03  )
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

From: Atul Khare <atulkhare@rivosinc.com>

Fixes Running device tree schema validation error messages like
'... cache-sets:0:0: 1024 was expected'.

The existing bindings had a single enumerated value of 1024, which
trips up the dt-schema checks. The ISA permits any arbitrary power
of two for the cache-sets value, but we decided to add the single
additional value of 2048 because we couldn't spot an obvious way
to express the constraint in the schema.

Signed-off-by: Atul Khare <atulkhare@rivosinc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
index e2d330bd4608..ab6043d9cdbe 100644
--- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
+++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
@@ -46,7 +46,7 @@ properties:
     const: 2
 
   cache-sets:
-    const: 1024
+    enum: [1024, 2048]
 
   cache-size:
     const: 2097152
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
