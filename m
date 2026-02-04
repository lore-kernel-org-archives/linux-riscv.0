Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA3E0E9539B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 13:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xN0OpoFkO1UJ2PEp9sz/aMPIRSoamuJo5fYlOdWRVbI=; b=3L30P1+8uD1EiW
	J2AsfthA2GMCsOHHcdZiqfwGNptVLRYvG7YnI3EUAS6Q5cpy2o8vN1Mv2rTHgx3jjr0DjMCVC50BD
	xK7dv3BHFjC0HopW5qhLDlDP28KYjZzgclrPI4OL9DKCH/OjrdjhrXfJlvC2pk85hZKWSySddKibh
	zNMCFuLZbbwAHmfkYRlFTNHtGlZQ2jt9SMfJNWg5+jVsM/+YhaDIgN5tYVGAyV4PNMSB9FhMhz9Ok
	v9Zj91G2qjticJCFu7OVujecHHBLEjXSzEZSKHoZO1DDJWcHgiwoAG9OnZbirwjc7mhh+54aC9gUz
	Ro59DcnRvGF3qAZgnfeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncqh-00000008Uyf-0sza;
	Wed, 04 Feb 2026 13:23:15 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncqe-00000008UyJ-3A2s
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 13:23:14 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2b7381d2d95so472989eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Feb 2026 05:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770211392; x=1770816192; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kIfSdKgtKPIDZe3e+f9p01Ulu42xE4j1piPC/F3kvqE=;
        b=pFPNWAfVmklhPugT3QvcEh7CuDLha1Qx9VC+xqNRD4HqBEm0O3fOpIVWLUZYOV+rdX
         8mDgx9JTIYd2VSIsVdjwg1L+DXsUex6V088ELGq8w0C4DkkyrK3z0/6rMMbsooQgXfWi
         K5H8kaLegMdIG58mxMRjdUEng+no+6v45Fdzp7tbwXcDZC+otifwVWkb3KWDDd1xeerM
         orUTbfknOSVLPMc65ywbJ0cEAnFGTkNor2HYPIKxYoeiG41dhAlqiv/lw5dilb9kjyq2
         DMaqe8kzc+yA18aSlkSVpSQgpStyMl6p1zqBB3eRoATUQMEX4ANFpGWS6qCzxYKIc2kT
         g4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770211392; x=1770816192;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIfSdKgtKPIDZe3e+f9p01Ulu42xE4j1piPC/F3kvqE=;
        b=CWjn89Jbbw5tcMcSWmNXUGZwcGmKES99dqQS1HGb9uYG+tXUne2pC7Ngs4C4yKUYPY
         xwkDQZcC7J3ddJydzHXKVhXwi7Awrpn9/R7IWPGAmUzis1x0Jtai8Dh84leA4QP0DKZs
         xkK3Ee9plqmccS7/OG6ITgIlDOX/ZE+uzeg9uUR+2CPx0nwI/3UDNgYRA4zVbky69TxO
         ti7rTnDAJp8nAkw/y0fHUidivL83XDa+w6QuxsStGUUO0LbkJFJ+Kuh2oG6G1r7pN4CX
         uKBcDaSk57mQTy8IFjn2RFNb6fzewNjPxwNP5onMolXHDkTRl4f9G1yPsZSxGYHdYatd
         CrLw==
X-Forwarded-Encrypted: i=1; AJvYcCUubPZwDuWu7ziRlhF96UjlZDyLLQuDhPu3esivHVTH08WlSb6+v79P/rg35T7LkUkI4alQ63gGkhvfOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxnmsxPWLDxMUMGdmcqhIR9PLdMBkps27QnASO3iRf+cLBtzHj
	6zdxbKbkNRU28ObQGgZuuY709H79yetgyVJrVG1HVGNApJPg+6TfxKOcUR5TIQdl7qg=
X-Gm-Gg: AZuq6aIroyvlPaY+zaJ/a0ePhyGz6GI/laiBKCClan5EnYjIYSasfWxYAIKJVeaq7e8
	0MwtPkb6eh2ujLJF1l64n5+qA4bOWzGSBgA/1cjaz/CpkVcGQqCNkn4B947jedjwoki6lv3awuD
	GB/Odu2nqxOJY85se4fduwbFY/ROtF7nQ8Rx4HSB5neCygaxgXnYryPBSPEcW5tGTweRMU/5vpc
	aBxWjvOtOYzG7kKRfafzdJjrJJeV+kMFYGtnQBOah/asWpmAuZJtQjs6Oi2m4S0w5mVTd+aQUNj
	TwM08evZGrcDZrIOXnIsPFTBFc0sPckYJM+vhn3V54KOQfDnRs4BKXfvn6CflOlIPFfeLC0JGlH
	9QtXQF0dnZU/g5GH0y9mNb4HfpngBypVXQb/Z4y/NFUHimnL9an5zL7Gvy0ZTqzDAQ12R3J9VC3
	R/uva5KP9mzEfS4iwXxbEI2yiBx6cE68I=
