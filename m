Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10DDCD98C7
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 20:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=125Yvr54S79Ick01Nke2hQ7vjtc62picpF2W2TguA2c=; b=wf92P2CvtZKgTL
	14SdSIo22wbZBno+/JJ4XjmdIGXcQlNRBQHzWxygQcUGgGoGCl00o9zqM66zufGP1oRvP2Ir3NHKJ
	SRCEWAFSVQ5/WiuE2rnK74Mib/l5JYbkkS6q9+8+60yIAnWMpTDCE46IFV2NY4PSBxkkl+P67c6qx
	uyf2/zWP1ebmlBQmcUJ56aE6ILKnYrMbX91n2cgrcczJ0WvZoRUvg+rjuDTeIRI4vykUtqWRD899O
	5SUowB2HyUmPPRyvvW+5sPkS/jTkFrYg7EcgsGxQpy9/UfDhq6iBDpX6R/g2up4YMwhZ2zKZQOecQ
	zSBQmS+am5CLUIPs94Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlnq-0000000A1YC-3BZi;
	Thu, 11 Jun 2026 20:15:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlnp-0000000A1XZ-2bvj
	for linux-riscv@bombadil.infradead.org;
	Thu, 11 Jun 2026 20:15:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CWGPbpmqg0lH1ng2byOCnVsoEWVWZdy1zTkLpAItnsc=; b=JiAB5b+HqZp+O4lOcZJ50BbY7i
	lKZa/px2NUhuSk6sENnSctCUe+x0/3AD6lKBpVFqXqG7gDwWDNN9kl6rVpPqzTz2PqsPDjobm6U2d
	b8b5mfXXUTzqA8wlA/R48+ZUoEncFbsfiqUrHOW0rVcFVELndIVJzjZoDBvlzGbhlq9ST7XjcCZov
	a5mmGGrQw/vi3mndDod7FqrtBSzHET6uTjoDfGMFzxtfcbfA6lyx6KS5zeS/yqim9vNjawQXIdBY6
	4wwaXlchmbjHXECocM3So9OfVXZyG6EQCoP61SpjgXUfuMItxqpxUNcB3Ig4q9o6xUxVucsBGj4nZ
	C5wDgBwA==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wXlnL-00000005djj-1gMb
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 20:14:37 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2bf1cda2b17so2524435ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jun 2026 13:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208868; x=1781813668; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CWGPbpmqg0lH1ng2byOCnVsoEWVWZdy1zTkLpAItnsc=;
        b=pB1zvlYUft9e9aQJCHADgFlckZPCKAobBJ1yEmdRMe6mjMw38VClAN5Q6zA8v6l0Jd
         nGoKhd6txj3sGn9BL4KiUMfDKN4wddjvUMlrmif8uE7HPQRSiY4o4yiWwthNzfvE4iMg
         SW68PveAUe67DX0103FaQLdlSAnyUYjU6i2ugrDd58tsvg5eYWqEsMpHH9Y5Gz+tpgOd
         9PLeH/tsyOUM4p5SRDyJPOpsbEYDnc99B/z1uNfDqV8rrju4q0iX1AgXTViBMh9x2bK1
         r2/WnLpemK6bDqJ56175iWQ6tEIy5bYXa6/cm1RHI6WKK2hBDCsaLb+MUVsgS5wqNL5c
         gAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208868; x=1781813668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CWGPbpmqg0lH1ng2byOCnVsoEWVWZdy1zTkLpAItnsc=;
        b=lP2efVGb84jBBNyMCqaSeHE5N0OW6AJDWU5PZtghmy84WPQfHYWDwylqytNDRpYF/h
         cOoEoH0Dj4RyA6klVYoY8PONyS09MxI0JW0fw+miOHiREvUQ15lkacKGmf/rKnN0aXSv
         iqmjLzHtGZ4u9PgrPn0OL0OYyZZGJTmwDQ4TZv96Tm3WLi/H+NkswdwHsxQW8XWgBMUs
         6nvL25GQfMq+kaKodCthAyO9Pf1WBFbP76JErkC8X8jq46oqmeKWA5Cq6DdVWeBzGGPr
         nKcviIkPxcI7UM9fmOFnFUSMZa62nb2gwvxN9ZStUmVHPQxMlW2oqghGozlWHPizbIMd
         edgg==
