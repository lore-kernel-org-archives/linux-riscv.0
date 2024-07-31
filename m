Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDF2C3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 07:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qmYDAIItpjkWNFi0mvFyvyKA/NF8b4Q8clRj9rK/Pzo=; b=10+UR0NoVu940k
	43QwxqsAuAcJOzhTh8U5dfhl+FPzfn7em01kZuSvdwY0GSDr+31ubSu9QgsKVe0MgCgibc91vfN8x
	Pp4am21Dzw6KKDE2WJs2DXeYE5+Ve5H0TiLIjNuhOwNE34i2RUM8LUqu4wh5Y+xRIC/iFCLbI0tHS
	+DhePSLi2XQnx4yFbzTsaGIN/gWgIZx30cQwWk0+xCmCsFHRPIF9Q8Pi7WtFYm+eftJ37IDcgtXSJ
	yp1xrLbFzSRxmfwsQ2HZa7gAu7k9n9rbrSpJmG2zOx1Wu+HJCUQ5WRwv03I4IJzvshVTiIgPGapZ5
	x8l1Zz7IU5m03VYX8ucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ3sp-00000000A1C-3Xcf;
	Wed, 31 Jul 2024 07:36:27 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ3sm-000000009zQ-2YpC
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 07:36:25 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4280c493719so32200775e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 00:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722411383; x=1723016183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StkHQugPFKmcMlCdkJBjlWwaxWZu+axwFXxjxfJ46xI=;
        b=3CJROQEqrtjBblg4WWUdMDE7HdaDESR1X1FO1xjA64AGcOWPBrm9Lx62jfYP7oe+vi
         BVIBWfTNTIYucZE4HrltSN7WPqxKz9gPcyycfYc74GpYX/5tfvyVh2+v3i03kWhbPHI5
         kI6+Dx3A6DVW3cyT2EG+YavmKy2r3kyv+2rG4VUg1NiEHdUsjjdx41o+yVTX0B6vNfbs
         9VHrhZe/nz5dJIbbu42U4pwG4vvjh4hQHNIsQQdzz+Xsk9gn1ze5ta6HVT6CkvtLKWL8
         U0rradqOSKWlpnNSeFnV8N0J7O6HxKefxqx9BVSLBau+V8NFaasDd3Hwj5F5Qg7DJeDp
         mpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722411383; x=1723016183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=StkHQugPFKmcMlCdkJBjlWwaxWZu+axwFXxjxfJ46xI=;
        b=HnwP3oHgYVF1Mu4Zx0LSWFbT5SS1TluPqLWa//sBuCE6rR2hB1Imni6FIjrrwPS+cR
         PdIHGf/82PqPr3IHF2zXmFideP/r89YP4k03IdqCFMsW1WSB3vJdieqkZdWAmZHqVH07
         obqZlCCXtdbaR8JI8Hh19bnvoggn4yj4On0Y/uJKDw+6YBw9ZQvU9YHvFqLANTFcv32H
         LCxTJjie5hADUvmcqge3B3ekU/+cm9GO4BZX7JMgD2UxjCgxadoVdfJTyUkK6GDv2yhx
         V1ki+oRbIzmTVRrBQI65nhXNCddJaIXT/YN3e60NM2Qyt21pQZ3SCl7S2/hA69ZfFWhC
         wEsA==
X-Forwarded-Encrypted: i=1; AJvYcCUqeBacif1ZGl/TkQ+PdW0ZeBFtADq0Dq8a5qlMSqfsYRfezaqjWB4aLIRnzx6yM8f2dFEq5AWI3sfQF3rbX6RKpF3+/zIBv0l8vaZIcNWj
X-Gm-Message-State: AOJu0YxySwAy7vTfCml0yAp3+LT4HHWiUu9NYWJCNviTyjCyenc74fYP
	6FeCtLwO552zhYJS+nir2h0kUhID1MzV2D73UpX76y+T7N2VedZpW08Kc+/Eeec=
X-Google-Smtp-Source: AGHT+IEiU0CaFWiD1hh70+ka7aQVmGlrhYH1/rnpyVPMCyVRk32YX0EEddiK4g7ZX2FGkW4AWaXtCw==
X-Received: by 2002:a05:600c:45cb:b0:428:1007:6068 with SMTP id 5b1f17b1804b1-42811e0b70amr100189195e9.34.1722411383067;
        Wed, 31 Jul 2024 00:36:23 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367fce64sm16325946f8f.61.2024.07.31.00.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 00:36:22 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 12/13] dt-bindings: riscv: Add Ziccrse ISA extension description
Date: Wed, 31 Jul 2024 09:24:04 +0200
Message-Id: <20240731072405.197046-13-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240731072405.197046-1-alexghiti@rivosinc.com>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_003624_674495_653B63F0 
X-CRM114-Status: UNSURE (   9.48  )
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
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index a63578b95c4a..22824dd30175 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -289,6 +289,12 @@ properties:
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
