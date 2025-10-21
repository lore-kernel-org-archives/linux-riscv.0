Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FC0CCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 09:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=skpTrAaVxyL1vYr13CxdcurP0ouSwTB/iXo56fV8eRw=; b=I2GuqkW6kf0k3d
	DTfcQ8ueNBAAs7Vq6THa5NQts5GXKUAniZ0BV1CCuPvWzAVMtAswpwGzlV5ZJEweuojuCthFjp0HZ
	i2xCme4z6AOM3BvD7aM1rfgue97jUhGSQTywrVKfOfve4A9Zo6JeG6Yz/w43d63TNhRYDSlU4h9Lu
	Y8uAOvfRs2rOXxPUtQagc6j3cGs0V1oK80qd32QeF66Aq/XniZkmdepPIgoEbwqYzHtzG9XaghRd8
	24wob9wINM6qTQ83myx4lYFR9wagrCDWai9TDI5KL+ezBk4Kl779k0pzkS60WmgSnOWcqC2uo+eaV
	2vw76zQowx3O68ePj0xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8vG-0000000GV3b-0F7n;
	Tue, 21 Oct 2025 09:44:54 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8vD-0000000GV2g-0qzC
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 09:44:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761039878; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CzhPh0E1MzU/He1kp2d8LJG8YcAuqE0BD9sKX0R79U5LKrpF1cNy2IWRfjNWMoVGZ/tl91XnCGzPkkz3ZzNoyXV1kN3/wL0QPgJYUKatlEOYDW+FChKZ+R7SivVA35kMm8pKH5Ns0H9/O3Eja4oqM790s3GzDQeoWklmBUhkxDw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761039878; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RilxgnaE6+nQcWx0vQ+3dyIGCcddcgCTt1jy8Noi5+4=; 
	b=KLKyIWwHs5FWpyq2AGRcOqSb9aTRqek8h46xIN4VsvaMifL/mnAxCn5T49Um4ecTgmzcy8xUdDHYBVa1tqBYgfphvR1k9UghnqTk5OQ/HTMA51SoWT12K0LIfSVXY1awMCfEppi7TsjA0ybXHyT5ZONvWwZoxj6pPjb6+wgf6aE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761039878;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=RilxgnaE6+nQcWx0vQ+3dyIGCcddcgCTt1jy8Noi5+4=;
	b=CVEgXSJeAfY820DC0XFAUZ+4RwBYYPZUbnrK+fTB8Zm9mk15kGZ23qqHtRjlvkaC
	auWVhNfeDHywwHXSex23iaieNsh5IHj66GJxJnp4KR7NGdAjj6AU39Yy/o+8/qGMZWn
	w4hHdECvgPkr+sOnAviANFb8xUf+moqy2mlann7o=
Received: by mx.zohomail.com with SMTPS id 1761039877372806.2676973256036;
	Tue, 21 Oct 2025 02:44:37 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Tue, 21 Oct 2025 17:41:37 +0800
Subject: [PATCH v3 02/13] dt-bindings: riscv: Add Nuclei UX900 compatibles
MIME-Version: 1.0
Message-Id: <20251021-dr1v90-basic-dt-v3-2-5478db4f664a@pigmoral.tech>
References: <20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech>
In-Reply-To: <20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Junhui Liu <junhui.liu@pigmoral.tech>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Inochi Amaoto <inochiama@outlook.com>, 
 sophgo@lists.linux.dev, linux-serial@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761039846; l=999;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=5OYq33h90o1+r7OH7UN8UF/BUb5PEB3MS3L1zmHF3vw=;
 b=H/b+n5Z2ErCQTJ9UpdLacCYN9dWlOcEXkm7NsiwvteVCpJkHVGwXRaCyO1AUN7qZntq4NrGxt
 0X3AOAqG7u+A1GD5IEr4pNVPHr2eSMGcmNej/poUpbvaX31l1vju6K2
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_024451_299959_B73F5B37 
X-CRM114-Status: UNSURE (   8.44  )
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 153d0dac57fb39d39219e138792f4cb831cb88dc..20b7c834559cb11d17dd4e4119787b88b85e19b0 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -48,6 +48,7 @@ properties:
               - amd,mbv64
               - andestech,ax45mp
               - canaan,k210
+              - nuclei,ux900
               - sifive,bullet0
               - sifive,e5
               - sifive,e7

-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
