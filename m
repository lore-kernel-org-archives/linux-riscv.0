Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C041CCD18E
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 15:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JhXNJ+GMptb2bF1Yv394Ndzho5oUy2IawzKdjkjmNRU=; b=n5RmZYuu1VJXHx
	98ZuLI/pE9eBgkQHcah770m3g9j4GIXUtbgSyN2aF1/2Dfsd0rxiyvc/OOHoiXMjqU+ngZxUlla9L
	LKDnr5V642pKQphWr+lwjYxcOrGlAJvXqzWQYjhrnQfkDIJcQhsybuz4NE+tcoVA/qlKYqCtzhvJn
	Wsg4DqpJbN5V/mT+6qmLUCHcns0p7c689gml9dFNeWfNLcGuLEsEr9IGhS+WF1VXehPurBZcIo4j0
	Orkpshzp65gzq8z8jtgRzSJMem4hjBaHricTRJeksaIPIfC1xgSg8dZLYICetj7LPKNX0ojARFqqy
	V4pLhgiwUp9NU5Xn/nZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KaR-0000000DiJF-2ECt;
	Mon, 13 Oct 2025 15:35:47 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KaO-0000000DiE2-0ysV
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 15:35:45 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-91122373653so187941739f.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 08:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760369743; x=1760974543; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbPxvqkXmDdFxjU8mZBTBK/T+YiYjBFrlI/xnqdkqi8=;
        b=2/vyU7uviZBfSujsPwj5EgXplzZtxLGnhtY8OfDdexVqWGGDfo5zuyY2khvADAOgZ5
         DCzNX4YToIji7WR+uuPf0TTzRD3uvBpATPjxAtEdBaf79rFGHTF5Xj1PBSmyaeOtMSJP
         L/r73/Bepxafx2W23mRYU0wZtZh4Yj26WWWqI3kx5EjlY5l70CFJ+BPrYx0E9yPx4fvI
         TR/tu41K7y29Q55teSJsKZduXhUwZiaG7V3S1wxQ1OaewrqX8HDBqh87jzENHjgKmpJi
         Iks4vNaJ2sQWr3Fps0VPdYUtqjcRtIEcLG03Z8locIeN1e5+v9l8Y33/6YdDsKCHWevS
         qS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760369743; x=1760974543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xbPxvqkXmDdFxjU8mZBTBK/T+YiYjBFrlI/xnqdkqi8=;
        b=TA4Gu9VHgx1Dj5asGXpEJX5UllmNVW83Fe8ZBqNscvNEDonVoGtZ1AYhsle5T4DXPd
         L2TcNJkZvUF1NN52yQKFPXw05Wni6rt8Z5V7dOlVJh86LQmUeE+5B9LvEUKULMwfCteO
         zr5Rw/5Yq9SNZWuj9q5ZgXbfHQbED2oTEerS5GQ+gr6HioPoWZdlHfKquSCt9V22ojBU
         i20z9Lb2GSHp2blE5b75ucZCSuDLFSt/UdBWGoqZUIuoxhUMSjZdZPnXKC6J0ot6QrX1
         lXtuavZFlOzdjS183r3J21rCXBw1mCZxgSjpVdWKKa7VeK0eONinkn5TgoFOODpJp64a
         57kw==
X-Forwarded-Encrypted: i=1; AJvYcCV8O4uQODhAOWUa5g9t+wO0amdoNZGEbiOJdRv1Tob7e9bmi4ORnwqG0NdYdveonUZ1/10y+3i1pDjptQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbiKA6zoBLED8WNZDzPsy+WYrAhaAca5b9C1XZB7EZP8qX15D0
	13lWv8WUrnu+i6YDieUw6Otccs6cDBNTUn7B6TCBVpQyMGWcLJgCuECWArRT7orQLys=
X-Gm-Gg: ASbGncuQKShJLkAYlg6gW3WgiIJLNXWbxa+/gov03srTwH7fKy7vOzbZs3EqB2Yloe/
	LPT1ggCBERxnWtI1ElE531okmn+qpDrDH9r4zbD04dPy2063kh49GeKnGEDgDnn3R3X2nKf4veb
	OKwV3iWDynapqDgO4RbRY2Fze/IqG3i5xpDfAYft9IlwI4X5x11T0wEKElqaht7+hOhc2CRTnKp
	36TfQAPaytRLWyWTsiCNDnKECBhMsUSoG1MPNt71MlHfPKLAT1GEUMCCXAd1YHKqtT7omeDi/+C
	Lq+8jLXE9FfH7Pn93rTyL/6C8cuPTzxgLffNe2aDKZGdA8uOIf1XPwHacJBmpNKzspCDntqIFkz
	fzmr9yf0aUk9JtZgRLo0ALF4GUtEmXzyJGxlf6IYBKzJvPw7H+aYEink4TttOxJmlWBPxOi823+
	KmaS4JrmjZ
X-Google-Smtp-Source: AGHT+IE+RgkOmKUAmZ+h2lR6Ri91hcZZDy7nYDDMDTZK5PVvcsi3GRbcTYzKlh5jsPOXdbbG42NjVw==
X-Received: by 2002:a05:6e02:4918:b0:430:9bc3:e1d3 with SMTP id e9e14a558f8ab-4309bc3e4b3mr13658895ab.12.1760369743033;
        Mon, 13 Oct 2025 08:35:43 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-58f6c49b522sm3910266173.1.2025.10.13.08.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 08:35:42 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	christian.bruel@foss.st.com,
	shradha.t@samsung.com,
	krishna.chundru@oss.qualcomm.com,
	qiang.yu@oss.qualcomm.com,
	namcao@linutronix.de,
	thippeswamy.havalige@amd.com,
	inochiama@gmail.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] riscv: dts: spacemit: add a PCIe regulator
Date: Mon, 13 Oct 2025 10:35:23 -0500
Message-ID: <20251013153526.2276556-7-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251013153526.2276556-1-elder@riscstar.com>
References: <20251013153526.2276556-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_083544_305434_FBEEC093 
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

Define a 3.3v fixed voltage regulator to be used by PCIe on the
Banana Pi BPI-F3.  On this platform, this regulator is always on.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - New patch, for a newly-added regulator

 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 2aaaff77831e1..046ad441b7b4e 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -30,6 +30,14 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	pcie_vcc_3v3: pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIE_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 };
 
 &emmc {
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
