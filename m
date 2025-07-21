Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13345C83F1A
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jul 2025 16:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LjAk/zeAqw4ubR/Mh7uxfBrZ4qT8WSIPYmiAGx5oop4=; b=iRCE14amfnIzML
	3ETPnk00bPwD9r9s7OdugKEhbQydg3djA9NVMmc3fjxUesB4eDyR/dUHPgOMNQdHKSuYRfII7KJPJ
	NAC7ZDLjQIL7TYQwCLj8AttGJEidUjyhyrsMXWLGxy8n431MMYGr0UWrHLGH2N892zTYdJUxr92tE
	ka53vqJcwJcNrYrXAPoykkWgnnxNV/6cchFMhr4obY6hIIWZWL4jfGbzu2ncbxKk5OKZg7jIkgU6s
	BLAK6mKyibE123WpZC/FnfTha9m4MKkWGLZLgLZhz/WKZ/UiwxZwjQmxjRLPVO9zW65p6jFKRa4T7
	z1P0aT37JRTWLMbPSSDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtna-00000000FFO-1O9H;
	Mon, 21 Jul 2025 16:55:34 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udsmq-000000007GA-2w4j
	for linux-riscv@lists.infradead.org;
	Mon, 21 Jul 2025 15:50:46 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753113037; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JrgAnJPdtMlyCLy/ncZ2EGwJol7L02Y2NhPfSQqqtSbZdJIn35ZyVSwgxSMU8Y5w8AHVLlOLaDgGBDEnMSWkF0GPOhms7nEdvOFqykaxWYcplTGisTg1kYJC64mMGAPLKTw5ZV4ybNGFCookqlDtNlCSasoCBgwQvfnyg3qBhqg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753113037; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dr0pBN5+6Qa6Jv/l48HU1CzV1Gi4jM0bXP6wQ8s9ah0=; 
	b=RBJODeqZYx7zJDtvdYcl7O0JaEakRP/0bz3v4iDml9IDtXCFB73IuyT4uGU9ebfrWsdnIAOGCsAmxYtqjjBRfP5L/cz4tXrgiKQ8dRriHfN613LHz2UIAuWfQ1c2jVHA6yxaXJJgfpEU57fJuleqS66cfq8hyefLYygUe36BoLU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753113037;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=dr0pBN5+6Qa6Jv/l48HU1CzV1Gi4jM0bXP6wQ8s9ah0=;
	b=iGMAK2z/ddfvn4wqS9X+Wubw8bhjIKUlT6d7325jCx6VV1qSsLe5f2zs13g8tOQ2
	fxHXx+zdw20YKv3bR/LIZJItzawxIqk58zt/pg10dV6NHw2EbsyCOgL457cnzZ8l/1O
	m9iPPSvVHO+1c2kwr/3zKWigEaCrfWDfRBYD6Ais=
Received: by mx.zohomail.com with SMTPS id 1753113034418920.8574925901848;
	Mon, 21 Jul 2025 08:50:34 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Mon, 21 Jul 2025 23:46:08 +0800
Subject: [PATCH RFC 02/10] dt-bindings: riscv: Add Nuclei UX900 compatibles
MIME-Version: 1.0
Message-Id: <20250721-dr1v90-basic-dt-v1-2-5740c5199c47@pigmoral.tech>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753112991; l=946;
 i=junhui.liu@pigmoral.tech; s=20250507; h=from:subject:message-id;
 bh=cdC+gHkr28j2ptGfilNq1eA/ICUbwZpjzhH/BVYbOhg=;
 b=fAPwZIz/SLTjhDnmuDiXkGxPW6eDmJ/wZ25iYTmNlzRpbbjVsh8a0tgl+ExiijV4KRJtZS4zd
 MMHGM/CTd8sB4rxyUu3shUbCPjalI8VBGnNuZCKLd0e/apS6EOOInL2
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=d3i4H2mg9LUn4SQemoLAjLRQy0nTcyknIv6zgKMwiBA=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_085045_157627_7569AD10 
X-CRM114-Status: UNSURE (   8.17  )
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

The UX900 is a RISC-V core from Nuclei, used in the Anlogic DR1V90 SoC.
It features a 64-bit architecture and dual-issue, 9-stage pipeline, with
lots of optional extensions including V, K, Zc, and more.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 2c72f148a74b019e46ad5917a0b75d45777c385e..f198d8b1fa328f538b4a2983ca795340337fbd2b 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -47,6 +47,7 @@ properties:
               - amd,mbv32
               - andestech,ax45mp
               - canaan,k210
+              - nuclei,ux900
               - sifive,bullet0
               - sifive,e5
               - sifive,e7

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
