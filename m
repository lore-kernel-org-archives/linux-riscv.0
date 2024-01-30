Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139E1C47DB3
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 01:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e3Ca/TSzm7xw2zTPjTM4AoH/m6AISvLNtq6q1nZvRe8=; b=oFz2Xf0kZJyTF4
	zBw28ZGNCga1fPrWEescEXVD3T8E49gW1UAX6fs9GnYrC7f2XcbxvRQ90NozfWVUCSgQenoqKbdq8
	sVvYKEDXFSw5Vkro/Nzv507Uyv1eEPUz3Wags7CFGkipOInNUgA6J/E90SgDHfeUznSGQ397ae16F
	Zuo/AcSMGJJQMkCRYNYlrieVOOEFClP9IYE8nBmuTouhzJMvh7p790UzAw691Qe8yya+ig04L+79v
	W5xgjviksdlL9lZV4JAYnIbyPWBcPMdfG4miS8pclSzodzm2khTZrDnwie8gjmbfFAE2Di2Du9UMJ
	3U7sRmjuKh15Q1NL7Yvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdFq-0000000EsVj-4BL9;
	Tue, 30 Jan 2024 01:49:39 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdFo-0000000EsV8-02oj
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 01:49:37 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6e1196dc31bso1387004a34.3
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 17:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706579374; x=1707184174; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YeHqdcQaLpP97ddnNdRPtp8biGTA9rsSvXwVDndOucU=;
        b=elhoNHnskNCcSU8xYw40dCVeEhzV7dmJIUuVCx+DXVQz5mm4YYnfSdNR6I+zhbfHow
         gYbHiINxSQg7KdL8H0sPJY3b19tc4yNtQ+d6jfPrxx/ARjD39RU62qUK15b7Qy8e3mMR
         5pcz6l4ng4wxQD3/BYK/2FnVIxBLX+3Xjfi9wuBHxzge2W9N2DrBXZmrmxWR8IX/Nmip
         SfqE1/8mQfwJFN4p51SWUQZa0SuE1pj4MbnNVc+dUp3Kkl/y74XNRLHYln61mLLDOxl5
         jhAUsPzK8UWtUMY0m9CjxUts2ydIzmz621lwgAT+9CGtXFAkS3abU24jdTM8Font0ii1
         K+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706579374; x=1707184174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YeHqdcQaLpP97ddnNdRPtp8biGTA9rsSvXwVDndOucU=;
        b=MZhOuU1vAqmT5lzLSd21pPQuraDQ8BJOYTCcjIsEE5GvMvmnxMLYUzcfXvv5fVA8CY
         Z5D6En9HGWXz0cnYAkwJKBIxFXfnbUI7INyVl+F2vqrzhca7bYrQr6O2EraTq3LWVebD
         /o7LfG9r4aiQ19ObdX/YrvHXxhABIIJDkIQW+/ejABilyQiWl0Dy0irnT5qTfS6NOkN5
         gLmH71BW8H5ii74G0pzsI9BPEHrm99AjsN6m0qi04AN5pgffQTEnuJmdbVunVrbt2yn8
         c0f29O7+sxkJ85fYf9R75x8e1hzAxlSX0gKj4iXqIG9aW7Uusj2XaV2UM87x25gdT111
         uusA==
X-Gm-Message-State: AOJu0Yxh5diFB6KJpp+YjQ4mAn6Kaw1+wqIP+rfzct6flsc8FCJ2WWfI
	B5b974DHtwU03FuocG06wobocScLhPPKGmzCmxL5cF9yfgdImzKq
X-Google-Smtp-Source: AGHT+IEWm+yFUTc8v5aJm4yHpf3+3Hg9XQA2nq0GSCISj8wiLiLasRTc7aM2MNnDAGpP6/LwVRyHGA==
X-Received: by 2002:a9d:6a4d:0:b0:6dd:e9e2:de67 with SMTP id h13-20020a9d6a4d000000b006dde9e2de67mr6253354otn.20.1706579373627;
        Mon, 29 Jan 2024 17:49:33 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id f10-20020a4ad80a000000b0059610f4de98sm1292156oov.41.2024.01.29.17.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 17:49:33 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	p.zabel@pengutronix.de,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	inochiama@outlook.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v3 0/4] riscv: sophgo: add reset support for SG2042
Date: Tue, 30 Jan 2024 09:49:08 +0800
Message-Id: <cover.1706577450.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_174936_077146_E45A79FF 
X-CRM114-Status: GOOD (  11.53  )
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

This series adds reset controller support for Sophgo SG2042 using
reset-simple driver.

Thanks,
Chen

---

Changes in v3:
  This patch series is based on v6.8-rc2, which has included the missed patch I
  mentioned in v2.
  - As suggested by Philipp, drop the Kconfig for SG2042, just add a default
    y if ARCH_SOPHGO to RESET_SIMPLE.

Changes in v2:
  This patch series is based on v6.8-rc1. You can simply review or test the
  patches at the link [3].
  - fixed some minor formatting issues.
  Note that if you need to pass dtb check, you need to apply a patch. This
  patch is missing in v6.8-rc1. For details, please see [2].

Changes in v1:
  The patch series is based on v6.7. You can simply review or test the
  patches at the link [1].

Link: https://lore.kernel.org/linux-riscv/cover.1704790558.git.unicorn_wang@outlook.com/ [1]
Link: https://lore.kernel.org/linux-riscv/MA0P287MB28228572C526C5099A8BDA2DFE7B2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM/T/#u [2]
Link: https://lore.kernel.org/linux-riscv/cover.1706161530.git.unicorn_wang@outlook.com/ [3]

---

Chen Wang (4):
  dt-bindings: reset: sophgo: support SG2042
  reset: simple: add support for Sophgo SG2042
  riscv: dts: add reset generator for Sophgo SG2042 SoC
  riscv: dts: add resets property for uart node

 .../bindings/reset/sophgo,sg2042-reset.yaml   | 35 ++++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  9 ++
 drivers/reset/Kconfig                         |  3 +-
 drivers/reset/reset-simple.c                  |  2 +
 .../dt-bindings/reset/sophgo,sg2042-reset.h   | 87 +++++++++++++++++++
 5 files changed, 135 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
 create mode 100644 include/dt-bindings/reset/sophgo,sg2042-reset.h


base-commit: 41bccc98fb7931d63d03f326a746ac4d429c1dd3
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
