Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AFDC5AD49
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jun 2025 23:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lM72f6hMEEk2pUUQ0grOCuOx858zweVr2y1IC622Nhk=; b=3rN5PJr4NYuJV1
	h/GZfbZWGuccPlT/psk0mKxsyKVn1IA7e++mOESYaToljFtTIo31qOOSGZ65FnwpslcpxV7u8YbXR
	k3bcMmB5e1y3DmF4x18+XnW8yL8svjbL9/lPQXEhWA8pnZGnlMArF6DyDOWKG4JqyicZNAs2ybiB+
	N5kSQOy4ZU3q6XnB8MZba3XoB/1zhKLGttoYLrQQzmFDj2N9BavjtIYxWCekJnntIfQRpxGAXKNeO
	EvbqXf7jobIyaOzekOlmwrapFH6fe7yFE0/RMhMxb9+LRlWVmwMap5TzqXHmn97wFSUhG7DqM2dKt
	7udrECkdcMWdEiWS9rlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPMR-000000036Up-0TcD;
	Sun, 08 Jun 2025 23:23:31 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPMO-000000036UV-16Au
	for linux-riscv@lists.infradead.org;
	Sun, 08 Jun 2025 23:23:29 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4a5903bceffso48327141cf.3
        for <linux-riscv@lists.infradead.org>; Sun, 08 Jun 2025 16:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425007; x=1750029807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B4ztGDayPcphCzpFWNN1YhJ9kz12KF6Ra5BCbScpRJE=;
        b=BCcQNb5MXEdPTai6xK3L/Aqxs/vh3nNuVg43KjotgB/CLRBrcev1uGKNH+lJOoK5u7
         Uvxias2cjGq70yVgGZ5hFmIj2tgnLM+o0mbJqPgqu1tXIMhUjiOOa+9ulJ40qIp1zpxd
         l4PP9lGYeQVYgeJvRQBAh0xJkj5wf6uzeL0iAvFR1DOt7KcV+pOMFepwca9BjuMtQf1/
         tD1klD7+BX82i381bQ5nzR3trTuEYQN0g6+1L/gcTMWI3pUuztBk21j2zTus0emxo/OG
         SJRSM1SklqBkv3D59/OVWp6k9nKwKPQvzYtxmoXq2LAjs5LK6VJL0rWTs5n8gUgGf9LG
         uS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425007; x=1750029807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4ztGDayPcphCzpFWNN1YhJ9kz12KF6Ra5BCbScpRJE=;
        b=RjUVvaWYS+0Mf2Wr0MPBcfroXdl385Uq05uSzVUQFY6pTen71HQl0Ri1iyB63S/inv
         cHux9zSVsnbnpND26wa8siO7sotHYdDo6GqkkCn3GGuOJZqxJ+SYDwub39cN9hCKuQLe
         7tgAGcqrD5gWZ6V383nvw+ca5QfVXFklMwC1AdX/gDzg3w4LhVmFD5q5xuDDSOkv6LN5
         ygV92oscuX/xtBO3iOmPyZ2YnLDbs5N6kvyu3Qhdjoj8AuYu3B1k6+G9gPc73F69FAEX
         MrKBKoJ2+3lFcbybURd+iYwpBPifE89bAEsv5cxQ/2VfGmewfGlTktbE20tKgL8wbuNw
         /MOw==
X-Forwarded-Encrypted: i=1; AJvYcCVi9yhos9PVOKk/2gyA2jpWMHxxD7Ho7AAZ0ZCzzpT5m57yXDPstP1d7sXA4SZNRZphA7GcG5cwe1RZaQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQKCA7/5eEPHFpuDDwEPtQz0qz/TBW0YN6UK/V35NDDPPPZOEr
	6MgXROkLkua/hBoC2mq3b1+0Ay6IQJ2ZSgHDSwWU9jSXj+2U62C4JdJz
X-Gm-Gg: ASbGncur9d4g1Ho/kDyzoJRhZgBlFuPiUc1CUUb71kOnFPTjFjsDruyggQwBSLe+bMA
	6oR2EhOre8De2mEpOeqgiXqroFqk3WBowfe222j8oikAr1d2jpe76Nb0PQYxMFkHiKSHxYHxa8g
	CKvGUdtxxh6ZBEtt30EBA1DaXkMyeqv3ViAwkgu0xguJIqYAXvRmGErBHp6RrvxIWsuoV0WsjBe
	+TG2oYTXFNqhnR5hmMd25aIWKNPX2S0mZ5KHMYn9XnvJY1XjM6f1rcMIRA9iDr+KBA57JCNS5dD
	sktqhYKK/JttskoWa6SdGI/pTZs=
X-Google-Smtp-Source: AGHT+IHtUJpvNl5aNUZVpUdg2XqDfl4bs/f4Qypy9pWtukoC9Rh8xegAclLHRNalOR8QtthxDIY2QA==
X-Received: by 2002:ad4:4ee6:0:b0:6fa:ff79:2cfe with SMTP id 6a1803df08f44-6fb08f6d9bcmr168703316d6.12.1749425006716;
        Sun, 08 Jun 2025 16:23:26 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09ab8a25sm44213946d6.13.2025.06.08.16.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:23:26 -0700 (PDT)
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
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/4] riscv: sophgo: cv18xx: Add reset generator support
Date: Mon,  9 Jun 2025 07:22:06 +0800
Message-ID: <20250608232214.771855-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_162328_305435_64FFA5E9 
X-CRM114-Status: UNSURE (   7.88  )
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

Like SG2042, CV1800 Series SoCs also have simple bit reset generator.
Add necessary code and bindings for it.

Changes from v1:
1. rebase to v6.16-rc1
2. patch 1: apply Rob's tag
2. patch 4: fix wrong reset ID

Inochi Amaoto (4):
  dt-bindings: reset: sophgo: Add CV1800B support
  reset: simple: add support for Sophgo CV1800B
  riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
  riscv: dts: sophgo: add reset configuration for Sophgo CV1800 series
    SoC

 .../bindings/reset/sophgo,sg2042-reset.yaml   |  1 +
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        | 25 +++++
 arch/riscv/boot/dts/sophgo/cv18xx-reset.h     | 98 +++++++++++++++++++
 drivers/reset/reset-simple.c                  |  2 +
 4 files changed, 126 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h

--
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
