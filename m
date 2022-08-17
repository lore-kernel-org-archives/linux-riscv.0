Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE71C32773
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 20:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3HxalFuXNldsTrUyXRXXFI7A12NOXzRoOXqv+lBACHE=; b=I7oFKrdOYiu1q/
	eqTreeJXF7nmaOgecaGU1zRVYdnjrjpGAh/ZZWuKYw5Kwq877MXNFkt+5KiKTbdorP2/1VibbLvml
	OXau1QDCeSCBtDkUZ+QPSAQtSseSTT6e63GTtUhQZlBfanrFzIfgdIFsvZFjfkSp0McKYGr2az6jX
	7Jgb7dtMJ+ujq6D6Knldv2fRWYz+uQDeas3elMuUxoXONEBlkuVacBaJdaGvC69KQ86kTbY98vLaX
	57r/nic8t9DvCsct9PSpfF9OzUXEPVwHR7W3UrMoTJUI8w15AzjcxSuYQkOzDDgXCg++JQoQo94ir
	PTXTIdUz2u1KrNh5kE4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPIg-0066V0-Ej; Wed, 17 Aug 2022 20:06:02 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPIa-0066PD-Jr
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 20:05:58 +0000
Received: by mail-wr1-x431.google.com with SMTP id n4so17367584wrp.10
        for <linux-riscv@lists.infradead.org>; Wed, 17 Aug 2022 13:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=De0s+s/D2rq5b1W85sP7P0sadpD1tyl+4KZh5xfCdFc=;
        b=CqamtgAe1cozn3E5KYzIR0JSvcCAa1Xfs2dPgBcx+0TIqlYpaQ31CAGtekwFrEq3/w
         +lY37IADJw7hcSFmTZ5af/FF/BWp/lzVufrxeKGzDhuXY3/lmzb7Y/GcUmt+NJ/1dWRF
         No5gZ+j+hFAHBwcOmgNIM0KteUxW83ESCVJCDvMNCkbHKNu4Fp44M0F8HZ5m4YVcrYE5
         gVv1hRa6fQlU4jn/uVxGBskyzHAK1X3lsTkVsg7wg+nHs6RGCiW+b8g6A1EAMAB44MnL
         JLobl0GZbdVudwNjFMsjiMjZJn3PJPDXAw2MQGt1Z7ETNOFJguNN9qrdd954ctHWf0up
         IktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=De0s+s/D2rq5b1W85sP7P0sadpD1tyl+4KZh5xfCdFc=;
        b=C3o+W6Af4Pcylj3+2B+Xu71Z7ORLlFZR7fvSHMdU4lpO/YPuDXk9w2f86RMl2GhnQB
         EThqzOm9goHLqaDgHsVHWah3G7W2OJRlaIZ7+Psebwy3wEriWGRz7Y/dOWnDJku8Qe74
         ykw1/zc7ucm4fivW6CrHIBg/JTGyWiDQKOeWXF51XiJLqPO0Aj0j48Rs/z+33OG2pl8B
         hO6FlrdL2hh8NaCiNEwtJQXmIA2qzbUxVbTraLVIP0eq08IoH85IfhCpjtjnOngq452u
         pX2TblYffWk+FiT2xnvAr5b7VHHQspnBg+q/1kmSsXLJBYGtY3wU2QgdkEsbI8Diz3JC
         I+BQ==
X-Gm-Message-State: ACgBeo0pw2cQe7tmpZKxX1s4TLWIw7eyev7WWj9T3wfGdXyJP9OlLWnP
	eBUNfLJC3wKzojQv1jXQe+VrDg==
X-Google-Smtp-Source: AA6agR50pEUBEksxLhbytcIwiO8h9Uinjt+PuB3e09bA3J6AK1dzbXoEiGaehAaijDuEftMP10HEjg==
X-Received: by 2002:a5d:534e:0:b0:225:2c0b:9b08 with SMTP id t14-20020a5d534e000000b002252c0b9b08mr750530wrv.136.1660766754709;
        Wed, 17 Aug 2022 13:05:54 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id i133-20020a1c3b8b000000b003a531c7aa66sm3400883wma.1.2022.08.17.13.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 13:05:53 -0700 (PDT)
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
Subject: [PATCH 3/4] dt-bindings: riscv: add new riscv,isa strings for emulators
Date: Wed, 17 Aug 2022 21:05:22 +0100
Message-Id: <20220817200531.988850-4-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817200531.988850-1-mail@conchuod.ie>
References: <20220817200531.988850-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_130556_716006_366149B9 
X-CRM114-Status: GOOD (  17.61  )
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
