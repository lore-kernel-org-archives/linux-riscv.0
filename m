Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9B2C25B08
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 20:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TdeuXAuWZxnurTEyc+tfsE6PcL8CUj4xrRFrNluDHNY=; b=p89LyC2ehUXfea
	dUKogv6PebKTZhEcz1OjLaNwRRe6dV2q0ewA3Hb30y7OGV5lk3eOTXdUhJIdIjATjj4CuVxQUtpEP
	uwlmYlQxpcd/bOY1JYTsIb/yv7Q1uIm+V+HKPmpYD1ZdIS/3W62y4q5GDKFGsUpnpaSD54pfQjlN7
	htqa+HIWtdeOmqpgkt16C8MRnJtp+hg6+o6udmZf7U3kLlJsUd/40u2xxeQwCU1HRq8jSOoh0Bf9W
	w7L2DX5HwnNCTignzNiNbWJsMPgLQSnnIq9FKUo2vHsC5S0Etv0RdTr8ZrB1tYpGuw383ptsy7/TS
	r9npAf8h9dxuOyJpwNCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPIj-0066Wu-L2; Wed, 17 Aug 2022 20:06:05 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPIb-0066Qb-NH
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 20:06:00 +0000
Received: by mail-wm1-x330.google.com with SMTP id m10-20020a05600c3b0a00b003a603fc3f81so1460761wms.0
        for <linux-riscv@lists.infradead.org>; Wed, 17 Aug 2022 13:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=MSYB9FwL7p/iJdXtPMVngWpHWItwLj/alFVUIh6RUfI=;
        b=aalXbJEtEyz0fdYAOCKPabkxfm+u5zzEGFKYYYxBeomEWGFk/ytTvkEEfWKdBZ9qam
         wwPT8nrUrsYfzpKtV1r1kCaWqWs7YknEFQ+aMuxIJu94oyoYyqccYk++TUEtq7RdJvKO
         MzSWpQ8GV7vEXfBNVWpGsamiURxgJnsbxc7XXf53ogih2Ou90s3e7mUu35VW3GIQCSSw
         JPvYuuH7VSB7jfYTR68yLcDpE1FtIEkttItkbc9J1nSS2wMYrQSwMbS4hn8f9anRfmWP
         24Hrem9kUuAlsAO5ml5foFmLYM1OVh5ICRpf43152oMEX3Pn0AUq0pEnXNS1n6QB9vsm
         c8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=MSYB9FwL7p/iJdXtPMVngWpHWItwLj/alFVUIh6RUfI=;
        b=gWzZklJDccEl9eyDJP2491VtCNvDqhfGG1sq+8M3hKSt0kqgH1raQldir+SB3j9ghS
         nsw5/+Q2rii5Ciq78tXyhQs2Y8sbvgW1g/fOr1FrZ4nPfWvOtxKzKawuAWex0JilpRrI
         V5tfGUKhDoX8xAOQF5C1jI1M4uwoY838MaYbB3foO7+9zmyebU08RjkeVfPxwRyqjxRf
         7Pe9CPbIbl3C2Y1d3s93vkct5Y3yLfk+IzyhWwwFlJ18FPLQzgMFklygTGLHniAoWSYs
         bcCG2Ga0pDlxvMaSaQjpbHT8abst9ik9/41bLYZH2Y8LDamZlcZD11Y0ojBa6pEJYBRa
         Ft9g==
X-Gm-Message-State: ACgBeo1ToDFCT5uWvRM6RANqmf3cVbjeKSvvR9qcKkRdKkKOwSFvJZjc
	uLy4+Zpp2dxkdZh/UdWsIBnYug==
X-Google-Smtp-Source: AA6agR5DU5oL31YGMFMqSJ9QosyAIgz1wKmRamOx/HzSICAxr/vstQ62IK8je47MYg2BbSWSiqFh2A==
X-Received: by 2002:a7b:cb88:0:b0:3a5:ea1c:c541 with SMTP id m8-20020a7bcb88000000b003a5ea1cc541mr3165264wmi.114.1660766756496;
        Wed, 17 Aug 2022 13:05:56 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id i133-20020a1c3b8b000000b003a531c7aa66sm3400883wma.1.2022.08.17.13.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 13:05:55 -0700 (PDT)
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
	qemu-riscv@nongnu.org
Subject: [NOT-A-PATCH 4/4] dt-bindings: riscv: isa string bonus content
Date: Wed, 17 Aug 2022 21:05:23 +0100
Message-Id: <20220817200531.988850-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817200531.988850-1-mail@conchuod.ie>
References: <20220817200531.988850-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_130557_817694_A9DE8D74 
X-CRM114-Status: GOOD (  11.18  )
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

**NOT FOR CONSIDERATION**

I figured, sure why not add the strings for version number validation,
just in case we need them in the future. The commented out string is
considered by dt-schema to be "not a regex", but regex101 thinks it
is... Maybe dt-schema does not support named match groups, but they
are the only way that I could trivially find to make this somewhat
manageable. Either way, it is permissive so it allows combinations
of "M", "MpM" & no number.

Not-signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index c0e0bc5dce04..38a824453012 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -80,7 +80,11 @@ properties:
       insensitive, letters in the riscv,isa string must be all
       lowercase to simplify parsing.
     $ref: "/schemas/types.yaml#/definitions/string"
-    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:(?:_[zsh][imafdqcbvksh]|_x)(?:[a-z])+)*$
+    oneOf:
+      - pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:(?:_[zsh][imafdqcbvksh]|_x)(?:[a-z])+)*$
+      - pattern: ^rv(?:64|32)(?:i\d+)(?:m\d+)(?:a\d+)(?:f\d+)?(?:d\d+)?(?:q\d+)?(?:c\d+)?(?:b\d+)?(?:v\d+)?(?:k\d+)?(?:h\d+)?(?:(?:_[zsh][imafdqcbvksh]|_x)(?:[a-z])+\d+)*$
+      - pattern: ^rv(?:64|32)(?:i\d+p\d+)(?:m\d+p\d+)(?:a\d+p\d+)(?:f\d+p\d+)?(?:d\d+p\d+)?(?:q\d+p\d+)?(?:c\d+p\d+)?(?:b\d+p\d+)?(?:v\d+p\d+)?(?:k\d+p\d+)?(?:h\d+p\d+)?(?:(?:_[zsh][imafdqcbvksh]|_x)(?:[a-z])+(?:\d+p\d+))*$
+#      - pattern: ^rv(?:64|32)(?:i(?<num>(?:\d+|\d+p\d+)?)?)(?:m(?:\k<num>)?)(?:a(?:\k<num>)?)(?:f(?:\k<num>)?)?(?:d(?:\k<num>)?)?(?:q(?:\k<num>)?)?(?:c(?:\k<num>)?)?(?:b(?:\k<num>)?)?(?:v(?:\k<num>)?)?(?:k(?:\k<num>)?)?(?:h(?:\k<num>)?)?(?:(?:_[zsh][imafdqcbvksh]|_x)(?:[a-z])*(?:\d+|\d+p\d+)?)+$
 
   # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
   timebase-frequency: false
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
