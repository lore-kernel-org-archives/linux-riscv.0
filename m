Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CF3C25B08
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 20:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=loYg9nL0aVPGHf6NvUaeVVylY/li+33hKP1BLrawMTw=; b=f6ShrvVDlCnNkC
	ckJk35c7CWo6NohlqV7+45lfi30tpmN+k1gC+ise1s/pt2ndN/GkY1/Spj19PzDpm28M/9vBlF/3T
	R1phOX3UGKOSvCa+587Tawluiv1Tc7zTTpnin0ArKIUVJN6yfX3uyccewcRq9Ms+oyyyd+xWnJObz
	hHPZADyBztfjxJm65J7jzf/ETO9+nS+M/JQD7u3eTmVASpExWBlySBzHv8/0K/S6uwMTrxHpkIxFm
	1eZ+gJnnX892tKuGL+Aqo8vjOkX4tXwTrwn8Qhlz9qW/FbJ1xesQMCHfrxdWKN18knsrsje57cD52
	cXkc/MAgYVKWGTOXoFXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPPK-006AQi-U0; Wed, 17 Aug 2022 20:12:54 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPPI-006AMU-Tr
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 20:12:54 +0000
Received: by mail-wm1-x336.google.com with SMTP id c187-20020a1c35c4000000b003a30d88fe8eso1569408wma.2
        for <linux-riscv@lists.infradead.org>; Wed, 17 Aug 2022 13:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=bxRxSRmrcbs0t6BbgHEjmeEJnj5+oLNwKov9kosBFsg=;
        b=bCrCj8WGt3a7+JPz4Wr2qZDF5Ihib0g+F+IXH5UFuOmbFTl/2ohBvo+eaBcG5rFYcE
         JeBp5CrNuRVupkpwchSLqzMMinELgmyHdlG7Gby4T2KNUmmwkmY7XUGYNJiVa/TD597A
         NR9XTujvKalhqDbu1Jp4hY/ljxWSHtxlA0sp2QW4RYb2fYdpSN5uFQ9tbNbEHHxHhJER
         3Dln3DsYHqEvlP6GfiVTVMoP4zR0gzA1F7aJ2ljUx5qSlse+xdciWu7oepRlc27TE07U
         dPla87qdJukDzfaHBgoyR2rEm4dwdJKxYv2vTJJ/0FlbjQwTvqJM+tRh0qStUKldpQZ8
         sALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=bxRxSRmrcbs0t6BbgHEjmeEJnj5+oLNwKov9kosBFsg=;
        b=jJcQXnheia+XtVjUU+LFTkVcRxaSOwHhO7r4b37KiniWO6M17zpIkjE8UKkGayVfv3
         b4NlNo4vIy0h3hMEyWtGcO8kOlkdaNW/aUQlEvlbQsSzYzmRA0P4PQ9DVPDPLl4d4muX
         fujCSFmQVM75XpXVREkzH78VuXivVJD26FVou9ctXxYmJyJ3qNfmGgMnvWqWNCy+9yoe
         35dlXtRWe52MwHnfemEMD67Pcx7JRNDu2MeTT5YmJmhR0T7Aor77uaGN5D8Es20tTxsZ
         wn4PN3vCh3HCfAE9mXs+bQluXWY9CngFmy0vAhYAJ9SuvD96ZPQ6OdYFJ8BjL6VLkGxW
         /Fqw==
X-Gm-Message-State: ACgBeo1GsYazuSMCCdtY9gMLortQ5RhUvAaHYXiPcne4TbXyLCzO3R/Y
	48tIaF2zCz+v/zNeC+W7vv/8Ag==
X-Google-Smtp-Source: AA6agR74aNlPfmPJlKcC05Y6jx7zXOmB8kg1e0yHZoCDAb3lYxnfuQYXfqqonf1zKIGzDxzQd1NAnQ==
X-Received: by 2002:a7b:c402:0:b0:3a5:3c7:9741 with SMTP id k2-20020a7bc402000000b003a503c79741mr3131497wmi.72.1660767168134;
        Wed, 17 Aug 2022 13:12:48 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id i15-20020a05600c354f00b003a5dfd7e9eesm3029371wmq.44.2022.08.17.13.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 13:12:47 -0700 (PDT)
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
Subject: [NOT FOR INCLUSION v3 4/4] dt-bindings: riscv: isa string bonus content
Date: Wed, 17 Aug 2022 21:12:13 +0100
Message-Id: <20220817201212.990712-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817201212.990712-1-mail@conchuod.ie>
References: <20220817201212.990712-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_131253_006756_E9FF7EEC 
X-CRM114-Status: GOOD (  10.40  )
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

**NOT FOR INCLUSION**

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
