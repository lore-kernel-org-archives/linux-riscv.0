Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6473D5E154
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 13:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WMRkAE8kK8W7ognsBCBPVUcPRMVaMZkwYJEGR9uzyd4=; b=bk6PJqgyCZShc9
	NaCbAPqJ1CDiAT9+GVY8H/zSEy+JYHMZHqNVvFoHiSvkN5+fmzyaMMdwAEBBmUbnDQTA2uo/DTaxE
	Uo2HnFJUjywE1LZuTCEC+qGdPMWDEqCpkWPeEPw2GMLlNs7G19vnv3mEW0vY26eqzklHeWaXhWWem
	/MVTHIZhtv6Lp1QtGe1/cw96N0xxZ5FrdVZMqFr05xwafg2Z59cyIpHpnQTwe/HQM3+nkXWzEdk71
	rk4wuiONGXnOGL34Tib50HLDBSnh+pdZKPpDRTKeCWvlQLadGeQkdau447bHHu68GWrFuprC9HW52
	ZXvVqJAwUOfizK80zOgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVBo-00000005GtS-09Gs;
	Tue, 16 Dec 2025 13:34:08 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVBl-00000005Grs-2hOl
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 13:34:06 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2a102494058so10367485ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 05:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765892045; x=1766496845; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t7y/C6MB7UDZ9brxunSfG6djbfKn9Ck4w/Hk2KhvHZ4=;
        b=SsCrswGQhmSwCdsivcy9OVov7aY60a2RQk5mEK+GfMM1tRE+JZJKAkCbKFiXFj5r//
         YciukQwl3NM7+GXv6ee3q9izOlQ05vwL05OUz/wv7E9GYS6xVMkgVL7XqSOtKnkECZtg
         Rjwst4dDUq9WwTi5zIjjARmmgKCFe/emWGLSn450SQfF24Yuy7M5IuG8w2iGSDI8Yt8o
         ZS4GXiwLuaRPhCu5RL3zXVXdJDCEkIaCXDV75JSfKKMsATZeznWCr0U3bu0tWvyFC+Av
         kh5M66xpWq6thPnsH5VGHJM/xnL7/j/rYLjcsFK/SlwFlBL68zbrUjz0ZFfxItfqZ+k6
         Fr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765892045; x=1766496845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t7y/C6MB7UDZ9brxunSfG6djbfKn9Ck4w/Hk2KhvHZ4=;
        b=jdGR1XO6cC4yWf9ZoMLe5BvqRvIH25goQY4q1m3X3c0D4NINmzwesGCQAI6nDoSw9L
         38BIorh2AngyZ5LUJMQBQO4lWlAV8pKFkRK54aWwsOW6IzTpNoYMkmAE0QG5qPlKLYFr
         YqA8IXsULJHg2SoXONR/0EZqHrAkjXwFVnUDv1qnLUSzGUWoPMeunACL89mcs86ML5rA
         yWX0UVJrZr0ehZr6FMUL5zzF13nttfJwMWDQecmDnk71nxktsYgQJ/DDduP63U5vwESZ
         B103BbP8bBI4gTO16v80Sw7IolZgbiq+lCRv5lcFN7CMrXMigeKn4Go4aLEBg5nwCeRb
         ynDA==
X-Forwarded-Encrypted: i=1; AJvYcCVfzqaVssF4XruyrhbpdM9MqnSpPJ2DyRSqi1JJ6YZHl6BtrzU7PTSs9dnCPA9fzGSospiNnVBpIVnvFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfAyu2pPFi7pFOOemJovkLfgd/9T3uh7/ZDac2Dqxsw795ddxK
	Bgq9kAwSumr7EzfGzMzuNDoKaso7bD2okjpyzb8zHiIj2LRPvCnsBzwAd3M5ZFZ2V5c=
X-Gm-Gg: AY/fxX7Td/U2F5BMCKosUt5RQ8QSq2z8QFDBu6NW7hx2kgoTAgLaY6J3lasTHLC5dh3
	eUR5J5YwIOhvU9rmyei+bD731nrGban73F+89d6sQW6wtUU7GcaWF4aPLyHHmcRCm/KlGpMfMht
	DvZ/EayIYRDCWE66YCcrReEBpYBYhJqOlJweIwX6xTg9RJrAHarr1tsLIg7icB1XaPF92BUItAl
	4qksSKJHdPIYLxFFXQEib3VIxBvfhXv/nrUf3Ilc+WOfe7W3J2QAuvzVCVLiYktE9uaI1tW+JRc
	y7Qyp05J2TDO1Nv70ku6x5O1WdJHx/NsHG+ugaYFCPnqRy8OOKjsCgHsw7muM45zQkTXBfte7RZ
	9DJY1eyL4ELwkeS57rlc4S22wbYD0oWW6/ptR4qvVITM6R6jkaczOvZp7sRCD33wQo0ttKluV+l
	hrOHIa9JDeG7iNE8X+79X347K3D4pn7QU=
X-Google-Smtp-Source: AGHT+IGlJuIYFFX4Kf4ETwvpERoBwiGUxzh2gcBhl1n1hPyzmW7Qi4XuHbuLS3V/KKQPD4rNe3NC7g==
X-Received: by 2002:a17:903:1a0e:b0:2a0:c92e:a378 with SMTP id d9443c01a7336-2a0c92ea624mr100750335ad.7.1765892044589;
        Tue, 16 Dec 2025 05:34:04 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4029])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a14625add8sm15829525ad.61.2025.12.16.05.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 05:34:00 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 16 Dec 2025 21:32:30 +0800
Subject: [PATCH 6/8] dt-bindings: riscv: spacemit: add K3 and Pico-ITX
 board bindings
MIME-Version: 1.0
Message-Id: <20251216-k3-basic-dt-v1-6-a0d256c9dc92@riscstar.com>
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
In-Reply-To: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_053405_688711_28F614C5 
X-CRM114-Status: UNSURE (   8.82  )
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

Add DT binding documentation for the SpacemiT K3 SoC and the board Pico-ITX
which is a 2.5-inch single-board computer.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 9c49482002f768cd0cc59be6db02659a43fa31ce..003b0bc1539b621e39172a0565dfea1274cbc8b8 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -8,7 +8,8 @@ title: SpacemiT SoC-based boards
 
 maintainers:
   - Yangyu Chen <cyy@cyyself.name>
-  - Yixun Lan <dlan@gentoo.org>
+  - Yixun Lan   <dlan@gentoo.org>
+  - Guodong Xu  <guodong@riscstar.com>
 
 description:
   SpacemiT SoC-based boards
@@ -26,6 +27,9 @@ properties:
               - xunlong,orangepi-r2s
               - xunlong,orangepi-rv2
           - const: spacemit,k1
+      - items:
+          - const: spacemit,k3-pico-itx
+          - const: spacemit,k3
 
 additionalProperties: true
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
