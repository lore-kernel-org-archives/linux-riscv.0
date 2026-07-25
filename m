Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B99C531D0
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 23:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e8UCoKbXuVGSifJkWE54fTxQ5ke/AhsnTaxE9EAzB4w=; b=w/VeCrFfiEamfd
	k4sZ0GK3nl/Zwo3PBpRS1trs4xjnNnRCoNt7CVIKNJeKuk35QpqpVZq5Ey/z11EYnsyuQJY7b/LVw
	vEK6YPTAbqq6MGGiUOfVj5TOo3oTRfwhe277thBtOMgVfblQyS1i2tLK4VXz1ewPy7KpOdeHPtjtJ
	K3noDJLkFD93QI8zk5eQdIYS7hp+XDp8dKm//GEYWqYJA26FAvKTLi9QnvAFOa9R7PXK/WCNYWnjP
	moTMKk+tnstUlFdP65/KEyYzugERrJVxNyrTKFeMSvXF+WiB7joubZimB/BGlJUJ4hegkvZo4OPly
	CTOLN8jyFpxmbvn0zuvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnlsa-00000000lyH-0lpY;
	Sat, 25 Jul 2026 23:34:04 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnlsX-00000000lxv-0Njf
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 23:34:02 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso16786585ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 25 Jul 2026 16:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785022440; x=1785627240; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FZe3o6MEZnJBcnhQqox2Guu7ytbKOYx/UVedKiDOk/8=;
        b=g5psoeJwRNJY0hDO2x2uCfpCjGzZ1bf45J6pDpQDQsdfYzpQkBAOIwrEX9zzLAkBDe
         nzH0vOXNadTbI7qvwx7f+6/8UUTbdF+kenXABP73Z0PIHSfSAbgQihY48InIj7PI6Je2
         oXbusdvdm+qs3jR+IoZ52DL9DhzqUJOBqNQbMioCzkSjpGrdKvLcOYX3t5ebD0dbI4zF
         aIIvvvvaHRZZYfelxbHuTJ7f7tIv6NYxZ8MFP9Lwc+n8Xp4XhoZJfzEnkh2SBLoysV+t
         +YGbntkd2BNX4xrCf1vFjNgbm1PKxS/s3kG5BH7kdzcA76bW/3SaMlVOe1aaQclgNOuF
         6OBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785022440; x=1785627240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FZe3o6MEZnJBcnhQqox2Guu7ytbKOYx/UVedKiDOk/8=;
        b=PVSD1aSnCxNwBSTzcJu3R0t9w1vOBBhnBhkjIz6Gqa7R/E0Zv5wrv3fjrt32tk59UX
         BywFSmBXUnFmeMJfMGBnbW8AEurkgZbsWQzxxak7ll2lHcNEdpprK7//a2iS0qbDfSST
         v9SvG4Tk2RSUi0AlgrmBGF6gTRFfAM5JqsPGU1R95AOw9xy+9iXqecBl+HIZFJo3Y+pH
         opmtVf64kAJJR5wyTTSOceuWyMLbUOItzq+AwGIMzisn/e1gBFvS0Tst8eaHLl8WRx3t
         VS+f8HI/xyid5/ullWxm3IaumFirCy+rm9AbbtJfsY5P11gQUkac0MB85Ixs1QrzyTlH
         Lw+w==
X-Forwarded-Encrypted: i=1; AHgh+RrRK5EFbmRPuB/XtueQc9Jz69TWwZ3TlbsBz5OXxOCNN5tOaIMPzPb6qSoIuhpEZB3GYHMFWlKZyo3OeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEBm8Vmb1YWdWLnJpOTp062pT7Rc//M/BB5CKb2aXeEBKtWmmW
	ovbLJHzOKnFE4MgpqFZr72xJjBFBdI/nmHvGy7sIMPynhejiTnANLnea
X-Gm-Gg: AR+sD11CILcycWw/zKw+A8RiVMKeQuiYKJIg6QRp8GSKdudYHCBoQS8W59DKqfZGL0w
	UonIIxF02NSSAYj1gIOS2cWtLgFoj1TwN5d7PojJ5BUBTuj3hfpkvUVBUKc7l9V51dpMC7ZfKeG
	1cOf1zX2T4agZyduCR17QU5pgq4iRSWQgwZgPX1yAdJo7LBpHuaPird7flgeLzGQ2R5MvtuGFPJ
	b3PhVkOG8vIt00kO2BXa1AFVX/s04igAuZNe5rfH9uu70xVrsWaLUDCmfKNAsOi/1CJuWQZC/zI
	C5ZbInMnpU302Nj3Q40ScEh/ZGnGwojpbPGdIx6wTbP3WSCp00wn/pLFZbhMamIjDBNM9du8Q/K
	4uoWo1h5fLCYxCBujmL8D5YyJaursGgn4UVyW3ZPZtKZ4d8WIh+fZoTH++AI0qKebFsU/P8eXau
	Xy
X-Received: by 2002:a17:903:3803:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2cfde55df36mr33858585ad.0.1785022439897;
        Sat, 25 Jul 2026 16:33:59 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59bb2asm13811605ad.10.2026.07.25.16.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 16:33:59 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/2] riscv: dts: spacemit: Fix phy id check for the phy
Date: Sun, 26 Jul 2026 07:33:48 +0800
Message-ID: <20260725233351.55004-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_163401_171091_96416B8A 
X-CRM114-Status: UNSURE (   8.94  )
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
when re-initialize this. So add the phy id compatible string to the
etherenet phy, so the phy can be reinit successfully.

Note: separate this patchset as two patch for backport if necessary.

Changed from v1:
- https://lore.kernel.org/spacemit/20260725005804.373698-1-inochiama@gmail.com
1. Remove all the c22 fallback compatible.

Inochi Amaoto (2):
  riscv: dts: spacemit: Fix phy id check for the phy on pico-itx board
  riscv: dts: spacemit: Fix phy id check for the phy on com260 board

 arch/riscv/boot/dts/spacemit/k3-com260.dtsi  | 2 +-
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
