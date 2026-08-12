Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B783DC5B572
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 12:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SdeWUa/suOKaJYD4W0BDBxzcIbnYc7/2jxKPTTXb6tE=; b=s9DlE0VOlEmrIM
	slaQoW3ijoUn/fMM9RcNQ8T+agoZ0YTARg2QeKoTTTKDr0E4bou18AMkCtsGIQMPVKBl8LVXqfh/J
	wFFyTnJoJSA02fCfdq5iA8ptFNNYHCF7v2sUUc1hs2Vjz+z2jp+uk7ibxkYNrH3sud+UeLv0DQG2c
	G6HyPjAJQLmSBCS2+ZG0jd1XwVzg282sWvjQk8Mt4qbRuWxCu6JOTyrNK7zB6mbdsOyd/IQ57Py1u
	r65m6LD/JkKbn8kJLJ9/A91zXI2v2q0IzhkICeKt4mk+HZhM+n4zhRxC+//4B4K07RNH24ZnQIw24
	JSctJcmW9bBJOBNa6emg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7yI-0000000GB1v-1lUs;
	Wed, 12 Aug 2026 12:22:14 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7yG-0000000GB15-2g28
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 12:22:13 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so4152585e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 05:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786537331; x=1787142131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EYskKRXMT/E1v5UdRHS7zk2d1epkZSuiJ8hCmRGEFMA=;
        b=JJlZsQhNYW1UAgN1aFNtfQFJpVQwl4HhKf/xcAyjd9uR/FMG6DwSASmJh9mtkVT/B0
         6+AuZnNC3YGeL2faOnatlzLqDYCwjpEqQz5zehllWt7KQiL4InhnyoUWHPPpiYK1nGZO
         8d1oC0fvPBKf2PY290XfEh36WF22iZVAlVizDEpXCgUIekUzGFGmBGRO5SccgWQFQlmt
         3FJEnj9dtd7Tbf4NF/CM5vRRvz1eZ+NsX5ulwr4d+CcLr5Jg/b6RR/d7EYUtuezVxQLE
         MqxxOoKQlqUYJIZH3ziUBe+mXH4ulQQ5Eh9UU9UvM+FE0TMJU++3kpTNmmN3qHJDuYYt
         29sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786537331; x=1787142131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EYskKRXMT/E1v5UdRHS7zk2d1epkZSuiJ8hCmRGEFMA=;
        b=ZgzJxZ7MI634SKW1A2wMMeO2vUUJf5Kpxd/yv21NMILZMVhDFEmKaQ4WNDQroVlCy+
         pPWDEiPFUI4KZGzT+3UYm//HdijZKxH2ROyym0dEr2RRYuZo4UCHGZlOk9Ged25hn0EP
         XbeJlODg7cX/3+0Gb2oJANeHKDsPTGs0IBwYJHbRp8/LNelmGLSJz3+OOGRe8LTubhIC
         0389JHgBFy7ZGnS440bUHDjZunqVwssoIDoLjxHJ8tp5qr3RzXXuonwGxJmsJQwXbf4q
         Ds/9xqq/QaQ/Lu6xVkKO+DaKt5REzv7RAxQ+j7y1Z/rRJfoinZLzsObu2rPxSVzXUJQn
         9IXA==
X-Forwarded-Encrypted: i=1; AHgh+RoyQKhqV4YpG7m6urL8mbBhChoKDjmZBneoMtMTyRr6PtAZYsEGqgKpSSVB1NlvctbVCFzl8PhlSzXkJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7m4XqPBvyNNHKQ48Sd4w8wvrO/f4oBJP/44xhNGRcJy2vK9Bo
	U/sRqWBKJQQx31A2PY3oWdTcyoEq7VxYsHQX0N5D+85dx4mj9+y2PxeJUi+4OkQhZS8=
