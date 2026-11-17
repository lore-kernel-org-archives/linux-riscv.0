Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A27E606A881
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 19:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t9TPQjYo;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CdFhx3Xl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/OM201h460flBLuY5WPs+3umRwN/IYeTSzpZXft4dxk=; b=t9TPQjYobHAHV77wawWBlsvYB9
	5+c/0cU6OOMyn5zV6PFVoyDhH+n4b/2phXs53Z9rCiit+Gt5BzHjrllv33hawgAidlaiPu01FMAaA
	PLLqChtztX5rK/zzhLL1YLD+NIQ5sug5edkdujo1CHYsR72EMSvjbSS+OVy79bLf4Nocyk1e6Uk82
	kewlXhKI7BHDAnm/Lo8K+uM22Ln1onE/b8e/xQQ5rrdfT+HioXTlf/BDLwe/SjIMQKEXOZUy/muxO
	/6MpX4fPxalTzRLE8R7v3jXPjOPraNgogvoC+jGo5fCbFUP5ggSjmpmS3XmVJdkpWLbMH54sNEEuG
	jM/kACaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPHP-00000006xfp-3XB1;
	Tue, 17 Nov 2026 19:55:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPHO-00000006xfR-0QgH
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 19:55:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D4CDA45C2A;
	Tue, 17 Nov 2026 19:55:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794945345;
	b=mINK896MFMx/Wc84p3CFqcinDUJwSRHdbJWFCTl0Upmkua8Qs++rWs/fz5CYDq00YWBF
	 ZMODnIogiy5GeovBjgVTNTzj43QXNDuFiT+cIfrvHLBlHGwBsMjBr7v98S7ymy7HQF0A4
	 pSAmqYIswDIifYg4IBGFBrBSP1/JNhekzReveXXR6GrWoeVrhaIuO5q3Gkkfr1+WVMmj4
	 KHpN8I09GEg7htveD94hXsloOGfMeulQqeZXIx4nsFRNyhKApvx+R2rHSWtpxng5YDupD
	 +/zs4HSzQKg2LXKJtS50QDOfp4ZKD75l/CPSMK5kjt+Pj/4jlomDdqdOJ959IuCooqw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794945345;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4LbBB/2g75fJnlM1nVGDOVNBXnNl2+P7T1zrJSjDCkg=;
	b=H2ujLAIAeQN8NaB8v79GcNNyRX3O5tWJJZgvDlwZq+CzynJnx3EBXu0NOpvA/bJHbM1E
	 1XBnlr68ljlIto8rYyn32ICKw4qrjz8kEM5jzyeMOnFme+Rq3GFKYlbAWTJbCslXsmSrk
	 gdWHH5kyThhif4CPhfyXKEOL/jFgZ32JnTQtd46Gl7Z/FDMIu6xSn+n0aMZuxDeZ0Z4Ww
	 G6qeDaOX8uElKk1DLALGFN6W5jOWEo7M7Y1Lo6aCXiGTMVr6S+OYgz5v+k2Ck2JrXl26J
	 fwTDg6VCZwDzGr5pKxhDiMp+OjnYG/dVUFMiHe/K2x4TOYPPzadmj7Ciq7t81XHzOXg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7ECFA1F000C6;
	Tue, 17 Nov 2026 19:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794945345;
	bh=4LbBB/2g75fJnlM1nVGDOVNBXnNl2+P7T1zrJSjDCkg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=CdFhx3XljhOECfsUvYXTLOmQn2K3NcBrbYjaNBEfD6mOrQF9teB9JK82dcxQUmmpW
	 aHrPam9Of8OiJuFkLqsbrC6sn/szLv4he+QlAPehNzTCg+Yud+9kdOUa6IlmFUk0s8
	 84uotyl4AwNRpMbKc1piyTOE8aOS1NiEs7GXIEcFUGkG5w9ZJtg5VbsV50QRX7b9TR
	 3uBDsDIFLgunUYg9SgjWk76jRO71RCPXjfNWvVuira8m3KhoRprDc4OmkhvSjNrkUz
	 kabC1+8JKgk+69uGj0RLoxpQqHVJ1RAZ6HDYvVB8qu6oQr7V8vaefApfHIMHhUvvQn
	 UBpn4+jLMrngw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 042F34AAA6;
	Tue, 17 Nov 2026 19:55:44 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Wed, 18 Nov 2026 03:55:31 +0800
Subject: [PATCH 1/2] dt-bindings: riscv: eswin: Add Milk-V Megrez
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261118-eic7700-megrez-v1-1-af8334b88336@iscas.ac.cn>
References: <20261118-eic7700-megrez-v1-0-af8334b88336@iscas.ac.cn>
In-Reply-To: <20261118-eic7700-megrez-v1-0-af8334b88336@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794945342; l=781;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=yEGqwvhItikCOim9M5s0hyGEeXn8c2umboDlEvC4XcE=;
 b=vJkJCHW1LYOknvi8cBGwJUp6g+DVOC4baz2OHV6esjchbFUr+XdmFwmXPZ5hydiIC++gZ6zdH
 ah+Dnw4H0SgA9R8ycE9DfuWS32P90YnPFhFfxzcpJi13THi2FcGZa1b
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
