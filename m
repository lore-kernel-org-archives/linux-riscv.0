Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390EEC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 12:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CGzdQ4fHIfS/NlPwh9MmIHnIts2zsn1v3Cgtiiq50dc=; b=A71SlrGFDzzhhk
	+eBtojaLfOPRQHJHwfA7LxYCqd6+QIhuyF729TnDGUBc/HqF2vK+lhfCe6y3wsGb4KA63FqHj3eqP
	CNo55QkxBQ+cU8F0bXiJU8maGwaEJ5zNRqEp9wV0KVrbYdgoFIJzYFKB6CcgapEx3LwbZYDLuvtIt
	GRiF1zj5J1fQ6M1NjS2GV9WNCJxOxl1vu0qMvIuxquCjxzCkeGBo7HJsKpUxXJ4/f1navK4ywoR80
	0lt7IJOJ0Mdf1M+B1EpoTtjJaSO0GvEL8BHrJvEBWkWlwAc5tpea1Gd9QDzfZwKdaw5YB6q+sd6UA
	mBGUOll678VetdD6YKnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwLnM-00000008HbG-03Bm;
	Mon, 15 Apr 2024 12:50:48 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwLnF-00000008HU3-1uCu
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 12:50:44 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0776A411E2
	for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 12:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1713185436;
	bh=ReRzghlopjwKf7ZFoLym1/k3KhnDB0D5vdDpSWeIHhM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=ae/lWlEI09SQ9Trq16sXnVQv18f4qswt5Q7NmSh/hC33BXqLodCgSxRcrmHdwXpm7
	 3MqfRB9GkBYj1dhBCc2m6PH+XdyPrc7UE41nlMIB8Pf6tWNEFA1EK+mzdd65ZIwzdW
	 wAzaZ40z36iurfWkdMhVCtMz7rM0KuhtZlNx2rDTP3QCWMWSbABLb2cAu4NLoOomWw
	 k4HIvZIldhCypZrBrjYhQ4+Rl8s1jdQQhTliU2eATbGG6YU33zrGKfCW/BvrbDDbsm
	 dRg5w4vkPa8WKkryXcOwpS6NvPIVTJzOwGOGkbPML70CQCHutqw/IyZpKwwmXZ+IbQ
	 +hpfsq4kAV1rA==
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a46938e24dbso53767766b.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 05:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185435; x=1713790235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ReRzghlopjwKf7ZFoLym1/k3KhnDB0D5vdDpSWeIHhM=;
        b=UkegyCAszdpXDtx+gGNy7TsN9sT1eFDBd4hfxPT3+ZpvwqoF0oxvPBPC52XK7If5xY
         vcRqaqKHbxijeevnlSAdj9xOI81Ac3lMVpQihj6AcY8g5IEMrtyAUhfT2QzoiO5TQwlz
         HzVfIOv/LTocitfNTDxO8hcsskTDlEudMvtqvFAAkdmNtd/xlHbd5RwrlKdBbp3RFog8
         r03Y1S1/8R+c5vA0viNDTGUHzbaZq8lN0VATpBixxk1rXokLmUHSRkXr5YvrjzKT+fps
         phSDCjQ1dbOTr/4I++2PhNjJjl7k1ISj0nySG8zG1HfzMtDGnrtP8rtCxNrP5a02PRw1
         grMg==
X-Gm-Message-State: AOJu0Yy5ZBKZz6vQgC4N450I1GI8c2wajoeozWT4pj9AdFHJTn9hMEfs
	fN3uQNQo3VMD4HQAvYGPzLdWx3CsMXHqzuToYbuyhw0vpZ0r2dYNLVCZRelK/aU2fLaZlBmGc9N
	Y345ymufuVczZgghqHnIKpgC7h5z53KEtfQ9Z3RuAAhMQ8FU2dIceKLj4yE2q4ynztv9YHBU7rw
	OGmWXka1fdLE+2a13u
X-Received: by 2002:a17:906:6a04:b0:a52:55b2:ac40 with SMTP id qw4-20020a1709066a0400b00a5255b2ac40mr3424826ejc.3.1713185435374;
        Mon, 15 Apr 2024 05:50:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEl2HDhIy+WQcJGTsKSEGLwyKxvTqmVqEld+FSqkIKcpUnlu0ruSuJZgCJL0RGW8urzg1aMlQ==
X-Received: by 2002:a17:906:6a04:b0:a52:55b2:ac40 with SMTP id qw4-20020a1709066a0400b00a5255b2ac40mr3424805ejc.3.1713185434966;
        Mon, 15 Apr 2024 05:50:34 -0700 (PDT)
Received: from bojack.fritz.box (197-53-142-46.pool.kielnet.net. [46.142.53.197])
        by smtp.gmail.com with ESMTPSA id bz2-20020a1709070aa200b00a51a9eccf2asm5455573ejc.125.2024.04.15.05.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:50:34 -0700 (PDT)
From: Hannah Peuckmann <hannah.peuckmann@canonical.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Walker Chen <walker.chen@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Subject: [PATCH v1 0/2] riscv: dts: starfive: visionfive 2: Remove non-existing hardware
Date: Mon, 15 Apr 2024 14:50:31 +0200
Message-Id: <20240415125033.86909-1-hannah.peuckmann@canonical.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_055041_940593_F0C9D458 
X-CRM114-Status: UNSURE (   8.92  )
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

This series fixes the device tree for the VisionFive 2 which has nodes for
non-existing hardware which should have been left to overlays. It also results
in error on boot when both both the TDM and I2S drivers tries to claim GPIO 44.

Hannah Peuckmann (2):
  riscv: dts: starfive: visionfive 2: Remove non-existing TDM hardware
  riscv: dts: starfive: visionfive 2: Remove non-existing I2S hardware

 .../jh7110-starfive-visionfive-2.dtsi         | 98 -------------------
 1 file changed, 98 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
