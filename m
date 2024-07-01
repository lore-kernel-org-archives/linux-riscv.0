Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159DCC30659
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 12:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/qdBgHFBvSKeAAY+SgjDgvjJQw3rfpXbO5oi72azspY=; b=fE+cyEbvyzmIxp
	AjuK4Xv2IrkExaR9y/s+bUUfj7Jk9O/FiRUvDiq1AWi2gs0zUGPkriqTnwc6u3gllxYxjShMtyQsN
	eiZ5QCQxAgCQeixMnLwyAxfvHHM7CEuR8lFUR/0vNpIotT4ysZgUYR8Zk/I9hMArnstLTL/Jof4Ei
	KD/3rz501igdss/WvOYW0dywZ2Myj8LRCcAEM/OwlwhWPCBoArnOemPuLV8Ngyeyr405ge8knssX+
	+aYZwl++uvo0GPRMYJSiZvsQPFPppqAAuEutldFNuJ013fc6p/HO4O/wV+MvQL4uJAdIz86VP26+A
	gz5BF6Su8aZuoFYu4wiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGGM-00000003Ftg-3rDp;
	Mon, 01 Jul 2024 12:36:06 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOFvB-000000035WA-0jdK
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 12:14:15 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2c70c08d98fso2116434a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 05:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719836052; x=1720440852; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Il8RvAivystWZIG0DojBlqOoWjix3gP4iIZXLpKwVH4=;
        b=PIPzQCKRJ23RqV75IK6+mFAaFm+wosN5/xkUFvLDLswQE/ry8IDZSvyVkx6tWIwLE5
         Rp5cIp5J2c96dhkDufEijAHnlkh/mrq3aI9UsCiZgWt1HEjeKmevpuG+yK1c5BxB0eOi
         gr8k2drd8az4Fvtqp1bdx8qPDRqmdbPxzMySObNkN+l6claBkUFolvht2JhsO4EGvqE9
         iH7/65qoKHtz6wrQL8wjPesIcoWD7sn/IjmkmaDvc9D37DRYjK2NJRC7JxefX7sN5iiC
         PKn7R30e91EFzQiQpLpXv8rdpgddR/eVOPLRi/yIheyhrydHEc7W3htdAbF4WMIw/YIU
         rjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719836052; x=1720440852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Il8RvAivystWZIG0DojBlqOoWjix3gP4iIZXLpKwVH4=;
        b=DtBKMY6dLUpmOC8RvfKS9PryY+T8WTM3NPI9+jiqtuwwE5vnqzzUxydmEATYlnKaql
         ymcM1rTLd2AdgyrxEfvmhdJ1KvWPu/43L3nLxuBhu6qPm28UfoCWCHryiLShMxJhN76k
         r0ccr7a5rEBZ8gJjw8OKHqbb1Js978FRtaiRMkjfnhcai0QFIegnaS3pG5t2iDRbgepf
         WmsbLIA2fkAjihVgF31/z5rVksQgGoQPga4OfD3IlKBdEwJ71OygsJRFjLKLZwq1FnGm
         m7+jOyIWPRgxgefnBWfFaPSuqDlAAd+k1XKD5cSXW5hALHNqPriDSPe5pd/QV/WCTbGB
         Fz/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWdWalzuTIf/NT95b/+98YiGRGIQqnOb7Wed9flCwHswcBGrXz6uGAPn/ipMWaYAes1mp9txUbWUPDrUTqMMKyO5N3q7fVobFL1bC6uVFfT
X-Gm-Message-State: AOJu0YwFM70O1nt1CKr+okpGBiDvO8XwXasQ2L/1bPCfux7eGiWXX0gQ
	skMv/I10okKWmCIl9WOgPR1uAByrgdVCt8GZ1RFujybHj7fAdG/Y
X-Google-Smtp-Source: AGHT+IHs8mCU7JTsODYLCtCH8cGJqwnp47JeXfiA6d2spp0vsMSWOcIJ61nbGfWMfVqbr1aqe1wgnw==
X-Received: by 2002:a17:90b:19d4:b0:2c8:5bd3:551a with SMTP id 98e67ed59e1d1-2c93d76512emr4212533a91.35.1719836052174;
        Mon, 01 Jul 2024 05:14:12 -0700 (PDT)
Received: from ga401ii.. ([223.178.83.109])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2c91ce17a77sm6613098a91.6.2024.07.01.05.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 05:14:11 -0700 (PDT)
From: Kanak Shilledar <kanakshilledar@gmail.com>
To: 
Cc: Kanak Shilledar <kanakshilledar@gmail.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/3] Add basic SPI support on TH1520
Date: Mon,  1 Jul 2024 17:43:51 +0530
Message-ID: <20240701121355.262259-2-kanakshilledar@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_051413_237726_141F379B 
X-CRM114-Status: GOOD (  12.28  )
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

Implemented basic SPI support for TH1520 SoC. There are two SPIs reserved
on the LicheePi4A, one on the SPI Flash pads that are blanked out on the
back, and one on the pins. I implemented the one connected to the pad.

It is using a fixed clock of 396MHz. The address and clock frequency was
referenced from the TH1520 System Reference Manual [1].

I have tested this on the LicheePi4A.

Changes made in v2:
- Changed from single patch file to a patchset by splitting the single
commit into dt-bindings, driver and the devicetree.

[1] https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf

Kanak Shilledar (3):
  dt-bindings: spi: snps,dw-apb-ssi.yaml: update compatible property
  spi: dw-mmio: update dw_spi_mmio_of_match struct with thead
  riscv: dts: thead: add basic spi node

 .../devicetree/bindings/spi/snps,dw-apb-ssi.yaml |  4 ++++
 .../boot/dts/thead/th1520-beaglev-ahead.dts      |  9 +++++++++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi  |  4 ++++
 .../riscv/boot/dts/thead/th1520-lichee-pi-4a.dts |  5 +++++
 arch/riscv/boot/dts/thead/th1520.dtsi            | 16 ++++++++++++++++
 drivers/spi/spi-dw-mmio.c                        |  1 +
 6 files changed, 39 insertions(+)


base-commit: 6ba59ff4227927d3a8530fc2973b80e94b54d58f
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
