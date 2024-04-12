Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBAAC04FF9
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 05:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KEtxqMpaYKuyYD+B4NVhqgEem+kn5PdYtk0nG1z7Z+o=; b=JBNXFNxigMum3L
	YXR1EPPbWv0xDIcF10bo1H1d0QaQtDTCqGsf6PRISWpo6xBw/2oHoIc5zajlzA9RhaSyqXrI0M+g9
	fq2d6o+3LIojkhpxFYSzT1LuladjiN63ugsDQYANcqsKdWrWEu8SZX1hRHj+Gg4gmqVPMpdfe96Kp
	1XY1NuvB94u7OZR4P+LciMQOh9jDSdlNv1WBzYmF+yJc4/ktHLKqnVtcxMrK5cYl+fmIxPA7SEq2+
	WIFt60F4pwBkhcd0n2LvoH5h+Qd9NE0P/yNBgDFX9lu6VGmG5hrdccL6vPdlXN+np5j9cHxNTVls6
	Uoe4gJBdLRRqat5w5sDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv9JB-0000000FND6-20Mn;
	Fri, 12 Apr 2024 05:18:41 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv8GH-0000000FA73-38IX
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 04:11:40 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6ed112c64beso471813b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 21:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712895095; x=1713499895; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CvKWdpWCLanAFVX5zPtD2b3biice8x1/52aRbRjA/1Y=;
        b=AllVP73kBwWwYzp1qegCHTVGRhgRoYn/UkCNA4i0ftQHvkGZVhsgYoDgEIkfZpRwCV
         Sm/L/J5xJI+Hp+dz0XOoh7GcZwbum5weVAJgV5D1ufjCOHu1ma/6r0WSVV6JxRFP9Z9u
         znYYyJJeXcvviuQux0umhtFIDqIGUajgrDHoyl0wfX34NbwEb0kgasYuAw0iciK4ghoQ
         a4U8cAuFvB8xRkcIFq/P4YoVwbGmFSt4VLedqYZKutkDzhwEpdwdEPYdwqtNGzLiEnrS
         P+lx259nxVxqA9j10S4A+9l56T33gyACO70YAbAsMKeBojalksZtkZCfOWwbxX8Pt2oP
         u+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712895095; x=1713499895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvKWdpWCLanAFVX5zPtD2b3biice8x1/52aRbRjA/1Y=;
        b=kgxe/bpsTD16ogFqlHZ2PxSro7CwivVVr2M6FZJEMLHC/fLsLZWvySu7fYbEssvQM4
         s/q+uwJ1Cs9uUvbCN7DGOI3hSmxLaC67zCQcxksOWAEY4cWyT2HdRXbQpArSF9F/Qyse
         SlBlbZTkkRU2j1y9LnbuuPdMeEtooSCbwxNsRRqRGmXa7IQxfyjP8e+qJqtWa1JEqAUn
         fDusT5mFYE8ereHAysxElyNOUuMKPffwO/9yCIYvDnp0dAspo3uv/CrOAMgcwUvHJfzh
         4qlLZTPrW8nri4AtiWhd8TqMR/EBdX/Kd41BF4vWCUU4aRsmTArxlPYI2mo1duGKRleO
         kRMw==
X-Gm-Message-State: AOJu0YwLBQCaAihXrpk2YtFCCWUj+yQhQdjGtZ71OmVtK2PoxfmoSKpK
	9VRkhP/tEZql3UrvVyWKvoX+ayN+52p75KhB2s3nIpaV8M4I4+UR4Oc1ruCNiJg=
X-Google-Smtp-Source: AGHT+IGEzhFDfz+tEhZaJYNr7eckM5oEi1A9mXDPnazuRSbWbM8XnHfKloHOzQmsXo7SSe+IWRZJtA==
X-Received: by 2002:a05:6a00:cd3:b0:6ed:2f52:9acd with SMTP id b19-20020a056a000cd300b006ed2f529acdmr2081497pfv.24.1712895095597;
        Thu, 11 Apr 2024 21:11:35 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ka13-20020a056a00938d00b006e57247f4e5sm1949712pfb.8.2024.04.11.21.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 21:11:34 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 11 Apr 2024 21:11:07 -0700
Subject: [PATCH 01/19] dt-bindings: riscv: Add vendorid and archid
MIME-Version: 1.0
Message-Id: <20240411-dev-charlie-support_thead_vector_6_9-v1-1-4af9815ec746@rivosinc.com>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712895091; l=1246;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=aeD7kpIXCYXPUehTkm7IjjI1zeG+m9VrzZ6zXfF/zjg=;
 b=gyzpquIQ9EZPFl6tdB4X44dN/ns59zY4ew9u14pmot3GwLVRAjLHanoVkOR4IpnFrYW6m6+IQ
 FGixAlkBa5oBmgLlwpqraJRGcsWGjHUOq+pqsZuW+UYTSJ6pTTDEzAR
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_211137_828235_D600F83A 
X-CRM114-Status: UNSURE (   9.29  )
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

vendorid and marchid are required during devicetree parsing to determine
known hardware capabilities. This parsing happens before the whole
system has booted, so only the boot hart is online and able to report
the value of its vendorid and archid.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d87dd50f1a4b..c21d7374636c 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -94,6 +94,17 @@ properties:
     description:
       The blocksize in bytes for the Zicboz cache operations.
 
+  riscv,vendorid:
+    $ref: /schemas/types.yaml#/definitions/uint64
+    description:
+      Same value as the mvendorid CSR.
+
+  riscv,archid:
+    $ref: /schemas/types.yaml#/definitions/uint64
+    description:
+      Same value as the marchid CSR.
+
+
   # RISC-V has multiple properties for cache op block sizes as the sizes
   # differ between individual CBO extensions
   cache-op-block-size: false

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
