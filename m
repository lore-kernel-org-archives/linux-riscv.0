Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502A2CA0EEB
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Aug 2025 09:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u8D7vbpJLvfCorS3dKYbyM7LvtbmyLg9Nk9g7aj0waA=; b=DzccsQmo+Rr0rN
	dNPWMFT5DQpd0N3AMlAINHBgC4OPr3F9IGeeGf7+J+VVcjNNHYSlP5Wxf11ilSbh3oiqBzAuMDrjj
	bHABfwcVSKpx0kDqxQG/bVmcIOmiNpEnvNXPFd4yoyMHcX3FfBhM5Q/wwUCPnJzDZTYmqBDdEn8be
	kMI0JsEKumFF3YX55t7PhHWcnD4kkRaSYAs73QJc3AD6oslO4nzyZMcgsu6btuGhY+YJCEgXyLtRM
	pyFdN9/KshEr2AB0uL1fQ4kbjiDERojgSfPeyhDoqbW5KvyphAoCQMAlNtbHHxkpfUqp3GXXi8Eun
	tZTqBuL1LJaj69cxn4Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unDOu-00000004PYp-3g1w;
	Sat, 16 Aug 2025 09:40:36 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unDHJ-00000004OcW-2I5b
	for linux-riscv@lists.infradead.org;
	Sat, 16 Aug 2025 09:32:46 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755336761; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IFGvuJ8lvQ47tTBEVUAdX0EMfU/jJwqJWgb8t5ai1WOXnBahXZdDgaoHFvE4iO5Bjih2/RCmP9sryRNonbVtHi/o9Wnjs/GFUCnoCmnVLhmLfaGAAxag7zcPJGaK/8xtakV3j+OsgDUG+GgHKKnPJ24E1NdNV/icABhnlWNvDX4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755336761; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=676VaJ+6XPJQ19N0s+B4LHk5NDzXy0L1JDDJG1OA/hc=; 
	b=JYAOxKura0Xequ9nHFeVceG9RduOk7u37kRuqoZVGIQ9ICQMlr87YDJm5/2swFZH31UEJhAXjIZ/3rph0SaAP0akjdgsDumUfdJg3mZF6/+X9Ngb+QpVtWGjdCa93uuyGP0jxEbbhhVvWYZdckLyUDoMOwBQ5BYj0w/Qnjdl7QI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755336761;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=676VaJ+6XPJQ19N0s+B4LHk5NDzXy0L1JDDJG1OA/hc=;
	b=TJbQoUnUoRMVg3mCyf7lnga9ZABZn9QuvnZsd0MdJYuL9fscDUIDMcoTLozPeJAl
	wI+L2e/ztO2AGedGaTkFPOV/bFGFtDraPqldwNY5vNotz6A4bcZksrGBI4A5sHM0uYf
	EwibAL5fN/qBduk2IIbhzEcu3c+Oj+N3F0IpEmCep6GEf+M4arv+HWMAeAsKYk/Aao2
	rBD3Hk7qxeQps/8Fima92PhMOAxGMSp7RVzi/DKit9bbCGpOQzBuSPlQYvmDcDzGGWK
	xdGBNpvqTBZC9XcsWnF5hpxFeTcBEbtD39QHsphVbpWuaUaTDQVC+HD5rYj95btEVon
	9uKs/BaPyg==
Received: by mx.zohomail.com with SMTPS id 1755336759129283.67420191087547;
	Sat, 16 Aug 2025 02:32:39 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 1/3] riscv: dts: thead: th1520: add coefficients to the PVT node
Date: Sat, 16 Aug 2025 17:32:07 +0800
Message-ID: <20250816093209.2600355-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816093209.2600355-1-uwu@icenowy.me>
References: <20250816093209.2600355-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_023245_613875_18426BB3 
X-CRM114-Status: UNSURE (   9.06  )
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

The manual of TH1520 contains a set of coefficients a little different
to the driver default ones.

Add them to the device tree node of PVT.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 03f1d73190499..e9c81bdabed8a 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -676,6 +676,10 @@ pvt: pvt@fffff4e000 {
 			reg-names = "common", "ts", "pd", "vm";
 			clocks = <&aonsys_clk>;
 			#thermal-sensor-cells = <1>;
+			moortec,ts-coeff-g = <42740>;
+			moortec,ts-coeff-h = <220500>;
+			moortec,ts-coeff-j = <(-160)>;
+			moortec,ts-coeff-cal5 = <4094>;
 		};
 
 		gpio@fffff52000 {
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
