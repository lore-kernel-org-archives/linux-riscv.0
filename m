Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCB0C53219
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 16:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zpVSKd07LXjxor7n2HyzUOv5EMUTqi4RwhZgVybQuAA=; b=ijHObL1E9CoDUm
	eXxswsc+703Nbsj1MJzNE0/UffQRDylxlxV4tVuOmFH0Ughvn1JPcZkH96ft+IWKPozt+FSY2nVZ2
	/RqpyIOU5fMzCfrIj8ptnEpPaAUwOo/TDeU5oCZMgS1zCzxV8qp0fctiapV0QPuz/viU6ZgxIlL7K
	7tX6m8pSqtC8Azh7jxJaufPGQAD5gHTodjNIvEB+xrB86pjdBhNjfXC9e4DSxDi50Z033YaJNt/lF
	DOp+fgZGqLm93HxpJJEaAlPKlNL87NpsrI/uziWydi2HPP0sdn+pw5MuVLYFCk2G9/oSw/T7TwO2A
	PZdl7U30TzGV8Ug203JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Ji-00000008aKY-0sHB;
	Wed, 29 Jul 2026 16:39:38 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Jg-00000008aJo-1OWf
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 16:39:37 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49550ec592cso538735e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 09:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1785343174; x=1785947974; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y44tW4s5PjOJOmSGtdgX1zAMpKkbDdnk9Dva/9jZSYs=;
        b=aW7zsY59a1bpGQpW/8gzsL69RS8n/+JwgE65VWcAQt5UYZGP4WNQrnGOHxyLrKjfjU
         SZTBQo6J3D6OeLbbWKDdvgf1YH6UOTVrckhZ9qp3DELRAMpdWZrAMInnAZyDkNyRLL2D
         k/tx4K2IerQyYPwgYwp7/9TkgSIUFFel+3wDgOGsiQ69PINKlfAye7bUpaj2RJPzCDip
         Lg9t6W5PKsHh680xVU1C1ytnVhzCWadh1XzDPpXCYvxxMVEEj/BnpbDIrBJx2yaWO9w2
         HsKo4gyax5QtB6eX4Ggzw1pe4u/C02+9NdHvWJMI3+5IyMQkULyS+goFTBJ8a3jXrE3n
         q03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785343174; x=1785947974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y44tW4s5PjOJOmSGtdgX1zAMpKkbDdnk9Dva/9jZSYs=;
        b=UjKUFSoj/Z2r5kvvFlxuxGD5Kn0m7+ez+Qp+7wCWL3+grc+qXbfbERtGQXoKNMg4Z+
         SLpHhrYwLblL2vJnTtexStzfUfxrjjgsrNBacNuxZnr973Niv4s9jzq76hE2ytTUVMYV
         uMBOpbjk2iCPThHjKw+hDOGifd+mX+j6s7LpTZgoD+51yZdfuSM4/T9DSlILLdPRV9A2
         /XGDGF/19FRtlRZtZQm5Un1Es7+4LoyPPeV12nHgGWdtHcKRAQmx+a027hBUfR4qYrsk
         4rh9t2FRtCEsZuuoWs9ipnd622QV7s4goFDyR3d1uAB9nHgJMO4cQupfrXWUMWaX8vj6
         r2pw==
X-Forwarded-Encrypted: i=1; AHgh+RpXwLp4sY3MGya+NqYSGXsGYh8arF6RqmqacF58chvI5rd2CTR0rCl/hjN74kD4oF8NixhNDRh+IW0/6A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzyMz8n2u6EVCl/CZlTrfI1Jm36oUPe2t6OyByfzaKBe6QUlyou
	Ju3I5F+mKQOMcNopiQbsaRRDML0mDBsnJsaihbxjK9bzmUvhpbosiHBg3AkeExldlLo=
