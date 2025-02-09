Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78411C0219E
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Feb 2025 12:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vv83qVQbi9fxAIbJ+GrgQsbjJUEdkWu+8V46TQUk2eQ=; b=eyJPW0o6jTjEGZ
	CkDs4yQB9AGc2vpwhBwEogBnmuu4Ik/x9hDxzauPuw8VuvUhz50pbNQMVzn4GKVcKy2xFNzbmnbT8
	+7kf39E+lL+59U0nLG1vRhhXUjSoNVsFGrl2vV1/yPq4WIm3FEpKlorIaMOKWcfIKzmFtGIOFQAGO
	b8czYQYcgVGLKhdSfXDeYG+FTVbWZSo1JUphXfXR+lgoPLbU/YqitAPCDrfhO2rSy6ci9Oj2NeZBj
	YmHIB7FUQ1kDCyk7879Q0NlZvB3BonZJWU/znoW8h3ifHz/6COn/lWt1Ahut+RwLmue4gn0bbBTVz
	6DKhG4Zk/WKoirgZNh8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th6cq-0000000Esr8-00Vk;
	Sun, 09 Feb 2025 12:41:28 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th6Rd-0000000EqxF-1vjb
	for linux-riscv@lists.infradead.org;
	Sun, 09 Feb 2025 12:29:54 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7b6f1be1daeso385133785a.0
        for <linux-riscv@lists.infradead.org>; Sun, 09 Feb 2025 04:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739104192; x=1739708992; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DwvIvCl35OzqM9bUelpAzn4mC6uYC+wlI6NDs/JDjeY=;
        b=PiMZ17yDZX2H1sJvL43GWV3d6py5FR8XYrxWUhDK2ray7BewaGJBmVULhRcBFKjKbb
         GmsRbs4cU5dJsJ53qjFSdzST3lpoQq1096KNU8XMm4uJUwLFjA7W5yFQ8OO/HxM+UCsB
         myIO/4dn5YSA1AOqWQ07+i04diQ6IA/+cUg7h18OdUt6MC28yrgQeH28abTeuxkDJ8xk
         9xUWl0ENkxevPLhrcLiJlS0AwVzWqV5PG5oy2w11u5mrOvRJk2PhLD9tvxTLE3KNiMMb
         mRc2yPJRHLj26bwADbr2Jr4VVYGu6gY5DvjcfitRi5ZP3KhvU9oeKYAUoTyi+tL3vzP/
         9Nwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739104192; x=1739708992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DwvIvCl35OzqM9bUelpAzn4mC6uYC+wlI6NDs/JDjeY=;
        b=XErg1XCUjK0L4z/glQ4tH5fhCOn4D0xoRXSGgOdbSgTt5j7EcxG8lXCe2OvoDYdkoF
         LlF8k8LU3wEJcwoiK+KfGT+GmIg3eT5P0faRFDkPmhOghOUV+OLwQJGWKtjyGCUlUBre
         2Eqt3XrOF5xxXMDZO/hixDSuifgF6HxBnwW6OmuDP2dSOf0j+L7aA/xbmT4fBcz8Wjac
         Bmghl4ql5FOpHyp6zCJrYbsXHT2i90z9bywBd4fzKHXa4QwEsw77Iqyy5BpOVlZkUOXo
         Dw2vRbdAEgbiE7nbhDKc7mAWiKG/5oH1G9H1tllkNJ4wZsDWKRGLWY2Li/gOvIwhsFd7
         F9Gw==
X-Forwarded-Encrypted: i=1; AJvYcCXlbzzqNMz9kyFLmer8lxyzXedfiScD7ZIO2muJd0VA/xA7CGAdq/DfNlWD8czYjrvx8dafipP/KjZcvA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTgu2X5bfenDjwPIJGU+UlkNodVBzKUw9qMHkX3sZBGUjmPSkx
	VIgYiR2BdZHFwMlYR8iYfe4srQQ9ja15AclYfgVLBw18VtUF6lGH
X-Gm-Gg: ASbGnctU8cDIEe6x4+l+kXa/75R2Q2mT/+tRdj3O10UfBpTfWsOZCIqTH/xiI4VDLwU
	GX+p7hjXiM+AxBm+Gj0XjH5oQlfARdFATYdfrA+g2RHxK1mMbNf2+Gs49qlmvoRDYpB6B7sDw1r
	Wa29ENfDM2u6GNmnvsK+71A2iPL2m9vyd7E1WhZ5PPWFrldVVBJolR76kx5gZglGkjU8e9eJeKj
	PLfnhCnEr+4psPqj5+vlsalR0nvTm+6+BVBQp/nU6OSpSwSNnuqyYCVPo+LTN0LnwY=
X-Google-Smtp-Source: AGHT+IGSu/HIdJ3jLmPPmmBGA0MsS2lwXSoZr8XmCh5qD2BeF3+nxBxBJt1/7KlwUfp34PmtbC34GQ==
X-Received: by 2002:a05:620a:c43:b0:7bf:fffb:5818 with SMTP id af79cd13be357-7c047ca80f0mr1595418385a.57.1739104192037;
        Sun, 09 Feb 2025 04:29:52 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c041debe1asm404950385a.2.2025.02.09.04.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 04:29:51 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/4] riscv: sophgo: cv18xx: Add reset generator support
Date: Sun,  9 Feb 2025 20:29:31 +0800
Message-ID: <20250209122936.2338821-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_042953_515893_B583152A 
X-CRM114-Status: UNSURE (   8.15  )
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

Like SG2042, CV1800 Series SoCs also have simple bit reset generator.
Add necessary code and bindings for it.

Inochi Amaoto (4):
  dt-bindings: reset: sophgo: Add CV1800B support
  reset: simple: add support for Sophgo CV1800B
  riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
  riscv: dts: sophgo: add reset configuration for Sophgo CV1800 series
    SoC

 .../bindings/reset/sophgo,sg2042-reset.yaml   |  4 +-
 arch/riscv/boot/dts/sophgo/cv18xx-reset.h     | 98 +++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi        | 21 ++++
 drivers/reset/reset-simple.c                  |  2 +
 4 files changed, 124 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h

--
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
