Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F91C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Mar 2022 05:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kmOkOftiaVB7fLbdrHaEt0x4Dt4aWaRqANQw9VpU6DU=; b=fRnjibD/QrRg5l
	1UjmVEeD2GykIpq7Nguft2lIewngMRIVmEhnNPXO2P05butKCzQwxMZ/9O3idu3QAJkyb+fmzy+1+
	kue32cj9t+mMP39TQJ5E03cqvCN2hJCTOsSa0OJYycPZ3rdVrrirc8rFA4QzvaKaan+/ftCsQj4gn
	nO9wgWC/CK5fOreLMkxEhXYq1Uvgd5gRTwIpF2WV8hCEcfaMglsc9mR2mHNGyBaX8v6TaajZ1xZQI
	i1Cbx9ajbdKWv46onRmeFkFxymieqb0IoVirWop8bugelygsULZ5lqchNCSLEJUt2NScthPkMDPkq
	2+7mrvqVZ0T78sKe7iVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nR6Ae-00Fwni-KO; Mon, 07 Mar 2022 05:44:36 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nR6Ab-00Fwn2-KO
 for linux-riscv@lists.infradead.org; Mon, 07 Mar 2022 05:44:34 +0000
Received: by mail-pf1-x435.google.com with SMTP id s42so191184pfg.0
 for <linux-riscv@lists.infradead.org>; Sun, 06 Mar 2022 21:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YWajgjcCCrnsZSF3IfZMfbxzzFZcQpbBns1alayx99E=;
 b=cGSKTJZ3Kh0Ek+WCmI4HffDYMUe79KY/em0iV2NUNCazJjGDuknQdSzpMZoSaLZmTW
 MWFW28V2UbmFQKm/k3VUesxpUIBWzAjLzi2WcDEab8uTZuIAd1MQjyvECjNRKr9+ruFH
 FNTKNGnEfcD1KYvDQ9idr3ukmIYhMRFgqGmexUFgyYHjJYbadhBDKkIE0L7DsSnD3Zjv
 HykdLhbEQaupRwNLgPP4ZSdjV/Qo0IALd4wiaDRaNm9bd7ahZWuGrIGpL+yhLbnJXgSS
 x0PUdKL3Kbe0fk3XC/83eJgP6jMQ0WpG489XH/88h9sIiLD0iO4AXz0cNoq3fnbBgbeT
 s7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YWajgjcCCrnsZSF3IfZMfbxzzFZcQpbBns1alayx99E=;
 b=sPXpwBrPzvYnbAqEnSrHjBnWYP0wLSHIy56PKamSHak4+re3lBQaQNo0aE66TIvQ54
 pW5IkCMZvOZBBcVmOzVazkLecc8X3NMLyGzRUUYdDlGJtkqZWyRDBBNBVTm5C3BydjKC
 5DzoGzfwIlth7s4qr8ztsRjmcUbNsN9HFhO1wxpGjOhY5T5KtJoO5EG+x/ArpWj/nK46
 m7iykPYy1ACt1XBK8FRInwVGPI96uVCQQG8BboaqE73wZUWuNVlR54592b4Gr9ONzJrY
 255wcgjlnZSLL86aZPQPizLfnJY6Tef3w9oj+4Ni2xruWXB+SlbwpRFnE9thvcUUShRI
 /TUQ==
X-Gm-Message-State: AOAM532DIwV12DFVnNk2xxMu8em5lnswQBU4edTr6Vne2qKDp7x/AQ1x
 HjFGMFEQxQq4zqwpjccBzMGNpA==
X-Google-Smtp-Source: ABdhPJwnA3KEBp7KJP4Dkadosl1pu/fl5hoM+iRWl2JxYsBzf8nK0VH8nGH8sx7PD9Mes5im6f4iZg==
X-Received: by 2002:a05:6a00:1a09:b0:4e1:67a7:2c87 with SMTP id
 g9-20020a056a001a0900b004e167a72c87mr11135766pfv.37.1646631872090; 
 Sun, 06 Mar 2022 21:44:32 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a056a00168100b004e0e45a39c6sm14447385pfc.181.2022.03.06.21.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 21:44:31 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v7 0/3] Determine the number of DMA channels by 'dma-channels'
 property
Date: Mon,  7 Mar 2022 13:44:23 +0800
Message-Id: <cover.1646631717.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_214433_750302_1D817773 
X-CRM114-Status: UNSURE (   9.94  )
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

The PDMA driver currently assumes there are four channels by default, it
might cause the error if there is actually less than four channels.
Change that by getting number of channel dynamically from device tree.
For backwards-compatible, it uses the default value (i.e. 4) when there
is no 'dma-channels' information in dts.

This patch set contains the dts and dt-bindings change.

Changed in v7:
 - Rebase on tag v5.17-rc7
 - Modify the subject of patch

Changed in v6:
 - Rebase on tag v5.17-rc6
 - Change sf_pdma.chans[] to a flexible array member.

Changed in v5:
 - Rebase on tag v5.17-rc3
 - Fix typo in dt-bindings and commit message
 - Add PDMA versioning scheme for compatible

Changed in v4:
 - Remove cflags of debug use reported-by: kernel test robot <lkp@intel.com>

Changed in v3:
 - Fix allocating wrong size
 - Return error if 'dma-channels' is larger than maximum

Changed in v2:
 - Rebase on tag v5.16
 - Use 4 as default value of dma-channels

Zong Li (3):
  dt-bindings: dma-engine: sifive,fu540: Add dma-channels property and
    modify compatible
  riscv: dts: Add dma-channels property and modify compatible
  dmaengine: sf-pdma: Get number of channel by device tree

 .../bindings/dma/sifive,fu540-c000-pdma.yaml  | 19 +++++++++++++--
 .../boot/dts/microchip/microchip-mpfs.dtsi    |  3 ++-
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi    |  3 ++-
 drivers/dma/sf-pdma/sf-pdma.c                 | 24 ++++++++++++-------
 drivers/dma/sf-pdma/sf-pdma.h                 |  8 ++-----
 5 files changed, 39 insertions(+), 18 deletions(-)

-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
