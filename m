Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8C0C27C53
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 01:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZnGpTC3eUWNh5Gi9bQgCXGeg13B6RXW35gIto35qYbc=; b=JIEJbC7oO66Wyr
	8yJA1WmkL0spiRNTkAATluol4r3r30wMChCtPu+a5tmj5QeI7c6XXRPJ5llGyuiOOksm19zdvbMed
	OSAe0wSXlixcXUpzarmnEnNVfCchX7sjz4w6nE2kB4XYla/Kicwb5KULqCy0/scBoZjMIlblMsaPv
	L1PlGq7f8EY5qSOVmbEuQN1cDE/lpZgLDV6CBYjDGw61JYsNAuASTg0vnUlj+63PhI/rI8Hop6g1N
	EKEes+PTSCZsfavl4NC4VgXoG0FO+XVFOpPTjra9cX7vIP9eMosv/8/VQOup/v/JRJYWRgmMhG2LN
	plJGYLZz9J7G/OnJnLGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHZTn-0000000Ek3K-2Ke7;
	Thu, 13 Jun 2024 01:42:19 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHZTi-0000000Ek0Q-39a6
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 01:42:16 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6f9774a556cso293818a34.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jun 2024 18:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718242931; x=1718847731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lUzAU/BrlHlfOD+rgZpVm4xqTlwKqA8+DOrVtmqF5SE=;
        b=mLIO+KTo7zM97zBjaFXxk5lm4im/o5RcFSg4cypf9zJtfFss8b8HmpahDYktSkzcM1
         YWc+Fh/UwHkO+P2E7kU32TCAtm3urpqmJFDEBssC9KSxccUS+coubi2xHUjpsscpqWQK
         WSx5NvOoad6UIV3qVNEsRO8rJNWWf8JfzZ01FE3qHvjNqHCAZhlmLavCvg5/g4umwUjh
         PXDS1DcoI98yP65UZGQucLLIDBFMtu1YA9u1JvI3jwdqsPbijSz5uapR4OtJxOpizzpf
         HLDI19gYc7WyI7g6iC2kvFWCRDOY5+syg2s89K4MX4vdETyb81yLU/CS/ATD0YfBlOKG
         1mgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718242931; x=1718847731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUzAU/BrlHlfOD+rgZpVm4xqTlwKqA8+DOrVtmqF5SE=;
        b=kRJk66VSdY/RPk5xfUopW5seDE0Mn4fSoQSV6aLr0hjkLoS/ZqmGPsx1/MRXeiJY9W
         wJnqM0MNIZMqp8sPwAqyjUwAxvzZi6cib2h5/YTDw/95fp/sQzAVbqhk2vmzLYCvmX+e
         wXDfjXiBZrXlKLGtcGkcFyhM4sR7hJXLZzlcdcHrqe8WJ74S/Y8H2okOU/Qpdf7bWtgf
         nfoMmZwP8IrCfPLH7yPq7IjVdexeQtQr1x385aMSAdYUPg8ri6sSQYk+kelguhbxyEcb
         Sn6cAyt5KooARHciItrvcn+7iGx7TQlo7fe27H/Xjk1KRulWpLNVlYJxddEqp+X7cXSM
         MKCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzR5tKzknuQvx0TKt8BUk5bRM3+CYR6FrG1XEzKbWNT9C9bRF5aBOTeEmjVdx2NDkIKhW2d8iLPRf7tbGfQ2fUAxgK0dxqX+Hyq5b0MsdM
X-Gm-Message-State: AOJu0Yz/ON54rd1IRkhc1Qc9RLYWByvt0T6kZZPMUqh/lsmr6SnDW+Ho
	Pv0vt5gtWbJymQfdqvjxdD3WxxL4Y/kkDi+JLI1oWvFi94leofUs
X-Google-Smtp-Source: AGHT+IH5dSdRTznyVmwyCJU6VsLfIEgceO5LXu8jpS8i2aLwTKp7FX33AhMu/ZrDJE6B9QzAm1l/eA==
X-Received: by 2002:a05:6830:2044:b0:6f9:3a42:b8a1 with SMTP id 46e09a7af769-6fa1be31d29mr3410321a34.6.1718242931124;
        Wed, 12 Jun 2024 18:42:11 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6fb5b755c2bsm75040a34.69.2024.06.12.18.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 18:42:10 -0700 (PDT)
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
Subject: [PATCH v3 0/4] mmc: sdhci-of-dwcmshc: enhance framework
Date: Thu, 13 Jun 2024 09:42:03 +0800
Message-Id: <cover.1718241495.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_184214_817032_9310372A 
X-CRM114-Status: GOOD (  12.99  )
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

When I tried to add a new soc to sdhci-of-dwcmshc, I found that the
existing driver code could be optimized to facilitate expansion for
the new soc. You can see another patch [sg2042-dwcmshc], which I am
working on to add SG2042 to sdhci-of-dwcmshc.

By the way, although I believe this patch only optimizes the framework
of the code and does not change the specific logic, simple verification
is certainly better. Since I don't have rk35xx/th1520 related hardware,
it would be greatly appreciated if someone could help verify it.

---

Changes in v3:
  
  The patch series is based on latest 'next' branch of [mmc-git].

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

Link: https://lore.kernel.org/linux-mmc/cover.1713258948.git.unicorn_wang@outlook.com/ [sg2042-dwcmshc]
Link: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git [mmc-git]
Link: https://lore.kernel.org/linux-mmc/cover.1713257181.git.unicorn_wang@outlook.com/ [1]
Link: https://lore.kernel.org/linux-mmc/cover.1714270290.git.unicorn_wang@outlook.com/ [2]

---

Chen Wang (4):
  mmc: sdhci-of-dwcmshc: adjust positions of helper routines
  mmc: sdhci-of-dwcmshc: unify the naming of soc helper functions
  mmc: sdhci-of-dwcmshc: extract init function for rk35xx/th1520
  mmc: sdhci-of-dwcmshc: add callback functions for dwcmshc

 drivers/mmc/host/sdhci-of-dwcmshc.c | 598 ++++++++++++++++------------
 1 file changed, 339 insertions(+), 259 deletions(-)


base-commit: d6cd1206ffaaa890e81f5d1134856d9edd406ec6
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
