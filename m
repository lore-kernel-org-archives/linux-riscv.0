Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EAFC3601E
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Apr 2025 22:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MQHWYj01d1BJElRao5soWx0Whj7O2FOgt96btTyPOCo=; b=aiZNm6g0/Ng12m
	cVJe7TPzx0ri+VnqpjJ3sWMG50d2tyt3/KJsStWgmUv11P6LEiPhAuAcH1Bdwe5hgJWrvEvnjaF/v
	DHZby0WNxUwYOycPSdHlZjOpChh4NvI1V4Sqnn/Ez8HGAeylGup6WHP40MFi3QbnG9Ig3bS4qpj/h
	PcuNSRmaE8KV+KFwjPLngWhQW05a2YDVN1eEVkyzuG7ZdmrF+3q6TxK5qDGA0EiJc1xaaaSdb2ss9
	eN/MWgRa7Zdlbch7fbIq6RqG5Zlv2eSaRWQiVDwo5KjwJNqeMwTuB/1w4jUxLywQAv94q3tMOzLae
	AoxDTQq9QXg5RLemnTIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u45ve-00000000G33-1uLq;
	Sun, 13 Apr 2025 22:35:54 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u45vc-00000000G2A-0jgj
	for linux-riscv@lists.infradead.org;
	Sun, 13 Apr 2025 22:35:53 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7c08f9d0ef3so222194585a.2
        for <linux-riscv@lists.infradead.org>; Sun, 13 Apr 2025 15:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583750; x=1745188550; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q5YjA/KfpvY46CadYlUcHuNncn9tBNGFY7tmTjqFT+k=;
        b=gWyH6qf9jPNF4diGYrTd6ySdJU66WQTbN1gWhxm7aRn/U6GMtIVfoDaO8u49WJpVMY
         Ytj/QmnabrAVSeNZHScfZmBZQbJbJcl/wf3G+H6ymG+GHIOoQ0cjpv6hlNPVSRFH8Lh1
         6tkFeU05nz0ox0ngWsOoIa4VGmGBF7R3rqgouTUBttmF6zaXos5h+/UZKguw8bfKbrqM
         Ku8pftP8grsuQJ+suW9jdlcd89ptxT6rdx57hR78YaPrEc8EeYapqWdIPw5r5tqdgvIt
         ytQIlXLvRx1VXPs0/t33p3jZV3+vW/Uf+WaIty3DV9McMVukfsY/hhlIC37vH3jU/X/w
         XneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583750; x=1745188550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q5YjA/KfpvY46CadYlUcHuNncn9tBNGFY7tmTjqFT+k=;
        b=ZNyJKlDqUzesA/6qxuGgw6s6LOWBDsLkbSsbE3+cWVrxBWzLDARO+ffD8zXlMPJtmo
         9Li8NQ+cB4Y26AOlrWSzZqWCyzks/njy+USQE3vfKRgyaQiXcUJEOgxW+aATgQnHIXD3
         IUiPQq6CRXY58Hv/WeAFQZWBiKIAe+W6t4kLKjFWgirKO8BYrh9PQhiCA4v4Qh/ku3MW
         aYgBPx16MJ4DI8FTe/sBagWDZQ2nZ7nSBeagyT7rVoaoK6E3lGIqnTFSrYFNKgYOOpq7
         oJ8JtHVCA6BYxY4sMdfxQ8WV0tNLkoAUSV/LGG1Jydl1rsfxOb75ZhtcWqFTnABoCJOb
         It+w==
X-Forwarded-Encrypted: i=1; AJvYcCVo+cxiAaB0yRmFdjBog5hsfKvDEIbzUv8zeKkyYvsoFzcfQs4KJjfzChDYRC/VCJmLyj88ehiVoiVp3g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9tpTbpkQfa4bAKoWswS137qdgMYt0WLhbEq8kMv1w2MXIX8Ze
	BPi+U4rnLT3veaTBJpYvt+59oMSIbiEL/DhVmmLSSU7a6SYoJ1uq
