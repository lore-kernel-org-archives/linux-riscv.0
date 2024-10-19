Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD35D3C921
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Oct 2024 16:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4sL4neaZixaYbdhArllLaKO4h0eoM9iKxy6uIGxyXdU=; b=yNgkodqudg8cIS
	rNj6QinEuoaKCV9EgH0Y6wn/0R42CDgyLrMkksaCmzfRqYat1o6UAgKOtbbb+9VB8xqlUszQN6dTC
	HVioHh6qwMIwDfde/z/0OsHpy4DUMXaYFoAI7dPJTEsR4lyhTPKsc4PrnqnvNzUSLUu/+xWf0sWkd
	lpcSo6UMWz9SSUzKWYGO3Q3LxMr7NPEMkWhLzrAbYw5ygOqvcLTYE9TNVEi5NUNniWohQxNa6HkF1
	Lttnsqn4oPzvNg7eWiwEVkrF71FrCMtoCoYCD4fJkJ4E6kyV3nveuuZ8yvnxdfc6QiXhE34Xs1CcZ
	1E+EaQCHbF+Jwlmq0SMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2CI5-00000003b1M-2mxe;
	Sat, 19 Oct 2024 16:26:57 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2CI2-00000003b0d-3NuD
	for linux-riscv@lists.infradead.org;
	Sat, 19 Oct 2024 16:26:57 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20cdb889222so32329435ad.3
        for <linux-riscv@lists.infradead.org>; Sat, 19 Oct 2024 09:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1729355213; x=1729960013; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zuy1YUr5PAEB/olP9kqL0ifQLvau2By5ndoP3zxsRa4=;
        b=Q4dxKM969jAutI4PBEkzEJNZMqny1qkfslonVEfMy8QDUIiyrgnG1khRxkwMMPrpaq
         dGyEleh4XsuOLv40K/vTwi6daquTzTyPJppF+c4T9ZgJTELLZNv9bO7lIGtcN6Swg/hT
         wIHWKXcrlVjgPDgdOs3vjZM4rxttaDgSGf8MOYr74Jn2vBAFG7FVKFYNeNfR+lcllc3F
         hn/IOR6yzDnck1689aoX8/Wm9iiZaF5+r8HojQVQfbD4optLzsPs6BzbR+BYvWNqq7K+
         D+q3fXHqxSo1rjf8xNcFnp9vpTgH9VP4Zrz8xVuOfWGcnNrhyY8HCzwYt2tkdI8KKmVI
         uJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729355213; x=1729960013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zuy1YUr5PAEB/olP9kqL0ifQLvau2By5ndoP3zxsRa4=;
        b=lr8q0Ks/dYZmqqqZ9TuME19JoLsyyinzRwseC5a1QvX54hP2IAbR2Z4Bq1qHHa7pil
         rFQ2Z+k2UDzf3IW7hzJE68wS/Wr39Nqo4Ykn14g15hbA0CYbLqUWxCPWjr/LPBL1x8Oc
         44IJMlN+OgDu1CVs5CGLL8vR8N2WJ77FOqWnydCKqpc7DhBKhTcQ2oWMCGOoMQWy/stX
         LGWIDK1YwaA0LJ8mnJK42lkYX1UtE6M+A1OeTAL0Ic44ulJ551DiVYzUz3xCol1dzrs5
         UV4vTwz8ftj0gx0b702ACsW/Fc9K2phl46gDUI/YuIYrssF6K8HJ71Ckar6AeHkqXXzJ
         velA==
X-Forwarded-Encrypted: i=1; AJvYcCWXmb8/SkQt0xzESMIa4Dw/UAhdihljtagSE/khzhLDtFSKNfQVXMYk8A9CANczdJMFRIpaKyyu1Eq35A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaMn+zx4vZqBLNw0lFJdv6Wi+XURBqVDu5Q+rJLyjqVHyCFgSw
	hHeqFtglVnIjWEXbHd/rTmsi/1UOe0U4th6ahr+7ONVO0CADNRISwfuiCPvvm40=
