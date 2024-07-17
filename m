Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1376BC3DA4B
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 06:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zz5CieM7fK8R3oPlwg+PHpbclLpuk3VKA01Omdj5cKM=; b=W7yOWiZLQ5+jWU
	UGu50qadaQYiYH1PGYuqsfDBPcvKLulpu8h5Ql6HskZ6eKEudu004xMbIrsfuIWBSMmIqJOgbLHHc
	ROGHkIKmd3R5w1jLN14JpQHsJMk2yT8HaDAcZXzVMqd4+yq5nVNJxNbCbGYQoQOiG0iQdfs3d7vWp
	65mz81nnHteS4uGwynZmpveIRC4mHavZBmZDuTrQ1lgZnZS8b3ioXsSoWaWW3E8jQPXVUcdVGq3h5
	a8zFbXHe5XfSIm6zcUrmIDDQXkjSm67TQ57pPSTnItJj1c41xNZGu2d8Gai6HUqTjgCRmUlBaHAAv
	/HMMkdN+V85opAilKdzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTy3D-0000000Co5h-0BDw;
	Wed, 17 Jul 2024 06:22:07 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTy3A-0000000Co4z-0rPk
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 06:22:05 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-426717a2d12so2369535e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 23:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721197322; x=1721802122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6LJZCR61gmm4dvekAa0Q1TIoLF/ScrG5TtOv9gDZ/w=;
        b=uCQHzQfxk97VC6LNjl5UD+QF+dhyEZtisfHryiLlLXYoj2KM/WzwmfhHPS7MhpiM2a
         AVfXvUoVN33qG721UiBoAWd/5LXt0m7PCAUFnODkQ/VnbTAq4Skr0PMRbAgyvknSBTz8
         fp7PiC7lPQgJCvXYujrXFnfu+eWPzaEMjYwbrlRgPTxiltnWW0a9UPFxZ+XZpSrURe/o
         15tDScLIyZwpyG2clAy562gdPjVb020BzcmWIYobZ1rYrBLPwjJjM36VwEvXujf/TJqI
         0GinXnrWA5ZUfsr/4FMMg7yPuMyvvt4EKk5VGswjBGXojidNhEYdXq6TuNIim/Dqh+VX
         lryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721197322; x=1721802122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6LJZCR61gmm4dvekAa0Q1TIoLF/ScrG5TtOv9gDZ/w=;
        b=PikXX9ph3OWS+QERxgfUXn5ew69UAYexbYwlijyxWnij2FhAJ5Togxoc/ta0ej6CoZ
         CoiwVHlliFloD2UBmRT4PtYWJujnowIj5UZqFfHV5f2nJwjm/V7BDKkDy88qbXEtfJD0
         RodQi0DEDYo12WRynAWg5HUgTdisHUuc5v7qwaOVkRBfIIiQcOtnaorktrbt1fXHEutA
         MoyeRPROzc1Grq80+6wIyLQN1DruK1795TpXKJJp0VQudAgCK7V7xnquABPz+DSVoPrK
         IlW8ygick07HhPjMWWyf6TPzBpjkkc2RWwuqZ2k+Rzvs6xpw3zTTaXp+SpAPSa9IaOBS
         dseA==
X-Forwarded-Encrypted: i=1; AJvYcCUrMji693+gklutPD9SQ3hKimPXg2bU/ASKdM9OUKBZIOgMWSWppw3mlc6kWOSTZmSu1D/URI1kiH3dDt7cEoS/2nBRxlnckE7qbbViCL3E
X-Gm-Message-State: AOJu0Yzoq9FfLlmxiQpgxA/8A8alTmEYuK8F0iXUQqcyDt/6Cvma0ibO
	SXWUezi0FsQNyLe8wqfRqFvY/44Hb1WHwT8bc9Xk+wXZ6fAiTcSl8CsB4H4myME=
X-Google-Smtp-Source: AGHT+IFU9J5ZIoNE9rhylPtawNo/bVXV/Y54qi/t2Pf5eJSgSGKg9qXAA/fSZkpR14Z9Af1ks6C3xQ==
X-Received: by 2002:a05:600c:1d28:b0:426:6981:1bd with SMTP id 5b1f17b1804b1-427c28fa6a5mr5014165e9.5.1721197322313;
        Tue, 16 Jul 2024 23:22:02 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f23a000sm194474825e9.5.2024.07.16.23.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 23:22:01 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 02/11] dt-bindings: riscv: Add Zabha ISA extension description
Date: Wed, 17 Jul 2024 08:19:48 +0200
Message-Id: <20240717061957.140712-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240717061957.140712-1-alexghiti@rivosinc.com>
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_232204_249657_A42DEB1A 
X-CRM114-Status: UNSURE (   9.07  )
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

Add description for the Zabha ISA extension which was ratified in April
2024.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 468c646247aa..e6436260bdeb 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -171,6 +171,12 @@ properties:
             memory types as ratified in the 20191213 version of the privileged
             ISA specification.
 
+        - const: zabha
+          description: |
+            The Zabha extension for Byte and Halfword Atomic Memory Operations
+            as ratified at commit 49f49c842ff9 ("Update to Rafified state") of
+            riscv-zabha.
+
         - const: zacas
           description: |
             The Zacas extension for Atomic Compare-and-Swap (CAS) instructions
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
