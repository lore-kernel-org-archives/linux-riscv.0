Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCE9CCD1BF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 03:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bHw2pvtA+++rhvqALCIlGWZJ3kkmnk4wu8QyM23taXM=; b=zp+4n3EhpxGvut
	WKL+Jh0+vcLXxZIH2EvGQuDOGOcthGHJk4WAJ7kuOnJt9fNHtjJKppv6vHNzHCk9lF0qqavMkUHBl
	QtA+Pv6SQSV1ZgzvBK6/uoMtPoZEgL7HepyzB5rb/OhkIRRI04Qd0Zr8wrE1vhDhqHOILunDPlw2M
	NIyN40FhZX1oVVYB8KLTDTg1ZTdU1cjkihSFoD4RCzWo7+cHeYmXi9dr2gfmNmcW0CfGvahWGGGa0
	wSfIfSax36I9JOChAntticDuzxJSkOJUDoSwTDrkIVWXuMT1yD2XVKSeilD8aeiuEdxbnK9sfPlVT
	4YEltZaNrcar4xVXFEmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC87u-00000008784-0wZD;
	Fri, 24 Oct 2025 03:06:02 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC87q-0000000877f-3aME
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 03:06:00 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-27d3540a43fso14952845ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 20:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761275157; x=1761879957; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4EzmryWBAlOE+6PvafZLTL8RGcukfyVnYUGcNucBOXE=;
        b=iJeg/WjKXpbT4fQ6myl/WHSs8Tbkkyo8bUd15ftJ0FjC4wdf2iThrlG/EvAID/g4rR
         13AuhHAzPGTGglD+MIaNh1GZ96erlNC9LzP8XiIXtrDGVwbTqF8clQ0H/fg0AVM4qotP
         bJcAv4gaY0nCedK5vLWUPXjeL7qs+k+GbfBSLYorHhPKh084mKRFq6DGY5/daN7xqeeW
         aeTCABidFcgKbUbpjtu6vyGL/5EhWq3ZBH0NbrXS8a6/jtuh6sFMWzs4wdoS2MftfzwL
         1XHI0gRB8DV1Qt1yiIrZYKZ8o6lZ1vbxkJOcX0RNXSKi746q2ZUM9CruIoquYAVhC7vB
         CVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761275157; x=1761879957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4EzmryWBAlOE+6PvafZLTL8RGcukfyVnYUGcNucBOXE=;
        b=dAG3TXhOWLIFtOkp8Q0q50XQ5LR2jUnI5QKJxs/Vzi5WjdM+3l4rvLpHvQ0mnmVAI/
         9XhnAABlaxvyho8ycouw+kvyjqDV42lenmNs+LEcdJft9f3JaM+5eHX2yjS/S/LUw2NP
         vLtcigaW/gSSkAueeSO5sWiWwT+Ffh+wG72Bemt3iymYYinPtYaLIoVMa05SkWtKlDe1
         52kUIHk4iUft3HajZ6TBlunNn13QNit0DwWlYoc5DFUegE5isMBkh8zhcPv88ayGL7OC
         UuFhsCv7d3rGi9Ocyjgs2eSHUuHKcFJONrs2HnTiy/t344pYXNAHXCikkjb26ZFC+1om
         Ccpw==
X-Forwarded-Encrypted: i=1; AJvYcCVX7pfawAZv4wimPb2m5tZRma74JZGqwNKf0QhMO1VEh0iTzf3o2rhzgqBSODcg6cCrksydMJTzhuCrLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAAy2cuyL9VQ4wIOMg1Begez9E88+hU40P0VgBZvTIUWwFK5/W
	a/reoVWlX2zFSUwmZUr7tf9xQqOuTd28QJieRAG9SGarsKfV6lbNU7V/
X-Gm-Gg: ASbGncsAMH/AHozWCqxfkPx2Qyo9ucgoXho6dyx3DxktydvYdOgyKB717n1hewPvzt8
	U33J/g88IOjc7y8elF72+d/6RVwv+Wl26DWkbflv9lOirDAcT/dOdqx0OO5aJureeavBbWeAtsP
	C1pv9BBpeUd4cmEOK0XKmctZm7oAKxcOVsAmvTbbzBr++llblZ4N+wRj93KGs2yrxcjhPcEgL7c
	fcMMf5Jw2/1B3ZwrXHCGzN5XZ7OKVVjCrItt7YqDYWFWrjnGGoR0dM5bF50T7wzZbhx3TRbCWx7
	qbYmZZnRXGUut063VEOsqu4RHrjS82OM5D0CBHFwlAoscl2Y+/ZJ2DFzFbfdCqR4EM0RNMOi/WR
	nOxdXCIEO9wB7irczUqcA6nxuj4sg4jh5qPxRlB7gzJlyrqP7lzNq2cxE810c4CtPYnJhKvm5RV
	S4rgUoGmHB8dQcVdMMKwd7yrS1Pf0=
X-Google-Smtp-Source: AGHT+IF8b4avL0/1iLczBKXPJIE+YBOYlfAMVKvJQQ45ng5xpwwuuzbCszJkZUGkuxOMXW5DM24w0Q==
X-Received: by 2002:a17:903:298c:b0:27e:eabd:4b41 with SMTP id d9443c01a7336-290c9c89eabmr329227425ad.7.1761275157084;
        Thu, 23 Oct 2025 20:05:57 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4bb86cbsm3574172a12.7.2025.10.23.20.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 20:05:56 -0700 (PDT)
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
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 0/3] riscv: sophgo: add top syscon device for cv18xx
Date: Fri, 24 Oct 2025 11:05:13 +0800
Message-ID: <20251024030528.25511-1-looong.bin@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_200558_915229_E8EE7296 
X-CRM114-Status: UNSURE (   8.40  )
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

 .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 81 +++++++++++++++++++
 .../boot/dts/sophgo/cv1800b-milkv-duo.dts     |  5 ++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        | 42 ++++++++++
 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |  5 ++
 .../dts/sophgo/sg2002-licheerv-nano-b.dts     |  5 ++
 5 files changed, 138 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml

--
2.51.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
