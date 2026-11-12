Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A935606A324
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 02:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ynG4L50E;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G+xdcIxX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S80OpsIgPqh0Js6FeyVGyRFNhu+X0WXAsWgRqNhpafE=; b=ynG4L50EHEafSEv+buQnV3agQ+
	Ha+hDTYVj+/3kGIbkQUf99/eJgBRqakT9McMUuURxbEpzlpFAPGTDE/qz5M4MxhfedWQhYB3pJmwA
	Tao4D8RrgGTB4x/CBCA7lXEWPY1W1b2PeFgSbJDl5q1McgADGbc3PRAw70YtusQC7s2k4VU48n5iS
	F4sKuueUfkJP+zTQOUuHXoGQNl0SWHC3sVZjsYE3OL7I8o4KwTZrCYy0iHzUAdzO4mUiVvQCXF1gw
	CuD/LXOBM5YKLRW5LaBG3QGgjIyO0lChx2U4HNhk8lMIbuLrEhCZEEo3QMe3PNHXkeKgepKojRpNn
	1jnWXpiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRK7u-00000008T1N-1R2U;
	Thu, 12 Nov 2026 02:01:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRK7l-00000008SzE-2LrD
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 02:01:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9285C6349E;
	Thu, 12 Nov 2026 02:01:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794448872;
	b=gL8JasT9JUNwQLYbnWjuoQmb5RabbYW2jKrjEAa/ZNDgSk9tWvYnLrALfIz2SsuelgRz
	 HugB2N3o+WWjlhg5Broibvf5fo9lXCiFlusvcQ6Bt12fVyCbk1R9mDuTFOmU+xQWuDaL4
	 Cl2g/kJhBUXWbJp0V0vvnqhu9+oWNEsd49NfFSgk5AOJ4YfcXVD9qaH8efplclIPxsreb
	 NHLYP4gPr4vMMiQ3yNHH6hsOoqNLEzVjYm/dUaR9e5ZWk26DYtY1asrdXbRScEYaIUT+Y
	 buvgicQQ6ikLMV97YNUpvxFH4NJp9XH6zCLhI5qW16rOxSgZlTPKkNkwoxUqk8BOaVQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794448872;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=0UzY1m+EAyJWVSs3KsoWgdS/aUibFQ3ee2IxYj8gwaw=;
	b=L0o2SdoaluqN8zNOgL4v+ibl2I0XtPAIvF1hkLjcLRB3hTc34BOxOn0blzyXA9DmSJb/
	 uHdjuNwKSUx/uKb4ZM+CFlSjbY7hWB4Pmn8CFv0S2KrgSy8++XNLjTnKi0Ug2vLJxXYtH
	 eE6hMCn+MSWyIHafeJUe+2Y2QxJDwbUmtVjQdTqSrmySGQpktK9xQqQqB0DmpMmafV4Xd
	 /92gsZdR7lPy9aH94zMUISN4S4sNX/NmiWCn3S3IMwIdDnWJo9zPRotNg4Vou9nyPH7vT
	 +BjO3qkGh3XbEoILdgAkQdmCZ+KtAVMf3lmkUu5Syc2aOive0EIcUQcosJmJc+5Tf3Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3297D1F00A05;
	Thu, 12 Nov 2026 02:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794448872;
	bh=0UzY1m+EAyJWVSs3KsoWgdS/aUibFQ3ee2IxYj8gwaw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=G+xdcIxXkCUhSU/GoDcV4EVXitGUj7p4a9INZ4G51L2t5TJVAVlOiLuVuYXIKGfxJ
	 9yhhcY/Ah3hKF44WmCfyrvI/odBWtfxiwySAgsSlWCM8F/nm9QvzFlUyRycTH/whz+
	 BEPYHvocnOxMGGtRibRh6nKw8BO46w+STbUUgDsuFt4xeyD7wa0aPGBaQi+f5kNVkW
	 jMA36z4Sq9C0n8cxKMeWN97dtW0N1uIq4pzZ2SMpU4iZH/rlkH73o7wm2IbYarMk6Z
	 2yT47fgpI/JpckhB0ygOZIl/MRA3iTW2cEjzciwJbtjgwNQhF3A875PckcRC5sl1a2
	 QzhYt/wewGp7w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AFE70491F6;
	Thu, 12 Nov 2026 02:01:10 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Thu, 12 Nov 2026 10:01:01 +0800
Subject: [PATCH v8 2/8] dt-bindings: riscv: cpus: Add UltraRISC CP100
 compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261112-ultrarisc-dts-v8-2-14fa0834cac4@ultrarisc.com>
References: <20261112-ultrarisc-dts-v8-0-14fa0834cac4@ultrarisc.com>
In-Reply-To: <20261112-ultrarisc-dts-v8-0-14fa0834cac4@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Lunn <andrew@lunn.ch>, 
 Jia Wang <wangjia@ultrarisc.com>, Xincheng Ji <jixincheng@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794448869; l=804;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=4TAyfkBcv/s6Kdb5vlK3fVOCoBkGrwHfHTtS6V/To4w=;
 b=c0dNroODbCa+STlk7O4ZJ+FBbjEw5h2Z76V44KpxyNvjRgYe3dOx+MNK9x1EVwsc1uzkrZQ3h
 4teTpvPfqSwDGVJ5Y5ETi+tbqc8HHOj/0MYvGCeVhdVG3tQAhsNdycM
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-Endpoint-Received: by B4 Relay for jixincheng@ultrarisc.com/20260922 with
 auth_id=1046
X-Original-From: Xincheng Ji <jixincheng@ultrarisc.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: jixincheng@ultrarisc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jia Wang <wangjia@ultrarisc.com>

Document the UltraRISC CP100 CPU compatible.

The CP100 CPU is used in the UltraRISC DP1000 SoC.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 0da219ae6769..85adf72899c9 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -67,6 +67,7 @@ properties:
               - thead,c908
               - thead,c910
               - thead,c920
+              - ultrarisc,cp100
           - const: riscv
       - items:
           - enum:

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
