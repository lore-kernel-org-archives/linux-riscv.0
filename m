Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25037C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 10:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w2Uyw53ymEJ201q+keS6uUt8soTTcOndB8hOFw6cO/E=; b=Tdfekseb7FA8ti
	OyQXj+hBkLHudRoaUm54VUOmO9Irkoxl7n7XyrfUqLL8LXOf9bNKLfQuhCAiY+rVXh7e7ZF+KmPdw
	fElmHdbWyifG7IMMUVE/0s9D4rPZwLy24pZZz5daQ4+R8eO+/e4FzfVf8M7UT6DOFKhy4VXiKKVXA
	EerBZSn1rvET6xCFvcmdm9tW9vyrNgzVPRdrST8zC/BRcr3dSTXRJn1CUstoptDWAn+zcMqU6JPyy
	zPVxvkjFJZkXR/cxYj6M5QCH50Y/TCjoFYUUOa9I87jRPJMnLmEBIMoc5V0/uKqJgVauYCsYrg00X
	R76pfSPogZgp3KJSY/dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0IVN-0000000C3tk-2rJh;
	Fri, 26 Apr 2024 10:08:33 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0IVG-0000000C3lP-060S
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 10:08:27 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-344047ac7e4so1731426f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 03:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714126104; x=1714730904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdAVaUbFR/ur15rfuHd+Jr8J7C9O8QZUTDILJt54rH0=;
        b=ogYdhjw2aP1jF4YolZzprwTtWu33BkncF9WC1iOL+KaVKbwcT3BA84jSX0IioaDSKw
         uoriyw4TWq8MHG7L8mz+DHFOn4D42OiVXiBtSLbyijrwBUpbBsdCAVhyJ3XCppuJhw7b
         60xTrYGot8bYJuWv4hiP6TT33DhB0H8Hz36qHDvUGCg/lILnZMaVztzauEWm13tfesyD
         Stmy+Nlw5MSURisTf/Mx2Vpx7uGzQs0XRt3aKdjgE8UUuKgC41AUjWObvzNXhlOMuPvW
         To58pweYtpEm8hZRRXKGOdTaK5Td70n4xqc8DU3ZvSupwXxUjsjUNnOLjnRgSZEbuIPg
         vvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714126104; x=1714730904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tdAVaUbFR/ur15rfuHd+Jr8J7C9O8QZUTDILJt54rH0=;
        b=Ak/dljcfrxstXzE4+SpruzMcuJMBDToYPWRCnJetHXuhp1l0e8q77m7nlnn8bQ/2GR
         kR4/PsDANnCKAJQYswRUSr1X2a1bI3lRsbgNSnpT0WMb29S8UsIEgRnpk/4bbhAJVbf5
         opOEfuhDvCCBU1eC8Fn9pntHjiTR2mS+/3ew/QMyhPJjDrxh5+X9xgvd3YykDRDJ+wPy
         0mIij/BIRL9dBTd+nhrykFkhE3ojP37KCgZlmfD/ubBkb9/zIvKVuissJQDAR546UkcF
         y+RbJW+fm+VijrJ52PkwD3QXPWHGUtKobVz94VJ8m1OyQE9UqYRSpsTY7jztcL1qUmyU
         7/+g==
X-Gm-Message-State: AOJu0YyK24Cf+cWGG/p9ltJcPyAshw1owNnr9YEX3/R63XTiayHcxPFh
	T6pxfb8hTzIcsDYVADhXpluc6q+YVZz9yOhCe/VsVyLxRbnGUQMgMha3JNFIi0alznsOcXrI9HY
	1tSY=
X-Google-Smtp-Source: AGHT+IF1ueQ5RobxwvdVcMOEubk4Wz/94iHKDmLcyIIXJVUsYQioq9ZmPbLUPeIoXiVrdz7bNnjXvg==
X-Received: by 2002:a5d:52c8:0:b0:346:a39f:6b69 with SMTP id r8-20020a5d52c8000000b00346a39f6b69mr4176571wrv.24.1714126103870;
        Fri, 26 Apr 2024 03:08:23 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id c7-20020a05600c0a4700b0041b434e5869sm5315128wmq.43.2024.04.26.03.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 03:08:23 -0700 (PDT)
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
Subject: [PATCH v3 2/6] dt-bindings: riscv: Add Zawrs ISA extension description
Date: Fri, 26 Apr 2024 12:08:22 +0200
Message-ID: <20240426100820.14762-10-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240426100820.14762-8-ajones@ventanamicro.com>
References: <20240426100820.14762-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_030826_264925_0F63A6DF 
X-CRM114-Status: UNSURE (   8.51  )
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
 Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 468c646247aa..8594e7c33ea2 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -177,6 +177,13 @@ properties:
             is supported as ratified at commit 5059e0ca641c ("update to
             ratified") of the riscv-zacas.
 
+        - const: zawrs
+          description: |
+            The Zawrs extension for entering a low-power state or for trapping
+            to a hypervisor while waiting on a store to a memory location, as
+            ratified in commit 98918c844281 ("Merge pull request #1217 from
+            riscv/zawrs") of riscv-isa-manual.
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