X-Gm-Gg: AR+sD11rIYxMv3yD9M6AvT8VZyJrBmc/2LLU37L7kb+dq7LQw6V4L0AAXveGVnpfc2s
	3L7Hb42wKsEoZS21HBw5QMzWS/2kVb+dL1JCauZuaViNci8c36MuYxuuhy0PnhpgBuFoIvj8/Oe
	b5ZoULTHfR+UdYsKX61cQb/EI8dIkuT2GiF62l9G4TjMz9htweX3TzbKZ+OtZymbx5WvZ5Kkoj+
	HOwnGwMx8EgMCPIiuvooDSnNgIGvANMyDOfXQs95HyYey7yMYmVF6aiJOUksEcnjUEviKv0QIgP
	BZJ2rvDpCJTSICF9sKcrGrMk4EgA+Qx1O/nhY78Gg+ZTnngOXrBQjUb6CwJRgoniFuRXFfzdw7s
	8YJUq906uD464nn7jyI/FwPL0H15S5DId1vBbJlTJ+2y7Jy+L1iPlypmPZ/KEeQRj+8qJwuf3I9
	oiZ4phazhV2zAHfjO/l7L+AVX17jXJJpL4g2M/ZrTYQV47MzfYKqA2i77Yiik4bTkPEgWkHIqvQ
	tr+BK1f59/2
X-Received: by 2002:a05:600c:1f8f:b0:495:5fdf:2075 with SMTP id 5b1f17b1804b1-4997bf83d13mr43895935e9.0.1786537326046;
        Wed, 12 Aug 2026 05:22:06 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aaa5d04sm65858905e9.2.2026.08.12.05.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 05:22:05 -0700 (PDT)
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
Subject: [RFC PATCH v3 2/3] dt-bindings: riscv: Add Worlds per-hart properties
Date: Wed, 12 Aug 2026 20:21:30 +0800
Message-ID: <20260812122131.1534906-3-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260812122131.1534906-1-peter.lin@sifive.com>
References: <20260812122131.1534906-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_052212_715872_35A0D825 
X-CRM114-Status: GOOD (  10.16  )
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

Add per-hart DT properties for the RISC-V Worlds architecture:
riscv,pmwid, riscv,pmwidlist, and riscv,pmlwidlist. These
platform-defined values are primarily used by M-mode firmware
to configure World ID CSRs and restrict WID usage across
privilege levels.

Also add schema validation rules to enforce valid property
combinations based on the ISA extensions present.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
Changes v2->v3:
- Drop riscv,nworlds property
- Drop 'required' check for riscv,pmwid
---
 .../devicetree/bindings/riscv/cpus.yaml       | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 5feeb2203050..326b68398b90 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -39,6 +39,26 @@ allOf:
       properties:
         thead,vlenb: false
 
+  - if:
+      properties:
+        riscv,isa-extensions:
+          not:
+            contains:
+              const: smwid
+    then:
+      properties:
+        riscv,pmwidlist: false
+
+  - if:
+      properties:
+        riscv,isa-extensions:
+          not:
+            contains:
+              const: smlwid
+    then:
+      properties:
+        riscv,pmlwidlist: false
+
 properties:
   compatible:
     oneOf:
@@ -113,6 +133,30 @@ properties:
     description:
       The blocksize in bytes for the Zicboz cache operations.
 
+  riscv,pmlwidlist:
+    $ref: /schemas/types.yaml#/definitions/uint64
+    description:
+      Optional bitmask of WIDs available for S-mode and U-mode use on this
+      hart; each set bit N indicates WID N is available. Firmware may read
+      this to select platform authorized WIDs for lower-privilege modes.
+
+  riscv,pmwid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      M-mode World ID (WID) for this hart, M-mode firmware may read this
+      property to identify the WID for M-mode. For a Worlds-aware platform
+      without any Worlds ISA implemented, this is the WID for all privilege
+      modes.
+    minimum: 0
+    maximum: 63
+
+  riscv,pmwidlist:
+    $ref: /schemas/types.yaml#/definitions/uint64
+    description:
+      Optional bitmask of WIDs available for M-mode use on this hart; each
+      set bit N indicates WID N is available. Firmware may read this to
+      select a platform authorized WID.
+
   thead,vlenb:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
