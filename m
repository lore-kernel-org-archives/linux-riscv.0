Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C04FC43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 12:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7hQHkdq5CWAwE4cyvNcU+SkxtNl0X9FX76VeiGf/xrc=; b=GlBHcgNGBbCJEy
	/1tzJKImBHMK23EdSHFVla0OLTGKVWXUuM3AyZugmfbkOIyWubwr+pO6AM+oMsnRnJx3cpf6FLTbf
	bmstgNOt4IPVnE9IRBtv4MliPXfObet+7/r1mszYkHL5WqSMR8p1YO6q12VWzUh9CaFupEO4aqHRR
	P3Psvcc5r7dEfRsuFOeRy9aTwXqgLzWDx1/UifrpVWnN1uMxEk0PCaL4hbhN8pTJq2D77dBtt3R54
	PsWWt4oS/tdX/alfF50Z4trLTbngssYqCXqGoH8fYwFn7XAvfN/wF7njrDXYqrEbv1orT5D/PO5V0
	izazhS6ONvqfi2GO4zpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuSE-0000000242f-40s2;
	Wed, 01 Jul 2026 12:54:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuSD-0000000241Q-2cWr
	for linux-riscv@bombadil.infradead.org;
	Wed, 01 Jul 2026 12:54:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=lNYo/DlbFIEXnMINvFtAOJPsCSUEkojp0EkJfm5QRDw=; b=EddhqU/LUGulOq8Sxb95UggowX
	p9Ev31wHWctX4pBMHi5C2MeBEwhBFjhPDObfrSnHnnOYSYF4tgskuL4KerSGQj3M2hSKDvflcEVnU
	7EIIlWDM/xWSacFxIh8eaCvmXebaGQaWs5+Bd6WzW6zuSSv5XmO8BB3oVoBGcKjzze1mXMWLBiUe3
	KqqDDJiXKq8hnvbNe//oF1487Im/qtXCFo8Ar+xjPAqnzHeqj2+iGllNK/Isip2MFj+ny/uglcjES
	YKUZW04L/iNuGzRaOEkRvMr/wb7qtw0gGDcCObf33aDsA5o06kFoaZByQkoCBOWKQdzuai1q1RHP5
	wTnntZxw==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weuS9-00000002mbg-3xa8
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 12:54:12 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-845ea8924fdso276945b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2026 05:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910448; x=1783515248; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lNYo/DlbFIEXnMINvFtAOJPsCSUEkojp0EkJfm5QRDw=;
        b=QBh5R/akqCks4/lm/AcvVSMVPpvFCdXNt2SqYJa+rAahAoJwp6VD7+hHWoRxap88Gy
         LKQ8FMvny4CQC/poqrBTl1UXp/g/eT4UfElo8QLPh1znFHDz0Qf+MWRgk/p4hxph6NCV
         o5Eo2/tF052s4ztGwdrDywlPVUFKUJiRG463sOpvp0RSDJS/HRsnmW31Z6QI8h7R+6og
         gn14J7IVFbrPF67XxIGSuDCIRyFb35aF4c6ACT05ZdgFpblRaqOt22WtXgaDi4Msh4BG
         +LZynSAeUI4R/+tqX2AFoIOJ8s2F2QQm/b9Sv59E2yHsF0kfc4euqm+EmyKPJL/wU2z6
         WDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910448; x=1783515248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lNYo/DlbFIEXnMINvFtAOJPsCSUEkojp0EkJfm5QRDw=;
        b=UBnM2oVuBgzTXvx+QPtPo6dR2faqhnk3XlbJe2z7REJ/sctdcJxOogvch31a+sbyZX
         mm4wtw9ANf082I9qZFfzWxkTlzau0Wqo+DzY+zptG7JvNoWYirlZzsKgAknNQdoZRbAo
         FOQaq9gouzuZRWicdfisNDGyph+0zaoRv1wNf0n3UxoobqMoVs9eNFpxMlxGPnLTdUNk
         1i9FpQi4/qWylZpYdT24xcnOjopY9YmaQIpBcu2+REBjh7VdvKOaDQbIl2+Kya81M23b
         0rDWETVOqR1W8VQQ45yCtfhwgV00aCjSeu3GWdiK8acXj1MCLJnjaQgzVNfuoMf1EqB5
         JWLQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp5ATjDg2OSIzmkAHmvj7XEaAp4kp0SBi2UZExQjeVpQ0cEcIh73eP1oPzwiu7D9qJZm9XtFkhPwMYUNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNAIGA+deo7J7a1aBbOLLt+GGIobehQ2PwP/x1e0lFBkKEy+XW
	RNa8jWF+GJihuEnmNdFdirC4/pL8zFanBeQOSdFCuDgA2FvrDy1O745g
