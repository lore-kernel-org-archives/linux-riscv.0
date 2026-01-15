Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97314D3CCB2
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 06:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l97Tsv59Mpq9o2cwSPpg3e71NW+EopkFWkZ9J67jIiY=; b=d3OUu1xNr4xMqg
	90sZn9epNy44oX7Sn0nMXmJkNGBHwNKLj2dOnu4aHRxS88GqaIahOkwk000XinT05UTpRodUSD7Ph
	AWu17bWRFNE7wJ5pWpInvNjZzvlGUm8jzxIzTa3nPuV/2O4nhV365QTfLuRLCRhXK+/Ef46jtwgFy
	CJDeZPImZ3VGV/krmXlxEWNQr6fqlCleWn92YwoMYNWWCYsNMqYgHNjhMDUIsHHaunXRr0jJHXFDg
	BiZ/NOLAghB5LkZVD4g5vYUfCOa9ey+wHmWX3DKEaRxPFjA4SgYb9MVRhxiy3CzMfpSV2QMma8mVA
	2BgSI5brHWiGnFZnEhYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHDV-0000000Bt1A-0wRT;
	Thu, 15 Jan 2026 06:52:25 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHDS-0000000Bszn-1Yy3
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 06:52:23 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a0c20ee83dso4713095ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 22:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768459941; x=1769064741; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xYYXZRYIOku7Vb4B3mqsPICr98BDRNcpwBcyivdVSks=;
        b=IuWk2MuZCVVJwTQC38cf1vLDs/hfpa1wzKLpYowfzrnBOfZiEkzZo4gHcT3Ex0P0hv
         L7I7dkfZtmqNn9Aq5uYyHtE6he5FD+Ls/lnskMQsDOoyXLr1Y1WGF5Yf5pZPr6l1hmNb
         P4sR455ZvUN0BgZYJ7MigclUrqlh2Z26LoQH6ERtoe+pPFA+2Y3VcHVS2g0hf0sjRueE
         /71MrQCgFVcMCaXIUIUBLwjCnFNS1dUl7WCMSqiBFQNDxjYWnbd1iAbzCtv6zty2+k2m
         AgUPX5dg4Ck+qFtq1fy8xsdMA4VO9GVkVsrtmpMeduhBU7u0Fln4NzOBOfgWFrNBCMh8
         JvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459941; x=1769064741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xYYXZRYIOku7Vb4B3mqsPICr98BDRNcpwBcyivdVSks=;
        b=qkXKHiThiB7+BAjQvZZiV/cJUZmkFCRVhyY+EY27hHzijUsjswGP+PPzsV8QX9t0Do
         eojoCSZ4z2vRt4o2VBLbQ2OL7vHVG1mWUx98O+GYpJhWGxSFL9YC2lNgfcj0LZaP9eMA
         ILZRkZAg9c68bEfQoJtAHgYmBvetwOe1LOZBi9qeuigmsdUCdFXNtIcp8Os8lKycDirE
         4cQqoOPYHIDRE2fJ+Ywj0u+snT7XmMwDdCJut6d583j4+NVWFX0m4T3gIRt2KfMLCXLd
         Dd73BgtUNZ9hAJzYZh2wJFj5len6SajWIteKTtrvEuz1v1nJTj4nZTdKY4tb7I+pSBx7
         mszg==
X-Forwarded-Encrypted: i=1; AJvYcCUaPX1a87ArOoLRq2KidiHIUbV7PM0XwG2GecwTvYpTEYYnp2PLw7c0G0I9hcQKs5rG3rw2pzONOLlj8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ/iBRtULiz9hrZb0M2zVgcrgIbJbuSgNDzC3Hn/jDGe8xq5d5
	j2AQr5tDEsRalT5YSSaWuYgQfnGN1gcng0nnpftPliK1V2aE9QFXHUicNoZeHFHAL0I=
X-Gm-Gg: AY/fxX65q875s24jIZMtb0bX81pWo5U9C4gKlgUbl3QNvilMMoGSNtwUbE8oAYs6eX2
	Uyk0r0OWpqzDyXLvBKInHnM8qHSJk3QafjLWHQPbZEktNwSFirhjeNR8BlRrjbHT5AsUqSiNwjn
	aak6bsyw2yW9ta4xyWFJqlmvYsjGNbLPs5b671yd+ZIFQcDhGC9spQBMwhhW7R6E8A/gNcuJUbh
	K3YN3ybhQY1KURMH8XtOrfyJZkDzdPQZMFscmEc6Pbro76kEKAvlO92B2yWLw9SNL2m5Aw7CbXE
	xpUyGF/9SfDFAYfGYwB0D/bgEKVdLa6TWV9zLvoTa4gsAkJMm1xtMYIyveGVNcFqsYOXEk+QLZ2
	/zyswQRq2MlqE01h3WHI8AuTkbM1CrlwntTQARY8v50iRUxHmjBJCLW9sWrkDycMj2o+Jn38U5k
	egGgmpq5r9K3ri8yH3K4TiIUNmisB23Eoxea/akqduHoNDmM0pjLtaNw==
X-Received: by 2002:a17:902:e551:b0:29f:29ae:8733 with SMTP id d9443c01a7336-2a59bc6819fmr46124625ad.53.1768459941521;
        Wed, 14 Jan 2026 22:52:21 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e7a3c6fdsm235081015ad.15.2026.01.14.22.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:52:21 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 15 Jan 2026 14:51:41 +0800
Subject: [PATCH v5 2/7] dt-bindings: timer: add SpacemiT K3 CLINT
MIME-Version: 1.0
Message-Id: <20260115-k3-basic-dt-v5-2-6990ac9f4308@riscstar.com>
References: <20260115-k3-basic-dt-v5-0-6990ac9f4308@riscstar.com>
In-Reply-To: <20260115-k3-basic-dt-v5-0-6990ac9f4308@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>, Thomas Gleixner <tglx@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_225222_417920_B1598663 
X-CRM114-Status: UNSURE (   7.13  )
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

Add compatible string for SpacemiT K3 CLINT.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v5: No change.
v4: No change.
v3: No change.
v2: Add Conor's Acked-by.
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 0d3b8dc362ba..3bab40500df9 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -33,6 +33,7 @@ properties:
               - eswin,eic7700-clint     # ESWIN EIC7700
               - sifive,fu540-c000-clint # SiFive FU540
               - spacemit,k1-clint       # SpacemiT K1
+              - spacemit,k3-clint       # SpacemiT K3
               - starfive,jh7100-clint   # StarFive JH7100
               - starfive,jh7110-clint   # StarFive JH7110
               - starfive,jh8100-clint   # StarFive JH8100

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
