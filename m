Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF745606A331
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 07:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yhLNN0vm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hMSlZiCW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+wvRcCu/5iRoPiZbEgoG6ChK/6Xi3dLfrdno6d+e72s=; b=yhLNN0vm0WMF3GaSFUPdaAj58t
	T1KlMGFbq5wRczHn8wA5l89hNipA3zMMIHB0DVHuiyM3Be8DYupoNPBUZrN6ZoYsJolJabApqqOwb
	RD04TmdoNO7GCdZ2XGkHxq3Pa1wGF3JTQlr8/uQoWLskY16e56J+QOdSIIrxIHITqfTYfiygxgjSL
	BaEtiAZe3JP/sue+IW1H2MomcOcxaJmyycYMT0rMa+VskCLXSajvQkKv+eEb039tZTc33nR514G5v
	e0/Yq0kdlGSk9+ouU+2YV0Sblfm8v3DbjpGQabyAQa+s3Kt0YxDfBdDfNugVrBNCyPJvBkZuLNurC
	Ah2vczxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrYQ-00000001TbD-2be7;
	Mon, 16 Nov 2026 07:55:06 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrYN-00000001TZ1-3sra
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 07:55:05 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso3776935eec.0
        for <linux-riscv@lists.infradead.org>; Sun, 15 Nov 2026 23:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794815703; x=1795420503; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ygwqe1JP9A9W8L+SChmCtHtv5W7cm5qpHwTeHwLkl8=;
        b=hMSlZiCWH9kMLu7PlUPnWJ4+L8TDAnIiIcoE8vcOVGdmwM5ftTRVg3vxu56beRvYmF
         9j2FuarV39l5he08r8Bf3IKnx3sp98oRjeyiS8xCC8vAm79gmIHNb2cwmD+zOhsT8NYc
         FJsIQhX6CnLs2uFWJ9xmKh2uT8YrIVDjH6ryuVn/mbk53vLeY2NvhWakgh053zmNLKGL
         ytNQ9KaDFlDsM9raLzvIK2+iMzkuE5ji+1bAYeN9r5HbNuW0o/XQvwS3DayPN7Nm92Gv
         O9NibAfyRTwO/JA1qBn+kUKkSgyb7fUSEFuMvVg1x8A2qTyYHfXzkZvEpay5tNS228fm
         H3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815703; x=1795420503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ygwqe1JP9A9W8L+SChmCtHtv5W7cm5qpHwTeHwLkl8=;
        b=1AoUCeVlrn9Hi29fKAUD4rfgZgksCAJfYc4ZF1wzo1UDHQWd8KnXSLtJMyTwxPZ5J8
         QjVAFrnYR51NI0qg7mgP0G2zYYXZmTQcQbaQ/hWeevbOQIlZT8mO7sMHtOfWDC0g03+w
         sPYW0dAdUfN4aYTrgbKHipJvXd8lKGAEV27m1ToxaFEdjAxHY1y+2aPb9SVS1FDMGBZc
         pjLhkFEckrevzOJODhFJjmXnx0KQGkzsjogkkEQTKmGf+FdSFSJqJVlg0Jt1LXIAEhjY
         BS9eQfSDg6/pcZ+Zxj5rHoezQdzosOQR65AmHVZ9sSM/QBtfpOOhxeDmedQyuj7WvWM+
         B98g==
X-Forwarded-Encrypted: i=1; AL+hErHs4OcbfHUw10mSS0LDx7FPDoLaAiUfLlp1qkDu0k2gCkkhqZxTdA4q1gGwQGFr1FLrgzMU8b/3V2ugBA==@lists.infradead.org
X-Gm-Message-State: APuU4Z//BjiLYKhywxXvyCiRHj+kwKyqT96bDsBnGt2c4x/6YMwqhF5u
	eA33td6PwWR5b5VzwPdLuBYaXiDwZ5K7QELE9gdWik5ouMkyybbgLyMV