X-Received: by 2002:a05:7300:7301:b0:2b7:1dd3:585b with SMTP id 5a478bee46e88-2b820e47fe9mr2509188eec.7.1770211391556;
        Wed, 04 Feb 2026 05:23:11 -0800 (PST)
Received: from [127.0.1.1] ([2604:a840:3::303d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b832fc1d50sm1416731eec.27.2026.02.04.05.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 05:23:11 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v3 0/3] regulator: spacemit-p1: Support board power tree
 via DT properties
Date: Wed, 04 Feb 2026 21:23:00 +0800
Message-Id: <20260204-spacemit-p1-v3-0-a894b3057026@riscstar.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADRIg2kC/22PQW7DIBBFr2KxLhWMGQxe9R5RF4CHmkViB6iVK
 vLdS5xNW3X5v/Ten7mzQjlRYWN3Z5m2VNJyaaF/6ViY3eWDeJpaZiBACwnAy+oCnVPlq+SO0Gq
 KZAxG1og1U0y3w3Z6f+ZM188mrc+Sra6GuSnHTqLyk4oDiEAoNE5ovDVmIhNh6EEMXikcgB5e7
 wrxsJzb7Nih1IosYkN69liZU6lL/jpe2OQx8++1m+SC98J6giH6GO1bTiWU6vJrcx+qDX7i6jc
 ODYdgtBdaW+XdH3zf928xwq3dTgEAAA==
X-Change-ID: 20260122-spacemit-p1-ae596efe885f
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_052312_935756_D1C41D2B 
X-CRM114-Status: GOOD (  10.06  )
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

The patch (Patch 1 in v1 and v2) fixing hardware voltage constraints was
applied to regulator.git for-next, so it is dropped from this series.

Patch 1, 2 and 3 (previously 2-4) enables flexible power tree
configurations for the SpacemiT P1 PMIC. Hardcoded supply assumptions
are replaced with explicit devicetree properties. PMIC supply connections
are board-design decisions. Moving this to DT allows supporting varied
topologies without driver modifications.

The supply binding change is an ABI change. The breakage is acceptable:
Yixun Lan checked the DTS tree queued for v6.20 and found no consumers
of the P1/PMIC regulator yet [1]. For the two K1 boards in-tree
(BPI-F3 and Jupiter), initial power settings come from boot firmware and
a probe failure of pmic node "spacemit,p1" has minimal impact.

Link: https://lore.kernel.org/lkml/20260125110333-GYD71302@gentoo.org/ [1]

Changes in v3:
- Drop Patch 1 of previous series, already applied to regulator.git
    for-next (commit 41399c5d4761).
- Patch 1 (previous 2): Mark "vin-supply" as deprecated to avoid
    cross-tree warnings.
- Patch 2 (previous 3): Describe the ABI change explicitly. Add
    justification.
- Link to v2: https://lore.kernel.org/r/20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com

Changes in v2:
- Patch 2: dt-bindings, remove providers from the example dts.
- Patch 4: Added the pmic supply properties for K1 Milkv Jupiter.
           Updated the commit message accordingly.
- Link to v1: https://lore.kernel.org/r/20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Guodong Xu (3):
      dt-bindings: mfd: spacemit,p1: Add individual regulator supply properties
      regulator: spacemit-p1: Update supply names
      riscv: dts: spacemit: Update PMIC supply properties for BPI-F3 and Jupiter

 .../devicetree/bindings/mfd/spacemit,p1.yaml       | 53 +++++++++++++++++++++-
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    | 12 ++++-
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  | 12 ++++-
 drivers/regulator/spacemit-p1.c                    | 25 +++++-----
 4 files changed, 86 insertions(+), 16 deletions(-)
---
base-commit: 5164e95565d3fd508ca8a95351323f5716dfb695
change-id: 20260122-spacemit-p1-ae596efe885f
prerequisite-patch-id: 154bd4f720ce5065d58b988de8f273207b44572e

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
