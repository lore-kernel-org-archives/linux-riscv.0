Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAACBCCD187
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Oct 2025 01:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=26eABhiBhjCH9Rh1aaGRQPrI7bf3xxyV0uyRtaNWj+c=; b=Bq5TXWN1HalaNH
	3eCYPLiaTkNCCyENpTMJbNkHvrwAAyjnd4z1+wyKEVK5uaBmg0NZf2cxIeU6qtatYvP80qakf43A7
	c393deh7R9lbFgb1Po9aKw9XvypIGg8h4jNtf1HO5BbqnA/3ltGRIwxIwR3JOAFAUEmm1htUD6Rmv
	MUWgGmlP+8dAmkZ2IFugFmbjqA1IZ+mlOU7a6bGctxJe/F6Y0oKC9CroKeyFxOPg2W4HGUYxUv/JZ
	WZMj7vRwTUdxk2l5CVA7Egs28LRIo5FjJ7w5R6M2meVKB28a8XnCmzKhgtfmGgz7ei1GdnhOkbVAV
	vm8euJhKXqIzWJM16noA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Oir-00000009fMO-0p5G;
	Sat, 11 Oct 2025 01:48:37 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Oio-00000009fLm-37xR
	for linux-riscv@lists.infradead.org;
	Sat, 11 Oct 2025 01:48:36 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-78defc1a2afso44063986d6.2
        for <linux-riscv@lists.infradead.org>; Fri, 10 Oct 2025 18:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760147313; x=1760752113; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h/W2Xx3VDAhi2ly1ngkxo8tYf8fz/VcaD9wHZnrx7SU=;
        b=a138NwmytP7cOD/3aEKnjo4jcuuevd259F0FKlUoPF37owi5fhpGMyZ/PsEndD6cEh
         pcaCuKLMrjoiqwNObgJsSYjEpVxJ3u0UOcKAJXbYJQldl1ecKptjDPYYdjkqeYpg1gwU
         eVeP799hViEhdSPehh9STaPBs4uSKRZpu3G5vZdR6A2n00zbT4s9t8yMEm79QdMsM81B
         tu2yb4Ftc6cIUs0NfeDUQMYEFbnypDY6HK8oj66dcKLpU4HjDqsB9VT7z9CEq9sihSAF
         PB/4xROoyFnVTMeVP8BA6SfVIPxwyS/WjpLrAZP3xK3v9Q6po4ORicVGu/8ubiSEgeHz
         Lm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760147313; x=1760752113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/W2Xx3VDAhi2ly1ngkxo8tYf8fz/VcaD9wHZnrx7SU=;
        b=ubbwM5bq1GenWBVtPsNrrz/MnGn+Ewl3ovPjRLp0Z7DfE63pLWmTYkqerb6VtUDGzB
         zrXQGI59NcQFOww5zYfOugIQAr1OBpdHqYUEJoPqBQ8RN4m9JGV0SPvGf2IuoZX+EKgd
         9XoalUYHVubKpJ0g7H95O9ueLJSjdXylvdumkila/IedRo+sq0qxLYT9hg4VKGyFitx2
         gGsfrnwoFedFOAvycbbQGkpH2eXsi37RQmaql3OQQZUqDQsvkR0xiflKh58ZowhevYan
         BXtIqD3IJWrDLPVeoxOl31FlirZJCgmwi/sUl1jwOd8vd43ZYrovX6v1LTXrqDDJ2DAw
         jSRg==
X-Forwarded-Encrypted: i=1; AJvYcCWzgoSlNT7lokRRXiluexfGcf80VT2x0qNqyMk9yVS4AgSTK3fe8j5xb2IJGT5AmJ0dpMTsj21nxVProg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMQIUwDfXb3SeCk0heBq6SIr2WOzqy6LYjOs3yInkO8vlhaJdi
	DQhEr8W7diq6KUgpe47S7Ik5IYlUhYYXKJ1r16NK5rFvJ/RW0KVxwJnH
X-Gm-Gg: ASbGncuTJO5VUuAZN+7viNhJi4qAvRZ9qiHBZQPYGMjS+IUpyPgjs62d68jM+1ih4V7
	5VdQnYAW2hLNY3HeqEC2y02xmfMnqrmdftyGf43Mf6pB5I3B3MoKpzHGONjjC35FK2iiZZJ1JU0
	YFAO559mVPtQQYPNLOOvgGB2gzkiOSqtVicTdcEZnLfJB5xcuZebzB7rYIOoyhgW4Bxrm34+wM3
	0tNyhA7ushWqZ1IMUFJpIN/HE75z0Y9m42R5KaTnZ+xPTi2KbdOLdLsD5zvzAFiPtQ46Ow7DAYb
	my8RgDhexyYwS+7gZQlH/ZzF3OL2zek5mij5sJeSNaELT+XB4FfAB4SIkW7LwxdXfD8Gr2mE75C
	hHpCefYcz8Nrk/syN+xh6qoCJoAkTtdynGbFhuwCgtVjnmaGHkVbxD083yIJRj/h7xHWheE7b2c
	gl3nCqmsSA5A==
X-Google-Smtp-Source: AGHT+IFBkBNnpT/JUcUbYt+Zy+CvYduIlQhXQKlUiQpAEV8m4hje8Yu33lh54bsqnR3UkiS8jt5MJg==
X-Received: by 2002:a05:6214:2485:b0:792:61c0:beb0 with SMTP id 6a1803df08f44-87b2ef71746mr206771416d6.67.1760147313167;
        Fri, 10 Oct 2025 18:48:33 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87bc3574e71sm25978806d6.36.2025.10.10.18.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 18:48:32 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com,
	chao.wei@sophgo.com,
	liujingqi@lanxincomputing.com
Cc: josh.milas@gmail.com,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/3] Add initial Milk-V Duo S board support
Date: Fri, 10 Oct 2025 21:48:08 -0400
Message-ID: <20251011014811.28521-1-josh.milas@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_184834_813631_290BA318 
X-CRM114-Status: UNSURE (   9.57  )
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

This adds an initial device tree for the Milk-V Duo S board
with support for reading from the SD card and network over
ethernet. This is continued work from Michael Opdenacker's
v6 series [1] on the ARM64 and RISCV side. It has been tested
with both ARM64 and RISCV64.

---

v2
- Made new entry in docs to avoid DTC check error
- "Milk-V DuoS" -> "Milk-V Duo S"
- Sorting of aliases
- Added uart*, emmc, mdio, gmac0, i2c*, spi*, dmac, saradc
  to device tree matching what is available on the pinout [2]
  and available in the device tree includes
- Removal of 'no-mmc' and 'no-sdio' for sdhci0 as it works
  without
- Added riscv device tree

Link: https://lore.kernel.org/linux-riscv/20240421055710.143617-1-michael.opdenacker@bootlin.com/ [1]
Link: https://milkv.io/duo-s/duos-pinout.webp [2]

Joshua Milas (3):
  dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
  arm64: dts: sophgo: add initial Milk-V Duo S board support
  riscv64: dts: sophgo: add initial Milk-V Duo S board support

 .../bindings/soc/sophgo/sophgo.yaml           |   5 +
 arch/arm64/boot/dts/sophgo/Makefile           |   1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 110 ++++++++++++++++++
 arch/riscv/boot/dts/sophgo/Makefile           |   1 +
 .../boot/dts/sophgo/cv1812h-milkv-duo-s.dts   | 110 ++++++++++++++++++
 5 files changed, 227 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h-milkv-duo-s.dts


base-commit: 0251a1deaec78252cb311fc8305d3670bc5eee0e
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
