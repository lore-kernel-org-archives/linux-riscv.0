Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AC6C71136
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+0CwhRxH3rRUpBXmKcN9Rsvfm+4Z/rCkFtP9EsqUAMs=; b=mOmMU354JbRs3V
	NU3egYQjuC5VaazlYVLzLD1FyzWGBDzAh06c7bZpjKiflrpzUYcHk9xljhYuPQZUQHtgIizlss0nQ
	TceZX9O82KWy+/GybOhUtwNjEOJ3fTKaQx6H3SlT8mpWpkHQWo6THd8xCN14nbOaD3IeuG9tvawCu
	qpefcvSFfvxZHGznaJUbAKQRk10YKr3otpwjzd6h/wtM6ZxmYIgLJJmtJwUMvop8lXvFTuK+wvUT8
	dAf1khFHeJQ6KQ9heegFt5ViITc8vJqYa2e1hwK3WronOAFPmScBLU+7/GePPgRhvLqCPR0DyV3/X
	BlXASsWXuu1XgmMc2ZqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGw6-00000009Hgm-3Cat;
	Wed, 11 Jun 2025 08:35:54 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGVQ-00000009Daz-2btf
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 08:08:21 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6fb01566184so52690636d6.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 01:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629299; x=1750234099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NyvR/aWRBWqhSTIVuqpj6xfB7efefHvQ55Ys34H+rzc=;
        b=E0H2QHNP4/1PYXMuyTVN/i/UfO+DOIDyAhZd3sI5aXS6t2cJJ7fAOgZhqo5HBhle9e
         yY7MzQBZ/9VXVasqVsdHhMt8VxhDsTqB0wrdcIuOBA4C5DI2n+95L+yKeEJ16ysMd3bD
         wylp7ug4DaWFIoXb7ANm/alVsX3slbCQ3M3QeILBUIsR5rYUOCGGSk5n9GetsZEnu9eU
         DwGEZtSwwmbwwhvXk02fzAVeF/36QZM92xlFpDZ1aiRMQZBC3mLF18KXFeCZe4zrVoHF
         zZR7VuJrlVPFNKOmcusei5Fh0VXSC+2qQY6HJoOnHqnyAUM17gjXE2VufRwuT+7kBgqZ
         mStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629299; x=1750234099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NyvR/aWRBWqhSTIVuqpj6xfB7efefHvQ55Ys34H+rzc=;
        b=YgQdfKfndCEeDom9/srdlR3RT0U06obZYytNiftTcILvq25aizURLUIYIuOIEgqrSb
         w2Jr3TGQbYz1I9uaoGobf1RZXmHQgA3x7+kfEi0owyvzpIs+EDnXOYlTWQqOLKfsoSVE
         1CXKawApqbonfPEpuICZbf5h9/5dayWVPdSgOwE0xjeS9p/dt+7awPnbdwfrPNYkxh27
         Zkxz/szzuDABcVdGkYkfALk3J2IJ+sWj3/nS/e7Cy/2FP+XvLvAyLLAhlPNigrsuyPKC
         fJra/xE0mGU9Rk3F9qIXRg/b7vfD/kYcQ/EnEMs78L3PFP6hW/j8T6/Jp/GvA1f5VX41
         E8ag==
X-Forwarded-Encrypted: i=1; AJvYcCXQxYF0kafw4yLt+ZSxkPqBDkXbfJgb7c5FsiNOtxkGnlN8v+2T/ms/XUb2pb50eDSajT+YH/9Ge661SA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2+WRJF36B+jnFC1aGsjuw2ngv/GIYeQnJ6y7iqYJCrQWJiMLe
	m7Kht4zz5Rh0ZUwC0zD19GEeSOfKqno9ijOZ6g1LtcPwczm0wtF03H3R
X-Gm-Gg: ASbGncu3fa/jmP4k4bTj6ZWuG41j262bpeFWb97esSwDycVX8XOvBbURSv0siACMIuR
	wQScIhBlWHAU2LUbcUE1elG5JgPTPR+Kn+qdUmNBJTMqieoBE4AceQiOKbYX727UdrB1CDj0LQj
	BXP1sbN7WgmOLZz6mZrEPbS5BufXuHhk/4F86pgy0Fd1cuGGmVo0Du89U3Lny1BpqhGbjR/ihnJ
	AdOlgYrXA8+z2fRepFbDJWb57kuTzHPcyetxpfNlZbDVdwXqrFPd+vrekjLYBq5zQ2MyH8/UdY6
	BTw7CL431VMzOGFiuzXE4ODYy88d9I2qdiJJ1A==
X-Google-Smtp-Source: AGHT+IEa9ijPv2yRUgWb1+JJ15oOCUsNs6QvCIjqmIyulbMV9Myzdnt3+CF5kf5GH60kSH/1rsm0dQ==
X-Received: by 2002:a05:6214:c83:b0:6fa:ff79:2cfe with SMTP id 6a1803df08f44-6fb2c3272a3mr32641426d6.12.1749629299545;
        Wed, 11 Jun 2025 01:08:19 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09ab9595sm79183636d6.6.2025.06.11.01.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:08:19 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next RFC 0/3] riscv: dts: sophgo: Add ethernet support for cv18xx
Date: Wed, 11 Jun 2025 16:07:05 +0800
Message-ID: <20250611080709.1182183-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_010820_662121_BC133BB4 
X-CRM114-Status: UNSURE (   7.31  )
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

Add device binding and dts for CV18XX series SoC, this dts change series
require both the mdio patch [1] and the reset patch [2].

[1] https://lore.kernel.org/all/20250611080228.1166090-1-inochiama@gmail.com
[2] https://lore.kernel.org/all/20250611075321.1160973-1-inochiama@gmail.com

Inochi Amaoto (3):
  dt-bindings: net: Add support for Sophgo CV1800 dwmac
  riscv: dts: sophgo: Add ethernet device for cv18xx
  riscv: dts: sophgo: Add mdio multiplexer device for cv18xx

 .../bindings/net/sophgo,cv1800b-dwmac.yaml    | 113 ++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        |  70 +++++++++++
 2 files changed, 183 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
prerequisite-patch-id: d5162144180458b11587ebd4ad24e5e3f62b0caf
prerequisite-patch-id: 9e1992d2ec3c81fbcc463ff7397168fc2acbbf1b
prerequisite-patch-id: ab3ca8c9cda888f429945fb0283145122975b734
prerequisite-patch-id: bd94f8bd3d4ce4f3b153cbb36a3896c5dc143c17
prerequisite-patch-id: 1b73196566058718471def62bc215d2f319513c3
prerequisite-patch-id: 54157303203826ccf91e985458c4ae7bcdd9b2ba
--
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