X-Forwarded-Encrypted: i=1; AFNElJ/zJ4uCU/CKXfds4UPZO2FO5Eo4xO9HB/YQ+XsBO7TK5ErqGpJU4sgt3/LcACapo6SzPq04U+xTrEJizg==@lists.infradead.org
X-Gm-Message-State: AOJu0YymKBHoiLZ0yH3tG2wTWa/dXHQ10zU5KX8APkWB5lb7sXvTxexG
	FUgyMS8ytIp6Gw3XUp8bkAYnzbxtnNEvmJ3emYlafm8D5mH40mrBRnTc
X-Gm-Gg: Acq92OHp6Wu12foE3+fh3lRzqpsW1S0uiRvYWA+lHYARYAZgZzxBANH1+Z3Oft/a6Zg
	J9uemyZca9rkOlGb3gMp+LYyRmnaNQlb9bdAH4xj9VCipakpzW0TKKf4VwHg0rq9NAocN6S2J6H
	BpTdalKyzHmX1oNEATq+id3e8Q2YOUB3A3z3VAayDp69xTP8fp91Vi/GSlKkDtUzUsgHx1MMrtO
	Uk0lsqsAGWRqETj3gKwDC4TPtDBR07mbLDBW3g4pNHApfW3Rll4D/gCtzG50ike/6qOO14sDed3
	iyiXx8FgJFMtgIEVK/g1Xrklq/fmV/S9lldFulwxU38D2fUc5jrlw1i/NZH//K9LNvZbtyJXvcP
	bc4XOYbI90D9QlE2zo4Z9oA24tHYhtsdloDzfYVd0jmFtRpbXOna97JWB5pgP3Q6siplVnMaAXg
	==
X-Received: by 2002:a17:902:d4c7:b0:2bc:977b:846d with SMTP id d9443c01a7336-2c402bddcb7mr1128965ad.5.1781208868292;
        Thu, 11 Jun 2026 13:14:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:14:28 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:47 -0400
Subject: [PATCH v4 10/16] riscv: dts: spacemit: k3: Add Zic64b ISA
 extension
MIME-Version: 1.0
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-10-3f01a2449488@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6777; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=1hC6zzKA4CJjQriIWM3CQBXPR2A8kSqDWjw+47N4rD8=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixtsUNn27892F2bsvL8+ytHsyfXaLy7eWNDd+Bp1uDv4
 v0m5Ud3d5SyMIhxMciKKbIcPtqSvfWVT7Tvc84fMHNYmUCGMHBxCsBEnB8z/GKa8FD2xNq8g+zz
 pJc+u8e88+GfZwvKUkKurollbTq5YpM6I8PSrg3tcwoOdjqtL/Ssyi3c8u3jRamnLhVXA47z79k
 gqs4NAA==
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_211435_382355_076BE6A7 
X-CRM114-Status: UNSURE (   7.28  )
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

The K3 X100 cores have 64-byte cache blocks, already described by their
cbom/cbop/cboz-block-size of 64, so they implement Zic64b, a mandatory
RVA23 extension.  Declare it in each core's riscv,isa-extensions.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v4: No change.
v3: New patch.
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 48 ++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 4ac457399b583..b5aa983f0bfa1 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -35,9 +35,9 @@ cpu_0: cpu@0 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -76,9 +76,9 @@ cpu_1: cpu@1 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -117,9 +117,9 @@ cpu_2: cpu@2 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -158,9 +158,9 @@ cpu_3: cpu@3 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -199,9 +199,9 @@ cpu_4: cpu@4 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -240,9 +240,9 @@ cpu_5: cpu@5 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -281,9 +281,9 @@ cpu_6: cpu@6 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -322,9 +322,9 @@ cpu_7: cpu@7 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
