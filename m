Return-Path: <SRS0=1JZA=NQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 967D6C4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 13:06:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 394C7610A4
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 13:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 394C7610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AoDw8P6FYeSSbvFmDH4KRcJ570uovXYwLb3e6qQs0YY=; b=irI1IlxBfQn+L/
	V2hKe3q1RyslYyC+O3iBFMyea7biggYik9iF4YnW5JulmvrzYRq3diXRB0NJodyi1XrOlJ/kM7hKw
	3bDC+sQ8q7zWx5db+Z7Tz4a/+PKKQfEsmfqnvkEN7wxZ8Ty54A20M6oAtrY4VPmBSlXwu27kVKGPU
	s31kR/kj/gVmCp7SmJl7fH5TeIfCRCMdPgp/8w0ivnDfqc3kHeqgJtQ2NTLT45Es6PfU3T0nPVgJj
	o1IUw9FuSQNEyF6d0zV0qHFz9LrDQhhe+wr0O2QVEI6Mr9sevG7E2N6yVi0DL0rTCOBlDqqJv/s5n
	7Ox+7DOYuCQy1UqQ6lew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIsbC-0070zq-4r; Wed, 25 Aug 2021 13:05:46 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIsb5-0070x8-Ex
 for linux-riscv@lists.infradead.org; Wed, 25 Aug 2021 13:05:43 +0000
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 67CEA40766
 for <linux-riscv@lists.infradead.org>; Wed, 25 Aug 2021 13:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629896732;
 bh=lrFOqJg8K+1XmVsF/GpvrcRXBvTi8X1Jdxp9tcz+qM4=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=GABSUjE+Fl/asVQF557BfZJ0qbfYayqHleFpFsCTMi86+dib5w20Y89snZBkmAcRy
 C36TPK4wQC//3n+x3x9jIucrLh0y42DrkT7k+oxz54ocYxpFzou4gswWhb+ZfnxHNy
 7xeNE/oQmkt4RkzcOOyyPhqNK68NdUlWxEaiYjSGozESlT/9wuZlWGh4sKRqUAmwR3
 8Lj3WIWfyd3EfjrbJnCQ1zUcCjoiv4iulEIGwjth4LzkHH7x5SULCqYf/1imBEIlmT
 jhH9y5CmwlJPaubqqN6s8x75v3/N+SQvq4Z85hiwphTLKGxE478yakTlwZ5eQ8PGaA
 t6fIMfv/KPPpA==
Received: by mail-wr1-f71.google.com with SMTP id
 102-20020adf82ef000000b001576e345169so884053wrc.7
 for <linux-riscv@lists.infradead.org>; Wed, 25 Aug 2021 06:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lrFOqJg8K+1XmVsF/GpvrcRXBvTi8X1Jdxp9tcz+qM4=;
 b=GYbtnztPDcb0KKgCKGP988VBd/DfceOJTRyX1nppBGgSpNpLTrbnYOsvM0UOmyOTz/
 seYXDwaL3t785pvjRwUPjHIGIQX3OUbh4Uovewwd62zwqCbjMQjYVtIpJYtgaiH8GqvJ
 xBFRXeUMfZUSlbasyX3or7klvstnt3y00u33HZ2ZiCN1JYLLN229Bc1S+A7pHdPm5p7G
 JQrWlThD7+o38nR4HFFBqJEN0KUDTU2M8r/P2X7wpg0luoF0YAKDYvaC9W7x37/UOHUZ
 Hnq/gRSUopyIVc2diPwtXnMsJa6peuRYQO72LZVkjTT7eVhdwPDLAM9WBIHfjoQFz6v9
 gpbQ==
X-Gm-Message-State: AOAM5302wXxbTUerBephohH7KEG1sQ/BencviBH0JfPjSd4eVnKgFLyO
 DxxIJkWAMfmLYJRLhJ/v1j1A4vCBdgok/gZnkfH8e0HqeL70aZ0efq0BWYlC5zw2tEPiGl+IpBB
 cofHRQQcob8hjr2mJg+hT3sGxZGW0bIfxIcrOigNJTS3Avg==
X-Received: by 2002:a05:6000:23a:: with SMTP id
 l26mr9316778wrz.369.1629896732157; 
 Wed, 25 Aug 2021 06:05:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyADruAn41uaMoIibr3RD756bAEGF/fXXqaWRQ4x7Vv3pmlISb8rI06kiDTgzghEeX1S6dBhg==
X-Received: by 2002:a05:6000:23a:: with SMTP id
 l26mr9316757wrz.369.1629896732021; 
 Wed, 25 Aug 2021 06:05:32 -0700 (PDT)
Received: from localhost.localdomain ([79.98.113.233])
 by smtp.gmail.com with ESMTPSA id 11sm5338828wmi.15.2021.08.25.06.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:05:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Atish Patra <atish.patra@wdc.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] riscv: dts: sifive: use only generic JEDEC SPI NOR
 flash compatible
Date: Wed, 25 Aug 2021 15:04:48 +0200
Message-Id: <20210825130452.203407-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_060539_684011_B3490418 
X-CRM114-Status: GOOD (  13.03  )
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

The compatible "issi,is25wp256" is undocumented and instead only a
generic jedec,spi-nor should be used (if appropriate).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v1:
1. New patch
---
 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 2 +-
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index 60846e88ae4b..633b31b6e25c 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -63,7 +63,7 @@ &i2c0 {
 &qspi0 {
 	status = "okay";
 	flash@0 {
-		compatible = "issi,is25wp256", "jedec,spi-nor";
+		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <50000000>;
 		m25p,fast-read;
diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index 2e4ea84f27e7..9b0b9b85040e 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -211,7 +211,7 @@ vdd_ldo11: ldo11 {
 &qspi0 {
 	status = "okay";
 	flash@0 {
-		compatible = "issi,is25wp256", "jedec,spi-nor";
+		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <50000000>;
 		m25p,fast-read;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
