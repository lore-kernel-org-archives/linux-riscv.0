Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BF2E6F06C
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 09:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0rRl+OQxZ2g1V0MVvcpkJxi5VLQCjSv5cGwigD+BDZU=; b=fDTCeUJQ65R/WN
	cg4wAvLEnbngaelBEpqZpjX/cNF65hqaW8hH1I7D9Omp9t3MAOcJOjBSSEBwxLzTdREzQWy6HgONC
	UR7xQhWltu3UBRGGygKizfVv2sLgwDWuozxNO/0k8nLwtNknn/4MvSXfMUBmaE7yXGGQyn/vujH02
	8DquFpkydspRDFVMVuwaHUbXqcezyc4UD+jo+f3TiCqHe0z2rs3WOQCYsI79zz2l4RCnKFOceU44j
	Va0/srOH9WutQjzZoJeCbqvHfvr65rqK9BrlsyeUZ12p795q+AlE1pwnGuO/EQMQ9P8bXFuVFERZw
	9Bbdp1eImv7LCZbpgsnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXyRo-0000000Ej8a-0dYP;
	Tue, 23 Dec 2025 09:12:52 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXyRj-0000000Ej68-12c7
	for linux-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 09:12:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766481089;
	bh=xv295mRbFd/MwI+3jqPuKT9ohgq+Kl7APeZXZSYkNLw=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=UULARhE/5PMRePjiOfWrpZZsmG4d43ugLbwC/sqjnJGD31/H4PdMRTnTWRI1f37Rx
	 90yJlENQljV0WCqzhHIghQ3QJciAabbHESwEdIhBISy7x6jLdPtgunMc5HTrvvNgAL
	 Mrfdbrq9uXHbs1TDeEjzU5sSq8yb0ulHmB6z2oVM=
X-QQ-mid: zesmtpsz6t1766481080te4b08a3b
X-QQ-Originating-IP: HDa2ljzHg8kBwp4BcXTul0BL/+wF6FAskTULdgy/VmI=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Dec 2025 17:11:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16625877039514221719
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 23 Dec 2025 17:11:11 +0800
Subject: [PATCH 1/2] dt-bindings: pinctrl: add syscon property
MIME-Version: 1.0
Message-Id: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-1-5f1090a487c7@linux.spacemit.com>
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
In-Reply-To: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766481072; l=1822;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=zRP5kB8Bg0I+gikI6IUrIjghYJOlbkwuwGj2YrT1/uQ=;
 b=0tXUZiZUb+RN2K+xRaLFxkhamxEESjAbc7gBfBZnoQgXETKe8O0dEMIxF9lWZXZlYpf1HpqJk
 BDgX8EB9hl6BmyEAwCzlu/1S8yUKyIrpDHvY53DmpMHWeeGDv+IlHvq
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OV518bdC2gsfl3G3VZkLsyHqQNeqQsXiQRK0q/wG/n3g90fhz0M003b3
	N02DrmDexRL+PPxiD9vf61GEi+BGL53oGNxSeNsyA6xMuJsFow8VrDyMFZPBYqUuX4WxT/u
	o5dU54oD9MM1hFba9f/0pMKqG3JPEsu1OamAwpmRVPGuLUBIXsD8FXQW2p98oYxlJdERWbl
	P0hUOLyy++8QLjcJIzdWLGVwzuMeQGOAAtRmt2FhRkuTygBjlMg66LIrha3f2QhSpjvXYxb
	SLr+g2e3blL+9BEftVEtQDkCFhznLQcZ2VUqbHG9nL/1utjAPcD6Dt1HGEo5ZKPTifmLNRc
	4hVXdiPguBjQkG8J8Ddg23wIPYnVQkyHF86zjckaK96MNT6xZKpKzSatDKYBpg3Z8T5zCUY
	4lAaZbT/o8LyZj/NdB5gxS1CCvhUVdnVSKSLyhQ1/f6yyK97+TMYU7cnc5PxGAv5jk8nGuf
	AggzII78XVMw8vsvlHlFdQVgPDVoQCRdUka+OcN5sIIBdafyexlziOz3RDzG8wy75lkOJno
	/pRO6R5X+9o9g10W6GOeKkkWX/1M/EKfS4pkc5E32wWEsaQhi5XszIQnk+3l6xjBm9quDme
	lmiHf5FkjCIoOcS7WuNS3pVlFCq6fj1DMO1Eop431zElBYewmixDkvms3Eb+KYGjiSJDncZ
	gH03lT+h0TszfTvRWGWSRHLY1lCh1VfmuXpYBm10P2JYDKfeBcy86LBFmf2puTTf7ikVl93
	U4HAUmCMezDhGvUNGx/jZDJWgl0kDq3XpNF1RsbOe6BbCm91cDriV4ZXU4uCxN6xQo4c0kM
	ZIGn1FpDK4W3gcrwVot/dAHc8+EphV3McHd4FZxeHxT2743heTRODzMNhoIDaeNlXPN8jH4
	sFd0pUTjmm7MsEXxu0F6FQeABs7x8wvRGErVs1RRNubnyo29SynIx1Eh6JVIQFrtSuvbTSP
	97PTK9rhOXTjOb7PMKEOv+053nwo1eeAVyzN2gqqEhsBPvlhp10/M5Rmyj8a1f+M6UR4ah4
	te1pGM6o9ikoiQy09XzXz9Y8fs0QQEEHjBWU3GWK5FTCFLNbms/7I4aejiMomESmNYQe16x
	o7w+/Sz+RIkGtcIMc7SG+n5VyvoWlGSQwMDUCJbg5VY/93LFAHmQODRn2hRMROTcmUIf2Gg
	rTSAvVK8CTUaPVFjiIwBtZQHIQ==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_011248_168296_D2FEF465 
X-CRM114-Status: UNSURE (   9.21  )
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

In order to access the protected IO power domain registers, a valid
unlock sequence must be performed by writing the required keys to the
AIB Secure Access Register (ASAR).

The ASAR register resides within the APBC register address space.
A corresponding syscon property is added to allow the pinctrl driver
to access this register.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 .../devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml      | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
index c5b0218ad6251f97b1f27089ffff724a7b0f69ae..4dc49c2cc1d52008ad89896ae0419091802cd2c4 100644
--- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
@@ -32,6 +32,15 @@ properties:
   resets:
     maxItems: 1
 
+  spacemit,apbc:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to syscon that access the protected register
+          - description: offset of access secure registers
+    description:
+      A phandle to syscon with byte offset to access the protected register
+
 patternProperties:
   '-cfg$':
     type: object
@@ -111,6 +120,7 @@ required:
   - reg
   - clocks
   - clock-names
+  - spacemit,apbc
 
 additionalProperties: false
 
@@ -128,6 +138,7 @@ examples:
             clocks = <&syscon_apbc 42>,
                      <&syscon_apbc 94>;
             clock-names = "func", "bus";
+            spacemit,apbc = <&syscon_apbc 0x50>;
 
             uart0_2_cfg: uart0-2-cfg {
                 uart0-2-pins {

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
