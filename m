Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2704D277CE
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jan 2026 05:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K6WLAyxaj0qkeSjxlyhozExPIYr19uXwkgr/+M5dkes=; b=OVZYwQMSf+qAHt
	TUwdhPdHjV1VC9u1WWg5sL2vBOVdPerQerhK2wPnmW3INvMiR920zm7Ac63tZPXF/6cm7h+vig09T
	cf6GGoNiWI7fufsPv+olsxFVT8YhMaNg/EgzFMcrchcaSpOeNC6jSzKTvsAAJZlHj58kqMAgUP1v9
	IxwnhlKuFg08FY6efvwyT0aTdiqLc74XrkwbNQZfFAM7v7Sj/raMF3d3SR/+dlcaRagaKT6Syh/lf
	dMZ2IjW2TM+x24HAuJSEg5K9NisiY86YL4BB7IcaDkZ0BtF3x70MWk2k1KWd1YhV4Kg/uZfGzMzU4
	rHSd92hwq4ge9eoi8kig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veRNf-00000003Fru-2sOk;
	Sat, 10 Jan 2026 05:19:19 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veRNd-00000003FrZ-1fQC
	for linux-riscv@lists.infradead.org;
	Sat, 10 Jan 2026 05:19:18 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a0d52768ccso34088455ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 21:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768022356; x=1768627156; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DEt3VwPXqyMp/tcJZWmY7ZYQbqO9BpVvWujfwQFiGY8=;
        b=ojGf6ruGzOGwWaKO0Sz20JuTDFgredmyY6xVYDuEHoMkeddbN5O/JuRqKtNksEL6HW
         4r57h2KW762CIxNSNLNeFvA7hqd2aP0P8kt4r+T/FwFLjdCVZ44N8Pw6mSwRqCYE8Nsm
         mNBI/KNTJLYCPC6K7rPEZZ55JlHWiNzWcgDXD71ZeDVMWSLoo/CygCiLW6y89gnCqm+E
         TlGbADdhZkItIf1RLoAwj7Ovjx5tbQitoA/lKS4fRuVhhviCW6+566UJ0eAtfHhpPXM/
         x8c6DdjOKPevmoZEu7fe9sxj5kWXaNX0T6M1k685oJnjso616cElpJwDlesyHeG+NIBI
         rL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768022356; x=1768627156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DEt3VwPXqyMp/tcJZWmY7ZYQbqO9BpVvWujfwQFiGY8=;
        b=bMa9euXWmYRCKXPYuFb9JjarthMqtgNolS//zZg0URGF/IESQ7EFXem5n1AgZ+z1PI
         s8EPeYJsLLSSUlsv2ktWecRYkESOqqjpdxrFUxqIEzzZ8WpTwkl3s6wUT0qOWyIvd0R8
         5LKp3prNIL3+0U+0s/Ao5kXoBomTuARc1u0YtD4uEbN4AKH98iHCjIpqaBnIdrK9ZKtE
         snE/36/vkx7AJuWM8hU8m/le9MNb5BxWcD1LYZmVdyGi2LMl3NXyKAtfNbnXeVrZKJhu
         v646DP0UlAnpgzeWZ88PzkFlPGgSq8ER6llBnHtEpBnsZ4TIpg/eh8OJQr/bXvxQWQ6F
         CF4w==
X-Forwarded-Encrypted: i=1; AJvYcCWp2CqChHmfng2rKpdkO0vxnBf8ySvoL1gqTq1a8wKJ4CidSaEgoADrLjKMep94mCAhVPNXZxMHuc/7yA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJCJ5nRO8DPNRYQfdyvNQYOPHIUo9UciPiU8CnsQFm8o9vFweB
	d8Ow2lp/U4Vdzs+iRsYMVGlFUedNopaf290xknvAdI8TqHHO/xbErqAAelLfRh9gBgc=
X-Gm-Gg: AY/fxX7KDEWqzrKWH3D940efuy7eHXHKnLu7Beau0Nl6MZE+DyVS5D8znRRMZY+4yGv
	Y5gUxZBAVG+jbSSZy3DkHlwno/MBddAfTPWHxUzK4ogEQtYXxqearUnfB4iEjEnUva2MuuVITli
	JZEL10LKMCvubDhoiHNF+7RyUIOlFGMyDZdgvgQEVaDl+SQ7cocrWgSEP98BpzP6DXLVA3UsC8B
	l5jOpwVrVYFA2nAv7d+qysuONTz67GhU4cCM3eyEkGkpw7INPSdakzod/j5lcIsm9yCaIqmDPIk
	Nv7disw4aU4M91BAZAQNjiU++hX+CrbkeXSY0SMK4yyz5Urhj4nFNoHPXnGsUkdHcxMqYM3W+0o
	pQbhcF4cxfsdD5lnfsOHM2c31NUC2E/v1WTzXznAWE/b8CWtPUlpe/qJFHTF9myizHXE70An2BB
	BO7kZrPdrn60N+Usx7vAhOvqChtYRj+A0+r8XQ3nnwahuMSDRGAfmK2Q==
X-Google-Smtp-Source: AGHT+IFAUkJBe5NUVBgMgG0885O2cnfFnOaJYFiVEjS7bJDb2MRQEGYB6WLZDNiAx0QS3ppLLiX9Hg==
X-Received: by 2002:a17:902:e943:b0:2a1:243:94a5 with SMTP id d9443c01a7336-2a3ee4fec29mr116348805ad.47.1768022356567;
        Fri, 09 Jan 2026 21:19:16 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88cdsm118208265ad.73.2026.01.09.21.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 21:19:16 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 10 Jan 2026 13:18:14 +0800
Subject: [PATCH v4 02/11] dt-bindings: timer: add SpacemiT K3 CLINT
MIME-Version: 1.0
Message-Id: <20260110-k3-basic-dt-v4-2-d492f3a30ffa@riscstar.com>
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
In-Reply-To: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
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
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_211917_467237_89109C17 
X-CRM114-Status: UNSURE (   7.82  )
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
