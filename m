Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D16CD3B7E5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 11:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YaoKDLQiIHz0AC7AGQciPydC7w4f4hovd0URz6EJo3I=; b=Xwyk17xiBiVLJP
	dtCx0WHTIJs/cBFa7C13DA1i4OOMeyNuTHpNBhSGpLqvcD7EttWnFrCR2iSYatyyVPTJ4i7T52cf+
	LokcDWgumLZq/OvBils34SVfYTo5iyVTBp69WTSlOG3oU/01nmqSrNiwGVzIphpHMkgZ8LHY0IpMH
	B3pMcuwwsQC1vNpkBc1noou1SYG6Q5QmJ+0V37ZRk7dIqr1bLeneSdQPTTvfe+X/nxdes4WbuWp8x
	2iY+DEosQ1k4GTY3ji2+QDMP0/CaHiM2OVCb7A/wWj3s1rFVZApWyFRex4Ht7EqLwUdI3ucw6wEt1
	HKSRUf5YG9PJGn9rTU9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaB38-00000003avf-1XqL;
	Mon, 29 Dec 2025 11:04:30 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaB35-00000003avF-416M
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 11:04:29 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so6620501b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Dec 2025 03:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767006267; x=1767611067; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lUNSVe/sd1lYKp8l9IYubt2NU/sufakOfvhG/jIITbo=;
        b=OcOJqcfZX28Z3CElvuCJKsTN0IbHAhl+BeZx/+yyZb4hlTfR0EqqtgJ2vPGbbxMuTP
         cEf/HQiOwaE1UBBD0sAJohB6DDUJIpeRJoX3AaWph4MdECn6nBJRN9CbVFflOU3tVBqV
         zoH318/8SQzELS/IxkT8UYgSGcHwMe6Uq4FgGsoDKnZUgEjAM+RULCBebjbPrgZE/12S
         IhnG393Hf6vz7KW35AywjLTXhRxWEmbkEZS80xfVbeKF7ACWV6/SDEZV233gJvNj9R9/
         zrGzkyCf63e8tD783dVKBKNiSAUzU6oDCOrCEeTI0vWj3FE3kSAO/A/KsdWXjTf2L4Od
         bQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767006267; x=1767611067;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUNSVe/sd1lYKp8l9IYubt2NU/sufakOfvhG/jIITbo=;
        b=rj1DOkWxSEft4JnxKtZKbkX8i/kYGN9ZhvjDKNd7q+jeCAWhacI80hRt8/5twWI9CI
         DDwoZiA2kerBELPcvKv/5Y00WhGzcA5DVz5GnCtMh5II+xZosgaB+hdS9GwSBSTPN5N0
         EpqAthghBWdeIeuOc1lS65U3eyXZCu9q1F0SQWkyg2JI5iJSgozx6QMkMWOhGoYj1zk4
         iRl9aNcRqwrKPvPuoCFMXTTJ1WqejTbiH5kpIAn/lXkNS2TOEkHKwECrv3qI9KGGLyks
         3PT9aFMxP64bUdxatnXrVrIj6hu+F1NAYwj08kdojYdtti+w7s9Y458DuqSspUS+BdU5
         xX0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNBGDl2ltO5oPXBz79KhqNPG2R3NmPQj5GbfgAV/IuGujJpFhwnWAxJrTHNjYxqSKKaFJ+CuJrF80Hog==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk2gzp345EzGJSUbEsNJ3C028XD8LZw6xFR+sMxDx9pdWAyy4C
	HWSFdaAh/6MILWQyoh6PcQ+kmPU6+2k71U0IhhecyOlybT8bs9oycLZp24zIFv9mQAA=
X-Gm-Gg: AY/fxX5rioS0IUxttNdQInOnAtDsUSK2dghFmvgg9OqyWTQuoBXglyq1+Nm9U5k+oAU
	BjA8iMs6ABXZll3AEBaHcYspvlzR2rDfcJqemwl+K+SfZYGIdHOZMdgBZtVeo3oceqXrzVsa1zm
	HGX3ax+mpBc49TRApm6/hy5N1zzEB2nWv2F/BybVkJ/dxxdonXE84SshppINuUOCxPtNqLTA5s9
	xP0x0wjzPT9KfnRmq+ZTP8577Iw61nfZHBjRnCGpAxEahQ0VmERyk46HaUmQvW1LwiCn0VwGAVm
	a5jZYBrzZJBWAB3F2xOzM+qimyIPGLb0Yq3cro6yf3boS4b86+fy8SJKSSPLMTkJmrKVBbc7CgT
	pjzpcPYjUrIMtLqjY/2pX83zBNX5I/tYrBQJnEpPJDZGY8P72i8GtV9CUG8JdkhyY5xkHbrINnP
	6eVCLOCCi31C4JQxS9/PqigdJIzESBYeo=
