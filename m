Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B462CDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 09:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5m1FIcoiMTarUnSOdDIE27ST6EklzGBJGLhU9AU3+CA=; b=iQ9iSD+5QXio83
	PQds0dF6934mV7Ewase3dfDxwmvjOR5yxT1Ui2aqP8VDfAtY4SPXr2anR0nWfpkAk4BN3dLyXFKjG
	lJzr96U7S6KFGFF+Nosuje92QdBLBSVaWdajNU9KAiHrpk13zN/CePq27fuDX0wFRZsCwXo5wiKjK
	8SsWFJoxBDHsfQK24VLE6YWIcdUXRdYltP9BoPi0HwW4BYzXJ9x1JE2H4BejY2vUXJ4/UXyyMB8aI
	Ig0xnazK6LWiMK9/9c6nq4QVBp6cDawPaHxeZ4tA7lj1MH0QmyJqinVVYKDrHa4lAAex/g9iO28w8
	WST2rNXk0aXxrVtz9kJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqrwZ-000N6y-1t;
	Thu, 12 Oct 2023 09:25:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqrwV-000N5e-1c
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 09:25:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E347361D3F;
	Thu, 12 Oct 2023 09:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F379AC433C8;
	Thu, 12 Oct 2023 09:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697102718;
	bh=3o/uhFcS8U5My0ncKTRyBUAftV0QIu/f9pc+SI5HXpo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DsvPuBD/rrWE1AeYn7+5FE19/KcPiFkNJZziMK8YOEOxEwaE9TZmNJ1HUEUWtbT/A
	 zGFvS0SYWa0M0++LHJXso3yGv7Cc1pjLJ2ZvErmiTPbqFmUgynkCoKwz264n+4Ekww
	 ShAdotCHEWWArlh6+M+JWLxcQ2FGdNXYgnLsYQfMVQLbGvtMZHywDZB+UfWChtYTZX
	 KArKuldJtUcQ9AqXq/FhmKvTWpWCxH913X0Hb/prTKdCihKYrrlvv6e/puEDKf4hTn
	 DodPx9GlLL+VRgdL/0Apo1l+EfX+IpW8FcwueKSX432onFjnqPx3O8kJQC2jGHj3Tv
	 4HMfdd7rF+0oA==
From: Conor Dooley <conor@kernel.org>
To: kernel@esmil.dk,
	conor@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	william.qiu@starfivetech.com,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nam Cao <namcao@linutronix.de>
Cc: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2] riscv: dts: starfive: visionfive 2: correct spi's ss pin
Date: Thu, 12 Oct 2023 10:24:18 +0100
Message-Id: <20231012-pointless-underpaid-649da93b1762@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012091729.3fzfDD1I@linutronix.de>
References: <20231012091729.3fzfDD1I@linutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=363; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=DCkp2TXqDwPuDa0wCN1QofJuZaPRdyQxX+0vez7hCxE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnqux32OYa82eP9YBbPY1XuNY/ytLbnn7zco8WgML8v6 rl+8fXXHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZiI5X1GhvmvVv0Wcrghz5eY 9k/lZMzFDyt9a9dGzfm62qhN5+tHtX6Gv1KagSFWEf7f3oXsOcb+e8q9W/u+cHrnabzkaLt3RO9 AHjMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_022519_604900_8ABC5797 
X-CRM114-Status: UNSURE (   5.82  )
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

On Thu, 12 Oct 2023 11:17:29 +0200, Nam Cao wrote:
> The ss pin of spi0 is the same as sck pin. According to the
> visionfive 2 documentation, it should be pin 49 instead of 48.
> 
> 

Applied to riscv-dt-fixes, thanks!

[1/1] riscv: dts: starfive: visionfive 2: correct spi's ss pin
      https://git.kernel.org/conor/c/cf98fe6b579e

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