X-Gm-Gg: ASbGnctgBw1YLEnKOD2G7kyiL274wjE5XMLeRgxyJSluf/XgX2ViGDyBcUE7gf/x6Qq
	NJgn3M7RVqjEtXdYBdCVr94G2ZRVhwOGr8wUIUZfW8knmf1+99iZoUhWkfIq4PkPllDyPu9LtXY
	T34hNM60nlYrMU21RhMP7d54udnWR+b9syp8JfI+SGAnoXigoJd3PXIcy+NRbFACrw5nNh+TD59
	RPeXPZB8/TcBYOyuC6NDt64eoi5Il6Mt6JvgAb+JHPiUA5hF7xrHaVNE/aE1sSdnvshqQs0XBfi
	FUuHCeWurSwNDwls
X-Google-Smtp-Source: AGHT+IF4AYfNDX6fmR9rMqMQ3rY8l2Lo4PsLhdNiIgvJGGBJRv29yNF11cYAsmD/700LbzKyzcIlsA==
X-Received: by 2002:a05:620a:2586:b0:7c5:9b12:f53c with SMTP id af79cd13be357-7c7af0b97femr1590502385a.5.1744583750449;
        Sun, 13 Apr 2025 15:35:50 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a8942eb8sm617762685a.12.2025.04.13.15.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:35:50 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 00/10] riscv: sophgo: Introduce SG2044 SRD3-10 board support
Date: Mon, 14 Apr 2025 06:34:54 +0800
Message-ID: <20250413223507.46480-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_153552_211862_E826AD84 
X-CRM114-Status: GOOD (  10.92  )
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

Sophgo SG2044 SRD3-10 is an ATX board bases on Sophgo SG2044 SoC.
This board includes 5 uart ports, 5 pcie x8 slots, 1 1G Ethernet port,
1 microSD slot.

Introduce basic support for this board and Sophgo SG2044 SoC

Changed from v1:
- https://lore.kernel.org/all/20250407010616.749833-1-inochiama@gmail.com
1. apply Rob's tag
2. patch 1: new patch for grouping all similar compatible ids.
3. patch 7: remove unnecessary compatible check
4. patch 8: adapt for the new patch 1
5. patch 9: fix copyright e-mail

Inochi Amaoto (10):
  dt-bindings: i2c: dw: merge duplicate compatible entry.
  dt-bindings: timer: Add Sophgo SG2044 ACLINT timer
  dt-bindings: interrupt-controller: Add Sophgo SG2044 CLINT mswi
  dt-bindings: interrupt-controller: Add Sophgo SG2044 PLIC
  dt-bindings: reset: sophgo: Add SG2044 bindings.
  dt-bindings: hwmon: Add Sophgo SG2044 external hardware monitor
    support
  dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo SG2044 support
  dt-bindings: i2c: dw: Add Sophgo SG2044 SoC I2C controller
  dt-bindings: riscv: sophgo: Add SG2044 compatible string
  riscv: dts: sophgo: Add initial device tree of Sophgo SRD3-10

 .../hwmon/sophgo,sg2042-hwmon-mcu.yaml        |    6 +-
 .../bindings/i2c/snps,designware-i2c.yaml     |   12 +-
 .../sifive,plic-1.0.0.yaml                    |    1 +
 .../thead,c900-aclint-mswi.yaml               |    1 +
 .../bindings/mmc/snps,dwcmshc-sdhci.yaml      |    3 +
 .../bindings/reset/sophgo,sg2042-reset.yaml   |    7 +-
 .../devicetree/bindings/riscv/sophgo.yaml     |    4 +
 .../timer/thead,c900-aclint-mtimer.yaml       |    1 +
 arch/riscv/boot/dts/sophgo/Makefile           |    1 +
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi   | 3002 +++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2044-reset.h     |  128 +
 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |   32 +
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        |   86 +
 13 files changed, 3275 insertions(+), 9 deletions(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-reset.h
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044.dtsi

--
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
