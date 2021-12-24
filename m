Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A49C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Dec 2021 21:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FWD3b/dKNIXygoil9HOTjzFojO6LFdXSjfjWvWJOkH8=; b=zCz6DCIIPGPJJM
	lWe2S3J1OeX4YJIpQf9oraJN7DydwQMHhZJtdxRIK4x2r9Y6mBHScVcYGFHQ3cZYQNO5U4iHXYLtx
	kSGEb0sw0coGLgYki70TyK+n/vLqLkM8DzFKl5d9VzTGeByqW4ulf59/yi668gcbIBgOuGUJHsynX
	NLjFcdUxnb6zjM3fHJRjwyHNbbcgATcEsOoj4eODEtVUyDii2xJRKW8HxoMbFGY0oRegtalhUaX27
	6CKVTxflsMTGkmyN05lTqHZmPEDTWWjXGc+wUf1CYOGmV+4nmQp5gTK/eviBYWOJB2xn5tiOH74oD
	Iu12FZwFx1Udbh49x7AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0rvr-00EU1g-HP; Fri, 24 Dec 2021 21:16:55 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0rvl-00EU0P-GO
 for linux-riscv@lists.infradead.org; Fri, 24 Dec 2021 21:16:51 +0000
Received: by mail-qk1-x736.google.com with SMTP id r139so8280254qke.9
 for <linux-riscv@lists.infradead.org>; Fri, 24 Dec 2021 13:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E7A0C8rVZs2QRJZNzs755J1B2170BxsQoRwKwZ1LCd0=;
 b=aCBQJO8y74WvDSbU/2B1LveeqjispKwyXm1o/7+/WPVuwFqZ02UmHm7hzcCx89gc5A
 9J6+kCe36praG3MbMC+uTZKs5NIwHqBBk7OUF495bM3a/IwWR71MXfHNe1Za5Zpvbos7
 NydMZ0A7209w9tpH/Z6Y5QKtcmFlVeIdlI06I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E7A0C8rVZs2QRJZNzs755J1B2170BxsQoRwKwZ1LCd0=;
 b=LtfIdOqOwEWN7ONELeCqYCECEK35C3CMVw3KRGLVGpASq3UOfn+XE/UHbiEkcygIa8
 zS1AwjFmJb91KFicAhkFSENKbMg6bofm12lDtlvCTimSn/2Kz8VBtaEoB+L6O4Sgyzg4
 RUaFf+ZGGozSVpTBpkR2eoafY2s+kLBh7ckd1yNaNAwrP6mrA88Cn7+PCtj14n4BQMmZ
 v0sijAdRGDDKceWyqpt+Q0uD0/RBQpIwViqcJnhIFJpYXcJ8wlVsjOB/dTKrC7g67LFn
 Fp8z5C4tEASNXVMOmKRhs/7fCIdtJV+ke/mcVfAr+7CtR1239MXOLbkln7sh/3sjAohQ
 Hj6Q==
X-Gm-Message-State: AOAM5303/FUnZsbPzy4xi5WseO9CIwUtKxHCtaEzySpXiDE1V91vXU6U
 gzYR3Aju/wXiQRh/HfKgv67F
X-Google-Smtp-Source: ABdhPJzNBJqRVH9StZ+KSjtDqfw+M9wX5zkuBVKyUeUUW4V7z0QeVHE+OkjlfrQyONyEumZsqvZ56w==
X-Received: by 2002:a37:9b82:: with SMTP id d124mr5747342qke.487.1640380608526; 
 Fri, 24 Dec 2021 13:16:48 -0800 (PST)
Received: from fedora.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id m15sm7661069qkp.76.2021.12.24.13.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Dec 2021 13:16:48 -0800 (PST)
From: Atish Patra <atishp@atishpatra.org>
X-Google-Original-From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 2/2] dt-bindings: riscv: Add DT binding for RISC-V ISA
 extensions
Date: Fri, 24 Dec 2021 13:16:32 -0800
Message-Id: <20211224211632.1698523-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211224211632.1698523-1-atishp@rivosinc.com>
References: <20211224211632.1698523-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_131649_566460_B0E43790 
X-CRM114-Status: UNSURE (   9.40  )
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

RISC-V ISA extensions can be single letter or multi-letter names.
The single letter extensions are mostly base extensions and encoded in
"riscv,isa" DT property. However, parsing the multi-letter extensions
via the isa string is cumbersome and is not scalable.

Add a new DT node for multi-letter extensions.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index aa5fb64d57eb..6c4eecf389a9 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -78,6 +78,15 @@ properties:
       - rv64imac
       - rv64imafdc
 
+  riscv,isa-ext:
+    description:
+      Identifies the specific RISC-V instruction set architecture extensions
+      supported by one or multiple harts. All the multi-letter extensions
+      should be listed here as a boolean property. This subnode can be under
+      /cpus or under individual cpu node. In case of former, it represent
+      the common ISA extensions for all harts. The name of the boolean property
+      must match the actual ISA extension name in all lowercase format.
+    $ref: "/schemas/types.yaml#/definitions/boolean"
   # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
   timebase-frequency: false
 
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
