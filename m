Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C39AC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 14:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=anoxvqdai4Go2Gc6Q9pJoZvvnc00qeJhhmeeWUK7oWA=; b=J+Ncg5sGAHbCLx
	SMWsaT1oKr1hzb2Jw1Oxhzo7ORb5lC1fZW8KNGu82wKlOjELGGK375+19l9GKpGQ1qpaOmjF5ElsV
	/YCIYJ3lQa8epVQUXMYXOt5uviTBD+lk2BQeyh4r0wfqZTYG58H1J9VWPR7QG9cgGbMB5UcM6JUhV
	F9K94WuL6N3YcIU4jVagRBeAXGlaRhYl9I2zBRitkl4MJU8k3AdbHV32wnTTwdjPcR8TCJMQzHgWb
	ZxsCO5FMT2Tzf+xmbbPYZHhbZPFsOL4IvTBZYItiKZjnGDcS3pGYcRun7GX6aDSZa+k1jpWfW9xxx
	gzKYcpohSAjKj9NwFKFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCh1F-00583q-1H;
	Mon, 11 Dec 2023 14:12:26 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCh0q-0057x4-2g
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 14:12:22 +0000
Date: Mon, 11 Dec 2023 15:11:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1702303919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jZKIjBd21OWnGaJBiVOBN57bXhYz4xgeT/z9NbvImzs=;
	b=aqKeB+FIuovH58QJwNpR5zEZ0nfq4BxRJJZshJDFEW0lUoHNSJldnXl9gKcnvD0JwMsJa2
	rDVpKgsRA5FVdfg4ZsTmio8exgchy8EYcwzPCP4ByoOx/FYS0Vii2srPxmgtrxYjB8V2HN
	I9sC12MS3M1nKn2tTUjvbm9dQItpu4eooJexmkPl1uHGkq0pnQOuQC+vZUrKuIO9rDs5KJ
	kcAGcT6Z1huhwy4ZtMUswxlwPED7omMkTJ2gL9Ri6JVDozKGQkvlushfz5BPU4fgq9GqMe
	EV4m0AlK0m6tzC3dP8Z+OvuVxl4Yl4cJm5s78cK0Exp0v+2mVBd4zaABpC8EXQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1702303919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jZKIjBd21OWnGaJBiVOBN57bXhYz4xgeT/z9NbvImzs=;
	b=EYzIPVN3fD74DLanAmeKpYTZ7fMEQ22FjkrGo2fy9E24npcGG53tahRZlmShZJ51DbTTlW
	Elh5LyELGlEAWRAA==
From: Nam Cao <namcao@linutronix.de>
To: Andreas Schwab <schwab@suse.de>
Cc: stable@vger.kernel.org, jiajie.ho@starfivetech.com, palmer@rivosinc.com,
 conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: Backport riscv kconfig for v6.6
Message-ID: <20231211151158.18de6a99@namcao>
In-Reply-To: <mvmwmtkq18l.fsf@suse.de>
References: <20231211145750.7bc2d378@namcao>
	<mvmwmtkq18l.fsf@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_061203_127222_C1BB332D 
X-CRM114-Status: UNSURE (   5.67  )
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

On Mon, 11 Dec 2023 15:10:02 +0100 Andreas Schwab <schwab@suse.de> wrote:

> On Dez 11 2023, Nam Cao wrote:
> 
> > Without this, it is not possible to configure the kernel with SPI drivers
> > for the Visionfive 2 board.  
> 
> Is it?  There is nothing that stops you from just enabling it.

config SPI_PL022
	tristate "ARM AMBA PL022 SSP controller"
	depends on ARM_AMBA

The "depends on" stops me.

Best regards,
Nam


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
