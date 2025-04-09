Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2B3C369A1
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 09:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x6o4qCXYCq8mDWXyTqWqeoIBXe+PBj6iZT7eMnhpfoI=; b=KpE2Biz2xuakfI
	v0Oxy8f+Lg6k49KXdplFS05qKkHbQiUbNBKS3mKm+H/71NRTvAo876WOZ4U/S6qXywTsslZw9nJj5
	CVTX7LRCFdTXpM1bGbXBy3SWIufq6+uvRN51z2mwIWMcKWiWXuNMilT2nSNuY7uNX2sJI5jw9P1P3
	kSd2CLXLr9q3wBuowjb9uuXqk3LPBYVj+EsVupEicpOPJdgzVKbty4XOqC3Gtlxj1eA77dEC2n2gz
	OONKtQQP9Dm8zmj7f1ADxLHjWguUHt03i0dUqhBpIlypP9pz2NQwruxmoHyv63DY7BiqsihJFCHEm
	TTmvnxcaLc5+kJ6coD4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2RZp-00000006gPQ-1ADC;
	Wed, 09 Apr 2025 09:18:33 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2RZm-00000006gOr-2DcO
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 09:18:31 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1744190298; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=noaV+5Df7rQy8pCXBcixf29FwbUky43S4/ZSdvz6tjX0An1kW0dbpUW+Hm4dzlD1T+MvD/NahFZZBeWQjlRMDF9fHVpDLRggTfuG5+XVK3QGXxBNcHnKIC7vjaNNA+6rgOhSWDCIqZ484SrUM9DItiVjJtTw52C3bvZVwIDxjnU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744190298; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QBe9+uH6ODWa9iTcZwQDOb5iAmFt+z8pNalKVqBUYEk=; 
	b=YBqdjpsLfDAFVWjnL1A2GbS87D+d+HlmjHL0QGUIqDatEtQhonsJnwMe5AR5jLbeoI6HaJWC8mV1G+uuYWnMtgCqvBpoL7BIIp9nj3kuu4LGOWDL60O6TQ/MTJCQlgrKKej1NGfsGyAgku1ITW56WVg9dfuIDgMI4t/DYLZX9eQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744190298;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=QBe9+uH6ODWa9iTcZwQDOb5iAmFt+z8pNalKVqBUYEk=;
	b=Bhbga7i8hGzD+nSQq80LKELsH1eX8cZ5OproLFqKtbjHp4knUmOwnnmoncWms+2/
	FEB3/GQvzHSxr26Y3Ps/P7KA/LMp0nLfs1QEwskVSYDuCrpJUVf5vKmErJv5Tzsca4U
	poDVoe6nRxR8BS/8WRnMh2R8E1K4shxwS4fUJwmNpc2bwQzTmW2s5caCAUqkzzYHaVs
	UXN5T7AVejbu9GEtK1FhVG0kvZYVyr/wZLrEesdskjXq5x14Gn/HYr7gUV7uDVf1ikj
	eqPQs82Bfcq6dfD0XOBa2qohgmK8bDgaROe/4nooV9Z1y/8IrrInncej/RwTXUVWgAc
	BXyIDJvj5g==
Received: by mx.zohomail.com with SMTPS id 1744190296788595.8894788219615;
	Wed, 9 Apr 2025 02:18:16 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jisheng Zhang <jszhang@kernel.org>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 1/2] dt-bindings: riscv: starfive: add Orange Pi RV board compatible
Date: Wed,  9 Apr 2025 17:18:00 +0800
Message-ID: <20250409091801.855083-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_021830_615892_9A0C1354 
X-CRM114-Status: UNSURE (   6.82  )
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

Orange Pi RV is a newly released JH7110 board by Xunlong.

Add a compatible string to the starfive platform DT binding.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 Documentation/devicetree/bindings/riscv/starfive.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
index 7ef85174353de..dd5cd51e38797 100644
--- a/Documentation/devicetree/bindings/riscv/starfive.yaml
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -31,6 +31,7 @@ properties:
               - pine64,star64
               - starfive,visionfive-2-v1.2a
               - starfive,visionfive-2-v1.3b
+              - xunlong,orangepi-rv
           - const: starfive,jh7110
 
 additionalProperties: true
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
