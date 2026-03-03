Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A20EDA6B4
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 17:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CdBg5Sj9qJcjpbVOL3bS1KOlUFRr9PL9k4N95dRDHn8=; b=FjtwfzFn4Uwh1I
	huGJ+2RXmAAUUbmlwf3BS9p56THFIAZUaBkwmycaP8ElXJpI6EJOr68fycvzfBm4KeWbHpNgveM4m
	3Z+n+yWfSlhUcO6VpDCJQs6ZDCmMFrIB0IppvYl4VxvAKm7sgCdNoqEoAxGM6LykNSghuf2mokHyf
	JUzTfmVrVYmmFapn0b570QTUXgEjIt1hlrY026X6Bk05tZMzU85ZhIfnkpZAMYCKT9Hz7Lo/UEtBA
	y0eGNXuHhN078+9B78HG/1XNW9xCsKKeo4onU/v8q8BffvI6gXvN62A5hFwrvX+p5X6pjkMHxUIzo
	I/w0aqstZHa178XNDP5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxTFw-0000000Fcj2-0x8I;
	Tue, 03 Mar 2026 17:10:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxTFu-0000000FciQ-2E2O
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 17:09:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF97641A74;
	Tue,  3 Mar 2026 17:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05ED9C116C6;
	Tue,  3 Mar 2026 17:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772557797;
	bh=Ed+bCSB3ThJGp+/vAu9s2Q+ELZixwlGJmuotKDRz82k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W2oaRn9uiUQSef6/Ag2S7rjVC4JmRCNFZ7VrqoeUSIXgO0UpEYy0N4k9a0joQTKUo
	 +/5AUpDvxrutE3gyeYcEhN9sIbBmZ/iT+gFFOOfXyznFhKwfNGuCBtoKxPebNSuSDv
	 dd0oMg3ZBRaYLbByJjsHRINTJY/j7DZM93ll6tHUtD8NtTRo5P2iPIMrWx5SsgXKd1
	 sz110/HLeLiMuOC40p1TxRgpUbw4I4lsag7Z7fcJ/owWZfIc4V7HVpL99MkO7MogAA
	 TC05fFm+7PLRzeYfo//cd/8OObmQFo7k2EXkSi6ngSG6G3NoW9XIohMu7dCVA0F82Y
	 UvfepzWp2H/PQ==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 0/3] pic64gx soc driver/binding changes
Date: Tue,  3 Mar 2026 17:09:51 +0000
Message-ID: <20260303-punk-mustiness-33529cdc51e2@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117-mashing-cursor-6e965a77ce6a@spud>
References: <20251117-mashing-cursor-6e965a77ce6a@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=961; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=GOUbHoOFTBTdmyKbtuiSppBTOdAoMbcZhph/KEs89vE=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnLRe/PkElQXXCyLqmq+MGETU9eFM19/DeqV6R4idJCt +DcV/OedJSyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiy+cyMqyKSVyQVnv4u7qf X3C13oKFVg9lW8pFGRkOzf2csCylajEjwxE1ibuxH2p4La/0mwes8ZY5uOfsvK0Xs+JWhC9n+Wx xmw0A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_090958_626499_26ABE580 
X-CRM114-Status: UNSURE (   6.29  )
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

On Mon, 17 Nov 2025 14:21:19 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Mostly this is stuff that PH did last year, but rebased on top of
> current work.
> 
> CC: Conor Dooley <conor@kernel.org>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> CC: linux-riscv@lists.infradead.org
> 
> [...]

Applied to riscv-soc-drivers-for-next, thanks!

[1/3] dt-bindings: soc: microchip: add compatible for the mss-top-sysreg on pic64gx
      https://git.kernel.org/conor/c/7a58baed883a
[2/3] dt-bindings: soc: microchip: mpfs-sys-controller: Add pic64gx compatibility
      https://git.kernel.org/conor/c/ecc09da7ba34
[3/3] soc: microchip: mpfs-sys-controller: add support for pic64gx
      https://git.kernel.org/conor/c/63b5305ad84d

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
