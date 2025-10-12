Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D1DCCA476
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Oct 2025 02:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6JwIHGWrQEt/zAYpT2y0VsBog8ICRY+VdOW8hOO/XE8=; b=19TX7san1C3QFS
	X/4/1rYlYPwcWo2dDMW9bTUOBSSbXD28CwtZQIuABcKfYS+RCAr95GNQfIMZD+hM5BGr90Bnr78Yz
	nmeFj1qKb0eGWPJTofmKdWr7g8pln6xy3nP2BLUiHATe0LLWWEfkANRCg0lWTDGf/1o/haRhhkYLQ
	fXLLkVl1koaODRz7iGJnpyKgIjNl+BdMoDbEu5Lf/vQs91KvRF2ry3hG6vbgc0UUFFu/4GQUprg6J
	aL1eZ3fM+sIZylKpHIQ1drOXwIxvhj4OSNmqsyp2X/YQTLdLIc69jXrOwbm9iPAsNbG5ZCGMGvbQ3
	tjOeWyxk5d17IcUs8x8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7lmp-0000000B02d-2Wl6;
	Sun, 12 Oct 2025 02:26:15 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7lml-0000000B023-1mzL
	for linux-riscv@lists.infradead.org;
	Sun, 12 Oct 2025 02:26:15 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so3026590b3a.1
        for <linux-riscv@lists.infradead.org>; Sat, 11 Oct 2025 19:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760235970; x=1760840770; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Y+1XwSbsMVPSTNdYmAt47Cu/9qwf4w36EkkfnGxXMU=;
        b=NwR4kOzQT/X3e/PchzHkJoYK8Xq1pMHlv+CbXjD+Csl3xPnj3J3NNHiXxT1rMde6ag
         I04goo29XRSePI+htoUkIhiBzgtzZxLCxc26dU5OPvKp2iKWyLCtLlDNHnMkF0lJyJGo
         ClzmLYxjXSGclvxZ+Arhgf/UnjOHM5hUxAOfT30oguwtIl21x7klCohJTb3Jo4UhBfnk
         nqIOVZ5QMVSRK/oiBDm54DhqgAZ+GUbnAR6Mahw2cbefuqlUMUwDXmSWdec9g7/vJOjB
         HBYG0g6hiB9DRjGAUK26wCskn7UvVmlTgU1iuhtkIQpThGQlCA2K0GUg65HERHcR1UCy
         Kgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760235970; x=1760840770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Y+1XwSbsMVPSTNdYmAt47Cu/9qwf4w36EkkfnGxXMU=;
        b=Iw/KGb8t/3e/DwIk5XdaioPZ2zz6N8/Aw1P7GpoA3LLF3WxJNFP+6ITkBH4dOWyFLH
         lpJlzclWNXAKYtEZbUmYoEn7hVOp0EqmB9JRldXUZMGdupDyqxl4k8mI5eLqJwyEo8Dc
         TslMEkFOTLwvXx7WykhgG4kPIG6VeCPf3rebQlWh19VttasoW8QT6PRNkQNREW7vxNvP
         epJuhUe5rc6sWssJyNhskng4+imYrxJsF/Dy9Lbj0AgA0mthBSMEypHiLHs2l7PpXEpM
         gbDXftK5VN920DC07LAtj58c3mrDe7HszIbqeWoBgFEceGqp6SonLFZ/H0sRi4+lxYTR
         ef7A==
X-Forwarded-Encrypted: i=1; AJvYcCUF7oJ0AFy3p26BxkCNasZE5to/S98wW0NqX2+0WyahGT3AyHlOJJH+8WNsfWiWAOzorSyBD8aTpW34lg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmfwpxA2xX7fM1i4oKZI4J/uADjZPbTd1m+nNu4is8sr6l49Nd
	+3Bdi+7v126ElAcXD7I7Qsi04jSzucs01h5ZVpFQYC1MQgT9u14IQ5I2
X-Gm-Gg: ASbGnctSO0eEiM71DUBJBDES+DuTOu82vjiYx4IOSS9/BbQNxz6ribb6143+Q2ZPhZT
	MBTSK9XvyqJeWD1xYie/hOeOZ5qrJlleJR3LaPlAIC3gJi7nLdHriEhD7IYazA2FqRgntTqruBW
	MfB+2VNYst1G2kWS1/s84a8sSPf4E0TPkaV19DPWK92s4LHSor18My9DIAbZdTdT+b9rAtyLpFU
	3meFcvnkwt5kBhyGO/+2Aupz+Tm845kMKqPXwk5LixuZyDjmyPj69bjZKOTHzz7S2JSjfKldFqD
	eHzR7A024RQc2wz08xvmmjZgUKMh0y+x3z4+Tj5gphetjZK8La97Udi2RoVqVzZ0xfs83DVhOj8
	InmZQQoLicGKWPNo3KBGqb2MDcSq5CM5REX9a52w66Vj4NhbtGXixcP1yA+UOKzj1WGix
X-Google-Smtp-Source: AGHT+IHTAezIVOlurkAg+7C74kvmB+nBt5xlXqzzzPRnJHFMzlSR8jL/NpvTl40u3+f4D1RCNQ2gDg==
X-Received: by 2002:a05:6a20:3d95:b0:278:bc13:d83e with SMTP id adf61e73a8af0-32da8e360e0mr23314655637.11.1760235970292;
        Sat, 11 Oct 2025 19:26:10 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d9992ddsm7180489b3a.80.2025.10.11.19.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 19:26:09 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Longbin Li <looong.bin@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 0/3] riscv: sophgo: add top syscon device for cv18xx
Date: Sun, 12 Oct 2025 10:25:51 +0800
Message-ID: <20251012022555.6240-1-looong.bin@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_192611_467585_18611486 
X-CRM114-Status: UNSURE (   7.66  )
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

Add top syscon device bindings related DTS change for CV1800.

Changed by RFC:

https://lore.kernel.org/all/20250611082452.1218817-1-inochiama@gmail.com/

Longbin Li (3):
  dt-bindings: soc: sophgo: add TOP syscon for CV18XX/SG200X series SoC
  riscv: dts: sophgo: Add syscon node for cv18xx
  riscv: dts: sophgo: Add USB support for cv18xx

 .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 59 +++++++++++++++++++
 .../boot/dts/sophgo/cv1800b-milkv-duo.dts     |  5 ++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        | 42 +++++++++++++
 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |  5 ++
 .../dts/sophgo/sg2002-licheerv-nano-b.dts     |  5 ++
 5 files changed, 116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml

--
2.51.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
