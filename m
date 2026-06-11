Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790B1CD98C7
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 20:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z0roTjw9x6LP0tn5u7W3f3Oc66Jhue0CQzvXIE5AuYA=; b=L88Oiitth/AA79
	na/EyRcpX7rG8dEN2HuDtWdJPD+TM60MSlb4iepPCrHIPdTxfymc0XkZMLvxJLJJ1H62woH8jS7XB
	+zS83x/whrnVG8bww9CVy2Me3Vw6GRAy8diAUXkALPyI/YZMm4ye0W9PzSULmbvwfx1/4xN/R8vzC
	HBLeFPcFYzPSW798ePb4LeltpQB5tXYLDDXE6xdT4b4U5KWSuPiVVAgNpqgq64c9lRTiMlCmF0ZDc
	gsCZPvJ8zRd5FG4pQA2o++nt93f29RawSFEYC2ZMQBKvnScB7B9NXF47Q14CYzr0GMlaCZntQCy1P
	HKQgR+/3JNV3IEThtq8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlm6-0000000A0YV-2ZjZ;
	Thu, 11 Jun 2026 20:13:14 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlm3-0000000A0Xb-3vf1
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 20:13:13 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2bf2247e38eso2448325ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jun 2026 13:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208791; x=1781813591; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PislshUCfHCMEi1kW2QUXiEEtshFqI/HzbllE9LwpBk=;
        b=WKH9YMpPUh/jAnRI2lJFBNl6Q6dUTGsl7Ken1FrxoRn8e+hnScEZJUZRy9l0mzGqS6
         ZvmhenY2J+XcTtkHOGme7iVsVFW72to9Ze+F2STq8YEaT6uPJb7b0M8WFx22wONb/INK
         IY9c46AIr/wZBfPTB9twQy+F4QYMlsVnKiwwrUvvmcTsgF+MgFfAkwWPHfBg9EJMg8EA
         Izrd6gObGdE5WUMtGyjGcDkOlz1pUct8WYziN+XgY/k1gw0iVmqXUa1R9lw1fOefkcuX
         R6ZNdW5f2FHFuJXioA7nua8Aom+GOxsqDvanCI3kEDfT3e5UujG37taVgG8Mx2/EZrx6
         3frg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208791; x=1781813591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PislshUCfHCMEi1kW2QUXiEEtshFqI/HzbllE9LwpBk=;
        b=NiQRyElX1Iu+0run3DyJ/wgPY4jc6U/UL8fV9SDSdGGHE9MV+BRL01iDbehANTVK7g
         XqWShlZl31czRnlQfryJMx+OBwbatEWTheQ1xjMlanrJvKKEI8X0+zEw9sdLAALRP7Nw
         h1T8gEK8kuz0dw+1co7Fb71HxZLCZMaMBB2Aph/ErK4BNt+Wf6maUiHchX1gKIU09W1F
         9wRzOD0wXiBxPCGx5/qa7qvVbtpk0ifWj4Vn3Ug7slWpFtNuvD+LdHKOoF29N3z0+1nz
         uR3L+vbpNp8bqIuYP0zdcK/3gLT7H5TVMl+NM/D8df+RpKOTwlKrAYpYC0XekXzLzaMq
         hK1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/HrDI2QC+/y+wQiPy6eq8jkDe7dZvYKmYkNfu9PG6dPgtM+A49wzm46Sc9yXrdu4qWs2EOlWiPkaNGBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxS5P57nsw0LXJdi3hMfNNCAodoOiGoH0UjWtKX6w/JYqwOBLEZ
	ks5HiXTtwXwBkwvGA1wSIa7BeWFJTty4gapJGf0REEtTafQEnX43GIlW
X-Gm-Gg: Acq92OHdRTlCgY4bXhAbaZA6KI+q/z6dmACnJNDMu1x/fifmNXbawfy41WrTdm+XQiU
	zwfM0ISMDuOkQQecXFdKeBDzxSUzE6v7rLd3ECIov/YZjJCQCNrdBnRmAWGeJ0uZ+MHN2Zoyzkj
	C0Mesvvy5ynLRv5Pwn2dpYQydUy+NFOUageWMoIO4UEbGeCIkc79VPuGnBKFZpu3ff9OonWvc54
	gQlK1mH0tgjmfW0W3UKvhBOQ2g3KTr2D/ICp1uP4pLKxO6jHMT5wR9k+fgE31MO/ECLd8dHXoCb
	EtdfLOwsnobjaqw1T/1KugrNiys3Cp5P2r6RMb8vIuM8nGBUeT67Y0qL91D9JptfUwrRuFw96kK
	hh0Kcgo0C5kgMfUEu/yoLkMOa0Fe8jB1gPJOohwChaAAT1D72JTiQfvMBlZ0hzsNBTjy+fGBTlw
	6Lcu3d7dwB
