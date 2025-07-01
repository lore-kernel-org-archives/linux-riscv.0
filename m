Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54772C83030
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 01:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qQ2ceUle4Pi8b0aGMq/UMs2aMWWp8ABCuyvXIq62f60=; b=GLnqm1bOyiOzDf
	q73lKqdV6/s4MD+yDdY8zUYMDA0NS47Pg4H/WFVrdrvImQltQP4ohja9Qqi8Cn2xOb68xWp77VbS0
	Yo0G9/F3BhpD567qXqmsv1UHJXZMl2QAPce3T0BTNkubTNbrgAr0K/YGRri+8r11pcmEh8804TGeP
	N7BJQB9V7toMMYiMmkhTwFqFQVR0XJRaU1NjgxtsBOlO+IH7V4k/kCmHJM32nr0A01QscSZMzBTQY
	fhkcuWcv5Lr+Y6o/VYqc00FRd+zI0WB+/r8+6I4pdauE8cnKr9gMpWYv9J7idrC0aCQB2mC/elhZL
	QsX4OmgBesv/wwQrYVUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWPdB-00000003o1p-1Xq1;
	Tue, 01 Jul 2025 01:17:53 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWPd8-00000003o1T-3FLz
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 01:17:52 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-73972a54919so2553955b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jun 2025 18:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751332670; x=1751937470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BQ5PSiL5QPW5hfxzuODNHVt+lrCUk5bVb4SwiUVsQ4U=;
        b=MD+ecZDkoDaCyPXruQjMxbQzs+/G2iqVKmuJ5RpMgloB+dEZ/6u4cX8GSpoSJpwqVp
         IWqByC+koFifbQcgxSd7Pvp7RDiqF1AGsG0wIGjLCelSiAq3aveLftL+lU3gTELjJVL7
         GNjcD1FzT5vi+vRov+Pdf7gvi7rZRB1o88FR5RynBtkqSUYoj8FPSS+pcfjDVBcR5BwI
         XEL2NUoj3OBRwMw0gXjdMdC2eJNVjpoQ8O2xAKsBwJeVnK2eatrYIfLi91L6Lf27Gfz3
         CnS3RbMeV8Qz867B3hv3WZE4DiItebJzV9E5oq1og7hSWGkN1Vren49nMATr2WykXcS8
         RD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751332670; x=1751937470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BQ5PSiL5QPW5hfxzuODNHVt+lrCUk5bVb4SwiUVsQ4U=;
        b=YelmLstUCkyOWIFW5Kopjk/0ZptvxGvD8pBLV6grmhEGuMZjuBEI3cM+haZPdTHPo3
         lGXOIMeUfTFgslIUpwOwPtO/M/C84JJ3z68jnWT3NMjvWKs3zwDSwPelD2txyjWQYzxE
         gZueksTQBd99s4pPSZMYXRkO3FwHxwLfVeRXjaQF9dFeWWIETRnUpID4uBHTUMt7ocbL
         E9qlZDFh47k+qPXtjhf5hiQ2SJNfADzFRjUVlPleoiFDmm2j3PGpOSzLQtj1SiCelHaL
         Q5auKO8NvLvDKJBPalFKmszYFLp1sIVCzx4ft7Xnzln2lpyjpwnaJmz5onnG6u3mYW48
         7jbw==
X-Forwarded-Encrypted: i=1; AJvYcCXfFMDiP1DWA/ATGhWlqfcr3/RS98FQiFvGWPmJeJ88iEWJpsN6c/4UW/QVPao3tAFLyJUP0QLXPkAJvA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwaeoINyP5NveWeTdu7PuaCoc9BTjLj+eNbew3CeMEnhi2cbih5
	uN7otSaAzTA9JufpgcsCCw5NyY003SOgj9XTf1kiPH/pw4PMGZtM8Wkw
X-Gm-Gg: ASbGncsCaLPEVINXWvZXEtaka+gChxPGSwQ9gC0SnH2eRd/fjWASn1c0tk71nNy+hot
	CWZuY4WuSI/YYkF4bfCwFoc/WLdngtvAc5wpfR8ABH/d+EgbpoW1jbX19sHoTcRhDpR91OwftXX
	b1GND0xi9u/uAznOEBRNgs2clnUztMMv63JJ4pyDfRucFAproAkxCInaI97weupJ2vXixigqrle
	V+eIwjCYic802tXN/54FzT1rN1JPWibq4QuNQ2vTNm7p8P2LBhmQITAKBdKvdg8Aen4UoseHdQO
	FjVmsT1HEGh05RRjFyA2aiWwPHgC4pQwkLgQmf4cnvFkpSYb+JBqIsJwWXAHJA==
X-Google-Smtp-Source: AGHT+IElz440y4qt2E6KOe7YdVb1HqXdStD0Ju2Kyn/eXs9IIdlP1Xrn5joO/n/a2gIxs2JVHnRjPg==
X-Received: by 2002:a17:903:2f0d:b0:237:ec18:eae5 with SMTP id d9443c01a7336-23ac4633e8cmr229326945ad.27.1751332669591;
        Mon, 30 Jun 2025 18:17:49 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b34e301cd38sm9250116a12.17.2025.06.30.18.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 18:17:49 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next RFC v4 0/4] riscv: dts: sophgo: Add ethernet support for cv18xx
Date: Tue,  1 Jul 2025 09:17:25 +0800
Message-ID: <20250701011730.136002-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_181750_817111_5D81EEAA 
X-CRM114-Status: GOOD (  10.24  )
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

Add device binding and dts for CV18XX series SoC, this dts change series
required the reset patch [1] for the dts, which is already taken.

[1] https://lore.kernel.org/all/20250617070144.1149926-1-inochiama@gmail.com

The patch is marked as RFC as it require reset dts.

Change from RFC v3:
- https://lore.kernel.org/all/20250626080056.325496-1-inochiama@gmail.com
1. patch 3: change internal phy id from 0 to 1

Change from RFC v2:
- https://lore.kernel.org/all/20250623003049.574821-1-inochiama@gmail.com
1. patch 1: fix wrong binding title
2. patch 3: fix unmatched mdio bus number
3. patch 4: remove setting phy-mode and phy-handle in board dts and move
	    them into patch 3.

Change from RFC v1:
- https://lore.kernel.org/all/20250611080709.1182183-1-inochiama@gmail.com
1. patch 3: switch to mdio-mux-mmioreg
2. patch 4: add configuration for Huashan Pi

Inochi Amaoto (4):
  dt-bindings: net: Add support for Sophgo CV1800 dwmac
  riscv: dts: sophgo: Add ethernet device for cv18xx
  riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
  riscv: dts: sophgo: Enable ethernet device for Huashan Pi

 .../bindings/net/sophgo,cv1800b-dwmac.yaml    | 113 ++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        |  73 +++++++++++
 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |   8 ++
 3 files changed, 194 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml

--
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
