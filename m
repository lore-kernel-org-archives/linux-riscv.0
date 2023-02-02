Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A575AC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 16:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NIiNnYScUaXJhV/ROM6yTYii1ZCvUcRrTkpSLGMYbNA=; b=zVyCd8OnKnB5sA
	hFF9pCVZiv84oPOAVI+YIJQ7pxbYNWatbh5xU1w0T1H6svWQhDZQPBgSdp49UmpurbppCPIh72hgY
	c7BPtiWpD+IodCwaUCIInowotGYioD/BbmFgG3J0n5PT159TJG9+7PMYdBwvCOn8S9dEzU8Xpqc2D
	dLm4hfSioSLM7bmJ6lrDeUcBYxhhZ2HhPjh43Nz00SMAUwVOH/O5XqXcFvFRej0zkovvrMepeHVLX
	jg+I4yjU1PJPt8bylKFzfsOS6HPcUVaU1wWFqaOBXX9ARv62cqD4BNI7yaUbQBejoqCstTe5GrpLn
	f5i5K2uHgEhCyspAdCAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNcBu-00Gazw-Hr; Thu, 02 Feb 2023 16:12:02 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNU1o-00EdiW-6Y
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 07:29:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1675322913; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IjwjhWm2SFmfK2FoZFYhneOrcuMggXNCLWm8xPB+sjnnECowaIsxTZEiViSHdkp/NW2hKHLFrvj4xgyxjEBCIzQac9VzSSYU/MUcI39iW1k6rHF9uZffmTfPzrXuaqtLNFPHfhiRG9+7fmMqRiWP0WmvQp60I1+eH0DcBTmTxVQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1675322913; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=4KG6Hn3da4esCwQNURi09KCRvo/Fx9f2/VOO8FRDYH0=; 
	b=QXtE2B+x0Dbu1cVGW+Bjb4Hd88xFroT9d2gY/QQFPxfLnZG+jk936s2AhmenGmVzoRHdq6NodNVryZQBvREnkzWpVo/zgQ210lQ3kWHsqMyxMC8Ku46nmWJ06SC4VoKkmUqDmwU1GKScnK5QNeXtFnxgeUs8D7FyAPziuhZn+Lw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1675322913;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=4KG6Hn3da4esCwQNURi09KCRvo/Fx9f2/VOO8FRDYH0=;
	b=EgJR+u9St68MQ/gPLyAUlx1Fu3uJUeF5lj0/v3ndv2ecdWFtHEUrByQvWP8T6sWm
	fWHh6gkgoH5kXLjbd82cm5nRJmBI90A3/8gAh3cRq0xvZZ9mJqTI3/oxgtLMtOzpgSU
	h01veMKZcPnCc9ujUmZhzC6eIk4O+c+zn2SgHb8I=
Received: from edelgard.fodlan.icenowy.me (120.85.96.142 [120.85.96.142]) by mx.zohomail.com
	with SMTPS id 1675322911628328.6247013002745; Wed, 1 Feb 2023 23:28:31 -0800 (PST)
From: Icenowy Zheng <uwu@icenowy.me>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <uwu@icenowy.me>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RESEND] dt-bindings: timer: sifive,clint: add comaptibles for T-Head's C9xx
Date: Thu,  2 Feb 2023 15:28:14 +0800
Message-Id: <20230202072814.319903-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_232904_345534_5DB58643 
X-CRM114-Status: GOOD (  10.49  )
X-Mailman-Approved-At: Thu, 02 Feb 2023 08:12:01 -0800
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

T-Head C906/C910 CLINT is not compliant to SiFive ones (and even not
compliant to the newcoming ACLINT spec) because of lack of mtime
register.

Add a compatible string formatted like the C9xx-specific PLIC
compatible, and do not allow a SiFive one as fallback because they're
not really compliant.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Samuel Holland <samuel@sholland.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Resend this patch as a single series, because the other 2 patches in
that series is still in discussion.

Changes when resending:
- Collected Krzysztof and Conor's ACK and Samuel's Review tags.

 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index bbad24165837..aada6957216c 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -20,6 +20,10 @@ description:
   property of "/cpus" DT node. The "timebase-frequency" DT property is
   described in Documentation/devicetree/bindings/riscv/cpus.yaml
 
+  T-Head C906/C910 CPU cores include an implementation of CLINT too, however
+  their implementation lacks a memory-mapped MTIME register, thus not
+  compatible with SiFive ones.
+
 properties:
   compatible:
     oneOf:
@@ -29,6 +33,10 @@ properties:
               - starfive,jh7100-clint
               - canaan,k210-clint
           - const: sifive,clint0
+      - items:
+          - enum:
+              - allwinner,sun20i-d1-clint
+          - const: thead,c900-clint
       - items:
           - const: sifive,clint0
           - const: riscv,clint0
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
