Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA03AC00A8F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 06:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cMXH4Xcl+lGW9JcuxTOKbnL85QGquS9RsX/V8tFfWuU=; b=xZD6ymLebN40H2
	PmGPc/fbBALFDSRFX8w//dOSlsAl/FFeRT+74XjM00aTSm/ar5EgILnYY3Kin5gWB4pKvgxmBId/6
	uUc4oSNDYIkVvx+4MT6vq7JWus1WaivL0SF1JlRyxEkzN8BHqbSf/pnLi5iWwSuE61WKLsoNnyQzf
	tkyy3NGNwcdULHTKW2bNurI62aIA20LV+iBa9Oli6w0ntumngvBTnApOONrnxfh5k6dhHSepMfxeJ
	QRj/NN+SLq1T2qBKK0lnyeppbf/OvlTELKOVJMG3lEvVOcczx1cE+Ny3jkzaK+swx25m+pCJaGKOC
	aCgzD/qmZSiKKS7khWHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvAkt-008xoH-1b;
	Tue, 24 Oct 2023 06:19:07 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvAkr-008xmQ-23
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 06:19:06 +0000
Date: Tue, 24 Oct 2023 08:18:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1698128335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oFscsjM+T6PwALwjNYUJz2BmZ8r/+Bj29Kd1auX4SPI=;
	b=BofWcEkm9n8F6KpQ6sAdF6/ozNjQXcIY6g7k8pOO1SmfCTbgaD+RQTm9RqAzCWUBbQuGV0
	un7vG2L0wYx237lB5f50LOol2XJGvmn0W3NpOQX00ayhQ4RslTJ4/9MtCvCEqF4upm+oh8
	EAF8B2vLHl6ukQcKc29Bux68SLbCPD5KDTM0Mm7F1yHPJyPu+1tDsrL6oys2qHY0/+jgqU
	HnFvB3W6znOKS6v6B2rT54+RkywOSAjyBW8BKE/ZVCa+GX/eOMOW5uDMjagGowbwZQf1Qa
	p9/SvlC+0Yi0A/roVjEEFhZRTrxL+EIJPBccM8cgxVhrBQ6fnJNlSw6ImMZebA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1698128335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oFscsjM+T6PwALwjNYUJz2BmZ8r/+Bj29Kd1auX4SPI=;
	b=/UoBr0b/57j7ff8wRdeBxkYeDv6oK9DKML3dMC7/hTKKEGwmFS0zuJEAMwtSWbVTaEQNh8
	1DV7irNanUNEV7DA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: "Schaffner, Tobias" <tobias.schaffner@siemens.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"minda.chen@starfivetech.com" <minda.chen@starfivetech.com>
Subject: Re: [PATCH RT 0/3] riscv: add PREEMPT_RT support
Message-ID: <20231024061852.7BzoCFwW@linutronix.de>
References: <20230510162406.1955-1-jszhang@kernel.org>
 <a37fc706-78cd-4721-9af3-aabb610f49b1@siemens.com>
 <ZTah9NOMbZkf6dfL@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZTah9NOMbZkf6dfL@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_231905_819615_4A32C656 
X-CRM114-Status: UNSURE (   6.81  )
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

On 2023-10-24 00:40:20 [+0800], Jisheng Zhang wrote:
> Hi Thomas, Sebastian
> 
> could you please review? Any comments are appreciated. or do you want a
> rebase on linux-6.5.y-rt?

Please resend on top of latest v6.6-RT. Lazy preempt is gone so only
PREEMPT_RT config switch remains from your three patch series. If you
have generic-entry then you could use the new PREEMPT_AUTO.

Are there any reports of this booting without warnings with LOCKDEP and
CONFIG_DEBUG_ATOMIC_SLEEP enabled? I remember there was something
earlier.

> Thanks

Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
