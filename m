Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0789E606A326
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 06:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XGnLBba7;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=uWLjDoct
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OaDCnE28kcabAVUTDLFX4ha9SGqs3Kh+Yk35hHId6T0=; b=XGnLBba7p96R/ESpMzI2H6JjzK
	MkYmjFOU+MJK0WUmK+bvzOGWwKfi8ANd9LbWFUgda51BhWzxSa2vsBMU+Zuews4HL2oUtgecrNESl
	0KrFEWPxJglw0H3BI80Tsn9tzbCqK5FpDNzTcHBY9MR51zAkrsziDG6TpzBwQhoXkJ8o2z07/VBS8
	ZxAyahvmaeMxKOOLXU8edcoWVMmHkcXDDc4ian/9hbwW2xPgzxTMY+wW2nemtf3s19nsY+SBlYw3U
	o4/qvgCefkq+0vTNQPD1i55Zq+ROW81q6iRAG6Nm2nqrSjF8GCjxg4wdn3AaBuKIu8ArUyS8BRk/W
	DbaKnjhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUOk-00000004P8b-25Cr;
	Wed, 04 Nov 2026 06:23:02 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUOh-00000004P6N-2jvF
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 06:23:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793773326;
	bh=RS8HQHUDLvu3L0nrb3s/fU2QFoH0d0vm0L4FG+93668=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=uWLjDoct0Drng1xi1gU7wQnUZnNCkP0hgpDMiPjjgobwqMYDTMAu5pw6+8CQk5DgB
	 6TpjABOZwQSY5lLZgoUly0xMZBa/utPjalKBRejdf8HjTjvLcWCiKgCbiK84L3m2e0
	 rPXJi6ehs7oiZu4Tv0ChYADJcSjQ7thWANfIpe/A=
X-QQ-mid: zesmtpsz8t1793773324t7b13cf52
X-QQ-Originating-IP: dr7aZKcoVFwVL1+V7P+P4KXa9jl1lrdr29Yc0oryszw=
Received: from = ( [183.48.245.66])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Nov 2026 14:22:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12024928077256599196
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 04 Nov 2026 06:21:50 +0000
Subject: [PATCH 1/2] dt-bindings: riscv: spacemit: Add K3 BS01DCMA
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261104-k3-bs01dcma-v1-1-794025247e4a@linux.spacemit.com>
References: <20261104-k3-bs01dcma-v1-0-794025247e4a@linux.spacemit.com>
In-Reply-To: <20261104-k3-bs01dcma-v1-0-794025247e4a@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=805;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=ghUSxoaLZNOHu0bC2sc85BOdFzkkpY7rTBR2ijIXN9s=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmvzrOkpwVlnbM4/vUeF8PfiuOPbm8Ii78qo2rGe2qSx
 oLDvVY/OkpZGMS4GGTFFFm6H/BsK/CJsi0QKPSFmcPKBDKEgYtTACaiy8Lw3+elvNzu0+yn7z7a
 8T+VtXEKa0/e2Sd6/V2XAv+6nd4YJ8vIcITn1d0FupuOVfmvPHfyl9W1T8ud7josD/r6zehuYma
 GBTsA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MBlb9jzPUvXQ4NoKWm7q6YaLzkeMPGqRd07xUFMx9LD54J0wXiOrysjx
	gFSU7WZTBGYqZrmIMQEuHJILAVaSf9qY3/GMOq90UvFpdKPOUNCM3d3puMtM/Xyl7nfoQbq
	JblE4yh6MeGrtpV0yyB0ZfX65QV85F2a9EZ7P7FHH5bT1m6ZfnxgQGyoLRyGYPrdUGqr0tF
	kcgb+CxKLzxHcNBsoc2Fqy1XFmbMXCBHHxeaQ+2wqgk92w9wn/ssz2ycwII5AHh89+3ormF
	5hDNo+S6j+RYvbqdWi5z9FtmFDg+IfoZ7a8nYedsW+pVUEfNhQeDZF3CgJf10VtRH0f2wmS
	yRnJ7H6/nnfdnL5wY75xXvIl+fEjzg8UXizCfkuP1hGJmV24EqJTJaLEq8MNMAlZ3c9Zwdo
	hjKbbG1WJ8kPKt/QEM2XUDuOuNtDdRQIEtm89AGWmm2MGXnxqdoW7lfCOMrcAvRqrDQuGa0
	stSSpv8DtNzyYvrA8qR5FHUPsiV1FeXwMfqRoj179qk8cJTUcyriLSBm5RgLApfypN6lfRs
	06gMj8yWUHYNdTIhsrbIQVeWs6vJEh/2hJ0qE+eGNkuIzWjpTWPwPvKAMz5SNsJQdYfSbBO
	/pAuMzmoqYxGx/hOSUUNWoDp7SSYRDsHZgV1Y5ByehjvQbpiniKf16kCj9yV1Gq9BfGow5g
	M8SW1eNO4S2sCZMyfdzXcnbhXnMzZs8c2T/o0CaelY40YaWHteZdyNb4cs+oN04S1rUCT7/
	pBJdJ62dQ6gP1y7EFbFaXvw3cvTbezHrIlbuXzd6+TYxC3Rrd4PuQx4c8QeBzK0sKrSv8/W
	bhDgwM4TsgIzrfTAYUfjUKhgMTZ9riJRv9ReE2dS0OjDHmzVRStm4O8kgZnTFgEpDbQJ0rl
	H7mefLMNQ6DabwBVt1atC1ipxLXf3xqbgQmK7fJLmuFrQtLm7koDpR4yfKsSAIcbZ+pCqwb
	A86A9oJzmiklmPXsT5mvV/h5s47IFM/s7k34BXx311Mvf+c9XVf3JvMqVSOtzYMbfGcmLJW
	Z/nzFFqW0yW43j4fLrHk/5xKY+Tm0GMNR/ft88KO1fN0r/ULoXyTFAkB5nClmRM/+eHpan/
	qZvmm0Jq5+hszLuTBYDHQWBEpiILlbMSmd+FbfNV2BXTCpEvrR69TKgRzJZNEz3/A==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_222300_492112_7131E9C3 
X-CRM114-Status: UNSURE (   8.16  )
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

BS01DCMA is a board based on the SpacemiT K3 SoC. Add its compatible
with the K3 SoC fallback.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 4ee9c88984b4..5023093ca2eb 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -35,6 +35,7 @@ properties:
       - items:
           - enum:
               - deepcomputing,fml13v05
+              - spacemit,k3-bs01dcma
               - spacemit,k3-pico-itx
           - const: spacemit,k3
       - items:

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
