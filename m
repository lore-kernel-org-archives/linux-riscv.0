Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDFF606A33B
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 14:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T9CBs/xT;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=ZZD9V3Pa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XQupWB1tlhnXtdpFzxsdGalSgqPX5TWOLPtM7kP/Nd8=; b=T9CBs/xTF8KgGH9VGAPc7mls2L
	M73heHu/Vu56xLWwYh0cO72QYY2xWu22y6M02AJd8ZyVMvX/MSlHFOZrt/OSsOvc/VtIb4smZNCFS
	bdDqYHClshL3zsUs3xInzNrXb4o5C2IfFfUZIHwiov9lflqY1kN+dKZRYaEZ8o1sW23DsWhnnf07z
	7yfrECWmTkmRegQ3pBl2XtBoA4JRSUYt5xf1AHg7fT3Pt49Uk+EX3zqjOq0FaiNIOBrrIF9Wv1iKf
	SQKQvjuKaPqUwWdOKIIIKhq6wKhRnoaY0TNQs1H3SPLyBC6RZrk2qRYPnXcSCP/CPfM7ZaPREuoGO
	cNagphAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsHU-0000000D9nI-2cfJ;
	Fri, 13 Nov 2026 14:29:32 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsHO-0000000D9iP-33Y8
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 14:29:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794580111;
	bh=qct/wdkGI2EGQDC4jhkJBEYt1YB2yrUY6a3bWaxmDWE=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=ZZD9V3PaA/eGUz4XGcHNBCMhB/d5iI7IIE5RrkWvDBgnVBXl9lOldnv40Z4KxuqvW
	 JWe9GX3htgIc0ZWbJlFedLOQBkKNsviwlGqIEIFYDLT4yBH7rbzwFAC44c1Rf2lmzs
	 Wg+p08I+ThhRWwIapEsZVMYX9VEWw5wyK3tlSAb8=
X-QQ-mid: zesmtpsz5t1794580106t4a093ae6
X-QQ-Originating-IP: TxCi3eG70hw8P3SEBboUQyGd/3JeGSmwT4g30QHAp7o=
Received: from = ( [183.48.247.191])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 13 Nov 2026 22:28:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3050209387300183519
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 13 Nov 2026 14:28:17 +0000
Subject: [PATCH v2 1/2] dt-bindings: riscv: spacemit: Add K3 BS01DCMA
 RV2768
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-k3-bs01dcma-v2-1-3f0de4a3e1ca@linux.spacemit.com>
References: <20261113-k3-bs01dcma-v2-0-3f0de4a3e1ca@linux.spacemit.com>
In-Reply-To: <20261113-k3-bs01dcma-v2-0-3f0de4a3e1ca@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1098;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=WDvWk3ayY+Zv6AD3GWmitve2lOknIpbYffIm3r4kiVQ=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnf5ZrsO3ijThpMKJurk6x/NWH5xi3MyUXvdZLz7uTpC
 Gy8/ce3o5SFQYyLQVZMkaX7Ac+2Ap8o2wKBQl+YOaxMIEMYuDgFYCJODxn+R0w+dqhg35+O1pCU
 boMXB4UDC3ds/p12YsksK94TqvaPnRj+2e6STlP33jJrlsYO3RDOQjEppum9mq/nfdYNU5rApiT
 ABgA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OYysZPnc9uKE8nTYSZMZMjlyEzrAb32vw+WUzv1F5H+Mdnqz60JHvq1S
	Bj6tvX/c39gYYcW4xdYZLCXTUJjrRXoyW2QXzWAPRNSBrqVPReQHehAHhJlo7G8N4Dflv4f
	sX/rcLK5MD6DRSiGpYT6MkspTMZPOwAlxArXWZvbAYRL4LPRvmDZaRYLTM7cGlQr1aLDh+M
	UvOleHYbOA/qJt0jUbjl441HNVfLTTlaOheAcmdteBSGmamLLa1z7d+ZWCTysLa2105NBNu
	wkHd9eXkgtc1sdFCQD7MF2FFxKpZ9ZAl40FFNBjvWChNmqDHHXbdaB8qvZIw8beQvXuqymC
	Zy/C9F6YaQDRexA+o1Bqks8Kfcx39sISLrzzHfwSN2dvO3H7RvUXBIbUBrNcKTb4Kn8hIlX
	0slN9GiZiFuN0t5+G7jRioB+Ty+siPirR7xnfIWpoPUjVlJNoMzxgf61qGIVVpLbI3U01+J
	TfR1KEHtfFdqwik2paUP/Sb6P+mGHc/0UHpsqYpegASFiXqQFMOWtNZNoSBLFqp8QRkK8bs
	3KxGj9fnN2elS94BtD/gkJ/zJR0OwWBDFd54QgNNqhnnJ4UpsySzv7FAg8/n/zjyDBsuWNs
	jaZDVDvmUM/KA1roLl9VDTka5RZoltHDP3X04JLHPQjvYf4d5UpyFag3okIwSUaUbCjnHbR
	mmnCOaw33gq9TO2wZwF7E/pi2hDCPVqxzXJSsL568V+PJumiSnjXM677jRqLlS+U8bYuqBV
	o1DG6kc3AmurXDH3XUDnPw9PbnLovj/StdqAO8ZsYUTnukLhW4t57mJidoQd9MyErJTXwu5
	2aYnI0rIj8de2IGM0V624G6hl0JScV6FIDydfFK1YrWAB98HDOHwbuExhp+HQLfO0z3gYoI
	imMq9ve8maCyiAF7JiR0rMJleSgmSDXQk6HNvKpp3TJe4Yf2deTDhJUu1ko4k9xFyo5U/3b
	eKY+HxoQIBb7iYeSJTuTF/EKj+XN6uhAC1iJoWcLx8hzXDF2krVR3rQEGrbUeI8NJ8gsbQN
	8Hpc7blvN09Sqd9L5Nni1lq7l6GIap3dGQVW9LmucBxlaBV56U/9L9up6kXhtQ4qKUFyQip
	W0A5cU3Ll9J
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_062929_647434_E868808E 
X-CRM114-Status: UNSURE (   6.68  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

BS01DCMA is a compute module carrying two independent SpacemiT K3
nodes. The SpacemiT Cluster Server RV2768 is built from several of
these modules plugged into a carrier.

Add compatibles for the module and for a K3 node in the RV2768.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 4ee9c88984b4..31107219d855 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -37,6 +37,11 @@ properties:
               - deepcomputing,fml13v05
               - spacemit,k3-pico-itx
           - const: spacemit,k3
+      - items:
+          - enum:
+              - spacemit,k3-bs01dcma-rv2768
+          - const: spacemit,k3-bs01dcma
+          - const: spacemit,k3
       - items:
           - enum:
               - spacemit,k3-com260-ifx

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
