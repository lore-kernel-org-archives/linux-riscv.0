Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D217AC32789
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Aug 2022 18:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gupujcU4W/jQHwcySG/BDGhq/T+cQbwfwts9CryYGjg=; b=vA3uWmpg3KQ1p8
	vdWU89MUugYYS+0jP3qETcpHDMhEbfdhPFlMcqxhEVR6MPUG686zlapSJGGA5BEIaLQud64LI6i7t
	KH9PA8mw5XCCCuIYkklIXlYO05tlLujTZbF3hKNUlHcuMFNU3wPTcdgHasKVUsczCaBCagMrQPdaC
	sFWRQAtMoOUdfhPAzeTKavz0yuT55AoGPj5cLnv9ICT2Ybaw29GgrRTN1lWsHZSyEcqRzOK5UAlJI
	JKsF4RfbS69edzo1VdbbrvG0GR13MDw5NMbjYnjp/z/Uxf+Lwy5OpveQYz15Z8GmChE/aqmSCR8OV
	DXdvK/0Kw65VN53qrWnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQYj1-0084w2-Le; Tue, 23 Aug 2022 18:34:07 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQYiv-0084t5-0Z
	for linux-riscv@lists.infradead.org; Tue, 23 Aug 2022 18:34:02 +0000
Received: by mail-wm1-x32e.google.com with SMTP id m10-20020a05600c3b0a00b003a603fc3f81so8219109wms.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Aug 2022 11:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=trv5fw0bTaRkhXK0X5euU+YZQIdt/hyNEtAW//ypjq4=;
        b=SbIqnUkCy+xr3G4o41X6O/3K6TdfRJnovS+CTSQDtTxCHC12Dr2hCrLWJb14TBsmL7
         lWBETJqBGmVPBNTdzb6i97jcciKXvfliHjaVH2WvuQDtdYipzwkytutPbIAoRIhAlXcN
         BiUQCaIU6+VbOthEftP+Vl5EKnyq3nQH7aRyPJyD0Y8TQ4TQ3IDh9NPwlGGsozrUWCfJ
         9gJrSfEZ9qukTVfG9ziZNXXLqbGpMFLs9oyc3pV7HHO2bLKvpzURDQZwqzvXfExw+900
         uPyd0qqVtAXIkJRBgKgUTRT7eIJaxdLAebLlBN7VwstK5T3aghNRMyNfOP/6qHrT223r
         mFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=trv5fw0bTaRkhXK0X5euU+YZQIdt/hyNEtAW//ypjq4=;
        b=F4CMSp/PcJ5AzmX7nHp0gDVS/K6fO2iDkqNe0ZMpOsmN1eQRUlbfm2Dd8EXfj6ELLl
         q91ALJoq0q3VSH64Jz6TAr7U9AiXrO2uhARu43JOyeBd1oT3JUyq9a6abPeSJApg8Pup
         UoQAYNCtAwIJwslhrsk10p2++/5mAglxi7nqPuv1opfV/MYSskp9rjLU6CDyslcRDM+q
         uppYk2S4+msvh20oF9708cjJSwcsje5p+m4Ev1pIWVzFFEL+/C8hrubiZjdlR2L3wDUM
         GbE7lYBOzFjTm7k/EnhX41LjCwfFZnk2DoMQQAGnyZjJU3t3UUtVhw+vBgv7xjKgML2J
         /fqw==
X-Gm-Message-State: ACgBeo3Qogqomjv0j8trrzJB8cS5yRHNh2Oyvpj29bxtQKI5AuXz17Ni
	4P03HaKzU3fY09kCZ2KaMOMw6A==
X-Google-Smtp-Source: AA6agR5PsHa/f15Jc+wTtB6380Zen3xwCl+1v7C+oWEpfdzbxeubJb/sNC5ucLm5tjbY479QnKQpqg==
X-Received: by 2002:a05:600c:3b92:b0:3a6:5645:5fc7 with SMTP id n18-20020a05600c3b9200b003a656455fc7mr2978623wms.148.1661279638941;
        Tue, 23 Aug 2022 11:33:58 -0700 (PDT)
Received: from henark71.. ([51.37.149.245])
        by smtp.gmail.com with ESMTPSA id p16-20020a05600c1d9000b003a5fcae64d4sm19396556wms.29.2022.08.23.11.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 11:33:58 -0700 (PDT)
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
Subject: [PATCH v4 4/4] dt-bindings: riscv: isa string bonus content
Date: Tue, 23 Aug 2022 19:33:20 +0100
Message-Id: <20220823183319.3314940-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220823183319.3314940-1-mail@conchuod.ie>
References: <20220823183319.3314940-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_113401_073031_68FF97B4 
X-CRM114-Status: GOOD (  11.13  )
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
index 90a7cabf58fe..6c725d067846 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -80,7 +80,11 @@ properties:
       insensitive, letters in the riscv,isa string must be all
       lowercase to simplify parsing.
     $ref: "/schemas/types.yaml#/definitions/string"
-    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:_[hsxz](?:[a-z])+)*$
+    oneOf:
+      - pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:_[hsxz](?:[a-z])+)*$
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
