Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC7DE674AB
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 13:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NLV9KW1F455k2Jtlh/uC28mZqc39q/Lrrhwh1MfgQ6g=; b=TZ92GV8jHXpMdz
	Pf0R4G1wKDlx/+mRtWCHB7BZe4v1THeILz5LdQK1zXu2Ots7xqRtyGLeIe3dLUFJlY963mRI5/Tyd
	SZPCWBHayxl2Uy8uUmXhJdb6VIL/ekDc/IK2rCUk+JvaOgZZeiwZo3Gmpk5hVGnsXq+BqSKKuSgnk
	40rzzj0XWLyDo8O4t5KEgtwOd4qAncltVYXEQufl1h5x1kEb9LIHbbBIem5lmXCW5doyisnhc8SCl
	NKvns7xwUrQCPKZtZuirn9mPF4tE2PIC4NnWYLdb3w7kr/pzqHxoO9vL3PMSt1jqIwckaSuUbdclL
	ARQmMxpoeXDvGNR25hIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfdh-0000000DmYH-0uVE;
	Mon, 22 Dec 2025 13:07:53 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfde-0000000DmWH-1ijr
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 13:07:51 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-34ccbf37205so2943357a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Dec 2025 05:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766408869; x=1767013669; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6wWeVzMiq0I3GTkEz87TKkT2Lapp7vD4pzF07D1070c=;
        b=RRFsXqkrKlwGdka+GP/pTEcZkD2P2rLhnpePJajAs8O/lbzrljUU3TGqQ+aRRTsqg6
         APqqXy8wy5sKAbxaMyjDcFqLhL0HuRBjV30HvlFFJAITd0l+4Mehd0FbzAYplQZYl7Qn
         7owA/Zsa7Pjp9T/403fAjOsu5CtW3F26AJsex/PFB6yWK2h8LOC5EJRkZucgzV1gP+JR
         3+rLx4waF5EEwWiQEm+FnkO3T8bXPGKt65XW0OuUr9tn0VKQiIbipdzhWbjLp5yunhmD
         uH33DkYpRUm7rUZNdF05udR3fj82DntaVGe3u3nXMmo5O7RtG5lKzaUJo9R0KCLYHVOb
         6skw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408869; x=1767013669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6wWeVzMiq0I3GTkEz87TKkT2Lapp7vD4pzF07D1070c=;
        b=FMkPxJMujoirweUSM94BkGxsbXFizmWRvvddeId2GoEXJwoxSa2aRhnBGGi+Nn2sxR
         /I/VIdmHC9OBZRtDI3YKbutOiGJsXAoqVXoKpyFadUjMnkoHQ0aOEgOpwK+RYdL/lKrb
         ONhjdEspB4oFXXcFymuXR/SFFs+u24tdfNyupJLklwXRGq6VEtGJKwcqt7IF1xz9Cc7g
         seCp2LaOaagr5A04Nwu4takPdWHJ4gBbzTBR77y9omImkNwDjto7QtbLt7s6KaY71stn
         +ONx+66Vua0O4V3ZgRuAEmns1geMZw3vTYD0e0DfJvZFkpXPX01BJZMQfgvZL0uF6TJM
         SobA==
X-Forwarded-Encrypted: i=1; AJvYcCUnvhBHeGzBsQ3XAifzFcWh3Eh9uRrWau2hbRlULlq7xWNU0qEDYPoVX6hhriLS9KxtuHIb5Qk0vX5y0g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7CGrkNFXJ3EdRH0z7e+F/dUJRDDEefaKt6JZkXxCwVzWLU4aw
	1CLYFBagO84lYhSIfoGrXRbSPw3lDP2cFltNdDz+sCpHLq7Gd35onX+nyXeUyqoJLJQ=
X-Gm-Gg: AY/fxX63GLwlqFMN9VZOw/p4B6CcKmlWUI9UcDwzCbzaPceKpKkrRaVDn+t1WJHLNAV
	VL9Ksp7/QUj+0E7C3NVtcFON6NFUuAbk2AhytsphUUPafHuFQp8Co7VJ7QSpoCXwI9FVCyBHQzP
	y667qttnOf6+l4HZ/tZMmyNQdAG1D/56ZI4p9IxjMsZyy7Elq7boXaxBpBwpkypeHlOO515O6LE
	lqnYaeVmsY7S/qDBRWRQRtYbkzrTd5fedV5J7v1PF479Jn9zsFD/2KwzRKswnz8g6TiYecHM+Ed
	tlYYy0+p6Sj7DGlh9IzELS1X9rvCffcsAFwRVHu4qn1cug3RJabECrruw2UBLh0qS5y1gabtOwL
	FRzygenGsPn7u25N9+xymsAHiPIln82o8wYSoNEF1IArsruZ8iejIt9JOu2xHeusEPjB4q1CkP0
	cvs3bnniuHsx/uwtVp36y1fQ04GzJiA9M=
