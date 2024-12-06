Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579D4E7717B
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Dec 2024 06:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nP6/OPR4cyX28OAr5ecU9t2l0irSx40xcIMvFvL+G+s=; b=Lnt8bt7okc6HlL
	iVQWqmWwCOeVdgvuvZFs21GlDABATzy3R8ZMeXaOLcVtldUaqaGmazfBXF3xR906DTWEXZz5luGrX
	5KuOYkGfkuYUck6Q1t+si5q1iRVzviTyaJk6M5+un+ls0FgFTL3REpB+NLRyV7nriL301Klh6UpQy
	ZZMrRkAbIH7W6uqpmmTW65ZKivkDywGHXdh6qxakOh3c0q8S1Qlc811tH5gA8c6B1G32kQ0GxVuAo
	VJHmUgo/wFIHCr9agXQONmgAdCk8KxFfa0U5reRA1p95Bmm9YC7dKX6htujywVhUeJlWQJ1vRWX7C
	O3+jHfuvTSgtOWw4QP+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJRNZ-00000000f8a-0A3P;
	Fri, 06 Dec 2024 05:59:53 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJRMw-00000000ewl-1qWv
	for linux-riscv@lists.infradead.org;
	Fri, 06 Dec 2024 05:59:15 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6d87fffeb13so11001876d6.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 21:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733464753; x=1734069553; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iXRFRs+XC0DJNciNy6r2rJesSJbW/6H6nTwb7IfEzgA=;
        b=MHK5/nxAe+huqpEhyUvktJkvEB3WR2sfnLg6Ykce96Nwc+d9OwxPottK26+EvWIy/Z
         jpuOb3i8VEGL1Fwl6/eMrxvYV/M0tPGnHpzSwfU74BvALbMqEhBiCnKiDXOYKTDa6ewI
         8RRqVGodor+6G6pYfjhSKCbMZSu1nc/VoveofGEiYKWkhNmKr+8aPr4P1s4eDNfD4wTw
         l5mo9xambGwH3NeB3QLtp35pGG75eFNVehXQNGpjHuIESAvCz4Yo1cAb+taOc2xmPFSF
         hO/ebWgQ9YC4fFMzqp+3CGzapQyHbWOqsvEzKwyq3dzYukMajGbwQ+wpVcJUmp0JOBjO
         cQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733464753; x=1734069553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iXRFRs+XC0DJNciNy6r2rJesSJbW/6H6nTwb7IfEzgA=;
        b=Tfs+sgYa9jK/z6qlNS0UTXPlx1gxa7UJjLb9Nb3JXipICvA33pBhZvLTrmDlLTaOz9
         sycilGFH5GiRVKBz7SZ4teN94u+Pp4Ug0WTVmVPGuBFcL2ECySkrZxZ8aOwNsJzCjELg
         RYqgvvTBKTO1Qtvo7XVTKynRBMAqi3Zg9TpgAeHEGc2cHJUv7nqAoKZeMdTXGWwvIHQ0
         yNDZhqtdfc7bZ+i9edD9pjem9VBCYuHvdLc7Hi6Tf3L/i4iElQM6zR3x+GRuFB3CD9f7
         yZuPuNigqXJhzkmJiugyMhnT/6sikjvtqsuQ+4NFa2VXDpbpIJx3+z2Q6jzPecxLcOO0
         VpJA==
X-Forwarded-Encrypted: i=1; AJvYcCWJ5Fl4yepdhFXMWRMcQO1U4Zgw4m0ZklBRBc5uR32rJql6nPbivtZqiOBx6QWa49KGi/Bd/Wc28duzyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0eJtrkzJtkn9/8s99TFgijb+9UI95ngKbLdi/frxQxooRR3GQ
	vgnOoNCJhzgy+TqKoFxDQFhFNQESo+IHZT/V4loUl8ptNEPNHPfG
X-Gm-Gg: ASbGncuRNUo8uOzaOulch+X3w8qyaKTTHyouIwXH5cRmk75Xzc2EjpjJHOIguZDt8ZS
	hONG1DEslmQDgrAhyH9Rr/KW5AWEp/J27G6ZPnbo69Yt33e/NOeQMO0+6KPJ0zXIPf8WkXpv065
	Xa46xQtt+fAazP5Lx5wjhl54VEBo5U9AtfzAXEVZiWkfGEQhIcnlaHHlssjRRhLLisVF3vY0XNx
	UEdHoKAfjGO82MG2PCDaVCLvw==
X-Google-Smtp-Source: AGHT+IFdJttRi42Zr1gBevCxL+wX995Q3xyfSbyquAMQ2ObqdH+gemcPApjmT162LwutnyFnblVzKQ==
X-Received: by 2002:a05:6214:1d0c:b0:6d8:9bbe:392d with SMTP id 6a1803df08f44-6d8e70f0644mr15278116d6.6.1733464752961;
        Thu, 05 Dec 2024 21:59:12 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8e7883a0dsm5826426d6.45.2024.12.05.21.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 21:59:12 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 0/3] riscv: Add bfloat16 instruction support
Date: Fri,  6 Dec 2024 13:58:26 +0800
Message-ID: <20241206055829.1059293-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_215914_496666_17E2EE7E 
X-CRM114-Status: UNSURE (   6.76  )
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

Add description for the BFloat16 precision Floating-Point ISA extension,
(Zfbfmin, Zvfbfmin, Zvfbfwma). which was ratified in commit 4dc23d62
("Added Chapter title to BF16") of the riscv-isa-manual.

Changed from v2:
1. rebase for v6.13-rc1

Changed from v1:
1. add missing code in sys_hwprobe.c

Inochi Amaoto (3):
  dt-bindings: riscv: add bfloat16 ISA extension description
  riscv: add ISA extension parsing for bfloat16 ISA extension
  riscv: hwprobe: export bfloat16 ISA extension

 Documentation/arch/riscv/hwprobe.rst          | 12 +++++
 .../devicetree/bindings/riscv/extensions.yaml | 45 +++++++++++++++++++
 arch/riscv/include/asm/hwcap.h                |  3 ++
 arch/riscv/include/uapi/asm/hwprobe.h         |  3 ++
 arch/riscv/kernel/cpufeature.c                |  3 ++
 arch/riscv/kernel/sys_hwprobe.c               |  3 ++
 6 files changed, 69 insertions(+)

--
2.47.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
