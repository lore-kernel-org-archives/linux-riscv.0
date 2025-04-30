Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55001C3ABA5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 02:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FA5SbKLncZ91ErojqYdnCOZOefw3svld2FaQtw6vGH4=; b=hmof9VP3cQyapc
	oLx9sQDpBnbgYY7WHkbmyuQJSRhpaKIL+x8qGGlGsF7VMie+dutI5KONHPE0TiUkxGkYYpc81qKIn
	IoiJCic6QDqG/+zjDrpDt2O1Y88/EiFKNJftCTF+A4I8o06lMPHAFpyp7ZlngbAr9FOWp4oIq3j55
	O7DyIhbFq4VI5VFUzv+KmmQjwm+QWUwuPFXuKp7Ej9QXJcmdxEl1Y1q0XsFz9Sg+Jp8ZmRZOkjpus
	QAnJbDrR20fJ0U5G7mCEs4PC+1ICG5SNnlf8MLitNqaS4cC6fVRbHPeXhFIY3eLg9G3qkpJuAzIUS
	c0xODKrbbjd+I7P+oiYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9wtZ-0000000BUpM-3evQ;
	Wed, 30 Apr 2025 02:09:57 +0000
Received: from mail-qt1-f170.google.com ([209.85.160.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9wtT-0000000BUoR-3E62
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 02:09:56 +0000
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4767e969b94so152024321cf.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 19:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745978990; x=1746583790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gMRCqnYomW+wsK1zzIEugxafFdeEE4BP1eOXuKoDm5I=;
        b=CqSPQvMeWymfrRFqzsTi8ynaERo1LWHseKRH14XtyyKBLmyKAM1NvxNJvM26Gw27o3
         MvmmvWY8IIheTGqEHmPY35fctRYP72vmKHDt/4aHRGGFqRMvy3xgC0Riyk5R2Hg2VJW3
         fHFn7peNxLmH0j+F60wKQpLp25/29u3zuNPjMsMZ06DI6d1GfPc3gwFwLUzrvebfWL5V
         xgfc8rfaNu5w2j/+b8tO8Myw0kWOpH/R7el9MN/8zn99/Gm3UqbeoSlGh5DJVvDPQM2H
         TAl45HAKZRH9SqFNiVGx3xIPOQGhKaedj7yvUbnvGjda/c9GmiRvXYZUGNtgP0sfBx4w
         5jqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745978990; x=1746583790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMRCqnYomW+wsK1zzIEugxafFdeEE4BP1eOXuKoDm5I=;
        b=PX8ITJf33GtO8mCkqv7M8GZV7stdFKtvGhxdumBDOxYKfT0hLOiWmhT7UpPamEvU3o
         enM0DFWjNTC2sm+C+xm+IPbkDEW1DjYVrV7xpwDv0gi1szrReZeoWw4gLUtdvg8uNpgt
         XhWZ69Zb3sKBUTkpRuc5eMRnz0xx4uQ5BGgQ+XowUhdosiEVRr+/+4+qbk+tYdm+mGbL
         oeNu7gLBpDnjZ5WAICcaN+hvP5EmGpj1ph7Xgz1sm4hL/Pt5km/jbFXdTt3e04+lm5eL
         ZU1reiM7jYQyfXKKR9NmrItPp3SER+N0+sVm/wUUoBzTI2OrHo4lNNFccyShmF/FGHPD
         7S5g==
X-Forwarded-Encrypted: i=1; AJvYcCUbfCvZkq2PFodysDrlyO5mS9hujl5VsyH8cuVUtnLl7sRzJ9hgJ9yiPxd/OYmTHz9vr6gUiFmN+GnQlw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzO1aRmV6Upo4se9JO2KVetEl1Kw/faqcwO1g4Yn7qbxtEOuyD
	MCjrf4Ahb2aXmM1c5dpWrssZKdsXjhDpnE8VB+82K12Q6xGvfraD
X-Gm-Gg: ASbGnctQrqp1mU32/muSxx1plk5M41KwxGZRRDjYrIXv1TdZUffml3wgldXoVmWJ7aQ
	wfyP6UaxhzHBPfrBDAxNJbPBXc1EbuNCcXzNI58z+WFSSMp+UgunCl/EjEpLtLRvA0xlGxtYn6P
	tV3vpJdzPEknEYrtQhlEx1CpU+8Cc59/Q5PSsQkfppSoXwEpuLV1W59JE/mdrf+MXfjg5KbI+Jf
	WWsxkF0tlgprfecOH/3OxkUZowwy94JF6bWGs3bK2DIh3cgahOfetZdbXgo9EzwmYLm7I9FFeHh
	GJBsNW8fbL1X9gBS
X-Google-Smtp-Source: AGHT+IH3QEcqlp51tOnN2l6ZLTNjrQhnIbAtp++1IB7gybN/d7hCg0IFcRClQaapkL+poJtpoZTgVQ==
X-Received: by 2002:a05:622a:2617:b0:476:60a1:3115 with SMTP id d75a77b69052e-489e63d86fbmr13994811cf.33.1745978990109;
        Tue, 29 Apr 2025 19:09:50 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47ea1ba2868sm86855891cf.74.2025.04.29.19.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 19:09:49 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
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
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/3] riscv: sophgo: cv18xx: dts rework, part 2
Date: Wed, 30 Apr 2025 10:09:28 +0800
Message-ID: <20250430020932.307198-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_190951_807830_DE726B21 
X-CRM114-Status: UNSURE (   7.69  )
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

The part 2 of dts rework replaces precise compatible for existed clock device
with old wildcard one.

Inochi Amaoto (3):
  dt-bindings: clock: sophgo: Use precise compatible for CV1800 series
    SoC
  clk: sophgo: Add support for newly added precise compatible
  riscv: dts: sophgo: switch precise compatible for existed clock device
    for CV18XX

 .../bindings/clock/sophgo,cv1800-clk.yaml           | 13 +++++++++----
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi             |  2 +-
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi             |  2 +-
 arch/riscv/boot/dts/sophgo/sg2002.dtsi              |  2 +-
 drivers/clk/sophgo/clk-cv1800.c                     |  3 +++
 5 files changed, 15 insertions(+), 7 deletions(-)


base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
prerequisite-patch-id: 94fb3d26e017cf839b4dcb4bf85624614a94b9ac
prerequisite-patch-id: 8f4a8bdead0e4e3d6904adbc0fd150b7dffefc85
prerequisite-patch-id: b30e850690903c3ddc3d8bb77a99e97934dc9dde
prerequisite-patch-id: 6e1117694a53a0059b145ad4751ec204cae0db35
--
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
