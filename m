Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AC8C43217
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 04:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qMPf4nxzSzRic4KEE9HfZHIRLjZtIOS5NOztCjUg8I4=; b=jVrPlW5wxHILRJ
	N+Gm0HEYfA/wBSlwZEESuzEGb+kDz5mUYQvAryejuq5a5kf9v+8e6aHNzzm5xkQNz+EOZCp1irPtX
	ZHHIYioRH6PGqy5N8gleA2vIb1YJBTVTUknmdZ0E6K0AtTjbv0X9FZMloqVBewZ4xtfoFNVVl0X8L
	cvVzKq5zvawz9I04EbQdIg7NtcMTFzUQP/PpyC6qO8jkKmV9exmGumDxe3vFXGQbJRFg+1h5I4mOM
	/k+rKEJmWm7EMJwlskoUZ5otLQLowUzATvDn9ryOZoGdoBHNgCG3XrwKq35rtIR+c5ZeQlAv9Qt+v
	nZjp6NcJ/kpuhF0qPF6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owyGY-009IJ7-1t; Mon, 21 Nov 2022 04:18:42 +0000
Received: from sender4-op-o18.zoho.com ([136.143.188.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owyGV-009II6-PB
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 04:18:41 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1669004316; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aixIFHpi3bHX4fgmZ3jw6KdRI02uqQHXp/1mFoKt6XzDRrFU3cndHsJbUCsF6ZgSstQWSWKq17+bux6kgZIlqZZdyVreWGrQqBuijAr3uiwAO5/kd2jBfDCy9NKFS+Vj/82TH4M/vAA1SBAuhQzoipTxzOFiQjit/q5i0wB6fUU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669004316; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=1jvBArX5LMEqGndC/rqeiRHpRcDw256YhccTebGyEL8=; 
	b=DRkD33XgFDBpBkUfgL772kN8xlu2Q1JO4TuKnGVCn9Ct937mzlLI/gXomTplEfTizo7bJr1K/GtqSW54Q+ML9tLDzhXKL/pgFD2FA4SyBFKZOqfvmhZquB52J/YQ2GdI16dqYwVAPTQaa4QpNeGAyGt6e1E22ci34cchhJ31HJg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669004316;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=1jvBArX5LMEqGndC/rqeiRHpRcDw256YhccTebGyEL8=;
	b=WBLe4bVOKOeFkUgh+EGrCsx73wKCpTEBVPhaGux/W8pcJM+arJuhX32P4TKVapzM
	5bjyb3/M3WCPy+l7/Ii4/IYjfliXcHAU6bIrv9R4u40Cqp7fVomldgPNv/SZdElvgBp
	J1fPNdB+DNxtLGOWmNZInsRkwl+4V3Gg83dWjW8E=
Received: from edelgard.fodlan.icenowy.me (112.94.100.29 [112.94.100.29]) by mx.zohomail.com
	with SMTPS id 166900431506566.96637222919264; Sun, 20 Nov 2022 20:18:35 -0800 (PST)
From: Icenowy Zheng <uwu@icenowy.me>
To: Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 2/3] dt-bindings: timer: sifive,clint: add compatible for OpenC906
Date: Mon, 21 Nov 2022 12:17:56 +0800
Message-Id: <20221121041757.418645-3-uwu@icenowy.me>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221121041757.418645-1-uwu@icenowy.me>
References: <20221121041757.418645-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_201839_904296_971EADDC 
X-CRM114-Status: UNSURE (   8.07  )
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

T-Head OpenC906 is a open-source-licensed fixed-configuration of C906,
which is now public and able to be integrated.

Add a compatible for the CLINT shipped as part of OpenC906, which should
just be ordinary C9xx CLINT.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index aada6957216c..86703e995e31 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -35,6 +35,7 @@ properties:
           - const: sifive,clint0
       - items:
           - enum:
+              - thead,openc906-clint
               - allwinner,sun20i-d1-clint
           - const: thead,c900-clint
       - items:
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
