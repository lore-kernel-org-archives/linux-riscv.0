Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF92C7113D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DBPYFwzIAAfA3z3bYIwxPdxjHRZDFVmeBUk2NAX+vS4=; b=ijKizLZKvZikgB
	MtVxu3cabBykmzI+wcbyVHijIrkQJjuHgcP1TQRqZCXleTeZTuIQOniRUtaKUDQ5oh/yhpIpiE5r4
	dGOrDy4NW0LDHqSZvuBW26Q3MkrgWdluenVExX93Ko8uDY0oQNo9h2NbxGZjyzgVZ5tsbEeFX3Hoj
	uMFDUq7lRQNILXLSEpaBU1GeKgyWgfRzi3Bk8+1fLLvrCCRb6euePqjwZZrYtNzUXAxM6udkDwHXO
	VincGINr6BqFklu3m++GP+yhvDQGbYE6HM8q6H9/v49e3oKaovnBZ4xlIqqUZW3mtqALXTddztsDx
	xneX3nOPNUsTVVYZig5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGw9-00000009Hin-2ryy;
	Wed, 11 Jun 2025 08:35:57 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGYB-00000009ECT-1VjV
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 08:11:12 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4a5840ec53dso76511751cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 01:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629470; x=1750234270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZZMQxOY3jdiUUlcRVmJEoq9jtCkBekBHkitKdRBzHk=;
        b=D7YxFrOzzSFic3uyqXPYMIbBmOCL/K9pVmBAooG36hhve33L9DUWCcSphM3XV7aiaS
         K7YNWmoNlLT/nrvojHPcf+XEgmvIjKu6cpjW3mwRgFrqCZd0TZdDKl9HcVk0uPNbLk7i
         /vRK832CfgYz8A+9FoCDdi8M/Uh95A3GnOXRo3ulU2fev6PJGrP0rCmeXSz1Qs1sNPtf
         paoMLly9BTkB3tPWiOY/sY3G1RUMp5RKESo0zwnEg198TSVOXbmOn+LDuTNmi0FWJJGH
         jIu5JRzmACdUqDH2/+CtUwtZewztaL0HLQwHtjTF8IGtMgscPF0KYjOahlYkN6p3HnY5
         /Irg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629470; x=1750234270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ZZMQxOY3jdiUUlcRVmJEoq9jtCkBekBHkitKdRBzHk=;
        b=S4fV5vIJJ7uxtC8eVbrPxhd786HnM0Hp5osEBzJoR981JAmDeJO5xO09CKqfRviVNp
         4fbaiurlGpvYMdaDWcJwC+0wt4TeJgzby3qF68diuAJrU1dEF++8YcNwJFlHRHIijOVu
         WNt5Uo0DLBuBUrY5BOgyHI4PSIaYENzUjRa1ziutirW8/CcsqDI12zAQsS+hWsATsD3B
         x5AZ6U8pWjOd1g6ur3FR2nwRO5oCgIRyXKVOJEpCkJaGyj4KhuIhSWiK861LigpZVibh
         +lSs8EV9ORJnBoSddIQIInUh+ewCeojb+avsjlRKIhydGfjm/zHY/VFRvaV56/5CsZz+
         yBCw==
X-Forwarded-Encrypted: i=1; AJvYcCXshbmFcek5HxzDEPMUKI54rFQI4XuIYHz/YvewIg0J1YKwPwEAKwDHdLWJoufaYgsnn/+I2n41IiVKBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfMHLmD3YJeUcjW1LvsxcO0eI08EOoTiJs5JILc695eKNQtm5E
	70O6TDR+/a4CXwn1HxY90FgvMh9EDXya/bhZ5Qp2bHzCzOLhXNZ/hJWa
X-Gm-Gg: ASbGncupgsGkcgSqH9Xu74BkQXTvKLYRpGjxT68wnx8tBr8BymyIacA6QTj4GZANpSm
	+2QcZ0KHCP0R6SdfN2vjP7W3cPOP395EdbxDTA1lEb/6pA+KESl89BDEcP7BkeKUDa2ZhtLmJkD
	ISyteHRrqL8jPEoJSqTYeXtEQCAPupVR+u1fQP4TxOtcgzhDfG1CZITQiAZolDrajrgtaWBuSz7
	gepldfb1NLr9+94Cy0IMkVuM1ufisrbNtUbe52E5s+rlBT+DREumFZUdB3g8ADcK3P/cZSTYk4g
	f9I6AnSjMgFE8442uKcI6aslRkAoce3iYIgxJOUZ2bE37NeP
X-Google-Smtp-Source: AGHT+IGZnue+EG+14/hjDiRd+e4Wrn0+S+QrqOcOTcR+sr6Io4g4wyFZ6oXcvJFQ47foHvKNUa181w==
X-Received: by 2002:a05:622a:1f0c:b0:494:959e:26a3 with SMTP id d75a77b69052e-4a713c41a06mr39119801cf.34.1749629470186;
        Wed, 11 Jun 2025 01:11:10 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a6f5c7a22esm57218951cf.54.2025.06.11.01.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:11:09 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v14 0/2] riscv: sophgo: add dmamux support for Sophgo CV1800/SG2000 SoCs
Date: Wed, 11 Jun 2025 16:09:57 +0800
Message-ID: <20250611081000.1187374-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_011111_398622_D60E8EA3 
X-CRM114-Status: GOOD (  12.06  )
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

As the syscon device of CV1800 have a usb phy subdevices. The
binding of the syscon can not be complete without the usb phy
is finished. As a result, the binding of syscon is removed
and will be evolved in its original series after the usb phy
binding is fully explored.

Changed from v13:
1. rebase to v6.16-rc1

Changed from v12:
1. remove syscon header and use local offset instead.
2. add COMPILE_TEST for coverage.

Changed from v11:
1. init all the field of the driver data.

Changed from v10:
1. binding: fixed binding id.

Changed from v9:
1. binding: rename to cv1800b-dmamux.
2. binding: remove the unused formatting.

Changed from v8:
1. change compatible name from cv1800-dmamux to cv1800b-dmamux
2. use guard to simpify spinlock process.

Changed from v7:
1. remove unused variable

Changed from v6:
1. fix copyright time.
2. driver only output mapping info in when debugging.
3. remove dma-master check in the driver init since the binding
always require it.

Changed from v5:
1. remove dead binding header.
2. make "reg" required so the syscon binding can have the same
example node of the dmamux binding.

Changed from v4:
1. remove the syscon binding since it can not be complete (still
lack some subdevices)
2. add reg description for the binding,
3. remove the fixed channel assign for dmamux binding
3. driver adopt to the binding change. Now the driver allocates all the
channel when initing and maps the request chan to the channel dynamicly.

Changed from v3:
1. fix dt-binding address issue.

Changed from v2:
1. add reg property of dmamux node in the binding of patch 2

Changed from v1:
1. fix wrong title of patch 2.

Inochi Amaoto (2):
  dt-bindings: dmaengine: Add dma multiplexer for CV18XX/SG200X series
    SoC
  dmaengine: add driver for Sophgo CV18XX/SG200X dmamux

 .../bindings/dma/sophgo,cv1800b-dmamux.yaml   |  51 ++++
 drivers/dma/Kconfig                           |   9 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/cv1800b-dmamux.c                  | 259 ++++++++++++++++++
 4 files changed, 320 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/sophgo,cv1800b-dmamux.yaml
 create mode 100644 drivers/dma/cv1800b-dmamux.c

--
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
