Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374A5C369AB
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 07:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tFx9bESIxRCLCJlTqJZ7sqAnDO4U6ik4lW65EJyzPsA=; b=4RhdTR1xKiJs6Z
	NBjOsQNKiH0+M6zCpWPwL3+hT+a1DR5GdqWXL/7XfKeGFvfqKwwu4uqLk/cEXVsV3AQxjJp8U5BOp
	Q25cPaSumoSWosjS3tKkDyqHhBTDMgKGLmjf+C4+oZ5oqOssBmreTSmr30QzT+9mIuxw7xEMFfZFa
	iwAxyt0CBXeZoF2wp8uohQRjQl8mH/pK8fowb1/qHpPXf1IxocgrdNL+yQmH1OL0eumaYlv6Hzgdf
	KLg0bpueE3faLWyET0SDpQ2Rr3y5n8gyooOUIRIlIUFLRJTcdk2iUnijr83da+3vlc1OeiFmQVJPA
	u4Mq6EegzZyfP2c3IS7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bAl-00000004tlY-1rY5;
	Tue, 15 Apr 2025 07:57:35 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4avr-00000004qKB-3ANC
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 07:42:14 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744702927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QDVMAx5MlARdC2LaXnq7udd+FMk5iGx9CQabNikH0l8=;
	b=C3Rmg2V2Bdl6Bfqk9/nK29BCqi0Xa3COFDiC7DSnlrM0d8SsxFo1j+qHnMHxFNAFnY3HMD
	WAWpoMMpGJEgccXjV6aC1fuYHYX9FELmSL8UBx+zOZ2SjrZUvf/sobNZvRk4E50Yrg/qIq
	MhKOT/Qem7E2LyiMQnE8KYgMi+gAj2RfDyKz4OmXtzkq/syV8bWuN9PEqbxDL7PuzlP8tl
	XlhaNpqalHuCOp+bYIAfeukrG/OMY7Cku11HCMfSxIURuytCuvW1cLCyVgTS8Bxo2qgNi3
	nKsAelmSqrkoef83iMMdG2zJ3EcjaKBawZy05hEK47/safInIGnJL7PUer+inQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744702927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QDVMAx5MlARdC2LaXnq7udd+FMk5iGx9CQabNikH0l8=;
	b=q/YHYOto9UJGHAXAN3OUEc/qILEJvP/XwRECgpUJRqc58CbVFkAb61e9M002EeZCNJd+YY
	7nVM1XZR3HcbdSBg==
To: Ryo Takakura <ryotkkr98@gmail.com>, alex@ghiti.fr,
 aou@eecs.berkeley.edu, bigeasy@linutronix.de, conor.dooley@microchip.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, pmladek@suse.com, samuel.holland@sifive.com,
 u.kleine-koenig@baylibre.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-serial@vger.kernel.org, stable@vger.kernel.org, Ryo Takakura
 <ryotkkr98@gmail.com>
Subject: Re: [PATCH v3] serial: sifive: lock port in startup()/shutdown()
 callbacks
In-Reply-To: <20250412001847.183221-1-ryotkkr98@gmail.com>
References: <20250412001847.183221-1-ryotkkr98@gmail.com>
Date: Tue, 15 Apr 2025 09:48:06 +0206
Message-ID: <84r01tooq9.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_004211_947730_C9F0AF70 
X-CRM114-Status: UNSURE (   5.64  )
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

On 2025-04-12, Ryo Takakura <ryotkkr98@gmail.com> wrote:
> startup()/shutdown() callbacks access SIFIVE_SERIAL_IE_OFFS.
> The register is also accessed from write() callback.
>
> If console were printing and startup()/shutdown() callback
> gets called, its access to the register could be overwritten.
>
> Add port->lock to startup()/shutdown() callbacks to make sure
> their access to SIFIVE_SERIAL_IE_OFFS is synchronized against
> write() callback.
>
> Fixes: 45c054d0815b ("tty: serial: add driver for the SiFive UART")
> Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
> Reviewed-by: Petr Mladek <pmladek@suse.com>

Reviewed-by: John Ogness <john.ogness@linutronix.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
