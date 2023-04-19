Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7750C77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 12:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=drTsP5zT0yz7utxGfuTmbTPU2GYnwLamxJF6p8SaeNc=; b=4MDyLiy3xlqA+9
	KlRTD3++a1a5/rr74KG6Uj5kwV78u1gfuI8O080o7sOOmcDc3c/oI6wZR4f4qwFMeiKELS0ybyNCN
	gtMavAkZ8WDM6kuiq4meJG7OCc4ORyv7eFlGElwBBbwzGhcy82EolYCHLGr76Yw/YdTjI5/H5RVgN
	e8k3TPvXeaCRMajmaNF9S1FCvmMg/x8uzPVRD4lYthAeLpNnt3uH1LTHbV3ISo5ssZGIENuiklEl1
	j4U7jx3OPDoPBvx7Ggr8pCC6N+CGicH8qGUF8fRd8irITpPvZDE52hVK+b16usH37Sxsa+9APWGgv
	G40L4fEPeAlw6jYlPbHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp6im-005JD9-18;
	Wed, 19 Apr 2023 12:15:36 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp5hl-00584t-2G
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 11:10:31 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1a69f686345so20890975ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 04:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681902629; x=1684494629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCr/XD0oj4/oPWH13NzthrUuXXX/7UUm/KiUydqd3Cw=;
        b=aAPwq8SLoEojqf4NHO3Fq0Ic/0+QaSA4EA9zAFf3kHDUX2voaRramQ8jdGtKzVoPbx
         hLWXAYGn/it0j+rhFp9uZZ8mKg2OcYP8EQFbNmn4OdAxK5bYiLFwjMg5GpBppnG96Z/4
         pNSb46QlwFQuO/D8WH9DGcEuODlqBKQPMlFseu2hz+salHNUZ8p1Wy5D60h3JSb5edS1
         VFmN/9xzQeyAcRFhvLLY5YCg0Y4bhZYIQjTCfrdFsQC27BhhP5IURYfb9Jf+MTOY59ZN
         vfNaXPcls+Qfcukd38Dfzi82cAxdVPVUshQpCQMfJPVDkJzVDZZOyiOrDa0CxTekRJC/
         XS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681902629; x=1684494629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCr/XD0oj4/oPWH13NzthrUuXXX/7UUm/KiUydqd3Cw=;
        b=YGIzDHrlXgf5+ys6F3GDHTk106G99M93Myv5iWZIy9Xsv4qyDmwCiLlo9DJ7l4z63m
         2fv5wJum983Y5SMefCNCYpyhAgqg06ZFXKd6I0jwCGKxbUF8v1ufsXw5wlzBKhm5DjI5
         Pdr7bfrdGcdMhKZ97P5O/LP19QYv4e2t00AdZgyhUgdViwo33rPv3H3YPTc5weT9aqDk
         qKCdtqZWFKatycjC6mbbDKij2ZBbmlgwpXqo+mw7KqnBY3A9+WZC9pKo/9pNqSpYmYsY
         nIxle+BRkqu3aa3bVuBImizQnvIsb4cEaezUNGfLndE650yZRqcMmIwpnhlUeKRHu/Yq
         u23A==
X-Gm-Message-State: AAQBX9ca9+LkWJ8Xt91qdN61/QEvw+FwJscwA4xa8loDEoA3KdJjyCOv
	Dg6N/newW9Q22w+QxjzopL4hpbtU1tWN1ISshfI=
X-Google-Smtp-Source: AKy350YvL1e3iKZvub4t9UQbFZ9Y8KdT0xLTr/OSwyPVoBE0WDLhmou6jM+HdDHR/Nje7IH58BiY8w==
X-Received: by 2002:a17:903:1c5:b0:19e:ecaf:c4b4 with SMTP id e5-20020a17090301c500b0019eecafc4b4mr6514342plh.4.1681902629140;
        Wed, 19 Apr 2023 04:10:29 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1800:f680:eaf2:1d7a:7338:16cb])
        by smtp.gmail.com with ESMTPSA id g12-20020a1709026b4c00b001a24cded097sm11180774plt.236.2023.04.19.04.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 04:10:28 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Ved Shanbhogue <ved@rivosinc.com>,
	=?UTF-8?q?Kornel=20Dul=C4=99ba?= <mindal@semihalf.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Peter Newman <peternewman@google.com>,
	x86@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	James Morse <james.morse@arm.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [RFC PATCH 13/21] DO_NOT_MERGE dt-bindings: add foobar vendor-prefix
Date: Wed, 19 Apr 2023 04:11:03 -0700
Message-Id: <20230419111111.477118-14-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419111111.477118-1-dfustini@baylibre.com>
References: <20230419111111.477118-1-dfustini@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_041029_760956_D4D9E528 
X-CRM114-Status: UNSURE (   8.99  )
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

Add prefix for an example SoC vendor whose designs include controllers
that implement CBQRI.

Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ed64e06ecca4..426f4eef06eb 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -470,6 +470,8 @@ patternProperties:
     description: Shenzhen Fly Young Technology Co.,LTD.
   "^fii,.*":
     description: Foxconn Industrial Internet
+  "^foobar,.*":
+    description: Foobar Systems
   "^firefly,.*":
     description: Firefly
   "^focaltech,.*":
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
