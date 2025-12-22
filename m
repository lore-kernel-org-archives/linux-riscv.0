Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1225BE674AB
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 13:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IX03hKw5gJFtJLX/bKBurY6Me4JtnyfKUMCg0gEbLA4=; b=IaqDapwKOr6oYg
	BeyBH+DAS5RyjNnb/NAFQAXCsG/F9EbM/owU9jFfignWq9w02zNBLbkO0Ff84c/ynFxTZxP61Qs/u
	TRr4QrjeeNwOUMvVPLG1h09ZNKDnODhw2OZTXt3KSWu69QD7BGZfbQAlXjUiDRFGGNU7J26nevq1p
	d38vFYIM1K9kBEP9tMUqjkiHczkSuxoV/BcxC2+6tfE5L4mfyBQkHSUONSbTGASpqGo1dMkuLvRE7
	4vlpFBluZPIt+sOaAe002KbswqhU8AcIVmSocYF6I3S7Oo35tHCQ823tYmobFET5ihEA8b4qsVfO1
	h+vqAYtu28JUlQaSiSTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfdN-0000000DmOQ-0lq2;
	Mon, 22 Dec 2025 13:07:33 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfdJ-0000000DmMG-3Uhk
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 13:07:30 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-34c84dc332cso3332366a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Dec 2025 05:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766408849; x=1767013649; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0hBCIJJ8EmxKyYJQRfDJ40fTqpg3Aav6dbr97Zk4ps=;
        b=smudM90r6s4tf/VveNEGw/iA/WXNLuOX/8h+Jcmow1HeldqNSVJQSSU9vka03wwPMC
         1QlWW1oJO+saYR6jmSDOKagIGA5vhNlcoBn0fpDp9Aqcsy6CMVXBw1vC6u4YiKHKKZuY
         snWq2eIbx1PWVvsHAewXlgMjR754nEdvgjGvH9JJnVGwyQ52qq0JtXoDMUZYpA5uFwLL
         EjzhSenB3N0A2JLp/Y6NnfOE4zCFrMdWwhI3UcBiJk+2qh7ySwERkM/jLVbYl2+iv8dA
         7UicJxu27Qs9cRlKUUMzOqLlhE4OBewLa5tFGmE/Zrt7zOU7fqtpz8KUJxn1XTml6OV5
         48Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408849; x=1767013649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M0hBCIJJ8EmxKyYJQRfDJ40fTqpg3Aav6dbr97Zk4ps=;
        b=XbbcxQ5MYkYW2NnofmdbP4E2gqSXDwi9K+KOx38qOawZ4OkA6PRXJVw397SpM3uJUc
         rSXmZQQLb60ji86VZLaxsY8x/V3/qxdxBNBsDDA7UAK4zr6Ftdq1DDjlWaiYpT+K4+Xc
         GTw8dg+INsDREjq5GeCRlxxUFdRPU78MNZ9ZGgy03gVkd3CijC2FmWz82NbRwxadBPov
         SbR1kbC/xMdbcvk5Tdb3DceOM3T4F5xL5zhWtQ7JuALSyGj0s6ArUaO5lpcYyNs4495H
         M81yJ5bXelx0ovn9fsP/x/afmQuteo7Fi7+A6/mjVOogBM200WSS4dS//V1SmHmOzeRN
         0iJw==
X-Forwarded-Encrypted: i=1; AJvYcCUTsMVszqWE63Z6HLBSgNxSbws1HQocPBOj4W3tly2OGD7fptK0btNFITPgVZV2bZoO3RW0i/Yj/7oz5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3wd80elPfme7MEvjsMcUApH9d+40XfNNebCBfgb15jlJkjMNS
	SLa9e32lp8bSmmULtQmY46msEn59u5UPzFuUNH4FabaIUnSwan3M8l0/vj+ziy67mIE=
X-Gm-Gg: AY/fxX43hqGRxzej7eWQFKmSDMTyHnGinv0mnssFoBK4qJEoYlFw1IJydPOLmnHNIpK
	PeLVNrCfAWTu72rMJVhJmd30Kz8G/uSrfwrx7JvcnF+8K8h3ciR7dxiLHq5w20BC6L+dg3fBgPU
	L1xxkIdd+8+BiPCnZlIk2+aBOqwGyek0zDfAB5EG6nleaCiGA+Nklk7wB709wmBWqZC1rILra7T
	ByBrEtMLCFQnqX5hrkqZ7Rlx8AUQkTlt51ZMAIHoV0mpnB/kJI3ugC8+CCZW29/qowJWzwrPZQ3
	Z9oCKKmpsL6G1kw5ubcsJ25JTg+K46cPW57xHXxOYato4wYnlAnPyA9tMYguEYZSESiCsqmatUj
	6+LVH8Dq1gugoatZ/Ihm00uypzk3O5YFUKxQdbGFmCcqLsg8t3MrolBcpmAsaevDdLPriwbgf6k
	7FOShKE4pcbSOTz+dlI5Mr0/66BeC6y1s=
X-Google-Smtp-Source: AGHT+IH/ef6qJxgLISPyQdVV9ykkGamL2Gr7XNJ9wshLQVPd+I8d+rSgyrotTljXgKb8jsc3m2BCnA==
X-Received: by 2002:a17:90b:3f90:b0:340:c261:f9f3 with SMTP id 98e67ed59e1d1-34e92130102mr9913256a91.14.1766408848875;
        Mon, 22 Dec 2025 05:07:28 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::402f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70c932casm12970405a91.0.2025.12.22.05.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:07:28 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 22 Dec 2025 21:04:16 +0800
Subject: [PATCH v2 06/13] dt-bindings: riscv: spacemit: add K3 and Pico-ITX
 board bindings
MIME-Version: 1.0
Message-Id: <20251222-k3-basic-dt-v2-6-3af3f3cd0f8a@riscstar.com>
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
In-Reply-To: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
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
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_050729_893620_D9B14CEE 
X-CRM114-Status: UNSURE (   8.50  )
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
v2: Use one-blank-space between name and email address.
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 9c49482002f768cd0cc59be6db02659a43fa31ce..fe62971c9d1f4a7470eabc0e84e8a747f84baf0d 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -9,6 +9,7 @@ title: SpacemiT SoC-based boards
 maintainers:
   - Yangyu Chen <cyy@cyyself.name>
   - Yixun Lan <dlan@gentoo.org>
+  - Guodong Xu <guodong@riscstar.com>
 
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
