Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30912C001DF
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 14:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=augNdg5Kwn732LebLjI7SAvUGSSQ0Ye9mfU0FskQfv0=; b=tiPu48ehc8o5V/
	zYpebcSeAMFp+NNZsk57BTIaMcHckmXdoU5hhyChfgmHsRk6+AqAERFUncJ+c8honOIQK5QxY04bs
	aXqgNpm/9Swwritavr/+bvi8BZnD5bBbJpLxlRFAQDIUlEt9YqQAT2bOl5APSP2fU6uhA9M3fWCbm
	o7P3pg3iVCjTgKErGxw4AkLhbmJcXIJe3yHEWdFwpePZxoElSEIiOaH03B5iz08bEdtnv+CH805ej
	jTrzWKlyvXNCkdIB9P3pqJGFymTB58LRPw84KYtaDk7LVHcI26pPhLiqUwctnnbTdK8OJOzCh/CfI
	DPbnLSSQsPIKpyQooedQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNwQk-004aac-1u;
	Mon, 24 Jul 2023 14:20:58 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNwQh-004aYu-1l
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 14:20:56 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-66872d4a141so2407119b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 07:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690208454; x=1690813254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xufKQxJZ1yMufxzMxtt76Rklm7qyQEzWEW8M8cPFlHM=;
        b=bC6GYsoh/H3PR+/JPzzVT2fMBcYc6uYovUuNhtlxPoNWVAqKq5UNsJdieKixeX/tod
         1ZV0pTnpatWWYx/p4XgSry+qNGMAhi/bVja3zNa7LNY3iSUD4lnztOR3OLeSfZDAwa1I
         kAH2qozVJb9imAZApR20rY2plXzKZiouGGgVFMSoc1nDfSEw3L5YSdSNKaGlFQ81p2mh
         eQfjF/8iLqwDZ6b5cPQi6fkvoWA7NODznBZOrjcoqIPxQlU3XkE8Gr+dFMQVzEqnvtT1
         2TItRA+Hz4FVq1Pnur4ItSXg9nPw+ABSUYuEmrVAw2vJ8oDPfoWGlE/W3iN/JRCCaVCb
         Cuew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690208454; x=1690813254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xufKQxJZ1yMufxzMxtt76Rklm7qyQEzWEW8M8cPFlHM=;
        b=bboDQg1vmaSkdyWxzv7Yn2PBzRLaBEXGSuZJKULYNDJViT/SvlMNFlisy6jKu4T3VE
         co6emnhzDM0gzgQHclKN5cLGsKOAEiTRfuE9G6jltS8y1OcitvbXa/gQWy3+HCn4M9+T
         JOWiP8xEsQrWQH1K4IgKgyBd3+mNQYUQ/Yf5UP3peKAOPlaQVsdNaJ88D3RoZ9DewQds
         X7JJ/Scs+L2+jjODfivdTjThhdGMe/2bIv1W7uSyE6MSb9jdEti9B/oyseaeS9nthRsL
         tpT1YoR6vCoG44IV/y+b3UHcceSZUQPLyQRj7K8BbC/7pzYm1VP1m+ePaJQ5h+mV7gHW
         j21Q==
X-Gm-Message-State: ABy/qLa2ZrwgZ4VYzgni8iJ7OrCwODgiZMyXjtYbb3og0A5o1xX9g+Al
	MM6WJmD2mbUcpNdA3tEVmLNEKQ==
X-Google-Smtp-Source: APBJJlEo3gtTsxiR0fYDOZcP5/iHY2QuQDqA3+tze14PsUJjDAVDEFqk1Zsr4maai1yipTLksmB6mw==
X-Received: by 2002:a05:6a21:32a9:b0:137:514a:984f with SMTP id yt41-20020a056a2132a900b00137514a984fmr9109819pzb.35.1690208454453;
        Mon, 24 Jul 2023 07:20:54 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id s10-20020a170902a50a00b001b8307c81c8sm9009821plq.121.2023.07.24.07.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 07:20:54 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v3 2/7] dt-bindings: riscv: Add smstateen entry
Date: Mon, 24 Jul 2023 19:50:28 +0530
Message-Id: <20230724142033.306538-3-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724142033.306538-1-mchitale@ventanamicro.com>
References: <20230724142033.306538-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_072055_581192_64663B0E 
X-CRM114-Status: UNSURE (   8.38  )
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

Add an entry for the Smstateen extension to the riscv,isa-extensions
property.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index cc1f546fdbdc..36ff6749fbba 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -128,6 +128,12 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: smstateen
+          description: |
+            The standard Smstateen extension for controlling access to CSRs
+            added by other RISC-V extensions in H/S/VS/U/VU modes and as
+            ratified at commit a28bfae (Ratified (#7)) of riscv-state-enable.
+
         - const: ssaia
           description: |
             The standard Ssaia supervisor-level extension for the advanced
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
