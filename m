Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2320EC36010
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 13:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MHXO7aldzhZ/DXJUbKDrRjhcFskdpG7NxuELEyUfG1k=; b=IOC8v5R55i74OO
	RNnnnhFywPOnYjqE5SB9rvDBh5haTtei+P1IiFDLXQs8uh1pSL5btXBoyFQebuNggvPEVt0yJtDI5
	eAqJYIom7bPPFScZpIbTc/+dVDM8wHkaNd33Js6m48u+mbLtfKhs+TZuG5oR3n89HrDDH8bihyT3S
	RbJZEyLTrQD1LhZgLU+Rhf0R5O8cXPTQ/Va0KnzpuavSlY7L5+arhTsGgyUi4fstMdIGzuL9kACFP
	tNJLyolyon2ja+fGX6Jcw8+rFJpB76T1S2vYus2FXtLUf+xyjsvlXP9iPJITUcwXebUxl/gc7U5X2
	5dnEm6oymjiNVX0Umpww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ESD-0000000DvFH-3rui;
	Fri, 11 Apr 2025 13:29:57 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EED-0000000DsSL-3JzZ
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 13:15:31 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2260c91576aso16220095ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Apr 2025 06:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744377329; x=1744982129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/PuzfNro6+y5gilkjTT2xRfkKu3sAMB/YAOWIAOfRU=;
        b=21w3aPYFpA10xyVCq9FRbYFgC6aD/RlcsFVcTbrZiocQU2TFatFLcozuP+ScV21JF4
         LVCwGDx2tGnNeXLml2mTmFh7t2HgxwK06/H5eFX8tOtPbu3xW02JErjBHnYkeBN9zXFW
         rJWkgZB61/gz+Vnng1jTyh9Vql7oJi4um9g3GwCQwkEMD8SBxYFr0TAyqySSNtyOKCef
         RcuVijvVMcih4ogiVnLzMwqQpzXknX0S1v1tSIeQhkJAOAIWYw2ObkxH7ve+4gprRX6U
         gTiwarDt04b7pByP6k27DM+NWxhnCVIqtbBC0RefNbO+oIwyLC7uW+WxExnEDOyzJvt6
         2qMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377329; x=1744982129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/PuzfNro6+y5gilkjTT2xRfkKu3sAMB/YAOWIAOfRU=;
        b=kbZbskbwOurDJsWr7lnky/xxyLm6i3MvTxuwUYTAX+x1PZdzWoA0j7MUE2D2TDLa0H
         DI2nZbt9qTy1V5VorvWOsKNh8pdgNXAx3mje02qXq3eV1taEOcDbUwSkin1zDsoMjH/K
         V3bhF74EQp8eIbC4rZehy125+VBWZy6FJF3okHE8VetbzPLTdxiFOHgxVZoxEjHct54b
         YBxrBivUdYa+KDAPYx+6337AHKmh1osQKpioGaYQFQkOWne49rFC/TQ5U6QkU4CmKilb
         eRtyL8yTRVgTEV2NxE5KUYRFnLY1E4UxiAzsciExxjwjD4RF4zewOydvNACcojIrhW2L
         itgw==
X-Forwarded-Encrypted: i=1; AJvYcCWYxWMnyN5IGmogt3YY0nbydFmuSrg27hEaBJhNfggHIOpqK6wtbLlCSGI7MYU6DVXvFkNlR0EzIkEGZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwM8v6WoWp3zomUgwR8cnEU5+FiR7Zidjp0/DHjkr+NK/4n5M0
	fpaXrM6Y2NQ/WeAzvT6ZnBIMaPFlozRBjs45PsR62okQOcjyzoWQcjVu0aAuuLan0mFWuEfEnap
	FTu25rXpLfTU=
X-Gm-Gg: ASbGncuFySzHwZ8G2FkjsAcpGH+sKHB87tgd5yBcbBD75RifY49ay5Gh9hX4d9rCTjm
	/pfNoi68Kg4Jonpwj0NLcPLh4VI8/ERK/U/BcflKM58XpS48QjNpilRybPhmA8uGM3vOhDKy6Yj
	YF0boJ0aFT+XTyJDpuYFDoO+j7JEdjDdJL5RPv27CrvBusqKWzA1hDOXHVW1ffJUHvTmEvWYHRB
	HeyAQDaFvYWj1M24HZN1NCR0gh1fROCOFUix+44YzPID8XPexXgWyA+Uq5NZHvCITR2vNdicdJh
	+/7vIUoEpS8Bdi+Go3EYdL/tbsVG6vk=
X-Google-Smtp-Source: AGHT+IHitAgPlQRhs5N+Pq3jnUrMsP733j1aryRrbpuBG1bREkPzJLptIcFojxxM3RnqxYYr08nnJw==
X-Received: by 2002:a17:903:41c3:b0:223:60ce:2451 with SMTP id d9443c01a7336-22bea4adea2mr41309915ad.15.1744377329094;
        Fri, 11 Apr 2025 06:15:29 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a305:4::308a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cc6sm48245005ad.122.2025.04.11.06.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:15:28 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 3/9] dt-bindings: pwm: marvell,pxa: add support to spacemit K1
Date: Fri, 11 Apr 2025 21:14:17 +0800
Message-ID: <20250411131423.3802611-4-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411131423.3802611-1-guodong@riscstar.com>
References: <20250411131423.3802611-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_061529_826761_ADF8B4F1 
X-CRM114-Status: UNSURE (   8.08  )
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

Add "spacemit,k1-pwm" as a compatible string to support the PWM
controller on the SpacemiT K1 platform.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
index 9640d4b627c2..1e3cabf6a89a 100644
--- a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
@@ -19,6 +19,7 @@ properties:
       - marvell,pxa270-pwm
       - marvell,pxa168-pwm
       - marvell,pxa910-pwm
+      - spacemit,k1-pwm
 
   reg:
     # Length should be 0x10
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
