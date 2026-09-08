Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88129C79F82
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 16:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TKjXuMYjEOOZk3Wr+HpL9VAoqjWgnnWAU2tWdWMIrJA=; b=RimKeJqAZ89pTt
	nROqLwpdSyGL3QM7q7SD04CuCWFKHOqfpRUMPMzpwhFQfYJ9bfJ/BwnmuZoMcflPfBNzISajyB8gK
	sLRGGrC+C+Yd2ZOH/VE3F8DWjKVFilkxKgULSj370024dBEqWpDKyAr8G97AmULu14Q2HTRKBEYsr
	R6bvAaIEaaDiBGsTS42ndkkPFoiJt9bx2Q2/PYGHlPUDU+kuc3j73iH7+3uBEy/kuIdWtV46YTStq
	540Bimkv3RG54yDETzgdsJdRUFU/VWhPllR+a1sqAt3PayvoD4z6Cea8jNpE6jm8b1ZrVb726ygI+
	M6KPwQRSdmK6353Zlt4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yhm-00000009fqy-11z4;
	Tue, 08 Sep 2026 16:29:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yhk-00000009fqF-1a3w
	for linux-riscv@bombadil.infradead.org;
	Tue, 08 Sep 2026 16:29:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=DQoiqW8LFnr/Ma1L6Fqh+4FwBViHty6yiwi8fLlKFtA=; b=Du/t3D+Bq4L8RITGbzx5y1I1bA
	85mq4+1KaO6tvAPaFYx0AZrMPj3KwSyLSRpB8sj4dhDcXjZn2sspc0Gc1hDLeQBKMxmWlcxUGOf4O
	z19oURPAJ/3BqLSeHIzvNIPo1CmvNiUxyBB7UPYAe9/7OXe6NW1P9rwqcg+3VuxYTOMx3F3e0w6Dw
	rG0D3VTfNrztexQkkoBCnI1Ja1bNPXaOZMq/tgSfLmFZ2LmE9DpyvCVtsqilyH8M2OO3hpUtIpj5d
	+Y/5Yb/UtUrnXDgWIuDw0d/QXNymbimsXVJi3G6yXWcIVcDQpkS9tEyei20pvN//PXfDNbTpHf7nr
	9NQO10aw==;
Received: from sender6-op-o15.zoho.com ([165.173.180.15])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3yhg-000000005nW-1ufk
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 16:29:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788884967; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YAojYMrh1mpl0OZTQQhhqUnrlVmeCG4cyIryNGIh9qW5JsV5rPljoOPSbkKhhJry/dmOdOMtGUEBiTvOOGGlPT02ChA7PHH5OhqPx2yu3ay99yjEQHXYICUFxY5spJmC5VQ+pWrAam8gjN6dEJiwW1MeDGF+q5bxeLYfP5Wqy2Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788884967; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DQoiqW8LFnr/Ma1L6Fqh+4FwBViHty6yiwi8fLlKFtA=; 
	b=QhsOpGixvLTuY/6tpLK0BzF+qbLiRMRs9TunsHCK36l5V22zjDLCqPehSntR+TP+bNx+t9u3dTK0N/jChcP1hK/35lsx30aBWWXTshXtlRe/47dMnMT0WZ6j9qncdpNPI5gSpQrhZbDldQrXXTD7bj5IQLa6cG1xJAc24S0eLhs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788884967;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=DQoiqW8LFnr/Ma1L6Fqh+4FwBViHty6yiwi8fLlKFtA=;
	b=JCiT73TTj/Yf80fzBNIf10ZoDV29mLiYy9+zofsBc8UdMH3YpCbpiJSd15xUVyiS
	JKKfz/MOG70NiUQOHDa8ERLeo63Ht4OcoZKPi/3PTM2YvrUbaw/tv/NVb/TJ1kEOCCn
	GW6Ui2jcE7tgJIgoFCsGez4LdGGsmYx89u4RD6t0=
Received: by mx.zohomail.com with SMTPS id 1788884965681902.6763923374004;
	Tue, 8 Sep 2026 09:29:25 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 09 Sep 2026 00:28:44 +0800
Subject: [PATCH v2 1/6] dt-bindings: timer: thead,c900-aclint-mtimer: Add
 SpacemiT K3
MIME-Version: 1.0
Message-Id: <20260909-k3-aclint-v2-1-7931e5bc86ad@pigmoral.tech>
References: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
In-Reply-To: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 Guodong Xu <docular.xu@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=848;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=M8l1jtPedX+yuhMxau3fhuR9JMGYtb7SfMQHVR7q9mA=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLIWmB/s6nji5DQ7tTEuom3enfonLRstKlgDfoQG3Sq+Z
 feds0+3o5SFQYyLQVZMkYXLX/yftQ7PtyMCrfdh5rAygQxh4OIUgIkkCTIynGQwMHp/TPS4weqM
 uz0MAotPuy/qPBwqctBo3/0I8YkfOBj+mQZVLakrffbkQPnBG/87WDk0fLm8lyzXPhX/6iPjlc3
 qXAA=
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_172949_319642_E6AF13C8 
X-CRM114-Status: UNSURE (   7.29  )
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

Add support for the SpacemiT K3 ACLINT MTIMER, which provides per-hart
timer interrupts in Machine mode.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
index cf7c82e980f6..082378b04d72 100644
--- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
+++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
@@ -12,6 +12,7 @@ maintainers:
 properties:
   compatible:
     oneOf:
+      - const: spacemit,k3-aclint-mtimer
       - items:
           - enum:
               - sophgo,sg2042-aclint-mtimer

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
