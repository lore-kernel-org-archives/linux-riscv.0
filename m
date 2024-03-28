Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54739CD11DD
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 22:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4urYoil0KSLExR7N2C8Fmur+JP9uaLDzJSuuN9YbtqE=; b=OHb3i2Dc4CwED4
	cJXlxrXwn2QaGP/6muPopbsMe3mhkDWUzTw4nN5vbNErhjMrh9NVnlLeZRfhRXRDeFGNIEGRXu8TL
	GNYobEdSovt8GzEge9j1noMAALX6pZtmxKYX7R/iJxaahnGWyvRuqRSqB8daoRqhxi3lX7v8aimAy
	8U6So005CL3WRr7kWaGkzbubMACDYRpHAJfIdaX3ks0y5yiWa3T7JN/wcAanlxgC+fdswd/CQBXp3
	Dch6aBrtyzvD+3lJboBoMWe2E/pdq0qJkaO2TThyivBVR+r3NU0fEIr0oQSUzTq1e6iONv+rD/dU5
	+kR0uEX2rLb20qnsLa+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpyVU-0000000FzET-0s8b;
	Thu, 28 Mar 2024 22:46:00 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpyVQ-0000000FzE2-2V0a
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 22:45:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3AB7CCE2B71;
	Thu, 28 Mar 2024 22:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB078C433F1;
	Thu, 28 Mar 2024 22:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711665953;
	bh=W1e7ay70S0bGDbL9O//v9FziMstI7A/WkxYpH53hCK4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ljof7OKCozUwgL++K/IYKfu+qE0IRqfUh60p53OfvZMETuD5zvkA5KIBxKHY8MOi3
	 eon320X/S1ZUu7nDhy3D0wad9HaY9d5DCv9dHqoS6kDewihmbBGcVYlN4GzhWjWk+p
	 vmMvLNxOavTDurLKXhOj5Ifb1f0L4qRpv/upQCW6NdK3fNX4XIV+jCeMnUFQmmOh8T
	 rysuPq4wp61ppjHREvMvdVxv+5jjddIPd45F4HbmqtewhltVIzjBLP0+9fU1oqlNbf
	 RAi6LjUzMPVG45wAMM0E2eu8ar3cMqC3LsbmCks1YxrkYEMBZG3DuvzpJUMABzqoRe
	 7d4v6dBODq4jw==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] cache: sifive_ccache: Partially convert to a platform driver
Date: Thu, 28 Mar 2024 22:44:10 +0000
Message-ID: <20240328-humongous-amaretto-bc4564097bd2@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240327054537.424980-1-samuel.holland@sifive.com>
References: <20240327054537.424980-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=588; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=WCT5UiUI9Iq6C/Nwi2p53WJDPcmeVV5PAclYbFknN+I=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGmsn665TTotf227YtuJaWYr5zFwFkZ+NFKt9D+mmRd+8 fDFC4z3OkpZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCR4p8M/4zv2bucFTaUMGcT 224q/THpZeL1RYrv7ScG/pkyJbLk3xSGf0YBXxSUV+wJrCl2/bH/8dkzHgsOWyxbs47n3muus1d sO/kA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_154556_930438_E0B3F1D4 
X-CRM114-Status: UNSURE (   6.97  )
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

On Tue, 26 Mar 2024 22:45:24 -0700, Samuel Holland wrote:
> Commit 8ec99b033147 ("irqchip/sifive-plic: Convert PLIC driver into a
> platform driver") broke ccache initialization because the PLIC IRQ
> domain is no longer available during an arch_initcall:
> 
>   [    0.087229] irq: no irq domain found for interrupt-controller@c000000 !
>   [    0.087255] CCACHE: Could not request IRQ 0
> 
> [...]

Applied to riscv-soc-fixes, thanks for doing this Samuel.

[1/1] cache: sifive_ccache: Partially convert to a platform driver
      https://git.kernel.org/conor/c/c90847bcbfb6

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
