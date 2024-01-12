Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E8BC4725D
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 14:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8GkgXxVl13NIA95btKt7FOJcK34TUOxFNIB+t/qUqWI=; b=aLTxFTHNrDjgcs
	u5ToXcz/lngZ6Gfg9tyVSsUsEECpGa6kaszaopeF58nVKO8kBPzBGwKJ5ivHIWKvz14aMcM1pJgnD
	bacD6WloDyfrRTP48uQefRbQSTpVIbC7FQPvgHYrgAfLWn81kqPSTyV2sIwl+VzKnpLMJ0f9GZVfa
	TirnpI/DUM6VGaOFoPQM9ZKrw5YD3abYQCnKpGTCfrJJ9DgUPexJBcB+Kw20xirYFI4WL1zJQ2gQ1
	iuJX1xYKYodrzN4gIAt+ZLC59JKBg2u2Y2bMJpyHHoMk7lQ7mck0ZakX+PqIO5SdYD8adKFro9N8B
	EnLp9L0riFnQzWUdMVHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOIUU-0031xG-0N;
	Fri, 12 Jan 2024 14:26:34 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOIUQ-0031vP-2g
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 14:26:32 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40e63ceb775so8616215e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jan 2024 06:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705069587; x=1705674387; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4K3qORjCWw+gkht7BR5kJjl56gwELapPIu5KXg30nNo=;
        b=mvZpHuhgbDUn6iTds8edTLx/lpk8l0nx1zk7dsP43UmfrGjegeLVW+mo8doE6ugre5
         GIiPyLSzfgzTrROndqJw1IMN8vyt0Jp866KQnlZ45bY8HKw+5fCht9vX2jStd7xcfA6u
         noQoa2Yvf4digYDog0j7Un6JqZNB/yQ2Xny/ZpWPW0qPPxFIlWEsE5D/iK+fa2CWnY2y
         xyyBCjLeLDuLMm7b1b9LM/8Fldt04NSF29/POFU8oXvDkpSUDTXR61wVy2NqVy3ZAQQC
         GqmfYLbx1mwX5aJLxH/egg3lWQ/AMBtZTMnwLjPJ1apJs3fJYBX7AVlxu5wyM9euJ5cU
         eQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705069587; x=1705674387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4K3qORjCWw+gkht7BR5kJjl56gwELapPIu5KXg30nNo=;
        b=WOe3E3/3jir99XVNTrgfUC2BbDQExFFlkHu3RaA4cKRkkjL48Vxi4D/Cq/aOEHlgDQ
         AamSC13SO+TjFNQQyA7YItkoprJx6PCF260CZwQJsmFrTSebcbIPXeqUuMAm7qlQnkO+
         pl63hMtrKZX4lmfeFJ1U0rOLFClmF6yXI+90/hxX2rzswJAf/HL3nhjp9ZGRU/xXpLMU
         DwN1Flq+fku5+h6puBUjVAaJYyFcMwyQ0TqgBlLDKlgQe7RIi6ay4O5Ogt5UNgcrlv4N
         VF3yY1J++XLyJfHMVZQHHNXHU4FlmgDnC01yAoA3OlTgavjpkFW7sT+OnvBpRStlx0QZ
         r/Dg==
X-Gm-Message-State: AOJu0Yzxg3qVIAjFxI0Blkf8yxf8TLvEc3Uxs6oVM32uGO8UpiMxc7Nb
	KwdKJn+nyH6Sq8U8GaKuyBo=
X-Google-Smtp-Source: AGHT+IHpajvBOFzp7zZrUTgb2u+zy2CCRsm5VcWjvelFGJ7z8i1+xpL84mVdNyt0hzeNAVRCV+krjg==
X-Received: by 2002:a05:600c:2202:b0:40e:66cc:46e6 with SMTP id z2-20020a05600c220200b0040e66cc46e6mr257214wml.181.1705069587239;
        Fri, 12 Jan 2024 06:26:27 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:494d:c489:3d96:1b15])
        by smtp.gmail.com with ESMTPSA id f6-20020a5d4dc6000000b00336a2566aa2sm4021219wru.61.2024.01.12.06.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 06:26:26 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/4] Add missing port pins for RZ/Five SoC
Date: Fri, 12 Jan 2024 14:26:17 +0000
Message-Id: <20240112142621.13525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_062630_865558_AF9161EE 
X-CRM114-Status: GOOD (  10.28  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series intends to incorporate the absent port pins P19 to P28,
which are exclusively available on the RZ/Five SoC.

Cheers,
Prabhakar

v3->v4:
* Rebased the changes on top Claudiu's patches
* patch 1/4 is new patch for using FIELD_PREP_CONST/FIELD_GET as
  suggested by Geert
* patch 2/4 adjusted the code again using FIELD_PREP_CONST/FIELD_GET
* patch 3/4 fixed rzg2l_pinctrl_get_variable_pin_cfg() as pointed by Geert
* patch 4/4 is unchanged
* patches 1-3 have been boot tested on g2l family

v2->v3:
* Fixed build warnings for m68k as reported by Kernel test robot.

RFC -> v2:
* Fixed review comments pointed by Geert & Biju

RFC:
Link: https://lore.kernel.org/lkml/20230630120433.49529-3-prabhakar.mahadev-lad.rj@bp.renesas.com/T/

Lad Prabhakar (4):
  pinctrl: renesas: rzg2l: Improve code for readability
  pinctrl: renesas: rzg2l: Include pinmap in RZG2L_GPIO_PORT_PACK()
    macro
  pinctrl: renesas: pinctrl-rzg2l: Add the missing port pins P19 to P28
  riscv: dts: renesas: r9a07g043f: Update gpio-ranges property

 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi |   4 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c     | 284 +++++++++++++++++---
 2 files changed, 248 insertions(+), 40 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
