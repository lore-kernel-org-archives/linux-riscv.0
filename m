Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82A7D3C92D
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Oct 2024 13:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lUZ4Edbu81Te+vWaLteiqg74o877vXzmn+Le/Ffc7VU=; b=yxyfXoNSq/5gb5
	29pHBBPrSc59KAh/8q1VeG+FtNGCadEi/gmSlfw6ejR41SUGXbgCOOvcKb9s9j9dGh4jnCfkHFEKi
	Jlg7+zTfCuxvcJd58BL1rhW+yZjdXJT/XfqqOVm78C6OC0fhfcRq9IZGWKCxy3c7XQn33L8NaMx6y
	C/a3bFsnalUtXrkgi2bHgKlg/sRuBMArKGI8FEVy98uOOTXLDVFCMGC98cKiBFvST1qq1aC8M0wLf
	u+XHHAT1SZ8GFdyeX/behX58LdhhyZ08B1x314jQpICAp9NVLMy2AN7ElqplxRDRUqYNL6T8Drm4d
	jspjPpyTyi+3U7UIlskw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2WKd-00000004xWs-1CYx;
	Sun, 20 Oct 2024 13:50:55 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2WKZ-00000004xW7-2uVG
	for linux-riscv@lists.infradead.org;
	Sun, 20 Oct 2024 13:50:53 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20cdbe608b3so29306535ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 20 Oct 2024 06:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1729432250; x=1730037050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Inqg1tmm6xHd6cimigwIyJaawPAIIIaPNdfqb/QubP0=;
        b=iqk8/5UXjxjetzJJ782amOSL11izXgtJ8ilccB7+BJMJP2OLqgzDWmZpRmThtiEt2P
         mOmILOQ2Dw8WrhGxZPL85lz1YGFxTF9k5qjke3HkPVWo3tUh2U6ek0ckgpzkpHQo3U9k
         gWPAFZqRXzndpyuzyMkb/FMj4Lr++a50E4H/8a1ya4m9OZcCLiqKR5ZMJiQxoqfOZuOS
         kU6G7NfkkMc07W5q8QY8RDOIYPwyEK6c32Y+Y78H5w07hCqmZyn4utdYgsCK6FbaxE77
         RFvMho44twur+WPmhy50e6e49Zw81/C+I/VLgf41egm/H1OPfdWb7ihmnsVLNb88BIvn
         Or1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729432250; x=1730037050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Inqg1tmm6xHd6cimigwIyJaawPAIIIaPNdfqb/QubP0=;
        b=wsdsg5kbzUpHz+yFxBT1JDmVVz+mZfg55ZinYmotWGg+ne43zK+/tdqtB/lYuLE7op
         atSzt7YUGb8fIS3jFLwQsTtfzMryD7sl7KweGTHBIeWsZ5sUcczjLWiONmA1rrPYT5uW
         wPA4byiUWS2UOHGrJu7FbfHJGlpwhH+ybtuIWTF5PjOcc0EzGAs9eS7FiKhgTHJ5vedy
         MW9BTiMTdXBuY7KshA/+DxZlcHSNqUqkvhiEOUTmTsHcfkVRiwyNNM2WW0QXidRU6kk5
         v2zopo1yOXoCStZ0VL3rcyFEEdc6D5XVmuxD9E0Jyj435tP6r9BdRnkYaRxENLrvOahl
         zwgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhunK4v4wvImnXyGtcO2DG016KLvpFCfgjQENsyRfmW40h4p3qewf/L+QVzL8WMxR0Kc1bTMs55JieUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPPxnK231Naraf98hxH8PixHWeFq3xwL7vBk+pf23RdU7euoCS
	fefiR8aqydmfhohtL2ag8gpJ7xVY87EA3dtGXQzDG8N6IJ59OT+JTuYMO0WfkxtzdDVhCMJ8Rm8
	uCUA=
X-Google-Smtp-Source: AGHT+IFYcPnxuXktJBagQgtle0401hr/lktbq89F50ipN56+or5lo6r+eP3gufcTxqaRKoDCycgUkQ==
X-Received: by 2002:a17:902:c94f:b0:207:18f5:7e78 with SMTP id d9443c01a7336-20e5a94acccmr102524295ad.48.1729432250435;
        Sun, 20 Oct 2024 06:50:50 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::40df])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7eee63f0sm10554935ad.3.2024.10.20.06.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 06:50:50 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	rafal@milecki.pl,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	Alexandru Stan <ams@frame.work>,
	Daniel Schaefer <dhs@frame.work>,
	Sandie Cao <sandie.cao@deepcomputing.io>,
	Yuning Liang <yuning.liang@deepcomputing.io>,
	Huiming Qiu <huiming.qiu@deepcomputing.io>,
	Alex Elder <elder@riscstar.com>,
	linux@frame.work,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v5 0/3] Add DeepComputing FML13V01 board dts
Date: Sun, 20 Oct 2024 21:49:56 +0800
Message-Id: <20241020134959.519462-1-guodong@riscstar.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_065051_762889_EEBEEC21 
X-CRM114-Status: GOOD (  20.25  )
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

Changes from v4:

Remove the extra "From:" line in commit messages of patch 1 & 2.

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

v5:
- Remove the extra "From:" line in commit messages of patch 1 & 2.

v4:
- Board name was changed from FM7110 to FML13V10
- Descriptions for all patches in this series were updated slightly
- Add Rob's ack on patch 2
- In patch 3, device nodes were updated to reflect their proper status

https://lore.kernel.org/linux-riscv/20241019162605.308475-1-guodong@riscstar.com/

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
