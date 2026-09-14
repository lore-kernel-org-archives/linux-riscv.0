Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46824C88E79
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 13:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ooBZjZdmzA/4/YkKYG5GLbiRkX6A7sEHhofw6yvaSew=; b=yZcRT6/7FsR0+v
	1Znec/DdWjweT7gJT7LmiGGP7GGDvlM70EdjjVFeNhzvUiw9Fj+ExxG9sjopGkHz+7uHh7WCS77HV
	SO2TVAxCJNAsOVMdyOdcgt07XRTJfwwGGDrjxTdsCGkZDoQjfqByPk27das5/KeRapNT9GTYaiee1
	R6h7Ejh74ho8ZpWgGh1/IWSMZcfjLuqCei7bOjTWw0V+giK+GXdQTrKjLK3dahGn7ZgatDmCy1MV+
	tbECBhhG3KtAr3wZEU8Hlco6h2AlG9h83h4j7EQItBGIzb0ek7ckr9BtLPEzFTyR17TvZyK8aANtT
	L0/Y8H+m83czXUxC15RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67AH-00000003sh3-2WvA;
	Mon, 14 Sep 2026 13:56:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67AF-00000003sfV-3Jbg
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 13:56:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B75BB43D59;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9615DC2BCFF;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789394166;
	bh=3k7OK2R+JVk95d7ZbSVMWT5kfSxhLAndrkjKot0fHlE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Tis4FnoPwmGzDWl7+x9cOfQX5taa5XYO1ESTvgIO6jAkQbVPx0sm+EIjflOEjtc7C
	 5zz6zAJQvlR9YHmGD0D5Kyom9Vg5/h7NpE8bEa/sm1EDmiul90ph6ONDUPrkUunpaW
	 5DmFredta5het18X0HCJVRo7UsH0f0hrSP0Uuj/I06w/kC12C8cOkQDx9yscP3OYMS
	 hEDPP0xtSCHnqxWtwnOwNBghhI8cU8CcsEmOiAuAlU5wbAg7eobjfHX88sZ9x6VJbk
	 bzGBv63HbseblgTzUWmG5YFSnoKMqllFP4CP8k9MdkNp2tt2KNSOfjM72Wjs0pjKgR
	 jJajRRTQ5pH8g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D370C88E76;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 14 Sep 2026 15:55:52 +0200
Subject: [PATCH 4/9] dt-bindings: interrupt-controller: Add MIPS P8700
 APLIC
MIME-Version: 1.0
Message-Id: <20260914-p8700-dts-v1-4-3267f14ebce1@htecgroup.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789394164; l=863;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=2lms0SOqaM4I4/vPB5czylxQz+VKnxBbKrzIdfMCocU=;
 b=pdualmBvpCJ7AaExrS9EobaKfsRz+XEv3vjHXig1bgjTvpnVoFtIKBfJL8id//uMC7qRLjIRq
 2RyLMdwdAIOCjBrYn4r+E+CRop9zsquBz80f9jQWbwQ7zrWKJRynjSc
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

Document the aplic compatible for the MIPS P8700.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
index 0718071444d29fbfa36283fc9666e8cecd6f77e7..9b986aa1a1c62316a1fd08fe535075111601b80e 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
@@ -27,6 +27,7 @@ properties:
   compatible:
     items:
       - enum:
+          - gf,mips-p8700-aplic
           - qemu,aplic
           - spacemit,k3-aplic
       - const: riscv,aplic

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