X-Gm-Gg: AYBFou2sisVkMK8IPN3hyMQRP5nLDU3sm8bKEd7+BZFvssw0ua3v9/xg0zM+4FagGkr
	1NGLd5zamt9jrmNopCN3Kgf0h9NM3mz6evjE+u10XEGAc4/2sSFjvPOOx+LwR6bfVrUhtoRFOt+
	1bAEntqkpxDGJAn4bjlsMd+QSf2uX3A2n5D1wxE9uILu7A+Xhfli86XpyBBZ89MIiXJBCLfNfiR
	Pz7qlWTIs9j6EtzQP0c2j+g8W29k07fxi8Cj2tFBE1mvoOXQlslLgd945YOJ9jmdRmbOP6AITQX
	cCh2yFMaYc86Ms/wcz1hzM1WmzbKCxKVUqmsVBdkMKop/w2VT69jKv1Oy0aiB+ART3USsL1tJxi
	iVT90xYPLgll1iHjQFfMOoh4HegjWs7ULm3HdPQpu3MXHii4QtDa5AEBvUtsmlCFf5+P3dPqOds
	lJafmgkFGxwath/TEKFOOYJlKiFTVBX8QdKzfCiNOsLVPQStyheu4E6EyIPCtwCCfk3U2bvp9db
	nj+hyEPgRwUFk5uL6iBYAGR4LMhjhsR4uRq6Dt8QAL6lzQvM81pPi2icyDI3mbCV+SH/rwcT12w
	biu5fLi5srzAf8Qih4vNVRfj0+uf+EqE+Mo736jm58EHNFb50HH2
X-Received: by 2002:a05:7300:d584:b0:378:a35b:9e1c with SMTP id 5a478bee46e88-379684afa4cmr9309155eec.37.1794815702636;
        Sun, 15 Nov 2026 23:55:02 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([183.192.223.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm31398803eec.16.2026.11.15.23.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:55:02 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	me@ziyao.cc,
	aurelien@aurel32.net,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayu Du <duge1256@gmail.com>
Subject: [PATCH v2 0/3] Add read-only SpacemiT K3 eFuse support
Date: Mon, 16 Nov 2026 15:54:20 +0800
Message-ID: <20261116075423.1519438-1-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_235503_975762_38B32F36 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

This series adds read-only NVMEM access to bank 0 and bank 7 of the
SpacemiT K3 eFuse controller. These banks contain temperature calibration
parameters and other configuration data.

Tested on a SpacemiT K3 COM260 Kit: shadow reload completed successfully,
and reads of both banks matched v1. Repeated reads and reads crossing
bank/keepout boundaries returned the expected data.

Changes in v2:
- Trigger a shadow reload before polling FUSE_READY; fail probe on timeout.
- Enable the clock only while accessing hardware and leave the shared
  reset deasserted on teardown.
- Explain why the root key and SSK registers are excluded.
- Use an aligned __le32 cache instead of put_unaligned_le32().
- Drop unnecessary Kconfig dependencies and the bootloader initialization
  requirement.
- Use devm_platform_ioremap_resource() and align the register definitions.
- Enable the eFuse node by default in k3.dtsi.
- Add Conor's Acked-by to the binding patch.

v1: https://lore.kernel.org/all/20261106060525.346873-1-duge1256@gmail.com/

Jiayu Du (3):
  dt-bindings: nvmem: Add SpacemiT K3 eFuse controller
  nvmem: Add read-only SpacemiT K3 eFuse support
  riscv: dts: spacemit: Add K3 eFuse and temperature trim cells

 .../bindings/nvmem/spacemit,k3-efuse.yaml     |  63 ++++++
 MAINTAINERS                                   |   6 +
 arch/riscv/boot/dts/spacemit/k3.dtsi          |  23 ++
 drivers/nvmem/Kconfig                         |  11 +
 drivers/nvmem/Makefile                        |   1 +
 drivers/nvmem/spacemit-k3-efuse.c             | 199 ++++++++++++++++++
 6 files changed, 303 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
 create mode 100644 drivers/nvmem/spacemit-k3-efuse.c


base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