X-Google-Smtp-Source: AGHT+IHsn6bRkHaN0uRM4bi9maa9E6DhhXpOZ6dD4JBmzfF0Rj30oXT6ZBN39x0b+kkF6gl6I6WQgA==
X-Received: by 2002:a17:90b:4b0c:b0:2da:d766:1925 with SMTP id 98e67ed59e1d1-2e561732e2amr7176551a91.37.1729355213228;
        Sat, 19 Oct 2024 09:26:53 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::30df])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e5a8de4bdsm29567625ad.180.2024.10.19.09.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 09:26:52 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	rafal@milecki.pl
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	Alexandru Stan <ams@frame.work>,
	Daniel Schaefer <dhs@frame.work>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sandie Cao <sandie.cao@deepcomputing.io>,
	Yuning Liang <yuning.liang@deepcomputing.io>,
	Huiming Qiu <huiming.qiu@deepcomputing.io>,
	Alex Elder <elder@riscstar.com>,
	linux@frame.work,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v4 0/3] Add DeepComputing FML13V01 board dts
Date: Sun, 20 Oct 2024 00:26:02 +0800
Message-Id: <20241019162605.308475-1-guodong@riscstar.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241019_092655_071125_07D9EDB1 
X-CRM114-Status: GOOD (  19.62  )
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

This series updates Device Tree related files to introduce the
FML13V10 board from DeepComputing, which incorporates a StarFive
JH7110 SoC.  This board is designed for use on the Framework Laptop 13
Chassis, which has (Framework) SKU FRANHQ0001.

The original three versions of this series were posted by Sandie Cao
from DeepComputing.  Her mailer configuration caused mail threading
errors, which led to some confusion.  After some discussion, we have
agreed to take over moving this series toward acceptance.

Changes from v3:

In this version, the board name is changed from FM7110 to FML13V10.

The descriptions for all patches in this series now have been updated
(slightly).  The first patch received an ack from Krzysztof in v2, and
the second patch received an ack from Rob on v3, and both are included
here. Other than the board name, the content of the first and second
patches are the same as before.

The third patch has been modified.  pcie0 was marked as disabled in
patch 3, and Krzysztof asked why pcie0 was enabled in the first place.
In fact, it is *not* enabled, and the node disabling it in patch 3
was not required.  Similarly, gmac1 is already disabled.  So these nodes
have been removed in patch 3.

However, gmac0 and pwmdac *are* enabled (in "jh7110-common.dtsi"),
but they should not be (for now) on this board.  The same is true
for spi0, csi2rx, and camss.  There are a few other nodes added in
patch 3 to ensure things are disabled that should be. Finally, usb0
remains enabled, but with a different operational mode (dr_mode =
"host").

The proper fix is to disable things except where they're needed rather
than enabling them in jh7110-common.dtsi and disabling them for this
board.  We propose to fix this in a follow-on patch (or series), but
we can do this in a new version of this series if requested.

Below is a version history, including direct links to all of the patches
(because a single link to each series doesn't work).

Best regards,
Guodong, Alex

v3:
- Update board features into description
- Add Krzysztof's ack on patch 1

https://lore.kernel.org/all/20240925053123.1364574-1-sandie.cao@deepcomputing.io/
https://lore.kernel.org/all/20240925053123.1364574-2-sandie.cao@deepcomputing.io/
https://lore.kernel.org/all/20240925053123.1364574-3-sandie.cao@deepcomputing.io/
https://lore.kernel.org/all/20240925053123.1364574-4-sandie.cao@deepcomputing.io/

v2:
- Add deepcomputing into vendor list.
- Add deepcomputing,fm7110 into model compatible list.
- Framework Config will be included in later a patch.

https://lore.kernel.org/all/20240924080650.1345485-1-sandie.cao@deepcomputing.io/
https://lore.kernel.org/all/20240924080650.1345485-2-sandie.cao@deepcomputing.io/
https://lore.kernel.org/all/20240924080650.1345485-3-sandie.cao@deepcomputing.io/
https://lore.kernel.org/all/20240924080650.1345485-4-sandie.cao@deepcomputing.io/

v1:
- Add framework dts and config.

https://lore.kernel.org/all/20240923053621.1585972-1-sandie.cao@deepcomputing.io/
https://lore.kernel.org/all/20240923053621.1585972-2-sandie.cao@deepcomputing.io/
https://lore.kernel.org/all/20240923053806.1586080-1-sandie.cao@deepcomputing.io/

Guodong Xu (1):
  riscv: dts: starfive: add DeepComputing FML13V01 board device tree

Sandie Cao (2):
  dt-bindings: vendor: add deepcomputing
  dt-bindings: riscv: starfive: add deepcomputing,fml13v01

 .../devicetree/bindings/riscv/starfive.yaml   |  1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 arch/riscv/boot/dts/starfive/Makefile         |  1 +
 .../jh7110-deepcomputing-fml13v01.dts         | 44 +++++++++++++++++++
 4 files changed, 48 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
