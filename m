Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE3FC3ABC0
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 18:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6TdePhnFNrJ3S1a0Ee7CTZMlfPCJuYCuNf4TxyomHbo=; b=ogvL693M+B6cgY
	n077fgCA3bt1vV96qFWaclhvs80xROW+AHiFlMZu7u0s1XGWdJCSsaLUsg4F2zNJ9d4UvsLnwMrJR
	Y77qLXVtPstbOUh7u6R4LmqQNQb9ZOssFi4MIFmYCYb+WdKyub2+OdGsHV9cIgkGyA9p8iDADxzZl
	ZWfolpu/Oxhlz04KBaoDoXaqCTEoGxNPViRLZ0HZ1Y+HxSM430ubTCenGbAMNLDLWNSLpNKTjyj4/
	IX7eXaWqJZpoaph7e5hOZqZROlmxk68/huhKquBnlWVZaLjT0xlycUiYIpxFI5b4+zORIKoD9K84G
	azVTrI7RXPQu/zAJy/BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCjx1-0000000GXJi-2oOE;
	Wed, 07 May 2025 18:57:03 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCjwy-0000000GXJF-3ysp
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 18:57:02 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7369ce5d323so261025b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 May 2025 11:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1746644220; x=1747249020; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0D7Z3FNBB3xDX5RO0FZQrmLI3qnCJ7UO3XkdhJ32m+0=;
        b=c4noVi0B42MTOIFio3HmW7AIkuxlHT37GP8XS0OH95zZRjuDFxO3nQbzlW2jVgVH9h
         gFpcn8+F7wzHuyYi9VJJgYg/2nmTmgGQm2WjjIpsNT5eVRkiNmvYyFsE1eE1z1Fk1oqr
         MElsphGVjf+xANctnH5n+OoubWKQSJJMzUPVgXX20BYMaEAUJbJ0H+hal8sM/EYvJQnA
         L5FrDJfgtqdtkJW+ntIt4lzW2Ybi6QMou6rBw/l6pRHM3xdfor+0WeP221B3Mukm3H0S
         C9miPP15cHpH20CbFy3FPNV8xYF5M+HJ6hr6POIGJNFlfYRYXWX7yiPoEvmhVlnCiKNI
         3eqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746644220; x=1747249020;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0D7Z3FNBB3xDX5RO0FZQrmLI3qnCJ7UO3XkdhJ32m+0=;
        b=g3flZyslJ5qBB/v37a7Vue/c7GrVoZZL4FG3tcYZuSopeCrihDMIALpkfttcPIReSR
         ZzGmtFBzQL2UvanjUz1Mqxyoesq/rgbTNqUA0qpmkMR57xgPUfSU7xSWn4jWobnTcTWv
         Psc/l6eTJKImzKBXJvZ+uWazU8bljzKWISpQSfX+iJmOLmgE7QtbxAm8OdO8fX7IG51F
         ezm/tqdRce4g1AS8hB4FlyVjlUD8x9eYQ0QS2EMqobN0OGfzlAVjhn2lzicZN/ug7UN6
         11oAoPlGJHDuDALCZ9ddejuKvUxmZPlChLnfa/a8o2AMqFZSKzA9rdd/c0b2at27thCe
         Ohjg==
X-Forwarded-Encrypted: i=1; AJvYcCWsdmdIFfyYbuuw8aRpdM83SXto96M+DJEsxcnJZC2fKmVD5Q53nNbNUS9iv2xPXaMK4skJgxkWaNbiXg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7pLJk7V7XMzMBQ/XCXEU0+Mq5MOAB0W/yYM0KbroEVELDPncS
	RkeNxw2k8FvW4EzooUnpUlueC5AeA4f/ghqCEotqB0jg5Rpdw3e+p9/IrIyPuxI=
X-Gm-Gg: ASbGnctqK2xDgDM4BY7u16u3LvKUlh1Q1i7Vh9G5ygZM+bfwlLV33thcJ2xDeeNdzge
	tnUZBEMchkIXBYypi6hyJo03Lwd20SjSw4wrN/qq/Yc4ppD01hKqsDTH2O/7DRWdY/zXHto37h8
	B+sbt1VS5xG27NSI5i04Iekz4by6JYAxNPat02xVDQ2zv7DueTMxLVUL9uMXkgsunRWIXJ0tSvc
	C23BVqmmFU7QG2H8+Jxw2e6OJi4l1YjQ38M3P7EmeZCivrE0Mm0mahIxpnwRSALFYKqXOD1b1GR
	A6Zt9iH+3X+DeQDovZaqyFZKg/0od1xqxHqsBSjXXBK+YaI=
X-Google-Smtp-Source: AGHT+IEdnDHavMVVsk2ZTJfyzX7ew+kWTOFVAkNqTxlCa/8qxYi15T/lhuGRhufPsi1FCD90sh72qQ==
X-Received: by 2002:a05:6a00:e0b:b0:736:32d2:aa93 with SMTP id d2e1a72fcca58-740a9a91092mr595573b3a.20.1746644220028;
        Wed, 07 May 2025 11:57:00 -0700 (PDT)
Received: from x1 (97-120-122-6.ptld.qwest.net. [97.120.122.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590a2735sm12068773b3a.176.2025.05.07.11.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 11:56:59 -0700 (PDT)
Date: Wed, 7 May 2025 11:56:57 -0700
From: Drew Fustini <drew@pdp7.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [GIT PULL] clk: thead: Updates for v6.16
Message-ID: <aBus+Yc7kf/H2HE5@x1>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_115701_180796_D30151F4 
X-CRM114-Status: UNSURE (   8.07  )
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git@github.com:pdp7/linux.git tags/thead-clk-for-v6.16

for you to fetch changes up to 50d4b157fa96bfeb4f383d7dad80f8bdef0d1d2a:

  clk: thead: Add clock support for VO subsystem in T-HEAD TH1520 SoC (2025-05-07 10:09:28 -0700)

----------------------------------------------------------------
T-HEAD clock changes for v6.16

Add clock support for the Video Output (VO) subsystem in the T-HEAD
TH1520 SoC. This includes the device tree bindings for the VO clock
controller as well as extending the TH1520 clk driver to provide
clock functionality for the VO subsystem.

Signed-off-by: Drew Fustini <drew@pdp7.com>

----------------------------------------------------------------
Michal Wilczynski (2):
      dt-bindings: clock: thead: Add TH1520 VO clock controller
      clk: thead: Add clock support for VO subsystem in T-HEAD TH1520 SoC

 .../bindings/clock/thead,th1520-clk-ap.yaml        |  17 +-
 drivers/clk/thead/clk-th1520-ap.c                  | 196 ++++++++++++++++++---
 include/dt-bindings/clock/thead,th1520-clk-ap.h    |  34 ++++
 3 files changed, 216 insertions(+), 31 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
