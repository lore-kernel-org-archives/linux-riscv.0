Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DAB105F7A6
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 13:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gbHwj2TR8szuo9PpabGNQ5hofxtIMiYgZD234/2Szx0=; b=ySJTwnO2B//nXR
	ka/nwRkXp7IcPeNBcfuW3cOMAJFfCUSigcFNL71RP8OP11BKF/WwleT9uU1nck5GAVrFP0rI3RXzl
	6Y+8hkh9cQVakAnRRXESFoRGYLncesbwDjvSoKJmFqt4PDsSaRmEGMitGVy4zSIKoFUvkyvcL6I5f
	KtkyNbsuWseUQvbXIh6wvg7mv71//NEG1ptVoC30MNtV8JJbAIHlm7FM2PdBbvHnijXmhFnHWlMjy
	jK4PpSiNyhDKk7sSfvZqS8VN2Piz+eY/CbsuyduCFasjZkiiwaa3GrLjNL77H+vYJamgEqNZBcQQ+
	vEdDQ5ANp9FpD2kBtUgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12Vo-00000000Dso-3EKS;
	Fri, 13 Mar 2026 13:25:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12Vl-00000000Dro-3jkn
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 13:25:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C8E54432BA;
	Fri, 13 Mar 2026 13:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33FBBC2BC86;
	Fri, 13 Mar 2026 13:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773408304;
	bh=3J0mqTW76J93IzmMcyvbO8vL4M3vcbrZh8lQRJD/PLM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aCTlN7Uu4bH7T2w5Z01mzOzcdSxCZAm7zSqAi/yjMfLFDSWzfsa8kw21w9X+QTsQt
	 Gkd5iXW6SyB8+gnP6qa1FD3XmTW1tWA/QA3m5gninoX2Rx0PlkBEaRLbgjrWyGuOmN
	 oNRwQQ8sLJDp5eAbghEIHTBXBsLPvz2qc6P4cUXo3DkJXFjTnxksUg1qdda4mQ18RW
	 /k6CtiYemEiZZtBAZdosRcwUHQMieko3QaLpgQmNUFYfDpZ5Ge+PXeVIP9BFPT4/UC
	 sf3Xvc5iwA436Ry3wQqXbcGBFCUGTQYHPiF0P2MIs9jwQpHILJyWPs3dRe+AdQGN4F
	 kD/O0mlcUFYYA==
From: Yixun Lan <dlan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org,
	Guodong Xu <guodong@riscstar.com>,
	Yixun Lan <dlan@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: serial: 8250: spacemit: fix clock property for K3 SoC
Date: Fri, 13 Mar 2026 13:24:57 +0000
Message-ID: <177340792098.15746.315306676858914144.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304-01-uart-clock-names-v1-1-338483f04a8b@kernel.org>
References: <20260304-01-uart-clock-names-v1-1-338483f04a8b@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_062505_958124_0A843A7C 
X-CRM114-Status: UNSURE (   6.25  )
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


On Wed, 04 Mar 2026 07:19:39 +0000, Yixun Lan wrote:
> The UART of SpacemiT K3 SoC has same clock property as K1 generation which
> request two clock sources, fix the binding otherwise will get DT check
> warnings.
> 
> 

Applied, thanks!

[1/1] dt-bindings: serial: 8250: spacemit: fix clock property for K3 SoC
      https://github.com/spacemit-com/linux/commit/606a6b8bca570aa4f838ddd410345a2937bd98eb

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
