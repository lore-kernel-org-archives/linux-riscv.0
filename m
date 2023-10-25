Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DA1C25B6F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 18:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D5V/QJA3+oBusonRaln1gLh8/i2QNbM0yRiIKbWY7Wc=; b=M/rE/ikIty88GC
	t4nf+A/dC+hkN/OJ16Y0H/zN94vkm+vm2Pj0+QWErCQKkLxAUgxfor2XVKWQnWzYpPRRbsEBF+sM3
	S4npKb+hw08u2jW69bt91CyqO+j0f4U8Lzqerd+cIGU0s0T5tbvI/sNGTR/kKZ0EgYW3q3Y0jtlGW
	dq9degU6a6VXJdxcnJQkU6hDqNq1/IT1wIy/kWO0+yajZxJroQ2HXOH3eq+aWn9ESRaeWoSEmW5PH
	Ua5tm6w33k7t//oRLYHbdf7ejkOzjmEQt4p2Bym6sifJZz0e7LR9dBALxCIUudPtx3SYkRSzn1pW4
	6iXb7EDlA1S2iF8fzGUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvj3k-00CuVe-1P;
	Wed, 25 Oct 2023 18:56:52 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvj3e-00CuTB-2u
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 18:56:48 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6E316413B6
	for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 18:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1698260205;
	bh=FFiHmR7ukRwdZCsC7cixmRTY2MvrJS7s0z/YTGkE2iM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type;
	b=tJht2Jw7MEkN/cCOzA/3zFCdHQwj03EOjOqXKSF8COqifzQ8J/rNBbmE5C/p1Nk/O
	 /x9xXh3xbDk96ylILOqe28eDsg3Xq6MKxrScjl1T+b3IxV8EuZIefjHkJj1TmTubym
	 wWeaiMFhOWssNnz31ae2aD1ArGkIyzhsIVSkn/Wb0KORHFB3SZzSE1YzZet5lw/lIP
	 8kxUpeLhl1dfzvoUPWh2x2O898jDagoKVXLP//b0ArZmxSbBtm88NxamKBavSswLlt
	 q/H8h04yFtng4AKDBTPc+CR6964PB3yMEpnuIqOXDj+CuGal7utHqvyUuxd3EjV+FA
	 w+cdZgpDzAbMA==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-41e16b279ffso1453281cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 11:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698260202; x=1698865002;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FFiHmR7ukRwdZCsC7cixmRTY2MvrJS7s0z/YTGkE2iM=;
        b=h03UhMJjVUZDDLo6W3rWEPf+S9XFHDBG44vl4tBTVSY0Ri8+uA1dnTbzV5+7juzznW
         zM6/5bKhJAhrHTtz8ZHPSG4KZYtIMFuPOpJ2HFg0b3ctJZ6W0V3/qhKhRDJzjK9Ppktt
         YIeecTRbCVlffyKeSAeuVdHzzRroWdB4XZCOJ4bGZ9TWDSN/C2RoDCJ6HLPJTfbGsmNw
         7HQ61uWBMtAMq4yqxxE0uYMxMTlyniXPvddHmlxTe55JZZGxIv/5uUc9guI+w/pAOzbz
         AmMdEpQYW+YvApz5c3Tyz/LrKgfy9KSPLhVV3t3JQ+3xvxSaJqauYM5t7uraAxaQTXHF
         iOfg==
X-Gm-Message-State: AOJu0Yw7qIQVsy0bAggyoiTm/mZAczE8rBBicyliWmN86gczELOzlzDZ
	6EelOIDI8Csku5jPLbx1D3kKy/Dkm4J06a5IipdckX7QNQHtFLhegpQTAocQXOv7PKAy8R9cvQR
	b++UQV7tpNqQSiJcFpl3PCcMmg8NBTzX/mcSS/LwLa3eQLyORzoZaU/Jr7mCxVE2AF+Ifpw==
X-Received: by 2002:a05:622a:14e:b0:41e:172f:6e78 with SMTP id v14-20020a05622a014e00b0041e172f6e78mr15135517qtw.29.1698260202169;
        Wed, 25 Oct 2023 11:56:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRHDA8d43i/0eqTtRETVi4ef1AAWHZvlYua8G+9qwUeJ5hvjbzmci7qiMP/aXUn13Et1Ecrw6N0+hOCNM2Ze0=
MIME-Version: 1.0
X-Received: by 2002:a05:622a:14e:b0:41e:172f:6e78 with SMTP id
 v14-20020a05622a014e00b0041e172f6e78mr15135502qtw.29.1698260201944; Wed, 25
 Oct 2023 11:56:41 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Oct 2023 11:56:41 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 25 Oct 2023 11:56:41 -0700
Message-ID: <CAJM55Z8DXDs6LT0JrTyEMp8V6BHvsjUW7aJ8Gj+fRGsasHAi_A@mail.gmail.com>
Subject: [PATCH 3/4] dt-bindings: cache: sifive,ccache0: Add sifive,cache-ops property
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_115647_065850_4ADC2C26 
X-CRM114-Status: UNSURE (   7.70  )
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

This cache controller also supports flushing cache lines by writing
their address to a register. This can be used for cache management on
SoCs with non-coherent DMAs that predate the RISC-V Zicbom extension
such as the StarFive JH7100 SoC.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 Documentation/devicetree/bindings/cache/sifive,ccache0.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
index 7e8cebe21584..36ae6f48ce0b 100644
--- a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
+++ b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
@@ -81,6 +81,11 @@ properties:
       The reference to the reserved-memory for the L2 Loosely
Integrated Memory region.
       The reserved memory node should be defined as per the bindings
in reserved-memory.txt.

+  sifive,cache-ops:
+    type: boolean
+    description: |
+      Use this cache controller for non-standard cache management operations.
+
 allOf:
   - $ref: /schemas/cache-controller.yaml#

-- 
2.40.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
