Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F051C0219E
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 05:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TpYxsHmSph77FluwDoheKfbLEyB72a/nOPoDKtF2KH8=; b=WKXNrofNATDue2
	PIT4ncwyM8qt/d3EfknqtpQ+X/CI4B1OoyaXZFM9cxjHIV9SUoWoYiR7Q7W4up14OC177YZy7dF5Z
	gd4DKczzJ5X8db5VvEEA6Imd/EyvSESVOAvywm16rHlbnV+YQLEYuI61i+IM8RHvAGQqK2P0gyOp1
	oVvqN3n9PtAWdKkHsD7KrRvRVqNufB0zNGE19ZxMW1Gk6RnUsq8O2o0cNaoCg9Bl5lzg8sx7NxgXy
	0BCfSD6eDspkyyEgPYoGbLIAJ2kBtJUjxrwbE1xcKqWL+/kN+k35JywUROi3+ukl3fGYyrctFMHZJ
	/bVxJRO3+pgZny3CzFKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thiez-00000002ZOh-3kAu;
	Tue, 11 Feb 2025 05:18:13 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thiex-00000002ZOE-3GZQ
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 05:18:13 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7be3f230436so499255585a.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 21:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739251090; x=1739855890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WzpjNfBqOlKT2BSz+1kp1kL8skU7thu6xUdM/EtgpZs=;
        b=UTg7gSZliBMDJ8ACVLSqS6MQraWVH5+O0yyk9TqQAiZxOUxXSxPSQo9qw3WGY+/nkh
         tik7gKsT77/t1XNewSBGn833zKb9JCs59aNnEHkinPUR47+vrDxjjIa/sqOE0SnZIRzN
         EWVRfnGzPWHJRZIfiokjM7rmjQnnovVMu5SwNOEZA1/5SSQ60xshe3QNTY4e08LYndO8
         rqVmzk86M+LBlxxu4GVWSDyG1ZukU9yYWQq77LMs5vd5frCR+FOFszQijRIBjdlHYpA2
         QPmRjrdMN1o+WQmP+xq2HqWoMfn/2sen/hgVx/TwWY81wdhghS/pCDE/NjA+/ue+hzAY
         mNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739251090; x=1739855890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WzpjNfBqOlKT2BSz+1kp1kL8skU7thu6xUdM/EtgpZs=;
        b=HHkmBFgP9jpstNNE6sCfDlXkh5UYjxgp9VglKHxMTa0R7v9WFIdMn+cDpDz/LAtNMd
         vJTblWdKWr/BwgQgW0yJ7H06UCE7VmIOsLZ8qzoqAMZy0yZNIaXROIzZgJ8bEaNtnbl4
         jppcqJ7z+sCd773fMxAcCHVhW2xfgmGZlEn83WcaqkvmN1LlEp2s4QuJXduO4FgkTReS
         JW89VEoG5AXn1uq7BCiqorIVcA1DmS8eRPtqZQWX2vbAn8gFV99ybDfI30ky+6cUV2Yc
         z8teKjoCrvVCRaHaKetrHlIQhs81UNbGjPMP2cJTSgf8+RBuCuJqqLdA+wvisaurdp9W
         xmDg==
X-Forwarded-Encrypted: i=1; AJvYcCVPpOjMeTLFhZJXYBfhspXz/NjEB/zPn9agAZkuPXbEud9AO2phtmZyKWR8/KGdWLEVkLkz0R0rtXLWfw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYzNpC1b23vFeb68O7GEDDO/bmdcOE0KgNNKvTn6MGknQHK3GS
	/mmnmSIHaTTHtomaw9SJSfv6njE8hcSbWMtFsQ961snsMewTLbjT
X-Gm-Gg: ASbGncu1Dao9K+Gyk5W5DW+FjL0Fsa4HKA7bXO5HRnaZefOkNvr7vQDnxaGAt4VaBH1
	SGrPTSNd1sS4f0lUH361SgBR51r2Z/REVbxU6cxpOXh6oguROMB+a8qMdJ4ZLWNGDivOJk6EO7B
	dHazZ2du8mzU/DZs2lnR9QbXdk/t/1tnOH3SiiDwfGHYP5mTqr9mZTgkI7ogkmsypaK1RkCyHPl
	HY04J6k3wWaITr8M5ZVUMy7SXoUzAI5rvTfM8QeQ06lwCKfIxLOG72SyktwG8eGr5E=
