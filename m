Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5540BC531FC
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 00:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QUEG/o4sc+Rlz7PsU1Oym9PZDBJCY1Yfkac3QdrfNgc=; b=ZCUPkWzoChSLy0
	xrJUpZIyagLzKU0OR4wMXMfiQ5QPjkydj7kLveoPhMbfDJrTs3peUqrXfO2ccYTjxLOc55LYjvkMZ
	WmVSuBs0O3PiaHHg+W1JqLOHv0fXdliQ6frpnkQlTdKu1B2Nff74B1njdUbQAKlJK7N6tW+48t7Nt
	vwI3u2TVvXyVrbN3JPwVKSso+uq64vaVgkWYi8f6kQN/pYE36a8SBxiBXdKy7iW/11JJm1W6tL9DC
	1hsgkSQsYbK/Zq7tYGWsM2ir8mawao6/2gopkeiOzzmj4zGz2nBaijmrjeRiJcycboZYmVt/NB2sX
	AXa3kEvVi0MyfNgiYE9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQiV-0000000HQSd-2ikf;
	Sat, 25 Jul 2026 00:58:15 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQiS-0000000HQSC-3QVM
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 00:58:14 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-848643382fcso1125311b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 17:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784941091; x=1785545891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3RPSKOAGTuMe7DirYFHsiGB/35uTeF1WdVdXjVBBsZg=;
        b=ij0sjsnfXYrViqSpaErZAAdyHtT6gEeV6/KO6HnistE6ZWM+JnjlWmfzEqgdG/0z9l
         OUoC4B6H59Jd0i8i+9VhZQQrnNJR9MCcgJYJQoeFuh2U2Ot+4AMx0wsWFbWUbSOMxibX
         dlWdixxxf/Lis5HoQcYM2wsIg2N6L3h3kGPQaumdmdfcslpCoZ7pIp3zqjsKlSycDemV
         B8MUhHzDQVXJSx+egkiRyssg5WnYZzClj7qyFZkWqlywrL+nTSWfoTZOcF19Q397Uiwb
         Znc/rvOyUgXMVDKsE4ZDZWeNodb4mEZ9QglVi5aHgGSbZNR3YWI0j5te6/Onl5egdTxB
         mD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784941091; x=1785545891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3RPSKOAGTuMe7DirYFHsiGB/35uTeF1WdVdXjVBBsZg=;
        b=eX99zA3uzKQX8SoAv+a0qrmPzp3PEwNic/63SLNpjlWtR3GbEY3TFWGc/gA7SmPbHL
         UUTSZPAHtYZjEpMCeLrAc6wYNeF9A5jStBcE78s7HOH9LdqpXrTsq22IrlYMw9AtrPZ8
         B/qMG6OvN9KA3EHxKmiMhCW2GKYmRlRRti28f8g8q7yQrEPsKrvAE9vq2MTPmbD0aIKm
         Bw2lP3MUOhHrKi3ylTiZqNuvxXGjJUaESEp0fhjvvKZ56ZAHY0MPhRSciUoQc1A69Q6W
         orP9KnDhPoDFry3l5yOfykXfX6L6CwAXGm8mAaJzNLc1bh7Na7KdWavfikS+hIV+QMB1
         RoOw==
X-Forwarded-Encrypted: i=1; AHgh+RqDJgWWu5yIVjQwwhyYLmFnxMyQ5K947z8x3na8yAgkcouyP8j6WNF5WqPjVbm6/W+pwNL0XttCr6Q9MA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKbz441rgvBUdC8XLiNDda+g0VBfCnCUniEpc+h7ORX/rTaTMN
	pYStPTZf4IhYzM1PGrdmQJT5H1LDiTJ7ai6sAI409riIOTab98J84J7i
X-Gm-Gg: AR+sD13wMJFnWoO3d/x0zzIfCgR8nItVEBX26tU9iOtHUXxpLBRNBWVUGDHUiVx/ROk
	yPbfJRTuopgI027wfap7KTooLsFgBwucKAYBq9TTRiGMztGVp/T1kDLfPp74SrQVC25Ysd1YMek
	lZxeEeg2HioFKIaGqF9FyJgUNfd8mZo96WTU/jXn5rN8ey6ma6EcGG3M68rQ3nbsuWeGWiox87L
	Prm0lQ0X3QUrjQqYS6HsLpCON1VJbnyguIXF80UzQaw13rWuCWNDlj08FtevFMba0eGWqX8qKU8
	Djqo189i3oyQAe9QBzZ4Ea5JpiWV2cKvLIgUH3jhT4Z83Mk4lOi075EDA0sIqMzOFG6pUV7sbMT
	NIADxEA6jVljDU6RHqAYJTz/KOfIp9YnDxNp0Au1Nodz5CYgbfPnOta1C15SqBvjKav+yGqZU
X-Received: by 2002:a05:6a00:4c07:b0:847:df4c:40c9 with SMTP id d2e1a72fcca58-84e595543b9mr406839b3a.46.1784941091167;
        Fri, 24 Jul 2026 17:58:11 -0700 (PDT)
Received: from localhost ([2001:da8:7001:2000::1:5491])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53254f57sm566254b3a.1.2026.07.24.17.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 17:58:10 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/2] riscv: dts: spacemit: Fix phy id check for the phy
Date: Sat, 25 Jul 2026 08:58:01 +0800
Message-ID: <20260725005804.373698-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_175812_917396_3676F405 
X-CRM114-Status: UNSURE (   8.24  )
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

As reported, the phy framework can not detected the phy id correctly
when reiniting this. So add the phy id compatible string to the
etherenet phy, so the phy can be reinit successfully.

Note: separate this patchset as two patch for backport if necessary.

Inochi Amaoto (2):
  riscv: dts: spacemit: Fix phy id check for the phy on pico-itx board
  riscv: dts: spacemit: Fix phy id check for the phy on com260 board

 arch/riscv/boot/dts/spacemit/k3-com260.dtsi  | 3 ++-
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

--
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
