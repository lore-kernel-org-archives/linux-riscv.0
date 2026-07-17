Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D24C44520
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 12:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6o1neBbFUG85l8PjwxTthTzCv+rTg3NfYt1KEp+H0oI=; b=VwNtpcVjcEU7F7
	U54Wfa26RPsILslhanAwbBCeRmb/yMvTRxPQRSyrpbCI/Dka0Fu37iDD5IBHNoimQBVkaAblbYg+x
	e6xsDm0Re6BKR+m9zSZUfDAJB58a2GBOgdGn7dagB08/PnLoHd0F3jItXAfb5FPrKDNWLnnQLRMHy
	DCeRAYxvopaMncdZyueIWplnrOHLsT3Ul6ZbWsfFOF6AxP8T+JGXg2lUKX2Rt8Gw/2nUI17FC5M6I
	Gademt4LQ90kMtUCxloPO0e0Mw7CsbepIKS8n8BGQTWzDprgoEmHvebZoJnQkGQHBh09SHxRKU6Pc
	tfzuRa85pCXej+RXYusA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhXX-00000002GtN-4C8G;
	Fri, 17 Jul 2026 12:19:40 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhXV-00000002Grq-0H6E
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 12:19:38 +0000
Date: Fri, 17 Jul 2026 14:19:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784290774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lM8BsmGx2e4U/m5m213ARzuYYAh1Q1BgXaH2UM8+pnI=;
	b=mcuDIu0lIl+z6x7XlQn4hM5aMxBqKEoBU06XjP16Q9POKIKKCqA6AzOfqH71r1vuxqeX7S
	oM857s2UAwqbs6Eujir1uyFv7ue/dBT/hnk3Sdeblf/8RdrPDxWUUe4PqHnpfUzF/4LOKn
	bCZlEWZA9gVqViv94cgr+ftCyON70WlQDfhZmsz8fQVfx8OVAef4fXmihLyoM9gbm9j4BV
	Q+ZxvB3yeoGLOD64Z3g9wbx2PLxjD8PSord2AWQGL3F8osdCCiNG5mguIpKbdtrxcb/XZ4
	QeQVsyhlUoJu/F/eTGEyWvgoUmAeYsggfCcgqfkS7te6jbDTUL4Z53lDXE7upQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784290774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lM8BsmGx2e4U/m5m213ARzuYYAh1Q1BgXaH2UM8+pnI=;
	b=B3t0nMqoCM/kdOiGD4PKoNYSuB8FvMQjSCdp5rCRSyIfkkVWtfZ0mfzFiKK8cB/d8daD2m
	NCcYj7qQr+zz80DA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Thomas Gleixner <tglx@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH v3 3/5] riscv: compat_vdso: Introduce COMPAT_MARCH
 variable
Message-ID: <20260717141913-5c26b431-9f00-47a8-91ca-ff42f1c8bd7d@linutronix.de>
References: <cover.1784274927.git.namcao@linutronix.de>
 <adf98cc87ffffe0264523c1802b5a22e6047788f.1784274927.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <adf98cc87ffffe0264523c1802b5a22e6047788f.1784274927.git.namcao@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_051937_249893_B0D2F021 
X-CRM114-Status: UNSURE (   7.69  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 17, 2026 at 10:06:36AM +0200, Nam Cao wrote:
> The -march option is inside COMPAT_CC_FLAGS, making it difficult to exten=
d.
> =

> Introduce COMPAT_MARCH variable to allow extension. A follow-up commit
> will take advantage of this to add _zacas to -march.
> =

> Signed-off-by: Nam Cao <namcao@linutronix.de>

Reviewed-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>

> ---
>  arch/riscv/kernel/compat_vdso/Makefile | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
