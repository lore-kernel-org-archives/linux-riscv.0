Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7018C46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Dec 2023 17:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QmYaiH9UA74ynyXEIKLYpGop6YI9dEyfl4R+vGjY1Ak=; b=cMrwowIW1/2kCL
	WkQMNBPL0vASVyGzoVy2jGc00ANfqB3EfKvRW9C7M2kwlITpEHqHSORDuIJuC4PtPun07rwaow1ix
	yY/zljF/HENUHPBzkDSja1cFgKW3dhLMbpQ7rUSQhI4Q4yv9vnA5iGezO5aSZXRacDVUpwNSPMXvr
	2aa6qAC+6lQuHsdpSxNhdKhApapEJh2s0SWGTkZCJSa3b9++TIVHb1vOvDvzpp0OgT2nobaZOkY+6
	8NmzOATKqtucosACzo/T4MiDND7God4pkVAI3pYBbAA531P5CFsIcRYQ0VFVhanahOrfGB8BrWL3G
	Zd7Y1oxGdXiUdcIbx/Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIYA6-00FFd0-0J;
	Wed, 27 Dec 2023 17:57:46 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIYA3-00FFcT-0c
	for linux-riscv@lists.infradead.org;
	Wed, 27 Dec 2023 17:57:44 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6d9e62ff056so1215906b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Dec 2023 09:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703699862; x=1704304662; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qFdk5z5GkjX88rNpaFiaLGBWYiEnPzJT6afZDm+eY4c=;
        b=VqPOgVgfrarItqQVyU1gAn1RSecMIEFavhIR5ftXvP+txe1MUUpcCYzZiEucZLs1cE
         6nL0zN0rpCTIgppK2QDs5SiRX70corBwdpZrzJwmiGGu4PrPIgVoyiXXHwzfCIyg32iO
         GWgOxth089LYt7UKx1cN0Xi1RHqnBS40hEOTGzZu1yI4p+4nXCRnYcv0sryfujXCH303
         8Ii8Stl9LY2cHst2AzZn+ERoCA/NjTTqFYllK+KOMY+ZYeuHEaUIDoA9wPt2r11TVaaj
         AFu4ETc+vnvP7gOkU07t2nkzPXL0MfA4BoC4P5PIDsQu1VhNcePIZG7AWvZhC2Hdb8Ht
         Hs1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703699862; x=1704304662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qFdk5z5GkjX88rNpaFiaLGBWYiEnPzJT6afZDm+eY4c=;
        b=DaWn5PObcFCtTFhoH6wi15a/SUL1QO6LBSfHblfWKxxP1RItX0YMAK94MlBe8Tomkg
         Z4KY2LJ5aSJh1TDfITSl1kTy9x4Vg8kZnY6tgQyHUmO6KUG9gdy7ARR28Yd0j3zsidKz
         +Z4qNZVW6oxl4j7MOanZ4gOKJo0hiHR2JMVcYWqXtXLqj4iGoocgCM/9SWftP/tkC3QP
         BX81yid1KmwgY4x5vPCHfwEJYnQJD0VMCk9kV7RRU57+hR137L8nQccWRPeBk4S8mpot
         yU+8KOR+s7pIgoVGDMeDBB+cRJ4Q2kjmzT1Cb7hUBzv5cQoppHlh82mCiNauEdaXneAq
         LXQg==
X-Gm-Message-State: AOJu0Yw4Q358J06I3Amv8r5W3nRoc11ZidjqyZag8SkRKxZXrkHMJHah
	fOgp9xMe80RlpjXD4x2g2eo4boWWaeY0FTK8x9bTLjczRhYBQANfH6MI3D5nFf3hItmtA3asbXV
	pxjIJUZZWGj2Vu2GpjsDQFZHK/nn5jblTov/CnqeCSUKbwTJSvS0Oqtn68AoeQMaxLNldTM0Whf
	lDqAFd97tCgdJEzI9ZlokBk+xfdUU=
X-Google-Smtp-Source: AGHT+IG3LdGjYzMPRmS6MMdVEdOJ+KYoJn8AAAezZGQEdrEgTXTmxvLQ77RqjlA7YgUPq4uTh+mQCQ==
X-Received: by 2002:a05:6a20:4da6:b0:18c:64b7:b217 with SMTP id gj38-20020a056a204da600b0018c64b7b217mr9235433pzb.22.1703699861863;
        Wed, 27 Dec 2023 09:57:41 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u5-20020a056a00098500b006d9bf35dd1fsm5198094pfg.142.2023.12.27.09.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 09:57:41 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: riscv: cpus: Clarify mmu-type interpretation
Date: Wed, 27 Dec 2023 09:57:38 -0800
Message-ID: <20231227175739.1453782-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_095743_267614_2EFE1C5A 
X-CRM114-Status: GOOD (  10.90  )
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

The current description implies that only a single address translation
mode is available to the operating system. However, some implementations
support multiple address translation modes, and the operating system is
free to choose between them.

Per the RISC-V privileged specification, Sv48 implementations must also
implement Sv39, and likewise Sv57 implies support for Sv48. This means
it is possible to describe all supported address translation modes using
a single value, by naming the largest supported mode. This appears to
have been the intended usage of the property, so note it explicitly.

Fixes: 4fd669a8c487 ("dt-bindings: riscv: convert cpu binding to json-schema")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 Documentation/devicetree/bindings/riscv/cpus.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index f392e367d673..f166c729c482 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -62,8 +62,8 @@ properties:
 
   mmu-type:
     description:
-      Identifies the MMU address translation mode used on this
-      hart.  These values originate from the RISC-V Privileged
+      Identifies the largest MMU address translation mode supported by
+      this hart.  These values originate from the RISC-V Privileged
       Specification document, available from
       https://riscv.org/specifications/
     $ref: /schemas/types.yaml#/definitions/string
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
