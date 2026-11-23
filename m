Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4156606A6B3
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 14:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QA7poXsX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XWTna261
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eHXDhd0zuI+DzjHEOcVZV2rbQWwHabv6T2pmyiqHCCY=; b=QA7poXsXTWDG3YzmkBvxdbwMg2
	xHepiFfpGTbsvx5b59FWwB69ZSpOrzOeAQQ/hOEUHB8r6qIJqoppCkzVfG9lb6ozXxn+B/9KY5BQR
	NaHQWQ+UV6EUqHzjHujM+rdaZcMa1FrUAU3P0bMAe5SS6vApY+3ZWsTjVCFnPFMsDRk/vu0oKlCs6
	KZJEp9Dh8VsX156AfwhlTpXiQG0CsVGMlO6Jr+rbm0zZ2LkWiyjSwY/Y3oHc7WIw2cOscOwCazLGK
	+7zemWwAWEFt4OmTXLXVz3RrECc+ZQo8LcXBbMKt3dmRVvqIwsxs/v7tafsp4ARoY0LX7iXVLTD/l
	ozDhB/8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVKd-00000003ml2-32cG;
	Mon, 23 Nov 2026 14:47:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVKb-00000003mkD-4A0N
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 14:47:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F36845970;
	Mon, 23 Nov 2026 14:47:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795445265;
	b=xIMX9GUqAhoeu1NdxIjfJJHDxyUm7izbfPXTaCKG7reLHfyTxR5fMA4eAqVn6dZ9EkBh
	 Td3LkXALsX1GlPphr2zFwwhS+fqZrwou4aDlHHyyUDWjIJNdtJwdkEOGbXFbxGyNHIS8Y
	 nVGOwffCtfCDU17NBeBmZsr12BXSYFL9fKvAY63oblGBbsAofbLs0PEDYr1Bo7ITajrdC
	 iFXbfc7jTvgDF1JH1Z6uexMVYFxMOj6RJfpjGgermAXPr2+MakxT2kl43xH2+96+uGaRv
	 hBaS23frvr/kHX1xcr3fpiim+lfkHN5UQt2fYXeHrFd8iiPI/O5QLxbUqzEQSwbzewA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795445265;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=O8IElzxjqMQJ9EmBIa0/9YgZRkTTB3zoVA/QCHT2JbE=;
	b=fVmcCKhHBBpKhcHwwPWoF9jRWc2xuRcY39p0j4wKjbqdhOyxc/q3NnGv5LCRpEjV4Y7o
	 B2aeSgWP4w29GEZZPn+/XbIlZK11rYquTA+xbrlGddwCPuanWOH+Ec5PpgC+EqFy0ERMi
	 Ov24JcD8eg8LmNNcGId31C5ahirueqSGHTIk9ktE8XpqIvVTA9Yt41+IM2Z3ZEAxFdwdy
	 s/0EDEFNKxtdGmx25LqE9bt1BnR0FcIpc2oppmdh4zxQ81I1DKTeo0kAqtcS7nF2ZhnsO
	 8C8uDDB70I/sZAP7id1dsRcv1AkA4ZR2QBxkJMfdGsXFJGu8/FbDshwhHvlVpIGbGYw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DEF231F00AD4;
	Mon, 23 Nov 2026 14:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445265;
	bh=O8IElzxjqMQJ9EmBIa0/9YgZRkTTB3zoVA/QCHT2JbE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=XWTna261ovKUmPo4uJtMphVWiZl2DV+SsoukXA52SyldP3T2pwbVo8K9bw8YVSBC+
	 sSnjPYQ+JDVWjHj/K+2YXamP2A2iKNO3sI1NE+mtP8qX72R9cwW3M8TzBUFIICIa0z
	 pEBNiL2NvjFDBK5i/tNhZT+TSqW+RNf2sQ6zU8qZbYBcGi6pFsZlKUMCeTpkkk3acS
	 8TqHppdECVm3pMLpDnzWzsMxiSj9a7nWDxaJcNiYOancz8n9UZSxYs4AX5VYzrraJp
	 4JRrEpQf4151FEPkUGIGVCNzxe6B7O5x0VK63qEmDrmvO0brQ741kPGpaUt69Y6Huz
	 /hE6oS/98S2QQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6F5134C507;
	Mon, 23 Nov 2026 14:47:24 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 23 Nov 2026 15:46:59 +0100
Subject: [PATCH v4 4/8] dt-bindings: interrupt-controller: Add MIPS P8700
 ACLINT MSWI
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-p8700-dts-v4-4-60bb7bf8a7a1@htecgroup.com>
References: <20261123-p8700-dts-v4-0-60bb7bf8a7a1@htecgroup.com>
In-Reply-To: <20261123-p8700-dts-v4-0-60bb7bf8a7a1@htecgroup.com>
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
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Joel Stanley <joel@jms.id.au>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795445243; l=1430;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=zFOUG0JTBN6Duoy/8XI+grpvovTujt3/U4G1NG7BFIQ=;
 b=yapQy4pfohEmMI1MIcyUSEv5C1YOH/dKfWstHIDHzFj406vZJxU3NW3gEZzLE3eAFPYx5bTb2
 JKs0+MhbKKyAoe1KQl55eI42wNgoi/Hbk0pXqhNEGHeIjXND2sguzO2
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: aleksa.paunovic@htecgroup.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Document the aclint mswi compatible for the MIPS P8700.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 .../bindings/interrupt-controller/thead,c900-aclint-mswi.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
index 62fd220e126e650e3800d8eee2a749fdbbde6108..3255ea666e1560ccca239264786fa49d444e8101 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
@@ -21,6 +21,7 @@ properties:
           - enum:
               - anlogic,dr1v90-aclint-mswi
           - const: nuclei,ux900-aclint-mswi
+      - const: mips,p8700-aclint-mswi
 
   reg:
     maxItems: 1
@@ -46,4 +47,14 @@ examples:
                             <&cpu4intc 3>;
       reg = <0x94000000 0x00010000>;
     };
+
+  - |
+    mswi@16150000 {
+        compatible = "mips,p8700-aclint-mswi";
+        reg = <0x16150000 0x4000>;
+        interrupts-extended = <&cpu1intc 3>,
+                              <&cpu2intc 3>,
+                              <&cpu3intc 3>,
+                              <&cpu4intc 3>;
+    };
 ...

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
