Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A86CA0FEB
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 14:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gei1bS/lWmQDAGJ3t5VViVYrPII6VIDnv3HBNpab0HA=; b=fp8D6zbuExHo0I
	N606xpa++v9Yfz7mAanqLlfbjMRWwjcxd5relPmRdS2V+94PyzDurrlZX/OUVmvJdChQAoVmnSaqx
	cxeUJ4bodw7eng2hSUwdKrL/wmwpWcT359AP7L7uOKXZE2fElLEiwoLnJ3f0p7LbTnksJbQw2DpJ9
	6eSAlT0Vs996mJVfcfRRXEZJcLZLwdQIky9DY92dy+SRBvHT8OkejxYCIgQc6X+80ZV/21BwbQeRn
	kT/sb8OGnvJ+RZ0I5KzAwp2ouYyyfNKDw5/0F4xlxbcCZGxH+VPahAhrKnV2tWTFWpJa8ksef2btv
	DLrbcdhIAvqJQ9bXSfxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqv9F-0000000CMKW-23dw;
	Tue, 26 Aug 2025 14:59:45 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqv7W-0000000CLzO-3qeR
	for linux-riscv@lists.infradead.org;
	Tue, 26 Aug 2025 14:58:00 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-771e15ce64eso1797809b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Aug 2025 07:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756220278; x=1756825078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PM7ZOBxbXaYL3polB/sK+4dHFDAVqr3gYjlAgyAuBEQ=;
        b=OcpO9YLuY5MaB/OPhfnzDGdNJSZTKaetP29aujozr1CdGAnrD/pJZpaSZWn8e2AsX4
         u+I1XrfhX3VN4QIdYiCiL4c6wZYhH1bUTsSdW1JBjSNjQoXmG4gV3IMz107RO5xe5WCG
         rFCKDnqKvexQaHTpSq7PlNPHipznyNQApPwnPRlQ8Sicv29URDJx36edQUXruxKRGSC9
         b7HzqKO4rNg+uzBQVIHfN0ovAE/An9UVY3nn+mCkJfIjGwgOCgISpfehFwm4nML8YvN3
         eOvAD5fos29nPAZzTs+lYetDRguSC/5Rt4w3aEEPV3VyYvm9CygCTxw/5W2C0fNhE1Nw
         N7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756220278; x=1756825078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PM7ZOBxbXaYL3polB/sK+4dHFDAVqr3gYjlAgyAuBEQ=;
        b=DwnqQonY8rvWLkl2Lx03Q8luo3iHJsDk5CviRLQC0ODGVqR8yfaALTLP17LHgPbCvm
         gx/5IwxKFov4LEGbDxQwiPfZgvY2keIsl4Hi0WeMCpJzomdolg8ph6G/u0hr2CSRqdV8
         Ybwhe7KOjNCU6l/9ZRsUzXz73bc6plEIDGC/QdwrvgUuOzYyUbXK1ovcyKa0nkljJkuY
         JTUpuWLBQWoPaYCsn210S4UUlGJ9mGDkGewkYbNs/odDexLX4g+TmeJEzB1CQT5ZMGIn
         WBF+79jBEfrfA5ulGvAhxOL2/sFmMZ/kR6aUy0GK3VPf7OCholICyDwTKhlwC7E+hb7x
         m9qw==
X-Gm-Message-State: AOJu0Yxvj6XNJ2/zYeJVlCtqXPtnFfjk3mXyxhptwOWKqbcSdHx7lMXL
	gcMJ8eaao+/ITVx0RIy6r7rm3CZ2bNzE6GOzgebZdNy7uquD1gl6j31SkB5VMVEITVM=
X-Gm-Gg: ASbGnctjVL1PLBySURyZ4nFP/ikjge8k9w919jTtH54iSsTnBRXwRQAtJDe2YwS7FbN
	hfgc+kkAXvOIPYp0M/PXeacc3oitARqsH7no9nutUtcesSWenXTkKqQCCLJDlN0MzVnswqhVqom
	Qel1HMtdUgtg/931IIuG1d1pSces89ukzqRn7SxjiiEePs8XSWiYzrYBoocwuJdtD/+SrKz4i9B
	KlN9KfiyeOpqB9u7J9TrHzZvaB/3ZLyk/fQ1zQuBNdg0mmVTsZfZGVbdRrXbK49NeZWTqyGwxZQ
	8+Lkd2u7dnv5EfJZQCBq2y4HULvlnmEXRcwpgZT02zevHJlBHUY/0FoWT5i0sidr+pkbpyGdS6U
	3STFQ1paTaFSL2A2LC+cVSTttnTgCQ2SCrcO4aN/yoWUOqI6vhRNM9CCHQ8833BLyTxmXJ4fQ0q
	tD3La62kRoOA/JQWtwPSSmNwcIG4W+8r/XVeuYh3pnt8c=
X-Google-Smtp-Source: AGHT+IGRZfzmqas8P2qIkEBx55WpUsJls+/G4WI+d+9aViOVixxjip0aXSAjUYjI6b7UbZ8AtePGhA==
X-Received: by 2002:a05:6a00:1399:b0:770:5544:dc0c with SMTP id d2e1a72fcca58-77055544aabmr13666696b3a.32.1756220278054;
        Tue, 26 Aug 2025 07:57:58 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77059928c5asm7209799b3a.1.2025.08.26.07.57.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 26 Aug 2025 07:57:57 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	ajones@ventanamicro.com,
	brs@rivosinc.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH 2/4] dt-bindings: riscv: Add Zalasr ISA extension description
Date: Tue, 26 Aug 2025 22:57:38 +0800
Message-Id: <20250826145740.92276-3-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250826145740.92276-1-luxu.kernel@bytedance.com>
References: <20250826145740.92276-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_075758_955250_541973FE 
X-CRM114-Status: UNSURE (   7.10  )
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

Add description for the Zalasr ISA extension

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index ede6a58ccf534..6b8c21807a2da 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -248,6 +248,11 @@ properties:
             ratified at commit e87412e621f1 ("integrate Zaamo and Zalrsc text
             (#1304)") of the unprivileged ISA specification.
 
+        - const: zalasr
+          description: |
+            The standard Zalasr extension for load-acquire/store-release as frozen
+            at commit 194f0094 ("Version 0.9 for freeze") of riscv-zalasr.
+
         - const: zawrs
           description: |
             The Zawrs extension for entering a low-power state or for trapping
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
