Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA63C3DA64
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jul 2024 18:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZVJ8ehLle3AdoO4Ca9ngO3MpAb5CXm7AEQiuEJHL7a4=; b=toCPgj6k5IkJuv
	IeqP//ZpXWaI6uNamlR6ivAy0cta58CIgRZ+i5HQ/AiWEMxtXrxosTJws6aoL3lRyXMN52YGMFpxS
	TlN9kIer2ocFRZrXjozQsphVkXi7LGWUFxGOsjmLW7JHScTDj93HZiQ6lyiVxJTBljbSC/CUAPZWK
	yOe6jLXIxswVPL5ZHIj/MK09VK/5PMXIH9pekNjKZ5OjplthyrqRynqSZw2FMktc4CgY5Aha09BDX
	Oy3WJOnPBF5uL7UY2fsHKDidaSAyhg7seQ0i+oBLlh5A3e6b8e7BTP3VHPFk4O6ob0bmyblytm9Ph
	azMn39A1dGkbYAsoCHDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWgqg-0000000GDSH-0UTw;
	Wed, 24 Jul 2024 18:36:26 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWgqe-0000000GDRk-0s7S
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jul 2024 18:36:25 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2cb5e0b020eso108643a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jul 2024 11:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721846183; x=1722450983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GMGTUDyEMPZPRQbrhVrrT1wBy+Ea8+8tZqDMP6iisk=;
        b=07/C/Nkkhw/qSVmrtThHGj82Q3ZGpf/CrGchvJCvl3VsiF83P/zCvcpDHI1GIjK1xW
         ScCfXT/qorDd4RlFTZUAbp53+BxJZh8uDJ2IwDOx52U5e+U7mlSEZkW8DoksB/R9ychI
         FqYPkMce5Lw3Dv5fgNKDZB/Y59r4kwGsViRn+LL2xaNdVyMVEq+6ndq/xzguuMva784A
         dtsuIWRPOUX91KPIbmsbGNX3PzVEOVCFawwvwOWQ+aRmlkgCO3wShE+AllpPN9EZlQAv
         BHWMDuXmas0yyFERQ+kagCIMat7o8FVgq/CKcR1mm1PjBFfPXmgXq4HJXkiFR242tFnW
         JKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721846183; x=1722450983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GMGTUDyEMPZPRQbrhVrrT1wBy+Ea8+8tZqDMP6iisk=;
        b=IP0C6tda/ssoXnfkdgjohCc2yvhSCT9p031W47Y6g0v/mkcOWTyUWgkFrnzq3hVMQY
         ZEjf6beIwaHN8eAJIcUXdNuLHXzoTDzBRvWrBFGWR004JLlNepM9l/SbO6zUwCQHgVVZ
         coSEx9ZJSda/tX998tqoDlaiDOOSydyiqJZ95OoPNhrr+Ej/tOwKf4wNpZfPqywzZYQo
         lF7AO31fQw5Seua8R//FUsQIztxNDefUzcAAScbhq0YjIVfsdULCpsJYEvC5iLeB0roV
         f56kPDgRklEv0C2wyj9RsMEGz8j/0n+8CGrWza6/837lOoRjltCKp62yZQOgCu0EnBzE
         O9lA==
X-Gm-Message-State: AOJu0Yzzbhc6C6Blb0XujfEhP9WGrY5nblPEouG06jyVSG9aPsUDzWby
	ujUo20GrxdvkIBqIWoNhDgWRir4KAXUvqhJhDH3b1w2plZTBdLKeV7o2fBEc/KV4RbJR9dNaU8Q
	K
X-Google-Smtp-Source: AGHT+IHcxsxL5PKRr6EL0FnouwIrTDDXxRkbZnLzFn5sPLGCcy444dkDYSsiX+Ck+UDZ1DX+oV9EGg==
X-Received: by 2002:a17:90a:d344:b0:2c9:7611:e15d with SMTP id 98e67ed59e1d1-2cf237daffamr465749a91.20.1721846182726;
        Wed, 24 Jul 2024 11:36:22 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73a189esm1997830a91.2.2024.07.24.11.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 11:36:22 -0700 (PDT)
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
Subject: [PATCH v6 2/8] dt-bindings: riscv: Add Zicclsm ISA extension description.
Date: Wed, 24 Jul 2024 14:35:59 -0400
Message-ID: <20240724183605.4038597-3-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240724183605.4038597-1-jesse@rivosinc.com>
References: <20240724183605.4038597-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_113624_268611_48C708BB 
X-CRM114-Status: GOOD (  10.22  )
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
