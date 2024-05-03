Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41FFC41513
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 19:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajJuG6BuxlsqFU+2QTWP5oCDpAWmK0DN+GiTAy8n3/c=; b=zsrwoQ8X5pJi0M
	H/GQsGhv4+wmdA+kKMiyBlHFjFiSsulOHpaf9Xj+PZP43nKFf1ga3tirkuPZT0iA9i1nIpjQkdYJT
	zOlX8L8AbQuJk8iC+ovr8NbyO5avTBZrTD0uyQ0OsiltNbJ6kILl1dzEE8eiTu44I+6uN/1mmRLtn
	hmgnj3aatkB8Tt4TnMrGO26lseqczLZgRzjSmLyW2BhIorlNPMj0xocqbVK+sNYYx0XNtrE5vFcDY
	MTJJKxLd0SuknrnB99JEJGGoxZqT/NufmXmfYGuXFYlz7nd4/bYwun8IsqrZDMiLFg1vMsMgg8dvp
	5OkpnZAEB3apEHrI/PBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2yd1-00000000Ahr-2A6n;
	Fri, 03 May 2024 19:31:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xUg-0000000HWsb-02GK
	for linux-riscv@bombadil.infradead.org;
	Fri, 03 May 2024 18:18:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0gP3BTCO/eMabIcPEHZlkkrT/LBtjjbwR/exXvwDsR0=; b=GquAqG/bLBd96vRJ7nbHGB44Lv
	U0sycFPWScLUBYBHXEZkkFV84rKFG3rq0zTxBOZdRWfjCBn3lXtKHO64rvk8Y6GdWRknS9684h8ST
	X32nLeUGZfABm1xi/GK36BUVCwLtq7fTBDX9cZ6efxwy79asoIgKqWHTsvzPGlRA3UdUHWP+bkpcN
	AwVPlWpftjLeXXeH2naXVmo/FO4Zyowss93UtW0+EYyORurI+HW5VJFor669vw+YGRMRMgVRqq45Q
	frhittdJOP2xCyR2KTlK7gYtCsOeP0PrwiFtphICwtGeC8cPnxLKB39kr0zxmgVp9WxYbIbKkKXzY
	AsiKDrKQ==;
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xUa-00000000dm3-4BPX
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 18:18:48 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6f44390e328so2026b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 03 May 2024 11:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714760323; x=1715365123; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gP3BTCO/eMabIcPEHZlkkrT/LBtjjbwR/exXvwDsR0=;
        b=mCDJB5bZaEFcS6uPl75u2ZHN7lb+IfZZVZ0r2H88EB9yxa27d6uudi/OB3VVrnpenK
         s8TcCYkjPAbGv+UF2YCIgw8x4cFqsuThwMp8N5ZEq2UvITCzSD5xXKAtXvJ6PRyo7UkO
         9fdTH3QT/laTnEqcPjVsTi2wK4nDZmTEHOSzaqWqHI5KmAuWhk3vca9PlYqRWoTybWTC
         demcCHmRVy/lPmlHtBcOKTwAuQftxga50Ht24LNlfNrTzyoVbIngmsk8nebQrY5FZpuB
         WOIT9be+fLHvpz+m8uFK+JW90W2K5bH7SffoHH1k55gEwe2CdT8LfvjRKxVTTDUeYPkj
         budg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760323; x=1715365123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gP3BTCO/eMabIcPEHZlkkrT/LBtjjbwR/exXvwDsR0=;
        b=ZwAvAyQieqdQaiX95EK+U1RWqgvfIC5frjnuas8i7jO3hcxlvivPDAqSLQ2Dr3+XuF
         D/3giegckqd73pUQ8rJhgXXEz676EqacFh0cPpojle+sYlDzAx1M/xuidMq/jYlnKdeD
         rLfCBkluOhjBxgqlEEJOxAIuQtC+TxPha9hdhGK4bF0i8qUmkODir1owRiDwSuknNmbl
         xpuhfAlMObqcsUM/3bp6chBiX96KpXafqtWrm1uXIc2DkQEUBW4GZPOhdh2Ximu0C6ix
         5IedZynwFwMIWYbQZzw2KNypkaCft4wQGIfgqONFlQd15Hm9WgZYmxo55Uypz1L9Yg0g
         /OfA==
X-Gm-Message-State: AOJu0YylwXM7jPV/TBKc8iUmQGGsjyn20xvK1iZTqAp8SbJMyB7omKeW
	X0q/AP86oCsMaBLnQcTYAydOfkt3if1QBO+RSytwf2aYo7rQqIlNGtJVcdFhrw4=
X-Google-Smtp-Source: AGHT+IGBOKl57I24YFZySzh3mz54yFRloG9YDHhQIbdUi/b1ycprdpu0E8l8Tpw+3ZKCGJzBqSM1lg==
X-Received: by 2002:a05:6a00:2411:b0:6ea:b818:f499 with SMTP id z17-20020a056a00241100b006eab818f499mr3821023pfh.19.1714760323428;
        Fri, 03 May 2024 11:18:43 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id fu6-20020a056a00610600b006f3f5d3595fsm3355421pfb.80.2024.05.03.11.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:18:42 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 03 May 2024 11:18:16 -0700
Subject: [PATCH v6 01/17] dt-bindings: riscv: Add xtheadvector ISA
 extension description
MIME-Version: 1.0
Message-Id: <20240503-dev-charlie-support_thead_vector_6_9-v6-1-cb7624e65d82@rivosinc.com>
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714760318; l=1767;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=BFeF/rMqjmAL/T3qO395y21tghoeF4vuGyaBxCV02tk=;
 b=3O6DNsqnjho0eOFsM+BkkXkbFm6aePP2kGmbXVZ9SDtJ/226s0zD2dPzdYEZM526omlhaNz9u
 R6CoU3n69abBjslwqGP4BXTu4vuglNkUKagnVw882sVEOVJf8MhdD5N
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_191845_172155_E0DF44E0 
X-CRM114-Status: UNSURE (   7.81  )
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

The xtheadvector ISA extension is described on the T-Head extension spec
Github page [1] at commit 95358cb2cca9.

Link: https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc [1]

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 468c646247aa..99d2a9e8c52d 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -477,6 +477,10 @@ properties:
             latency, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        # vendor extensions, each extension sorted alphanumerically under the
+        # vendor they belong to. Vendors are sorted alphanumerically as well.
+
+        # Andes
         - const: xandespmu
           description:
             The Andes Technology performance monitor extension for counter overflow
@@ -484,5 +488,11 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+        # T-HEAD
+        - const: xtheadvector
+          description:
+            The T-HEAD specific 0.7.1 vector implementation as written in
+            https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc.
+
 additionalProperties: true
 ...

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
