Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1E0C3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 06:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O0JB2SWSbLFKvpWRYBnQTgisIUXBj9XTP6KM9HI3u0k=; b=Azc+JpueI743ZT
	ebQz2RsdnNwrv9yfngKVb09pcGKfEbBDraGqRTHCQDua3nuLubeO/VnO/ZI0tJs6iUdCSLNLVRuoZ
	AUzlDA8ydrwveA5gHyosJGVYrAp16NF5jRYQJA5PJvahU3umr5hOcjG+P0VTHmkI0jBN1kKttCrG0
	FReTrxDFaA+VT0/j8sFEAdGKBEEtfi4dKkfNebvGs2INTrwe1FL0LPBbmQ4tWYFWAy4mKCJyxLBpv
	sggSBBCr6TQiHKFxaCIUrDMKFxeswcWAFDWF1mcdRHtkTH+5kJhIxICHNkqgWQt7D1WPlV7T+BYIB
	2mY3o86wdH6EEPQ+jIJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTyB6-0000000CqcF-3e61;
	Wed, 17 Jul 2024 06:30:16 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTyB4-0000000Cqan-15Fe
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 06:30:16 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4267300145eso51278445e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 23:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721197813; x=1721802613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/a3I9RG+3lbcPTW2WISOokc8gewDy3fkMsPDZhy/D4=;
        b=N42oS91AhHzkKUMo9Tid74LqHfSBv2OLbnn8rVeF1wmdOAsywtASCw4AEaglFPqoWM
         sjNsCco6vjnbB3mbG0kiUDGTjv2RV9QUOTyrIvW+BXa8qAtuVkeYV3/TQ15AD7AKlnjD
         MbhmEGFNkcSAvJzQhHoBmfa5xlambFBwmUCbnKBw7/pdyBvxzzSkiqD2mSupUhPWt3Qc
         e3Uw/xZsg5EcGg3cmgsofSXy4yfGW2FrwZv3Ebntd5NcZUmvZMI6XEKegrU41TPwvW82
         fd7nb/v+B0BO9SD2yLGknXRxjYNu29lgWSdzfJIYDz24W3o0ZeyFGIvntNuTbzKtjyYS
         m/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721197813; x=1721802613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/a3I9RG+3lbcPTW2WISOokc8gewDy3fkMsPDZhy/D4=;
        b=psDdkzDFMbarzogh6w0cP5Zwx10cyYeal/ISZlRze/YeZW1qK31f1kPawuZBz+DyFt
         jqUQ9zs8AIfjsUReFc5BkucUZJRvKz/SkVHtM9coYMHaffFeqOkV4LBEOea0kVPVghX7
         XzTZZ6s2HJrGtWYkh8ER+QiWiV4RcsMupr6Sa3zADquzZlZtRh3FuTDLhAQm2eRVcImh
         m/jY6INzcD4Bdy92vVo8yemNEa2uAUzTtf6h0XDGSRtwO6bgg78mlcsKXXkkMnJVMTmI
         wJq9vR43cwsFXT3e0Z16PC6EBvsE3heC62oueYU/JMuBjVzxj2pWpDAD4oWamF1jsDfD
         r+Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXaEteMxuZ8voXUXm8HflFJWyr4k8lPHf8gRszZUTqxeAwl2PbQ2gSN1HTbz43dgbwJiDen5HPUkwvzKM+QYesKx91VqDScaXMVJ+eih1Tr
X-Gm-Message-State: AOJu0YwWlBH6ubzgiE3a0y9iDeUK3/F40+R8l/0s+TKdLZykiDqPjAS/
	ATCjhTng/xem36uUyx/eNMoePhUR4YsJUqjbxE+9eH9v62HkYWnjoCZRG4FOPcE=
X-Google-Smtp-Source: AGHT+IHes7c6JkEf7yEOk72RnIcqQqTVYNuy3gJbWA9je9hHeJGPheqNOo3gwFeqz1xI+QDtIGxtPA==
X-Received: by 2002:a05:600c:4ec9:b0:426:62c5:4731 with SMTP id 5b1f17b1804b1-427c2d01cafmr5720315e9.29.1721197812676;
        Tue, 16 Jul 2024 23:30:12 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5ef460csm158127685e9.44.2024.07.16.23.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 23:30:12 -0700 (PDT)
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
Subject: [PATCH v3 10/11] dt-bindings: riscv: Add Ziccrse ISA extension description
Date: Wed, 17 Jul 2024 08:19:56 +0200
Message-Id: <20240717061957.140712-11-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240717061957.140712-1-alexghiti@rivosinc.com>
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_233014_331824_EFB41FC3 
X-CRM114-Status: UNSURE (   8.77  )
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

Add description for the Ziccrse ISA extension which was introduced in
the riscv profiles specification v0.9.2.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index e6436260bdeb..b08bf1a8d8f8 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -245,6 +245,12 @@ properties:
             in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
             riscv-isa-manual.
 
+        - const: ziccrse
+          description:
+            The standard Ziccrse extension which provides forward progress
+            guarantee on LR/SC sequences, as introduced in the riscv profiles
+            specification v0.9.2.
+
         - const: zk
           description:
             The standard Zk Standard Scalar cryptography extension as ratified
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