X-Google-Smtp-Source: AGHT+IG3hZvK8C+cMGF+uVk4b+aXVA6BFJTfsNS862Moo2rzS8I7cz4aEtK6kM2lPIpp2ooN+swdlQ==
X-Received: by 2002:a17:90b:56d0:b0:34a:8c77:d37b with SMTP id 98e67ed59e1d1-34e92144e4emr9296355a91.16.1766408869428;
        Mon, 22 Dec 2025 05:07:49 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::402f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70c932casm12970405a91.0.2025.12.22.05.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:07:49 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 22 Dec 2025 21:04:18 +0800
Subject: [PATCH v2 08/13] dt-bindings: riscv: Add descriptions for Za64rs,
 Ziccamoa, Ziccif, and Zicclsm
MIME-Version: 1.0
Message-Id: <20251222-k3-basic-dt-v2-8-3af3f3cd0f8a@riscstar.com>
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
In-Reply-To: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_050750_467528_8CA336D5 
X-CRM114-Status: GOOD (  10.46  )
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

Add descriptions for four extensions: Za64rs, Ziccamoa, Ziccif, and
Zicclsm. These extensions are ratified in RISC-V Profiles Version 1.0
(commit b1d806605f87 "Updated to ratified state.").

They are introduced as new extension names for existing features and
regulate implementation details for RISC-V Profile compliance. According
to RISC-V Profiles Version 1.0 and RVA23 Profiles Version 1.0, they are
mandatory for the following profiles:

 - za64rs: Mandatory in RVA22U64, RVA23U64
 - ziccamoa: Mandatory in RVA20U64, RVA22U64, RVA23U64
 - ziccif: Mandatory in RVA20U64, RVA22U64, RVA23U64
 - zicclsm: Mandatory in RVA20U64, RVA22U64, RVA23U64

Since Ziccamoa depends on the 'A' extension, add a schema check to
enforce this dependency.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 385e1deb23996d294e7662693f1257f910a6e129..a6b9d7e3edf86ecfb117ba72e295ef097bdc9831 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -237,6 +237,12 @@ properties:
             as ratified at commit 4a69197e5617 ("Update to ratified state") of
             riscv-svvptc.
 
+        - const: za64rs
+          description:
+            The standard Za64rs extension for reservation set size of at most
+            64 bytes, as ratified in RISC-V Profiles Version 1.0, with commit
+            b1d806605f87 ("Updated to ratified state.")
+
         - const: zaamo
           description: |
             The standard Zaamo extension for atomic memory operations as
@@ -378,6 +384,27 @@ properties:
             in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
             riscv-isa-manual.
 
+        - const: ziccamoa
+          description:
+            The standard Ziccamoa extension for main memory (cacheability and
+            coherence) must support all atomics in A, as ratified in RISC-V
+            Profiles Version 1.0, with commit b1d806605f87 ("Updated to
+            ratified state.")
+
+        - const: ziccif
+          description:
+            The standard Ziccif extension for main memory (cacheability and
+            coherence) instruction fetch atomicity, as ratified in RISC-V
+            Profiles Version 1.0, with commit b1d806605f87 ("Updated to
+            ratified state.")
+
+        - const: zicclsm
+          description:
+            The standard Zicclsm extension for main memory (cacheability and
+            coherence) must support misaligned loads and stores, as ratified
+            in RISC-V Profiles Version 1.0, with commit b1d806605f87 ("Updated
+            to ratified state.")
+
         - const: ziccrse
           description:
             The standard Ziccrse extension which provides forward progress
@@ -795,6 +822,13 @@ properties:
         then:
           contains:
             const: f
+      # Ziccamoa depends on A
+      - if:
+          contains:
+            const: ziccamoa
+        then:
+          contains:
+            const: a
       # Zvfbfmin depends on V or Zve32f
       - if:
           contains:

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
