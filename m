Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C0EC25B79
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 15:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vlCaKMrLYJVkDA+y4hA7NldYpSbUNcNmPIHA6/C2R+A=; b=SASKEQWoopdUTW
	uDyLoKvZCsxPxpks+w79/ko6dTO/1w9179/arPqzopZ6+TP8AkQIKwcvZl5inbCysV31NaCTZonTo
	UdOYHqZWWAMqDBE4EzdwFH20YC3/tmFYMVzB03qnsVTX3UI35THOj5ldaeXxl+c5CO2wzXqLPT/QJ
	d6TrBdINlOw6se7w6L0CMMqwViMuI/SwGZGv1ZWbK8MWzXkZfjy6dqiwA2ayXdqrSD4KYY4VIg9oU
	bFODw76Ejt5IIPdFcOQj2eq9cqY7JUQoSsmqWopQut2mpzB72v7akqEW0qTg93grVwc8TohEOj0uy
	Z/RXWX8jMPcZWV+iggdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9o40-00000003Ok9-2cvo;
	Wed, 22 May 2024 15:39:36 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9o3y-00000003OiT-0q4P
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 15:39:35 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5ce2aada130so2283857a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 May 2024 08:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716392373; x=1716997173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yvxfqkh+gSZbJyfshoQXFXdD3Y8gaC/pv6t5Ay+4a2U=;
        b=Qqnn1H+muUA/c5CPuuPwF9Bh95jUx6p+XP+algFQV0FsxAGI53eGp0XVtuo2GT1G6p
         f3uDlPVmxT+ce+eTuB0j/vV6ONsTtcj21s8ek9f1ywtAtEf1RFNwh55wVok7VZI3MN3o
         HnrNoBKNZhiRCwTKQ8Xq30H8vtfbuqclDSNQKZ3TyEOOK8HT1WDvjHEp46kCLy7LbB94
         D57YrsNmjH9DVG7Jysee039bJOVo5VNsXQQTZpi/oeZYYQnTZxKyQwImruBBQdOvXH2V
         qOwWD/m/ZGWeFiZMhwcKcK1hy7UrudgGdkqe0DfLkUvhIIOmZOYtDGB2Zxq2OXkr/7JU
         gW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716392373; x=1716997173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yvxfqkh+gSZbJyfshoQXFXdD3Y8gaC/pv6t5Ay+4a2U=;
        b=UiO2gR2XEILDIKXgz+j5djtSY3FW00zfQFpe6h37+L1Tx+/lLMdkHh2yVWiWljREZr
         ejHmby2R8GVC/VfLzruGwjTWZ8D+ycZWe2HPgh7KOgSiXFSl4mRx2j9v7FRxedWj0LDP
         VjPOq2vvDp/3+Ia/2ISQZ/rJNLUpipBR28sdrroCIgORiRqrpMI4UwRb5VpibR2mdn/E
         qTfeOUu9Hpagnt7X5j9WB7QURp9emcGAEbeWcWOfYbClb1F6QcADyBigcP2X6dNxGmVJ
         Wje+SGaglTaVtQSCDpvZYcz0jw4+MvlWvx897PwVnJetmjFAIMJto01gpc50ORV8yp0p
         mUNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhmLAmw9iOx/Q9vc4z/MWJ/dbqVMC7ExWl8Kiw8zQQ8jLcivXYp7kgA+k1+PBlZZdePdFqxGaESeQNq0p0n9hMC5KFcFmmhsg7Q+y3CPpS
X-Gm-Message-State: AOJu0YzRwE3c6RbZGmO1XeAd0HR5XD+cb+G6xtY9khvMxSeZvpKZF7yI
	12ziFDFZGT73ZfWHOjFamSZL4ZmW4Mx9IdmTSM4ALc46VC2dQNBw
X-Google-Smtp-Source: AGHT+IEvl2jl89Ll5aU5bNVUfIG87vrt2cUkmGN76Ttw5yLV7y7OkQZbEcTGoE9Ry6NS8Vd6Ho5icQ==
X-Received: by 2002:a17:90a:5982:b0:2bd:8aed:740a with SMTP id 98e67ed59e1d1-2bd9f483e65mr2313191a91.23.1716392373545;
        Wed, 22 May 2024 08:39:33 -0700 (PDT)
Received: from localhost.localdomain ([223.178.84.74])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2b628ea59absm25574077a91.47.2024.05.22.08.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 08:39:33 -0700 (PDT)
From: Kanak Shilledar <kanakshilledar@gmail.com>
X-Google-Original-From: Kanak Shilledar <kanakshilledar111@protonmail.com>
To: 
Cc: Kanak Shilledar <kanakshilledar111@protonmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/2] dt-bindings: riscv: cpus: add ref to interrupt-controller
Date: Wed, 22 May 2024 21:08:38 +0530
Message-Id: <20240522153835.22712-3-kanakshilledar111@protonmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240522153835.22712-1-kanakshilledar111@protonmail.com>
References: <20240522153835.22712-1-kanakshilledar111@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_083934_260681_432F3041 
X-CRM114-Status: UNSURE (   9.53  )
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

removed the redundant properties for interrupt-controller
and provide reference to the riscv,cpu-intc.yaml which defines
the interrupt-controller. making the properties for riscv
interrupt-controller at a central place.

Signed-off-by: Kanak Shilledar <kanakshilledar111@protonmail.com>
---
Changes in v2:
- Fix warning of `type` is a required property during `make
dt_bindings_check`.
---
 .../devicetree/bindings/riscv/cpus.yaml       | 21 +------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d87dd50f1a4b..f1241e5e8753 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -102,26 +102,7 @@ properties:
 
   interrupt-controller:
     type: object
-    additionalProperties: false
-    description: Describes the CPU's local interrupt controller
-
-    properties:
-      '#interrupt-cells':
-        const: 1
-
-      compatible:
-        oneOf:
-          - items:
-              - const: andestech,cpu-intc
-              - const: riscv,cpu-intc
-          - const: riscv,cpu-intc
-
-      interrupt-controller: true
-
-    required:
-      - '#interrupt-cells'
-      - compatible
-      - interrupt-controller
+    $ref: /schemas/interrupt-controller/riscv,cpu-intc.yaml#
 
   cpu-idle-states:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
