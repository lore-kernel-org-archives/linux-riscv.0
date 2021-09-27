Return-Path: <SRS0=npS7=OR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5CEC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 12:51:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2298560FF2
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 12:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2298560FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=52tX54o/AoTvvyh5KqXDdiJcfa2KlUvI/JR6UaAf50I=; b=4Vpo9HHiRe15ol
	cmdCDoUApU2u3gm3v5wBw3hU6nJI/pPAQsPF3Nr6RlXHrDQJeubCSnDCRkziXKtguST8FlHM0SAxD
	Hmbg/Mfja6Zmy8AlGduBHHr4cH0gVGwEYpWaqy6KssrBEjML8LYy9Hx87xEfvlDuUglDtwsjGKVm0
	wKqTxhl2dptN9uFt1FXOjc4j5cF/J3AmVg8LS1AWgAEs1PQyeMU4H7vdgEcJYXkHkvQGngaWyVTI+
	FO1umI6NhPj12cQnmHKZ8yX8KOImYh9iftX313aw/FWaIXiZL4wSh4QL+W4bHnpRKEtsg74DYtAMg
	bpNLIDIQu0jYbACuv/mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUq68-002gax-Tu; Mon, 27 Sep 2021 12:51:09 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUq5y-002gUi-Gf
 for linux-riscv@lists.infradead.org; Mon, 27 Sep 2021 12:51:01 +0000
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 12F8140863
 for <linux-riscv@lists.infradead.org>; Mon, 27 Sep 2021 12:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632747053;
 bh=kbXZWPaqkE+qi2UkSZceVKtKOIxxsWqidwnT9f4+61Y=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=THO9chQjlyXUOoyS0LHwXU56qRRp74l7Ff1/v7AoAfKQGehO8kSB0sHLjVrrzou2C
 vaku7+HTHqfzVbm6gtUUnX/bGMywVb1xhAFb3xrV+4Qp54cIgs0TDSr+VSeZO0ar/j
 N5XYyMYIiQ6OqMBXPlRssIXTzJyrowZejJAcK14QICkJ8IBQhY1R4OFP4QMJxrMNwN
 v0qxQymEIobi7d9k2QDPbALENepVo3566kIxhNx9ovXBQegXJCbKAFo3WH9TRKcR7H
 JBytKyhsXRNV+iJFwE+g/BlHXZgx4xpBoyyjm53l9eyiSd+zVIwOCYuLXDaq2wrq27
 aMWoMkeDqojIg==
Received: by mail-lf1-f70.google.com with SMTP id
 s8-20020ac25c48000000b003faf62e104eso15714973lfp.22
 for <linux-riscv@lists.infradead.org>; Mon, 27 Sep 2021 05:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kbXZWPaqkE+qi2UkSZceVKtKOIxxsWqidwnT9f4+61Y=;
 b=dK9smX/v2wFcletuwidB7vet+4ikJ05tQrC+koLg1ahmQMV36DdtQZIlI6O4R8dJxA
 BwAw82dgIRQZdZMrE3QFkteMFsiEV+078wK9YOwYz4ge6goGwNyqYUSsJbAXpldZGZur
 RQY2UQQH3xaLOu4+r6V9+7nxn+qvsA0QWlOHA1J9tb5wS1AZtFrIGlHEfAsPBZ+4F7fV
 c6aD4bHIdy+2CDE0S1AJb4lrdCH2enCPXGr6itQnouktr1KIVah15xj0D6KNjf0vh6xs
 IC9+UE8w2W4x6v1SOUmT5Eyb6mXOYd4BW/9ZQYnVB+J0ll3ae9U7N5OKojW96+iNM0yo
 oNsQ==
X-Gm-Message-State: AOAM531RxLDPHdy4PJPysDh3CmRrwVhz7jdN3m+gVZJlD5rMyfYwqFMa
 8vvjyuRVYsdd73v3HRL9aLBnkcluQ5NxQcOYZ9H+TgygRlk7XN4y75AdA5yTpa9AWV7UqB7E0a5
 ntC4RnbRpUR6pryvax+qcqXAtrkZazE5LuogzkdLYp31XoA==
X-Received: by 2002:ac2:47ed:: with SMTP id b13mr25204256lfp.647.1632747051399; 
 Mon, 27 Sep 2021 05:50:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMaM9Tc/3Sf/+ppdhry9L6l8UQ0qQ8h8nkUrM4xE3wk1hVkdcDG25FWuf57DjlukjnWtXjcQ==
X-Received: by 2002:ac2:47ed:: with SMTP id b13mr25204228lfp.647.1632747051152; 
 Mon, 27 Sep 2021 05:50:51 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id v28sm1592102lfi.22.2021.09.27.05.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 05:50:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Piotr Sroka <piotrs@cadence.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH v4 3/6] riscv: dts: microchip: fix board compatible
Date: Mon, 27 Sep 2021 14:50:41 +0200
Message-Id: <20210927125044.20046-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210927125044.20046-1-krzysztof.kozlowski@canonical.com>
References: <20210927125044.20046-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_055058_878500_3DB94FCB 
X-CRM114-Status: GOOD (  12.55  )
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

---

Changes since v3:
1. Rename DTSI model to Polarfire SoC.
2. Add tags.

Changes since v1:
1. Use microchip,mpfs for microchip-mpfs.dtsi, suggested by Geert.
---
 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts | 2 +-
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi           | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

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
index 93730afe6c58..1d04c661bccf 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -6,8 +6,8 @@
 / {
 	#address-cells = <2>;
 	#size-cells = <2>;
-	model = "Microchip MPFS Icicle Kit";
-	compatible = "microchip,mpfs-icicle-kit";
+	model = "Microchip PolarFire SoC";
+	compatible = "microchip,mpfs";
 
 	chosen {
 	};
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
