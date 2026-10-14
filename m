Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFDCCC6B1A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 07:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2Boi8YUkSj/a5ALojFKPxLLVPXIJpZtus0d54xumcG4=; b=ca2zT6/mZL2shT
	RFtXEpTcyhOPrbNrERyJDfoxusDZcxwigZ4WAjR3yQsxnG0KXm2ynmyIVgfFqLCSlZZhl5Gi1g55q
	I5r5icBJ0wLOCDvq5LTz0v6KhuCSZnzRMmf1wtCYf7mRtYqvn22bRkqdL4hNRqWzjkgnwpR6ke4qe
	diQyQPAcB9EuYBpz43GXhAzP6zwoGolqlZTOo35aI4RRoMhZ8hUmYTJd3RzrIqYRjmVeP8H3/WHZ5
	pXvAqoMDlYbgY5XvJoHskc795qKCNaSWpADbxO6+xVQh275D1i2Z2glOySSQMm3x44KgHaF9iNICm
	hSQdaegpKTzcg1uPxzRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtgU-0000000EnIx-0vv6;
	Wed, 14 Oct 2026 07:45:58 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtgP-0000000EnHg-1KIF
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 07:45:54 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2e940d5d2beso990895ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 00:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791963949; x=1792568749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hCKIAVPSYo0vK8WrzKbxMMpR/7Fs8ssXef3I4R/nZQA=;
        b=ADO8tMPDflbGGVK8Kg5FeJ0D6MpCCYI7gyius2J/ooP79Dn/p2cm+XADP8+A6TFo3U
         XtbT49ylM3thvaOCRrDAsPtFx0kR+L5it/eI6TQ+Q5mo3QeusAb+gB89qhrkA4aoLP1D
         qiLszoDuKhliWzbg+BHsUgqpdytmdeoLkGy9kjZj6hn9I5VZ/sNIvJMOdG+HWUOi8pkv
         LoEVwUcGSbQn5kMrmZ7msdFu/modAk/g8fwb4ONnlk6G+tGf/IS5OP8Kj8SrYG6J1LGA
         WW01tEeHG+3aq9KWbgumkTNz3ao7wpfNWIN7reXPvHF/mFK7WRnOF8BFLnA2yiYhoKKn
         cgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963949; x=1792568749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hCKIAVPSYo0vK8WrzKbxMMpR/7Fs8ssXef3I4R/nZQA=;
        b=QoX/wbrt4PpgbrLs9WyH3BhNdNkBVQld+viyDQmSMPMTFEJosVgjG45BgJQLuZk0s/
         Bh+EmsjcZw/NeOoczLmiLkzSNH2ZszDrTeQ5jvmz4GLozh77D6AdDa/9FGKpHspNdaJN
         eD+8BG+sHB9vL9vAv0c/ZXGW3uNaMuXaurTJtaC3z0LifjLAcnAjiyOUFm9KJ/x6geBb
         gV6f6Y17Y7QbJJqjJOsgSydD8+t1ycF0yUQ8FgWMkooHrdHiAmqSLdBDg243seoffjSv
         18UF7VrzzO6Y47MItRmLzAaZvB8HRwKMjVcWFSVO2BTF5F+5UMe9lwJSSUfVyvpQEMm1
         cJKg==
X-Forwarded-Encrypted: i=1; AKwUvBxFz9RCIai3xut6L7z3e2kLFtiPOl++VHn4alqzwIOk6PhaCePsbCvNKEL3PX0pQBcXnlV4AVPz+Catcg==@lists.infradead.org
X-Gm-Message-State: AFq9FYIPCIKsVEjQkqlXrWy11sK+Zsj1IM4PUtAz7p092whKZP9kHU3l
	maJ90/L5MZGnS7yovM1CUdCrC1xnPirPm+nhKGJXc35EZ8pfllE2CCpr
X-Gm-Gg: AYBFou3YGXacqZ4gpF4l45Tmr9r2/CpwwZYawdjOiTHtkYsnuAq7g+vjmwZOT1jSnqk
	fvwhiEXjvINCT+DOoWLJHH8sZS/3Ic22mlYE3/tCs7N1kTWui47Z0HOpnTO+dl1De0kktgBDHT1
	9gvHgcwkk8yIsdl9HaDHjabipsFllTgMsPw8QmCegKLZ2aujIGMjF1yKCGHuq4Dydnxg+PQ04Gs
	NwBVrB4UzN4/BOssdf+ubQHq/1rSrj8XtvEjaCiSg9M9XqHwRMk9szhm9N9rkoc8B1D8O4wg9Cf
	LhBZfJQbJeHkCp/1OYTubgJF1Yob3q7ywGysr70MGw6diL9ws4KmfqUBI45UJQskA1eRkdR+bJD
	CXE2j10NY75VMxNx1Q1w0wgm5jg3Eqgsrsc7El2kqrcSuNYUUEHoH7iDDY+NUY6EfRL9XUFPb2u
	RtzeSpkgIymHPFzxSufWllGwfJNjz8jiI2xQbdXvsGPRMqm66Gtazrm5sOD/a/D0SB4ffU
X-Received: by 2002:a17:902:e74d:b0:2e2:cb65:a719 with SMTP id d9443c01a7336-2e842ab6a10mr114098215ad.15.1791963949146;
        Wed, 14 Oct 2026 00:45:49 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b1347sm67038615ad.44.2026.10.14.00.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:45:48 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/3] Add SG2044 eFUSE driver
Date: Wed, 14 Oct 2026 15:45:12 +0800
Message-ID: <20261014074516.240247-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_004553_399597_6F663BDC 
X-CRM114-Status: UNSURE (   7.60  )
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

Add SG2044 eFUSE driver, The eFUSE contains factory-programmed data,
and it will be auto loaded into shadow registers while startup. So
only MMIO read is needed.

Inochi Amaoto (3):
  dt-bindings: nvmem: Add SG2044 eFuse controller
  nvmem: Add Sophgo SG2044 eFuse driver
  riscv: dts: sophgo: sg2044: Add eFUSE device

 .../bindings/nvmem/sophgo,efuse.yaml          |  61 ++++++
 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |   4 +
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        |  12 ++
 drivers/nvmem/Kconfig                         |  12 ++
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/sophgo-efuse.c                  | 177 ++++++++++++++++++
 6 files changed, 268 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
 create mode 100644 drivers/nvmem/sophgo-efuse.c

--
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
