Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A675BC001DC
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jun 2023 16:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/eFiL18B30kYKaeH6fRmnMA4EjwgPfZh1rPX73ivAKE=; b=3rfIMr35NW7+Hb
	PacPCI62/l25omwJMAoDHexc93Oxsqd2k2F67GpKYPU5NU12DtnmMix2e4ch/C3pzwwBObRixiY2l
	7KBztPZkkToFCAl/fXT4ZDCHWfMCJjdJPrJQhBwZerWQvYjEbAudfqZezCNynqEvMSUaK5/3UrGRk
	X7W+iyJ4UU/4JnbS81dRk24vSGbjTl3jb7CJUw2OFBnSQFAklwMOk75zs5JkIsiRcQJ09zX5Vb5bm
	LGHVW9sCz5kw7gXllIPjqKPOeKzZw6jjOtOm0g3FSW43HDVIfg5qvfWgDoCPn3lwKb002sgeqc6xO
	OjN571GD3+Bo+oJl2fDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAYlU-003tTz-0X;
	Sat, 17 Jun 2023 16:27:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAYlR-003tTU-1z
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jun 2023 16:27:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 26FE460F9B;
	Sat, 17 Jun 2023 16:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 285D1C433C8;
	Sat, 17 Jun 2023 16:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687019220;
	bh=nfDyGgMqm33myHuNfUx4jziWq1pWWDUYYnNP4dchYlI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K0tit8FlvBgNCxLsvZuqNmqrvwKesXFZMHSlgwmFsmGn0CIkrJhOtZ7kDEaM7ktS8
	 X+JXUbiHFeQsp8XDtM4JEg4RHYUzVx7JuEUHYamsOgkhB87wGrXZHszOv896jkef5y
	 1vxbmr/fXwWffEflkV4glb6HRsNFNq0FpKISjD10N2BvFH6jUi6o/FNOYAZuLLGSir
	 Rda56EcnXg+nX45s4OKpHtOf5tHhUMkcSdsv6oezjPfdyb/oMYrcv/zaqOilmwcox2
	 qFgqWjSlIRBydT5+BoVww9Sil5V+ZTOzpK4bEGTKnypTgIf7mDR7SyN6KboJeCEjG3
	 +TBXVAT8oDgow==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/8] dt-bindings: timer: Add T-HEAD TH1520 clint
Date: Sun, 18 Jun 2023 00:15:23 +0800
Message-Id: <20230617161529.2092-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230617161529.2092-1-jszhang@kernel.org>
References: <20230617161529.2092-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230617_092701_695614_9AF8C340 
X-CRM114-Status: UNSURE (   7.92  )
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

Add compatible string for the T-HEAD TH1520 clint.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 94bef9424df1..388d3385d7eb 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -37,6 +37,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-clint
+              - thead,th1520-clint
           - const: thead,c900-clint
       - items:
           - const: sifive,clint0
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
