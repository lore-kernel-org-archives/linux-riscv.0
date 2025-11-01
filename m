Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629B7CCF9F8
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Nov 2025 01:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2dPtRRJ3dSEclyXmVCCauTwbjk6YvDGTGH8r9xbqo4M=; b=DH5e1KVSq5ZjyF
	gNnHF5S6T3g3nQW+3Ey60ssGv92dnb3BqTXftBGwo5GBAPb3L3PbtNPikUc991KqXlngM7Eyk/GRC
	qhOeAhR05fHRXjli8JSAuOJyw/r1KBsWWRp/BdgTAfLzG8YaHOEAdLZpRxc16gBfvnasmm6epc6Sl
	mnZpqZt91jl228lYwbkUSXQdarAgptI/53guKz3Y2VkYivIfH041VLsdeORBkIOJNAQmMx9auMHV9
	UuqWZVHHm6uTHPiAs4AkcReaGLNBzmjAxloZnPGKvTjU/JqhiEwIJq48FZrZKGohsE5lb9vBIc+pG
	x1q81jJiGszSkGu6F1jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF0fP-00000006yK0-38ub;
	Sat, 01 Nov 2025 01:44:31 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF0fM-00000006yJh-3drs
	for linux-riscv@lists.infradead.org;
	Sat, 01 Nov 2025 01:44:30 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-794e300e20dso3220023b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 31 Oct 2025 18:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761961468; x=1762566268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c+fhVqu0PV24AlJRQZwkBAzniqnqOKuxZL9zcVIrjpc=;
        b=FtgpsIxGokw5gI+DnnfIoYZWgq5QMvBkxsCz2GM6RptzO4BTGam3xMIm28Se5kEcyT
         uwJ+RG4kgd19yjWnzJOs4uR0WhzGSSHIpL5eLxXKVXqlfG+M68EqMZuVvlNPLBvFotps
         vk2Fe1IGNlgIOWTW5FeCppwg4dyVw/wp1qR2+pyGL1NjB2k9AakVvNaex2hSgFN+X5G8
         fZUI3YXVKbz48CEqMDQNWj7h6byI7u8IXtPNMT6EIHkusNX8iaXbaZ9IRV7onMdyvCem
         npNhyhDb13J3b6LfwLZ+rspMY46+gw0dQyRxoC+3Jc6rEIMJfw5zdon34cTU2hEbT4Lb
         ReVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761961468; x=1762566268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c+fhVqu0PV24AlJRQZwkBAzniqnqOKuxZL9zcVIrjpc=;
        b=JfITbfRO0k3+2fr37HA08HJNp9Od17PHw0miBRw3wxdUsPnTv6G36LAMtxChjnWcK2
         5h9seOUNmd6bu5U9kZGnKz8nlU8A0FHyp09moIr/4niGXpfC7P9xUSXWLL3z/PNW/mXl
         LGpSREOLaGgYxQk+g9Zoukt0O48rZnOopo5LF9URL15qdsAtDGcUpcmIN9XRbJL3MYx1
         LskbRQUcNqcW3EBkZxiLTpEL1unwWQqzpsgo5CTTOat7Z0f5Ap9P4L/zq+xnK6uQAMkL
         sY55MllC5VVkIp3oRsFimu4xhZrbthd8EJHpW2Mevz1krMM9bCp83zfWGtj4jJ1YOeNV
         JWgA==
X-Forwarded-Encrypted: i=1; AJvYcCUqymdTQRgbRn0qFBsM/VwoZN1lIOhtOrIa8e3Yn3DUzZd7jYYXcGWfVOHdi6pO7zDs8Z78U9vIKwqVIA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9US44FOT0Ur0Lv0YOQXSQ8143KcaT8y0QbTu3rlfcXcAbuTVz
	pjvbK4QsyPeaydp2UpisptSPIYSw8kieGwadFtN9WZ7qcomXP/sdC2Jm
X-Gm-Gg: ASbGncu7rQ/l75ESVxco547RbQgdwI2AbaEnj95ssC2uu5YC3fqD7ks+W4FBee+n+AD
	GBA3N+FqI5PtuwYlTbkSndJTVZGOJUdSRiWzCGU+PlZ0aY8CSHVyPsdAYZ57hfUtYuaxLzPkS3Y
	L+EVXYrm21ed0QoHzGTIlccP5T1VGNi2dZE6P+fZ1TYV3VqUwUkcYnh8l1x0w1pkt2X4uXYBNV5
	ZDNXL/CjgmFicxLEMRSVG1cDdxWwc797bzx7WoAzA9siwXTba4BxwEBCh33iJINemo5XrBZGbTL
	QvGa+J88CBpyBVWcBSPg4Kj4NLyVOwRbiAfbkwFx4d/1CHDCgAAT19xc3ApdAA0oKCRv/YHO4Ad
	rUGuzKtPlcv55690LR3VmAvjqGz8KNBNrAwKld6NpeOqlGkzuYi2Z7W9SnDGtMxWTJfHAF2y9Jw
	bfLLM2H8Eltl2zek0h4bzoEfYBWrU=
X-Google-Smtp-Source: AGHT+IE+BkF67zbvd+SI0Yp+p5eLlXzV4Z8l0jiZti7LH+X2mQ8UpPDNY8rSxKA66iNjrb7ZffhF6Q==
X-Received: by 2002:a05:6a20:9f48:b0:25b:522e:52c6 with SMTP id adf61e73a8af0-3477a5c1388mr13176935637.2.1761961467632;
        Fri, 31 Oct 2025 18:44:27 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93bf078924sm3350585a12.32.2025.10.31.18.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 18:44:27 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 0/3] riscv: sophgo: add top syscon device for cv18xx
Date: Sat,  1 Nov 2025 09:43:20 +0800
Message-ID: <20251101014329.18439-1-looong.bin@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_184428_930120_E71A3F47 
X-CRM114-Status: UNSURE (   8.49  )
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

Add top syscon device bindings related DTS change for CV1800.

---
Changes from v4:
  - https://lore.kernel.org/all/20251024030528.25511-1-looong.bin@gmail.com/
  - Drop the labels in the example.
  - Drop the patternProperties.

Changes from v3:
  - https://lore.kernel.org/all/20251020083838.67522-1-looong.bin@gmail.com/
  - Corrected Co-developed-by information in commit message.
  - Fixed patch version number.

Changes from v2:
  - https://lore.kernel.org/all/20251012022555.6240-1-looong.bin@gmail.com/
  - Add ranges property.
  - Use proper regex in patternProperties.
  - Add complete example including child nodes.

Changed by RFC:
  - https://lore.kernel.org/all/20250611082452.1218817-1-inochiama@gmail.com/

---

Longbin Li (3):
  dt-bindings: soc: sophgo: add TOP syscon for CV18XX/SG200X series SoC
  riscv: dts: sophgo: Add syscon node for cv18xx
  riscv: dts: sophgo: Add USB support for cv18xx

 .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 80 +++++++++++++++++++
 .../boot/dts/sophgo/cv1800b-milkv-duo.dts     |  5 ++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        | 42 ++++++++++
 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |  5 ++
 .../dts/sophgo/sg2002-licheerv-nano-b.dts     |  5 ++
 5 files changed, 137 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml

--
2.51.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
