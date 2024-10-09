Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA98CEE35E
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 22:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CvKiKsWWiNajQH9H1vmjzNQ4qTonkITNySP59IwRe1Q=; b=MHHHyPghrccg97
	HFEfzQ+HNsGlo0GO3uqGpGKfjjjdd4X/OtPKen/kDZL602NLqg7gBqt0oY1krcbHOUtm5jmEhM33g
	IArL2o5RkuD3oyi0JIJoOYsJfwtCezjijzrkK40oTdGJCmwJS9pUVZmQO/gpVZTUEpezfTX/zLEgr
	bRzVVDTVt0GnKGLTQ/y4u/y/rvC4qbCGv7SOZakSg09sd6kPMOtjxMPws57r3PX0iUIPQ7mx4tFvN
	RZkehKrIoyQB8ktS+GW0RTqx7gZdvSehobZRbj/IB3PriZJOqECDARLYcVM0XAsjOXgvdF9IgO0jq
	cfVFIS/5vGmKNuLthiQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syfS9-0000000Axue-0IuK;
	Wed, 09 Oct 2024 22:46:45 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syfPy-0000000AxHH-2xF5
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 22:44:32 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-71e053cf1f3so290336b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 15:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728513869; x=1729118669; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SAqV1+XKBU0ibZzTqowSJdJy95bA/qKE5pksfpbym7M=;
        b=BD0HHS6Kg38o8eIpnvQM4DnbvGhLL2BFIhQHKWJPwtMwtmLRinf3ceuk8HwF523gS3
         qRqRHDYRc7G6nNag23nSmq4EQfVUOfNisYD/uxT6jb7xbTjmlyNw51kKqeL1UF2EKei6
         Z6Crbou0wgs7VF4B/uP15iR81hzdz/BBVljAzERx1JPc02njkTfoJ3mo1p6r97OBllW5
         KmCKUHtU6LXV7judppXR0dvZbfW+3006VOUbRXINh8x+jFCLpqMaQHwkhirSfLDRS8aG
         Tcrc/G22NHsWmZPANY+M3rg65NkX7EKpQMSt1xnccpH+bjYZLWceC9rKiUxhiTGQgZ+i
         tmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728513869; x=1729118669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SAqV1+XKBU0ibZzTqowSJdJy95bA/qKE5pksfpbym7M=;
        b=WKzHgv5iR/DlClETSPYHEvSOMnVJsu9vuTqbiG3hk2NP0oRIXsSaxXDp/aJEvsOt2B
         fYsm7ThkEl9nrO+EflewxEBXMLSEgYZzrRNhwYMotteDGOmvkjp2m22RfoUyuTgyBcQK
         P5QKOYLPGjWA6hwHXa/7Dy1+Bv2oiiv7gyHH6IgVz46G9Ha2RN+4v+wyKKbzn55t9p5B
         Rpx/eZS1EuGhiEEYjk/cbrgNXhshqfzR3zEDTvfx+u3vdVrQyWtMnJOd5CSyq6o1efK5
         hpq2j8PUVuqcj1H2/D/qiyUciRjDiDVvceaGmNIZ8l9+zIpC5VzfLTqOSZ7i3SNalVzM
         OAeg==
X-Forwarded-Encrypted: i=1; AJvYcCWCozjn6V553dt3bavRwO2EGVHu/PZe4Ld/GJmeRzTVDFR3+9gwey5RkgPyyG5BHD3JKE7lEpGLQ2ERaA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFGHrEVzNk0/qRSDRMo3QJXJwFgPUTiS9GDG3WJrb4sqSUJ/Sc
	3kI1eHlqcgprupIWv4NKnfJCaH6xZpSpDkMkunAyX3HsghMT5wk5
X-Google-Smtp-Source: AGHT+IFatcjWm8UlaGOqXGTu48oCcmbyCPQ+LLWHuq02vQyWPDOIHrcrLuyoAOJ4nSZV/zbICyHHwg==
X-Received: by 2002:a05:6a21:3482:b0:1d8:a1dc:b43 with SMTP id adf61e73a8af0-1d8a3c1e436mr6326797637.24.1728513869388;
        Wed, 09 Oct 2024 15:44:29 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d47edfsm8237666b3a.128.2024.10.09.15.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 15:44:29 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Guo Ren <guoren@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Jinyu Tang <tangjinyu@tinylab.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yixun Lan <dlan@gentoo.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/3] riscv: interrupt-controller: Add T-HEAD C900 ACLINT SSWI
Date: Thu, 10 Oct 2024 06:44:06 +0800
Message-ID: <20241009224410.53188-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_154430_770129_AB92C642 
X-CRM114-Status: GOOD (  11.22  )
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

New version of T-HEAD C920 implement a fully featured ACLINT[1] device
(This core is used by Sophgo SG2044). This ACLINT device provides a
SSWI field to support fast S-mode IPI. This SSWI device is like the
MSWI device in CLINT/ACLINT, but for S-mode. The only thing is different
from the draft is that the T-HEAD version SSWI needs to write 0 on the
SSWI address to clear the IPI.

Add full support for T-HEAD C900 SSWI device.

[1] https://github.com/riscv/riscv-aclint

Change from v1:
1. patch 2: use computed reg offset to avoid uncessary reg additions
   when setting/clearing irq.
2. patch 2: fix mulitple format issues and improve some comments.
3. patch 2: disable cpu irq when CPU is stopped.

Inochi Amaoto (3):
  dt-bindings: interrupt-controller: Add Sophgo SG2044 ACLINT SSWI
  irqchip: add T-HEAD C900 ACLINT SSWI driver
  riscv: defconfig: Enable T-HEAD C900 ACLINT SSWI drivers

 .../thead,c900-aclint-sswi.yaml               |  58 ++++++
 arch/riscv/configs/defconfig                  |   1 +
 drivers/irqchip/Kconfig                       |  10 ++
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-thead-c900-aclint-sswi.c  | 166 ++++++++++++++++++
 include/linux/cpuhotplug.h                    |   1 +
 6 files changed, 237 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
 create mode 100644 drivers/irqchip/irq-thead-c900-aclint-sswi.c

--
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
