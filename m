Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF10C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 16:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z0YMkBrKp8ud5/D0LVQFZdEwmv/BDj4fw5tND1Gcxkc=; b=nrHztBv784+oJW
	56xH79haYscETIC36vCqosY/UCEKq9pzg0whd8P77iGY0nagwhIyKnm7r02pi9Aat2l2QuPigfYyX
	WGI5nJuEfc+vbDT/bNxnft0hBvZtVkq3Fc0UirsD67ubB7afFgfVjur5RGIh6UDLqdm4xfK8zlOvK
	S1PMVcdKmdk91qH5v3ZP3SnjW5KT0nmFMhM0cka6oPWHYpNKmvJwjYiYV9WQFDrjFNwfrKrZDfsqa
	SyZLaTleuKp7WHCgQ9dqyqHPK44UzTD+HUPcy6yj/kgZZkUNOGjOpxDPMSsXfdFg7q/kwayWcQ1hp
	Oa/UuPuMPjVHeacRfyHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVD1v-00000004NZ7-2P3p;
	Wed, 31 Jan 2024 16:01:39 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVD1s-00000004NXk-3vrt
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 16:01:38 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40fafae5532so14247145e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 08:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706716895; x=1707321695; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7GGjOTfTMBIIqyaAo6ALuSMS6zgfYAZi7fWs6gtAQ0=;
        b=HdjmA78NW72YPiSs/VE3v5dA4XQAFRG6RHqmPJ0ATqe38/jULKjIJn30B5950TKLof
         xlfEsmH/zwLjlcOSohNbnr8M/V/n6H0Y0ZQ2wnqf6cIpZqmj/NyuTveznbX312dZ/v7I
         +u6HM0ZFyEE/7972siqUgAHQn29cvbYKD77TY6q6WgP/bJhxPyubs2RFQNC5+LJcwLzV
         9d/OXTpONX7TEF1y0u+z0bnpkXUAawDu8loxkpZ09r1ZG5MfdHgeOGahDe4HKGYaXCzR
         7MkXAeqIl1IR699kk7pnsDXWWFAerJ9FyXHZnay+2jCHHcaXKCFIe5uXvOAd8qfm/KSG
         4E6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706716895; x=1707321695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7GGjOTfTMBIIqyaAo6ALuSMS6zgfYAZi7fWs6gtAQ0=;
        b=joe05JQKUFqzldB2pMluaP2RSKSrHLgDfPyOnSpVVZ8hfLI2y9V6qlO55WMZSLNqvX
         b+I891eZgJNJlJTuBOL9QL6snjzZHo4OZhS0NhFj3bUqMuZcVudOhOjT7IkTRElfnR6Z
         WqIlkkusycPZuKf5yp0MM4/gZFqUe9iMLx5Cchz4kIAnab21PPK2Iv/9k1l9SjPBrj9Y
         Ud4L6Mv1g7y7la9Irm82GmakFSAcWX24LX7UZ5v8xe/7kjizuKoUKzevtDPAGU2mebzg
         8sHH/TXAOib+zxF0atHMu5l21pa1O4wdRSdO4vJPzRH/9ABhIZ1OTD0y/ejUOmC0SWKb
         xPKw==
X-Gm-Message-State: AOJu0YzMHIBaKWSX5p46XvdjHGl56a2iT4A2gCHsCGtgggbUpNooAdCW
	oFMNKVjZLXWX/8wLkOTr0r9zHiQiMmXBuOWqC3l9AGCMUhl6mCBTubMBkZDIQ0A=
X-Google-Smtp-Source: AGHT+IF78D/rn/QqKCF1O6AsFwlI/Sm4elG4q8phM412N9lSIrsSbe1rAE7TOm+63SArxDbMqaKiww==
X-Received: by 2002:adf:e292:0:b0:33a:d2d4:959 with SMTP id v18-20020adfe292000000b0033ad2d40959mr1290673wri.11.1706716895453;
        Wed, 31 Jan 2024 08:01:35 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUMmlfGb5QJrtWjQ3hwdRXHqr6tBQk0FIxMX0uA5P+4YYcbUZ8kMED0+5zSvPxp9Se7FDafq1n/DY934cDYAzBUsuJC61YJexveBQSJLg7aTm75drBWzhDXDpPnE0l7gnKGYL+NZ08V3zM9OcyZg18MIDPvkaVKY3n553LA+zl3U+PBNVZSqQ4OJFYlAd+XQCVFsqmjAvgAu94sEw9sEJBxzDIGrAwSiwP+rLI1AOEFoHCQko0EZIEwQuqgCuHpX6cP/EEYYWnOvDzGKbvNABXq1TpX3vYsnWd8cF2ONfdDW14WDtXiy37WLvtJt38NeCjgTKUFonqMDLWTEEk037t8rkyOgpIafa1COSx7MktRFXJuHq14e0rmtyCCAh2qsI+eJWk8yrEnwRA062YhoPJHPcwhqxqj4YGj8RGlqwf7fyXJbj6WVuGvHK7yb1D/+NGovyndWxjJOD2rhLLW/XWaX+s9UrHLCyvZef4E7hM2FoJhLzSFkuJKEvG/jCTxRNoVuv8MXActoVinBxYpoKfqtvQbEYibDAr9IFUTB7YggocoqH5QJHoXjU3mTpGGZyZnZP5qvj2lgg1N6C6BHU/XSetdZiGav2/UV2L5p7b7QF4caHnszz4xB08lDGxMWBuhhqpKVsqMtaPPUA==
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id c17-20020a5d5291000000b0033ae4ba8ca0sm11407009wrv.82.2024.01.31.08.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 08:01:34 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Matt Evans <mev@rivosinc.com>,
	Dylan Jhong <dylan@andestech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH RFC/RFT v2 2/4] dt-bindings: riscv: Add Svvptc ISA extension description
Date: Wed, 31 Jan 2024 16:59:27 +0100
Message-Id: <20240131155929.169961-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131155929.169961-1-alexghiti@rivosinc.com>
References: <20240131155929.169961-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_080137_002844_726E4055 
X-CRM114-Status: UNSURE (   7.95  )
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

Add description for the Svvptc ISA extension which was ratified recently.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 63d81dc895e5..59bf14d2c1eb 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -171,6 +171,13 @@ properties:
             memory types as ratified in the 20191213 version of the privileged
             ISA specification.
 
+        - const: svvptc
+          description:
+            The standard Svvptc supervisor-level extension for
+            address-translation cache behaviour with respect to invalid entries
+            as ratified in the XXXXXXXX version of the privileged ISA
+            specification.
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
