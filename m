Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0630C77B7C
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 00:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/Mv2ydxL0ud1tfl29Gpnq/c+GcSmsf9tb7iacrK7uEw=; b=N4BMza7L7vyXrW
	6qvm5Uue3x/lDSo6KMw00SGgo76P/ZdureOXS483OlXiYxwC1MZVOaonPDb0jxgYmNAFHMiaw09Uq
	3DtV0GbEnLONLFHjSZ+gejXrS9g/USqynkD0UVoaMWSNBJkwKzssimmXR0sVJKe0C1yWr8m8VkV8/
	BEwCuV18DVi6QcILSP6yNzkcKs9ZRhhqNSHyTdwrGgAAAMDzJUi2dsiq4oyF/+J7LDWXv1cXNapvl
	BFMGUPaFlmEphV1dSXVbtXU2DwhceF1z1msM2QoefFWcb4ovHSxIzSkYosg0QwJf5VWYt6k53t5h8
	r+4Tq4F63iDFqLkNbGjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTV5S-00000001M0G-1Got;
	Mon, 23 Jun 2025 00:31:02 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTV5P-00000001Lzf-1tCP
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 00:31:00 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-742c3d06de3so4216068b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 22 Jun 2025 17:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750638658; x=1751243458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iljGygD1Q6d7ScReIDOoZWXtLgtOIhYkJ6hRy1R+TEY=;
        b=Lal46YHILFBX5w0YxxBr8nTHwtae5NndkWtrWtT0jBYw+xhF1KhfEYnqZqFptmnpZR
         Fkb3xkjelscshLbTAk3Kii1jpbLSruw6vi3n+uqb5faf6/IL/M9E0K/ZbYuyMDskzUPm
         0xf4rmeYKahYxbAhcDO3AAXtDKMSll5aQRKqsn7yVJm2fRbte1B8PvvTLuFGBgWoGR3y
         4kafC+fwrY6AgsbD9KKFTXCUwGX/NEP++/CRpAyYS3RyWhfYXrO1iXnQ4iAyfAigbhfC
         i+UoEoZLTr71zgggoeDSYWDzsoX2HrX+DiqsTZeK334iS0VwN+73SDpkyG1izHjO6D8W
         w2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750638658; x=1751243458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iljGygD1Q6d7ScReIDOoZWXtLgtOIhYkJ6hRy1R+TEY=;
        b=NSk/WDD1+A1Cih0PbsfcVAIv5a1Zl2YwCQyEu8zEMUTSwBCkIlhyF9OFiBQbdKcZz0
         YZwCS1mBKe2PkTUmW+HU6bRpROgl4GfxZFipIkXwTSYzVZvvRYbXHgHC3tlZlXyxI7oZ
         D6z0XP439didt3GL9hpY0L1FViGjg+sA8oIOjQRTQy2iJpshAZCTo3xVkYGzkF/THdMU
         TSx+xLT8shGCzyHsQC/EwkBhLAkJ7Ene4Wv+w5Bm1Keme7qLcXCXVp9hTgEFz4aCXbkS
         WrgjWALU4LuWyyF1Fa5MxtVdtvaNXgyhDjqNCm2jfdo1j1U6iwaVn42UdYVKoulsgnuo
         /vsA==
X-Forwarded-Encrypted: i=1; AJvYcCXzM8R5WHi+O9c5zxu4H9/xOPMC5vNdaBxzkKsyo0gkCigSk8DOrF9qbd/hzxuLu4nHTL1/b08w/baFTw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUDcPXIizmqOi83EVI8o605/BmgpGpJwLGMnt796EMDJu0tnbA
	jmLUfurCI6lr8kP+DPHqsYUKdluc0DFjv/mHN2JCo27A0TIEpvsiIe85
X-Gm-Gg: ASbGncvx2LGGdxMamQt8u+51OwQQA1JtmWHeKXhp/29ohele3slqIAeymvaBHUECPhC
	qpPWjm9JPG+BqyolIhxB9cR8okY/2guf9HnMoTNP0DdW+Ez2MGR5jMiAEigSg8ogLOg/tzDIbGI
	wVH4jOvUeXVe1ZMTkipgJMkXCiHoxgGkQuroo4nrYC0RVOPiBaBuaojFVM6OQBdlfvk4xknF6kk
	Vl3JioVL2gMVRtOL7AVVZi7LlP6UF/CcIFZmoBlUZmYi7t8WTgDX9FCbyo3wrkL5Ac/6ugjXT4u
	Ne68P2pBgMfDv1a0ldXy5ak+lMnB9KCaxu6yztwMJ5eh/f67X3C/Dzla7o1xstF7aiyPJmUj
X-Google-Smtp-Source: AGHT+IFxKKprEgj0UFVm9wh0Cpkbq08sPxFBqdL/D1NtTk0oMZTwt0KwJTTh07EjdB+QJCVwDh4pZQ==
X-Received: by 2002:a05:6a00:170b:b0:748:eb38:8830 with SMTP id d2e1a72fcca58-7490d75a080mr14587231b3a.13.1750638658187;
        Sun, 22 Jun 2025 17:30:58 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7490a628108sm6888755b3a.102.2025.06.22.17.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 17:30:57 -0700 (PDT)
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
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next RFC v2 0/4] riscv: dts: sophgo: Add ethernet support for cv18xx
Date: Mon, 23 Jun 2025 08:30:42 +0800
Message-ID: <20250623003049.574821-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_173059_491510_1B69E7D1 
X-CRM114-Status: UNSURE (   8.44  )
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

Add device binding and dts for CV18XX series SoC, this dts change series
required the reset patch [1] for the dts.

[1] https://lore.kernel.org/all/20250617070144.1149926-1-inochiama@gmail.com

Change from RFC v1:
- https://lore.kernel.org/all/20250611080709.1182183-1-inochiama@gmail.com
1. patch 3: switch to mdio-mux-mmioreg
2. patch 4: add configuration for Huashan Pi

Inochi Amaoto (4):
  dt-bindings: net: Add support for Sophgo CV1800 dwmac
  riscv: dts: sophgo: Add ethernet device for cv18xx
  riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
  riscv: dts: sophgo: Add ethernet configuration for Huashan Pi

 .../bindings/net/sophgo,cv1800b-dwmac.yaml    | 113 ++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        |  71 +++++++++++
 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |  10 ++
 3 files changed, 194 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
prerequisite-patch-id: c9564e611005b80c0981ad174d42df14fb918c18
prerequisite-patch-id: 9e1992d2ec3c81fbcc463ff7397168fc2acbbf1b
prerequisite-patch-id: ab3ca8c9cda888f429945fb0283145122975b734
prerequisite-patch-id: bd94f8bd3d4ce4f3b153cbb36a3896c5dc143c17
--
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
