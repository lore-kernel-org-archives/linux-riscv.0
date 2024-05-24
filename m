Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C2AC25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 17:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fqgG88mYc12H34KVYu+pGlDbbr8eyyOFDbOzylo72Vg=; b=NYjN/E92WJHZ5l
	0dbWEfSOv8NxNT1U2nOPefEZhZUgAo6Ry1ZgHOXdWLckHytFo72J0YfUu7s11zUITB+5H5S6gI0nD
	1Ua/QPn5/ou6g5OCvm/tXmE/DSkJxOBIygJDv6njJskGJF3whCAuwpB5Xjv/YzT3Mug9SmRw5sgbH
	hNuo3yVLohMesZ0YHPV6FyixWrTNL2HfA1zeqQV3OjQoRlmRmum9ccM01XBPgYowgNDby7bthZkyH
	/oDbUgWwSAoMWBqJd1KJSBjQpQrJuQqfjG0+GgCjoiEvQomTetz5iVIokpN0aGL9mXtrE6E2EAxJG
	z/8h2xK4xYmr4eozjoQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAYZ6-00000009TIZ-1hye;
	Fri, 24 May 2024 17:18:48 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAYZ1-00000009THk-3oQF
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 17:18:47 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1716571122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HIOG7CzhtT1xFZ8Eri8WfuwhBOo/lZKM9x6m+n5FoM4=;
	b=fNd06WnaQqijO8MrgjmXO86YXL43Ns2lxHWed536++ef4ILGB0MUiVPuHUPTriBe8HAFWw
	Uzwwb3/H5RV5UzrHOtH8meq5d98/mZhI9i+L467s9vEUC1xAniaU8xoGPNAPiQvQ+RSA15
	104vUOdanPnvMvG/TdC7cAFMpH7GAJtSpBsTjpZbGnQCkRFuac7AMq3srLXOViXNy+6mKC
	Wm3FpzqYw+/70WN5zyr+JpPDzD/GYFpTD3elPQIq8twJK+SjcjX8wfXDpjx8FzPkZ3aCBe
	r4oRTnyx8yUHBYqpAswRf02iyV9uwYfDXWVA9dolxtlDlQ35tGGE6719W02oDA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1716571122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HIOG7CzhtT1xFZ8Eri8WfuwhBOo/lZKM9x6m+n5FoM4=;
	b=OpA4dZDSXGtNkHfJ6+44/kl14RBmXu9GA06kjAjhzjVszqF7FoDTfreGYV1MF/Uu+29hWg
	z7eN33LKW/lUsdBw==
To: Guenter Roeck <linux@roeck-us.net>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor@kernel.org>, naresh.kamboju@linaro.org,
 linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org,
 regressions@lists.linux.dev, linux-riscv@lists.infradead.org,
 apatel@ventanamicro.com, anders.roxell@linaro.org,
 dan.carpenter@linaro.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: riscv: irq-riscv-imsic-early.c:52:9: error: too many arguments
 to function 'riscv_ipi_set_virq_range'
In-Reply-To: <ab42f444-b10c-4992-bc6a-83e269cfe9d0@roeck-us.net>
References: <20240515-zen-calculate-289cfb90cd65@spud>
 <mhng-10b71228-cf3e-42ca-9abf-5464b15093f1@palmer-ri-x1c9>
 <ab42f444-b10c-4992-bc6a-83e269cfe9d0@roeck-us.net>
Date: Fri, 24 May 2024 19:18:42 +0200
Message-ID: <875xv3dt71.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_101844_109440_901C175C 
X-CRM114-Status: UNSURE (   7.08  )
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

On Fri, May 24 2024 at 08:10, Guenter Roeck wrote:
> On Wed, May 15, 2024 at 10:05:59AM -0700, Palmer Dabbelt wrote:
>> as a conflict resolution, which IIUC should happen when Linus merges my next
>> PR.  So I'll try and remember to call that out.
>> 
>
> Unfortunately it looks like the conflict resolution did not happen,
> and mainline builds are now affected.

Fix is queued and goes to Linus tomorrow.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
