Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE76606A33D
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 08:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nJme7+A+;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=qhFal7Oj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SO00LxTD5iuSRJLtiCghXUDuITc0VH+PpHzEonCDenY=; b=nJme7+A+L4/qZs1eQWB3MNVDK/
	5x2z6FILEBdEJCz4MnbNcRsbF17vPGjaPRMaOPLotxcnC/YLJ7uzzPqeVy+rBh8hVOPUx9GCJqKAl
	YwNc9FO9ojOm241Y387LkEyRCAk1k+yljoOgyJT1icT03EZWcGzwTdPaMaXNZhbvn4Orl2DohcJxP
	ze3J7CrRnfMXK3mulIyfpBBRNR56G/o6k6bRnQCjZPsBBwS5iNbgcBULoPi6XpyzBoI+8pZVYaUKi
	eyVP5blsS3gzfGWucd6prVaOUWKP2tgoHPc9Gshh3NrymnQF3c9t/USm3twwxWw/fzljcdiV33PmE
	frzgq9ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEt8-00000004xT8-07eJ;
	Tue, 17 Nov 2026 08:50:02 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEt4-00000004xQJ-0zRy
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 08:50:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794905343;
	bh=F624hBP8nCq0U3Z4JN9NgFEkbbGSYRe06F8mXyDOOmA=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=qhFal7OjPL5PiSIXRAxv4vZASb31ZMoE2VMtowqUdoVr0KkgFtaVcXTi1n14iEJse
	 W6meI31W8Is8R6JNJKYWr2BbRVqrhVdmchVfeZgqqYZQYPmEijW8YO7RFg550LYKhs
	 dvn1OggWMqE41lTnqSuLv0r0PqnmKCSTOJy2W00A=
X-QQ-mid: esmtpsz20t1794905341td0a1e098
X-QQ-Originating-IP: yAhYonpOo9gZVad2TwrxHzgW2nNrsyrheoL/P/zPnE4=
Received: from = ( [183.48.247.191])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 16:48:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15463618535279915353
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 17 Nov 2026 08:48:51 +0000
Subject: [PATCH v2 1/2] dt-bindings: riscv: spacemit: Add K3 CoM260 TQ
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-k3-tq-dts-based-on-com260-v2-1-68b337bd8938@linux.spacemit.com>
References: <20261117-k3-tq-dts-based-on-com260-v2-0-68b337bd8938@linux.spacemit.com>
In-Reply-To: <20261117-k3-tq-dts-based-on-com260-v2-0-68b337bd8938@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=844;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=d9pfWYq2YU39bcVp1bR7pPQWrfGG7CsUOEEvhbFyPng=;
 b=kA0DAAoWmAnvgPkzNC8ByyZiAGr8FPah+Bx/KYpAGlInCBI0BKUIerhWz/0OzqErVgCaqfw6q
 Yh1BAAWCgAdFiEEi+AMtnBMWj1wEHFNmAnvgPkzNC8FAmr8FPYACgkQmAnvgPkzNC8lzgEAm7Or
 BMwoPtvdsblYg21rmukUfyuP8L/85KThsmidLmkBAK0l62JVO9a0p1wFVz1q2shkjFN7KWrMnb4
 J1buKGwII
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MORiLX+P/TRegEXTQIKhU7Yk1ku+h/cdryaTxqyEtd3JE5vrhkyqUDHn
	u13hwRzHAqcfPfZwpI8ZGIGJGl4ppTCFxUlnU38rPFvjeA12a/3OaBct3Fz4hK8okafmeL2
	Xu5/UqiwO1WklXLeLuMGVyZIu8v9cyMq6htIYknEUbT6HH39U5oKn+dKP29952BCPsV7uVm
	V3R35laGxJnz96eIo1swA1B2BeeE2cb+u87jiouwgJ/2EwhiUdwrpnCAacGdOwYjsC4EbsT
	JA95/XGstOi/QBdc9vBO3dWl3/SVCOUhbcS4R2zIDbKKTRwNP/i5j9IbBm8ndylmaahK904
	fM3vIS9v1INl9q85KfrlemEwPbW+IjFOj5R8KB+zmrHFxANXnpfbS5LVa957W68BootnRvy
	g2kwhokSaDoQhTqHAOeR8FPsgHfk0GMrbGbREaOSFu7iQnilQAWcNuPWeqhEQDugl89/phg
	i6GWbVS1t7xXSNZygAr/q7ZZOfKK45a7yTuRVMOHSLHs1vAOvBsgoNqsxGVD6NglcDWGei4
	Uojtg3SATS0scofBtl/heg+sU/RA+au3X4pbeN5NpRdJhAj0a52JYZqz1E60wVdFiO5raFh
	Ur8FHQh2r9/EHUyU4PBMdve6nGGm4AExij21Af8IEyK6KRWHQAcNR2YOQHo9s5FVCgN5Jgy
	pUd4jtSSD35B0wLuw/UmLh3mB4I/5rqIezTksnwkcTwlpXq36KRvmWRLVpSkwbubGlp0yVp
	2FQNGRpJMLjgtuYGb/u8QhImTi0rNRx2fGK6JiQ/1RHWvc2ncTXxaZ2H70Q2Ws3a7wvT8FW
	WnwqY4lfgMPd01aZt5+nV/+yF85zzBJrj7xZNRCtWaMyMEZcfp9UxZT9VLP2Bm7uChxYE7n
	ratA6R1h45R5ZDtoTY9pwtkgEKaSpN8XeVEmx5+foHU7Ck/BNGyadhTzI3KAWULJou3kkqv
	2FmGwQo4RZB5sAmRw+V7wk5DBUOJj4/lul5Kb+UELIQRfU+r1AEwENW7e9j4np9+qtdX2/6
	3wNmBb/kcpum7zdW4ye97uyCJ2a4LVDX4RMX7w5ZsDtBWzG4KKneBSvyw4nPoj8d1tLTTmR
	noj1+HRTm7tNKr2tBfLXkCuhqFa2OfE1/7m/9vD6ax/0tg8ZxwaYKszRaHulaR7KUXKQN6F
	LGaupxYjIKmkboQ=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_004958_751265_5EF5E3C7 
X-CRM114-Status: UNSURE (   6.93  )
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

The K3 CoM260 TQ board combines a CoM260 module with the TQ carrier
board. Add its board compatible with the CoM260 module and K3 SoC
fallbacks.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 4ee9c88984b4..9d1e1ff189ad 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -40,6 +40,7 @@ properties:
       - items:
           - enum:
               - spacemit,k3-com260-ifx
+              - spacemit,k3-com260-tq
           - const: spacemit,k3-com260
           - const: spacemit,k3
 

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