X-Google-Smtp-Source: AGHT+IEI9E5fTbRoq6W5/oLfP1d80KE78Bpt9hACo2akmSZ485e5xOa0rGu7oPZ/n2fRyaJ/vpAwSg==
X-Received: by 2002:a05:620a:1903:b0:7be:6f05:1b2a with SMTP id af79cd13be357-7c047cae609mr2807842585a.56.1739251090233;
        Mon, 10 Feb 2025 21:18:10 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c041e9f506sm624267285a.71.2025.02.10.21.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 21:18:09 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/8] riscv: sophgo: Add pinctrl support for SG2042
Date: Tue, 11 Feb 2025 13:17:48 +0800
Message-ID: <20250211051801.470800-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_211811_831552_5B25F8EA 
X-CRM114-Status: GOOD (  10.79  )
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

SG2042 has a simple pinctrl device for all configurable pins.
It supports setting pull up/down, drive strength and input schmitt
trigger.

Add support for SG2042 and SG2044 pinctrl device.

Changed from v1:
- https://lore.kernel.org/all/20241024064356.865055-1-inochiama@gmail.com/
1. Fix the binding documentation error.
2. Refactor the cv18xx code so SG2042 can uses the same code.
3. Add SG2044 pinctrl support as it has the same layout.

Inochi Amaoto (8):
  pinctrl: sophgo: avoid to modify untouched bit when setting cv1800
    pinconf
  pinctrl: sophgo: introduce generic data structure for cv18xx pinctrl
    driver
  pinctrl: sophgo: generalize shareable code of cv18xx pinctrl driver
  pinctrl: sophgo: introduce generic probe function
  dt-bindings: pinctrl: Add pinctrl for Sophgo SG2042 series SoC
  pinctrl: sophgo: add support for SG2042 SoC
  pinctrl: sophgo: add support for SG2044 SoC
  riscv: dts: sophgo: sg2042: add pinctrl support

 .../pinctrl/sophgo,sg2042-pinctrl.yaml        | 129 ++++
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |  72 ++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |   6 +
 drivers/pinctrl/sophgo/Kconfig                |  46 +-
 drivers/pinctrl/sophgo/Makefile               |   8 +-
 drivers/pinctrl/sophgo/pinctrl-cv1800b.c      |  27 +-
 drivers/pinctrl/sophgo/pinctrl-cv1812h.c      |  27 +-
 drivers/pinctrl/sophgo/pinctrl-cv18xx.c       | 602 ++++-----------
 drivers/pinctrl/sophgo/pinctrl-cv18xx.h       |  66 +-
 drivers/pinctrl/sophgo/pinctrl-sg2000.c       |  27 +-
 drivers/pinctrl/sophgo/pinctrl-sg2002.c       |  27 +-
 drivers/pinctrl/sophgo/pinctrl-sg2042-ops.c   | 296 ++++++++
 drivers/pinctrl/sophgo/pinctrl-sg2042.c       | 655 ++++++++++++++++
 drivers/pinctrl/sophgo/pinctrl-sg2042.h       |  49 ++
 drivers/pinctrl/sophgo/pinctrl-sg2044.c       | 718 ++++++++++++++++++
 .../pinctrl/sophgo/pinctrl-sophgo-common.c    | 451 +++++++++++
 drivers/pinctrl/sophgo/pinctrl-sophgo.h       | 136 ++++
 include/dt-bindings/pinctrl/pinctrl-sg2042.h  | 196 +++++
 include/dt-bindings/pinctrl/pinctrl-sg2044.h  | 221 ++++++
 19 files changed, 3217 insertions(+), 542 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2042-ops.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2042.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2042.h
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2044.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sophgo-common.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sophgo.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2042.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2044.h

--
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
