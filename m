Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8875A606A31B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 08:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ct0QgTL+;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=tycrbvdT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=92sGLsScDa6V2HDEzxfu+h4wMnsIgHlDvWGoDKn9QDI=; b=Ct0QgTL+Cgyj0QYQ4HzgqcYNaA
	fshVcJkled0yTn1+Nhre5s58d4nJSMSMCB9fx9v2ATZmEFnuH5pXARk202qxTCLG5/S1tr4BPZZIc
	BjPXVNLp4QcjlCjR53phOihAcX55Cq6eESF0/TMM/rdk/exZ8/NWkHRWrHE4JR4XSq7qB6H2574Zq
	5LzKYUxJdECXV22EBb6T6EG79RvqFA25ptVa6ep6rZafAqrqaJ8Pp95MY7kd4YeyUibJPCKHMsFNi
	vdDdf57Tz1kRb84tdVdQfYEKYmBtXf0yGPhES+mx8HAHEHVjuzc0XnSMmV6Tfxa6jNz7Yupb7FU/M
	x1MTZD6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsrd-000000089xR-2ft5;
	Thu, 05 Nov 2026 08:30:29 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsrZ-000000089tB-3kjn
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 08:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793867375;
	bh=CopvvqhWid9fiExsBsxW2G2T9Z5Dr++oJhDSpnNEa7E=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=tycrbvdT+RV7mYB1eAtRzCIy0Tou9MpJGN/4I9cjlGjGe8a4V2kSCIu2S2T1geQyn
	 oRBAWpXB1cR2xMAYxX4PN5Bwu0hrsjxicAEjVu+GDPGHf3RY8OE1SrI73QnQKAV/3r
	 ouixB63NCJ5P6g6B+Owfe0iYJq21xLGAVWl6kbKA=
X-QQ-mid: esmtpgz15t1793867374t0c3a66c1
X-QQ-Originating-IP: W/Ln7rBhQsWfKhGVkC9nM9jBRkjphOV2anfcWAXMPbU=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 16:29:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1637689771413805763
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 05 Nov 2026 08:29:26 +0000
Subject: [PATCH 1/2] dt-bindings: riscv: spacemit: Add K3 CoM260 IFX TQ
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-k3-tq-dts-based-on-com260-v1-1-aa0b7714aed0@linux.spacemit.com>
References: <20261105-k3-tq-dts-based-on-com260-v1-0-aa0b7714aed0@linux.spacemit.com>
In-Reply-To: <20261105-k3-tq-dts-based-on-com260-v1-0-aa0b7714aed0@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=849;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=0cRTat3hlAAUdXn7s5TJaU5uAtb3Men7e3BzfMITEU0=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlv7NI6eq62H3GW8UhsPzyHfU2aSWLYY6Oe8FcFXzrLN
 K37Pp/sKGVhEONikBVTZOl+wLOtwCfKtkCg0BdmDisTyBAGLk4BmMjmRQz/887v9VF8tkttt956
 nqONJbfusJyTN6jbfj8rhd3DdIfWaYb/kUyWKdOfZJ+Kbe7eocEpXX/KxKlzM8PGzF4/Ma79zBc
 4AQ==
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OKnzZZy8ux9JhjYj1PvUE5eeRyhx0HpYBcOlPYay3qg3+QMKYHy9BO0Q
	AkJ1Ia7D98nJ4c8BBE6oGzsJtkdy9YQkFGigljSbQeASnCeQiTmEq6S1dbDTNvPK+nf6s7t
	PEvfw+7LGQxT81P30W4D6dgmstsoKnG/RkQ0MZYDo/8kb76485SwO5zl6eMUsmCKIeAX9Qt
	JtMvQ2L4fYXYItQXrOz/dlkK6qGSnTJv/Jinwr5pF5BvsvU23G5n4+f+wLTF97qk0Oeo86Z
	wA1Ou5gEyA3pRX2RrvXomhUIoqkar6ADvpV6T/4PHT17Eg7ke475wzGRl+x2lk+sZg6BH5T
	TOEAma+WvoxBrfVaCwOlAoW/rx+itIzenwM1AYRfz6YmFsZ7ait+CQHZs+SB+yUWKEw1QZj
	QkshVjbhNpPKo7q50jAZPaWXth2QhsFpiXNk1dpe3T/Y8TzpFuxoSyS3WJGGwJKLDW+sPzo
	VzcTTaw9NxiBsFkEM8PpMrZ2TgN5h92qH9vVHxK8zD6Abz/+YYlEs8tGiaNmIfU+E/ziN4v
	jb8ZdzihfB1lyBcnj16xOd/5NtAM4stuib8kE/sLD92DSUHpadZNIlccswK4Yb0F9tVRL/2
	RnJNppPAFCsm3xIFZxAXRg+E3MJqlOmeXESFTeYHOuGYmxrZkloy+Jii3fxjPsH5gvLgVSB
	T1fx7yklmJrlbNWfAMCIjywpGMTdPLGmemQhvIWIO12pgGNW9zcpnwzyBHMznkVup+kLQXH
	IVULhe7oQr8E/U9lAMzPhe/8XjLiA0B7mcz+h14+TSRT8VbE8eOVFn+4Om7/X86AW15SJOO
	qjf/zkFQlUtW3uHc/zU2Hg7ZYIjf3ew+F6uLDyiNqTK4jDkGSSr+IF00/7J3q3tIdIf8yqq
	G9WG3eYlWFlsFmtHNLMxfhbpYRWYCAGHEPA7KvDxjCN04KdRreoXPyqQyCsBoFzNWvYAMGK
	pBRBvHqJbnxyg6teVLXTc9FyhPZChh9JoAkuMxFPUJXPVpkDQyWA2PzFflzAYm44XjQqKME
	f1qnhEvIt2kXpMfIof+iLu/txzKRq6yITMKfOEgm8ybdTIiCuIVLDMKHTlwOKnP6lQIhGps
	byp78886ceS24IkZnNaF3b/BISHjC5H3g==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_003027_233922_A03A8C82 
X-CRM114-Status: UNSURE (   6.39  )
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

The K3 CoM260 IFX TQ board combines a CoM260 module with an IFX TQ
carrier. Add its board compatible with the CoM260 module and K3 SoC
fallbacks.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 4ee9c88984b4..9b115b4e4b9b 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -40,6 +40,7 @@ properties:
       - items:
           - enum:
               - spacemit,k3-com260-ifx
+              - spacemit,k3-com260-ifx-tq
           - const: spacemit,k3-com260
           - const: spacemit,k3
 

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
