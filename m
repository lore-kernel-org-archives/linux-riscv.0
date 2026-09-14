Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE358C88E78
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 13:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c1e+xoWgSkbVNoGGB5OYVsp43xcB5yy2yUSuZyRUW+Y=; b=4nJFeBUOSVdLtL
	gxaMdRD1d2XRyerNvqvbvPCiqQhajfp0OdggoRHmd7n0IDXrtjZUNgdvWmVGIy5YiJK9ed+2xg9JF
	aRNjcXwuc6dVLsdgDhO58rZE8BUFpB9wIzltj/To7qXANTQzIceDr5FGJaj7Q51Wk4yhURcXkS447
	eNtDhzOcwCPO7tloY+rPvDDTvv2O3W0/kaIed9NDFxUJQTFLRW4OpFQHA7HFlQNvhW5SClohqrAW6
	FZef3L82pWnwLGGt5eeh6NndeWoCv0j6TIXL7LbtZ/GHn3Bfaj3Ot4MXZuAkwDoGHaaM3oNopElMy
	hLsroJ9/Ub8mx9xDTh7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67AH-00000003sgc-0PGB;
	Mon, 14 Sep 2026 13:56:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67AF-00000003sf9-0iuA
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 13:56:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F5BE43D88;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 733C3C2BCB8;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789394166;
	bh=DM5y/tWXMbxpLh9TtMl1Y3EoywBhI86QLhi0kI9Cc50=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ggYTQR9EB8YrNLS/OGrhlbSYaKfo4G3LpQTf5kMarFwFOQAKAKQ4QTXEnEjTCkjv/
	 ujm09Jp9n8SnM13EffpCy1WpMlu+LyPNXGJGOQ2t9s3VhbGAk0dOCufyG3VeAHyDXu
	 6s1jHTZsXaUGPE7Z6+/YrOdbsB+9S8K8Ue08ANR3lBB8b1jflpprFOpMBHHmcxwsHh
	 d8Cq2+L+LpCjFgJ9f8QG2fODM0q35A1ffY46+YLHrNeIszAENFBsJFimISvUogR75y
	 ztSfUCOSCidjy3Yg+w9eR4klD+nilpda66rTFgPzAM6Yrz217JDvrcYCiWX7uNMaCu
	 JErphVWHHOTPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E517C88E73;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 14 Sep 2026 15:55:50 +0200
Subject: [PATCH 2/9] dt-bindings: riscv: cpus: add gf,mips-p8700
MIME-Version: 1.0
Message-Id: <20260914-p8700-dts-v1-2-3267f14ebce1@htecgroup.com>
References: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com>
In-Reply-To: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Inochi Amaoto <inochiama@outlook.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789394164; l=791;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=9r+1zOKPzU+i4ZT8EB9T5a+EqeMioNWwz2te9YRWjxc=;
 b=qgNSzK3mbpWHykXXt3BoXSbAo4L8C3Xt7fmDL1EpdA2TahWkXO/lt8DoAQpwkGw5h7HwV5t6Y
 SyjhbPnzIX5D6TYrQYhGZOi+KYYTpxvqh5nta7qS3qkqObPIskLfNTH
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
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
Reply-To: aleksa.paunovic@htecgroup.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Document the MIPS P8700 compatible.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 0da219ae6769767a9b7f41f179a3559ae7160d69..c7f1cf1db6eef5b25403d53bca7cffd9bc1f2240 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -48,6 +48,7 @@ properties:
               - amd,mbv64
               - andestech,ax45mp
               - canaan,k210
+              - gf,mips-p8700
               - nuclei,ux900
               - sifive,bullet0
               - sifive,e5

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
