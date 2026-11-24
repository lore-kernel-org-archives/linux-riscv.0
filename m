Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75967606A326
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 07:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MZxnHicx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=DvQ/j3kk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gOzbXSnf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=iNNYY7pRQZWw/8T+KMWOcHK8iHzFLX0GLTV9mASQlFI=; b=MZxnHicxSoEFRbHYZZdOojbFpm
	uv+PJl5mfv1j0I+FEpRdIq45V7qkez6otFslLZDvn+bSI7ZL0btbpzvfv5WcjzipsJzPQyYvvGqKo
	ma5yjEXBlx0hSmyyOPYFKpz3rkUptoeZUmCy4nyLuH/V7j5VpezWY2qNxcuFQa1+YT5+HblD+KaIf
	C91sHNRlg8zrsdkCY8CqPoMDB5fTAliqYSLoTrXHi1C95ixw3ibMzUaCvXyoSu4dsQjS/HXTFJcX8
	3oAHPa6lhxSSB7Rqi/rJw2z0btcyNKxqVWewUUuaQfUyjP0FESJicHPyFWkAfAjPiKEcG/k6JWgwm
	wuAzyMvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkyD-00000005lJX-2724;
	Tue, 24 Nov 2026 07:29:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkyB-00000005lHy-3FXE
	for linux-riscv@bombadil.infradead.org;
	Tue, 24 Nov 2026 07:29:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=U4eZKwbLyr5C9ZRawowrZ+u9z/DgLN56Wne8sTMpX3A=; b=DvQ/j3kkqBCunitsZAAQHIpN83
	edCkpFPXBHfP82N+xWKmOXH2C3ODqscTJ+cWuw+p3WVKr9PGnLiYfg1ZdLKMyast7FjtOVtkISfW/
	FJdgTsTICgNFQ83RN0ySrIvS78LWa+ErhcOJct+DxwNcozI6cGG75nTxGys1nE6fpLmTJg+uByTQS
	Ip2jNcDLzNVLAdL27u7sV3YVS+VmB82ooCyJmPXWz5pcUqQyAsCoeZ5EK2qUWnP08l14KrCYLpiUr
	9qWXr64auOcxMAV11EdFxV8g25VamHuCCHw0y31Fx6oseZph6UntAhJqmz86VJ/oiOUN9JJWc3TM9
	cZX5UykQ==;
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVky6-00000003t9u-0vJe
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 07:29:38 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-cde827b7b95so927128a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2026 23:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795505371; x=1796110171; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U4eZKwbLyr5C9ZRawowrZ+u9z/DgLN56Wne8sTMpX3A=;
        b=gOzbXSnfyUsRlhteNV1iMYMfjXNCuWJBPPCPyVmHQTilGGLq4U2vbQE+zh2Mt0ZsO4
         UOSD9sOUL97wOAwI4+yPlHsaZeGXC18pXfQrsKJbm16gHn6GFx4T8kHE2FPl1Mj5Z/qG
         TX1d1DPJBgPpYHVQVTv+FO39A603z1h6+1UfJSs835nVqakmQsQ3GVIzFxEa0rEDYDjq
         IR1d68/k3cXRXWic/pey0rr2igiiuEESBcqOXi7YM6rtR1t4RQ2a8kVRDDkviyXvYbKk
         SNDj3AM1Mq/wEx6dMKLUGez+ngCCHgITIwpexY/mm23XTb2YIfXw/okZzRIx8orCHSCI
         AVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505371; x=1796110171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4eZKwbLyr5C9ZRawowrZ+u9z/DgLN56Wne8sTMpX3A=;
        b=fpeNH8LX58SPxTUOlW5JahPu3idzwZMItVZqxLEUD4qIfGF/A5PeQZCZSMU1Bu8S81
         BM3yO243K8yDKtLAlF5AQTgFxVP7rZBPLPM4TcARmuCU3NOq9vXWk/oYsaWPXpF14Mma
         F5zr8iAYZMQCAKIav8DEaQyX86pvJp7ZBAGr8OjPlCEaFl811nPWGlf2Maj1SC9O+/hd
         gN14C0UzawlyIr2xJJ7hNWrR7QcszNaHIh6DTqjWUIydvgXSjIHCR2DR1PlxgRGOrcm8
         Q+6LbT+5kNzoN6Rpv1WFqOxXS6mPiVIeHC39rpnTSr7l2qJrT0V3pNJinp2jQZGMdgUa
         sqHA==
