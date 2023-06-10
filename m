Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1A8C83005
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 17:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TJMM73Fwn0BGWQqaqbAFSNAlJS0+gqUAmQhoalgAeRk=; b=n07zcEXANZ/8cc
	PSXcqonX2dlNV5KqZRi4oJehyUh7c2fdSnpvxhtXGzd2qIQaWGSAFVwTWMX07U2uLrCZMXFnqul8A
	birFd6qCB1RiPRtsQYvjlb1OEq0F3G2MxQFY8E+1xKnshZ2WZXLq4rk8FlvoCHHwxsTKQecuOnLIH
	PAY3D8pY0L+54TAn1//Mvu5YGWT4ZLkBtLrrQbMwizuTXl526A88o+cdPYAK3owO7KNuvtw2jNl46
	YtMc8sSa8PcCyxGh4OFlpHt6hOpgmJ1TFOQqIHSM2rcQocVXG4JHNFA8Zgq1xACYfXf6CKXrxSjea
	gtX9igcemiOA96BwwKwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q82Ky-00Ger2-0Z;
	Sat, 10 Jun 2023 17:25:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q82Kw-00Gepu-0R
	for linux-riscv@lists.infradead.org;
	Sat, 10 Jun 2023 17:25:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E54C561010;
	Sat, 10 Jun 2023 17:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 754CCC433D2;
	Sat, 10 Jun 2023 17:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686417909;
	bh=+CGO6+qAMKLfPjunyiWqLb8FIpRIF17JdrAj2A38lbQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Guf3S4EcErxRdPDv1P4FruQrkdW3AAtM9QrK9OPiiciRmjTpUlIGA0ohCxpbwLqpV
	 gBPdZwXUy57hV28Ht4RHj4Tyc8H/IOZBvtJ960dCBXMdeoQ1Ak5vNAJiMLSbFDgUvl
	 SjwkfOcMODgKVUdsNn+DMGkptR1AMYB3L9CBPVEC0YmdsKrzHXHP0LORnfRtveBr7M
	 NXG3gEBjpO/AhwLIcISEdjB/pYqISUJwpJE2iLejQL1pnhssJ0TpLWoYlIjvTUIIP/
	 gjeMEuEnamAKxle46Vxo5iLT0OwydGFqiOZEAlDgk9vLMB4yaxtVyb/0xGDjnws52s
	 q2P6saDY/0Ctw==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/6] dt-bindings: riscv: cpus: switch to unevaluatedProperties: false
Date: Sat, 10 Jun 2023 18:24:47 +0100
Message-Id: <20230610-snaking-version-81ae5abb7573@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=972; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=/IRjjbSMe5wvcyT1lUiwzTIegPvYC2KIb2FTQX8vuGA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCktGx/IHfklX+DUwN6ZMHef0mKr4rVxgUaiVR6n3S9F2 f9zeeLTUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIkcbmD4Z5gq1rNnv5voLV/n hv9Nygu/ftxWcc2wUIRHWfih+J9HaxgZlt94UDal7M+Ld7caDx2/dVJRyTrMqjPJ8Luv6iXJ9J4 OdgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_102514_221451_4F5A17CE 
X-CRM114-Status: UNSURE (   8.03  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Do the various bits needed to drop the additionalProperties: true that
we currently have in riscv/cpu.yaml, to permit actually enforcing what
people put in cpus nodes.

CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Conor Dooley (6):
  dt-bindings: riscv: cpus: add a ref the common cpu schema
  dt-bindings: riscv: cpus: allow clocks property
  dt-bindings: riscv: cpus: add a ref to thermal-cooling-cells
  dt-bindings: riscv: cpus: permit operating-points-v2
  dt-bindings: riscv: cpus: document cpu-supply
  dt-bindings: riscv: cpus: switch to unevaluatedProperties: false

 .../devicetree/bindings/riscv/cpus.yaml         | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
