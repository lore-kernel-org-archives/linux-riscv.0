Return-Path: <SRS0=MTom=OY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD2DC43612
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 15 Dec 2018 05:22:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CC6520645
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 15 Dec 2018 05:22:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LwaOcuCi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ZVz4Ch/a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CC6520645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3N17ND37YogEduCt5vcKPrHfmvJEv8cS06+nVSjfOqQ=; b=LwaOcuCijBVV0u
	axwF7YNDmiUBBtZCm8izeP+NV+npX/YXesr2FHruuupY0EtGcjibVocGL+g+HCN444EokkPchlueO
	PQ4XeyP9NC6DqKV8cQAYCWF88XLXmqm0+i2rKlX+afB7Gxxs7ZomuQCtjx4aYYHMpVxDKW31H2lDJ
	6AxXuxDOkad5CgWEk5xIhHTaOYX6Fokcst+G804CENzn2dgxVIh0g/53WpFYXs5DarMXRmiisWlqw
	2FpgN34oEaRENiZXgOv8OqYUPd3dP2T9gFxV8OlTvnTSgeVVcTyz298tq2Ssn1LWtTdm70YdcfScw
	arYXPTwLAaLq6KXZuN4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gY2PJ-0004YK-H9; Sat, 15 Dec 2018 05:22:33 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gY2PG-0004Xr-VL
 for linux-riscv@lists.infradead.org; Sat, 15 Dec 2018 05:22:32 +0000
Received: by mail-pl1-x641.google.com with SMTP id a14so3652113plm.12
 for <linux-riscv@lists.infradead.org>; Fri, 14 Dec 2018 21:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WfcYjdauiywCzBPSnuM2mOLdoDThmA8NHEBfirFw+VE=;
 b=ZVz4Ch/aMMf2RvKx7q3I3f0FJsreoYuTEk+kaPBUg93v2sNtXgKXgzqAlBiPbycTOy
 L97u3Y7cAAlMfy5veR2ntwIGn3pbCeSy5zUVgYZkGeXSPcSlEaZyL9GxkNddETqXtKb1
 AnWe+a0253+5IXtRMsF517mXPgKdKadc2lUCO2hSK7u1oTKtjWYP7OvJTsn+YrNQKx87
 ZYQuuERCAcw3LcIqqSvql31ibokeQvJJLtbvgTqN2aZY9K4OHH45BN5pgBAHDdjTs0T4
 GD7NMroXWIkZ0YjkY9Mu+k3iABkpjW3mc8BNVBkLNtrpwLcsMABPTsyoe7/C+X8k8Tw7
 pv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WfcYjdauiywCzBPSnuM2mOLdoDThmA8NHEBfirFw+VE=;
 b=NUrH3sglDXbDwbGMoGHtBxgfGqPrbFLfHdtwjxYJmSajSVfy2VxmLCK1WLokbTVdij
 uvoBOgX/6FW+sUqnjPDjQTCelRrdy3AtrJSrZYVucUQrFJn7TEE2fTDLwMS2qQUg1hkZ
 3XjSm5L0bV5DWRzf0owoUN8BrhD/knPQlA3CW+0n47S0XGVK+eFkcuuo2dRTT6bxl1jW
 gg1ekx+616rS5uUusvYuRpfrJmjKitPMQOsR6Rlu48qZLgc52F0tyeGEpc11bMTS6g5+
 ple4JqXS8ZU4bpfA/U3UFQOF4vRMhCr8Jd8xa/Y1qPSmNWRgTYUv76zPvEhi1a37awQt
 Hxmg==
X-Gm-Message-State: AA+aEWZrEUY/Hdnaa2yYr2Sefj0GnRvVatHqKN6DinzJNqeABVyHpod2
 iDWm0Y99sH60wKM29ahza0FgmQ==
X-Google-Smtp-Source: AFSGD/Va8i8w7fCbg5cTBlIyg6mEb1iUwjAxGJKeWfjhMuQiX3okFOD5OCQW2PPRQBjJXmQlHaWGig==
X-Received: by 2002:a17:902:6b09:: with SMTP id
 o9mr5397556plk.208.1544851339423; 
 Fri, 14 Dec 2018 21:22:19 -0800 (PST)
Received: from viisi.sifive.com ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id z127sm11351282pfb.80.2018.12.14.21.22.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Dec 2018 21:22:18 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/7] arch: riscv: add DT file support,
 starting with the SiFive HiFive-U
Date: Fri, 14 Dec 2018 21:21:47 -0800
Message-Id: <20181215052154.24347-1-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181214_212231_020931_4872CE96 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Add support for building flattened DT files from DT source files under
arch/riscv/boot/dts.  Follow existing kernel precedent from other SoC
architectures.

Start by adding initial support for the SiFive FU540 SoC, and the
development board that uses it, the SiFive HiFive Unleashed A00.

Applies on v4.20-rc6.

- Paul

Paul Walmsley (7):
  arch: riscv: add support for building DTB files from DT source data
  dt-bindings: riscv: sifive: add documentation for the SiFive FU540
  dt-bindings: riscv: cpus: add E51 cores to the list of documented CPUs
  dt-bindings: riscv: cpus: add U54 cores to the list of documented CPUs
  riscv: dts: add initial support for the SiFive FU540-C000 SoC
  dt-binding: riscv: sifive: add documentation for FU540-based boards
  riscv: dts: add initial board data for the SiFive HiFive Unleashed

 .../devicetree/bindings/riscv/cpus.txt        |   6 +-
 .../bindings/riscv/sifive/fu540.txt           |  24 +++
 MAINTAINERS                                   |   9 +
 arch/riscv/Kconfig                            |   2 +
 arch/riscv/Kconfig.platforms                  |   8 +
 arch/riscv/boot/dts/Makefile                  |   2 +
 arch/riscv/boot/dts/sifive/Makefile           |   4 +
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi    | 182 ++++++++++++++++++
 .../dts/sifive/hifive-unleashed-a00-fu540.dts |  39 ++++
 9 files changed, 274 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/riscv/sifive/fu540.txt
 create mode 100644 arch/riscv/Kconfig.platforms
 create mode 100644 arch/riscv/boot/dts/Makefile
 create mode 100644 arch/riscv/boot/dts/sifive/Makefile
 create mode 100644 arch/riscv/boot/dts/sifive/fu540-c000.dtsi
 create mode 100644 arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dts

-- 
2.20.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
