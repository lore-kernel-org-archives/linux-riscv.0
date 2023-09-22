Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1728BCD4F3B
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 08:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y6EzTHniu72pBHP9G8hYg5YnpFLEwtesKM4VsrKXY1Q=; b=hYrKzeWkWsc2Ls
	lK/HS6zBUfm72pku3cPwn4HMSSfLEmowKD+M3ACNgVE1KUc0UU8JnsQFi6qQ393URwpiGlXxgQQaZ
	i1+hp7D2eClQ46bkMSZeGZyE5wN4jBJQHMkhR8fy19zZ+Mvy8+9c9K3pPQvltxjAKd+XqnaO6Ff2P
	Jr5OxdihWCo2icyf3OV61zndiw3/zqo1UuDoydWFpAQgYbek9VURdz15aOIPx0x/3ydiYeokkp8zB
	x8bpvKs4dFXLFWBTKBzU/S1qpsQtS5cEY8IYWc+1GHmIe/c9Mq+IW9wgxAz6WaoV9oQo/N/e3+59B
	+gKCjDj+IuQd840oNyYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjbya-008TIP-0G;
	Fri, 22 Sep 2023 08:57:28 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjbyX-008TFe-1I
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 08:57:26 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-274dd099cd5so1374568a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 22 Sep 2023 01:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1695373042; x=1695977842; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RDJs3U1rqa7YI0/roeh/1SBiVi3tTUp7AZYFFQzYY+8=;
        b=W1C0zC7Ntnc1uyftRER0QwKRTBXP0tzPb7SnTwvjinh9ZuuY4+HU9Q0vl+pSqB1F7L
         uNQHLZ1MfMJFyMM8BtDhvdTBt4YfK7hrVQeyxrXOrlW/yrSxJUUVKZfqyg02hV5MH7FN
         DP9Ckb4ou1U7ZmhJN/C3NjjmlLeCUT9fLj2eNQYtwqwVjZDCgc4GiuZXmay4pks7qNjn
         kv7ShWTaqFebMbbdKJofbrJ3Lu055BrZ5IYSJyu1mH9cpiKJSRyQ9nSUz/sBHv7MdKAl
         QYZCWdgYbKnB3789mFZlbo7j68FgqnS9DL6SIErWrvJ1p81yavxWA1SANUhPRGZQ6Tc4
         9NiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695373042; x=1695977842;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RDJs3U1rqa7YI0/roeh/1SBiVi3tTUp7AZYFFQzYY+8=;
        b=UgcPugTdJRtuETSOaO66vbSuNCPdDz842ShTvK8ssb16zF8lwIl2xRQO2MxrYcm4TJ
         6f4KzY8irL7UyYIvsYkenKegkOh2NjPo4AzUdjNdCUcPu6zxBnGeJh+/HolTlmvYAs0U
         Nr+qaDzVmEJgDdqfGIbAnFnYIvdeFS6mg89bsQDKXu8hY6MOd4QgwTooSvmvJAL/xiDE
         4t5RccgBbTLQBkg7wWns4jPXg4yFQm0o8x14DSSmlmr15n6jTQxbSaUNlXJKlK4XrlBC
         SisUMlmhWkayTODz9V13Cg66WHG6xTAcAuZVlUso02Vvj1HcFJbLHamNdHsPSN7fjXuu
         En7w==
X-Gm-Message-State: AOJu0Yzlpmmu8djGiHZrEq0Bg91XVEPIcl/RFxTSULUmF38DgrfelmeH
	KMQCXqrhVWb0H3QtxeHP8ydsBRYrnpVpRJYEEvtjeCFVbkNREp59KaFqJEVZnsuy/e4dWBi5Mde
	tCAE8cxamiTOR5sUu0YHH5mYBxzOosKjo0tR2Q7AZOlVBEryruHQQijhWOoXzxiLdVGfVnyvioj
	5ycq9gGDnft4XkIA5g8w==
X-Google-Smtp-Source: AGHT+IF2S3T6M/QFYXn0AbVDOA44Le3cU3dN6opZxZukQlTXZ9dw1OqvhHYbfoOzCbab4UanG6N9Jg==
X-Received: by 2002:a17:90a:f687:b0:274:74ee:eda5 with SMTP id cl7-20020a17090af68700b0027474eeeda5mr7847201pjb.4.1695373042268;
        Fri, 22 Sep 2023 01:57:22 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id t15-20020a17090a024f00b00256b67208b1sm4815024pje.56.2023.09.22.01.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 01:57:21 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	tjytimi@163.com,
	alex@ghiti.fr,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: riscv: Add Svadu Entry
Date: Fri, 22 Sep 2023 08:56:48 +0000
Message-Id: <20230922085701.3164-3-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230922085701.3164-1-yongxuan.wang@sifive.com>
References: <20230922085701.3164-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_015725_437141_76753AC2 
X-CRM114-Status: UNSURE (   8.85  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add an entry for the Svadu extension to the riscv,isa-extensions property.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index cc1f546fdbdc..b5a0aed0165b 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -147,6 +147,12 @@ properties:
             ratified at commit 3f9ed34 ("Add ability to manually trigger
             workflow. (#2)") of riscv-time-compare.
 
+        - const: svadu
+          description: |
+            The standard Svadu supervisor-level extension for hardware updating
+            of PTE A/D bits as frozen at commit b65e07c ("move to Frozen
+            state") of riscv-svadu.
+
         - const: svinval
           description:
             The standard Svinval supervisor-level extension for fine-grained
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
