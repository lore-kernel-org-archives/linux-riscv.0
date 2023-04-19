Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6694BC7EE20
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 12:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=coBRdh6Q0Kl2PkURWKN55mF/iyPIoS//dRPzV+G446o=; b=qp66ct81ZaZJOy
	k0nU85vwdWiaQ/FxvSInuG8DvYkqfW/yPv26vfe7KoCXbLCV+dlzkaYY5iAvBsyFB0JON7/xghLSo
	t9T+UdERXIGSRMK5C5pWRLCdPQ3irMEIkR8duJuxF5TerW/krAXToLt3VcDmKpEaggIUEQ0AGmE87
	uJ0rztZ/DIx6qIqnqJkvPxmmhll3NzrbjsQvRCPP0eeCtjGsYTdOfpD+URdFmnWNu4RkqpPhNyT8z
	T047oyCAIQXMqApk6O2pwO1p34E/UZE1lSRXxIuBMptZe1KuziJazJlX6IjnpbWFT54xGD7dq12lK
	TVp9ug2tGOoHqdwcIs/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp6in-005JE6-1K;
	Wed, 19 Apr 2023 12:15:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp5hs-0058Jx-0R
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Apr 2023 11:10:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=IeP1c5FHkO2iYuai0o4JGoTDumRIxR3IsfyyPznXUZQ=; b=aOexigcGm3Jucd9WFZ14M8jEvs
	D9hN43kb9j5aXovREbnUUt2a21iDpE1KZaJ+pJDtr4RC8GgcubBsKX1GU8eZCI1yJtdVb7SYbd3gz
	n+bNhwuYhiVRaQSp3ieIPwQ+sLmk71jfrsomHNiGb6EoqOitcRAFQy+yoxVPEjoGbLUJ1k/pAa/SV
	KsS+xNQgEQU6Gcgedb4OX/rw1yDvHFi6MRqN45TgU0l+UtFxgQQcWRb/g9xaM1+hspo+UKLIbxP6z
	+rrnG1Exa9h2XIEdwE0KXu+dnYd4ba+fCS4UwUesS1A5nF/GCoJuBq/gzieW1A5hQYGkGiv/hgEc0
	zF+lxIdg==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp5hm-001sON-2G
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 11:10:34 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1a6817adde4so26022045ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 04:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681902627; x=1684494627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IeP1c5FHkO2iYuai0o4JGoTDumRIxR3IsfyyPznXUZQ=;
        b=koEw/uiEXJ4P6r+2zoaiHPM5ok/d28q5pyhF5LbHc6I1XBnEv7ikHPdbKOO5lffn/K
         pKDES30EiXACKywfHsDUvjjt0cOPKfvLpyg9IeEb5NLAba+5aa/Q/MLSvGSDEPWntDpi
         abS8us22/q+V5R+SCMXTfaaDbuG1buySAT/syibcEKpDziulkNwfG1g/R2vwvlaUG+P7
         fl09D+ZXUj4CtB6cdojZ/MWvx8OjwgAgpdsksCYdzZrmbJqBWSzxhAdKGStPebuYbxLb
         xjGTza0fpYTfOqnhex0mFm1BxYCeEx7xKzQ1po6NxzdlGYosdnG647RnUtd+HmnyvEj7
         uvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681902627; x=1684494627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IeP1c5FHkO2iYuai0o4JGoTDumRIxR3IsfyyPznXUZQ=;
        b=Nm73HHnAGMYeuVntkPLz3Uqlb0uy77uJD+KLTwY+D9AvlS89WO2dkp2srLyqUWg2Mq
         9jgJ9mpOIJrsMXh412hlv7VmuSGcWjVxhjZHOQj3VsssEUrL87wKmlv/pGcJEcQ1JOlI
         OpcQ8AQoUtard+w0ljiDQtWJdFMXghhHIa/7AzoovorG81TEXfEFpgYSEZntw9SyARaD
         yPXHmRge5xN9wtgX1+ggUpPz2HPxBy8XIX4tQ8sU1jI4U34LcbMzkk4XWeaReClqv3q4
         boUe0gZfmS8FrYyYBL+gdRUR5dRMK83Jy+WE7wKi+VAqtNAQDrPxkhwtHlc5MciLx5AG
         Rshw==
X-Gm-Message-State: AAQBX9cQUHaqeuiZRDZAoRft6yVfdca/QQrjBCFzKLFjoE4Tkhs3vo4m
	S5ToUmboOfkMbASfr/JifTrTy+PT5CPaX0YPC9A=
X-Google-Smtp-Source: AKy350as/KHWHZ+shgMkN9Cq1xyi0sRUDBIGVeroXLacVjHMk99lR8iksTM1dFoEjEk5V5sXMqlvAA==
X-Received: by 2002:a17:903:11cf:b0:1a6:81bd:c4d9 with SMTP id q15-20020a17090311cf00b001a681bdc4d9mr5507947plh.39.1681902627683;
        Wed, 19 Apr 2023 04:10:27 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1800:f680:eaf2:1d7a:7338:16cb])
        by smtp.gmail.com with ESMTPSA id g12-20020a1709026b4c00b001a24cded097sm11180774plt.236.2023.04.19.04.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 04:10:27 -0700 (PDT)
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
Subject: [RFC PATCH 12/21] dt-bindings: riscv: add riscv,cbqri bindings
Date: Wed, 19 Apr 2023 04:11:02 -0700
Message-Id: <20230419111111.477118-13-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419111111.477118-1-dfustini@baylibre.com>
References: <20230419111111.477118-1-dfustini@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_121030_950012_DCA19BBE 
X-CRM114-Status: GOOD (  12.38  )
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

Document properties that can be used in the bindings for controllers
that implement the RISC-V CBQRI specification.

Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 .../bindings/riscv/riscv,cbqri.yaml           | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml

diff --git a/Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml b/Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml
new file mode 100644
index 000000000000..3f017c6b1fb1
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/riscv,cbqri.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Capacity and Bandwidth Register Interface (CBQRI) properties
+
+description: |
+  Common properties for cache and memory controllers that implement the
+  RISC-V CBQRI specification:
+  https://github.com/riscv-non-isa/riscv-cbqri/blob/main/riscv-cbqri.pdf
+
+maintainers:
+  - Drew Fustini <dfustini@baylibre.com>
+
+properties:
+  riscv,cbqri-rcid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The maximum number of RCIDs the controller supports
+
+  riscv,cbqri-mcid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The maximum number of MCIDs the controller supports
+
+additionalProperties: true
+
+...
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
