Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1FDD609D7
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 18:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q/gJ2bez8UcytlCzvotBBxfp6eqErPYIIaS+G2RRDL8=; b=aivbaMQfxj3uYk
	GTi9XXPKXOcBHjmtLJhWswSaX/sifH8UwCz3l4eDCpn/PTo1tyCqBMEd1BZSzK56RNZ+od7zqMMJ7
	IY1szk7jsId2Yf18Mf/oZ2Rsj3hjjHlBtqc/sAMHoVnYZdhZ5KsiRkRRLf2hGSBNnkCsEhXZlJ6cS
	LFkhtNOuC32/BTHJVpt3wxNTrYzR57PRA3dZ5bleDn0x5zvzZ2EQ3KTj24rodIdWtUoJtISNI/y4A
	0e8/Eb8s+35kYJhcuAYDzRwMbs9hTDGp0vEustzLXNNwZJ+98j5ctCYJx8jtSJlEfgxnKcDP5WkEC
	0TFvZnHLZvIlhmF5fIqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZUv-00000005hYe-1KMb;
	Tue, 16 Dec 2025 18:10:09 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZUs-00000005hY6-1PnZ
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 18:10:07 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1765908600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8PVYAT6YP01uimSWNMG2q+oBPhttEN4zQ/vReBJ7tIs=;
	b=CSruAKQEfCs5KrO/heft+v7wwWWMASLf23oy60ONwwOUVzByvcFpvkkHm4sdz/edOFFsXH
	xZSqRZLDp0DH1gHLoca0Rcr0vE3gA2Nq0SR6Inp8vTs1mA3Oko+g9UHWHe6dq3WFZTkFfh
	ziz8h7yWIT5974JDU7rMKhKJhHpWpkYikk2/9Qc4ACGEsZ5Fg+4kGtHZo2O8u4lUnA+N3q
	oqzgTqoFuJmteV0mUpI4Zoi+ZAmiPSMmt0PXgjIFhd3OUcp6u1R5SLgT21ocBZ6Yv3Di6y
	uflXxbKgPM2DLAyo+ScXshffZHdcMZU+EzdcbUVOybgaRxFBcfBBHDLjg649uA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1765908600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8PVYAT6YP01uimSWNMG2q+oBPhttEN4zQ/vReBJ7tIs=;
	b=iiG4QPVycisAj9LnWsxhoOuAl4nSeUP3EurDMigicb8ZEM2HiFbx7YD2pnTfWNcQkhnjJm
	jt0zDfcuiyqKcaDQ==
To: Geert Uytterhoeven <geert+renesas@glider.be>, Anup Patel
 <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Yong-Xuan Wang <yongxuan.wang@sifive.com>, Cyan Yang
 <cyan.yang@sifive.com>, Nutty Liu <liujingqi@lanxincomputing.com>, Nick Hu
 <nick.hu@sifive.com>, Thierry Reding <treding@nvidia.com>, "Rafael J .
 Wysocki" <rafael@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Geert
 Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] irqchip/riscv-aplic: Pass context data to syscore
 callbacks
In-Reply-To: <d52051073ff90ea3fd023c9d15822e30f456c9d1.1765879470.git.geert+renesas@glider.be>
References: <d52051073ff90ea3fd023c9d15822e30f456c9d1.1765879470.git.geert+renesas@glider.be>
Date: Tue, 16 Dec 2025 19:09:58 +0100
Message-ID: <87o6nycn7t.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_101006_541842_F7273609 
X-CRM114-Status: UNSURE (   6.02  )
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

On Tue, Dec 16 2025 at 11:06, Geert Uytterhoeven wrote:
> Fix this by updating the driver for the syscore API changes in commit
> a97fbc3ee3e2a536 ("syscore: Pass context data to callbacks").
>
> Fixes: 1c546bb433618843 ("irqchip/riscv-aplic: Preserve APLIC states across suspend/resume")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for fixing this!

I folded it into the offending commit and force pushed the branch.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
