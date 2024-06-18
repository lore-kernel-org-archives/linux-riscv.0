Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF44C27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 08:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gyTNKsXKbWNb16PiZtiz4SVLJrdrOUJgkgOE7OCdHgY=; b=RdbNEGnKzTATJG
	F7yHmc6yOSEOfZ6WJi8UdtTCJjesbqjWUePCprIEh36rn/FIYqxaMECEJ4pKfaNnsmIOtLXicScwa
	j/u1hbpW0Sda8Bq8xiG4yH/QTzw0RznTEkRBHLMKMXkZgeLnYmRfbfR3dt+sycw3tQ30hAnZt+Rca
	NseD4TOrKwaJNoNt+52YgnLNklAnUcpM+XLiWxg0XyBpA0m0AqzY6QQynAaZ3fIrt2VfPnsQb8R3h
	ZBoRGrAYdZgwcI9RT4q6uoCAoKyVAX+iSEG879kOaJPlFEzRaSZMxafdqFmfN0uaL28jcVHAPi0AC
	gJyCO8jdh+ZII7vT8IIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJUQ6-0000000E6d4-2zCs;
	Tue, 18 Jun 2024 08:42:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJUQ5-0000000E6cu-1YEP
	for linux-riscv@bombadil.infradead.org;
	Tue, 18 Jun 2024 08:42:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=JFsReauRW7BnbGOq0QDl+qJ280PvXf5SBObURVpdknI=; b=Edwlzuh9neBvacjFuvKC+dqCwo
	GHlh37CzXo44Y1+KoRz10lLyklO/I3mu1mAKJyW/0UKmuqkGCISVsjU16W7z1QH6bN7JYeemjtviC
	qcN1DlUuXneGpaKJur5Uprj86LWAQdQvytq0SE5KTnCe2+hD3rMgu06Lz1hsSgM7h5J4QHFGG8c5S
	Ai5Uj49RYy0vKKRFUSvn4+0oFLtgolcy1SxbOrNMvSh80aT0CRF6jPZs0hUO5vRESnqqKbVbp+baa
	5k5+BPv0NYKVv9m5cBoLarg8Pbby2TXfx1tB63UE64oir1TJkG0YoVzI62lRK8WSMT60I5ahuGCLe
	yAEEsecA==;
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJUM0-000000070Wa-0NGV
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 08:42:22 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-2506fc3a6cfso2484095fac.2
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jun 2024 01:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718699855; x=1719304655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JFsReauRW7BnbGOq0QDl+qJ280PvXf5SBObURVpdknI=;
        b=IlQY3428ekPOmoVnAPh8ECxw+ai0EfvRHj/dkr8oDgWbbUupkkHx3v9ij0xvopWLDr
         oTsObZYwIf4a37Yem9Cwwh+q2mn3Tx9Yz36MPKn+aRAeBIk9av387Oq9XzqvIP8/8n73
         H9od6DL7HaCaSMjSmZxFYwKkIsPC/ImTeFP4LyjFc0Wd7JUm/w1jWdM4NIB4I2TXsxt9
         J8HWPfbcOOhcNaA7GjTIk1wOAHasf9TD2zE2QJxgm9wYwuhL4wMly87PyIwGKRE5Mu6B
         YtjsqmGxPuN+c+NexhzuaIgLlP659rhiGRuKLHYQBj57mkwgutDcAeePBqCYko54exlg
         kmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718699855; x=1719304655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JFsReauRW7BnbGOq0QDl+qJ280PvXf5SBObURVpdknI=;
        b=dGnf2nkMDh2HO9sVyuBzm6lZV4b5Ujalw/1hn81CpqjzOTurZ00Hl0vDyMjA//aEFl
         z9bdUabZE3jyrfZ++UWsfd8HQV0sIdbvTkH9B/xL0G2WFOFsoPZf9oq0rlI5q+lnQeHa
         9wPbItRFzcNyc2ZCkIrYMtzHu1WJTfPoFzhE/Lu+D2h1mKUr0Bpkqjr/XXparpgm6iyb
         9V8y4u9Oz/1WTez16uh3Bq+t6ATiRR2YPD70iPEOJUXcAQyY2wFoSLptjx5xCHgJDI5I
         hCfqBhGDIGJuQ7ExRqhLqnTHiTdyPOhHqi5OsK2RGgH0wDALhq8WlVHqg0TU4JOjalu0
         pG1g==
X-Forwarded-Encrypted: i=1; AJvYcCWbsWyRUfnMn7kjgauHxTPEcwNh1zHQCpvO+6wXlxBc/zPQAkTMcpA45JiYEM+qLZZLF/JIep1MKPSGtCLiBZCuXQ6K4+lA72hsrh0ZIkKO
X-Gm-Message-State: AOJu0YxmaEPsGl25xnK1OA2lQGWrGm3+8vP06MaJvkVbivq1TFfirf1D
	rDhmACoHAGgCNgkvkfurVNCLcl7DWjzZAN2qUhaUbFs2csvPXVA0
X-Google-Smtp-Source: AGHT+IGnRWRr2o+oA3EM/VynZOBdxxp9ijkn0OKBKLyHSsXT40cOAd4QJXajBgNbKMlE+nu9v5KLMw==
X-Received: by 2002:a05:6870:c095:b0:254:7cd4:9092 with SMTP id 586e51a60fabf-258428eb176mr11682004fac.20.1718699854751;
        Tue, 18 Jun 2024 01:37:34 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-256993a0d23sm3052169fac.58.2024.06.18.01.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 01:37:24 -0700 (PDT)
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
Subject: [PATCH v4 0/4] mmc: sdhci-of-dwcmshc: Add Sophgo SG2042 support
Date: Tue, 18 Jun 2024 16:37:08 +0800
Message-Id: <cover.1718697954.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_094017_405641_AA179BD4 
X-CRM114-Status: GOOD (  15.92  )
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
for the new soc. Patch 1 "mmc: sdhci-of-dwcmshc: add callback functions
for dwcmshc" is for this.

Patch 2 ~ 3 are adding support for the mmc controller for Sophgo SG2042.
Adding corresponding new compatible strings, and implement
custom callbacks for SG2042 based on new framework.

Patch 4 is the change for DTS.

By the way, although I believe this patch only optimizes the framework
of the code and does not change the specific logic, simple verification
is certainly better. Since I don't have rk35xx/th1520 related hardware,
it would be greatly appreciated if someone could help verify it.
Note, the DTS change has dependency on clock changes for SG2042, which
has not been merged in master/upstream, so if you want to test this
new sdhci-of-dwcmshc driver for other hardware except SG2042, don't
pick patch 4.

---

Changes in v4:

  The patch series is based on latest 'next' branch of [mmc-git].

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

---

Chen Wang (4):
  mmc: sdhci-of-dwcmshc: add callback functions for dwcmshc
  dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo SG2042 support
  mmc: sdhci-of-dwcmshc: Add support for Sophgo SG2042
  riscv: dts: add mmc controllers for Sophgo SG2042 SoC

 .../bindings/mmc/snps,dwcmshc-sdhci.yaml      |  69 ++-
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |  17 +
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  32 ++
 drivers/mmc/host/sdhci-of-dwcmshc.c           | 499 ++++++++++++------
 4 files changed, 447 insertions(+), 170 deletions(-)


base-commit: d6cd1206ffaaa890e81f5d1134856d9edd406ec6
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
