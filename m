Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C14C71157
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 03:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=erS7rQXCyBSDaJdUjU5WI+VA3OEsiM/SOtKUMM7VHEE=; b=So1rcml9dG4c3B
	cdLUL9NzRmFP6ANJ6AHjBZnUxv7VGN+aKr8hn5KgnJagi4oqcY+4roGcAdmZ9D1jnbXFVeurwp8wD
	ZUnbeNBz5rLwrX07aUit5UQNFlFWBstfA8WH+EaUcv/EUPsoV7x5R0+2i6Zb790n/kmL8Ldv5LQFM
	sHRAmhixZ+hNp1w0OkvWfh41Wqz1KI3g0SHj9Ble9Via4Z/0j1CUSLwmanrxoszntaASkE+Q54wgK
	e6nUFHPlwC9Sikc8IUhHItyyLVmikIs2JkqUI+EmNbeXOMHc7GLadAlNtFNkuciMj3Vq/MUUMEM0n
	akxgGilXc/PImH3cZZeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRjGA-00000008t2z-2MUu;
	Wed, 18 Jun 2025 03:14:46 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRjEJ-00000008spz-3BOR
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 03:12:52 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-237311f5a54so5137755ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 20:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750216371; x=1750821171; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bN1ufSIz6Wdr6sIyj7BRHf668iy1Pf2mMb4+ZdyIh2E=;
        b=aimjUaI+TiMQVTSpMZmi1DYDICbMOuU9Tzfy74EjppVfvOnXqt//SeYSlYuXCVb/1b
         qscjmlvK28hlmZxzvJcBC2dxQUL8Vv2BzxMRg5j/F6aqxi9yFkK+TfZUXRY/KL9yoYJc
         NOmtieQBLvKfQdAL0hX5xCZ4Hbs5flImrC7pFF5FLdFe1cY1YTZCU211JOoNxTOx6uFR
         UKCrUeMrDDdwHjLOBQ+aqHfBL6UbSsuwnGppyvs/jwrQ9dym8DyC0cUS6dJprpWEa/B2
         QjSAMXnldIRxxTZV1/Z+wqce++aOtFdWKoFcv1qsA0hyISSkS7IBmmVER0xNIvLKtYxQ
         vgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750216371; x=1750821171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bN1ufSIz6Wdr6sIyj7BRHf668iy1Pf2mMb4+ZdyIh2E=;
        b=wEZ42qcSxMPMKB1pmh0mQs6dzli8z4hN/zzKU8ITWqzp/ePYgijnEy79vioWmBF9GA
         srJ7Raudg8EHT/msnZkO/eciW0gT3QmJ+HBYerwhgNhT4RznFxflIS05Y84q7vx5hYSH
         XIqdpDlXVyTeQmmSD4D7PeRYsBOcB0K8a3W233f0HQkznGnfW+fvAf/A3O3ggJM76db1
         EENcGol6bdyLl66yV5HW5djyKBDK7IA0XjKwnde1u05mbiwAK9YA93CTrabKPPxozyix
         zgodtN7juQHl/sDMcUHoXLXQk1gnpEGe5utS34MnoIsUX/orByyxj2rnXU7ga/xoE+os
         6XrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbuE0pQcXZMrHvdnjyP62o/CpZCPWWtOaIVs31RAH/CAne17VSj7te7C2wDxtuiWUhC089nWRSsCu3IQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyenSvnW+YQLK8ql+qYTp6/qB9wq4ODXmiNZnLX12udvl0g6+QS
	5lXOPLltbLPnPzQmn6N7d4atkng8liL74e9nBRT6RuwzxZ4AqAH1KOEN
X-Gm-Gg: ASbGncs99Vi3GFLfHDGOfEwRU6X6VwXKBDV/E3gjloyXOg+ei0eznihOX1RgZuA2rph
	iRgR8nEC4CKGgD90KInADnx5At+gkTPVoOS/s07BBfc48ae8CRk2NG+2L+RqXyVNwQndFZbcD/p
	CB3XZY/NJwPdxks/HpoWnc0t4q0unGuAKgrCqaf3cTnmIYxXDdSG/8C93obbl7UaoOzMRf9e1Vx
	ujxjuagQ0dnLiHSUFINmuPELYI82Y5lyB9f2P0embs9ZIpw2F4WyY0m+k0UlZVY07nG1D6Qv1X6
	k+ochgh8dbZZ2Hmnj7OgphnJBEzcoxsvQCTtIcG+3gg/jxj80SdMa4gXnuDKjg==
X-Google-Smtp-Source: AGHT+IGlk8EgvUOrNowxfJO2EgnlRzNvjbjQNVRsCmwDyUQL2qNF7QpmdsaUlm4gLUxNgjcVNHsS2A==
X-Received: by 2002:a17:903:46cb:b0:234:dd3f:80fd with SMTP id d9443c01a7336-2366b316c17mr244719105ad.2.1750216370686;
        Tue, 17 Jun 2025 20:12:50 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365d8a1847sm89028055ad.67.2025.06.17.20.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 20:12:50 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/2] riscv: sophgo: rename compatible string of the USB device for cv18xx
Date: Wed, 18 Jun 2025 11:11:28 +0800
Message-ID: <20250618031132.373216-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_201251_794524_C0B1EFC8 
X-CRM114-Status: GOOD (  11.32  )
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

Old days I added the USB support with a wildcard compatible string.
It is not formal and it is more clear to use a compatible for a
real world SoC. As the usb device is not used in any board device
tree (The patch for USB phy is under review), I think it is good
to correct this mistake before submitting the device node.

Inochi Amaoto (2):
  dt-bindings: usb: dwc2: rename sophgo usb compatible string
  usb: dwc2: follow compatible string change for Sophgo CV18XX/SG200X
    series SoC

 Documentation/devicetree/bindings/usb/dwc2.yaml | 2 +-
 drivers/usb/dwc2/params.c                       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
