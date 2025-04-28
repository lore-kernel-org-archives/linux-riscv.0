Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC303C369D8
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 01:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1bvxgLt6jK6QM0AuHu8rQCRuuiS3CR3oVSx1lB+YZQQ=; b=e0fbdQfDOgRzvN
	0re1rjuE6c8Jj4WfXZp/n/nmCr047BQroVzFlxRuxFZIkLPB24iiISmwvFGYP3DtVrfGS3pfkqUuK
	PBEagKXGJfp5SWvl0N5QStgnROFdPybAjhIsTbzT33p0sxdF3KnFhWLRnUIwiXaV6MUQm3QLxHcM8
	NUhBBfpM0o85Y/8KW+nrcM3hIU9qrDQ4lUxHm9o3cdR3SnZ9EDwuGFtWwxT84ohMODzgIu18HRc11
	gXerj3JX0OpYLMKSG+Ke7i0tS5LKII3gIVTgl5E/heC15ppKYsVGZzKJTogHPccd8Gd8nvmiQDHQe
	2vSAOiFw5+athDMQ+0MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9DPX-00000004HZN-2vBC;
	Mon, 28 Apr 2025 01:35:55 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9DPU-00000004HYg-29B0
	for linux-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 01:35:53 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b0b2ce7cc81so4222340a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 27 Apr 2025 18:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745804151; x=1746408951; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CelbDdjD31eK+tW6nqnssONRY/dMWhFNI8vW3XTn2HE=;
        b=ODucrV3wIPY5u4a0RQVzVi7zL5Y/yppA5pfddvFZ/VXNU1UiSsXP+fqxWafCQcg6tl
         IoD/WPnCl5AWRLKNGgF9ZvEUA5As8F1LsMjtr0V1X/RGJWdoX3G5V3qsLO3nk8mAP1px
         nj45L1vkQwu0/Tp17sM4XaQlVlgzM8kn0OIkjhNJrfHQnmUvAwK6pErDjKUNTE8oQ7Ih
         fMTRODOCsS7Qpcf2pyZbcHa3c0tnWrcyPeOgEnbMpGRt0VOLEd58HqNPzbfydd6BirtO
         QO029WK2azosivY37qmw3lTk2CQgqadaVzEKfPPwgFHKd0w17+B/nYPMTFKVY9EPzf9w
         Lz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745804151; x=1746408951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CelbDdjD31eK+tW6nqnssONRY/dMWhFNI8vW3XTn2HE=;
        b=h+QTm/u1rUSjqEJXBWaH/oGQNoGkYMYNnq3LTQaJHIAzpZOr9nZ9075dLr+Ud66RLw
         3ebGJHvbT+EsD8JiCWv/QJ1RWSA5lhyaCDqxuxOwwyVrVjMCBkikGBzWYbRNp99SklHy
         pBbDefF3cVzRx8fupA12UvVxMW31LwtBYS9rdCmH2HhWthuNcTI2cESZoVrDYZljRbjW
         pEFMtWHyHa2FSbAXBo34kT7g260v3jq6JTrMRn95/vjK1/kCz3MzDGpGud45A4eIhRkv
         WCroeSaJEdtMiJeixnRSJTQnK0x/8LX090ANPG2YYjV8UXQ6od1NfBVEF2yiYgu5UJv7
         aBkw==
X-Forwarded-Encrypted: i=1; AJvYcCVe8BvnSD+rJSrS0ZB7lVzDz+j72OuTzblrqHQ8FV1XsSVDV2OgfftqytVcnoPF+v5gJ3JOsuMUmz8SDw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwyFtEsvdajRbcI04LLhWeoay4YjZupA5coM+j6AVZvc77jUNam
	QRpl/bVXI6lla5h50e2aeMTXvDsaXrqAs4x+riokkbkuLBKgzv+9
X-Gm-Gg: ASbGncv8FT05cBQ+2E3NOKlZq8rzO4pRw9c61JXJfBiWwSGXOWQlgi1w4m2AqVoLpbM
	RWYZvSNCBuwviQGJC2fjiZFlDF3AbvI11D4RpNI57lCq1H/ryzwoujnWZfLi7g470ffY6oQAH3C
	jX5ilReYtxniPwHki4XlRNCAAfeFNxahAAcrVbl/P81gMpdBQAnzwJe6n+dGMjVhoneZHVL9y+0
	m8x9NUQEMFu6J3gD+xZc8z1MCblRn7c5Fcq1C2flOUs3SipkJc2h/KilfmS2ZX7fHFTJT/dxccG
	NsIZOx9TlqB5
X-Google-Smtp-Source: AGHT+IGKGbMil6EEDHU+0biwSVoCuulWB7ClFkZPInygmRDwy/3+427P9i1C7j/ysX93h0Q5LbcJwA==
X-Received: by 2002:a17:90b:52c7:b0:2ff:693a:7590 with SMTP id 98e67ed59e1d1-309f7ec20famr16886974a91.33.1745804151055;
        Sun, 27 Apr 2025 18:35:51 -0700 (PDT)
Received: from cu.. ([2001:da8:7001:11::460])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb26sm8508671a91.6.2025.04.27.18.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 18:35:50 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Longbin Li <looong.bin@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 0/3] riscv: pwm: sophgo: add pwm support for SG2044
Date: Mon, 28 Apr 2025 09:34:47 +0800
Message-ID: <20250428013501.6354-1-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_183552_548719_D2377515 
X-CRM114-Status: UNSURE (   7.89  )
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

This patch adds PWM controller support for four independent
PWM channel outputs.

---

Changes in v4:

  - add tags for mail.

Changes in v3:
  You can simply review or test the patches at the link [3].

  - Rename macro definitions to unify naming.
  - Modify code style.

Changes in v2:
  You can simply review or test the patches at the link [2].

  - Modify variable naming and code logic.
  - update "MODULE_AUTHOR".

Changes in v1:
  You can simply review or test the patches at the link [1].

Link: https://lore.kernel.org/linux-riscv/20250407072056.8629-1-looong.bin@gmail.com/ [1]
Link: https://lore.kernel.org/linux-riscv/20250418022948.22853-1-looong.bin@gmail.com/ [2]
Link: https://lore.kernel.org/linux-riscv/20250424012335.6246-1-looong.bin@gmail.com/ [3]
---

Longbin Li (3):
  pwm: sophgo: reorganize the code structure
  pwm: sophgo: add driver for SG2044
  dt-bindings: pwm: sophgo: add pwm controller for SG2044

 .../bindings/pwm/sophgo,sg2042-pwm.yaml       |   4 +-
 drivers/pwm/pwm-sophgo-sg2042.c               | 151 ++++++++++++++----
 2 files changed, 125 insertions(+), 30 deletions(-)

--
2.49.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
