Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABB6CA0EEB
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 18:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mmu7dnHXphREXil5EYFjMxq4q7nVPeO5SxmT46ZY2UE=; b=CwK0/0WqM5JiMl
	WosJXJQV3gxnYi8u9vAJPUbYJkwvSJL96HxzQ9P+t1pw6ym2ACVcQEI5M01PHOXNhtU1+2UiOuP0q
	Zh0ILNOjAhAxvYx/9M/k4xUErGxfMur5JsQuiJ8Eiy8Xrl+9pET1fzk8efBS+g8Es2iFhbEW4MtBP
	al9j1fCX3fgEk8srQMeX5gXEvgWR82HfWlhFXBZNoyI/1iVlwKaDy7MkFAVXTF9xeO+puFDXqf+o2
	KZP1S3a4gbqZkc6NfyBmmXWnpE6GvTmNjWEHg3Q/7iszGkV7gBvdQ+++bKydCf+Tlj+2HsfnYL9cZ
	6UQ0z3XZPX7yrVCOqU/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoR2d-0000000BICb-1yny;
	Tue, 19 Aug 2025 18:26:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoOcX-0000000Aw8Y-3oID
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 15:51:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6BE495C58B0;
	Tue, 19 Aug 2025 15:51:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF4EC4CEF1;
	Tue, 19 Aug 2025 15:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755618693;
	bh=mWBaly7bkukCq8m5VXbJi5gIoLW+tCiQOL99VH0GUTw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QrJFWGVta1cSbFnLibenV9UBYnABVDcARhOwatYfp7y8UPN6zjirPIbpMEK8xC1pc
	 D+gZFq/+NFc27/c0VuPIXdCpTP+RG57SGEvjAoLrouePkJC6szWe7eI0ZGcWAP+TuU
	 4DY2HXoK9o7LLoPsoJ1xd4Aug+cpt0uQNyYihOuXK+3tHfN34hOL5ssnwhJH/dfjJm
	 W6RMzQJ5KzTlA84tGFIfkZvGVkh5cHcqDM8j6IR0/wkiTBbey39qpY53rw+tql9CoD
	 KXsR0pkY4n0OwU2+ifzqFuJwlxdRU1kFpGukFeLIRQj5+4LAV+/n6H1khCb1PNisRS
	 WhHJjap/j2maA==
From: Conor Dooley <conor@kernel.org>
To: Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH] riscv: dts: microchip: Minor whitespace cleanup
Date: Tue, 19 Aug 2025 16:50:55 +0100
Message-ID: <20250819-dimple-camera-93d21a97b0a3@spud>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250819131549.86279-2-krzysztof.kozlowski@linaro.org>
References: <20250819131549.86279-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=320; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=GbAqJH8GGwxxCZgEZhCcQRaSiWxPVwMWGD9JIZcHYdY=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBlL5iYY1TF8LF3aUmHfbvnpzpVwrapHK1dNyRacqfb6+ lYevt2pHaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZhIz0OG/8FinEEOnK8eC0tc CWTl4vzhpund1TH3vpiOxjdDPvs7bIwMuyfP+FQTEH7vvNetGSLTVRfLW3i89U5sv81WK33c/v0 jFgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_085133_985771_2CAAA961 
X-CRM114-Status: UNSURE (   5.73  )
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

On Tue, 19 Aug 2025 15:15:50 +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '='
> character.
> 
> 

Applied to riscv-dt-for-next, thanks!

[1/1] riscv: dts: microchip: Minor whitespace cleanup
      https://git.kernel.org/conor/c/cec6e40a02ef

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
