Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B09C04FF6
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 13:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p/zfyYPs3NRzb5ygzSehk17IxFn9fEPv1gJHHsuiqg4=; b=wMoZE44JQXP42b
	u/si7GuLoZmdI3VxiVomo+HcJ/jmcSDVu2d0y4iRkNJMCObLYcICXyUk2/r/UdPDal9x8PY+w/Uuu
	/Tp+3FJQPuqUHEDaj6AhGVh4Gu0rej3b0gVgxW6EmRdglBQfPfWOPnn+CcmYRLmSHTZ7jdBMXtxrV
	alZ69XEZsznq7Pv9moEEAMeLH2IAhiOqli20t2en7Wp3uRN46D0TIE3uLs0tssasUwU4D/g8rfWju
	3TdhuFzOtqK7ZQAO4pO8MYTDF+maiLgAO+3uPhj4Q4DS5mKeRfiDGQQeyIE31l8Hf0Q+zdeuFw8Kw
	ZQhmKPNnmwFEsvEHok+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxogK-00000005pHj-1kXO;
	Fri, 19 Apr 2024 13:53:36 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxogC-00000005pBK-3YI8
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 13:53:30 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a55602507a9so244332166b.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 06:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713534806; x=1714139606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QyU/aimoOzYSkB0vjF1tWwNaGtFimVg7sebvXAeBYyQ=;
        b=li1F486KOdsN9ScsG9xpKe1gyjDOBtY7Hu5dCtLZlVI2QegZBc0x6eWuVaWypqkqGY
         +Argc9+Q9CgI9LORtR2jZ9Psqz7F5PQ0Wg9Me9odV0bK5c3AQTVE6kN7ATlq7xEDm10/
         OiQ3V+OC7AAN3XZXxLYqxxUgLMQ1LC/pP8rits5BP7mTF1JP3qapnazrdylAKtTmZB0P
         PtFjRJJTyNChX8kzEjP2sqdRYpZpqvSpthWTYWysTzAY+Uo2nbmTe5rtnGFws5eYUluQ
         nMNhLp+qC0atUOzT2JVhVATnWyfXn4dhiVhN7fVQfPFPgFm+gQXXh/vmqVPxdEzNqaWM
         blvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713534806; x=1714139606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QyU/aimoOzYSkB0vjF1tWwNaGtFimVg7sebvXAeBYyQ=;
        b=HznFECmZneuwdS0rOiZ9GSxbTDAKaac8dE6NbINqZsliRU+Ltj0Hz6hVZ+rXxnZbF4
         2FkGyIwYsdbsI0ddc3flK+lT/49N6eR5r/GQdoFRZuqevNcnFCvgbgcdoPnjWcKF2TeN
         ZSw3QlzLv+HMu1c2mZsqL6Te32TUritHlrrWAe0qx/CsQuIcNngzhErbrMSYGMNonpIE
         dN3NszfPLVnZEN/gdGQdv65gc+REmcvVNQXFPzqbt2DXrQrjrlqIWJ3kaUYcsTXDbCv1
         PJCCfTW234xA3N0TyaWB27HsVJqat8mK2JYVeqmzKP32NWDSo5hwEDXq6UKWQ+IejC6h
         kmKQ==
X-Gm-Message-State: AOJu0YySV+euLO/WtgMySq95qz+XkhwMwcyD+5g13pJwVXnjX8S1voE1
	dE68y+WNt2HNxuGGDf85s4kXINv/lsy13mAdVsjNjmsYYeUrO5bv6kAeayDJS6tziWeTyHZ5UNL
	FwhI=
X-Google-Smtp-Source: AGHT+IH1EO2N38+RgiFvRKbqHN8RMDmj22wsb5kJW4Tn71jZ275QZBl4gl7wrF/9ir4IqqZ9rzm1eg==
X-Received: by 2002:a17:906:1786:b0:a52:3eff:13f1 with SMTP id t6-20020a170906178600b00a523eff13f1mr1515498eje.2.1713534806253;
        Fri, 19 Apr 2024 06:53:26 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id s11-20020a170906bc4b00b00a522911e2aesm2213930ejv.124.2024.04.19.06.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 06:53:25 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	christoph.muellner@vrull.eu,
	heiko@sntech.de,
	charlie@rivosinc.com,
	David.Laight@ACULAB.COM,
	parri.andrea@gmail.com,
	luxu.kernel@bytedance.com
Subject: [PATCH v2 2/6] dt-bindings: riscv: Add Zawrs ISA extension description
Date: Fri, 19 Apr 2024 15:53:24 +0200
Message-ID: <20240419135321.70781-10-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419135321.70781-8-ajones@ventanamicro.com>
References: <20240419135321.70781-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_065328_947723_7208308A 
X-CRM114-Status: UNSURE (   9.22  )
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

Add description for the Zawrs (Wait-on-Reservation-Set) ISA extension
which was ratified in commit 98918c844281 of riscv-isa-manual.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../devicetree/bindings/riscv/extensions.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 468c646247aa..584da2f539e5 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -177,6 +177,18 @@ properties:
             is supported as ratified at commit 5059e0ca641c ("update to
             ratified") of the riscv-zacas.
 
+        - const: zawrs
+          description: |
+            The Zawrs extension for entering a low-power state or for trapping
+            to a hypervisor while waiting on a store to a memory location, as
+            ratified in commit 98918c844281 ("Merge pull request #1217 from
+            riscv/zawrs") of riscv-isa-manual. Linux assumes that WRS.NTO will
+            either always eventually terminate the stall due to the reservation
+            set becoming invalid, implementation-specific other reasons, or
+            because a higher privilege level has configured it to cause an
+            illegal instruction exception after an implementation-specific
+            bounded time limit.
+
         - const: zba
           description: |
             The standard Zba bit-manipulation extension for address generation
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
