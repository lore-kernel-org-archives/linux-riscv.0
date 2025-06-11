Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EA5C7113C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jQM5sVBDSd+VaGtRea7L9VY4iZCSKjUwqfsiMQWxmI8=; b=FwauhE4qV1WUiH
	iWrgY3XRJDW9mm2kSNzsVsj7fjv0tA9//4Wdtx3/pXDRsDlE92wmTM1p93vth6o4h/BzC4fpZj0Ry
	9sqrT/63xcpOuSKaVPU+W274+P49dmM5E6s46L/nn40Wq9aY3uALi1Mv9nnep0QwKyEUgg5LiNnCU
	YwqvtDckbfL+QQZiYjzUt6oI7uLYFyWkfWhrclxafzHF/MAFFfb7P74Q0siuemtGY7rYeGZIyxXK2
	cHzDCwdlPfzcwuKUIE8SBkbeozIYUR4pMYQ/69K3NoYid44lqLahx9ZllwgA06vdSisjYjaNGEsYJ
	zCVsE64RHO7oknZdeh7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGwA-00000009HjI-1OyV;
	Wed, 11 Jun 2025 08:35:58 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGYE-00000009ECs-1xu1
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 08:11:15 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4a4bb155edeso78643361cf.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 01:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629473; x=1750234273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00Y+C1NgJK+RcRNEHyqDxW/VXT0REGuVvjiQNS/nXxY=;
        b=AFPeICzhPde+32+bpO5IMvK3fiNS6nEmn+LY1OZwvwleZOdY6JysjVuduj3VLp9BC3
         Ls3mmTnBA6mmxJE2euMBh4NvjiSviF7GvfvdrWOUw0GWtb/vl/Ek5UzPdHy9yncyIj1a
         ZUFdBo37o2JZFI4tR5Fx7FkuJkPHrgOKxBF0NSCLfqgzhl7ZKT/rKabXl2gd73gcfGAt
         roXAEknH7wEKTZnfCcD5fmL64Ceyft0qwkslMe1GPDn414jmbFc4iXuO7NhhHWzrh05a
         iN/uJKPs5fRiIYHgSWWxp2x6JW24cXLUbWNXETalgADMN4aJ+jdAtn0C/kqdw0WcgwoJ
         dBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629473; x=1750234273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=00Y+C1NgJK+RcRNEHyqDxW/VXT0REGuVvjiQNS/nXxY=;
        b=r4ISw1bkDuD3qIgi9aVDnTxrkY670x7EROZItKD1ol5pn0L1WqY012+/LjFCS2TMxR
         kuwJ6xvVL4pXprNIWaq+jDJZv5fw0tDPUUu+wpibYcOqisfNVwcT83LtcFtVSa2o+y0r
         7FDPrRxvxxIL4wAUHDm+IZLN93pqyq7X0I06HSmnWEoJrnzKOgDDczYgi4lMQL+zUPZv
         S8B/bh7XejlzyYzQASHHy/t6gcl2YZd3cx4AQMJC6aHLIeE7nyWbUDVSBZTYIi4ZLZW/
         39TeedKHAelrgUWOJW4qg4PT4hafQFBi+uY1YY7Ceo3SKDvbWrNM5jpx93KDRIGgs+87
         3WOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYLooD2Za7QO97oXyq0iofwYEv7oj6zynjseVq13UhCItsB5U1YQOfi/EN8tkMx5zzje/9bZdTyrQmPA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmHskgJ3TWl+CvD6X3aiYsdryY5GpqRAUeCptkE+6bM9AqMPtr
	oJ7jaEEA4dbjBQXM/fnK8uhSUnUc4giGVoStXcuvKAgX4nV2jYotJyOF
X-Gm-Gg: ASbGncu1FS0IZBwAtKfDtI3ksxWLSGo/dqVCjlIs2hv3hoXaWpFRUfedDM1CMIVEUOx
	aPo7PYuEFaqjziBmW3hoidhSeN0gczzvYePFm1TEcRrNpTj3w5rS/zfiz4bLBmBw/i8AqjVai7v
	r3ubq2CxehUbEv3QFQbnvq1VI2rgf02Whi9YeHEzD8LMzosVwmFPGMNv76yJU4k1USFQ0x+Z7PY
	i+009SuihNHnzdaOK7I82YDzE5+Wzn694Xev91BpxIy9RrjRo5BeRjEIyiExcsPzoZGM0WqbK24
	LvEPnlr6ivOyg5D4WHAxtUQn9zslLOr3UKKrh3ljaGJ60yDV
X-Google-Smtp-Source: AGHT+IH/A2dN7aEwFSvK+XOGHnNd1Ms/qTqK5FFtVoR1qjX6O4PJ9oh2Gq1zA0E/mBczJM+1ZkNyHQ==
X-Received: by 2002:a05:622a:4249:b0:4a5:a96d:6068 with SMTP id d75a77b69052e-4a713c5871dmr48328971cf.37.1749629473419;
        Wed, 11 Jun 2025 01:11:13 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a611150018sm85377551cf.8.2025.06.11.01.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:11:13 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v14 1/2] dt-bindings: dmaengine: Add dma multiplexer for CV18XX/SG200X series SoC
Date: Wed, 11 Jun 2025 16:09:58 +0800
Message-ID: <20250611081000.1187374-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611081000.1187374-1-inochiama@gmail.com>
References: <20250611081000.1187374-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_011114_509992_3BB085AB 
X-CRM114-Status: GOOD (  12.56  )
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

The DMA IP of Sophgo CV18XX/SG200X is based on a DW AXI CORE, with
an additional channel remap register located in the top system control
area. The DMA channel is exclusive to each core.

In addition, the DMA multiplexer is a subdevice of system controller,
so this binding only contains necessary properties for the multiplexer
itself.

Add the dmamux binding for CV18XX/SG200X series SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/dma/sophgo,cv1800b-dmamux.yaml   | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/sophgo,cv1800b-dmamux.yaml

diff --git a/Documentation/devicetree/bindings/dma/sophgo,cv1800b-dmamux.yaml b/Documentation/devicetree/bindings/dma/sophgo,cv1800b-dmamux.yaml
new file mode 100644
index 000000000000..011002942235
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/sophgo,cv1800b-dmamux.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/sophgo,cv1800b-dmamux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800/SG200 Series DMA multiplexer
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+description:
+  The DMA multiplexer of CV1800 is a subdevice of the system
+  controller. It support mapping 8 channels, but each channel
+  can be mapped only once.
+
+allOf:
+  - $ref: dma-router.yaml#
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-dmamux
+
+  reg:
+    items:
+      - description: DMA channal remapping register
+      - description: DMA channel interrupt mapping register
+
+  '#dma-cells':
+    const: 2
+    description:
+      The first cells is device id. The second one is the cpu id.
+
+  dma-masters:
+    maxItems: 1
+
+required:
+  - reg
+  - '#dma-cells'
+  - dma-masters
+
+additionalProperties: false
+
+examples:
+  - |
+    dma-router@154 {
+      compatible = "sophgo,cv1800b-dmamux";
+      reg = <0x154 0x8>, <0x298 0x4>;
+      #dma-cells = <2>;
+      dma-masters = <&dmac>;
+    };
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
