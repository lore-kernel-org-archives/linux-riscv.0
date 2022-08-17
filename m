Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38195C25B08
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 20:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3HxalFuXNldsTrUyXRXXFI7A12NOXzRoOXqv+lBACHE=; b=X32lW8bHCOSeYo
	6lJ6QDQIHx97/JnWgvle8F6x3wJ8jU18an1ELUi8paWKHwfDBNcSJyxiKPMExb1AESbs+wgdovZoc
	ycBEY4SYYJEAZCqtQy6RsvCs5pPvAHuwAKPIag2F/YzmYpV6diIXxEXWM+vSWcy547fP7SsxpyAtZ
	TGnhrsLVNY75hcNPLrzl1q0vOEE14Vls/BuGAPNno15oeB8ur2NnU0OEM76Xn3ovB//sMSWceh+dl
	GBLlDjae6W8ryxUdec4yzJ2swFD0mDMuICxmUT7IdGtSEcBj2YoBc8sSbeRFglxYZ78jd3vwBjw4e
	MGqY7OFe9ec5qIM+qvHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPPP-006AV0-41; Wed, 17 Aug 2022 20:12:59 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPPK-006AKU-Tl
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 20:12:56 +0000
Received: by mail-wm1-x331.google.com with SMTP id h204-20020a1c21d5000000b003a5b467c3abso1553943wmh.5
        for <linux-riscv@lists.infradead.org>; Wed, 17 Aug 2022 13:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=De0s+s/D2rq5b1W85sP7P0sadpD1tyl+4KZh5xfCdFc=;
        b=VoUCelW9ATsck56Z8Vshz+e5skJfqAaLWP0HlwFo7La/BTrmJH5e8zjyqLvEREwsny
         wivfEbQBCbsuAwXFwnaTCReVWo48k1o/9NHZ6uWUyyb1QcRZaacS8eYKfW160GvNgdRl
         tERNO6oWhTlIwX2AAbAEDn9M5mRMpl16CQcmPD1jWSFcupCT4CmqBFX72IKxsy5HNvI6
         1ofx3JTRa4Gz5oJXqe8j7aHCHkdofi+lsc4O68CTHYD7rM2Dd+IYZB4Y1c4bvN760fwl
         mqGvxbSv/gH2QOynns+PpVsW5V8qUj2oLo3HbjL3PbdYC6gjSc78t0dyQeNKj8aE5M8n
         wMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=De0s+s/D2rq5b1W85sP7P0sadpD1tyl+4KZh5xfCdFc=;
        b=YbDJ5VmlIS41kTxAFCzPx69rbLYFtp8e1hLIbrbxVfY0XEp8Ls+1X9AcTM46oH5F2/
         UWYiFYwhj+nGzOikR+8c98g7Ze6wRcFf+J4Izjt6wJLG5Uof0F+ACDbdUSoE93SkBBI7
         rC/eREaX5Ncn5iNf/PccwSYrg43zJdNKKlY/jWdNQIbVxzrcewWXF3h/+jk6zlHjvDXn
         eeVQsxjrMeuPFfGfHzY7w3EXzaMOIH+vsPGzEOtzKFOA9pllczrImUUs1HFCcg7KkOfu
         JvfPNHcS01osygDv++siULnzGTh4lnCfqTdiL7DfNU/oaSvA49koCUBESRBfuWcXBE5C
         jbKw==
X-Gm-Message-State: ACgBeo3AMvE0wamUGmSSmDQDszRbVvGM+39Vaxga42v5MkzNz+x5p8nt
	nyuCXhFhlLkWeoe1dKaTDqVN2Q==
X-Google-Smtp-Source: AA6agR5fECZky51OLxj7IyiHwCUh5pSaXNngYTDHiSH2lpDG7XCOjdR0BjCA3TzdeYNFfoayKbBkfg==
X-Received: by 2002:a05:600c:4f05:b0:3a5:ffec:b6b with SMTP id l5-20020a05600c4f0500b003a5ffec0b6bmr3007577wmq.199.1660767164394;
        Wed, 17 Aug 2022 13:12:44 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id i15-20020a05600c354f00b003a5dfd7e9eesm3029371wmq.44.2022.08.17.13.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 13:12:43 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	qemu-riscv@nongnu.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 3/4] dt-bindings: riscv: add new riscv,isa strings for emulators
Date: Wed, 17 Aug 2022 21:12:12 +0100
Message-Id: <20220817201212.990712-4-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817201212.990712-1-mail@conchuod.ie>
References: <20220817201212.990712-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_131254_970801_3820F8CA 
X-CRM114-Status: GOOD (  17.06  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The QEMU virt and spike machines currently export a riscv,isa string of
"rv64imafdcsuh",

While the RISC-V foundation has been ratifying a bunch of extenstions
etc, the kernel has remained relatively static with what hardware is
supported - but the same is not true of QEMU. Using the virt machine
and running dt-validate on the dumped dtb fails, partly due to the
unexpected isa string.

Rather than enumerate the many many possbilities, change the pattern
to a regex, with the following assumptions:
- the single letter order is fixed & we don't care about things that
  can't even do "ima"
- the standard multi letter extensions are all in a "_z<foo>" format
  where the first letter of <foo> is a valid single letter extension
- _s & _h are used for supervisor and hyper visor extensions.
- after the first two chars, a standard multi letter extension name
  could be an english   word (ifencei anyone?) so it's not worth
  restricting the charset
- vendor ISA extensions begind with _x and have no charset restrictions
- we don't care about an e extension from an OS pov
- that attempting to validate the contents of the multiletter extensions
  with dt-validate beyond the formatting is a futile, massively verbose
  or unwieldy exercise at best.
- ima are required

The following limitations also apply:
- multi letter extension ordering is not enforced. dt-schema does not
  appear to allow for named match groups, so the resulting regex would
  be even more of a headache.
- ditto for the numbered extensions.

Finally, add me as a maintainer of the binding so that when it breaks
in the future, I can be held responsible!

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Palmer, feel free to drop the maintainer addition. I just mostly want
to clean up my own mess on this when they decide to ratify more
extensions & this comes back up again.
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 873dd12f6e89..c0e0bc5dce04 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -9,6 +9,7 @@ title: RISC-V bindings for 'cpus' DT nodes
 maintainers:
   - Paul Walmsley <paul.walmsley@sifive.com>
   - Palmer Dabbelt <palmer@sifive.com>
+  - Conor Dooley <conor@kernel.org>
 
 description: |
   This document uses some terminology common to the RISC-V community
@@ -79,9 +80,7 @@ properties:
       insensitive, letters in the riscv,isa string must be all
       lowercase to simplify parsing.
     $ref: "/schemas/types.yaml#/definitions/string"
-    enum:
-      - rv64imac
-      - rv64imafdc
+    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:(?:_[zsh][imafdqcbvksh]|_x)(?:[a-z])+)*$
 
   # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
   timebase-frequency: false
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