X-Forwarded-Encrypted: i=1; AL+hErEwNfI7KFqLqMTaJLjE70GCqDI0gd4TYOWBKwACBpfcV8MCqESteX/Vo4Uq/fP257V5LhMuJ6C0R7U4hw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/q1cK+Zhjs3NXKuzjQIyt8jvi9HCfN42vKI/Nw00jQoiSXEjDn
	mJKiuVt3CWqmU82GrFROIgYYCZY8+hZHuN0yJUgT3bN2Wq+g29N9O/iA07xWuxBZ
X-Gm-Gg: AZFdTZdWhR+2BzPennEMZArTC2rgh34+NEO6PmF/xz+q+PxDkAEgLtvotNkTQ9x8NYQ
	W3UOl9mEBqS/9shDbE/zvxIGPl+Og1TfdieuVTYHLxs5ZvK3MWT3frvCwxh9x9RnTwQbaeTNNsx
	x56TNSOwb/ktAOs70bWOot7DNXo4hVGRwOHHmEk6Y16Fk747lyJC/cySLdk5eNnMocBqYb4OTFI
	VuXBMXkiuuwb7ocqLeaGFj+XAnvs0bl17/ic18UhFEu6Qb77M7h73rzLWPdACJfS/KHR2CldFuB
	FBmLQLsjZt5tTFukuaTdvn13B862LjB0HT06qindkz/wuWjvbYaDszlQcZWPZIZ+vxv/FRMsmve
	+Kuwi6ZQtRhcqUBJEoHPh1ffMUP3H0qXWMIq9yejVKF1f63u9xPfgj+ZAQnxj/L26GBujayN37C
	wlqdoRJxdSeTzmQBVmwUYr9vfjwFhcbIqRrmCJqUJ0YAb3GLaSNZRDAb2heIYoR8NEJpNC8cu0a
	WQWWcO1jGFhO8C51HYgLKMpIDVuVbOdXLxFm/RmL59gVMLAcu2H2Ojg/p/JNNAxR7IAlStgcTWH
	mwT2t6EtbSR5z4av0/IjSEazkzQ=
X-Received: by 2002:a05:6a20:dda8:b0:402:4f40:c761 with SMTP id adf61e73a8af0-4024f40c789mr8567537637.37.1795505371142;
        Mon, 23 Nov 2026 23:29:31 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc613csm6519888a12.5.2026.11.23.23.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:29:30 -0800 (PST)
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
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <gaohan@iscas.ac.cn>,
	Hangfan Li <lihangfan@iscas.ac.cn>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/3] Add SG2044 eFUSE driver
Date: Tue, 24 Nov 2026 15:29:20 +0800
Message-ID: <20261124072924.556678-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_072934_169749_FB57F549 
X-CRM114-Status: GOOD (  10.09  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add SG2044 eFUSE driver, The eFUSE contains factory-programmed data,
and it will be auto loaded into shadow registers while startup. So
only MMIO read is needed.

Change from v1:
- https://lore.kernel.org/all/20261014074516.240247-1-inochiama@gmail.com/
patch 1:
1. Remove clock-names minItems.
patch 2:
1. Fix wrong buffer size in sg2044_efuses_read().
2. Fix return type of sg2044_efuses_read_strip
3. Fix some style error on the driver.

Inochi Amaoto (3):
  dt-bindings: nvmem: Add SG2044 eFuse controller
  nvmem: Add Sophgo SG2044 eFuse driver
  riscv: dts: sophgo: sg2044: Add eFUSE device

 .../bindings/nvmem/sophgo,sg2044-efuse.yaml   |  59 ++++++
 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |   4 +
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        |  12 ++
 drivers/nvmem/Kconfig                         |  12 ++
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/sophgo-efuse.c                  | 176 ++++++++++++++++++
 6 files changed, 265 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/sophgo,sg2044-efuse.yaml
 create mode 100644 drivers/nvmem/sophgo-efuse.c

--
2.56.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
