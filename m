Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACEAC43334
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 19:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FNZMS0gyRN/zHHFbyTZG6Q8gc2b04DJKHngWpXMhz2A=; b=dLTAr1FIKIjES1
	pjZ2xAbRCpQw2tSojx3vq8NWniVawr44fEi5rzZFvaBDq17A0lw+kXA8emXS1VvY6GHYb7J6dGL7k
	YUYw2FJKdGglHAjLvdnvJaSR3eSGvAkimCI9Txpizt2HrYu+WjqfCqVt7EMH28q15O1AycHkRfjvm
	p1x/eoouCQpQxoEC8zsj56Nh/UrbmC6v8ss6e80CoEudOJxGPQqQluk1rp7RDPzvyEzLvWzc3TJeD
	RuGNUbdtvc0oIIcQwQhDirDO3QDV+A6f0pcxvqQHdgbSyLzY88l4oQYqQVk1E2ImBuLE5SHuKqPf9
	3NUvDr2TMYjPcIkbdMwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8nqw-002ENj-7V; Tue, 05 Jul 2022 19:04:54 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8nqs-002EKp-QF
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 19:04:52 +0000
Received: by mail-wr1-x436.google.com with SMTP id a5so4184790wrx.12
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 12:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rNypS/Ps1CBWBgjYuZdy3z58WPT5M3xoTeMQ0thxPjc=;
        b=IxTJoMz0nCrBnES3le7XtC6QWHQBYzxQdxKrvgrWHHQ1Eqc6fqgsW1Je3s5Eoq1Ukx
         nHZxm1tjHoLxqasEAqolPgRSjl5KYLED1gpKJ2vbMN+EOV/8yClDbEN5oI6UHMb6O6Qe
         AUkZWIiUoqelRGWJaqIXpgRys7uRJWzBTleJt20vBOX48UDE1pPFHyLDvGEZ0k69hv+s
         5aVTdO4rMNMtHShXzFEuVzVr/kHcOrJxmfh5wtqK5xMfXNGI7eOUdkbmgJ/sPBWqt8/A
         y0JIv4b/uLHPz8S7qPM038/r0Ev5FKHflxeDn1VwIMObPciof1a0sUlCB8iG5HbX4KpG
         9epw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rNypS/Ps1CBWBgjYuZdy3z58WPT5M3xoTeMQ0thxPjc=;
        b=vwyx9v2B/oUfCY2XiUu7+61vl2B7KQ4Zop6xeELSHENKH2J4twcE/+ZmTz1z4iKyoG
         mDmC322Grhp7fGvaanXNFZlgu+wKaNj5XDB0CvTXb4IZUtIi2kPBpg+XhNIYEEnRO2YV
         jim0+Om21pAsKGqkchL8i+K+SvWlnw7U//kboLV27/fixKNjp/pgIfGDbildqj0FOIjk
         iF6bj3XWdWI8HoTgzlOOrmQjEge6gfbwrUa9P1iU2Os/nOqRQ6KSxM/ucjsQ87/C9Hyo
         SG7mEftUcvEq3DwCaimLLYzbDuWsk/G1madKWDA9PYrg/6rtx/WewMYhB36efwLVZ2Ct
         Z1FQ==
X-Gm-Message-State: AJIora8juCn0DRx72S51vr+u9Em9UZwgBqLoMYeDLoLcn1e7OqU5j8v6
	+FFsnOD7Q46JsMkbLWR3D2UVsg==
X-Google-Smtp-Source: AGRyM1v+pz/4/WniSytkHRMrvOxqQ4ODFnWcGJAOF8n1YlCXqvGhgw4JSjMjHyUc5qatO2N2ueFCww==
X-Received: by 2002:a5d:6d06:0:b0:21b:c433:d1f6 with SMTP id e6-20020a5d6d06000000b0021bc433d1f6mr34255767wrq.717.1657047888610;
        Tue, 05 Jul 2022 12:04:48 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id d7-20020a5d5387000000b0021d5c52f4b4sm9912961wrv.34.2022.07.05.12.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 12:04:48 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Zong Li <zong.li@sifive.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jonas Hahnfeld <hahnjo@hahnjo.de>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Brice Goglin <Brice.Goglin@inria.fr>
Subject: [PATCH 0/5] RISC-V: Add cpu-map topology information nodes
Date: Tue,  5 Jul 2022 20:04:31 +0100
Message-Id: <20220705190435.1790466-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_120450_906138_D2287D66 
X-CRM114-Status: UNSURE (   9.83  )
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

From: Conor Dooley <conor.dooley@microchip.com>

It was reported to me that the Hive Unmatched incorrectly reports
its topology to hwloc, but the StarFive VisionFive did in [0] &
a subsequent off-list email from Brice (the hwloc maintainer).
This turned out not to be entirely true, the /downstream/ version
of the VisionFive does work correctly but not upstream, as the
downstream devicetree has a cpu-map node that was added recently.

This series adds a cpu-map node to all upstream devicetrees, which
I have tested on mpfs & fu540. The first patch is lifted directly
from the downstream StarFive devicetree.

Thanks,
Conor.

0: https://github.com/open-mpi/hwloc/issues/536

Conor Dooley (4):
  riscv: dts: sifive: Add fu540 topology information
  riscv: dts: sifive: Add fu740 topology information
  riscv: dts: microchip: Add mpfs' topology information
  riscv: dts: canaan: Add k210 topology information

Jonas Hahnfeld (1):
  riscv: dts: starfive: Add JH7100 CPU topology

 arch/riscv/boot/dts/canaan/k210.dtsi       | 12 +++++++++++
 arch/riscv/boot/dts/microchip/mpfs.dtsi    | 24 ++++++++++++++++++++++
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 24 ++++++++++++++++++++++
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 24 ++++++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7100.dtsi   | 16 +++++++++++++--
 5 files changed, 98 insertions(+), 2 deletions(-)


base-commit: b6f1f2fa2bddd69ff46a190b8120bd440fd50563
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
