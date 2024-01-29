Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D3BC47422
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 13:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RslQnxEw7Vc6zdaH8IcbBH6L8yj/jq4Evf/ZsVl1fyQ=; b=X+eXgYzs6zUk9j
	Q9eVWnLUczKDFHmu92vRr47hzX6nxitxh0ay5y1nf7htm1gHJXx5HIlj0tE30cR5QxHF2196W6+Ix
	pKWpwlxkBVv+SAXS0sycEFJiDcle5OSi9J7mTC8/eonGWJbAFt2IGX3SOUbik/qMhG0RdrRPE1/BL
	xGJ7wmjU+ikEnc9BPxRAk/mNaDK8GMGd7OCLUaz0IqJyE3HZQwdhC4VBmgPhtqiOVaN4QLJVcz2/i
	qxVL0XryF0qmIOceqZ7yyXqufJHmWdHIhRo+R/MYbze6DMiB1zeUk39y/NLD4+nnD/Oy+WQLe7ZWy
	byxhDYUC6X+pQqML+DCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUS7g-0000000Cxy6-3Ok4;
	Mon, 29 Jan 2024 13:56:28 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUS7e-0000000CxwR-35nV
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 13:56:28 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-510322d5363so2419635e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 05:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706536583; x=1707141383; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kLNm6aWjWhP3Zo5PR428kbbo6W3kbQTRbP3vEHT7Ffg=;
        b=L9t2cpKDniIrQiKtsN+SEYExcqXCsuxdUtmTVye+pW6AilsikXkb/78j3ccvg/PiCX
         yD1ODB1p+Znm22elkANpDnb4fFB7pvi7bvPmmQlVFa0BMEL1gzpxeVqF5iTHh/TbdE2Q
         05ZBqKWbHpIRfEKfQ2STsPdZdqjp3rBHd0zRe2N8BJERXu9Mjaivf4OJ9MMoGmuW3olw
         H9QvD645rO9bE3/LO0pUoPweJhgJVleGtnNKJEbsm79DpecrqH+jxJE2A4P7/JNvKFvL
         gNQcZfEijpwylmzUwkL+aaBBNfYN4FSd6Fl64wNtuHuu0Y7kfCwalijNurKBpzeit+jG
         JWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706536583; x=1707141383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLNm6aWjWhP3Zo5PR428kbbo6W3kbQTRbP3vEHT7Ffg=;
        b=cjpq5XhVxbdG8msRYYY7xBUhw0dtTabIsuOsdFVdUSp85iFiYaB9p4BIJQGspGbb/w
         u+jx/BQ+ifKqyNAXEzH0/n/p6pCju1bb/HdXmCV141bIpGyH+Z7y6w5OigstaaQ97aNC
         UtRd2hR/ROz7TumlLDRLqKL2o22mKXyCw3G1e4MAyqRFWYa4lYSDXJO59n2qRNMCiHTl
         gg+/IS0kABjmnMn0N/9gCz5AyyI9odMBA9mJ/w5bdCe01o2n5Q+HT1w0qty1FeoNcJH6
         0ibJ0B2JlR0amD5GGeoYcACHuhYPIo1obvFTPTb8vk6Nml348iNOI9Kn+H2lIYlTw72n
         +Q8A==
X-Gm-Message-State: AOJu0YwomL6yVNTh6udvZv0ipDtaUMlIVuCZ3X7dGj7PQsOe/JAxg/xW
	0Cen9GbFbGpYzwpsl9Zv7V0DtLYgOUvuCqFiLt4M4IUFYqMEDOsf
X-Google-Smtp-Source: AGHT+IEEtghO5GV+T/CBEzKDmZAqom9CfctaZ5B5R9VZvhtHodZrQXvLgfVQnCcQnTFaBnCC9ONtzQ==
X-Received: by 2002:a19:7612:0:b0:50e:36ad:5f6e with SMTP id c18-20020a197612000000b0050e36ad5f6emr3552167lff.20.1706536582819;
        Mon, 29 Jan 2024 05:56:22 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:5616:a18c:ea50:2995])
        by smtp.gmail.com with ESMTPSA id bh5-20020a05600005c500b0033aed46956csm3058057wrb.80.2024.01.29.05.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 05:56:22 -0800 (PST)
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
Subject: [PATCH v6 0/4] Add missing port pins on RZ/Five SoC
Date: Mon, 29 Jan 2024 13:55:52 +0000
Message-Id: <20240129135556.63466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_055626_827276_A8E708BA 
X-CRM114-Status: GOOD (  10.83  )
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

v5 -> v6:
- Rebased the changes due to conflict in pinctrl-rzg2l.c

v4 -> v5:
- Made struct rzg2l_variable_pin_cfg variables u32
- Updated PIN_CFG_PIN_MAP_MASK macro to use GENMASK_ULL() as reported
  by kernel test robot.

v3 -> v4:
- Rebased the changes on top Claudiu's patches
- patch 1/4 is new patch for using FIELD_PREP_CONST/FIELD_GET as
  suggested by Geert
- patch 2/4 adjusted the code again using FIELD_PREP_CONST/FIELD_GET
- patch 3/4 fixed rzg2l_pinctrl_get_variable_pin_cfg() as pointed by Geert
- patch 4/4 is unchanged
- patches 1-3 have been boot tested on g2l family

v2->v3:
- Fixed build warnings for m68k as reported by Kernel test robot.

RFC -> v2:
- Fixed review comments pointed by Geert & Biju

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