X-Received: by 2002:a17:902:f607:b0:2bf:222e:455 with SMTP id d9443c01a7336-2c2f0059f50mr67453425ad.7.1781208791012;
        Thu, 11 Jun 2026 13:13:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:13:10 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:38 -0400
Subject: [PATCH v4 01/16] dt-bindings: riscv: sort multi-letter Z
 extensions alphanumerically
MIME-Version: 1.0
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-1-3f01a2449488@gmail.com>
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=10891; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=DXyH1dA5Y1+InWuS9/lc23H/uRLWrnjzX1jOIrUlARE=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixtsf0RC3eYvLzana13v1hu35/fK2QfObnoVt180hO+6
 N7sE/XPO0pZGMS4GGTFFFkOH23J3vrKJ9r3OecPmDmsTCBDGLg4BWAi52oYGQ7NZFvznHdpiVLw
 1n9GS0WmPtA+s+0k42QjzzuL5GTakqMY/vDuFb3N377bSX6ryLcg08Wlea7qSq2/rddtrfnJsZz
 vAwcA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_131312_018002_FB9FC814 
X-CRM114-Status: GOOD (  13.40  )
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

The multi-letter extension enum is documented as being sorted
alphanumerically (see the "multi-letter extensions, sorted
alphanumerically" comment), but several Z entries have drifted out of
order.

Reorder the affected entries so the multi-letter Z list is sorted
alphanumerically again.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v4: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 184 ++++++++++-----------
 1 file changed, 92 insertions(+), 92 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 2b0a8a93bb214..5ffc40d599c02 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -457,6 +457,13 @@ properties:
             merged in the riscv-isa-manual by commit dbc79cf28a2 ("Initial seed
             of zc.adoc to src tree.").
 
+        - const: zclsd
+          description:
+            The Zclsd extension implements the compressed (16-bit) version of the
+            Load/Store Pair for RV32. As with Zilsd, this extension was ratified
+            in commit f88abf1 ("Integrating load/store pair for RV32 with the
+            main manual") of riscv-isa-manual.
+
         - const: zcmop
           description:
             The standard Zcmop extension version 1.0, as ratified in commit
@@ -487,6 +494,22 @@ properties:
             in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
             riscv-isa-manual.
 
+        - const: zicbom
+          description:
+            The standard Zicbom extension for base cache management operations as
+            ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
+
+        - const: zicbop
+          description:
+            The standard Zicbop extension for cache-block prefetch instructions
+            as ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of
+            riscv-CMOs.
+
+        - const: zicboz
+          description:
+            The standard Zicboz extension for cache-block zeroing as ratified
+            in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
+
         - const: ziccamoa
           description:
             The standard Ziccamoa extension for main memory (cacheability and
@@ -514,6 +537,66 @@ properties:
             guarantee on LR/SC sequences, as ratified in commit b1d806605f87
             ("Updated to ratified state.") of the riscv profiles specification.
 
+        - const: zicfilp
+          description: |
+            The standard Zicfilp extension for enforcing forward edge
+            control-flow integrity as ratified in commit 3f8e450 ("merge
+            pull request #227 from ved-rivos/0709") of riscv-cfi
+            github repo.
+
+        - const: zicfiss
+          description: |
+            The standard Zicfiss extension for enforcing backward edge
+            control-flow integrity as ratified in commit 3f8e450 ("merge
+            pull request #227 from ved-rivos/0709") of riscv-cfi
+            github repo.
+
+        - const: zicntr
+          description:
+            The standard Zicntr extension for base counters and timers, as
+            ratified in the 20191213 version of the unprivileged ISA
+            specification.
+
+        - const: zicond
+          description:
+            The standard Zicond extension for conditional arithmetic and
+            conditional-select/move operations as ratified in commit 95cf1f9
+            ("Add changes requested by Ved during signoff") of riscv-zicond.
+
+        - const: zicsr
+          description: |
+            The standard Zicsr extension for control and status register
+            instructions, as ratified in the 20191213 version of the
+            unprivileged ISA specification.
+
+            This does not include Chapter 10, "Counters", which documents
+            special case read-only CSRs, that were moved into the Zicntr and
+            Zihpm extensions after the ratification of the 20191213 version of
+            the unprivileged specification.
+
+        - const: zifencei
+          description:
+            The standard Zifencei extension for instruction-fetch fence, as
+            ratified in the 20191213 version of the unprivileged ISA
+            specification.
+
+        - const: zihintntl
+          description:
+            The standard Zihintntl extension for non-temporal locality hints, as
+            ratified in commit 0dc91f5 ("Zihintntl is ratified") of the
+            riscv-isa-manual.
+
+        - const: zihintpause
+          description:
+            The standard Zihintpause extension for pause hints, as ratified in
+            commit d8ab5c7 ("Zihintpause is ratified") of the riscv-isa-manual.
+
+        - const: zihpm
+          description:
+            The standard Zihpm extension for hardware performance counters, as
+            ratified in the 20191213 version of the unprivileged ISA
+            specification.
+
         - const: zilsd
           description:
             The standard Zilsd extension which provides support for aligned
@@ -521,12 +604,10 @@ properties:
             encodings, as ratified in commit f88abf1 ("Integrating
             load/store pair for RV32 with the main manual") of riscv-isa-manual.
 
-        - const: zclsd
+        - const: zimop
           description:
-            The Zclsd extension implements the compressed (16-bit) version of the
-            Load/Store Pair for RV32. As with Zilsd, this extension was ratified
-            in commit f88abf1 ("Integrating load/store pair for RV32 with the
-            main manual") of riscv-isa-manual.
+            The standard Zimop extension version 1.0, as ratified in commit
+            58220614a5f ("Zimop is ratified/1.0") of the riscv-isa-manual.
 
         - const: zk
           description:
@@ -590,87 +671,6 @@ properties:
             in version 1.0 of RISC-V Cryptography Extensions Volume I
             specification.
 
-        - const: zicbom
-          description:
-            The standard Zicbom extension for base cache management operations as
-            ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
-
-        - const: zicbop
-          description:
-            The standard Zicbop extension for cache-block prefetch instructions
-            as ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of
-            riscv-CMOs.
-
-        - const: zicboz
-          description:
-            The standard Zicboz extension for cache-block zeroing as ratified
-            in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
-
-        - const: zicfilp
-          description: |
-            The standard Zicfilp extension for enforcing forward edge
-            control-flow integrity as ratified in commit 3f8e450 ("merge
-            pull request #227 from ved-rivos/0709") of riscv-cfi
-            github repo.
-
-        - const: zicfiss
-          description: |
-            The standard Zicfiss extension for enforcing backward edge
-            control-flow integrity as ratified in commit 3f8e450 ("merge
-            pull request #227 from ved-rivos/0709") of riscv-cfi
-            github repo.
-
-        - const: zicntr
-          description:
-            The standard Zicntr extension for base counters and timers, as
-            ratified in the 20191213 version of the unprivileged ISA
-            specification.
-
-        - const: zicond
-          description:
-            The standard Zicond extension for conditional arithmetic and
-            conditional-select/move operations as ratified in commit 95cf1f9
-            ("Add changes requested by Ved during signoff") of riscv-zicond.
-
-        - const: zicsr
-          description: |
-            The standard Zicsr extension for control and status register
-            instructions, as ratified in the 20191213 version of the
-            unprivileged ISA specification.
-
-            This does not include Chapter 10, "Counters", which documents
-            special case read-only CSRs, that were moved into the Zicntr and
-            Zihpm extensions after the ratification of the 20191213 version of
-            the unprivileged specification.
-
-        - const: zifencei
-          description:
-            The standard Zifencei extension for instruction-fetch fence, as
-            ratified in the 20191213 version of the unprivileged ISA
-            specification.
-
-        - const: zihintpause
-          description:
-            The standard Zihintpause extension for pause hints, as ratified in
-            commit d8ab5c7 ("Zihintpause is ratified") of the riscv-isa-manual.
-
-        - const: zihintntl
-          description:
-            The standard Zihintntl extension for non-temporal locality hints, as
-            ratified in commit 0dc91f5 ("Zihintntl is ratified") of the
-            riscv-isa-manual.
-
-        - const: zihpm
-          description:
-            The standard Zihpm extension for hardware performance counters, as
-            ratified in the 20191213 version of the unprivileged ISA
-            specification.
-
-        - const: zimop
-          description:
-            The standard Zimop extension version 1.0, as ratified in commit
-            58220614a5f ("Zimop is ratified/1.0") of the riscv-isa-manual.
-
         - const: ztso
           description:
             The standard Ztso extension for total store ordering, as ratified
@@ -809,18 +809,18 @@ properties:
             instructions, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
-        - const: zvksh
-          description: |
-            The standard Zvksh extension for ShangMi suite: SM3 secure hash
-            instructions, as ratified in commit 56ed795 ("Update
-            riscv-crypto-spec-vector.adoc") of riscv-crypto.
-
         - const: zvksg
           description:
             The standard Zvksg extension for ShangMi algorithm suite with GCM
             instructions, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        - const: zvksh
+          description: |
+            The standard Zvksh extension for ShangMi suite: SM3 secure hash
+            instructions, as ratified in commit 56ed795 ("Update
+            riscv-crypto-spec-vector.adoc") of riscv-crypto.
+
         - const: zvkt
           description:
             The standard Zvkt extension for vector data-independent execution

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