X-Google-Smtp-Source: AGHT+IEBHFLAKZFYMyyqorMLa7esl33p/rcxioC0H1BC7C+EyM+BB/PbnfCpeJf/1UDq9wdwVE528Q==
X-Received: by 2002:a05:6a00:438d:b0:7e8:43f5:bd5a with SMTP id d2e1a72fcca58-7ff67852a95mr26500403b3a.70.1767006267092;
        Mon, 29 Dec 2025 03:04:27 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40d7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7aa32916sm29338817b3a.8.2025.12.29.03.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 03:04:26 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH 0/4] reset: spacemit: Add support for SpacemiT K3 SoC
Date: Mon, 29 Dec 2025 19:04:03 +0800
Message-Id: <20251229-k3-reset-v1-0-eda0747bded3@riscstar.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACNgUmkC/33PwW6DMAwG4FdBOc8oToASNE19j6mHJBga0SRbw
 tCkqu++FG7TtONv+f8s31mm5CizobqzRJvLLoYS8KVi9qrDTODGkpngokUhFCwSEmVaoR+VObV
 Ik1TIyvpHosl979T75ciJPr+KuB5D5ilnvYtD9XqAqDiKHlXdNFydBCC4EO3Vaa/Ps9fuVtvo3
 578H2XRAe9gQbC3BcqejwE2ARxEb1rVYG+acTrPFNYY65jmf5zy1RPZZGl3XFhS0pjOyt9tozP
 tp9w6VFtXo4JkJbs8Hj/iFgI7SgEAAA==
X-Change-ID: 20251229-k3-reset-8d9b751ef391
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_030428_265504_ADAD4536 
X-CRM114-Status: UNSURE (   9.03  )
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

This series adds support for the reset controller found on the SpacemiT
K3 SoC.

The K3 reset controller shares the same architecture as the K1. To
facilitate support for both and future SoCs, the existing K1 reset
driver is refactored with the following changes:

1. The existing K1 driver is moved to a dedicated 'drivers/reset/spacemit/'
   directory.
2. Common reset operations are extracted into reset-spacemit-common.{c,h}

The K3 driver is implemented using this common infrastructure.

This patchset is based on v6.19-rc3 and depends on the K3 clock drirver
patchset [3] and the K1 common clock work [2] and [1]:

Link: https://lore.kernel.org/all/20251219012819.440972-1-inochiama@gmail.com/ [1]
Link: https://lore.kernel.org/all/20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org [2]
Link: https://lore.kernel.org/all/20251226-k3-clk-v3-0-602ce93bb6c3@gentoo.org/ [3]

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Guodong Xu (4):
      dt-bindings: reset: spacemit: Add K3 reset IDs
      reset: Create subdirectory for SpacemiT drivers
      reset: spacemit: Extract common K1 reset code
      reset: spacemit: Add SpacemiT K3 reset driver

 drivers/reset/Kconfig                              |  12 +-
 drivers/reset/Makefile                             |   2 +-
 drivers/reset/spacemit/Kconfig                     |  36 ++++
 drivers/reset/spacemit/Makefile                    |   6 +
 drivers/reset/spacemit/reset-spacemit-common.c     |  79 +++++++
 drivers/reset/spacemit/reset-spacemit-common.h     |  53 +++++
 .../reset-spacemit-k1.c}                           | 113 +---------
 drivers/reset/spacemit/reset-spacemit-k3.c         | 229 +++++++++++++++++++++
 include/dt-bindings/reset/spacemit,k3-resets.h     | 171 +++++++++++++++
 9 files changed, 587 insertions(+), 114 deletions(-)
---
base-commit: 82791741762a870f5f2ede9f909301770f66f867
change-id: 20251229-k3-reset-8d9b751ef391
prerequisite-message-id: <20251219012819.440972-1-inochiama@gmail.com>
prerequisite-patch-id: df430730ed961011cee5c5d47b7ace84b3c5ebb7
prerequisite-patch-id: 64003618c33be925602e46b7543f2c13d3f36474
prerequisite-message-id: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
prerequisite-patch-id: 478955b6a6ab7c82910cdd9de7caf2d8be95b99f
prerequisite-patch-id: 9d9f553c3430fa2bda0e980679efa60c46cdd8e9
prerequisite-patch-id: 50eb74bd253e779458b52b242144e79807675461
prerequisite-message-id: <20251226-k3-clk-v3-0-602ce93bb6c3@gentoo.org>
prerequisite-patch-id: 5c03cda3a94467833d7d6c97889edb2909a8377f
prerequisite-patch-id: dce85ac6e4e94b1d2622a8231ddab3de766373ff
prerequisite-patch-id: af1fb571f0d19d72e69dd41d15fc2dbd730b17c7
prerequisite-patch-id: 96f735ba6592797c77ad17568e9065b285dba453
prerequisite-patch-id: 2fdd0abff5d58f5c99646ba00f82d81672679796

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
