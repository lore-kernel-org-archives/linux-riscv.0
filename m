Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2290C02198
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 02:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z5j4jKzvm5L00Y7A4pFMUkOeUji9RujtT05fkufvtgI=; b=UNr9eYf/KVBZKy
	DZFCiVh3Kbd7+kQViyfS3wmKYP+8rUR36rMNSNP//VeU8voULfYcIQYf0ztN56wOz31sliYPpWPT0
	bDEgNVul4WPyTnOXNs7WnVteaTx0Uj4aFDNowViiF3HGJRRBonusennqMogtHhRJxd9esJ7+GJ1Uh
	mGIlMZD8X6DtTcucddMUjwMZRGbI7iZ7gsLzrG0d/Kpx438pWCJ/iCb3pJ/MrIHPknUfc6nuklhyU
	9BCUS/YoOS1xZkN6Crna+ZruhnA+UYZV+WJ8TQJjmKpYVG355khm9obaIV+HTDWvndSmc7Jec4eIR
	N3rKlbIPg5I9JxL4EDFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiOfB-00000009SuS-1vNK;
	Thu, 13 Feb 2025 02:09:13 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiOf9-00000009Su0-37RM
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 02:09:12 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7c0590fdae5so55416185a.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Feb 2025 18:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739412550; x=1740017350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=URu48V2H4PNPhJaMKw0EYRbAFViym7qaTk/OUPZaI/s=;
        b=HgEODmn+cgS60OuyrHkbTirq2wb9f0TonKTUQf+2+wRP6jm4DsWTopesV5IXnX0bqW
         hRvE/PMQRetuSONnAf2B1F9CsXTXtMszdgdRMxvbgOyZOImEGtV0pfk8o9Sw2orACCxw
         gu/uN2Zd4wQljBoFTOYtVBTfcU/ghJNH/NHdQjGNPRc/jBwOUkNCNJEErWT3gZ0wO9++
         1TTJ2NO4Vy/b2MYfuD3xOq50wTulFgaTr1TxsGIsJ/5oZ7nYEWtjgRy/4+X4NO86+QhH
         edoq8hqZ3gOaYmT4tK6+/RmOXswcqoEEAS2FqXTG4LlDoAEKign+ti8TtjnsI3mZZ/0c
         CKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739412550; x=1740017350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=URu48V2H4PNPhJaMKw0EYRbAFViym7qaTk/OUPZaI/s=;
        b=hKhJLrMmaRRWH9hWeOJ/Sb1M+DjMric4zOJss4wgi6pZB6FsOGPcsn8pGAVJS65vBL
         Y+TAG5B9OT/LBCP5jX9YGwEaT2rBJ1rXshjNUqfWc31lQODVPGF7GvB8i3qv/dIPnavC
         gcrqBF2eFMFnfTrtV+5MyU6ThkwWoEHVEZURYUwaQJofEYPK5FgNN9Yp7a/LE7ISyMrv
         9zxp1h7kut8dTVG9KGt6Qp87UVwMCMsJ7SAf5cg1+qo/NLiuMX2Pd/UTxreqfNkHuAUv
         8maNHuWhXx/Md+HgWJOSOTzhMtzY7TChpNrEH92oR5Km0oOtGrvGCk6eQfHBxPx7cbyI
         aGMg==
X-Forwarded-Encrypted: i=1; AJvYcCX+FEPg6ldSEcp6LbssRKhBVOY7e7bt/OdUDxT7nVLhQkbeEUrLbjroOuZjJ4wD1hCzAS+41hEAHuHfXA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTrHYQBhhk0KnjzGNnyYd838wSFVs+z/SL1JtbmJty3QFruudC
	6vpMEmcYq3KeV6ELFp1J/XJ8X0uRSeqNFpWyWOgH7HGH2++nFieR
X-Gm-Gg: ASbGncu+vsjPQbIX+ihatHSDdzalL/wzO9lkvaagY4lW/IQVbx3XBNl4CcZD8FP7hf0
	aO+RACHuJ29VfDqWKcJv7OMNXLxChp1208zIJisqsH1Nwy4s9g+TmTvQrgek0PYryC1cNVY6ZNz
	+3XjTBC0AOA+/TOI9ns7M7tGgkKygZtTJXGMVyY87DZjS66EklBiNLqj4a29jFnGcui3ubWYgIT
	iQFMquO7EYC+AYjmOx0CLUV3SXZemg1FGqpn+437ccH7B1O2kU21CDpQVFBdeZaNyc=
X-Google-Smtp-Source: AGHT+IH7YLtKs3/ajC+qpgE3wdkNhgU+qso0fMS2oyCZoq3c2WmsR86YSkwyQWYRtESSNpuvD15H9w==
X-Received: by 2002:a05:620a:45ab:b0:7c0:724a:c4dc with SMTP id af79cd13be357-7c07a1ed35fmr341178985a.48.1739412550545;
        Wed, 12 Feb 2025 18:09:10 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c07c5f35b2sm21730485a.11.2025.02.12.18.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 18:09:10 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/4] reset: introduct generic bit reset controller
Date: Thu, 13 Feb 2025 10:08:53 +0800
Message-ID: <20250213020900.745551-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_180911_829593_A0CA8125 
X-CRM114-Status: UNSURE (   8.79  )
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

Many SoC have a simple reset controller with toggling bit to perform
assert/deassert. It is annoyed to add compatiable for each device when
coming a new SoC. It is necessary to introduct a generic device to
simplify these things.

Add a simple generic bit reset controller, and migrate the Sophgo
SG2042 reset controller as an example.

Inochi Amaoto (4):
  dt-bindings: reset: add generic bit reset controller
  reset: simple: add support generic reset-simple device
  dt-bindings: reset: simple: migrate sophgo sg2042 reset controller
  riscv: dts: sg2042: Adapt reset generator for new binding

 .../bindings/reset/reset-simple.yaml          | 46 +++++++++++++++++++
 .../bindings/reset/sophgo,sg2042-reset.yaml   | 35 --------------
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  2 +-
 drivers/reset/reset-simple.c                  |  3 ++
 4 files changed, 50 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/reset-simple.yaml
 delete mode 100644 Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml

--
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
