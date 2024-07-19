Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8146C3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 08:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/8b3ANmYjx3t5k95s/nRE3npBPUHJULP3HFGGcuYFmI=; b=l4INHq3TO/8GtF
	+sY3J4bKvajYDN452pedICkK8m3SVM7NJ1Xi7IVsQCav4nfyioXPH+yIhRCDXGjMpEVu15ROn4gK3
	hSAdmjs2DzpHzgFWeDS+ZfieQJA3Sc7Og3s44PQWKT9l2eqSfjsgZq29UdVwUgIo+K/O9wPJTpfL0
	HlVkUv9D7tK1ZGpF9g6O7UqRpLGHRvLqWfzT2GByMgRnsDyTjtz3eqGfeBqYgQwRCvYDoEotsLGNv
	IE1PY0MLGMYhPoRfO9Lr+hdK8GFvemoEBmBVvq+YPp0UZ9c1bEUkl1R9a0EjPpKARF+Zi4RLBfRKR
	WU/yhd5i6M79Ojc/HI6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjER-000000027zK-1FLC;
	Fri, 19 Jul 2024 08:44:51 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjEO-000000027yk-0Z90
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 08:44:49 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-5c697fc4aa2so953317eaf.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 01:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721378686; x=1721983486; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qqWzTgIPyPc3kjOh738BaLUwdtHiWUrZxYzCR8XzUmI=;
        b=Wy79zUAaKJbGFkk+psOTN429ocSc713wVx7eGc/2/Oq49X801kkB6raG12eGgdv2Nz
         m4Y9sbiykj5MUIoSLyV88z4HgijMSdHAu6MMk0akQni+GPPs3rDzqzAeVVKTVUjZTi56
         BQAAqgVVg01d/s8iB2cfSCS9DE2dDASVCkfYmVI//4HkRAAmkWmjBP7QsCS6ypldqwKW
         rpWJBqxeFhDTwLg7fFIQJec0olDx2HaubY+qn8gE5m2/cBzmGJcs9X8ZHAJM+1jZZbgH
         ANnHMW0fr4k0U9xOsg+PucoHzKeGPHJvsqUh2/F/AT1vR/ThxG2j9Hr6ANKlWrnEHhGF
         Thvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721378686; x=1721983486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qqWzTgIPyPc3kjOh738BaLUwdtHiWUrZxYzCR8XzUmI=;
        b=jnpt80s0jmoKS+hVbmRBiRQ2Wbt52+5yUlOusQDe0ANly3XrX5U+fVsXRjTu4aIKmv
         bCvO4w9rEc0NwM3jUoAwWzCanRapmKrB0QP9pzPUHePtCMPU109TMm3x02ajEUlR8avk
         Pha022sG87dbymAUwhTnIsAt52zQeYsD5SCQhAT5Dan/0lNvayjcRKVZXfaMCnY2zAK+
         faQHA1G80Eak10PGosc7AyN5rlEHZF87D9lpYUXlsxqnNcKreBNfzxAZQuV1CXv8Ba8c
         eDV6MdyDzdSNNjEZWK0aEpp81+tj0vFWwQTZayGC6wNeH0TLE8JY6sy3dE6fam9CMMuX
         4Trg==
X-Forwarded-Encrypted: i=1; AJvYcCWc0FPoddZz8wggEYKZy8O9Y7vI87bMEfK6jVzVPl84+53DnXaq/eysVQKju7Pdut1mzvTTHkcrZREd8XXDzlLLqF4hTOvcyR5iWID/6Kgi
X-Gm-Message-State: AOJu0YwPpZmfkWZOqQcXrMgOL5Z8dGwQ1TNpCFf72Xh2/ygPYa4Vhq3p
	3bBrH2dKL01qkoMeiV2Yesy+9vMFnCyW8b4H8PXjPSa7Sf0sd3Yh
X-Google-Smtp-Source: AGHT+IGU3zGdzTzo6n56ZVu275VrbT2ZJepaZOccFd487bTwWFRutlJaZP+B20zx67pngOdZbMRwmQ==
X-Received: by 2002:a05:6820:1a0d:b0:5c6:9293:ed9d with SMTP id 006d021491bc7-5d41bf30324mr9004479eaf.4.1721378686237;
        Fri, 19 Jul 2024 01:44:46 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5d55a7fa3b1sm171808eaf.7.2024.07.19.01.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 01:44:45 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: adrian.hunter@intel.com,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	ulf.hansson@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	tingzhu.wang@sophgo.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v5 0/8] mmc: sdhci-of-dwcmshc: Add Sophgo SG2042 support
