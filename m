Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1359BC433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  1 May 2022 19:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cx6jlgu/riFU8NMWAF0cc+UFWfiCHC4Xv2lH2w8oNRE=; b=l5EdbT170FGU+4
	9h8mw7juL3ddt6oRW7frNhoMwjU4KXuwdOwZgB6bYztxfyj6uE02Yf9rGH3EzxFf8tA/xlqnDt6rw
	zQAd7+lhmKTdfAKn9vX2lpasu+ibws6rgfMMW6ol6VUsJdjFmO/67i3ddQVl9ncuOP+GaGEjtwA8G
	Dn2mtCJk/Qh1UkhoVg4agTw3r43/FkKkI9zRwQOmH/J9+LVxTO94yBpuURqnSi7ykcuxHPZqH3awE
	AP3Jra3JQVHeMdx+6YyceFU7Gq5oTwnNzvZPUpLIK0W3/gdjTlbXQGMnpLZKjnd2ovZ3JaTVCP3+/
	b5zvvKHpJe5+0hdDTP8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlFDK-00GnHp-Nf; Sun, 01 May 2022 19:26:38 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlFDH-00GnFh-9N
 for linux-riscv@lists.infradead.org; Sun, 01 May 2022 19:26:36 +0000
Received: by mail-wr1-x42d.google.com with SMTP id t6so17243519wra.4
 for <linux-riscv@lists.infradead.org>; Sun, 01 May 2022 12:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZhDxaWvr3i8Lutw3+7ISFPD0fuiq5HlmpgA4Bsv2nIg=;
 b=LwZpQHZ3QIq89HCYQ4sEtAc5hcU8wJ6xmW2v4ckhOIpRYRvev27G+gGGlz1PoOGqrE
 w3lUDWlSsyFeKV/l4bM0YARPVI/lOOA3cSBmYskpJ2uUdZxRfuDlWpil3cIPO7ie6Ay6
 8/dH7v5XzN5D0zjrP9EQSw+OXEE95nh5ti02MXCDN/ys3NN+FRLGk031KtL2JJdhqOD/
 C1f90VdKn44ja99FZdb4oyMM8GVYsqiAJMUQ6ffjh/omVxhfjyVi5v+j+AXyUBbvPnEW
 lKMsEvGGP51Ow0wXiNDArjLLSbaOLXEKLl9dQJrXGXO7FBYJQAgSBsS4CLhm3Al4MFmr
 RWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZhDxaWvr3i8Lutw3+7ISFPD0fuiq5HlmpgA4Bsv2nIg=;
 b=Ph30fCwB9e5uqXB8i49Z1udFEe517wdw/7kxEu3BukdwxWCqkIWatVp74T3hxUZikd
 dRbBoWXMNtpgSwbLlayxmlSV94yabzh+8n7QWSJ8vYfEusZjuAfEPPMH4ZrTIq8eRgjY
 jd3L/kaKEzKyL71upSTVADNAVC7WK8a6TlUPJGkRWXFfl6G56fDznKPdOu4FoOw3zZ4H
 DiC+7EWxyc5CByVYDK3Z4z5BzuR4voo9aUlPJOBxF3Um0jZLG214Uqq6r3A7HsdRceo3
 NK2VqTLq6DR9ZZQFaWkyEFIdfCN8WCBntethV1kH+3XufuvCEdKt5Af1R72rG/bzF5MN
 ipyg==
X-Gm-Message-State: AOAM532mUn/6Gjm+PFBhyZL+KVjc80XN0NQRTlVB4l5js8YqnvShZyzR
 7JPr5pa8GGYnF/TSsZyS95SVcw==
X-Google-Smtp-Source: ABdhPJwOWSCztk3LGFlqHTWMR2rc1VvecXIzfUi510DTMW3/34FscLyHo5s4MJVmz/0yNf4C/cwAsQ==
X-Received: by 2002:adf:e904:0:b0:20a:d652:592b with SMTP id
 f4-20020adfe904000000b0020ad652592bmr7143640wrm.714.1651433194083; 
 Sun, 01 May 2022 12:26:34 -0700 (PDT)
Received: from henark71.. ([109.77.36.132]) by smtp.gmail.com with ESMTPSA id
 i14-20020adfa50e000000b0020c5253d8c6sm6448105wrb.18.2022.05.01.12.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 12:26:33 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: krzk+dt@kernel.org,
	palmer@dabbelt.com,
	robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v3 4/8] dt-bindings: riscv: microchip: document icicle
 reference design
Date: Sun,  1 May 2022 20:25:55 +0100
Message-Id: <20220501192557.2631936-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220501192557.2631936-1-mail@conchuod.ie>
References: <20220501192557.2631936-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_122635_364531_2A1CA831 
X-CRM114-Status: UNSURE (   8.45  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Add a compatible for the icicle kit's reference design. This represents
the FPGA fabric's contents & is versioned to denote which release of the
reference design it applies to.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/microchip.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
index 3f981e897126..7a1f883a39b5 100644
--- a/Documentation/devicetree/bindings/riscv/microchip.yaml
+++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -20,8 +20,10 @@ properties:
     items:
       - enum:
           - microchip,mpfs-icicle-kit
+          - microchip,mpfs-icicle-reference-rtlv2203
       - const: microchip,mpfs
 
+
 additionalProperties: true
 
 ...
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
