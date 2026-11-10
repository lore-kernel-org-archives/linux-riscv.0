Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B40E606A326
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 07:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H2rXfqjs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLMzhRY6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lEVS4qKS75b//Gc+Za+8J9kcQ3sybDsGGVrNmiZm+3w=; b=H2rXfqjsi84Z1GIBPzW8eILcO/
	F3+JH1cnhKoItxstxXb9pZd1UPNIyS30ruFK472E0htxl9GPGdj4StUipU2Z7gF3xq1F+fUbtLbEp
	godK2y30uD1A2TF8OWEpWtWMaICRMtAGmy+bKg+pfeXTC2L1uoUS121Gu41NDjbYowDaxAfJetF/K
	Q1Vh5UvU4f2ASMEgOMb4UquXwagEGKlVQuHAFOy9D1P86cNm7fIKVVnVLeuqJSpfcbDyDb6gOW6bl
	DanVQ+fTwV3FqUn7i/EK/FbUtYXtPewJG+KIic6ONlKrZJYn6kIGZ/9QhPsMliIrA4rpA2yaSeMYU
	xgYagcAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfwR-00000002jjd-3eQ3;
	Tue, 10 Nov 2026 07:06:51 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfwP-00000002jjJ-0kSb
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 07:06:50 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so1206690b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 23:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794294408; x=1794899208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oK7s+kTj8JHO9aImQkcN2MWu+t89MEslq0oYBzkYn0I=;
        b=lLMzhRY6w1h3uqmkLfkzC8dXJ7alJR4/gl26AVHrMwCwOmgmdtmByIReKqy0OJNBAg
         tCHPeZ4l3FqBB7mO5tD02fcCe8xC2D5LwFK2tsOSwkl3c7fMMOJod60af3XsGR4v/pYp
         mFN69EDrfh9N1GGmBFoR7ESGRcHC++LL4KrAwQEz2QiB1ebPY7rsKMCVVOPFdhl3oMVU
         pEFQ7x8QXwKvv1k6vpwSga/LOLEUbdI665Tjx+1dDCUPLtLus7j+tyOUGTGjqQKadEbA
         TSUAvGy0k/tYYG8Ry/cnS10HszxFihJwHivOrsPjdWyV5Kpdu/MAxGc1rszfGgoBn1bd
         JIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294408; x=1794899208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oK7s+kTj8JHO9aImQkcN2MWu+t89MEslq0oYBzkYn0I=;
        b=KzJHzC2PmPo/YoP+HPmmzJCiRHWDx+EekP6PsoMo6FIaUUF7Sv/bJfE2GylsUZimoP
         ezsPcX7alOjr8EAzqzo92sXtB7Ez86thvB8FCDru2UDNeUWIzS7aG1B7BJnTYdzMuMzy
         +Wc5XDvyxSaRghjv8Y0dMHTV7aYZCRaSZUGfo7riahbUFhgAQqKhRacuc9sH9KFf30ar
         Ksvh14xg+cib1o3TKJLcxrc72Y7yotn0OjqeKCqY566SjywXD4zxS+rTLqajdK647XFA
         RtLf/YcTdx525lhyXh1qD127QE+SMY8Wpb/WNeGpD0BxOoJm7KY68VMpceM+sHTaX3sH
         q67A==
X-Forwarded-Encrypted: i=1; AL+hErF8V+dZzxxRfXrVlB+GnffPnJLw/+EJ/PsWSBOxl1iOd7p4fqvml2B/lnRGMKSJhuiaGwzmkxe3ST9soQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z97GF3OFV8jtgNb+QLG5GmTNTLKXwc15Jm+3veSMayx+UdO3wTb
	66AheNKvTIIinLqjSk/6RRn4SAZTBhlwyzzqiTveuQ4J5UUY5AvPl8Bd
X-Gm-Gg: AYBFou1T8W87/w/iNxj4iV67VAbpYhUxZ5ieBOqVI2509G1HVTiejYiHRfYq8sKH8Ot
	lWit6EucVff6hVnqs3YA4uykjHbz1OF8hudP7wRPTtFhv7bWZwhOlywPKGzbDi2yaOZOU2MCw34
	Gf5TiPv/ZWqm/qwWU+CSjkfuMcjz9ssiEGBeTJ9G3MJZI8T2HQs/E3YuXpMoLDNrLlFs1hDAOry
	srvFs8n7Tv66AJvFelo/3hbxd2Spf4R4NvzZpUAqNNJINNAsgYC2e3w9J7aVFktinGmlIJvUzEv
	d7xYDOlZIpu89Zta/RdvG0HohY79YzEagT/A8v/w27gVo/ardVCWjDSxkx2iITGYrrWBjGrN+XU
	xB85sw4/PD1TTcYC4/eqGGV59wTk5o3vLmLAhpwtnt3KvdC5E+JWcv7SW3TBTL7UJDloQ9Ppzmb
	fcV7bUx0Yh2CocokbqAkJ/xoBp2xD4r7BvVeoD4GJth9TbdwayhKxMVUGjMU1FyPrhQKnRaQjWo
	iHrxjgzkdKzSxx3oKHVccUB+bANsZk3F1T1ISzGE4Yx7fBauoZKegvI7nlFj2V/B80OFODujnCC
	MZKOeuVKhAio11cEkOclOOPoPUU=
X-Received: by 2002:a05:6a00:1389:b0:89a:19ae:10e9 with SMTP id d2e1a72fcca58-8ba8725e415mr1910547b3a.38.1794294407637;
        Mon, 09 Nov 2026 23:06:47 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3f3e7sm511794b3a.40.2026.11.09.23.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:06:47 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Longbin Li <looong.bin@gmail.com>,
	Dinh Nguyen <dinguyen@opensource.altera.com>,
	Paul Zimmerman <paulz@synopsys.com>,
	Felipe Balbi <balbi@ti.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 0/4] usb: dwc2: Add USB DRD support on CV1800 Series SoC
Date: Tue, 10 Nov 2026 15:06:21 +0800
Message-ID: <20261110070627.217946-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_230649_239082_F2F24254 
X-CRM114-Status: GOOD (  14.42  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The current DRD implementation of DRD will cause a interrupt flow on
CV1800 Series SoC. It has two reasons:
1. The DRD does not sync the phy mode when change the controller mode,
   it is a violation of the DRD as it does not rely on a OTG phy.
2. The CV1800 is entered with a Session End Detected interrupt, but the
   DRD code has no change on it, so the controller will enter the
   interrupt storm.

This patch add fixes for these two problem, and I have tested this on
a Huashan PI board (it has a CV1812H SoC).

Note: This patches set does not resolve all the problems, as
      usb_add_hcd() will override the role set by dwc2, but I am not
      sure whether it should change skip_phy_initialization of hcd.
      So I kept it as it is and users still needs to set the role
      in the userspace as "role-switch-default-mode" in devicetree
      takes no effect.

Inochi Amaoto (4):
  usb: dwc2: gadget: honor pullup requests in core_connect
  usb: dwc2: drd: Sync the generic PHY mode with role requests
  usb: dwc2: Add USB DRD support on CV1800 series SoC
  riscv: dts: sophgo: Enable USB role switch on Huashan PI

 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |  4 +-
 drivers/usb/dwc2/core.h                       |  5 +-
 drivers/usb/dwc2/drd.c                        | 77 +++++++++++++++----
 drivers/usb/dwc2/gadget.c                     |  3 +-
 drivers/usb/dwc2/params.c                     |  1 +
 drivers/usb/dwc2/platform.c                   |  4 +-
 6 files changed, 73 insertions(+), 21 deletions(-)

--
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
