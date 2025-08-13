Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717EBCA0EE0
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 09:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sSn8y2rzlHcXa9w+YW4drU2qfB3rET0zDN4wcBQPN34=; b=zRV6bVZ7jyOd4K
	tK9bgIdp05XvXth2YES4Zo4VwRBLUqRcMfqZWIZCZb14HkyTsayWnMiS5vrNXfnh902qcjgbg6+C2
	HxY+ytuguWvbxtJs/U74BHusO1J0vBpo65/21gAYiqe0Ea2HUrxUSvrNfOiPS6B+Vyn7kxahUohup
	/vrC0NH8T8G2oZXrRhwAGR0DoVPMQrdp8hf+RIHaUgURgaaqsg1D3D+j5PPRmjP5ab41UFR+9PqbW
	0lNHqEndA2Yn6yT44B1+nckuZ7eJnBd1oUStsoyrvO03GF8PaxxCVgftMSNQ01cBdu1eTuqLl/6vU
	ljEwlytT0YfpTtoaapSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um7ht-0000000DD98-0C0v;
	Wed, 13 Aug 2025 09:23:41 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um7hp-0000000DD74-14D5
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 09:23:39 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3b78d13bf10so6474109f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Aug 2025 02:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1755077014; x=1755681814; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TEyolKpesJRN4enzfkBag9GEI6SkLDls4Ifg+2q31hc=;
        b=XavyYYwyu/1H4BF3Mjj9EghBBi76dhKlrM7a5T2tvvVXpEzz4L3Tk+6AkElqKNlgpP
         aCv8fD71v7U322b1OamnX0XlAM+66+zegZCNWZYgo7Yk4nBWcj542y3x8SCZ9UZI2AQn
         nBhrpZbA/7sILH92qnZCzXygEDC3+mgqaqTKAN1ivSTaUoFdJFcSUMHdc6J+JDNDqlO9
         KFGq9YBx/70W8i6hd5d+nfrBTi6yHgFELmy5B6/n+FKpdEnlh5fdHTQUox6JerC3huiP
         ouEDkq90omIEbDp5+z+Ro/al6qLlYxk4E4b5jqNhH9I5V2Dd6+Rz1y/PuAPlQrCYHt07
         yk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755077014; x=1755681814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TEyolKpesJRN4enzfkBag9GEI6SkLDls4Ifg+2q31hc=;
        b=mfkkhB9vX771F3fO5IH2fiz0pAcnYX6xWwApWcnuw6pgCQ6V6xvIa3mxtfsjbRfUur
         qyQqqttKQiT2M0G/tIWKICsNqTZ1bGabwT5r2kbiEqMbWVTp8ol5kDm3Ocqs7vmJOMnt
         s+zJsbgUQ6lrPviGZfoOmAWKzHSi92+GFFxtRWs5fKQgx+wGIaLzsvF+Z2y1gH8BkQsB
         RA12ikE3dwW7C1raANoVKHCGRahCBi393uOg4Xz0mO9jsgSR3UTg5v9VcUSrkXx0ogf1
         LDgPTVXkahNqgdf8oXXRPYIsX3AAoBJ9OkC9aeSDixJk/dMnF47G7Sv8jWtFNaBG05BW
         0SSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkjl8ITn0Jds6Id2IYb9WW/YS8ma5aM4ySuNZxc6bGkXRVSthvQarqc4zL1StkjmMGaDjRWWoL6IDLFg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0hPhvJEVHUI2KuuNdXvWLmBdMzo2hJWxawRN1UHu0RO/6UDkr
	vN12h2jdUxgQpiTZaM8xVHSWAUafXW9NRp5Rgr+SUA4T2c+COm9DHCvaJJ+X8lhoNvk=