Date: Fri, 19 Jul 2024 16:44:38 +0800
Message-Id: <cover.1721377374.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_014448_204834_936DDEDC 
X-CRM114-Status: GOOD (  17.95  )
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

From: Chen Wang <unicorn_wang@outlook.com>

This patchset is composed of two parts:
- one is the improvement of the sdhci-of-dwcmshc framework,
- the other is the support for sg2042 based on the improvement of the
  framework.
The reason for merging the two parts into one patchset is mainly to
facilitate review, especially to facilitate viewing why we need to
improve the framework and what benefits it will bring to us.

When I tried to add a new soc(SG2042) to sdhci-of-dwcmshc, I found
that the existing driver code could be optimized to facilitate expansion
for the new soc. Patch 1 ~ Patch 5 is for this.

Patch 6 ~ 7 are adding support for the mmc controller for Sophgo SG2042.
Adding corresponding new compatible strings, and implement
custom callbacks for SG2042 based on new framework.

Patch 8 is the change for DTS.

By the way, although I believe this patch only optimizes the framework
of the code and does not change the specific logic, simple verification
is certainly better. Since I don't have rk35xx/th1520 related hardware,
it would be greatly appreciated if someone could help verify it.
Note, the DTS change has dependency on clock changes for SG2042, which
has not been merged in master/upstream, so if you want to test this
new sdhci-of-dwcmshc driver for other hardware except SG2042, don't
pick patch 8.

Clocks changes for SG2042 are expected to be in 6.11-rc1 soon, I will
do catch up with that when it is relased and provide a new revision,
but anyway please feel free review this version and welcome your comments.

---

Changes in v5:

  The patch series is based on latest 'next' branch of [mmc-git].

  - Based on Adrian's suggestion, split the first part of the patch into 5.
  - Updated bindings and DTS as per suggestion from Krzysztof, Jisheng and Conor.

Changes in v4:

  The patch series is based on latest 'next' branch of [mmc-git]. You can simply
  review or test the patches at the link [4].

  Improved the dirvier code as per comments from Adrian Hunter, drop moving
  position and renaming for some helper functions.

  Put the sg2042 support as part of this series, improve the bindings and code
  as per comments from last review.

Changes in v3:
  
  The patch series is based on latest 'next' branch of [mmc-git]. You can simply
  review or test the patches at the link [3].

  Improved the dirvier code as per comments from Adrian Hunter.
  Define new structure for dwcmshc platform data/ops. In addition, I organized
  the code and classified the helper functions.

  Since the file changes were relatively large (though the functional logic did
  not change much), I split the original patch into four for the convenience of
  review.

Changes in v2:

  Rebased on latest 'next' branch of [mmc-git]. You can simply review or test the
  patches at the link [2].

Changes in v1:

  The patch series is based on v6.9-rc1. You can simply review or test the
  patches at the link [1].

Link: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git [mmc-git]
Link: https://lore.kernel.org/linux-mmc/cover.1713257181.git.unicorn_wang@outlook.com/ [1]
Link: https://lore.kernel.org/linux-mmc/cover.1714270290.git.unicorn_wang@outlook.com/ [2]
Link: https://lore.kernel.org/linux-mmc/cover.1718241495.git.unicorn_wang@outlook.com/ [3]
Link: https://lore.kernel.org/linux-mmc/cover.1718697954.git.unicorn_wang@outlook.com/ [4]

---

Chen Wang (8):
  mmc: sdhci-of-dwcmshc: add common bulk optional clocks support
  mmc: sdhci-of-dwcmshc: move two rk35xx functions
  mmc: sdhci-of-dwcmshc: factor out code for th1520_init()
  mmc: sdhci-of-dwcmshc: factor out code into dwcmshc_rk35xx_init
  mmc: sdhci-of-dwcmshc: add dwcmshc_pltfm_data
  dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo SG2042 support
  mmc: sdhci-of-dwcmshc: Add support for Sophgo SG2042
  riscv: sophgo: dts: add mmc controllers for SG2042 SoC

 .../bindings/mmc/snps,dwcmshc-sdhci.yaml      |  60 ++-
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |  17 +
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  28 ++
 drivers/mmc/host/sdhci-of-dwcmshc.c           | 459 ++++++++++++------
 4 files changed, 391 insertions(+), 173 deletions(-)


base-commit: b85e021853976aaebd3788e7e721020570754199
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
