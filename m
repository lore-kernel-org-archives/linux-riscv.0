Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4C0C79F99
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 18:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZrvVyNhSuuA24RezggVrTcoUTMzxlArsX88tj9XSfao=; b=Vd24MRAU3f06jC
	WZgJhtDao/9kHsqJcmIJvrjDbJY8pg68fjfQhXrmXxp68J21S6qtuzBKQ29O4BgurlQSX9TGGvMIU
	LIURKFGsCnbdxzKS5gzJi7WwzK3LXZ8skhbVnoaoStjTP3V8h4TRNLGOvGHFai3qVwILMQuH0XO5D
	prZGb3ajMK3W23oCmhKD4yqGLL9oTaGtP7e3CvIyWTDBoBJNiUArH8bkzdGFmoB3BksPJB9Ny9SVd
	tRfD6Jpry3R23fVU6ohZ+xkZtQHu6P+MxS95zADvpjF/+EFZO4OLq+yI4S0IzopxLyWiagJ+EvswD
	b1U88XC8Y/jhLROX+I6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x40Qv-00000009xWk-3Ggd;
	Tue, 08 Sep 2026 18:20:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x40Qv-00000009xWb-04AO
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 18:20:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 76FAE601FD;
	Tue,  8 Sep 2026 18:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BEBF1F00A3D;
	Tue,  8 Sep 2026 18:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788891636;
	bh=ccXOdVFzH972jdgocJFa+E44+QQhkG58eRxMxfs9WlY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mkjkTa04ZPZEb5beLHdp/cJO/j/Gp8g1XFRdKygFna5WTunLf+r8AJ+WRXgQ0wVf1
	 xnEldfNR/arHNmpMNuS7WfdDvlx6nXGCmo7rRblmzNnqDWMN1SukiyCZUIomuHCXGn
	 xFYnEJK1j0AgS6jIDltyiXJOXB+DSpi2cRyTXAobmXF5mfVguV/7w7Sk+QIX7IgwoS
	 MUIDpboS8kRfhsaDEIxZTp3rhqpmR+Uw5JBi4dK1e/MqpVcDanL/UKUwUPs3NtsZ5w
	 gII4H9oioLPHv9uU2CDYf3L5P1N5atkLlJCNPSkygE1h1dUqt11qSpJrGdYVjbc5st
	 S5+8c2Xqz3BtA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org,
	Pan Chuang <panchuang@vivo.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] cache: sifive_ccache: Remove redundant dev_err_probe()
Date: Tue,  8 Sep 2026 19:20:28 +0100
Message-ID: <178889161921.3146991.13668063347588456069.b4-ty@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713112946.468067-1-panchuang@vivo.com>
References: <20260713112946.468067-1-panchuang@vivo.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=466; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=vcZWekDFgRHjqKZw/CO3x6YyAvbCmqMsDCJ5P79VCoI=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFkLAl9LztBwe2yjuO7Smqjkmd6z5MNmvnkvfcYsI93D8 fPLbQ9tOkpZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAnCT2xn+mZ29dHbHts1xyW90 c2fUet1b8uUVp+6TrM47Op+XbrzD+JeRYf3CzG7B+oCtvx22dfjzzVEQmB9nuzLT1s2vNeVPsOp kbgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

On Mon, 13 Jul 2026 19:29:46 +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err_probe() calls.

Applied to cache-for-next, thanks!

[1/1] cache: sifive_ccache: Remove redundant dev_err_probe()
      https://git.kernel.org/conor/c/75effa447550

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