X-Gm-Gg: ASbGncubGZdPLv7znzS/NB2iQwAfHOBiMm4vQ6yx9BBhOfY3ydRBCyqQtO0JeBVyz4c
	NsWgQN9FSpPIwdcafe6AJpLSIAtcBdNW8pZ/t4nSdAJq9GTVkjI+gGH+i6cjDVZgG2bGb4sUdAW
	PQubjrXN3xuaBvDFfSv6Dz7MCZjSDdg+vFdY51VzTU7Foat0jniz4ZIpkV2kMHBd3rpnmLoIIV2
	NKdsSKTPGc4OgAvn+ueuWjHMsj0tXxc5M8Ti9tWTiQUSuT7S2UbjanvtZI3GpG9VbHqoVOZ8Z0M
	YyteqOTIUTuWe/MYqcxDvhEQjP9Km6EzTh3HK1dkBHv2vZtNkQckAQ+coPv8Q3m80KHE/i0BGF+
	UI4dCel4D4jEThmHQ5iZPOfrwmSDdwK/yi394CA74qUmH9VreJw==
X-Google-Smtp-Source: AGHT+IFxawn2hn81XiBMFzlp9R7LXDt7IQlnw4bYwjrbGUdm+VKiMtSVAcwLlkK3/1f3t/cZPUZtdA==
X-Received: by 2002:a05:6000:40cb:b0:3b7:9b58:5b53 with SMTP id ffacd0b85a97d-3b917ec345cmr1916488f8f.45.1755077013860;
        Wed, 13 Aug 2025 02:23:33 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:d33c:e682:2af6:3c3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3ac158sm47966077f8f.4.2025.08.13.02.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 02:23:33 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	palmer@dabbelt.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH v3 0/2] riscv: dts: spacemit: Add initial support for OrangePi RV2
Date: Wed, 13 Aug 2025 11:22:38 +0200
Message-ID: <20250813092240.180333-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_022337_513545_0DDA3BD8 
X-CRM114-Status: GOOD (  13.36  )
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

This patchset adds initial device tree support for the OrangePi RV2 board.

The OrangePi RV2 [1] is described as using the Ky X1 SoC. Based on research
and testing, it appears to be identical or very closely related to the
SpacemiT K1 SoC [2], as suggested by the following:

- Similar integration in the Banana Pi kernel tree [3], which uses the 
  OrangePi RV2 and identifies it as the SpacemiT K1.
- Comparison of the device tree code showing a match to the OrangePi RV2 
  Linux tree [4].
- Locally tested the OrangePi RV2 with the SpacemiT K1 device tree, 
  confirming it boots and operates correctly.

Patch #1 documents the compatible string for the OrangePi RV2, and 
patch #2 adds its minimal device tree. This enables booting to a serial
console with UART output and blinking a LED, similar to other K1-based 
boards such as the Banana Pi BPI-F3 or the Milk-V Jupiter.

Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-RV2.html [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]
Link: https://github.com/BPI-SINOVOIP/pi-linux/blob/linux-6.6.63-k1/arch/riscv/boot/dts/spacemit/k1-x_orangepi-rv2.dts [3]
Link: https://github.com/orangepi-xunlong/linux-orangepi/tree/orange-pi-6.6-ky [4]

Changes in v3:
Improved changelog: Reworded relation to SpacemiT K1 as presumed identical,
based on downstream sources and testing.
Applied Yixun Lan's Reviewed-by tag.

Changes in v2:
Patch 1: no changes.
Patch 2:
- Added aliases section to the device tree.
- Removed the memory section, as it is populated by the bootloader.
- Updated copyright header.
Link: https://lore.kernel.org/spacemit/20250718084339.471449-3-hendrik.hamerlinck@hammernet.be/

Here is version 1 of this series:
  https://lore.kernel.org/spacemit/20250711183245.256683-1-hendrik.hamerlinck@hammernet.be/

This is the follow-up mentioned in the previous version, sent now that
v6.17-rc1 was released yesterday.

Hendrik Hamerlinck (2):
  dt-bindings: riscv: spacemit: Add OrangePi RV2 board
  riscv: dts: spacemit: Add OrangePi RV2 board device tree

 .../devicetree/bindings/riscv/spacemit.yaml   |  1 +
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 40 +++++++++++++++++++
 3 files changed, 42 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
