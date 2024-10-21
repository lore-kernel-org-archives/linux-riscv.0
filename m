Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334E8D0E6D3
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 08:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bH52F8y8DgA4kKqETQNDDkdJLUfhAgGcty5nGkRo6fM=; b=GfRcqKKcvSW+q1
	o6kR5DwgS8E2xX1qXF+aN3hyM1rXkV8nTIMzXkJ8WLkN+1A4YlOSN/elCfuCjRHN+67x9exstXblv
	QZ5E1Iadouiv8meS0o4H+/pVlCE65+gbjbULJ/+660txTGKuh9fsCVMG9xvG4CneZMyZlN/rdoBx8
	ZvaHPf6bkTpZ3vwQAy0kIUEiEt510GPm190HvNuTWNhd6Ywh92pUsI4CN7YCWO66+58/xyq/D0ziH
	iKnpSh41op/liie+ZD7EnW6bunsfiaalRPJR/8ApWOwf5MFNUfxZ1qC05g9Fiibz+uhx7ZJhj1r9o
	Owu7Do7cLNvdtJzyEbdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2o2X-00000006bFu-0sV5;
	Mon, 21 Oct 2024 08:45:25 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2moS-00000006N4f-0j8d
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 07:27:16 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-71e5a1c9071so2933073b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 21 Oct 2024 00:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729495607; x=1730100407; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4j1C+M3vH4yYgJravAN3BbrEjhxeaomVoGP3HhhhDJ0=;
        b=beKqTarfhVdlIc5psuM/vfXarBc0/1FYvKhixznz+XMnPxvkOsllAb6tDoSh6tVd0W
         aSNKznCyFvZtfAGkEjZrSv+paF8CN1ztcMNmTH8zLlV6AOIP76NWnp35WydEEk/vnbG8
         tGnCaEWAtVGmODCW//N23DCo2/+YBWILcP6FAYfCNzgkO6bINYBj5SBfkHgL9xlqFZMv
         +ifRwxeo/uQ88oTKkwi36l0TZkPf5DH6MIFx3wgxwmsRTA+6gVC82aBEBy4cPRhB4A+O
         yaGUltFQp5sLhq6WMXtcLAGQIKKZSem5w5ppExIg9aYMiCxT6O1svr/03siB6gEIzPgp
         fdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729495607; x=1730100407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4j1C+M3vH4yYgJravAN3BbrEjhxeaomVoGP3HhhhDJ0=;
        b=vIvbvi1NTykmKXxROzDuStPiwANV1+7A/Zoijt/qfqNVOcTQ6IGXwm/lnrHT98IwZs
         T4dxxbS88C+WbTk02NTi+/K9R+IW/52YO8LBiMGzsPQeLP9JbjyhEpX1q+8c0u1OAXEo
         emEqF747ScQEb5gVfbElvbJQCXRqgfGhEKXv4Aglr+OT8g8xL/6dkTEViD8BqCF3GD/X
         og4i0ZyeaQ9Y2dDrE0IXWdM0Wm5+weoXssnIZpw2XM8Bs9K6uOry3d+KEjd2B/wXuu2P
         SYHnv0OC7pLjMBbSINByPyBWIp3PlMzII/7/SQ6+q+4ZxVGYqj4AdQHhEC6tjq1Cg6HB
         g4eQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3R2Kd8Q2+EO6+W83L6YQB3v637t4gXFEUzDtKpyEItnXUNm1Mkf8NapbO1oDOxDM2ZeOH8E2yfR996Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHyHyX7OmURYDhVAWSS2/oET3d8XJ3xMTB7m3eXcOh/3bKnk0H
	1gqvRgbxjLrFm9SfuIqWWTMyIEextMpyJ+1Sa5Mh3l09yhi5/9pe
X-Google-Smtp-Source: AGHT+IHqb73yFzexKFbAhuZdRp0bva1gxzmjy3KtNaUbjHVdxYDfeC9SLwusYN3X4iYo7hlJCIpGAA==
X-Received: by 2002:a05:6a00:c93:b0:71e:4c2f:5bed with SMTP id d2e1a72fcca58-71ea330c78dmr14610957b3a.20.1729495606604;
        Mon, 21 Oct 2024 00:26:46 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1356a24sm2263650b3a.96.2024.10.21.00.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 00:26:46 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/2] serial: 8250_dw: Introduce SG2044 uart support.
Date: Mon, 21 Oct 2024 15:26:04 +0800
Message-ID: <20241021072606.585878-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_002648_310988_639A23AE 
X-CRM114-Status: UNSURE (   8.19  )
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

SG2044 relys on an internal divisor when calculating bitrate, which
means a wrong clock for the most common bitrates. So a quirk is needed
for this uart device to skip the set rate call and only relys on the
internal UART divisor.

Changed from v1:
1. patch 1: improve the bindings commit message.
2. patch 2: rename jh7100 quirk and rename the quirk to
            dw8250_skip_set_rate_data.

Inochi Amaoto (2):
  dt-bindings: serial: snps-dw-apb-uart: Add Sophgo SG2044 uarts
  serial: 8250_dw: Add Sophgo SG2044 quirk

 .../devicetree/bindings/serial/snps-dw-apb-uart.yaml         | 4 ++++
 drivers/tty/serial/8250/8250_dw.c                            | 5 +++--
 2 files changed, 7 insertions(+), 2 deletions(-)

--
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
