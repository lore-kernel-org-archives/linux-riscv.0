Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC5FC27C75
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 19:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p1YNacTnUiLnB2cnhRAP4c3yQJUlbpI7q+gd+rzG21E=; b=yPbzh7A5Nv/03/
	Ee6QMeoNqd2GKTca1JC/8bwK6zbKpErRhed5JgCwBVvjpCEZzwCcPFibtht2vnIoUBgmlmKW32R4Y
	VlAKtO8K4AMXbr02qFJMFO5Kmi9A8ixIBjnVSrzJP9za/RTTEsDcWug9yd4FlkEAMf3n8HiV/UJR7
	cQvppxraSwHodXmsQ07pbzUGq7ERKOqvvHrOIDhwYsvXSGLJB/WCrRrK7/LqocmahgKulh3FeArH0
	V9PN1+BPTdkVszLYfzyDGj9Q2s+x/2t2oRAgszn2YvhESS4zqJiwIyIo8+wny6W9WxU/txdVV+y8D
	E/QTrjJ6d080nm8F3KAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHpwa-00000000EDz-1JO2;
	Thu, 13 Jun 2024 19:17:08 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHpwX-00000000ECy-2RMM
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 19:17:06 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1f717608231so11053145ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jun 2024 12:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718306224; x=1718911024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpE2Ww+0dze0r9EN+Ae4oSiwfKGmmGKW1FHSshUbIM8=;
        b=OY7lPKmijKla4x4kRduFKdBr/DWGGJncaAUa1G4FsF1kgWz0siRJtydX54gpfXJSV/
         7L17VV/8QKmOXUQ7Xp+OptNDm0Xplji08+uW3qK67vO2aIinrmiNyp5BKpDzVLxASMKF
         CNkTJJjTZYR6vfr2eqTM9LxYxwDfXOaV/Ux+rUniifkBaUCfinpvHnVzqtz8rz5JCWGJ
         e6l3iVQ0ZjHE+Kx6UXU5H5VahQ1pMK5CAOhjoHG12y1a31jbor3+5V+AzaPEZCcXapUe
         nEMcDxbSAED8vtLNvKTvTFbfz8EO2L18AEmsRs+CQXLRBReWmzmLWKJQiTzmxC1Krdr1
         UN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718306224; x=1718911024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpE2Ww+0dze0r9EN+Ae4oSiwfKGmmGKW1FHSshUbIM8=;
        b=lkhoxQcVrgmUChqm45aGmEjSTAZJTKDetJ6IYBxI1U1WR2A468J5/5uKTdP2+AzEY1
         xFRH0hrgxWUY/AW4wsAzKA3xqT7C/bBvPRIyQJkk1kTzkAK6uwBN2CfW+QgYwad7u6Ot
         8IOHMXQgj4yEPLKL/T5nHFNOh1FgAC79EAoeEtoCYUMtrzXHb54lZVxxpINRfDIRVFSm
         +n1wrSr1vw1IxhOJTM7EzpTSA/LqnHSCqrzjfEofB57mcMZIw/njnveSroVAmXeN+o50
         UeD5HT9AYWCv7EFAko6ghDg2MYu7panU44mxR6j5Whjo5Tdtv8icNDrJRF8MeAWIiDZU
         so7A==
X-Gm-Message-State: AOJu0YzlEshnqnH9ORJBET8zoaCS1P+KvQ4kS8AZgA0oaAqlm81U2L+p
	73rc7/bgIHsaMW6+eXe5SdqEA5f0wKf2b9cIE4iFrLIYEsTnjdF9eOtGSV7tKmF7JTmHj3vvEn9
	mg+k=
X-Google-Smtp-Source: AGHT+IEBHUiOGS6vq7hxV351Pocq5uf+7spoaKHpPHfr2Yp/P2zIdVv4yVxvGq5/azSD93awMnHT+g==
X-Received: by 2002:a17:903:228f:b0:1f7:317f:5454 with SMTP id d9443c01a7336-1f862804bb9mr8516685ad.51.1718306224484;
        Thu, 13 Jun 2024 12:17:04 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e7ca78sm17471015ad.106.2024.06.13.12.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 12:17:04 -0700 (PDT)
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
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/6] dt-bindings: riscv: Add Zicclsm ISA extension description.
Date: Thu, 13 Jun 2024 15:16:11 -0400
Message-ID: <20240613191616.2101821-3-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240613191616.2101821-1-jesse@rivosinc.com>
References: <20240613191616.2101821-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_121705_648193_8C5B47D4 
X-CRM114-Status: UNSURE (   9.80  )
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

Add description for Zicclsm ISA extension.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
V1 -> V2:
 - New patch
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
