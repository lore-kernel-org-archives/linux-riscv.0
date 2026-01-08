Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FCCD185EC
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 12:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cTSdM/l2vuaGa1EAvlgIxNUhDlgV9WKXjdEKmXFDVJM=; b=sK2U3v2uilkLtx
	XpMvsvWQhfedYY94qhR9zc4pKU5mcumfM4lrnb9MatpD2ulYKXcCXjljk6J2kkODCMvgNd7tprvlL
	tNjixVroXBql2AGGUoSbE7ntphYTONogrq5JdXTcQpy72jLBLFTS6skv7uN04BEPuWkxkNUdhhhn2
	ciKLZJqKZYEjghWnsaC/swY7NEfcCNWK78yNDulH7SyoMGt5TbXfojZSQmDUNPj3l2u3GtA17gwU8
	LA8eg1mdQuhFioOTGGyRZ/5ohcWxq4YlP6gAD3XJl5/TwrLel/GY4Ek3IXPE6SVFVJe1EDH/tv1Fv
	d35Bis70BGkfo+W/pIAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdp6O-0000000Gzha-3w4g;
	Thu, 08 Jan 2026 12:26:56 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdp6L-0000000Gzex-1jqd
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 12:26:56 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so2094923b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jan 2026 04:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767875212; x=1768480012; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Uu81D54FMEFR1KBiicj40Orv/JnpYImdvG8u4ALBqk=;
        b=sEfu7/lyyVdyHAZ47P1ce4rKCHYTD1x5zRaItLmP1jvMG19wSFeICluGbs3XRTpSRY
         63u9LRZmFUE+ix03PxEdMlifU3Oh4Wu1jqllC8toHNeEXlXUbQH7AoWzzYgswlM7dtzz
         Eko8HoMsYCft2iSe8dGZ94e7Nt1aQmnu92v2pbIRCeIewgpOyx9/0zSHVUPQfyIGoS3P
         PAAKCJppJ4tTVvLefPQ0ZPOvCRmFjjyxdG2wTxEUOWRtWnwvl3xgKD1ZYwdLxavaOWs6
         qTSHyxw5pqZoOShLB7Unzm/VdtMZm6qfgr0Qh/IynjKNTVmo0e1vV8cnheEKhKyfavpg
         GWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875212; x=1768480012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Uu81D54FMEFR1KBiicj40Orv/JnpYImdvG8u4ALBqk=;
        b=sIdFsCeorZigqAy9LF9OgnpzaEy2Q3nt/tLT2FQBwPMrUx3bb09xakT/4pRK6eNf3D
         iwePqzY7Lz/soW9VbCVqiRTNRMeRSxyxYhHHFUGMG1lsa5AGcCHUnHnJ1QdUW5WvbKpm
         1X7wng0fgf6bucdeTrQ0O0coCBMBObPGSuE208z4QBzOonFnqR80z1KwGuAXoZBgNMUi
         4DihSaXdubkq48+tYN1ITWzeuBYR7+aShe1Utd5ZuIk9N/TMGHuopYGWI5+HZ6V1q0jE
         UlOCmz8OSRFIbXjhVRKlmZGKzq6d+B+8lKQ8M6/YOmGY2kV4mYJ76aY8wZar43ZTWdnJ
         qpGg==
X-Forwarded-Encrypted: i=1; AJvYcCX8iCHrfKIAbVQzsSl03UcUrzFgAqmzsQ7yWraqKiNE7CqbufmZzaDBryBcYL98LpqG/ktvwos9s7rfLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbVbn3lzzzSYyYHT+BkIacfkdyjl+YYWi1ZniNe4sGixKEyKE4
	iQJGd6SLryd76pogjIYQ0bXw5PqvNO0MtIMUVUIzebPsSzu87+g9ZSh/D1SuNH+sPpY=
X-Gm-Gg: AY/fxX7ry3iyf/Dty0m1xdtMiLqIIz9dm5xCuzzu+BlNR6WF1ZGf+Dtjyc77mIi4Vlk
	ZZY3OpsKCFNqdt1j6r8eulKdwH4EKPVncHpxjUXBys0EfYSNjRp8eYKHvdkbU64paZrWxQsnlM3
	iGtSVUvwsuRLYiqHuFGTy16vYahMpVkVqR5sN0xOmvnJkjaUzv95OzLej6sYwKZh5QWUTKK1EZh
	kyb5XUrc+6wg7YyR5TaPjSrwFvYBPxnR6dPqR/nL9xCW8svbLvLHIzv2jFkSYCR7rEcZ33H6Wqb
	FY08b1zaz8+MtOxgCMQfvMm2sG/3Q0S5+RQBPolanvLKzrCj/8rW5K82Q4GJCyH7dnhvyK7EtUF
	VioNO+ckAu7qWirPOW9hiNBVSgnoNT2sr3FGqV4LYCL+NWKgI713/r7Z7nbuV68aW6VTlCf5Uga
	5rEN6FEQBj07lqKMDkNMzpQx4SrYTLCKo=
X-Google-Smtp-Source: AGHT+IGjXfsog98K9N9BmFt/146sG4w5oYOSz5QSQHD2sWVG91brHPM0hOS0kYWXqTMiNVr9IiT+oA==
X-Received: by 2002:a05:6a00:3003:b0:7e8:450c:61c3 with SMTP id d2e1a72fcca58-81b80ac5a0cmr5573634b3a.51.1767875212553;
        Thu, 08 Jan 2026 04:26:52 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm7656401b3a.16.2026.01.08.04.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:26:52 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 08 Jan 2026 20:25:55 +0800
Subject: [PATCH v3 04/11] dt-bindings: interrupt-controller: add SpacemiT
 K3 IMSIC
MIME-Version: 1.0
Message-Id: <20260108-k3-basic-dt-v3-4-ed99eb4c3ad3@riscstar.com>
References: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
In-Reply-To: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_042654_934270_90082076 
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

Add compatible string for SpacemiT K3 IMSIC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: Add Acked-by from Krzysztof.
v2: Fix the order to keep things alphabetically.
---
 Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
index c23b5c09fdb90baccece03708f4a381084b22049..feec122bddde1f82cbd29b8f3597d6af1a16cb23 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
@@ -48,6 +48,7 @@ properties:
     items:
       - enum:
           - qemu,imsics
+          - spacemit,k3-imsics
       - const: riscv,imsics
 
   reg:

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
