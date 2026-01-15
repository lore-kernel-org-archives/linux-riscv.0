Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328D8D3CCB2
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 06:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E4xk4NcQptV0mUVBTiZAS1uCXiK4/+e27qtCT2J4Rdo=; b=dgxtyMWPyN4JQO
	Pcxf2S8R9DWdPd5Fk1CWAKkQ5FpeKlV6xp+oBJiwvh+Qr9DemLpcWAjkfiGCobbE2/ISEAPtu6dU7
	ARACs9HCVu9WwcX6nfJ2nytQd00INo7pnVNM7U7JBYSFobJLxsWlkBiSMeUhBgObX2/U6h0YD/Ur6
	/x827mxZmM7SbMm6hMxGhNj30i3Zm8bPjeRJOX3MwcNpQG1pYZCOVZP4uUyPEb1r9gg4Wsw4xRjY3
	T8avvXSnS+7mExJsZJcp8h7c62vKZZOL3g5M9w2tiVw1s726VRFXo7U5lWWzm2Rw4HWmMXGnBhKSb
	YOyJbR9vgWwsGYXOzKuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHE1-0000000BtCS-0xcV;
	Thu, 15 Jan 2026 06:52:57 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHDy-0000000BtBJ-2ODU
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 06:52:56 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-2a09757004cso4524565ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 22:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768459973; x=1769064773; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSxOkq26KY5aFi9jIDHJotlQaCGxwZHXeVQL20enYRs=;
        b=ZXTyw5rgl0Aqy4aYjJAqtkWWkc59d7aL78gET1cG+9EMQ3Do4PbhAv8vFoZoxi4rw4
         5NUTWlBAbzBIGwC5My5Hk15vTpNHabjySiFiTuItVXjF1gDL2G7+UDM0jNeHkntWXomZ
         d9V9BRQib3m0AqP40kHv+1E+ZtKaMXdhh0HzkNULd3paBgcGZyt4e1JCTUSka3S4YP0k
         ne/Kf6g57mdBRl6tugaBGF2nNqYM9OY6jIXbx0g1pS4WOdHKvXiSEBIInan/g0Ch8m1w
         Y/KNYMH4Ofi7aKa7TkcRO7o2wx7428AxyP0Uw+6cbGkm7jG1L5AoSH4pOWw98ICG0d2L
         tKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459973; x=1769064773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uSxOkq26KY5aFi9jIDHJotlQaCGxwZHXeVQL20enYRs=;
        b=j7dRgb/Tb3nte80aBUIMj8FUf6lU8zJ+2AwIJSn7mXr7DgSjNuv8MLHrpuLCLFo3nz
         yFBhmjDSlWMo7h7ninPZEWzaPWQAcCUjGjxBI4HgJNFsE/Gmj7tVXHgiQRqxm/DZL8no
         MOfKFWaYtuFu/axREIZxlsZpKzHXkObZgScILKURtxu4USdX80isLztiVILWifCUp+Lp
         hag57BIZCItBjNq7SzcYWYnNSSX31o7ehSr2t9TnonvT1SqB6EbqgAux10NIDW/CINGN
         JPoBfFXOUAAkxezVTSZ8ZmPc2S5NbXsTKlPneoqhL16H56ocp1KzND3U3fXjf75uJp8i
         c0yg==
X-Forwarded-Encrypted: i=1; AJvYcCX/5v8uOsThX94c86VoGUxzNwRRUH3vlZc2TkwdDLnInBlb2UzhpXXDrFFXqRXM2OEv7hiCAUkDvpIMKg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9lfN5CsJrOjRyu6ixSo85RQhJfsaqal8Vj6kJszVhq1MqrViw
	ws0RtzYSDl9yv8kDv2B3MjvX8NB2ga1bHdn5V/SuRn1pslwa0ewHVh1ZbFiRjFICero=
X-Gm-Gg: AY/fxX58dSTO5Bh2BwAlprs6KPBjAWvxs4aBrYkFs6lscYGijF4XkHyhK3HuP9nzbds
	azNuyCUYktU0zoTAdXEfljyOt0wQ/ZNncMac9m89G1MLTW2NPmfbwFDzHvGoyWvV0sb48ht9jH7
	hxXBWp2oIFpfbi5JoQSdeDyhIpatvv1wr8EY6QaE//uGAvBxY1EwVLtC9iQ+Ke8Tw6OZ0UZf2at
	SF6vZouLMrvDx33QLRtyzgBOVyMs2kxZaNAp0eP/nLkH05+48zv6UWYeE9M/YeJTOjpThmUtFjA
	3gpYBwbQ/bkCt0foyZ1teCA2SIjUy++Tt3lP90UZv3b1UtHt4FbmcUgUC91X2bzTV1QKioPXx1q
	qBWnS1RGEQkN33TOKqEiUUuhi8Tc8Vn1rzkyykJm3C7mTrK6UOxHrNK8HpcAycA9xJeltl/Mow2
	j8WJiIywFDL4lQCLRb+JRBEvQkKN7Qn1MDhIV1Tb03IaYKQlzgYTrGAg==
X-Received: by 2002:a17:902:f788:b0:2a0:e94f:f4e3 with SMTP id d9443c01a7336-2a59bb726afmr48755255ad.23.1768459973590;
        Wed, 14 Jan 2026 22:52:53 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e7a3c6fdsm235081015ad.15.2026.01.14.22.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:52:53 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 15 Jan 2026 14:51:44 +0800
Subject: [PATCH v5 5/7] dt-bindings: riscv: spacemit: add K3 and Pico-ITX
 board bindings
MIME-Version: 1.0
Message-Id: <20260115-k3-basic-dt-v5-5-6990ac9f4308@riscstar.com>
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
X-CRM114-CacheID: sfid-20260114_225254_611874_DBF4F408 
X-CRM114-Status: UNSURE (   8.67  )
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v5: Add Reviewed-by from Yixun.
    Add Acked-by from Conor.
v4: Adjust maintainers list in alphabetic order.
    Declare spacemit,k3-pico-itx as an enum, which can save future
     code change when adding new boards.
v3: No change.
v2: Use one-blank-space between name and email address.
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 9c49482002f7..b958b94a924d 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -7,6 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: SpacemiT SoC-based boards
 
 maintainers:
+  - Guodong Xu <guodong@riscstar.com>
   - Yangyu Chen <cyy@cyyself.name>
   - Yixun Lan <dlan@gentoo.org>
 
@@ -26,6 +27,10 @@ properties:
               - xunlong,orangepi-r2s
               - xunlong,orangepi-rv2
           - const: spacemit,k1
+      - items:
+          - enum:
+              - spacemit,k3-pico-itx
+          - const: spacemit,k3
 
 additionalProperties: true
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
