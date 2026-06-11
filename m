Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D93ECD8C9D
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 20:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eBvj6S25lnzYcl/jD9Du/+FwH0mKg/LHcC4d+e0R3B0=; b=U3sNUpYw+ckSf8
	xP5dAsZbXTHkZLYgmHG3S6V5kCSpPYeIVATJxgjzEXdN2UUnN1sYzAExCFnvlQuSFeAXxlaoqn4co
	PFv7gwHsjBDDuPx8cnS1vQa6HN0cIfmX4WUGtLbm48nN/EO2uSxZXBzMh2sczui9EU8fw7cJDN89G
	FtxRXKd4k+9dvCOG7HIu+6sSu/TQW6Sp6ExCz9nahneh+irRApSfO2UYpDR3QtLlfIGPCdbMsMKHm
	BMoD+ajVhlmFsBxlmNjCxc7U2ZpkbI+FwLAwgQj+jwYL/a56UaEvjb1lCg6COT2D/c6//PUlGaXlE
	ZBW08bPwF0QuRA6qYjOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXln5-0000000A1AG-0VUg;
	Thu, 11 Jun 2026 20:14:15 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXln2-0000000A17h-28lg
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 20:14:14 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2c0c2d792c8so1927765ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jun 2026 13:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208852; x=1781813652; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+UogjurmnadVGaEybH3I8GCYhGRY5wKTkofTPfwNbdk=;
        b=LZgRgky42zsMm2FImowoM7nfozf1bUkC0sPCtYoM1D1AMIR973q/jDUBjsw8f87a/3
         2jqeyRPocp83pfUIcB/ihtcYMqUE+/eOgN4p2/Qu29WRzHl5ObRUa+skfCbLCH6qJIZP
         oOCJ/eAN2D5QHF6O+1KvMTDOi3ShNt0yWqMS+Rc3f0gMfMf4oI7wenebuMzU4Vr61k4K
         Yidb3bWmF3wBoA8NCmAa+RG067ToXXYdoAb2550SrjeeeiGPj1xpMB6dnxSuwNJUr64A
         CpYk4bYOPEdiOVS4QwYFdbvA6sjcRw1BPCzUvjVX104skjLn9MwNcIZdhZzWtmkikq3o
         fEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208852; x=1781813652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+UogjurmnadVGaEybH3I8GCYhGRY5wKTkofTPfwNbdk=;
        b=Qo23kKYrbbGLP+fEfbznyisbQbqkfZ6G+2K3wZLlZqkgDP+bZe7/7FpcCh5LT4kLHA
         Cwu4xSv6N9p1MaCGnuW/BvpBDvgQlo6IvS7P818oYryLu9k4+5MzE/+IQhldE+h5gHxH
         Z0amt9PvqPrid6KxB7R5M126+kMv21Z+89EnK7ZHAgGfP0CifLuu1b/sbFQu59LY0N5O
         NY1q7gxRhn/bezy9DjbE8FBwCWbeWC2zzBmfIu3Q1mDATVTrTdNWrlWcIs/IG0cnvAx0
         lGqh5qnIGIIM30fWP2RPmHVDrOCG6aYrUNkI/gqAjGA+3CvmhhXJ+n/HPxuwWsIqn/pv
         01pg==
X-Forwarded-Encrypted: i=1; AFNElJ/r2kKesyFhlpaD4tk7ORkgNsM+o2BLoJc5YBWqfXUC0a2mmkSr/UbhYZQyRHffq71kOkf71/AA9N+81A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMM1kgTaBxcwak8dujSUSm0cwoTrjxTWYNq0DtK3LNH+gN9/xC
	sQaz0Kil+zd/bTO2Dufm0p1ZbhfZWTP4bHN5ExBe0bXFZg5VdZFu+0kx
X-Gm-Gg: Acq92OG1e5GL20lHZiRlY7AiveGUdP/03QfYbAXymUMMsqzWR+QGrxgqrKce3RTC5UU
	Zx+UJ1Qa+hfR1ap398ThsGmbAZqLnonKrW4HJevDvNoprzSsBbJtAP84lF4reOL/6cSOA6COoH0
	JTgKucj3DcGGYhCOGDre7/SODHThzrVhFF6d6L+cFJc985Hli1xdLLax9GdeWAqpv6de8XR3uS7
	+WMW1W85qdoaQpwWLuG7HyDUjG0T3vDk7RYFIKDTfdNFqEg4EoLslvZATJVPxs9Q4VL4N0u0+qd
	viTST2uZjVqy8SmGVg8LfIkBkPOHXLJqob8dPzwv9nELGWMHRvD84x9cIMMdd5R4uzn9KJb2bFY
	5eYEpYdBQUpXtgVD7T+PEecmGR+n1qZLun30nO/8u49yyC9ZiiCunM88tEo2kLAbqmo/Yewvwsg
	==
X-Received: by 2002:a17:902:c407:b0:2c0:c625:4010 with SMTP id d9443c01a7336-2c2f2d5b823mr49982165ad.32.1781208851778;
        Thu, 11 Jun 2026 13:14:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:14:11 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:45 -0400
Subject: [PATCH v4 08/16] dt-bindings: riscv: Add Zic64b extension
 description
MIME-Version: 1.0
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-8-3f01a2449488@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2173; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=vzqxvIv/Z820msoDS14+zD5u3OuYC3MRZkySViyquOA=;
 b=kA0DAAoWgrIluVNoGREByyZiAGorFsGj1LKmqSZuxM3ds1D1JnMhsEQYTedSZCio+Vjz0G5Wp
 4h1BAAWCgAdFiEEw8WEa7XqTFtN5wn4grIluVNoGREFAmorFsEACgkQgrIluVNoGRFeTgEAlm4q
 TS0RrfZZaJySqif9VGXq49FSo90l1aGtPT74WfsA/0Z6QPZvvgDRClq2yD8QKSJAIMfvQbF+DxU
 A/TYM7CQF
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_131412_595026_9364DCE7 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Zic64b mandates that cache blocks are 64 bytes in size and naturally
aligned in the address space.  It is a mandatory extension of both the
RVA22 (U64/S64) and RVA23 (U64/S64) profiles, ratified with RISC-V
Profiles Version 1.0.

Document it so it can be described in the riscv,isa-extensions property,
alongside the related Zicbom/Zicbop/Zicboz cache-block extensions. Since
Zic64b fixes the cache block size at 64 bytes, also add a  schema check
requiring any present cbom/cbop/cboz block size to be 64.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v4: Insert zic64b at its sorted position (before zicbom).
    Update the commit message.
v3: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml        | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 5ffc40d599c02..1c24999beb59e 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -494,6 +494,12 @@ properties:
             in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
             riscv-isa-manual.
 
+        - const: zic64b
+          description:
+            The standard Zic64b extension for 64-byte naturally aligned cache
+            blocks, as ratified in RISC-V Profiles Version 1.0, with commit
+            b1d806605f87 ("Updated to ratified state.")
+
         - const: zicbom
           description:
             The standard Zicbom extension for base cache management operations as
@@ -1142,6 +1148,20 @@ allOf:
           not:
             contains:
               const: zilsd
+  # Zic64b mandates 64-byte naturally aligned cache blocks
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zic64b
+    then:
+      properties:
+        riscv,cbom-block-size:
+          const: 64
+        riscv,cbop-block-size:
+          const: 64
+        riscv,cboz-block-size:
+          const: 64
 
 additionalProperties: true
 ...

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
