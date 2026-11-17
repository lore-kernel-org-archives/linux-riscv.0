Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D161606A332
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 20:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xw4fXeb1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ereGplTk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/OM201h460flBLuY5WPs+3umRwN/IYeTSzpZXft4dxk=; b=Xw4fXeb1LCD6g9peGetghiQujd
	RbMtxf6jx1GkGKs7hHUvqMovNiexS5FSP6igOF2sh3rhy7QAms2c3k9H7JsDwu1IqKAbYh5LSwg/d
	CnML1ZQH9MbwC3oA58+KI+CMk6kTAUQdP/VQn14hH39nff7z+KWnfXVo/2po3x8+OUfQfpy9v0MBf
	62P1Aaj7GOvKP+D+7sf7KecxLge6nX4BeZk+VmglrCFBMgUCoyzwXFOM9Ie7D2IakojNAXDqSogik
	KXBhhI6J8ivvEmQmOvncHtjb1sk05RE/ySRVBumqpScXJ39mOkOy/yaxeU/+XYVgeziwMyGfz149w
	57kEJupw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPLj-00000006ydQ-3GXB;
	Tue, 17 Nov 2026 20:00:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPLi-00000006ycZ-1K2g
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 20:00:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C01AC6185F;
	Tue, 17 Nov 2026 20:00:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794945613;
	b=ZO44xy3Ng+KHkddPA+tNCak5gKKT46bWJ5okNlOO7+QxLT3dotiKheLvGnpUeIOkrM+3
	 rBmWOPSfvIUertcZ8sIq/lfqqLl+7wgwVLrBhKzwXdijm27VUHStXFxbv9ujdPkTULHwk
	 lyyoxT9evokOezSakB9Fq2oPTtB/evadhQR7649DC8O/xAIjyu9JLwxqeeBzqL7g0C+HO
	 5OHJPAWZsD/x1hzZdVKgjmyjv7vmLpV7RHu4bkHGlnHVxLRXMZu+RfPmA3EKQ9Q3kkFp0
	 +dtMVSETiWZW+ywXLQHp8LNKMB5SHqY3VufisDVqSxoshBSTguNZroQStFn/foI7IDQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794945613;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4LbBB/2g75fJnlM1nVGDOVNBXnNl2+P7T1zrJSjDCkg=;
	b=mdlNLVEEE6+IgMrTJSBKS9Q5TvU9a+ZXk+ALRrA5zLuCu7giSScBxlvkuBV656yCiiTg
	 hTyNKyc5kAobIyfZiG/DpDnBjbAt0dSEi1RkDPSYq44GdVdo1e51ITbkTp2q3O4KwD5Cn
	 rcc6Kmu8nTfe0Hqz1x5j6vBjNYy4RW1+kQDePRGIbzjx/doCUJcJteBSPfUyOeoM0Ly+o
	 32K3JbZplHwUokARcY9KyFNybRD/0F/4ksHceuU6Kz52WmzXABfI6xCIgMCePPdwfvyQf
	 s4J5zXVdipbFUdD5Dfk+jBdsmrIDWR5ghRrFNqeo//AdUXhdUYbhRYh3ivgrCYb9ilw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD3FB1F000C5;
	Tue, 17 Nov 2026 20:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794945613;
	bh=4LbBB/2g75fJnlM1nVGDOVNBXnNl2+P7T1zrJSjDCkg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ereGplTkSW/Yh33IuesonvJdSrt33lyCl9Gre9IGs7GumrolLfhdWnEa4BZB7jx4F
	 OxA8n7olBku2ZxyqM7H5FSTBcj1Woyqt4o+RKnS67wGacVBM2MHAaclHrfWnjwhYyC
	 tdrYL3EEf6qR6SUAw3iV4XzkbS1buwSGiP/9zNzEmtaoCeM9wIX/hBfU3FlFfGhKlJ
	 S38a3D/nH3fDBTwZk8ZO2jzcA9cs73eH1ONjiBHGfBdAkCwP9tWqHLgvUV4LMl5ICq
	 RLe7dve7Tt4G+/G75NH14omFUc9Zqe8uG14uTuVPEkKZkO5gD2eHCntDCVxjKm+KTM
	 LYyhp5QJXdwzw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 443CA4AAB6;
	Tue, 17 Nov 2026 20:00:12 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Wed, 18 Nov 2026 04:00:05 +0800
Subject: [PATCH v2 1/2] dt-bindings: riscv: eswin: Add Milk-V Megrez
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261118-eic7700-megrez-v2-1-0113ebc5b670@iscas.ac.cn>
References: <20261118-eic7700-megrez-v2-0-0113ebc5b670@iscas.ac.cn>
In-Reply-To: <20261118-eic7700-megrez-v2-0-0113ebc5b670@iscas.ac.cn>
To: Min Lin <linmin@eswincomputing.com>, 
 Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, 
 Pritesh Patel <pritesh.patel@einfochips.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794945611; l=781;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=yEGqwvhItikCOim9M5s0hyGEeXn8c2umboDlEvC4XcE=;
 b=/0eh6mt7RCm5DEygEVRE4eamr6oWEncaZFrDhtKhfNokI0DADKhv7W1NbthjBnX2e66SW7wIb
 AQXaceinxMjDFk/DpZ/Eo1y/1Ez1V4FNTpwnqD5Lun/zUL+/aWkAuJu
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: gaohan@iscas.ac.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Han Gao <gaohan@iscas.ac.cn>

Add the compatible for the Milk-V Megrez, a Mini-ITX board based on the
ESWIN EIC7700X SoC.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 Documentation/devicetree/bindings/riscv/eswin.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/eswin.yaml b/Documentation/devicetree/bindings/riscv/eswin.yaml
index c603c45eef2252e760818e830e9dccdf0fdae6cf..f730f5ff91797d4c2f0610f9024a74611ffeae63 100644
--- a/Documentation/devicetree/bindings/riscv/eswin.yaml
+++ b/Documentation/devicetree/bindings/riscv/eswin.yaml
@@ -21,6 +21,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - milkv,megrez
               - sifive,hifive-premier-p550
           - const: eswin,eic7700
 

-- 
2.47.3



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
