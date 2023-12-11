Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B9CC10DC3
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 13:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jYSkPJBf2CnSzUWxqbICE+9Hk0idvPP5nSrTzf9qNgs=; b=Y3glhN5UGrPmEq
	oyuRT7XL7wFhDG9JFe1s7oKx3AqgbpSiePn1/iA3umQzMPLgq5+o3M5MFus2M0i75loiD6whXGK6r
	FOam9yKtWTzpiaE68qM070Ufvc1o6GVvyoOfdS1/i4Jsd1vxqKzX9SPGM31Jzsyb5ixU+15f7MVLV
	u5vh8UNJkEnB+nHHMN0yE0OB5pubV2eBVO+oW0AInt/wKGHIIa+FB1beMIXrtIIfGkVqpYQ5ZezhL
	2oLMiYDm4P7cEmxjEIIuCxdPwovlh9TOoWATVtrTkcDvy35qYoD+tdCX90wWf16oQ7Mk/gQblS/LJ
	tO92wycuZWvbS4zbKUJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCgnG-0053Ly-2Z;
	Mon, 11 Dec 2023 13:57:59 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCgnC-0053IH-04
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 13:57:57 +0000
Date: Mon, 11 Dec 2023 14:57:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1702303071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OtPxZyAIr0q83FqrgnW8CYSUeZdYcDZKkr11TEUXgqA=;
	b=s88WWIed5p6L5JcEQ/6gDQ2ADsNQdVFa5zQ9DxTsSn8kHBjUfI8PG7QdHjl6o7h15GIiCP
	qlExyefE+anTl/jrQ6zkQiFTnGGZ0nIiZD4+gY0o6cV2YG5KIS0COsWq+nz9ZRq9UDuFIB
	brmGahG8dkRaJUjhtph6ut/Ysq66wGfjXvQIMLxX2HTjxSkziasXSjhIjY+le2eF2tfU0m
	9dN1LPFf2oNGIuU7Ju09/Sbup9npASkOAfM7KmkZNX98gyMbrGNZGqbQaJe4thK9UuEKmO
	KivqoQ8TpOLwc4w8ygDFG7f9B7Ty2lVS4egXittG/CD+tXnN01itv5K0mRUJrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1702303071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OtPxZyAIr0q83FqrgnW8CYSUeZdYcDZKkr11TEUXgqA=;
	b=Y1ZfO36DL0bvoLPgjRbH8hoQDThICl2d/0+e4QHrF8t71kuYefcKZhfxiEc+lYm+dpiDPK
	b53MOh73dLtA4LAA==
From: Nam Cao <namcao@linutronix.de>
To: stable@vger.kernel.org
Cc: jiajie.ho@starfivetech.com, palmer@rivosinc.com,
 conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Backport riscv kconfig for v6.6
Message-ID: <20231211145750.7bc2d378@namcao>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_055754_206563_EBAD7A45 
X-CRM114-Status: UNSURE (   4.42  )
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

Hi,

Please backport 78a03b9f8e6b ("riscv: Kconfig: Add select ARM_AMBA to
SOC_STARFIVE") to v6.6

Without this, it is not possible to configure the kernel with SPI drivers
for the Visionfive 2 board.

This one depends a1a5f2c88725 ("dmaengine: pl330: rename _start to prevent
build error"), which is already in stable.

It should be backported to v6.1 too, but it does not apply cleanly. So I
will send a patch for that.

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
