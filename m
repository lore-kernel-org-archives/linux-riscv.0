Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935F8CD98F6
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jun 2026 10:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sg9AmFUBVMka6bSiMbeSvjDBSQzvcGfEDv+pNDofiqU=; b=kGQTBKVF1MnFbd
	PlZ5XSsXpavVuhy7VXrgQvb+MQxK6aP7h0s2Ojjij92SiVWNktuZe7A2O7HIfqoO3Jg+Mkq5DYJWU
	7kTvuzxnq9oy0zWQ0j7HG5hiHmtoBPe7cyyYvhlZwXCYPMkwW4CfP0kPWxvlD9EUv4H2eQR7z2f8q
	8HRvrFxiBtHA8LaJoXAxrBsy6z2BcZsytzUCpt1gX+L2I+5NXK8ZJK2PG85QPicZ+QnQj8TyTaK43
	Cvf4p6wPKxDHYQJ5e4m07kRcARNL3ps7BQ6OKEMXE+6+c9hmZozl5rQqbbt6WlQ847ScvElUaV4wd
	zx1nmkNP6FVIibJ6LtBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWoe-00000002Iip-380k;
	Fri, 19 Jun 2026 10:51:16 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWoa-00000002IiI-1Qsw
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jun 2026 10:51:15 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c88e3e82d81so1025170a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jun 2026 03:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1781866271; x=1782471071; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+AnvJHsC+E9gxmigHUGfqcWt/5+4STIPC8FnrseYIVY=;
        b=YVRZghiSuYSdrWmTiKKaWoHfM7034yNq1vGPwjTiLYJXlTynHmMRNYVBFlm78qTPg2
         L2q8jaWN3kmvugKOoLPRXGpF9kKCNAojFR+aVJTH1DmlD0YJohFlFxJGufzTx/07iFY1
         4ql/gYhMfbVsMDVgmKAh+VaACEBFc73iyLU/mGxwtlHa9Qt3m/dZv5tgncu867ilaqkI
         Y69qo5FBUphxOw6a6YmexcYR4h57TrbcGsk6fzIL5wpc2zWkypiaqbFr0wSZ67p0ATFQ
         V6DHuaO3nKQapJ60o9PIXvsr1xiVA6FNq9w9BPvSorOJPAExfHvC8AZtY6Sm9ZR/hWPM
         jsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781866271; x=1782471071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+AnvJHsC+E9gxmigHUGfqcWt/5+4STIPC8FnrseYIVY=;
        b=QMQKVQbaU4+9AbdHwfVGr2vdof7SsWn24VjRjTt03yTbqmisHjsQaA5k7oJW4ZZ5rg
         SBU0MSHGWj3hYo6AABQ2z6FqEMiYCKEIKzZQG9XGd8G8IIiETWnw/ETR9/SUdYCwSPx6
         9ex8AZ28vnV9KXVHVuoU+4UuZVpNDqin9W9+BXj8HDgpoSnRbPtJbwG/tdeVW714inJW
         kkwbQNutaIBdrj/fSpfmLurlbLw9NyzviVB6vQ1y5jIwMs9BHFxeddA0KUf5DlhvUaNZ
         58jDnFYTEp1upnyJQqPSh0Ik7h8LcPHkNYwazjKko2GdE6LsTZ+/IAOFzw5o3Obt7eGx
         p41g==
X-Forwarded-Encrypted: i=1; AFNElJ/G+P6IYidWwHhBd8zQvd4C3I950OkereBHBY4b1fKeSPnWRSbrA4IHcoIRG3kbqhTP6f9vN3myvQd/xw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz08ol69JMOQQaeC9De2nxdcdkmEHwu8blnVJ3HhoLyZN3ZKRfN
	6VkrLb94/Me7ezydOXOrZckYXEMaKE+3Ma+EnLyZ+WTPvErWV9FFHnpMg3r1ae9FEmE=
X-Gm-Gg: AfdE7clKSj1JScjtUgXESJaWiBdptK20nKKeElkBdU5663MtuM/COkNM8w5orT05ec+
	D/nAqE/Txx93/rD13I/V3guTw9h+a8as7gv7xttfWLp5FK477NP8SNsjPKaMCYHyDoh53qxgd2Q
	zGO4DxvlCPAlG01V6Iosq7Vc6SihMYFb8soxzffW1tV4f8lheApUxYQeU9gHgUD1BmkTmwhCcyB
	06y0ie34Bh9gr/qsqYwvzRKmWEZE9LHzzO+yLfInccPzytzxEV7Cjeo2Yfwi3/Wm+aYg7RgF4+T
	27ih+1+j1sP0QcA3fR6ZXL3M6JdwOMoX9RefO135Egp+NjFz4+nn/n1FSX9m0FTBh1BMkHJQJjN
	IrOp7ylIcxUUPw6BegGw2J09d+LLNhqkMfsl4XgeqM3F9i2QwCv9r6LJMby5ha96AwQ1p5+XKGT
	mNBG7AqHUC0uzVCB7+ySWIAn1aU+bG/kRSkYCK
X-Received: by 2002:a05:6a20:2d14:b0:3b4:7b2a:6a0a with SMTP id adf61e73a8af0-3bb35b6e1d3mr3626858637.35.1781866271432;
        Fri, 19 Jun 2026 03:51:11 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8a84c6eb1bsm1993583a12.2.2026.06.19.03.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 03:51:10 -0700 (PDT)
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
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH 1/3] dt-bindings: riscv: Add Worlds ISA extensions
Date: Fri, 19 Jun 2026 18:58:32 +0800
Message-ID: <20260619105834.1277302-2-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260619105834.1277302-1-peter.lin@sifive.com>
References: <20260619105834.1277302-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_035113_690451_33112FFC 
X-CRM114-Status: UNSURE (   7.98  )
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

Add DT bindings for RISC-V Worlds ISA extensions to tag
transactions with World IDs that hardware uses to enforce
world-based isolation across execution contexts.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 2b0a8a93bb21..1bc8b1aa67c0 100644
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
 
+        - const: smwdeleg
+          description: |
+            The standard Smwdeleg extension for M-mode delegation of lower
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
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
