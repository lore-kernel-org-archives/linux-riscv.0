Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F63C52D7F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Aug 2024 16:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zS5ZAif6V6ypP+oQ8958gV7jwg/TWXt6hfRSuV4k0t4=; b=YbPzR/Npgx5WvX
	lZUYQ/8gLXpbjdgRhxaVgRdZraxMUnCcMHImNIiE6RASQ0Vbju5sYehZbz5dRBASoLj65V1GxnWSN
	UYRsxTuHQOnWPKAI1jcqkQRFDYJEykV0B0WNmGVMeo3Y+MnSMqb3DioQoio+XF10Bm+3BDIMoqgjH
	A71riPKav+sm8Qku5nTvYcDTJVIGPvltJAqI2IFHzqqyBsuxTaSzx3DAX3hB1O6YkrqCjIW5jB+dH
	4FnU1I6ZpIbbEs0drkex5Xi2TJ/2Z9DANlifAQOpiDe92BGidANS+OEhZPDQWA0s5EArY5pCjoY1+
	XImvxvtY2mkiIIcLZL/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scSOk-0000000Btzw-0RQ5;
	Fri, 09 Aug 2024 16:23:26 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scSOG-0000000Btl8-49Jy
	for linux-riscv@lists.infradead.org;
	Fri, 09 Aug 2024 16:22:58 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1fdd6d81812so23123585ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Aug 2024 09:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723220575; x=1723825375; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9KwuCeskSHSsK6Ge80MByzX2lckhBzz4l4UPkzzqNs=;
        b=NLsaoHRHU9yS9ajddIK+jHB5HiqZtCQ/V8HlK4jT4cdv6lvXFPqre//Kca5scU2nku
         LwDEavnz6SMDBDOLbnsBTapSQfQzThO9+MzY9uKJN/LmxHx7YCo9GzJnvLLnd60gLNvN
         L+2NrDXG1Jq1cYSnbGaRKqm5+XOL2Bc5xj7gkOVzK9noGTTtQ0DKqxghfGtcnKgWj7Rx
         S4/UJWJeTVFf4NRRcBfdgepayEsXLyXasqoe91TpeAZM4ZYl+2w6tHTWSI4SpjBPigFV
         QJ+P9GAtSRS56Vb5muBE1JGl5g1orpdvU6Ecwk0gp+urcFXtubFjxV8ovWL8t5TdOGRF
         FTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723220575; x=1723825375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9KwuCeskSHSsK6Ge80MByzX2lckhBzz4l4UPkzzqNs=;
        b=kpIvkAkp96TLgmYpW1Oxzf70bLH5Ej1Cje/tpRMbYmk/mw3n+4pxp7xwARZsvS0Ctr
         Z8055tgk2shNJ9v8oeXgV8QJWL7DEWpzMZMx6WcXZ+TTECf5wnL/Vd35v2PsmGU+thBZ
         Oi7y6TXyAqymjrON1sJv/lYAzET7Lcou/vGjZxGL0F+r9F6FidTkpErnlghE8UCq1Sq4
         mZ8jVNptl0bgnMR2OGg6wHGnL9u1ZpPMrWJfMMeeuQcev/Rdo5wc/SXx54OIafPVx8Zg
         IrWv6djflBoCwpJzkX6ZwCLYwfj8O2iLbfs37zcUJt+6Q0NW1MJf58bqv6rsrGBYmsAS
         poag==
X-Gm-Message-State: AOJu0YwNqpG7rb6iFx5Cu1B6W5GYNnRbToDp1RVnUukRWDnXzz4vIKi1
	PsrwgNI6S/jpaNbmIlGt5ITvoprzX1Aw/SlTxFhLvTdpWHZ7S9sXp8sMlMBH85n+WwvNeGF5sDl
	m
X-Google-Smtp-Source: AGHT+IHp8h7nr4BcWcXSmFlRdpIdfs78+tQ8JlqIPTYsDMyESOd63kL6pHIyup+248wklqPMUEbOiw==
X-Received: by 2002:a17:903:944:b0:1f7:3a4:f66f with SMTP id d9443c01a7336-200ae59b5e2mr19226275ad.43.1723220575225;
        Fri, 09 Aug 2024 09:22:55 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200668fc398sm100414505ad.207.2024.08.09.09.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 09:22:54 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH 2/2] dt-bindings: riscv: Add Zicclsm ISA extension description.
Date: Fri,  9 Aug 2024 12:22:40 -0400
Message-ID: <20240809162240.1842373-3-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240809162240.1842373-1-jesse@rivosinc.com>
References: <20240809162240.1842373-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_092257_123891_39B95F7B 
X-CRM114-Status: GOOD (  10.72  )
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

Add description for Zicclsm ISA extension.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
V1 -> V2:
 - New patch
V2 -> V3:
 - No changes
V3 -> V4:
 - No changes
V4 -> V5:
 - No changes
V5 -> V6:
 - No changes
V6 -> V7:
 - No changes
V7 -> V8:
 - Rebase onto 2d1f51d8a4b0 (palmer/for-next)
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index a06dbc6b4928..d06ee82abcc1 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -361,6 +361,13 @@ properties:
             The standard Zicboz extension for cache-block zeroing as ratified
             in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
+        - const: zicclsm
+          description:
+            The standard Zicclsm extension for misaligned support for all regular
+            load and store instructions (including scalar and vector) but not AMOs
+            or other specialized forms of memory access. Defined in the
+            RISC-V RVA Profiles Specification.
+
         - const: zicntr
           description:
             The standard Zicntr extension for base counters and timers, as
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
