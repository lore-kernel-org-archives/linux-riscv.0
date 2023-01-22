Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634C5C54EED
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Jan 2023 19:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pvqYVPdCUEGqtyJckt8kai7w3H71663l7nOLT7wuvoM=; b=FiaFqCHa7ALuY2
	2AkFBnQniA/pfvZzpjcZ8x6WGBdqSDlDYHwUM6DppOmNOEokNVxMVQGNvRj4QYRNrbqWV65Q2+cw8
	yieghnvkZI2chyrHriPVvyDf8R+E/OOpFIdc4iH5VtmOIy3ymSSLKQzraFjCqpfmuZGkKD5ZDMHAz
	uf4X0hAIA9MI3xxKYPlTknhp+V7oI8ksW/HUhSbfBj1g0/Xc0u7e8OaIfvf9p+uxzPrxD0UkTsLvQ
	vdZVl1GaBW7UvrgPehwIzwKv+mnWXj9mQnMn7dUhrrukdFOdxT0f1o75/7BszUtbk70nx4LSQHTmt
	CAWYbpr/Ds9Ipr324ffg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJfmg-00FiFT-Cl; Sun, 22 Jan 2023 19:13:42 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJfmZ-00FiAj-9d
	for linux-riscv@lists.infradead.org; Sun, 22 Jan 2023 19:13:36 +0000
Received: by mail-ej1-x62c.google.com with SMTP id u19so25556702ejm.8
        for <linux-riscv@lists.infradead.org>; Sun, 22 Jan 2023 11:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhy/POJEtJdJSr5RY889puIrnfeFfz3z2diO201SNkA=;
        b=jOxwug46zksPottjilUImIz6nqKLPs6Nlup7X7YzCZ9MsO+l2+N8pBXfTjo0xGaa2K
         e9JxVNgWaThqd332Xer7/VHSsvKigfzlrj3J64+27sv11usIQHX9C1VO84OY6FIBx1Po
         /kX577dxyXu1SpgpzW9Djn2Uw7nvbFSuPCCQ8OcbXVVwg1cXSFdyg2hh/PCUFNlN/0LA
         eWS2q8Ehd9jcvIKDQvAAoYf9B0I23RKnENsg76/PbnXwN3uhAwy3XKiESdrAtjUrYAjr
         BsTdR9lliUGufaNLdDs21FuA3GEd2GxXAdJGbWFMeh0rgnN2OoY0o4Ve0a0FKk5aQn0K
         Z/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhy/POJEtJdJSr5RY889puIrnfeFfz3z2diO201SNkA=;
        b=wCER98MySK4s/wLwgw/G0q6V8/fd6Yi19Qu9xSXpnkwDVQpg/ZfpkDhbAe2yk8A3Kd
         lM5/nNSC1I0s+XVISei4BlLKJ3wQNIdYpCjQIEfbAh+RVjG7htRvm/0gVjUkqQAH53Z3
         3N/6j8Yd+3IrlbF7kUJo/9F7RGiB/gx+pTisqXBOpKTU435YRe0nVVUjR6ptUPKQU+sG
         R9mj7rmto13Lnf39wk1o62t3lD02szbJe+O+2q+yptEYuXC+jYAIstUVkcTOyzbfNyme
         lXeE4z1pHy7ia7YEjrtcGw9zKWjH7LURyasrpxB+jY9JIATu+GqjclXLs2XoDZ8+0/jI
         HqmQ==
X-Gm-Message-State: AFqh2kqbk9VbqXR4NHCPKWORnodNSoWh0kgVo6HLCa/dXasyJASec4HO
	e0EYsz1Cp8YRDWSkzKSuZ5uxDnmzCSEWAdSh
X-Google-Smtp-Source: AMrXdXvJjJc/VbPfkZjMx4EeChTonH24o2BfrVqvBG3jLDexwOcXqfF5SWlCfhTe7f1OwuvIfy9ARg==
X-Received: by 2002:a17:907:c307:b0:84c:c121:dc53 with SMTP id tl7-20020a170907c30700b0084cc121dc53mr26649303ejc.34.1674414812779;
        Sun, 22 Jan 2023 11:13:32 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id kv19-20020a17090778d300b008778f177fbesm4499502ejc.11.2023.01.22.11.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 11:13:32 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: 'Atish Patra ' <atishp@rivosinc.com>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Anup Patel ' <apatel@ventanamicro.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/6] dt-bindings: riscv: Document cboz-block-size
Date: Sun, 22 Jan 2023 20:13:24 +0100
Message-Id: <20230122191328.1193885-3-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230122191328.1193885-1-ajones@ventanamicro.com>
References: <20230122191328.1193885-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_111335_359128_61C49A5A 
X-CRM114-Status: UNSURE (   8.16  )
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

The Zicboz operates on a block-size defined for the cpu-core,
which does not necessarily match other cache-sizes used.

So add the necessary property for the system to know the core's
block-size.

Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index c6720764e765..f4ee70f8e1cf 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -72,6 +72,11 @@ properties:
     description:
       The blocksize in bytes for the Zicbom cache operations.
 
+  riscv,cboz-block-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The blocksize in bytes for the Zicboz cache operations.
+
   riscv,isa:
     description:
       Identifies the specific RISC-V instruction set architecture
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
