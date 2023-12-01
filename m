Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7885AC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 13:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3R6Natsox/lD1IZZQPmwbpHQ2n7oBS2mVGCRjJl13LA=; b=gk+hK2pWUob4er
	F9sDkkrMOncymsrPsB/Qb40LInlO4G0KwULgCitpXovVyLTlpg7CBCxzjBqgwq0pf2V8gQJj2Br/m
	16lHFJlikqa0NFH8fBzlAuA/gBAG/t/8mpF2aId+xug8KOLfE37x51TTtb5U98nPV3wX5MqGovFRB
	TBWvus69MmZ6cSZhS+12ANjT1BrnRbv4GDQgR/WrHXMlq7qKaBBUt02ed5UoMqJ+6iQm/zbPwixLe
	GvdVbZbL3H9fXcXoHTHytqj4S4dzpxwIQb1U5IJfCNX9mQX0j6criwx2DoGhLTYr2hb0/lX58GxaH
	Q30d956tLGY63acuArZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r93bX-00Do4p-1R;
	Fri, 01 Dec 2023 13:30:51 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r93NZ-00Dhn5-19
	for linux-riscv@lists.infradead.org;
	Fri, 01 Dec 2023 13:16:26 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3333074512bso414528f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Dec 2023 05:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701436581; x=1702041381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Oefvw8vfrlQSt1SiU7MAz2Q9oKRpPY1beWRnn6ETdA=;
        b=GEDzjTvlf0qeOXJIZ5+R1paac3O+oMkUFXvRD4TqaGee4yQlhAtznw/dUM4mzmu3nV
         NlK8m+lpWOhfN3MuUkJuKN9y8ak27xu4Z5xvxZMPeZzyKi9akO4SwFyDE4YATrw7OdMn
         A4n8QI67yyzhbnFjFMmTGh/47FrlNqyvenwzdTbDz2XVuFOLz3kavBjCOsBWi4tlD8lv
         Ow4DxItfRfDiCZXvf6yWh/TlEWtWGrBiqUN8IysNpcx5v59SI0o136SKpoGEc5ggJzOt
         qPPHNeKoPF5RmASZyUZlqU0IUIiW7xOcDUWXp0yDshDNEeQ1LBzPQuQHJIAz+VANmR/1
         wzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701436581; x=1702041381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Oefvw8vfrlQSt1SiU7MAz2Q9oKRpPY1beWRnn6ETdA=;
        b=ttouQUNZjGmgkMBOG/SnlrfezzwtttuLtfIFRWK1ld0RajkJ3azUrQhIRVRCpOAuoe
         Dw412IJ+g7vVVNeiKaJrs3LAyjtQxCEkz0rUTbi37kZOdRI5n+PUMNDaWxRaQJw5opgx
         Nj+ySJ4h9Lzq2mE9yQsyKjvIHusPc1mJdfiVCSFTqb0LDTLThyUlHkztcTSTXg/JvFFy
         04fwlGlNUVDmk6qGs99KgQajnwSdbqcfi+YWAlvFoA9KWLdUdIR67YQowgirjfRhegqY
         jrU+TuKRHlMj5CjwOMMzpyfY8IwI7z0Ep2eDby42TFyzN1PXy9+wgWvHiMUS7vaaB6JS
         MHdA==
X-Gm-Message-State: AOJu0YwjhtaISmbksMOeq1HIpyUfDQup0DRdUXPI1dORUsoFn+Qd0SqX
	85uF8UEaAOFL1HKbT+8Ctwo=
X-Google-Smtp-Source: AGHT+IEHAMpWGDplKBye0RkYxyWg5uIkbLq3Ug6U1LqAC8O2pKq7QhmYO/iPQ1ktZG4tdA77mc2N1w==
X-Received: by 2002:a05:600c:4687:b0:409:6e0e:e95a with SMTP id p7-20020a05600c468700b004096e0ee95amr719556wmo.19.1701436581462;
        Fri, 01 Dec 2023 05:16:21 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:3c2e:cd45:f50f:f083])
        by smtp.gmail.com with ESMTPSA id fm21-20020a05600c0c1500b0040b3dbb5c93sm1451723wmb.1.2023.12.01.05.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:16:20 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/3] Add missing port pins for RZ/Five SoC
Date: Fri,  1 Dec 2023 13:15:48 +0000
Message-Id: <20231201131551.201503-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_051625_395029_7463DCC5 
X-CRM114-Status: UNSURE (   7.96  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series intends to incorporate the absent port pins P19 to P28,
which are exclusively available on the RZ/Five SoC.

Cheers,
Prabhakar

v2->v3:
* Fixed build warnings for m68k as reported by Kernel test robot.

RFC -> v2:
* Fixed review comments pointed by Geert & Biju

RFC: https://lore.kernel.org/lkml/20230630120433.49529-3-prabhakar.mahadev-lad.rj@bp.renesas.com/T/

Lad Prabhakar (3):
  pinctrl: renesas: rzg2l: Include pinmap in RZG2L_GPIO_PORT_PACK()
    macro
  pinctrl: renesas: pinctrl-rzg2l: Add the missing port pins P19 to P28
  riscv: dts: renesas: r9a07g043f: Update gpio-ranges property

 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi |   4 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c     | 265 ++++++++++++++++++--
 2 files changed, 243 insertions(+), 26 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
