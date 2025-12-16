Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30CBD5E154
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 13:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2cBey+a2D6PrPMiQIlNJ+khIWXcwJ5wMnU0A+i7XO4=; b=x3T35yz6JgHRvt
	fakvyAiY9FZkugjAcnc66Q5sxYckijNNtyKyqyLFHs8+PEaAikNElCRTvJtPVVQfyGOMvAY2N42B+
	jhDrihFM/kP0PkgE05k7eN3dX0FBVqWBP9TOi5TkGVkmZNPVqTumXziZS2C3uqHUM2RHmVM4LVExW
	NQmIgwBo3dFNu63WB1gpyinqjLc5O8D0FLTe9Hut5cbFAL6JlDRrr4Jo06VQU4z6ONOwr9Pt5Ry15
	hJ8SaoAfAwtphYvuQwi8YqK971PkVAx6F6N3dnBWRkv7jH+LKDqVyXkf9oz8J3wTHeR5fO9MWuZho
	ddmMUb8zQQ+yyw2BInUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVB1-00000005Gas-1cIA;
	Tue, 16 Dec 2025 13:33:19 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVAz-00000005GZi-02Vo
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 13:33:18 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-29f1bc40b35so66570485ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 05:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765891996; x=1766496796; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YgtnPUK83eGnHHD4+3Z/OSGEDGJ36/32wtdJor/AdJU=;
        b=U5apj9QoJCT/fmOpCwNPS7Nw9/w0R3a6mMVRW7tnHVsMAyWBuOALN/kzeEBAx6P5nW
         jXZb4HPrhCz0O0MNBHY+5K5LQzxNXBrQRFS7VWYRFjPdBEVzBtmkbZ2MSKUX2aCcJVpw
         FOErejkjAbzsrkm3w8n3cAPmngrcfJYqEDHNiv1PLZiRvxJY4CQUahPNV290uPzY0UFD
         GD+6ciP9wkfYZR88xXSYfCzdarKz9noAPUG/noFEeWEYWQK/wg83TIy+dcgLI7RckPR9
         1w+8CuCMwW1RzVzhLz7ZaNYDBx6+1sda00qTqmbKqw5kZnSwkxdzPT/SVEKvlb1ymWjK
         HevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765891996; x=1766496796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YgtnPUK83eGnHHD4+3Z/OSGEDGJ36/32wtdJor/AdJU=;
        b=NEUznigiTlMdGANxHOSGydY/Q7cWVenOs3n1uTGhGCHJ7OVrxLiTYy4xE6Bkv6Z+yn
         qiLQGcPZrdpatFWv6RFiJ8YJ8cM4pmhWILbKo8n4pk13DyE6CAzntFBoMWqIKqwZjg9+
         +xxul3UfIIAq/9EvJddrkQanDdNtTnBTbRVnkifbHxJf14ktG6b5M+Mp6wxB0n+gATnk
         K0h83a8+DZOBktx5myGa3WKm+OksPN81eLAuEPztKcqt75lprj+U1TMqxCslA9MUkUlo
         x0OQWd7mVEcg3gt7YyI+eNI0PTnrWMwDwfbXMJE7CGAyGZcchkmhZwUwcIGOSDUD/6/l
         DfzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkdubULdhzY4G43Z0lQmn3hZA40zL9K3aFTZ8476CQTEyUyfK8hERMHwO8GtQF4oMUXzfpZpoHHZG3XQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp1WVW9fxN2keEygKX7NhPUyjGEhOUHZbcQFWaXOet4W8I5bRi
	4E8sncA5hJA44Lix+RtWJz4zd039PsHYzraE1o6l5k/8XihARffR52k84yYTrpVrNT8=
X-Gm-Gg: AY/fxX7Or8CoK5L/oycadym/v9dSYYfN3HoaTKlGKnDe/0CR4xQrB+b+pKgKGSBv0Z4
	x1iG8SU0GL72T65m3qzX9+DirisHtimzHH1z5SqShf5G+ks2/gtmzXzN9iyZJs2DDqZ90ih2KBM
	UCfGCIGrcrkXNen672GfBuzzfLsa33KOhfngXCTpvWItxpoo7Av5ADa7ORjsfnIojguv8Vs8Rv2
	gedPdBcC1vbOVDeeqM0fKfC8CyuVeI5XXb4yyDxxDGIMFWrqCo2YrY6Gn8AwWLxf3ZxI4SZEh+I
	KQOQkWZ7FX9Ut5CKRBlEDnlE92og1cP2lNmKhItAEjbjOYcuF85336SI0acaQiw+BfCOoeZCr0Z
	/N5vRsQDOfH+Nha5O31nHpc0GsKy0OApbbC5WGDoTyENpSDzUDOulEDXseiRFJlkIXs9hO+bF7g
	46lCqGKAQJt2ihp92JNpirk7+khjCFqcY=
X-Google-Smtp-Source: AGHT+IGY3Bl6L/q/ucq2o7krHMUCV6pUZcjqotL6XoN1XRPjp4aSVY3JMf/8mH7J80vFyBB1R/u+VA==
X-Received: by 2002:a17:902:cf0b:b0:2a0:c5a6:c8df with SMTP id d9443c01a7336-2a0c5a6cccbmr98731775ad.21.1765891996120;
        Tue, 16 Dec 2025 05:33:16 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4029])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a14625add8sm15829525ad.61.2025.12.16.05.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 05:33:15 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 16 Dec 2025 21:32:26 +0800
Subject: [PATCH 2/8] dt-bindings: timer: add SpacemiT K3 CLINT
MIME-Version: 1.0
Message-Id: <20251216-k3-basic-dt-v1-2-a0d256c9dc92@riscstar.com>
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
X-CRM114-CacheID: sfid-20251216_053317_062145_E05639E7 
X-CRM114-Status: UNSURE (   7.67  )
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

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 0d3b8dc362ba7e8d0ca6d0cea692ceddc5e1f89e..3bab40500df9bc2ba4f7d6f1bf340c8cbc06f9de 100644
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
