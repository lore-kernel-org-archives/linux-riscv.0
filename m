Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A730CAC5AC
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 12:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6s833gZ01h4gdVZTQD0g4eZNVQRapAy1YRga/FiFNP4=; b=kxwXy8ZsjNOT8X
	nhQVXynTPECXcVwQ6ktMhHfLRe9MWc4LuTmWnuK6QVqSwYb+Ke8wO5EuoAgbRwkWnNFEXabqk46I0
	rQLDLuPWMrtCgItFyzIq6pcUAwS9M8iH8kP/RpSaJCRJmST58xeBW0GXG5ZLsz0qXacbcLM8ddz3k
	7nhtNUDlaLYwF/4DME3O6r2x+HpojrrNlRf7FGKF25nT2kKpThwzLeHubBIHBGERNdCsGBeR2KZuO
	HPFP9EgN5178wvZ8yRBhEGcq/4l4WdD11nDQ09W7MLOEMVO2CC1dZUcw0+20GunpHa2DfstHB3F0R
	k8dkGG/2z1ThXpx56kXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0fxl-0000000AMDO-3kX1;
	Mon, 22 Sep 2025 12:48:13 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0fxj-0000000AMCe-1Qku
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 12:48:12 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758545286; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BuzqTNaQxYZ6TlOOzOcEkC//mFG79IJv4l00qLdq0A+J1JEok8tE7uTkzr0csIhu2HcGbOYJkjM8PwiLE6LwKXOlutCkulUwF9D0swyl5JPcDb43AIIiG3+q2OyLMVxtTYEoXllinocrR1PCQixa1SAA3+rP5YzoQY6aGSVHPcM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758545286; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RkLE6Xbyex/7wxIG3u0EMzqVpyF4BUfnfcnLXkhddrE=; 
	b=Bq/U2sv/CiJfhioeF2Ih7IQKqExSTZ2qKHBwszTxqqyi+t9ixRHHqSQci+IYmrekhDZyOC/rf2pfDb3o0wKyE3BEMO/14ZIoIcZwo+dlmp2NmkeYVkmtVZuHRKC8EcvypZHJA8wK5VFsVzvYQaPQC+DtBljbd+urzfTobDakzpw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758545286;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=RkLE6Xbyex/7wxIG3u0EMzqVpyF4BUfnfcnLXkhddrE=;
	b=IIGbbrvVUmcelxiFVOXgcZm5h7QemEOkZNgnyHp34seDNtIOyct7/e8OoQf1U9ZF
	BO9MQ/6lnHNeKaw/UTMymKDqVFa3vT2x6+dHJDqQw11z8HUlFT8yw1KVUJY2tstCfuk
	b95PM8sz7dtmC18qwWBnv3cPY2UwAlsGyFe8eCI8=
Received: by mx.zohomail.com with SMTPS id 1758545284971751.4198459987019;
	Mon, 22 Sep 2025 05:48:04 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Mon, 22 Sep 2025 20:46:32 +0800
Subject: [PATCH v2 02/11] dt-bindings: riscv: Add Nuclei UX900 compatibles
MIME-Version: 1.0
Message-Id: <20250922-dr1v90-basic-dt-v2-2-64d28500cb37@pigmoral.tech>
References: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech>
In-Reply-To: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Junhui Liu <junhui.liu@pigmoral.tech>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758545232; l=946;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=tuo3nrLTJo1bILOOpnJ9HgGZGKW1FMMYee3cJTCpPG4=;
 b=sE9FcF4gPZyZr2epKp7IRMNEnQqmxCRpsCf826Q0bGwlGwOTjN9mWNabl2adU0HdQSJsIkHo1
 Ansfz6o+fYLDVEugRK3oxipsgPunQmA7N78bpTf8n7t6u6fQxWYWvqr
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_054811_452303_76BEB802 
X-CRM114-Status: UNSURE (   8.80  )
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
index 1a0cf0702a45d2df38c48f50d66b3d2ac3715da5..cd3299490380696fff54a41355c6ecbc75316047 100644
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
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
