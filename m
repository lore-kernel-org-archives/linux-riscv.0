Return-Path: <SRS0=ZJD+=OK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FEB7C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 15:09:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5836360F93
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 15:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5836360F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oz/I/IH9EIk3w2u4c3i4RFg6palMneUZgm7KKlpQLJ4=; b=V9E/4SzSKkAk13
	6JVmS7kWAjPcfWH1DrzYW56+QySj3jjtcmeSEWXI6NnN/IfxPFkhV2fsB6nRQqmLsgptHAdjnIMIK
	LxyNP2iWD4jhoJ8GYmdiVsi/NIcjI8yknSQxzSHj4cJ8kuMv8rr5IZ3stjBRcRyocBISFk/h6bgAW
	bTofRvogy3I3loFe2BUiHqy1BYw1xMSZzjd/GpQD2jNcK9SYAI/j7vi5/EKHB2X4PWgh9g1RIzdgJ
	IXaTYY32PUHLFOzTooi1oL30qOfgTq7HK08uW5T/dNxppKPuhU4EII0zSy2CquC16Q6OT2IR+KYTv
	k2KBc0nCceAbcPboPx0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSKvF-0029Vb-Gi; Mon, 20 Sep 2021 15:09:33 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSKv5-0029Sc-RA
 for linux-riscv@lists.infradead.org; Mon, 20 Sep 2021 15:09:26 +0000
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 91C4F40197
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 15:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632150562;
 bh=2AzFw7QWiJnpc3+D+qC2D6oogvLnCMo5bvL1ARpYSXo=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=GzisCl0VFyuetRRa2ZKFMqFNQd0wVpmc6HjhyxEGWjnRJcmN7kxEV6LZ5viCQqISD
 3/GUXGGIaUCzWKpZ2vgzXds/61Zm9C8e+ZKzYamsv8/mCPk6pC/sR2bND77mFmHRa5
 1SBnyRWIJi7kChZWuNM5fFj5081ws1aOfqedtZ7D7vpXMicZ8HEkgitRBkD62rj/PG
 W6vElJofhpo/ZJ5Liaq60wNYAQgAbPDW5G1Hpmwx3KpsJ/D+HClNs/URSJDWSw57Gf
 4yjaIPR9qLWDkpyXDnS824n0Og1aAlooO3/pLePvAKDUmd0CFQqs4ngN7BLzOalNIt
 3LKNX5tfLqicg==
Received: by mail-wr1-f69.google.com with SMTP id
 e1-20020adfa741000000b0015e424fdd01so5893507wrd.11
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 08:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2AzFw7QWiJnpc3+D+qC2D6oogvLnCMo5bvL1ARpYSXo=;
 b=MgYsP0BBMaHoOwicDx9oVaQfQ8yjqDSgjdboX0bVpQONFPcN+4shJa93VRkqSK05qk
 kZfsfFkJVBQJNDvF13tu/YlIbVsAGTssizAq+rksOURBx3Qs0WMOXDu5qCeOE/ugmWBQ
 P53SDI5QbvC48l/33I5VcIR9jRpQ3cqM6F6VceU6S5rTaBJ5oko1NaCrZ+ockQxmYW3I
 odjD7xr0rgMyTOH5sNWkxN7fK6GBsKIxSvdohVwBLiOUvmj7C354tscuJXvCe/v6+LJA
 OpFCC17UJ1LD5oFr9D4IZHlAYf0tQZRrHOMdQkIHC7EwNEnlKbcW9p6WF9Bd7JA3FVlA
 LnCA==
X-Gm-Message-State: AOAM533bjgMJsBkS0o+sKIv5+c5njWw0/1o07JYBQJc5c6s8wPy4Vgkk
 qgZw2CS1WkQ8ddLlrBWzH6eCWKXKuQu2Qss6T5nt6dtYjeDvQRgbr9A5CDIiTOmIgVRR4YzfU92
 rgyJku56JH2Ki+EeXGjUN5aJEWrDcXGflLo1XUUmnwG6vgw==
X-Received: by 2002:a05:600c:21c8:: with SMTP id
 x8mr24829323wmj.163.1632150562324; 
 Mon, 20 Sep 2021 08:09:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyh9HwY7qtDiYuXsvesg74JozhNdGgdehheDKBXdv1dZ+7W5s7qvmts4pXM0X21xET38Gx3ZQ==
X-Received: by 2002:a05:600c:21c8:: with SMTP id
 x8mr24829283wmj.163.1632150562129; 
 Mon, 20 Sep 2021 08:09:22 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id i2sm15803136wrq.78.2021.09.20.08.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 08:09:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Piotr Sroka <piotrs@cadence.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v3 3/6] riscv: dts: microchip: fix board compatible
Date: Mon, 20 Sep 2021 17:08:04 +0200
Message-Id: <20210920150807.164673-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920150807.164673-1-krzysztof.kozlowski@canonical.com>
References: <20210920150807.164673-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_080924_043458_FAD77250 
X-CRM114-Status: GOOD (  12.45  )
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

According to bindings, the compatible must include microchip,mpfs.  This
fixes dtbs_check warning:

  arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: /: compatible: ['microchip,mpfs-icicle-kit'] is too short

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v1:
1. Use microchip,mpfs for microchip-mpfs.dtsi, suggested by Geert.
---
 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts | 2 +-
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index 3b04ef17e8da..07f1f3cab686 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -10,7 +10,7 @@
 
 / {
 	model = "Microchip PolarFire-SoC Icicle Kit";
-	compatible = "microchip,mpfs-icicle-kit";
+	compatible = "microchip,mpfs-icicle-kit", "microchip,mpfs";
 
 	aliases {
 		ethernet0 = &emac1;
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 93730afe6c58..5084b93188f0 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -7,7 +7,7 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 	model = "Microchip MPFS Icicle Kit";
-	compatible = "microchip,mpfs-icicle-kit";
+	compatible = "microchip,mpfs";
 
 	chosen {
 	};
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
