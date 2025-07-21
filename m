Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA70C83F26
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jul 2025 16:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jhA2YKELilqJ/tEbTl+j7YMEM8aGetD72kwkb/OiiqM=; b=M/DBRgaE6cGdAz
	nvdFTtFq0Gw8MqNy1iG53flwQlS2X3aF30ziAtYTMb5UPvQpluv//NV8q+Lrp+0nwF/8E/1Gvzp1c
	ZrH6BqjlNAQBFwS2Hl8wQg9QO/pBuIIt7Aso3/i3l9uNywHprGrl4eF2vdLERilgrpe6XHLdz/3i7
	RWbOP4VKfxprHY7sSgObhDs4xnF0dchIqAFlidUV49mxRoJ7kCB8wscQOECovoQKI3UKZffI6s/bS
	MnU5XJ7rChI0ldQYF8SsOfF2jtj2mzr/mrKpFT5NiMIr8J3Fr3O8ZsDUR/nvNTblwiMhosyCqvnF0
	yyf7HmX2/7m1aVu1g8CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtne-00000000FI6-0dSx;
	Mon, 21 Jul 2025 16:55:38 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udsnN-000000007JJ-1CW4
	for linux-riscv@lists.infradead.org;
	Mon, 21 Jul 2025 15:51:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753113071; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nnGOpLzATSMlxgUAeCcP0Nu4xEFH/NSHsO/mJMW8XNdyUuVbWkJj/90qASpjspBGvlsJf4NGncGuB6jOf7zz/MWTCnOjc/faEpQgHw4cHUKGjkjdmUmqvXFLkd3vVJSL3VxM/HnzytissmS2WxGpKesgwQscqtgS/LpvKUtDQqk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753113071; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cTUMeXZ6zfhE4iVZbYAQjRm40x0zq7NDoaPUwJiy8dI=; 
	b=Hk3KUW+NKakKv0Den2zoqU+3KG8RmzQg3WEhLh6VcOiuSBrS3RnIc/56IGKWN3Tu+Bj+eTU+SopCuR8k034wfD7BuZh8wGIKtrRKeoaaEbDuelifkQrykfho4gQULC7NGGXIbvesyZ1VkvGYYhupv7HJ/McmaL0d/Oh5qoVGOOg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753113071;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=cTUMeXZ6zfhE4iVZbYAQjRm40x0zq7NDoaPUwJiy8dI=;
	b=eylocTIUjQCGS67Mfm7bYjf8LxJb659iORZj980tukGLfCU0ArmLZK1lV0xTtnvL
	BV3IVBtegODroEd2Xn9RntgtqnNVNp72x2UXQXObbfQADXob2wgkNjc+ei0aBKM6KQq
	XnLmVxSky5HXtJfTkbeh5UrBQpojvDaHIahY20uU=
Received: by mx.zohomail.com with SMTPS id 1753113069394763.0445044535313;
	Mon, 21 Jul 2025 08:51:09 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Mon, 21 Jul 2025 23:46:11 +0800
Subject: [PATCH RFC 05/10] dt-bindings: interrupt-controller: Add Anlogic
 DR1V90 PLIC
MIME-Version: 1.0
Message-Id: <20250721-dr1v90-basic-dt-v1-5-5740c5199c47@pigmoral.tech>
References: <20250721-dr1v90-basic-dt-v1-0-5740c5199c47@pigmoral.tech>
In-Reply-To: <20250721-dr1v90-basic-dt-v1-0-5740c5199c47@pigmoral.tech>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753112991; l=928;
 i=junhui.liu@pigmoral.tech; s=20250507; h=from:subject:message-id;
 bh=Q4JP768L5UngHiZEaNv9Wni5vgru+fkQYYIVeZVFiHc=;
 b=MTRUxMvt1Tx1svRro/NXkIetBpLr5SVpel35TjuqdqEYdwd8ubCCKZWE7AFSEJsoyaWHQW7gA
 rHyl9eLfo26BKOMbAdjwH5iORPVhZWrnS+qQxVN+pT1NuXgZStQkO+Z
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=d3i4H2mg9LUn4SQemoLAjLRQy0nTcyknIv6zgKMwiBA=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_085117_390418_6658B97C 
X-CRM114-Status: UNSURE (   7.50  )
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

Add PLIC support for Anlogic DR1V90.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index ffc4768bad065276378d23d53d6e81efad0a6b66..cc6de8bb89937859e4405aac5d931b8586ac2ddd 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -57,6 +57,7 @@ properties:
           - const: andestech,nceplic100
       - items:
           - enum:
+              - anlogic,dr1v90-plic
               - canaan,k210-plic
               - sifive,fu540-c000-plic
               - spacemit,k1-plic

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
