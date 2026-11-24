Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EC5606A31E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 07:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eT178Ozf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t9RiB4vx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ICqCuZlFuzd7gCpFoHbA3+aM7G3JBVxGr+bHfLV9dIo=; b=eT178Ozffo5g5D3T+WsTtwNdRx
	BOML+BW0bOjBWIlB95WG+JiwIS9peTRAjcX2YAJxCb2fPscDTRUXahKC4DhSh9zpGsswSyxe2dxhM
	Cl9KTTg0d/LVUJkKY5v7GHcsdQ8gcZhIx5+nOOtw6s5FydBrVgBSHelKb4TP1vxZb/46RkzoXwnU0
	00lDI+vms21vKj0fgwiHKr5irDcpJogBMD+YXW0mKoCfXI2MiVP0NGmIoAc1JOBAWV+CyHTGlLrHl
	K0500MXVmxezOHTplwFhIczT3ZpR9XQUv4lpYENC1ry3oR2pvW59/Zosyt0vjP7KPyPCDStr8COHN
	gZYW3ARw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkyM-00000005lNI-2fQw;
	Tue, 24 Nov 2026 07:29:50 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVky8-00000005lFC-0gJz
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 07:29:49 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3b44bdcea8aso1930110a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2026 23:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795505374; x=1796110174; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZuDPiNOEfTjl2w559867HRmVev7pbLSM2ATwOtUNZA=;
        b=t9RiB4vx959ZYAjU/pxdx9PpE4bYB4Ti6cgAbkoBpr8hyA+pa0LLQM1RywLrwAWgXw
         glZ5h8hc0LKuM8gZ3SREFyD6wu/6wA4iP76WojtKVUe6duBSlJYlGg0VPmN1wFK5C8ns
         Iafow1HQavcH1/EEvzgSJDJ06TiptDeFSiE7By2Dsei0GhhP5Bx6e+0tj2KYMuPLTlsY
         lnQJlGx0nv+GkTjqTHsT7e0eT5alkI9t9/x1Yiev4EAzb1JEi9PXtFa9hTiq5ywf60Jr
         B14uweK4SdexbhlAzMITyJiUBDSjbYBP4u0SKggqpoc+dpB8Dk+IAOpnRJo2SmUoieX1
         t1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505374; x=1796110174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ZuDPiNOEfTjl2w559867HRmVev7pbLSM2ATwOtUNZA=;
        b=hXFP0np8VP/4saciL3f6fLNfMg+uLJHVGoj+Wk3NiqgvTaMODkWsURFdK+UnM3BQ61
         TON4v17piIgHMfqaqI491YVyD6prCXfkweZIptvwtrHCkfV9rXtCjQ4O04006MACT+l+
         2Dg78YeTmDOFa4iAptFawnzmPihZ+iugAgq/emrMWQBw371BWv+tSrVYNqLkqv8ZN7EQ
         mPAjWFAvnfwm0Iw5l3psiTAI4ougwtT95BixZauvAYglb8GJprwWUmzliyTZdp3cW16A
         JzIOy017RGj8t3qCUnFf3nnY5IMukzLsSveCLuvQP9Gq6aO8kFJeHCQHlhL4LW0kmLXe
         Yo8w==
X-Forwarded-Encrypted: i=1; AL+hErGKkqTt1G4NYsXz9lrKZpOUeQ9lpZMPoMbx+YGvocyg79XtkdGTXGitypsQobkcIKY0/xz0x/8eFM/NnA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+VOIcz8AQ3+nQTl3jD6bwZhJiC3b6Ep/XWfvykaFoQJ7jwPPEM
	8PvGYadl7PWlNaWq1pE2lazf1bH6axOBGee4UYCg4VLr+rvhKYGNzwtS
X-Gm-Gg: AZFdTZfaJhWR8115mx2YEo6ts8CdYoaC4zJaFupAjeiJRJ2i6B/AjUii9Eqc4w7nC8p
	7UDWNEe11AJ0JHs6jgxhx0H19RS8EKOiHZ0zL867s8fYZtJvWvsJ0kTcyAqWQ1/iMeyjurWAkpL
	cC5Ht1VjWqEReZugpffQMjMYzmKOmDeHGmNwg+s3mIcln8s7kI2qpyH9aEBBNV71CCr0HaBpbDI
	sPU2fVrtLoPUZv0YmDZV6q3aMc3QKglTLM5JVPw2UJpAoiDjxZ6HeZOdYI4PSo3XKVJ0nB+/+yX
	Lxwy/nTT7AkLaJ7vPb9EzVuBz0JbKdxrAfDRqfr8gNY8x5g6LiabzzpHfyF8RbjPd5sIiOl54jD
	cAuNTGu9cqk44jEZ0tcKuOXZaud5dW5jRlyXE6V2SKX+643sodeFBtBD8C8OydMjbeVWvr0q+DY
	mmU1ZlGsysMAJa3YmK/o+nZG56pOXCuoxDbhT43eVS1EhTesZ9s6D6GW5LkZiCjWJx6FVYkud3t
	OnYU+CKljKgto65bhoIzZigDyVTBgx1EKMtHSceyl3Zb1mLpQmVQNImdIqjuKaGOF7J3IHI5k3K
	8aJK5i4Zs5XfbTacvRDOPPyBNqc=
X-Received: by 2002:a17:90b:3f8e:b0:3aa:412f:b0a7 with SMTP id 98e67ed59e1d1-3b41c7bc85emr8885243a91.5.1795505374392;
        Mon, 23 Nov 2026 23:29:34 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm8759683a91.0.2026.11.23.23.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:29:34 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <gaohan@iscas.ac.cn>,
	Hangfan Li <lihangfan@iscas.ac.cn>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: nvmem: Add SG2044 eFuse controller
Date: Tue, 24 Nov 2026 15:29:21 +0800
Message-ID: <20261124072924.556678-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124072924.556678-1-inochiama@gmail.com>
References: <20261124072924.556678-1-inochiama@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_232936_257321_EF135379 
X-CRM114-Status: GOOD (  11.86  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Sophgo SG2044 uses eFuses used to store factory-programmed data
such as ROM patch, public keys and other factory information.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/nvmem/sophgo,sg2044-efuse.yaml   | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/sophgo,sg2044-efuse.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/sophgo,sg2044-efuse.yaml b/Documentation/devicetree/bindings/nvmem/sophgo,sg2044-efuse.yaml
new file mode 100644
index 000000000000..c87e028dc557
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/sophgo,sg2044-efuse.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/sophgo,sg2044-efuse.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2044 SoC eFuse-based NVMEM
+
+description:
+  Sophgo SoCs contain factory-programmed eFuses used to store ROM patch,
+  public key and other factory information.
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+allOf:
+  - $ref: nvmem.yaml#
+
+properties:
+  compatible:
+    enum:
+      - sophgo,sg2044-efuse
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Core clock
+      - description: APB clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: apb
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    efuse@40000000 {
+        compatible = "sophgo,sg2044-efuse";
+        reg = <0x40000000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        clocks = <&clk 0>,
+                 <&clk 1>;
+        clock-names = "core", "apb";
+    };
+
+...
-- 
2.56.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
