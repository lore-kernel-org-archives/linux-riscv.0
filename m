Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C000C021B8
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 23:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1CHjizCXt1VZHZCjGuUO7CLn/gmpE6aDSwrXzmHNkrA=; b=gkknBbIjm4u3mv
	P4yc3KNGwo37i3t8Qlg+qh0/Q5L/Rjq5IQq34snYmbNrM2WYpiOT0vQRldgeB4R9do0Py87Sb6/X4
	+r89roSqiXyu0t5KJh1oIpt95htX6JPVXESSkOSAEQC31jMxCwWEPQUZZni5bc9WXwhuhmh+elSnh
	IziGBtlCydpdKuFbtaaN5VqaoJT59bSA8IHLgBhJ5I7PkPHc0MsGTJEdy57OwoYbmWLUqSTpc5BRC
	FMd0RD5HtahE2gN/a2iwWR+XdhXPnI1IQ+57wipKO0uaxVyGIQyWd5LoyqDQMagwnO6Frd9TkZWvI
	WemOPu5WujXidxFHbV1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnR3O-00000005izh-10tj;
	Wed, 26 Feb 2025 23:43:02 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnR3K-00000005iyv-3hJp
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 23:43:00 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7c0a26b1c67so35913585a.3
        for <linux-riscv@lists.infradead.org>; Wed, 26 Feb 2025 15:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740613377; x=1741218177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YCkbkcOBVmYiyCJMExAY8OQtnZbeodmQmHyD6JqPePI=;
        b=FhNWmj6eDXvFEalg4dI8g9r9LoAkKLQFyCnhhvDTisLo023E1c4DvZL7jp6eFCE1Lm
         XQLDxFKQ1cAMJgz33QBa6mELktdi5eYrvVXw9qtUyqQHYGIm6soDJXCILS8aMAjCXp3U
         T7zkRVbmmUc1OPnKn2P42BY6ijjFgv8nbW5TnkDtFphJgX2fPRId5ba4AHfBmLHedjq/
         rrxb9Rnbcpw1a+46mBYCcL6lDXLEY2UGSiLAURpl7ET1TE4QbYqDWmUK8/5wwcHBoPnU
         zv2eXgoeVTpspTTTcQhVmQTQ54HVKZ9r/vxggdvpEdp1J+cHU97mvE65NS54vcryxAHc
         l2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740613377; x=1741218177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YCkbkcOBVmYiyCJMExAY8OQtnZbeodmQmHyD6JqPePI=;
        b=Zh+i8GioavnX3faw2I8ZQDTUE2jdqNe0lGW8n0raSeRE7/AMzWut8iLcMy2ka8wrqP
         55BQZvxYEDIkowzxzrFfbWsJQjnYttSOfuUPGrMpI+WCPnn38F+G3+C25GbPerEPieHY
         OrJT36xeUGxHrXzvlTKHZ/EMD8mmI/ysr01BCUK8aZNCQ3A4LiItBhYwbrRQYtWDWPwJ
         FPi04nIdPGKfPy9uSHlEPABtSzGjUNBGJWDnPke0m7ks1f96KeJb4wI673WPUVC0vc3m
         X/tzk9D1q9mq7ex9TXLf5tgvSLCaR+XrBqfYRNuOZ/lp5eKJtIWrfPwf/Ggr03vt4l9X
         HtUg==
X-Forwarded-Encrypted: i=1; AJvYcCVTutx1epCFmynQM9u4ZLAVb+lJG2ULot7C10oxe9ZTHhAcWGP1Q0wNTfP1firH1Qf6aSEZTReBdWysTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCVCrsnIhz7cZk6IowStmNvD3z9yaaB1NnhhtFKTB6GWTtNWsL
	woM1/B8PyzbaIF1WYLGe8ihpJokrCxefTegR1Dwb+bn1C4VJiN1x
X-Gm-Gg: ASbGncshyOoTi7n+HOfBlh0rz1rFoH6ZF0IX137oxinfwiH8EiX2v64428UTgqr3FMW
	ybNo6YnqP7XNyVMiXSdzwzwmTOpXLHM+DH4C7tFVjADkCCug1jSeOmcW+BHnuDHv8ubnimutU5w
	wgwTiP5k+eDIEnwcZOBJBRdqb7XyJi7kH2axlOwb4/ts1uxL0Ngx6v+Arn4utNmQkoq2eW/3O9L
	IEyUb9ZgNbVhKFASVLSjIg5jGlQFSokrOSeI1u0mCyz/OtiFPNCcLXSJ9BTp+kOet3nO7W+cXZ8
	1g==
X-Google-Smtp-Source: AGHT+IEE0yZnL/j3TfydHcx27TvYZq4HNVlRTjBaZb6s+lcBJ8etFGkpoweqrr6ivN/gIINJcC1idA==
X-Received: by 2002:a05:620a:2914:b0:7c0:a46d:fa92 with SMTP id af79cd13be357-7c23be11a85mr1282129485a.19.1740613377053;
        Wed, 26 Feb 2025 15:42:57 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c36ff0f1e0sm24115785a.52.2025.02.26.15.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 15:42:56 -0800 (PST)
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
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Guo Ren <guoren@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/5] reset: introduce generic reset-simple controller
Date: Thu, 27 Feb 2025 07:42:28 +0800
Message-ID: <20250226234234.125305-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_154258_924038_0203B1C1 
X-CRM114-Status: GOOD (  15.04  )
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
assert/deassert. It is annoyed to add device id to the reset-simple
driver for each device when coming a new SoC.

This patch series introduce a generic binding to collect devices
match the following requirement:
- There is a single, contiguous range of 32-bit registers.
- All bits in each register directly control a reset line.
   - There are no self-deasserting resets.
   - There are no timing requirements.
   - The bits are exclusively resets, nothing else.
- All bits behave the same, so all reset bits are either
  active-high or all are active-low.
- The bits can be read back, but the read status may
  be active-low independently from the writes.

If the device follows the requirement, it can set the compatiable
and reuse the provided "reset-simple" as base compatiable without
changing the reset-simple driver with unnecessary new device id.

Add a generic reset-simple controller, and migrate the Sophgo
SG2042 reset controller as an example.

Change from v1:
- https://lore.kernel.org/all/20250213020900.745551-1-inochiama@gmail.com/
1. fix title to mark it introduce new generic device for
   reset-simple driver
2. add "active-low" property support for the generic reset-simple
   device.
3. patch 1: update the binding description to illustrate the
   suitable scenarios to use this binding.

Inochi Amaoto (5):
  dt-bindings: reset: add generic bit reset controller
  reset: simple: Add active-low property support.
  reset: simple: add support generic reset-simple device
  dt-bindings: reset: simple: migrate sophgo sg2042 reset controller
  riscv: dts: sg2042: Adapt reset generator for new binding

 .../bindings/reset/reset-simple.yaml          | 66 +++++++++++++++++++
 .../bindings/reset/sophgo,sg2042-reset.yaml   | 35 ----------
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  3 +-
 drivers/reset/reset-simple.c                  |  7 ++
 4 files changed, 75 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/reset-simple.yaml
 delete mode 100644 Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml

--
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
