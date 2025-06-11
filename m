Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81ADC677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 03:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XFjoGqRBJnl6VRp+9NuRTXqZ9Btm38B+QG/t5UWi3hw=; b=sjnRJH2iAq7AN9
	bb0FqZnPSwWIqQZPLRoRUZnh2gLA/cqUILjMB2eXIMu95U2bz8gN7WL76SV7UIpeLnbZRXXMz+Okx
	CwNTblgz0388TybSaWoLoCNKFwEVt7tTIv83WcSLf5rIDrpsh4WJ+h74Moopvc+PCKVI3vSs56LN+
	N/NFbQywWRPjQxEnRl0uA0a7RfJSu74tXcP4aBZm+mp/05awgAOMpt+NXiCRjzqnqKe0tBDX08UaZ
	Qbb1k/1Zcnr7ZoKjYsKUdYm4FNWDM8JiLBOsbxsYWFgKOk4j67VY7tbHtz50UiCrlNf+espF9W6WW
	vPaWmEdJRMOXzDVNCTXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPBrJ-00000008iay-0Lgt;
	Wed, 11 Jun 2025 03:10:37 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPBrG-00000008iaY-3JcI
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 03:10:36 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-236377f00easo19202765ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 20:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1749611434; x=1750216234; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2YpGMUU2gIjP1YnCfMmfjdfZdTXulLsIVq+e8CQd7A=;
        b=kAzFRwKW93oX91uwtLO0kURpSspRcrmh7+gIQUr88lefOL8CT4NCRcvm6BIUOhnPv+
         PkJde6xrv8trosV6C9TbLDaCPGCarAbk3RIj6BIKUcF1qMRolfP6I5388S+gBTWH4d6a
         STZYd5UiC7LbLGgOgWi7SoUa3OshodQonl7LON8Lb07pqwssOKUoTXV68+XyHhFM4nux
         ppv/ENZlD0obiowMYm/brTsbSH5psM9coa/Yq/x4bfrbEDTQKZktzyKlOjYaEs4Xdfn0
         XBOkNpPV7rkNZAltQ8mGdxAjLKnVkb3NNPjnOs+Kq+PHpzMtUFYhMe5jfiKE6XEkOUgi
         A1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749611434; x=1750216234;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2YpGMUU2gIjP1YnCfMmfjdfZdTXulLsIVq+e8CQd7A=;
        b=RFWZ8+NqCbGag29IW9VXJsxHv/5S4dsWMj5APBFJitP3SNLIT52hfAv6FLWADZepOD
         N0gwPb6FpCLXS9R0a/GvJ3Nww/YFjDIqn347QjD1T3EIaVE2xqX/P8Hy/AKdmyEBtfRD
         mLFu85gI/XLVcr5vq9nCVwfFSELpbervL0rd7kaguOu6CbLb/83j495oLAczVp3C7jqF
         Y2UIjpsLNLFiF2la2IsZptjDGLXNLzBc18Fuqki0UQrvZlIL8Zifp4NsuZYgqpEJ/ODF
         OAnCHFp6tRYcGBpqFIBd2ivPdCSge3jzcDdXLi/zHP1TvNG93STr7nbXubrOzjughTvt
         oUEA==
X-Forwarded-Encrypted: i=1; AJvYcCVdp/2JlcvC7lyhefFzAohvSNRd4iYzEFB2xHyNn7Ekp604eoCSaNWOB6FC6UpVEtuC3hCIUPW1pNR/cA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7YmjpG66CCfvb61qkdoqT7PZnnFgahFeqRoP9rPUEw3Uz8Ghe
	/rwI7s+R+TE7DE+2g5hYHxrEUVyTTMXqMt7q/1PnNGRZ/PgxGdxBNFkBWNZ2/1kpISA=
X-Gm-Gg: ASbGncuRxYDJwLF5ZfJ7TNI9wlaRbt0he4EHP3fFSO5fuqHDcKgnmprV3RXJ7dtGhdE
	lFGHv4EkUX+Yqf/YoOigz9qvvEr4sw3YunZAqYhiMtHagmdgtufkaFDQYYDgEdl5c6KQoBvpHwG
	hCVJvZSG7hQ6PmINgejeZfTg0RdH6NoIacPoQ0GsuE9jjFIYZ+jU5ERkH2zrIUSsjfbQD7Uu20u
	T0G+PKDp9tROu16vGy/nrENM/6SzZcl+JD0ryau0S/W2b8OPg+pPBPf0y6rI4XW3tOjk0AQglDF
	HqyvJfnCfMZ+Nc2RVB7H9adbUREblzuu6CU+O6KqXqPD/fYUvVQ9haN5ICbRTQeXmIERl+S60sl
	267cXy9u3enHyNYVgY4c=
X-Google-Smtp-Source: AGHT+IESMK2S+65o2kSPGa9uk9cH0yzicqiZbuZzqQidUwCxa6z8uc7HL/z4vGduP+GHtOp2+X7qPg==
X-Received: by 2002:a17:902:e541:b0:234:a139:11f0 with SMTP id d9443c01a7336-2364260d2bbmr15145915ad.7.1749611433582;
        Tue, 10 Jun 2025 20:10:33 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030789c2sm77669035ad.29.2025.06.10.20.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 20:10:33 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: Nick Hu <nick.hu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 0/3] Add SiFive power provider driver
Date: Wed, 11 Jun 2025 11:10:19 +0800
Message-Id: <20250611031023.28769-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_201034_851581_4F024886 
X-CRM114-Status: GOOD (  10.77  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The v1 can be found in [1].

This patch introduces the SiFive power provider driver, which sets up a
generic power domain (genpd) provider to coordinate with the RISC-V SBI
cpuidle driver.

To enable this coordination, several functions from the cpuidle-riscv-sbi
driver are exposed for use by the external power provider. This allows
coordination between power domain management and CPU idle states on
SiFive platforms.

Changes in v2:
- Add the driver for SiFive TMC, CMC and SMC
- Drop the `sifive,feature-level` property

Links:
- [1] https://lore.kernel.org/linux-riscv/20250509021605.26764-1-nick.hu@sifive.com/

Nick Hu (3):
  dt-bindings: power: Add SiFive Domain Management controllers
  cpuidle: riscv-sbi: Work with the external pmdomain driver
  cpuidle: Add SiFive power provider

 .../devicetree/bindings/power/sifive,tmc.yaml |  70 ++++++++++++
 drivers/cpuidle/Kconfig.riscv                 |  11 ++
 drivers/cpuidle/Makefile                      |   1 +
 drivers/cpuidle/cpuidle-riscv-sbi.c           |  17 +--
 drivers/cpuidle/cpuidle-riscv-sbi.h           |  20 ++++
 drivers/cpuidle/cpuidle-sifive-dmc-pd.c       | 102 ++++++++++++++++++
 6 files changed, 215 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/sifive,tmc.yaml
 create mode 100644 drivers/cpuidle/cpuidle-riscv-sbi.h
 create mode 100644 drivers/cpuidle/cpuidle-sifive-dmc-pd.c

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
