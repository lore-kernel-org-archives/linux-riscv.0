Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6CBC2BD09
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 00:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W9ObkAdVMXkLZ6dJa37gNEt3fAr6JbkItJq3D2Vr8RQ=; b=QzEMOTHQHMhA6i
	gtUhoDcs35+d9mZuP5PC9gtZqO/MieKAw+bq8Rq/VtOv3lDetVFIt8nW3eck8iSztavEd+4ymu4MW
	MwFBLOK4i0ridVxzwVkxmfjyYClquI3IEExE3Wwus/Ji7sn2rQuu0wAO65Hyntg+mK1BLoGgBh18Z
	O/yFwjMvsDTwpAn8hF8kXp69QEM1Om8eLKBXzWaRjSqYs4m1RYN/fQqymPgBUpmrW8M6MYT5zdvXp
	9cuHD7/BtO+bh1h8XtTGFbLvBm5UmUn9qGgdgYQa0PQIcR0V7ZPer6fHFOP9B9XvzQGzkPgMtfJyy
	zEI8atpeRCuEwFkOfOCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLuOb-000000018JP-2STu;
	Tue, 25 Jun 2024 00:50:53 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLuOY-000000018I7-10I8
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 00:50:51 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1f9de13d6baso33195855ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 17:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719276649; x=1719881449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJQbdAAUHpsJIDvU82Jg8JV8IiFb5YWn87NOrnsuEk4=;
        b=VZS/I/Xbsx4D3GEVR/62TO/urRM0wktc7DuSm9Ll6Yside4Blo44e7KtUG1k6agfM7
         Ld8C8anBFxDzGcwxKxaYsytu8In5ZGjuE09AMU+udyVhH/aMlctFiSfhgswLluN4T/fJ
         PtMXSJOHULSmTD9RCMY/JCZT+6xOyEj9aDgQMXfT6/l3VuoTBIJsDp5dM+VU2QZkBAcR
         QolcfFRJ8/O1liFXGvbMJ4gqnGIY7md3/V4orHtfhVoIn6SdKhfDRYccn3t26vAN2V/r
         OKdl/aE/wkwU/AJJSawZD+uN/386vy3Og7NSusBbfScrpP1dDvrtK0Fej+NIU8Y0f/1S
         ZSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719276649; x=1719881449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJQbdAAUHpsJIDvU82Jg8JV8IiFb5YWn87NOrnsuEk4=;
        b=g8xo7Mop2BchmdavuxGBnAGrw3s/tpqNOl1gqy3gYi40CrGCttMlnj287oCxy2oCZ6
         OpFsQhXzfErMnztcmFVd1HymVG5uytFQxUA5tlDl/RXGLOrQFIyznVW0LExWZhQGtP2B
         KR424DCVWFJLeAJfZNVOpY0BeAuuKojHPyKhGb496wrJqQJQhYQa9QOaI76EkSPw9p4Y
         a3IzFMceNd37gCP4DbmOvRulWltW+N5LPhzEdtH8SYhG+GMp1Fqiwr8RLvvIfDOaNME4
         YxLssOvuq2HsgmiPM9PGoru8emiChrx6i+W/t3Yy7hnPs5B8IofKcsfjej++t4mcBfKW
         v53Q==
X-Gm-Message-State: AOJu0YyGUYv2OYnLF1HtSprz/BxoZGiIOinkXYBeGRT/J2iPHTr5Ow/7
	eifsd/3rThAnXEcUpfpLogdAeuZSz4i+ok3E8UJsrMCN3Bj0hCSeQ0E/W5D8XnnC3rxffMPhoDP
	I
X-Google-Smtp-Source: AGHT+IH7iNOTk2dACUhxktOMTo7VpX1zJFsXLc4rOo9b8V0SM2fkV7dKQh6SXUdWY9e9smQZdIjpvg==
X-Received: by 2002:a17:902:e811:b0:1f9:bb24:b21a with SMTP id d9443c01a7336-1fa2401c0c3mr69837055ad.41.1719276649116;
        Mon, 24 Jun 2024 17:50:49 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9ebbb2a7csm68150235ad.256.2024.06.24.17.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 17:50:48 -0700 (PDT)
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
Subject: [PATCH v3 2/8] dt-bindings: riscv: Add Zicclsm ISA extension description.
Date: Mon, 24 Jun 2024 20:49:55 -0400
Message-ID: <20240625005001.37901-3-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240625005001.37901-1-jesse@rivosinc.com>
References: <20240625005001.37901-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_175050_304251_AD4B2441 
X-CRM114-Status: GOOD (  10.05  )
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
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index cfed80ad5540..9f6aae1f5b65 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -317,6 +317,13 @@ properties:
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