X-Gm-Gg: AR+sD10KV2KhSIzGCcTj5MtGnjzdxyhkODV8/mpsztFLp6xL2XeBIjbvRc1N7S09Ase
	WudRdQPuQdYyDb0iVUAosNQTJJEGhMfTLNEyL0vqD99LVS+iJ52WKKNMXuNsZOg4NxJwWRZ41fG
	spXtu5qDACSlloLP46ivkG0ld/c0TEdBTQxkvgxSPl2yeGV1DzrkAHkL8i45Z7bE8kF2OFYqb4P
	3ZooBYHxgi7FtCe5ruERNnGVjP2292ziof/IWFeSri5ohD3NTo/mw/OMg8DT2hj7fTU0Cnrr1pD
	AO+jUYjKQ92K/x5bpfLL8S7VlKScNnq6O9XwPbehkAqQOIukG8UCrxOMNZvmDXyhoO320FJKrMe
	e26IhRJM/giKOs3ikhjPCuLPVx0tCwhdJvZuVlXtvjRdMY/Yb+/NeBnFRYz/OI/t4pOynrL5OgX
	xn9VtJxRg//FXYgWlqngWdyDGOni7Z+GQzlRdKZd7EzE4ypxsYi3PTvVcKWVp1Fq3QWZUJgJ4Fm
	XbndcbXdsXvHdGWjBQBafs=
X-Received: by 2002:a05:600c:5492:b0:496:ca95:42bf with SMTP id 5b1f17b1804b1-497fd303166mr39094775e9.10.1785343174406;
        Wed, 29 Jul 2026 09:39:34 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45b0535sm164242145e9.4.2026.07.29.09.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:39:34 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com,
	dlan@kernel.org,
	guodong@riscstar.com,
	dfustini@oss.tenstorrent.com,
	michal.simek@amd.com,
	junhui.liu@pigmoral.tech,
	darshan.prajapati@einfochips.com,
	akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn,
	luxu.kernel@bytedance.com,
	pincheng.plct@isrc.iscas.ac.cn,
	nick.hu@sifive.com,
	jim.shu@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	robin.randhawa@sifive.com,
	scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v2 1/3] dt-bindings: riscv: Add Worlds ISA extensions
Date: Thu, 30 Jul 2026 00:39:06 +0800
Message-ID: <20260729163908.249838-2-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260729163908.249838-1-peter.lin@sifive.com>
References: <20260729163908.249838-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_093936_423338_3B28EF68 
X-CRM114-Status: UNSURE (   8.59  )
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

Add DT bindings for five RISC-V Worlds ISA extensions
that implement World ID tagging for hardware-enforced
context isolation. Also, add checks for extension
dependency requirements.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 2b0a8a93bb21..7a57191a0293 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -193,12 +193,35 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: smlwid
+          description: |
+            The standard Smlwid extension for M-mode control of lower
+            privilege World ID via the mlwid CSR as ratified at commit
+            TBD ("TBD") of riscv-worlds.
+
+        - const: smlwidlist
+          description: |
+            The standard Smlwidlist extension for M-mode control of lower
+            privilege World IDs via the mlwidlist CSR as ratified at commit
+            TBD ("TBD") of riscv-worlds.
+
         - const: smstateen
           description: |
             The standard Smstateen extension for controlling access to CSRs
             added by other RISC-V extensions in H/S/VS/U/VU modes and as
             ratified at commit a28bfae (Ratified (#7)) of riscv-state-enable.
 
+        - const: smwiddeleg
+          description: |
+            The standard Smwiddeleg extension for M-mode delegation of lower
+            privilege World ID control to S-mode via the mwiddeleg CSR, as
+            ratified at commit TBD ("TBD") of riscv-worlds.
+
+        - const: smwid
+          description: |
+            The standard Smwid extension for M-mode World ID control via the
+            mwid CSR as ratified at commit TBD ("TBD") of riscv-worlds.
+
         - const: ssaia
           description: |
             The standard Ssaia supervisor-level extension for the advanced
@@ -262,6 +285,12 @@ properties:
             ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
             ("Updated to ratified state.")
 
+        - const: sswid
+          description: |
+            The standard Sswid extension for S-mode control of lower
+            privilege World IDs via the slwid CSR as ratified at commit
+            TBD ("TBD") of riscv-worlds.
+
         - const: supm
           description: |
             The standard Supm extension for pointer masking support in user
@@ -924,6 +953,30 @@ properties:
         then:
           contains:
             const: b
+      # Smlwidlist depends on Smwid and Smlwid
+      - if:
+          contains:
+            const: smlwidlist
+        then:
+          allOf:
+            - contains:
+                const: smwid
+            - contains:
+                const: smlwid
+      # Smwiddeleg depends on Smlwid
+      - if:
+          contains:
+            const: smwiddeleg
+        then:
+          contains:
+            const: smlwid
+      # Sswid depends on Smwiddeleg
+      - if:
+          contains:
+            const: sswid
+        then:
+          contains:
+            const: smwiddeleg
       # Supm depends on Smnpm or Ssnpm
       - if:
           contains:
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