X-Gm-Gg: AfdE7clTWhbDS91rdt/jKLR+bHYx7xwyWA68wT8iI/oaGHRWMOa7LtMjeznOx55fs97
	7QeUbG86ocMXAO+1KLQsOptMkdIFN0SdzEAQSb+ndy01y8bOQyvNtljKH4XU6GNsj5s3FtXycfx
	9Z+vHvcwlDbEb/vMk2SLRW5bsmHhefkl9bThd7LV64Sc8pwpHcTW6rc+HpwS9xhDmOOHYiZoC/t
	UaiDsbFZJvcxvd2dvj4G6NM4Ys1Ecjo9596qTvIWP8fnaDFiX/YVGnTG7l+aLr2j+moQ7XfP3tQ
	gzAmw+TI+H0nPi1TzXPlvsWaFn2EciYp/QsPoaHMKWs368gQDYSgG0RxHyKqy0QIPxzO8ChF+qv
	JPr1/xTPMsTcIueb2bw2ctrxjy7ibBThrH7Rz1iH/THCAjGlfabLoCcqbxhVj+hJJd9HiIkrmWO
	t4IQ+91JXpI5M4gYPCigxS
X-Received: by 2002:a05:6a00:301a:b0:847:834d:b6a6 with SMTP id d2e1a72fcca58-847c09c8450mr1321318b3a.62.1782910447535;
        Wed, 01 Jul 2026 05:54:07 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:54:07 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:22 -0400
Subject: [PATCH v5 09/17] dt-bindings: riscv: Add Zic64b extension
 description
MIME-Version: 1.0
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-9-2c61f94a695a@gmail.com>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Chen Wang <chen.wang@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Jesse Taube <jtaubepe@redhat.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2298; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=zzv4RpzLQz9N5QJYuvZNdW9u/BeWJDgXt1lzr+Z9BYs=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3tae54HSDm517WVHE/akZ2wyUs87/XY2r8u9ktmSc
 c0q7xk7SlkYxLgYZMUUWQ4fbcne+son2vc55w+YOaxMIEMYuDgFYCJ9qgz/fVW33XNV3v83JiV9
 fpLN0UdfY56kyUUnPP1+YnbxZCv+GYwMhy18OQtd2E9FfmEK/997+L1R7knfy7uueIlOfbDpEO8
 GXgA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_135410_137024_9591EABC 
X-CRM114-Status: UNSURE (   9.73  )
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
aligned in the address space. It is a mandatory extension of both the
RVA22 (U64/S64) and RVA23 (U64/S64) profiles, ratified with RISC-V
Profiles Version 1.0.

Document it so it can be described in the riscv,isa-extensions property,
alongside the related Zicbom/Zicbop/Zicboz cache-block extensions. Since
Zic64b fixes the cache block size at 64 bytes, also add a schema check
requiring any present cbom/cbop/cboz block size to be 64.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5: Commit message clean up, fix a double space (Conor).
v4: Insert zic64b at its sorted position (before zicbom).
    Update the commit message.
v3: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml        | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index f4dd34d446c02..bbd442cfbd904 100644
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
   # All three Zicbo* extensions require their block size property as there's no
   # default.
   - if:

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
